Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC8373003
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 20:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122698.231470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le0Ay-00041d-RU; Tue, 04 May 2021 18:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122698.231470; Tue, 04 May 2021 18:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le0Ay-00041I-OA; Tue, 04 May 2021 18:53:44 +0000
Received: by outflank-mailman (input) for mailman id 122698;
 Tue, 04 May 2021 18:53:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1le0Ax-00041B-29
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 18:53:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df988fa9-4297-41c4-8bbd-4a2350a05d30;
 Tue, 04 May 2021 18:53:41 +0000 (UTC)
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
X-Inumbo-ID: df988fa9-4297-41c4-8bbd-4a2350a05d30
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620154421;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=06f3Upass2mWyTQoV9Tdjou4hgcCqgB0oTGnDLZQanY=;
  b=CdppCgqWXpGAwPP4Ji1cAe96T8rk6QHaDGxrrd47Qzzk0qjQ27Dr0gY7
   izJGqd2lH2Iqu5Uyj2gaevlvstkJn9YTfIezXMjQWGkpGh1BCCVnf9w0t
   lg4saG8j6YjiSseBSbiZHf10im2NK4paSPaXfiQJ5kW2mVlqbPsZZ1HEf
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yqvrvkrZkOrUIcOWtZ8oScsOZW/874cgoVpvnmfyx4k5mMt/ftmY+Z3zO/+VjdZuGUC3l+J6mN
 Y+1fGA+aLyX78Ky71cklJoGpj4DQ8OgvP5fIWKJg7Md2wjZ7shydRnmz4WhMJQYMuIikekZS9F
 ozRUS3uIDl4AW/xi5hINhAvis8OSiAOwEwjhIzIftJbYUZKvb+NRwYjOxyHk/t8SPVbnir8cf7
 uk9Wr/42BuzJxFEEagafbDQB7WDhqMtYHVMDw4JogTvlW8sX/hRIW65x8Pvf/FM5Qf43fXgYU7
 seE=
X-SBRS: 5.1
X-MesageID: 43068859
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4vriwK7hI2kB2EfKOgPXwRqBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO/f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf/LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqy+Hjr576fQUAQycu9Qjmt1iVwYTnGBuV1Ap2aUIs/Z4e9w
 H+8jDR1+GYnNyQjjTd0GLS6Jo+oqqd9vJzQPaip+JQBjHligODbJlsVbuYrFkO0Z2SwWdvqv
 bgiVMNONly9mPwcwiO0GTQ8jil6hkCwTvDzkKVmnTqq8CRfkNFN+Nxwbh3XzGczmhIhqAa7I
 t7m1i3mrASMDb72AP63NTMXwECrDvOnVMS1dQ9olYabZETc9Zq3Ooi1XIQKrgsNgTg5rsqFe
 F/Zfusnsp+QBehY3fVsnIH+q3UYl0DWhOPQk01sseIyTRhnHdg00sCxMAE901wjK4Adw==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43068859"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] libs/guest: Don't hide the indirection on xc_cpu_policy_t
Date: Tue, 4 May 2021 19:53:22 +0100
Message-ID: <20210504185322.19306-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It is bad form in C, perhaps best demonstrated by trying to read
xc_cpu_policy_destroy(), and causes const qualification to have
less-than-obvious behaviour (the hidden pointer becomes const, not the thing
it points at).

xc_cpu_policy_set_domain() needs to drop its (now normal) const qualification,
as the policy object is modified by the serialisation operation.

This also shows up a problem with the x86_cpu_policies_are_compatible(), where
the intermediate pointers are non-const.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Discovered while trying to start the integration into XenServer.  This wants
fixing ASAP, before futher uses get added.

Unsure what to do about x86_cpu_policies_are_compatible().  It would be nice
to have xc_cpu_policy_is_compatible() sensibly const'd, but maybe that means
we need a struct const_cpu_policy and that smells like it is spiralling out of
control.
---
 tools/include/xenctrl.h             | 22 +++++++++++-----------
 tools/libs/guest/xg_cpuid_x86.c     | 22 +++++++++++-----------
 tools/libs/guest/xg_sr_common_x86.c |  2 +-
 tools/misc/xen-cpuid.c              |  2 +-
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0fdb2e8885..58d3377d6a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2590,33 +2590,33 @@ int xc_psr_get_domain_data(xc_interface *xch, uint32_t domid,
 int xc_psr_get_hw_info(xc_interface *xch, uint32_t socket,
                        xc_psr_feat_type type, xc_psr_hw_info *hw_info);
 
-typedef struct xc_cpu_policy *xc_cpu_policy_t;
+typedef struct xc_cpu_policy xc_cpu_policy_t;
 
 /* Create and free a xc_cpu_policy object. */
-xc_cpu_policy_t xc_cpu_policy_init(void);
-void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
+xc_cpu_policy_t *xc_cpu_policy_init(void);
+void xc_cpu_policy_destroy(xc_cpu_policy_t *policy);
 
 /* Retrieve a system policy, or get/set a domains policy. */
 int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
-                             xc_cpu_policy_t policy);
+                             xc_cpu_policy_t *policy);
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t policy);
+                             xc_cpu_policy_t *policy);
 int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
-                             const xc_cpu_policy_t policy);
+                             xc_cpu_policy_t *policy);
 
 /* Manipulate a policy via architectural representations. */
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
                             xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
                             xen_msr_entry_t *msrs, uint32_t *nr_msrs);
-int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                const xen_cpuid_leaf_t *leaves,
                                uint32_t nr);
-int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
 
 /* Compatibility calculations. */
-bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
-                                 const xc_cpu_policy_t guest);
+bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
+                                 xc_cpu_policy_t *guest);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index d4e02cecb1..1ebc108213 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -672,18 +672,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     return rc;
 }
 
-xc_cpu_policy_t xc_cpu_policy_init(void)
+xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
 }
 
-void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
+void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
 {
     if ( policy )
         free(policy);
 }
 
-static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t policy,
+static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
                               unsigned int nr_leaves, unsigned int nr_entries)
 {
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
@@ -713,7 +713,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t policy,
 }
 
 int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
-                             xc_cpu_policy_t policy)
+                             xc_cpu_policy_t *policy)
 {
     unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
     unsigned int nr_entries = ARRAY_SIZE(policy->entries);
@@ -738,7 +738,7 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
 }
 
 int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
-                             xc_cpu_policy_t policy)
+                             xc_cpu_policy_t *policy)
 {
     unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
     unsigned int nr_entries = ARRAY_SIZE(policy->entries);
@@ -763,7 +763,7 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
 }
 
 int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
-                             const xc_cpu_policy_t policy)
+                             xc_cpu_policy_t *policy)
 {
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
@@ -791,7 +791,7 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
     return rc;
 }
 
-int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
+int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
                             xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
                             xen_msr_entry_t *msrs, uint32_t *nr_msrs)
 {
@@ -823,7 +823,7 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
     return 0;
 }
 
-int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
+int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                                const xen_cpuid_leaf_t *leaves,
                                uint32_t nr)
 {
@@ -843,7 +843,7 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
     return rc;
 }
 
-int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
                               const xen_msr_entry_t *msrs, uint32_t nr)
 {
     unsigned int err_msr = -1;
@@ -861,8 +861,8 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
     return rc;
 }
 
-bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t host,
-                                 const xc_cpu_policy_t guest)
+bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
+                                 xc_cpu_policy_t *guest)
 {
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
     struct cpu_policy h = { &host->cpuid, &host->msr };
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 15265e7a33..563b4f0168 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -48,7 +48,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
     struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
     uint32_t nr_leaves = 0, nr_msrs = 0;
-    xc_cpu_policy_t policy = NULL;
+    xc_cpu_policy_t *policy = NULL;
     int rc;
 
     if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index b2a36deacc..d4bc83d8c9 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -468,7 +468,7 @@ int main(int argc, char **argv)
         uint32_t i, max_leaves, max_msrs;
 
         xc_interface *xch = xc_interface_open(0, 0, 0);
-        xc_cpu_policy_t policy = xc_cpu_policy_init();
+        xc_cpu_policy_t *policy = xc_cpu_policy_init();
 
         if ( !xch )
             err(1, "xc_interface_open");
-- 
2.11.0


