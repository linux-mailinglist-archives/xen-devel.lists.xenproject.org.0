Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C0A662515
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 13:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473593.734294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqxb-0003Bk-F3; Mon, 09 Jan 2023 12:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473593.734294; Mon, 09 Jan 2023 12:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqxb-00038q-BE; Mon, 09 Jan 2023 12:09:03 +0000
Received: by outflank-mailman (input) for mailman id 473593;
 Mon, 09 Jan 2023 12:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPNl=5G=citrix.com=prvs=36677a302=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pEqxa-00031g-9t
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 12:09:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64b2d057-9016-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 13:08:59 +0100 (CET)
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
X-Inumbo-ID: 64b2d057-9016-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673266139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m7oq3+yXJxv1JJKdBmmrPVeWQ6KupvyHV6r1iw6a5S0=;
  b=TQDax71N9I1YY3Aa3vI4IbSXYhyEryNjpaZK31Buv/jM+wDYVhFCNajn
   P5cz36zMF/Nh9ipMjKDxoPoQylAhmzBos8F4CG8k8rIxq7q6fv60KSm1m
   cVOYieWBT41ULMcosx31+UohSnx9vSEJTXvJA1Aa4maS5rgV+g6LENsuf
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91739042
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mAtMeKmQx3zQ/QYF4pNKpdno5gxAJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYWTrUbP3fYWr8LdxxYd+1/UsFuJHdmtUyTwY/+ythFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5A6GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fIAC2knSAGpvfy3wK38esVmg+RyDuC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zx/H/
 TOeoz6R7hcyKey1lgLY9FKVq+rXrTLYebBCV4D/+as/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgIssK508kWoR9v8WhSQoXiYsxpaUN1Ve8U55R+MzOzI4g+fLmkCUjNFLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcmZwYY59jooKkokwnCCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vjSqP/7LvXyQP+ATXQSWVwgl8RN+HTtn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2VdoIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RoATCnSSXFXdlM2LWaJ39z6FraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6klE7/i+XCPy7KFd/p1WdiiMhjtstoRy2Mr
 b5i2zaikU0DAIUSnAGLmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mNscl3het/0NzI/gp
 yjtMnK0PXKj3RUr3y3WMCE8AF4uNL4jxU8G0dsEYQzziiBzMNjwsc/ytfIfJNEayQCq9tYsJ
 9FtRilKKq4npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:OBj1za4xFFZ6abg+IQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.96,311,1665460800"; 
   d="scan'208";a="91739042"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 1/2] x86/vmx: Calculate model-specific LBRs once at start of day
Date: Mon, 9 Jan 2023 12:08:27 +0000
Message-ID: <20230109120828.344-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230109120828.344-1-andrew.cooper3@citrix.com>
References: <20230109120828.344-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no point repeating this calculation at runtime, especially as it is
in the fallback path of the WRSMR/RDMSR handlers.

Move the infrastructure higher in vmx.c to avoid forward declarations,
renaming last_branch_msr_get() to get_model_specific_lbr() to highlight that
these are model-specific only.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 276 +++++++++++++++++++++++----------------------
 1 file changed, 139 insertions(+), 137 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 43a4865d1c76..17320f9fb267 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -396,6 +396,142 @@ void vmx_pi_hooks_deassign(struct domain *d)
     domain_unpause(d);
 }
 
+static const struct lbr_info {
+    u32 base, count;
+} p4_lbr[] = {
+    { MSR_P4_LER_FROM_LIP,          1 },
+    { MSR_P4_LER_TO_LIP,            1 },
+    { MSR_P4_LASTBRANCH_TOS,        1 },
+    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, c2_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_C2_LASTBRANCH_TOS,        1 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_C2_LASTBRANCH_FROM_TO },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_C2_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, nh_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
+    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, sk_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
+    { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
+    { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
+    { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
+    { 0, 0 }
+}, at_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_C2_LASTBRANCH_TOS,        1 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, sm_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_SM_LBR_SELECT,            1 },
+    { MSR_SM_LASTBRANCH_TOS,        1 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+}, gm_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_SM_LBR_SELECT,            1 },
+    { MSR_SM_LASTBRANCH_TOS,        1 },
+    { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
+    { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
+    { 0, 0 }
+};
+static const struct lbr_info * __ro_after_init model_specific_lbr;
+
+static const struct __init lbr_info *get_model_specific_lbr(void)
+{
+    switch ( boot_cpu_data.x86 )
+    {
+    case 6:
+        switch ( boot_cpu_data.x86_model )
+        {
+        /* Core2 Duo */
+        case 0x0f:
+        /* Enhanced Core */
+        case 0x17:
+        /* Xeon 7400 */
+        case 0x1d:
+            return c2_lbr;
+        /* Nehalem */
+        case 0x1a: case 0x1e: case 0x1f: case 0x2e:
+        /* Westmere */
+        case 0x25: case 0x2c: case 0x2f:
+        /* Sandy Bridge */
+        case 0x2a: case 0x2d:
+        /* Ivy Bridge */
+        case 0x3a: case 0x3e:
+        /* Haswell */
+        case 0x3c: case 0x3f: case 0x45: case 0x46:
+        /* Broadwell */
+        case 0x3d: case 0x47: case 0x4f: case 0x56:
+            return nh_lbr;
+        /* Skylake */
+        case 0x4e: case 0x5e:
+        /* Xeon Scalable */
+        case 0x55:
+        /* Cannon Lake */
+        case 0x66:
+        /* Goldmont Plus */
+        case 0x7a:
+        /* Ice Lake */
+        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
+        /* Tiger Lake */
+        case 0x8c: case 0x8d:
+        /* Tremont */
+        case 0x86:
+        /* Kaby Lake */
+        case 0x8e: case 0x9e:
+        /* Comet Lake */
+        case 0xa5: case 0xa6:
+            return sk_lbr;
+        /* Atom */
+        case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
+            return at_lbr;
+        /* Silvermont */
+        case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
+        /* Xeon Phi Knights Landing */
+        case 0x57:
+        /* Xeon Phi Knights Mill */
+        case 0x85:
+        /* Airmont */
+        case 0x4c:
+            return sm_lbr;
+        /* Goldmont */
+        case 0x5c: case 0x5f:
+            return gm_lbr;
+        }
+        break;
+
+    case 15:
+        switch ( boot_cpu_data.x86_model )
+        {
+        /* Pentium4/Xeon with em64t */
+        case 3: case 4: case 6:
+            return p4_lbr;
+        }
+        break;
+    }
+
+    return NULL;
+}
+
 static int cf_check vmx_domain_initialise(struct domain *d)
 {
     static const struct arch_csw csw = {
@@ -2846,6 +2982,7 @@ const struct hvm_function_table * __init start_vmx(void)
         vmx_function_table.tsc_scaling.setup = vmx_setup_tsc_scaling;
     }
 
+    model_specific_lbr = get_model_specific_lbr();
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
 
@@ -2992,141 +3129,6 @@ static int vmx_cr_access(cr_access_qual_t qual)
     return X86EMUL_OKAY;
 }
 
-static const struct lbr_info {
-    u32 base, count;
-} p4_lbr[] = {
-    { MSR_P4_LER_FROM_LIP,          1 },
-    { MSR_P4_LER_TO_LIP,            1 },
-    { MSR_P4_LASTBRANCH_TOS,        1 },
-    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, c2_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_C2_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_C2_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, nh_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_NHL_LBR_SELECT,           1 },
-    { MSR_NHL_LASTBRANCH_TOS,       1 },
-    { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, sk_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_NHL_LBR_SELECT,           1 },
-    { MSR_NHL_LASTBRANCH_TOS,       1 },
-    { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
-    { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
-    { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
-    { 0, 0 }
-}, at_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, sm_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SM_LBR_SELECT,            1 },
-    { MSR_SM_LASTBRANCH_TOS,        1 },
-    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-}, gm_lbr[] = {
-    { MSR_IA32_LASTINTFROMIP,       1 },
-    { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SM_LBR_SELECT,            1 },
-    { MSR_SM_LASTBRANCH_TOS,        1 },
-    { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
-    { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
-    { 0, 0 }
-};
-
-static const struct lbr_info *last_branch_msr_get(void)
-{
-    switch ( boot_cpu_data.x86 )
-    {
-    case 6:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Core2 Duo */
-        case 0x0f:
-        /* Enhanced Core */
-        case 0x17:
-        /* Xeon 7400 */
-        case 0x1d:
-            return c2_lbr;
-        /* Nehalem */
-        case 0x1a: case 0x1e: case 0x1f: case 0x2e:
-        /* Westmere */
-        case 0x25: case 0x2c: case 0x2f:
-        /* Sandy Bridge */
-        case 0x2a: case 0x2d:
-        /* Ivy Bridge */
-        case 0x3a: case 0x3e:
-        /* Haswell */
-        case 0x3c: case 0x3f: case 0x45: case 0x46:
-        /* Broadwell */
-        case 0x3d: case 0x47: case 0x4f: case 0x56:
-            return nh_lbr;
-        /* Skylake */
-        case 0x4e: case 0x5e:
-        /* Xeon Scalable */
-        case 0x55:
-        /* Cannon Lake */
-        case 0x66:
-        /* Goldmont Plus */
-        case 0x7a:
-        /* Ice Lake */
-        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
-        /* Tiger Lake */
-        case 0x8c: case 0x8d:
-        /* Tremont */
-        case 0x86:
-        /* Kaby Lake */
-        case 0x8e: case 0x9e:
-        /* Comet Lake */
-        case 0xa5: case 0xa6:
-            return sk_lbr;
-        /* Atom */
-        case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
-            return at_lbr;
-        /* Silvermont */
-        case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
-        /* Xeon Phi Knights Landing */
-        case 0x57:
-        /* Xeon Phi Knights Mill */
-        case 0x85:
-        /* Airmont */
-        case 0x4c:
-            return sm_lbr;
-        /* Goldmont */
-        case 0x5c: case 0x5f:
-            return gm_lbr;
-        }
-        break;
-
-    case 15:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Pentium4/Xeon with em64t */
-        case 3: case 4: case 6:
-            return p4_lbr;
-        }
-        break;
-    }
-
-    return NULL;
-}
-
 enum
 {
     LBR_FORMAT_32                 = 0x0, /* 32-bit record format */
@@ -3233,7 +3235,7 @@ static void __init ler_to_fixup_check(void)
 
 static int is_last_branch_msr(u32 ecx)
 {
-    const struct lbr_info *lbr = last_branch_msr_get();
+    const struct lbr_info *lbr = model_specific_lbr;
 
     if ( lbr == NULL )
         return 0;
@@ -3572,7 +3574,7 @@ static int cf_check vmx_msr_write_intercept(
         if ( !(v->arch.hvm.vmx.lbr_flags & LBR_MSRS_INSERTED) &&
              (msr_content & IA32_DEBUGCTLMSR_LBR) )
         {
-            const struct lbr_info *lbr = last_branch_msr_get();
+            const struct lbr_info *lbr = model_specific_lbr;
 
             if ( unlikely(!lbr) )
             {
-- 
2.11.0


