Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900A4637F3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:54:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235220.408146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4WG-0000Gz-34; Tue, 30 Nov 2021 14:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235220.408146; Tue, 30 Nov 2021 14:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4WF-0000DM-Vk; Tue, 30 Nov 2021 14:54:07 +0000
Received: by outflank-mailman (input) for mailman id 235220;
 Tue, 30 Nov 2021 14:54:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRDO=QR=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1ms4WD-0007R0-VJ
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:54:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d14c251-51ed-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 15:54:05 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F817B81A46;
 Tue, 30 Nov 2021 14:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033AAC53FC1;
 Tue, 30 Nov 2021 14:54:03 +0000 (UTC)
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
X-Inumbo-ID: 5d14c251-51ed-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638284044;
	bh=a3uz0IJyj8SniB2opKJ04Vx2hKXu1OLTWs+GDsbDHmA=;
	h=From:To:Cc:Subject:Date:From;
	b=ouMuOhfX05mFao2bqxElSiFk/QVZb138iHstl8qNcYfEX9VhczJjybHIoN2BrJVaS
	 J76iSQHz88OCPWcmNGi4gqSEtuhaWgRm9QOBcMcGfZql0Cy0zAvBdvo26kbzcxggf8
	 Fepi7SDqJOMGCuxInIcziW52MtlqCyHZjwOjA80bxEM7AZV05cbSuG7FHInK8Xv7AV
	 ELU9ZJ/Vq76yssNtB1eztWJSTutg4dIxcWAHa5ehrc3W4UhgQpqxWaPzmiISamO/FD
	 6BlQRt+q5cQdl4GJ1P0zaTOvu1h3nTDysTknPKSuoB+7r11ASnbLnkiD7YkvncsQIm
	 4B31JXFFnk4aQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 4.4 1/9] xen/privcmd: make option visible in Kconfig
Date: Tue, 30 Nov 2021 09:53:54 -0500
Message-Id: <20211130145402.947049-1-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 897919ad8b42eb8222553838ab82414a924694aa ]

This configuration option provides a misc device as an API to userspace.
Make this API usable without having to select the module as a transitive
dependency.

This also fixes an issue where localyesconfig would select
CONFIG_XEN_PRIVCMD=m because it was not visible and defaulted to
building as module.

[boris: clarified help message per Jan's suggestion]

Based-on-patch-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/20211116143323.18866-1-jgross@suse.com
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 3a14948269b1e..59f862350a6ec 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -199,9 +199,15 @@ config XEN_SCSI_BACKEND
 	  if guests need generic access to SCSI devices.
 
 config XEN_PRIVCMD
-	tristate
+	tristate "Xen hypercall passthrough driver"
 	depends on XEN
 	default m
+	help
+	  The hypercall passthrough driver allows privileged user programs to
+	  perform Xen hypercalls. This driver is normally required for systems
+	  running as Dom0 to perform privileged operations, but in some
+	  disaggregated Xen setups this driver might be needed for other
+	  domains, too.
 
 config XEN_STUB
 	bool "Xen stub drivers"
-- 
2.33.0


