Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC4F66A6AE
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jan 2023 00:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477555.740305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAF-0006wx-28; Fri, 13 Jan 2023 23:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477555.740305; Fri, 13 Jan 2023 23:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGTAE-0006uH-V1; Fri, 13 Jan 2023 23:08:46 +0000
Received: by outflank-mailman (input) for mailman id 477555;
 Fri, 13 Jan 2023 23:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bX0/=5K=citrix.com=prvs=37021d3d6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pGTAD-0006f0-2Z
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 23:08:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39beebee-9397-11ed-91b6-6bf2151ebd3b;
 Sat, 14 Jan 2023 00:08:43 +0100 (CET)
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
X-Inumbo-ID: 39beebee-9397-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673651324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=4vPnULWearCAs5pJV9RHnY3KcBHt0ecxfzxh751czBA=;
  b=T47e5geixP0LDAUbJiuKUIJsmM7xR01DRcBHnc+zLwbPh+1KpP5XmWmB
   kNlZRpGxtXJaH0ljXaK2qS+TJT4KK7riwRuixHHS375VufyLtn2f44mDQ
   gq88C9qpDfe8ezmaZ8fYfkVphcyZnWu615x+gE1BfXwBLJrADYCO+5yLZ
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92558107
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:01YKR66vw12gg3ZN85htwAxRtBvHchMFZxGqfqrLsTDasY5as4F+v
 mIbWWGGO/yLN2DzKN12bISypxxT65DSmIcwQAVvqHg9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakS5weC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 uEBEx8kQAG51931h6iaZ+9tvOMuBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zxzF+
 zKfpzuR7hcybNy/k2qDry2Vu+7ztmCgR785EaKV36s/6LGU7jNKU0BHPbehmtGikVK3Ud9bL
 00S+wItoLI0+UjtScPyNzWnpFaUsxhaXMBfe8U49QWMx6z88wufQG8eQVZpSvYrqcs3TjwCz
 UKSkpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/4Km5Gvoqhy9nMj2DUkvxyjRX1iC4yosMeZJeLeUBUjnAedoddjGFQTe4
 iRfwqBy/8hVU8jTyXXlrPElWejwuq3baGC0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5ycCl/KI+SzNDKy8Uza3SsEZmPW71C9vf1WM+GvmjVIhl6oyU
 b/CL5n3Uy1GWfU/nGPtLwv47VPM7nlurV4/uLihl0j3uVZgTCP9pUg53KumMblisfLsTPT9+
 NdDLcqaoyizo8WnChQ7BbU7dAhQRVBiXMCeliCiXrLbSuaQMD17WqC5LHJIU9ANopm5Yc+Ro
 C/sAh4FlgKh7ZAFQC3TAk1ehHrUdc4XhRoG0eYEZD5EB1BLjV6T0Zoi
IronPort-HdrOrdr: A9a23:hJsw66DyzM2ffzflHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.97,215,1669093200"; 
   d="scan'208";a="92558107"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH v2 1/5] xen/version: Drop bogus return values for XENVER_platform_parameters
Date: Fri, 13 Jan 2023 23:08:31 +0000
Message-ID: <20230113230835.29356-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230113230835.29356-1-andrew.cooper3@citrix.com>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

A split in virtual address space is only applicable for x86 PV guests.
Furthermore, the information returned for x86 64bit PV guests is wrong.

Explain the problem in version.h, stating the other information that PV guests
need to know.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

The only reason this does not get an XSA is because Xen does not have any form
of KALSR.

v2:
 * Retain the useless return value for 64bit PV guests in release builds only.
 * Rewrite comments.
---
 xen/common/kernel.c          | 20 +++++++++++++++++---
 xen/include/public/version.h | 27 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 4f268d83e3cb..f7b1f65f373c 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -518,11 +518,15 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     
     case XENVER_platform_parameters:
     {
+        const struct vcpu *curr = current;
+
 #ifdef CONFIG_COMPAT
-        if ( current->hcall_compat )
+        if ( curr->hcall_compat )
         {
             compat_platform_parameters_t params = {
-                .virt_start = HYPERVISOR_COMPAT_VIRT_START(current->domain),
+                .virt_start = is_pv_vcpu(curr)
+                            ? HYPERVISOR_COMPAT_VIRT_START(curr->domain)
+                            : 0,
             };
 
             if ( copy_to_guest(arg, &params, 1) )
@@ -532,7 +536,17 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #endif
         {
             xen_platform_parameters_t params = {
-                .virt_start = HYPERVISOR_VIRT_START,
+                /*
+                 * Out of an abundance of caution, retain the useless return
+                 * value for 64bit PV guests, but in release builds only.
+                 *
+                 * This is not expected to cause any problems, but if it does,
+                 * the developer impacted will be the one best suited to fix
+                 * the caller not to issue this hypercall.
+                 */
+                .virt_start = !IS_ENABLED(CONFIG_DEBUG) && is_pv_vcpu(curr)
+                              ? HYPERVISOR_VIRT_START
+                              : 0,
             };
 
             if ( copy_to_guest(arg, &params, 1) )
diff --git a/xen/include/public/version.h b/xen/include/public/version.h
index 0ff8bd9077c6..cbc4ef7a46e6 100644
--- a/xen/include/public/version.h
+++ b/xen/include/public/version.h
@@ -42,6 +42,33 @@ typedef char xen_capabilities_info_t[1024];
 typedef char xen_changeset_info_t[64];
 #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
 
+/*
+ * This API is problematic.
+ *
+ * It is only applicable to guests which share pagetables with Xen (x86 PV
+ * guests), but unfortunately has leaked into other guest types and
+ * architectures with an expectation of never failing.
+ *
+ * It is intended to identify the virtual address split between guest kernel
+ * and Xen.
+ *
+ * For 32bit PV guests, there is a split, and it is variable (between two
+ * fixed bounds), and this boundary is reported to guests.  The detail missing
+ * from the hypercall is that the second boundary is the 32bit architectural
+ * boundary at 4G.
+ *
+ * For 64bit PV guests, Xen lives at the bottom of the upper canonical range.
+ * This hypercall happens to report the architectural boundary, not the one
+ * which would be necessary to make a variable split work.  As such, this
+ * hypercall entirely useless for 64bit PV guests, and all inspected
+ * implementations at the time of writing were found to have compile time
+ * expectations about the split.
+ *
+ * For architectures where this hypercall is implemented, for backwards
+ * compatibility with the expectation of the hypercall never failing Xen will
+ * return 0 instead of failing with -ENOSYS in cases where the guest should
+ * not be making the hypercall.
+ */
 #define XENVER_platform_parameters 5
 struct xen_platform_parameters {
     xen_ulong_t virt_start;
-- 
2.11.0


