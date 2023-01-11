Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88918665A2A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 12:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475211.736801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZJo-0006Xn-JD; Wed, 11 Jan 2023 11:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475211.736801; Wed, 11 Jan 2023 11:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFZJo-0006Vk-Fl; Wed, 11 Jan 2023 11:30:56 +0000
Received: by outflank-mailman (input) for mailman id 475211;
 Wed, 11 Jan 2023 11:30:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bB9=5I=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1pFZJm-0006Ve-JF
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 11:30:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 680acd88-91a3-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 12:30:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81C1EB81B8D;
 Wed, 11 Jan 2023 11:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D688C433EF;
 Wed, 11 Jan 2023 11:30:50 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 680acd88-91a3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673436651;
	bh=WJ96hH6M2QWhqMqos8NlJvpLqVVBxtYsuEjUoVykxZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7a5KWZHBLMUkKm8d7N1mA+UILCUqbJnKRAWqBLYnqLFbEiClsPP+hZZV1xghrAa6
	 /mZHoqJZQ3wMqDA66QoIsvm5lc2i9xyw4j4Qa9qsBNa5/OJ4Pcg7bemhED9vtRGmtJ
	 c/TGi6+t/6rL26PggxIY0N2xBa4fplpGKMUGxUKo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 14/16] xen/xenbus: move to_xenbus_device() to use container_of_const()
Date: Wed, 11 Jan 2023 12:30:16 +0100
Message-Id: <20230111113018.459199-15-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111113018.459199-1-gregkh@linuxfoundation.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=gregkh@linuxfoundation.org; h=from:subject; bh=WJ96hH6M2QWhqMqos8NlJvpLqVVBxtYsuEjUoVykxZs=; b=owGbwMvMwCRo6H6F97bub03G02pJDMn75p5iDqjYGXvtfmJbfiGLYEh0rmbzkQfMxlmZT6a8f3xz mmVIRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAExEzINhnumZBRPTnvPn53v37j2tLX W4Ri/vPsM8/VuB8089evrezHar0ST1/HL+f+5XAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The driver core is changing to pass some pointers as const, so move
to_xenbus_device() to use container_of_const() to handle this change.

to_xenbus_device() now properly keeps the const-ness of the pointer passed
into it, while as before it could be lost.

Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/xen/xenbus.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index eaa932b99d8a..b31f77f9c50c 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -96,10 +96,7 @@ struct xenbus_device {
 	unsigned int spurious_threshold;
 };
 
-static inline struct xenbus_device *to_xenbus_device(struct device *dev)
-{
-	return container_of(dev, struct xenbus_device, dev);
-}
+#define to_xenbus_device(__dev)	container_of_const(__dev, struct xenbus_device, dev)
 
 struct xenbus_device_id
 {
-- 
2.39.0


