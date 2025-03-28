Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7548A7493D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 12:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930517.1333135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7xb-0004gQ-0S; Fri, 28 Mar 2025 11:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930517.1333135; Fri, 28 Mar 2025 11:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7xa-0004ey-TW; Fri, 28 Mar 2025 11:33:14 +0000
Received: by outflank-mailman (input) for mailman id 930517;
 Fri, 28 Mar 2025 11:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bqk=WP=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1ty7xZ-0004eq-Rx
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 11:33:13 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bcb9b7e-0bc8-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 12:33:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CB30F614B5;
 Fri, 28 Mar 2025 11:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54647C4CEE4;
 Fri, 28 Mar 2025 11:33:05 +0000 (UTC)
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
X-Inumbo-ID: 6bcb9b7e-0bc8-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743161586;
	bh=ZmVcFblvwDvGIiJOpIyvSRxBhBv6ZjB/aFH3w9ChoI0=;
	h=From:To:Cc:Subject:Date:From;
	b=GxxmfSb8MD0gOjSU0y3T8PPq9+jCECYr3XYYEvYClD2W3NQA41wAZ3A9Eeuh9YxSh
	 OqtLNjWrXm0qgHDTWxKZXqd6On9VhoOouCQMDG8k+VaZtopERdy1dnk/JbE7nD1fGH
	 NJLzjhyeMtpN1KZyZ0A7CFm7at3gHugKw3LpxybYCLDcWPh9HJAf4QrZkMBwLdLfiF
	 wl0sqODTcCmt5FMMcuwz68XTwk7o1lX8w/vXl3lmbJuRKtjkvCE3OImmBpYymiz/G9
	 6JiHgzPvsh/J7TGfI9KlgdpRXlS3GioTCRniBV0ouxN3OAfq6RSDNtUCgn4qDKLGZK
	 dLeyyKNISOS7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] xenbus: add module description
Date: Fri, 28 Mar 2025 12:32:59 +0100
Message-Id: <20250328113302.2632353-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Modules without a description now cause a warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xenbus/xenbus_probe_frontend.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: change the description as suggested by Jürgen
---
 drivers/xen/xenbus/xenbus_probe_frontend.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index fcb335bb7b18..6d1819269cbe 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -513,4 +513,5 @@ static int __init boot_wait_for_devices(void)
 late_initcall(boot_wait_for_devices);
 #endif
 
+MODULE_DESCRIPTION("Xen PV-device frontend support");
 MODULE_LICENSE("GPL");
-- 
2.39.5


