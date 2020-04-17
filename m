Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFF1AE181
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 17:51:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPTG3-0007Wi-Sm; Fri, 17 Apr 2020 15:50:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPTG1-0007WZ-WD
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 15:50:22 +0000
X-Inumbo-ID: 1f61c945-80c3-11ea-8d2d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f61c945-80c3-11ea-8d2d-12813bfff9fa;
 Fri, 17 Apr 2020 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587138612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZhK0+BzJnp1VoPrHaLr5cGNVpfHqgyvx1ITJ+8zW0CY=;
 b=OCq2KqcwQhkfBU0cDmGVB0GA+B51j0jHk2AAGtCru15GqK6R6V3ET5cI
 kpoSzCd7pMlZHvu+XV6mEMeDXmzUcRdvNdD7ZYMCisHAfwz2/vUiIcEuW
 v5QZqGuDMqUGr1hTRISJV2DNWTejoDNJwCrmCCEn+oqyuPEBUyIJ7M75t g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: W60PJzhwI65JY1GYUh57Ly621HUTbcLiEz5oy0VTNXg7PnHPDHnYNirQiboUboOIulASbJDdr1
 poaZgku4gp0ROTF6jflE5I2WFFCLUwM0Ya2F4PWcxEXzKi4y+zYd1smgUspOHsm8J95tdeSzlp
 +OKmDFAywofaNFoW08QuQFuap1MD0xHI8w7Ovt3Nyi32fFbRBZOBNswxmR3iVUdI/bbXFjPUQW
 uU+YPouzi5QerAjeF09mIejvZPFIUMO+zrzu6EmUG3W+qmJBDCJqDEy+RGjkDI+W0TUnAwD2oY
 0pQ=
X-SBRS: 2.7
X-MesageID: 16168814
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16168814"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/3] x86/pv: Short-circuit is_pv_{32,
 64}bit_domain() in !CONFIG_PV32 builds
Date: Fri, 17 Apr 2020 16:50:03 +0100
Message-ID: <20200417155004.16806-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200417155004.16806-1-andrew.cooper3@citrix.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... and move arch.is_32bit_pv into the pv union while at it.

Bloat-o-meter reports the following net savings with some notable differences
highlighted:

  add/remove: 4/6 grow/shrink: 5/76 up/down: 1955/-18792 (-16837)
  Function                                     old     new   delta
  ...
  pv_vcpu_initialise                           411     158    -253
  guest_cpuid                                 1837    1584    -253
  pv_hypercall                                 579     297    -282
  check_descriptor                             427     130    -297
  _get_page_type                              5915    5202    -713
  arch_get_info_guest                         2225    1195   -1030
  context_switch                              3831    2635   -1196
  dom0_construct_pv                          10284    8939   -1345
  arch_set_info_guest                         5564    3267   -2297
  Total: Before=3079563, After=3062726, chg -0.55%

In principle, DOMAIN_is_32bit_pv should be based on CONFIG_PV32, but the
assembly code is going to need further untangling before that becomes easy to
do.  For now, use CONFIG_PV as missed accidentally by c/s ec651bd2460 "x86:
make entry point code build when !CONFIG_PV".

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domctl.c             |  4 ++--
 xen/arch/x86/pv/domain.c          |  6 +++---
 xen/arch/x86/pv/hypercall.c       |  2 ++
 xen/arch/x86/x86_64/asm-offsets.c |  4 +++-
 xen/include/asm-x86/domain.h      |  4 ++--
 xen/include/xen/sched.h           | 15 +++++++++++++--
 6 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index add70126b9..3822dd7fd1 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -576,8 +576,8 @@ long arch_do_domctl(
             ret = -EOPNOTSUPP;
         else if ( is_pv_domain(d) )
         {
-            if ( ((domctl->u.address_size.size == 64) && !d->arch.is_32bit_pv) ||
-                 ((domctl->u.address_size.size == 32) && d->arch.is_32bit_pv) )
+            if ( ((domctl->u.address_size.size == 64) && !d->arch.pv.is_32bit) ||
+                 ((domctl->u.address_size.size == 32) && d->arch.pv.is_32bit) )
                 ret = 0;
             else if ( domctl->u.address_size.size == 32 )
                 ret = switch_compat(d);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 47a0db082f..e0977bfbd7 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -215,7 +215,7 @@ int switch_compat(struct domain *d)
         return 0;
 
     d->arch.has_32bit_shinfo = 1;
-    d->arch.is_32bit_pv = 1;
+    d->arch.pv.is_32bit = 1;
 
     for_each_vcpu( d, v )
     {
@@ -235,7 +235,7 @@ int switch_compat(struct domain *d)
     return 0;
 
  undo_and_fail:
-    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
+    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;
     for_each_vcpu( d, v )
     {
         free_compat_arg_xlat(v);
@@ -358,7 +358,7 @@ int pv_domain_initialise(struct domain *d)
     d->arch.ctxt_switch = &pv_csw;
 
     /* 64-bit PV guest by default. */
-    d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
+    d->arch.pv.is_32bit = d->arch.has_32bit_shinfo = 0;
 
     d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
 
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 17ddf9ea1f..32d90a543f 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -302,6 +302,7 @@ void pv_ring3_init_hypercall_page(void *p)
     }
 }
 
+#ifdef CONFIG_PV32
 void pv_ring1_init_hypercall_page(void *p)
 {
     unsigned int i;
@@ -329,6 +330,7 @@ void pv_ring1_init_hypercall_page(void *p)
         *(u8  *)(p+ 7) = 0xc3;    /* ret */
     }
 }
+#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index 500df7a3e7..9f66a69be7 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -98,8 +98,10 @@ void __dummy__(void)
     OFFSET(VCPU_nsvm_hap_enabled, struct vcpu, arch.hvm.nvcpu.u.nsvm.ns_hap_enabled);
     BLANK();
 
-    OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.is_32bit_pv);
+#ifdef CONFIG_PV
+    OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
     BLANK();
+#endif
 
     OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
     OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 4192c636b1..ae155d6522 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -254,6 +254,8 @@ struct pv_domain
 
     atomic_t nr_l4_pages;
 
+    /* Is a 32-bit PV guest? */
+    bool is_32bit;
     /* XPTI active? */
     bool xpti;
     /* Use PCID feature? */
@@ -333,8 +335,6 @@ struct arch_domain
     /* NB. protected by d->event_lock and by irq_desc[irq].lock */
     struct radix_tree_root irq_pirq;
 
-    /* Is a 32-bit PV (non-HVM) guest? */
-    bool_t is_32bit_pv;
     /* Is shared-info page in 32-bit format? */
     bool_t has_32bit_shinfo;
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 195e7ee583..6101761d25 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -985,7 +985,11 @@ static always_inline bool is_pv_vcpu(const struct vcpu *v)
 #ifdef CONFIG_COMPAT
 static always_inline bool is_pv_32bit_domain(const struct domain *d)
 {
-    return is_pv_domain(d) && d->arch.is_32bit_pv;
+#ifdef CONFIG_PV32
+    return is_pv_domain(d) && d->arch.pv.is_32bit;
+#else
+    return false;
+#endif
 }
 
 static always_inline bool is_pv_32bit_vcpu(const struct vcpu *v)
@@ -995,7 +999,14 @@ static always_inline bool is_pv_32bit_vcpu(const struct vcpu *v)
 
 static always_inline bool is_pv_64bit_domain(const struct domain *d)
 {
-    return is_pv_domain(d) && !d->arch.is_32bit_pv;
+    if ( !is_pv_domain(d) )
+        return false;
+
+#ifdef CONFIG_PV32
+    return !d->arch.pv.is_32bit;
+#else
+    return true;
+#endif
 }
 
 static always_inline bool is_pv_64bit_vcpu(const struct vcpu *v)
-- 
2.11.0


