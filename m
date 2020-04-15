Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F21A900F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSG-0001Cy-7R; Wed, 15 Apr 2020 01:03:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSF-0001Cn-En
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:03 +0000
X-Inumbo-ID: d8bd8db2-7eb4-11ea-83d8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8bd8db2-7eb4-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 01:02:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD1A320774;
 Wed, 15 Apr 2020 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912578;
 bh=o7ggJLBOOkXOXw9bb9MmuF9lECpxcldnKeYW5Qgwn6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D9YZe7/B+m7worXC3EBZu5bVhXwDQiuOE6IJ326Nk1HGMg1iw7B3cIxEd3//nx9Jv
 JSQBlpy9F9ZWEcPIvsp3U64X/H5fbLJGXzdAv2n2AZmhWaw19whIXdSADoH0BgZsKB
 fe/1q/a4nO67fAmrt2kHj/86wQSLpsP01CIeWtHQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 02/12] xen/arm: introduce arch_xen_dom_flags and direct_map
Date: Tue, 14 Apr 2020 18:02:45 -0700
Message-Id: <20200415010255.10081-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, julien@xen.org, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, jbeulich@suse.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Introduce a new field in struct xen_dom_flags to store arch-specific
flags.

Add an ARM-specific flag to specify that the domain should be directly
mapped (guest physical addresses == physical addresses).

Also, add a direct_map flag under struct arch_domain and use it to
implement is_domain_direct_mapped.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/arm/domain.c        | 1 +
 xen/arch/arm/domain_build.c  | 1 +
 xen/arch/arm/setup.c         | 2 +-
 xen/include/asm-arm/domain.h | 9 ++++++++-
 xen/include/asm-x86/domain.h | 2 ++
 xen/include/xen/domain.h     | 1 +
 6 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index b906a38b6b..59eae36de7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -682,6 +682,7 @@ int arch_domain_create(struct domain *d,
         return 0;
 
     ASSERT(config != NULL);
+    d->arch.direct_map = flags != NULL ? flags->arch.is_direct_map : false;
 
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 20e62a9fc4..2ec7453aa3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2527,6 +2527,7 @@ int __init construct_dom0(struct domain *d)
 
     iommu_hwdom_init(d);
 
+    d->arch.direct_map = true;
     d->max_pages = ~0U;
 
     kinfo.unassigned_mem = dom0_mem;
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 9ccb3f7385..5434548e7b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -787,7 +787,7 @@ void __init start_xen(unsigned long boot_phys_offset,
         .max_maptrack_frames = -1,
     };
     int rc;
-    struct xen_dom_flags flags = { true };
+    struct xen_dom_flags flags = { true, .arch.is_direct_map = true };
 
     dcache_line_bytes = read_dcache_line_bytes();
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index d39477a939..7a498921bf 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -32,7 +32,7 @@ enum domain_type {
 #endif
 
 /* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) ((d) == hardware_domain)
+#define is_domain_direct_mapped(d) ((d)->arch.direct_map != false)
 
 struct vtimer {
     struct vcpu *v;
@@ -98,8 +98,15 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+    bool direct_map;
 }  __cacheline_aligned;
 
+struct arch_xen_dom_flags
+{
+    bool is_direct_map;
+};
+
 struct arch_vcpu
 {
     struct {
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 105adf96eb..52199ed5b9 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -418,6 +418,8 @@ struct arch_domain
     uint32_t emulation_flags;
 } __cacheline_aligned;
 
+struct arch_xen_dom_flags {};
+
 #ifdef CONFIG_HVM
 #define X86_EMU_LAPIC    XEN_X86_EMU_LAPIC
 #define X86_EMU_HPET     XEN_X86_EMU_HPET
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 4423e34500..7227e6ca98 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -65,6 +65,7 @@ void unmap_vcpu_info(struct vcpu *v);
 
 struct xen_dom_flags {
     bool is_priv;
+    struct arch_xen_dom_flags arch;
 };
 
 int arch_domain_create(struct domain *d,
-- 
2.17.1


