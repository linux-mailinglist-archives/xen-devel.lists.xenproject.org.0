Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A757C6B4BDF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 17:03:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508516.783225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafCl-0000VZ-Js; Fri, 10 Mar 2023 16:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508516.783225; Fri, 10 Mar 2023 16:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafCl-0000St-H6; Fri, 10 Mar 2023 16:02:51 +0000
Received: by outflank-mailman (input) for mailman id 508516;
 Fri, 10 Mar 2023 16:02:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIN=7C=citrix.com=prvs=426914f36=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pafCj-0000Sh-Ll
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 16:02:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fed5350f-bf5c-11ed-87f5-c1b5be75604c;
 Fri, 10 Mar 2023 17:02:47 +0100 (CET)
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
X-Inumbo-ID: fed5350f-bf5c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678464167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t7ZnuhxowthQSOedJI0xzWN9tQ92btCp9YOyVVCtXMo=;
  b=fCtHkkmIhfJaSkZZQslE8GT3KQ6iVOXOddtP3kQkNm2SfTFJkh3UKpSP
   h+NfvvY7SdI3jRzIsnNm37vTvWZ1Us3Rmi8fdd5q2L1CgWPPKUP18J/z6
   SfgH+upAKqdqWAb4hNvjZf9EdkDzN4/BQF7Q/ed0Wj8ROzC6zDfYY3Lq5
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100753228
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8Shg0a+qJHBqtrwR2yzQDrUDln6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zEXXmiDOquPY2Twc4p0Ptu/oBxTvMLdz9VjGVFl/ig8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklc/
 sI/ARQTNiygrMmInZuxTsRxwc0seZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxh7H+
 zmcpTSR7hcyDuyu5B/UqWuQidDItg35A9wYMb3l36s/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yySzC3UATzVBQMc7r8JwTjsvv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqdyQ6aiIh/YHfg6oYsE/mRNJODem8gYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoNiN2dDB0zWirhRdMOS
 B67hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHYrHo+Ox/IhD2yzCDAdJ3T3
 r/BLK6R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/Fqmhmre1c3ST5/VqGOmtvMueVNxsxoqwsBx
 VnlMmcw9bY1rSGvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:GDCz464rF4P9ubDXZwPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="100753228"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/spec-ctrl: Add BHI controls to userspace components
Date: Fri, 10 Mar 2023 16:02:37 +0000
Message-ID: <20230310160238.1321765-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
References: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This was an oversight when adding the Xen parts.

Fixes: cea9ae062295 ("x86/spec-ctrl: Enumeration for new Intel BHI controls")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_cpuid.c | 3 +++
 tools/misc/xen-cpuid.c         | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 06b1227a2fd3..1d4e8a6b0067 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -240,6 +240,9 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
 
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
+        {"ipred-ctrl",   0x00000007,  2, CPUID_REG_EDX,  1,  1},
+        {"rrsba-ctrl",   0x00000007,  2, CPUID_REG_EDX,  2,  1},
+        {"bhi-ctrl",     0x00000007,  2, CPUID_REG_EDX,  4,  1},
         {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 3ab820571d8d..4f4261f4aa95 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -215,9 +215,9 @@ static const char *const str_7d1[32] =
 
 static const char *const str_7d2[32] =
 {
-    [ 0] = "intel-psfd",
-
-    /* 4 */                 [ 5] = "mcdt-no",
+    [ 0] = "intel-psfd",    [ 1] = "ipred-ctrl",
+    [ 2] = "rrsba-ctrl",
+    [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
 };
 
 static const struct {
-- 
2.30.2


