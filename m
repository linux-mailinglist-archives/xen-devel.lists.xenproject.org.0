Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30846395B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 16:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235253.408211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4j0-00056W-LR; Tue, 30 Nov 2021 15:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235253.408211; Tue, 30 Nov 2021 15:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4j0-00054e-Hi; Tue, 30 Nov 2021 15:07:18 +0000
Received: by outflank-mailman (input) for mailman id 235253;
 Tue, 30 Nov 2021 15:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRDO=QR=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1ms4iy-00054I-SX
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 15:07:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3361e70d-51ef-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 16:07:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 86B3DCE1A4E;
 Tue, 30 Nov 2021 14:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4589DC53FC1;
 Tue, 30 Nov 2021 14:47:59 +0000 (UTC)
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
X-Inumbo-ID: 3361e70d-51ef-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638283680;
	bh=z1z08V6GyRqJF14EjuoW9FWHbAnULnnl4fT0ZA7WNhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qs8Bf3eC02djVBcLGLWBeWaVIa6xv9oge/GXQKpKyENio+5tZZVKPl/ecyB/oB2Eq
	 tNLP1HYmc0jNvg896xnvScaQY3gl2CCEhYwywnPxua97be647bfm8chcD78A9AN/7x
	 5BydrwT2jo2L1sZMV6A7BrghxfU6ZTdrmi8q0Kf1fhmrTN/vEtZcACjdDiDXwA98z2
	 vu7F/IF1GABm/vh2aORT+5MfkHpDKP3GQJ14M3eE3XxcoW+eEIfkK+U9yfstyPpyBb
	 iCy0DFQzUsbsw3x5BiuOeUJpL1+tnZO3852VKiOJAjJNbq8E4A/9vmPc656S2TrYXz
	 mvsRegf9UtJMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.15 16/68] xen/privcmd: make option visible in Kconfig
Date: Tue, 30 Nov 2021 09:46:12 -0500
Message-Id: <20211130144707.944580-16-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
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
index 1b2c3aca6887c..dba66348dd2ff 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -235,9 +235,15 @@ config XEN_SCSI_BACKEND
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
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-- 
2.33.0


