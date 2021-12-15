Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4551476592
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 23:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247618.427005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxceg-0005ue-N1; Wed, 15 Dec 2021 22:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247618.427005; Wed, 15 Dec 2021 22:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxceg-0005qs-Hj; Wed, 15 Dec 2021 22:21:46 +0000
Received: by outflank-mailman (input) for mailman id 247618;
 Wed, 15 Dec 2021 22:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTfI=RA=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxcee-0005ZJ-SV
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 22:21:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6126f12c-5df5-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 23:21:43 +0100 (CET)
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
X-Inumbo-ID: 6126f12c-5df5-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639606903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c3nwmG65CWTnQUe9tR5dWZEN9Clal0P82PcG0VxhhM8=;
  b=XMct5QXU6v3nLwcMmXZEsJ00/YnwGaeLFfDcrTtg6kO+4NEf1H1V+nsB
   QY1yKu7e7kDyYQxX3RNFDifugS9Wi/7dwTvxRWp0FVp0TU/fX/ZS+ifvE
   Isb4MsVIVWKzkWjWrK310EVjDsloCGDc727MyXFIy9FLnoH3+ws1hMhKv
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TG0n8gseO5urC0LOd2LjCDg+z6mA+gozGQQsqlgUe7rePI4OdEoTy4053vuUdDrZxSRmtZtICC
 I/5otxeUTpK4RVC2ZY7UZ2Wg19KtQpRbYFFfLivoHFoZ0lwhhnlejj5DWIzM9t8Nvkv2pIdjpC
 V2gtmZ8qgD3empa2k9NiGfU3i5EEOTRqQm9JSp0kNqgs5qRISuOhmYoR8/SSx885PnMgJRDIX7
 FZZSuNWO/kGHNId3iDPdETdsjLiTWPIlfjiP2LFuYY1Iz0q8mH6MsBYaaJFGtQ0iCcUR95XkEk
 RzD8hOSrU/wYEt13xfs9Si6N
X-SBRS: 5.1
X-MesageID: 60126719
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h2QDza1llxiymrqL0vbD5R52kn2cJEfYwER7XKvMYLTBsI5bp2MOy
 GMZWmnVPPreMWb0co0nO4+0pktX7JLRn9U1QQpupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn970Es5wrNh2eaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhof1a8
 MtBsLWKUCwRHrCPgNk0bwNXOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3pkUQ6mHN
 qL1bxJXY0niPDZrOG4ON5QYreKsiUvdTABx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaliAxcOJOH+gT0him8orJoB6kL1QeQRcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL1D2BLwQKChRqlEGp/ZgPb1
 JTjs5LBhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu2AjdRw2YpteIWSBj
 KrvVeV5vsU70JyCN/AfXm5MI55ykfiI+SrNCJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlDu7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLejP3KJqNFLdjjn7xETXPjLliCeTcbbSiIOJY3rI6W5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:U/F/Y62kDMbbDxTYFliKuQqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.88,209,1635220800"; 
   d="scan'208";a="60126719"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/4] x86/cpuid: Split dom0 handling out of init_domain_cpuid_policy()
Date: Wed, 15 Dec 2021 22:21:12 +0000
Message-ID: <20211215222115.6829-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211215222115.6829-1-andrew.cooper3@citrix.com>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

To implement dom0-cpuid= support, the special cases would need extending.
However there is already a problem with late hwdom where the special cases
override toolstack settings, which is unintended and poor behaviour.

Introduce a new init_dom0_cpuid_policy() for the purpose, moving the ITSC and
ARCH_CAPS logic.  The is_hardware_domain() can be dropped, and for now there
is no need to rerun recalculate_cpuid_policy(); this is a relatively expensive
operation, and will become more-so over time.

Rearrange the logic in create_dom0() to make room for a call to
init_dom0_cpuid_policy().  The AMX plans for having variable sized XSAVE
states require that modifications to the policy happen before vCPUs are
created.

Additionally, factor out domid into a variable so we can be slightly more
correct in the case of a failure, and also print the error from
domain_create().  This will at least help distinguish -EINVAL from -ENOMEM.

No practical change in behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New

It is slightly weird now having CPUID split into two helpers, while the MSR
side of things remains as a special case.  It doesn't actually matter right
now, and it is going to have to change anyway in due course, so I've decided
to go with the simple option for now.
---
 xen/arch/x86/cpuid.c             | 25 +++++++++++++++----------
 xen/arch/x86/include/asm/cpuid.h |  3 +++
 xen/arch/x86/setup.c             | 15 +++++++++++----
 3 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 151944f65702..f63f5efc17f5 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -727,23 +727,28 @@ int init_domain_cpuid_policy(struct domain *d)
     if ( !p )
         return -ENOMEM;
 
-    /* The hardware domain can't migrate.  Give it ITSC if available. */
-    if ( is_hardware_domain(d) )
-        p->extd.itsc = cpu_has_itsc;
+    d->arch.cpuid = p;
+
+    recalculate_cpuid_policy(d);
+
+    return 0;
+}
+
+void __init init_dom0_cpuid_policy(struct domain *d)
+{
+    struct cpuid_policy *p = d->arch.cpuid;
+
+    /* dom0 can't migrate.  Give it ITSC if available. */
+    if ( cpu_has_itsc )
+        p->extd.itsc = true;
 
     /*
      * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
      * so dom0 can turn off workarounds as appropriate.  Temporary, until the
      * domain policy logic gains a better understanding of MSRs.
      */
-    if ( is_hardware_domain(d) && cpu_has_arch_caps )
+    if ( cpu_has_arch_caps )
         p->feat.arch_caps = true;
-
-    d->arch.cpuid = p;
-
-    recalculate_cpuid_policy(d);
-
-    return 0;
 }
 
 void guest_cpuid(const struct vcpu *v, uint32_t leaf,
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index 46904061d0ef..9c3637549a10 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -59,6 +59,9 @@ bool recheck_cpu_features(unsigned int cpu);
 /* Allocate and initialise a CPUID policy suitable for the domain. */
 int init_domain_cpuid_policy(struct domain *d);
 
+/* Apply dom0-specific tweaks to the CPUID policy. */
+void init_dom0_cpuid_policy(struct domain *d);
+
 /* Clamp the CPUID policy to reality. */
 void recalculate_cpuid_policy(struct domain *d);
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f40a9fe5d351..e716005145d3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -772,6 +772,7 @@ static struct domain *__init create_dom0(const module_t *image,
     };
     struct domain *d;
     char *cmdline;
+    domid_t domid;
 
     if ( opt_dom0_pvh )
     {
@@ -786,10 +787,16 @@ static struct domain *__init create_dom0(const module_t *image,
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    /* Create initial domain 0. */
-    d = domain_create(get_initial_domain_id(), &dom0_cfg, !pv_shim);
-    if ( IS_ERR(d) || (alloc_dom0_vcpu0(d) == NULL) )
-        panic("Error creating domain 0\n");
+    /* Create initial domain.  Not d0 for pvshim. */
+    domid = get_initial_domain_id();
+    d = domain_create(domid, &dom0_cfg, !pv_shim);
+    if ( IS_ERR(d) )
+        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
+
+    init_dom0_cpuid_policy(d);
+
+    if ( alloc_dom0_vcpu0(d) == NULL )
+        panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
     cmdline = image->string ? __va(image->string) : NULL;
-- 
2.11.0


