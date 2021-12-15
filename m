Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3D476591
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 23:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247619.427012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxceh-00062V-4K; Wed, 15 Dec 2021 22:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247619.427012; Wed, 15 Dec 2021 22:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxceg-0005ug-VP; Wed, 15 Dec 2021 22:21:46 +0000
Received: by outflank-mailman (input) for mailman id 247619;
 Wed, 15 Dec 2021 22:21:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTfI=RA=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxcef-0005ZJ-Mx
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 22:21:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 620a7ecf-5df5-11ec-9e60-abaf8a552007;
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
X-Inumbo-ID: 620a7ecf-5df5-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639606904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x7dgLyygTieu5IPGh9PaNnQdDucWMUK0ck0vN46ZQe0=;
  b=byCEMiZw4MKNEKkANXCa6N9y3etkM51+1/2PWZ6mi5+0G/A6QIOlHVmY
   E1qi3qCqUCiM/wDLF0c3wn4p3UD1U+NIp+OQk/E9je0cfn/P7fM9OY5rz
   m7wClo85gFnXEeVA/pxYGvReUehJgmTAzvPJtBpFQql1y474SbQektdZr
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: B+uNPfy2nMfU3sOoyVOiRequXFFuiYR57zcsfX2zsEcXeV68gNmZpJ8hf+DjDYi84FjSZkA7EN
 fX9y/MZDBnh91QVIJ4g1gnpdApt7WTW65Aq7kCLPhD8YCKzOQlxF4tkSTA3l7hHRGSwW9mRO91
 QczXBawPOQlibfduiGaw2ChaSIigxA2RJd/5qoTyRoFM7Nt0eX9JvhNA8FsKuqDijlOcoeEmcA
 rRKr17PS16a+RL9fQ8d0DQuch+QAeMzo911F+WJbzt1mo9OA7pPc5J88ggAjFGwUNs843GXe5v
 pvaYM8ySv+2IoasRIEjZr9GX
X-SBRS: 5.1
X-MesageID: 59629092
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iQAcgKAEp/YpWxVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApG5z1TAAx
 mQcUDrVPfiKZzakKY0jPIXi9E5QvpDcnIBnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+EX570E87wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kinYkvpek
 4l2v4GOeTcwHPyUm6MSTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjWlq15gfR54yY
 eIcZDxXMlffRCFjPws4JYM8meGCunrWJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiGeY7xM2dIEMKOcn1jG904iFuwXeCXdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8pDGJGT9bxgbQ+0RqmBNzDJrVml
 CJb8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtENsWohdBozap1sldrVj
 Kn741k5CHh7ZiTCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2l3hW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:hufbQq9tjKQRhlZMxPJuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,209,1635220800"; 
   d="scan'208";a="59629092"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/4] x86/cpuid: Factor common parsing out of parse_xen_cpuid()
Date: Wed, 15 Dec 2021 22:21:13 +0000
Message-ID: <20211215222115.6829-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211215222115.6829-1-andrew.cooper3@citrix.com>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

dom0-cpuid= is going to want to reuse the common parsing loop, so factor it
out into parse_cpuid().

Irritatingly, despite being static const, the features[] array gets duplicated
each time parse_cpuid() is inlined.  As it is a large (and ever growing with
new CPU features) datastructure, move it to being file scope so all inlines
use the same single object.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New

We probably want to be wary of fallout from this pattern elsewhere.  I only
noticed it by chance.
---
 xen/arch/x86/cpuid.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index f63f5efc17f5..e11f5a3c9a6b 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -26,17 +26,26 @@ static const uint32_t __initconst hvm_hap_def_featuremask[] =
     INIT_HVM_HAP_DEF_FEATURES;
 static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
 
-static int __init parse_xen_cpuid(const char *s)
+static const struct feature_name {
+    const char *name;
+    unsigned int bit;
+} feature_names[] __initconstrel = INIT_FEATURE_NAMES;
+
+/*
+ * Parse a list of cpuid feature names -> bool, calling the callback for any
+ * matches found.
+ *
+ * always_inline, because this is init code only and we really don't want a
+ * function pointer call in the middle of the loop.
+ */
+static int __init always_inline parse_cpuid(
+    const char *s, void (*callback)(unsigned int feat, bool val))
 {
     const char *ss;
     int val, rc = 0;
 
     do {
-        static const struct feature {
-            const char *name;
-            unsigned int bit;
-        } features[] __initconstrel = INIT_FEATURE_NAMES;
-        const struct feature *lhs, *rhs, *mid = NULL /* GCC... */;
+        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
         const char *feat;
 
         ss = strchr(s, ',');
@@ -49,8 +58,8 @@ static int __init parse_xen_cpuid(const char *s)
             feat += 3;
 
         /* (Re)initalise lhs and rhs for binary search. */
-        lhs = features;
-        rhs = features + ARRAY_SIZE(features);
+        lhs = feature_names;
+        rhs = feature_names + ARRAY_SIZE(feature_names);
 
         while ( lhs < rhs )
         {
@@ -72,11 +81,7 @@ static int __init parse_xen_cpuid(const char *s)
 
             if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
             {
-                if ( !val )
-                    setup_clear_cpu_cap(mid->bit);
-                else if ( mid->bit == X86_FEATURE_RDRAND &&
-                          (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
-                    setup_force_cpu_cap(X86_FEATURE_RDRAND);
+                callback(mid->bit, val);
                 mid = NULL;
             }
 
@@ -95,6 +100,20 @@ static int __init parse_xen_cpuid(const char *s)
 
     return rc;
 }
+
+static void __init _parse_xen_cpuid(unsigned int feat, bool val)
+{
+    if ( !val )
+        setup_clear_cpu_cap(feat);
+    else if ( feat == X86_FEATURE_RDRAND &&
+              (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
+        setup_force_cpu_cap(X86_FEATURE_RDRAND);
+}
+
+static int __init parse_xen_cpuid(const char *s)
+{
+    return parse_cpuid(s, _parse_xen_cpuid);
+}
 custom_param("cpuid", parse_xen_cpuid);
 
 #define EMPTY_LEAF ((struct cpuid_leaf){})
-- 
2.11.0


