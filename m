Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F4946395D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 16:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235254.408216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4j0-0005D7-U7; Tue, 30 Nov 2021 15:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235254.408216; Tue, 30 Nov 2021 15:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4j0-00056Z-Ps; Tue, 30 Nov 2021 15:07:18 +0000
Received: by outflank-mailman (input) for mailman id 235254;
 Tue, 30 Nov 2021 15:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRDO=QR=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1ms4iz-00054S-Ck
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 15:07:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3364460f-51ef-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 16:07:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 04BF7CE1A4B;
 Tue, 30 Nov 2021 14:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8BAC53FD0;
 Tue, 30 Nov 2021 14:51:45 +0000 (UTC)
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
X-Inumbo-ID: 3364460f-51ef-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638283906;
	bh=XAjwUAiM/j8BKJZ3MPSJmE9O/lcstYIzLJvobanl0m4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ewx6RN0gxrmQeqNLVGyYJLC0hrzXkdHRUE37iBemJboFNwbadRv7YVr+ipy+IwVAB
	 PE0XVRVAIDmySM4q//8c46X8dO36NntjUptjl9oltYz8UoqVkdxrhQYY92WelHjyiS
	 qyZmZBJvcka0P4/ZXeV9kc/w/uZka5gKUl2DajcLD5Wpl2nuGXxy3JKTxSYfS4jyd2
	 Il0LfBV7F/lZJ6ejwOWKIkRBcsEiIUVXLNyPRdhjs8cLnGokRNod2Lqi7L+OLeIoqP
	 SLWH/7kFcjh7lzqwF1oWSQvuJE8GfPSaGjqDuEZpF4Z2uHpdBt+TLG+uEigq80VG8E
	 QrbceAUStiIYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.10 37/43] xen: flag pvcalls-front to be not essential for system boot
Date: Tue, 30 Nov 2021 09:50:14 -0500
Message-Id: <20211130145022.945517-37-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 03e143b2acebe23c893f22ebed9abc0fe2a7f27e ]

The Xen pvcalls device is not essential for booting. Set the respective
flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20211022064800.14978-5-jgross@suse.com
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/pvcalls-front.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 7984645b59563..3c9ae156b597f 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -1275,6 +1275,7 @@ static struct xenbus_driver pvcalls_front_driver = {
 	.probe = pvcalls_front_probe,
 	.remove = pvcalls_front_remove,
 	.otherend_changed = pvcalls_front_changed,
+	.not_essential = true,
 };
 
 static int __init pvcalls_frontend_init(void)
-- 
2.33.0


