Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189FE2EB308
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 20:06:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62171.109929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwreT-0005vU-18; Tue, 05 Jan 2021 19:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62171.109929; Tue, 05 Jan 2021 19:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwreS-0005v5-UI; Tue, 05 Jan 2021 19:05:52 +0000
Received: by outflank-mailman (input) for mailman id 62171;
 Tue, 05 Jan 2021 19:05:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwreR-0005v0-TI
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 19:05:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c05a6b15-3cc9-495a-bcc4-30a589dab2f4;
 Tue, 05 Jan 2021 19:05:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 597E322D04;
 Tue,  5 Jan 2021 19:05:50 +0000 (UTC)
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
X-Inumbo-ID: c05a6b15-3cc9-495a-bcc4-30a589dab2f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609873550;
	bh=fikjhuChmZH9iH0tunznwz6zhLKEPb/ejQXwAbh5M94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JFgeQqRox7EwNHoNyAHaf2yg4CrAUGid+uJ8iHsOimOWDOaylih8KflN5FrBFUFRx
	 JJWBmmlINQVC3iwP6VqIKj+yVBHOQZhLD8+ewEnxF3k/EaTU/iXP9PvzZAIMNJ1RHH
	 92Sv2JT9kDG18dQHSCGoDdfdPe3hSNsg+f3b0vXxWC+S7+zKkZDroEMyb3ALc+o5hV
	 J57vv2P5DHVzl+CK3l8R7kEfs+pSC2qzn12ziJeTrZWvAh7lmNM3unuFJ30QQlnp+G
	 mq/SEMoH2vnfJ8RchodkVy8jyXC98+5zE6PFEnFS9DvTVO7aihgK1a5hbMN1fwsmLJ
	 EWet7ugVQeUmA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	iwj@xenproject.org,
	Andrew.Cooper3@citrix.com,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] xen/arm: do not read MVFR2 on arm32
Date: Tue,  5 Jan 2021 11:05:48 -0800
Message-Id: <20210105190548.13677-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s>

MVFR2 is not available on arm32. Don't try to read it. Make MVFR2 arm64
only.

Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/cpufeature.c        | 2 ++
 xen/include/asm-arm/cpufeature.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 1f6a85aafe..9e3377eae3 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -150,7 +150,9 @@ void identify_cpu(struct cpuinfo_arm *c)
 
         c->mvfr.bits[0] = READ_SYSREG(MVFR0_EL1);
         c->mvfr.bits[1] = READ_SYSREG(MVFR1_EL1);
+#ifdef CONFIG_ARM_64
         c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
+#endif
 }
 
 /*
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 6058744c18..fa20cb493a 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -272,7 +272,7 @@ struct cpuinfo_arm {
     } isa32;
 
     struct {
-        register_t bits[3];
+        register_t bits[2 + IS_ENABLED(CONFIG_ARM_64)];
     } mvfr;
 };
 
-- 
2.17.1


