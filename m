Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2948800C
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254710.436510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv4-0006tw-OD; Sat, 08 Jan 2022 00:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254710.436510; Sat, 08 Jan 2022 00:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zv4-0006r5-KH; Sat, 08 Jan 2022 00:49:18 +0000
Received: by outflank-mailman (input) for mailman id 254710;
 Sat, 08 Jan 2022 00:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zv2-0006ZD-Uu
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:49:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd98067b-701c-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 01:49:16 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E47EC62044;
 Sat,  8 Jan 2022 00:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0A2C36AED;
 Sat,  8 Jan 2022 00:49:13 +0000 (UTC)
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
X-Inumbo-ID: cd98067b-701c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641602954;
	bh=m/xs8jzbYy0KnjGA4YEq7wqnz5M74arMWbE5OnRY2a8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IqjZ2jB++HvGbybnwDVSteXiREAUHykf8HcStkfcW61SIEzZFfhY+l8iloW2hHbK8
	 6JlN6lRLPTiY7kjMpXf00cHWAah97cBU7SrZIp9b5ExEwXvlUf5ln4CRQ4XkQ7KEgY
	 Jl0ZnKG5jLUUQAxHMwtv9YGTjeCnhbOJFj73nJ0Fv9y30UlHC7xnZXhBZYFCyX2O5+
	 jvJl+7dJaVXNKCJwTAVkoMoumCcyJZRTzchP8Fqx0v4e1bwqK7xYRzdBa7gAl+L8To
	 vDNvDydccEbcVXlIv17pelZKuQpkgz3DbN0RisiIx235g1vmIB/HWRcBnfNnrt7rbP
	 d8/KnZceh1+fA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Bertrand.Marquis@arm.com,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/7] xen: introduce XENFEAT_xenstore_late_init
Date: Fri,  7 Jan 2022 16:49:06 -0800
Message-Id: <20220108004912.3820176-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Introduce a new feature flag to signal that xenstore will not be
immediately available at boot time. Instead, xenstore will become
available later, and a notification of xenstore readiness will be
signalled to the guest using the xenstore event channel.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/arm/include/asm/domain.h | 2 ++
 xen/common/kernel.c               | 2 ++
 xen/include/public/features.h     | 6 ++++++
 3 files changed, 10 insertions(+)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 9b3647587a..e5ae57cd09 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -89,6 +89,8 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+    /* Is this guest a dom0less domain? */
+    bool is_dom0less;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index e119e5401f..c00ea67e5f 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -550,6 +550,8 @@ DO(xen_version)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             if ( is_hardware_domain(d) )
                 fi.submap |= 1U << XENFEAT_dom0;
 #ifdef CONFIG_ARM
+            if ( d->arch.is_dom0less )
+                fi.submap |= (1U << XENFEAT_xenstore_late_init);
             fi.submap |= (1U << XENFEAT_ARM_SMCCC_supported);
 #endif
 #ifdef CONFIG_X86
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 9ee2f760ef..18f32b1a98 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -128,6 +128,12 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
 
+/*
+ * The xenstore interface should be initialized only after receiving a
+ * xenstore event channel notification.
+ */
+#define XENFEAT_xenstore_late_init 18
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.25.1


