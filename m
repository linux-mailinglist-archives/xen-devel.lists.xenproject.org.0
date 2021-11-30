Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9FC4637D6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235213.408123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4VY-0007f9-GP; Tue, 30 Nov 2021 14:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235213.408123; Tue, 30 Nov 2021 14:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4VY-0007dA-D8; Tue, 30 Nov 2021 14:53:24 +0000
Received: by outflank-mailman (input) for mailman id 235213;
 Tue, 30 Nov 2021 14:53:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRDO=QR=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1ms4VX-00074e-4h
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:53:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4399c79d-51ed-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 15:53:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A65BB81A42;
 Tue, 30 Nov 2021 14:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC1EC53FC1;
 Tue, 30 Nov 2021 14:53:20 +0000 (UTC)
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
X-Inumbo-ID: 4399c79d-51ed-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638284001;
	bh=t0G2cgW1LPpprxJZ/0W2KP52yUnj9+CTZKIZjqqqsrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jEWQn4UtoqFbfDy31p4WWBSWgJvHkbJOLydnqpN6GvKqHzPP5n+56TKj1h4+Raqu9
	 cVgnQ9EOHXZZlBbcrjS8ZT8aT2TgNiTkCOaBOGSIqojDA/U9mG9aPhtmknvlsT9PaC
	 74QgcVBPq7VTXZzMCsS36DYNI/7WPk8MJuZFPUiG8v73m5z4u1x1O9BF4XjDoJg719
	 +yg3Oi/xz/k1TyhcAavY63L/2+reOdX6u1EsnqG5ZhI7HTIgdIZz5xkdzk/66O/605
	 3bnvS5Kz776rElS79yRuFsNrGYehbbTwAbYbUFtaT+XtAQCAQZAAi7ncGFKquYwg+r
	 1/Uh1+1s4GEtQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 4.14 02/14] xen/privcmd: make option visible in Kconfig
Date: Tue, 30 Nov 2021 09:53:03 -0500
Message-Id: <20211130145317.946676-2-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145317.946676-1-sashal@kernel.org>
References: <20211130145317.946676-1-sashal@kernel.org>
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
index 30187b86729bb..818e4809c2a54 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -218,9 +218,15 @@ config XEN_SCSI_BACKEND
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


