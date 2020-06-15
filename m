Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313461F99D3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:16:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpuC-0007wm-El; Mon, 15 Jun 2020 14:16:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpuA-0007r6-G3
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:16:06 +0000
X-Inumbo-ID: bc0677b8-af12-11ea-b801-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc0677b8-af12-11ea-b801-12813bfff9fa;
 Mon, 15 Jun 2020 14:15:59 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JU1Vs650gkYDzYMdXAJXYudu/aOm7faToFpWENF6iSlqlaSh8VZFf4te83IyZXexORmiMShiPJ
 aXpgt4sBt9nWBSKXmOy5LIPTkCMAVU+KhnNzjKYccOZ0HrUp0rWIzyEfTN+lZpib3Qc6IH8UDL
 AgSSykyH7Ss7D9bv7f2FOUwwF0ZpVBoyFB6IKG8yzUJRkMu51dJHZ3mOlhTKsNRoxHuZuutaMu
 b7GCXgG6IzI88ps90tsI7KCxx50mnOLoPSFVJJqYO1Jq+6L+FalNPtI22VS6d6Y3qSMt4OwQ/b
 PR0=
X-SBRS: 2.7
X-MesageID: 20839545
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20839545"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 7/9] x86/hvm: Disable MPX by default
Date: Mon, 15 Jun 2020 15:15:30 +0100
Message-ID: <20200615141532.1927-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200615141532.1927-1-andrew.cooper3@citrix.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Memory Protection eXtension support has been dropped from GCC and Linux, and
will be dropped from future Intel CPUs.

With all other default/max pieces in place, move MPX from default to max.
This means that VMs won't be offered it by default, but can explicitly opt
into using it via cpuid="host,mpx=1" in their vm.cfg file.

The difference as visible to the guest is:

  diff --git a/default b/mpx
  index 0e91765d6b..c8c33cd584 100644
  --- a/default
  +++ b/mpx
  @@ -13,15 +13,17 @@ Native cpuid:
     00000004:00000004 -> 00000000:00000000:00000000:00000000
     00000005:ffffffff -> 00000000:00000000:00000000:00000000
     00000006:ffffffff -> 00000000:00000000:00000000:00000000
  -  00000007:00000000 -> 00000000:009c2fbb:00000000:9c000400
  +  00000007:00000000 -> 00000000:009c6fbb:00000000:9c000400
     00000008:ffffffff -> 00000000:00000000:00000000:00000000
     00000009:ffffffff -> 00000000:00000000:00000000:00000000
     0000000a:ffffffff -> 00000000:00000000:00000000:00000000
     0000000b:ffffffff -> 00000000:00000000:00000000:00000000
     0000000c:ffffffff -> 00000000:00000000:00000000:00000000
  -  0000000d:00000000 -> 00000007:00000240:00000340:00000000
  +  0000000d:00000000 -> 0000001f:00000240:00000440:00000000
     0000000d:00000001 -> 0000000f:00000240:00000000:00000000
     0000000d:00000002 -> 00000100:00000240:00000000:00000000
  +  0000000d:00000003 -> 00000040:000003c0:00000000:00000000
  +  0000000d:00000004 -> 00000040:00000400:00000000:00000000
     40000000:ffffffff -> 40000005:566e6558:65584d4d:4d4d566e
     40000001:ffffffff -> 0004000e:00000000:00000000:00000000
     40000002:ffffffff -> 00000001:40000000:00000000:00000000

Adjust the legacy restore path in libxc to cope safely with pre-4.14 VMs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>

Dropped Jan's R-by from previous posting, as the patch has gained new
toolstack logic to avoid breaking migrate.
---
 tools/libxc/xc_cpuid_x86.c                  | 48 ++++++++++++++++++-----------
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 2 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xc_cpuid_x86.c
index e017abffce..5649913e69 100644
--- a/tools/libxc/xc_cpuid_x86.c
+++ b/tools/libxc/xc_cpuid_x86.c
@@ -436,6 +436,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
+    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
+    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -458,6 +460,22 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (p = calloc(1, sizeof(*p))) == NULL )
         goto out;
 
+    /* Get the host policy. */
+    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
+                               &len, host_featureset);
+    if ( rc )
+    {
+        /* Tolerate "buffer too small", as we've got the bits we need. */
+        if ( errno == ENOBUFS )
+            rc = 0;
+        else
+        {
+            PERROR("Failed to obtain host featureset");
+            rc = -errno;
+            goto out;
+        }
+    }
+
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -479,6 +497,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
+    /*
+     * Account for feature which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    if ( restore )
+    {
+        if ( di.hvm )
+        {
+            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
+        }
+    }
+
     if ( featureset )
     {
         uint32_t disabled_features[FEATURESET_NR_ENTRIES],
@@ -530,24 +560,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( !di.hvm )
     {
-        uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-        uint32_t len = ARRAY_SIZE(host_featureset);
-
-        rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                                   &len, host_featureset);
-        if ( rc )
-        {
-            /* Tolerate "buffer too small", as we've got the bits we need. */
-            if ( errno == ENOBUFS )
-                rc = 0;
-            else
-            {
-                PERROR("Failed to obtain host featureset");
-                rc = -errno;
-                goto out;
-            }
-        }
-
         /*
          * On hardware without CPUID Faulting, PV guests see real topology.
          * As a consequence, they also need to see the host htt/cmp fields.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 5ca35d9d97..af1b8a96a6 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -207,7 +207,7 @@ XEN_CPUFEATURE(INVPCID,       5*32+10) /*H  Invalidate Process Context ID */
 XEN_CPUFEATURE(RTM,           5*32+11) /*A  Restricted Transactional Memory */
 XEN_CPUFEATURE(PQM,           5*32+12) /*   Platform QoS Monitoring */
 XEN_CPUFEATURE(NO_FPU_SEL,    5*32+13) /*!  FPU CS/DS stored as zero */
-XEN_CPUFEATURE(MPX,           5*32+14) /*S  Memory Protection Extensions */
+XEN_CPUFEATURE(MPX,           5*32+14) /*s  Memory Protection Extensions */
 XEN_CPUFEATURE(PQE,           5*32+15) /*   Platform QoS Enforcement */
 XEN_CPUFEATURE(AVX512F,       5*32+16) /*A  AVX-512 Foundation Instructions */
 XEN_CPUFEATURE(AVX512DQ,      5*32+17) /*A  AVX-512 Doubleword & Quadword Instrs */
-- 
2.11.0


