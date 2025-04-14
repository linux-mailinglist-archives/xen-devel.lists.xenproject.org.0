Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F4A88204
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950203.1346588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Js3-00070P-2j; Mon, 14 Apr 2025 13:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950203.1346588; Mon, 14 Apr 2025 13:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Js2-0006xi-W8; Mon, 14 Apr 2025 13:29:06 +0000
Received: by outflank-mailman (input) for mailman id 950203;
 Mon, 14 Apr 2025 13:29:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SLdQ=XA=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1u4Js1-0006i9-Ho
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:29:05 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e5531a6-1934-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 15:29:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E24149E69;
 Mon, 14 Apr 2025 13:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A75BC4CEE2;
 Mon, 14 Apr 2025 13:29:01 +0000 (UTC)
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
X-Inumbo-ID: 6e5531a6-1934-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637342;
	bh=l/yHk582AK4bFUjbv7xQMGDY1aE4V/qkqvcLDCRbGaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KrBrHki09t/XeHMKDHJ0dbkexa1w1WT2syR/TOaF/70CoSpZjA7Mv4wlGkRXHPw/Q
	 pEgrQAky9eOe9zFUFCtVUyjsm9HE3kHLR4FKMe8w+2vb1Wm4X9Q9yNy/rCdzj8V7yx
	 1AiwbT1sonXbCF8zz5AoWKNxarfsPcd3oUPimbuujyA4wr5fRm632mWxoq84fz8kWq
	 CMS1YZm5Y9APOKyTTncx7WnkkemMZ5+TBolTWyp+9kRqy0BjTdUcHAC5X7edPWCi81
	 6arHjKOBlg2HwSDl4sqKFUEuyQ46uKoIPE+uFhSU2dDc3kEae7E7hktdgT5WL4YKx4
	 Mzu8ixil5MmYw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 6.12 06/30] xen: Change xen-acpi-processor dom0 dependency
Date: Mon, 14 Apr 2025 09:28:23 -0400
Message-Id: <20250414132848.679855-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132848.679855-1-sashal@kernel.org>
References: <20250414132848.679855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.23
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

[ Upstream commit 0f2946bb172632e122d4033e0b03f85230a29510 ]

xen-acpi-processor functions under a PVH dom0 with only a
xen_initial_domain() runtime check.  Change the Kconfig dependency from
PV dom0 to generic dom0 to reflect that.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Tested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Message-ID: <20250331172913.51240-1-jason.andryuk@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index f7d6f47971fdf..24f485827e039 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -278,7 +278,7 @@ config XEN_PRIVCMD_EVENTFD
 
 config XEN_ACPI_PROCESSOR
 	tristate "Xen ACPI processor"
-	depends on XEN && XEN_PV_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
+	depends on XEN && XEN_DOM0 && X86 && ACPI_PROCESSOR && CPU_FREQ
 	default m
 	help
 	  This ACPI processor uploads Power Management information to the Xen
-- 
2.39.5


