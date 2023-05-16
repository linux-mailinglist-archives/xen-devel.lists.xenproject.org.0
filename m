Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C3E70514B
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535262.832953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3h-0006Xv-KB; Tue, 16 May 2023 14:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535262.832953; Tue, 16 May 2023 14:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3h-0006S2-GI; Tue, 16 May 2023 14:53:49 +0000
Received: by outflank-mailman (input) for mailman id 535262;
 Tue, 16 May 2023 14:53:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyw3g-0006OC-DR
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:53:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 745f770e-f3f9-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 16:53:46 +0200 (CEST)
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
X-Inumbo-ID: 745f770e-f3f9-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684248825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nyQur+30ZM6XscWFa3iBiYiEbv5nHeYpGVnr0FExeKQ=;
  b=VSFv6Z+6ku77nlo+gSIF+uvMIjQD5fKGuo89Oz6Z/p/fsGeEFtMU8fVm
   VmxTHFSIpTwyZ03W5i1bx4Z+m4is51H6MQHH5ywC+UgqnraOTf/ejMDpm
   b5+vNtjRvkp/bsb4kriQRPoM0nsXpy77GZPDCHhB4mGedk4PjfPCY9BY9
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109117764
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:QB58IK71qn8wGRrfY7ImjgxRtDHHchMFZxGqfqrLsTDasY5as4F+v
 jcbD2iHOqmKNjHyc412PIrnoE9T6p7WndJgSAU4rHxhHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 uIFAzcNPlO4rO+omI2DW9tn1+t7BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7J/
 zuZoDqlav0cHIez1Weo7FGoveCMpjrEe4U8G/6WrfE/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTQQaUCAC44mgm6o+kErwdsdRG/+a1vSgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKuFmSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrH03OhPOjjmxzxJEfUQD1
 XCzIK6R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5IHKbPTflU/QwnMyZb5mNscRmCspIwN/s+gw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:VvZXy6HQsft+I1SQpLqFUpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdsZJkh8erwXJVoMkmsiqKdgLNhcItKOTOGhILGFvAb0WKP+UyDJ8S6zJ8h6U
 4CSdkzNDSTNykAsS+S2mDReLxMoKjlzEnrv5al854Ed3AtV0gK1XYfNu/vKDwOeOAwP+teKH
 Pz3Lsjm9OIQwVZUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xSiIbToZOAzS4RBD6nfKi4Xim7N9k0Q6d9bbRuwqTnSW+fkNjN+NxwbtQaAHU5ncgp9dh3q
 Ns2FuDu55WFx/b9R6NvuQgHisa5nacsD4sl/UegGdYVpZbYLhNrZYH9EcQC5sYGjnmgbpXWN
 WGo/uskMq+XGnqGUwxhFMfieCETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 CcW54Y3o1mX4sTd+ZwFe0BScy4BijERg/NKnubJRDiGLscM3zAppbr6PE+5f2sepYP0Jwu8a
 6xG2+wdVRCDH4GJff+qaGjqCq9M1lVdQ6duP1j2w==
X-Talos-CUID: =?us-ascii?q?9a23=3AcNYIIWhBew4ACRNy0Gp+98n0PzJuWWPA53DQcwy?=
 =?us-ascii?q?DImt3EIKtWG2bqYw8up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1sEVUQ7S5rIBv2XxGS2G2UO2xowzz7jzJV4ula4?=
 =?us-ascii?q?J+PKdCg93FTjeom+4F9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="109117764"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/4] x86/cpufeature: Rework {boot_,}cpu_has()
Date: Tue, 16 May 2023 15:53:31 +0100
Message-ID: <20230516145334.1271347-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

One area where Xen deviates from Linux is that test_bit() forces a volatile
read.  This leads to poor code generation, because the optimiser cannot merge
bit operations on the same word.

Drop the use of test_bit(), and write the expressions in regular C.  This
removes the include of bitops.h (which is a frequent source of header
tangles), and it offers the optimiser far more flexibility.

Bloat-o-meter reports a net change of:

  add/remove: 0/0 grow/shrink: 21/87 up/down: 641/-2751 (-2110)

with half of that in x86_emulate() alone.  vmx_ctxt_switch_to() seems to be
the fastpath with the greatest delta at -24, where the optimiser has
successfully removed the branch hidden in cpu_has_msr_tsc_aux.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/cpufeature.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 4140ec0938b2..4f827cc6ff91 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -7,6 +7,7 @@
 #define __ASM_I386_CPUFEATURE_H
 
 #include <xen/const.h>
+#include <xen/stdbool.h>
 #include <asm/cpuid.h>
 
 #define cpufeat_word(idx)	((idx) / 32)
@@ -17,7 +18,6 @@
 #define X86_FEATURE_ALWAYS      X86_FEATURE_LM
 
 #ifndef __ASSEMBLY__
-#include <xen/bitops.h>
 
 struct cpuinfo_x86 {
     unsigned char x86;                 /* CPU family */
@@ -43,8 +43,15 @@ struct cpuinfo_x86 {
 
 extern struct cpuinfo_x86 boot_cpu_data;
 
-#define cpu_has(c, bit)		test_bit(bit, (c)->x86_capability)
-#define boot_cpu_has(bit)	test_bit(bit, boot_cpu_data.x86_capability)
+static inline bool cpu_has(const struct cpuinfo_x86 *info, unsigned int feat)
+{
+    return info->x86_capability[cpufeat_word(feat)] & cpufeat_mask(feat);
+}
+
+static inline bool boot_cpu_has(unsigned int feat)
+{
+    return cpu_has(&boot_cpu_data, feat);
+}
 
 #define CPUID_PM_LEAF                    6
 #define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1

base-commit: 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
prerequisite-patch-id: ceeba7d5ab9498cb188e5012953c7e8c9a86347d
prerequisite-patch-id: c0957b9e1157ae6eb8de973c96716fd02587c486
prerequisite-patch-id: d2574bba15748cd021e5b33fa50e6cadc38863b6
prerequisite-patch-id: 0f66cd4287ffdc06f24dc01c7d26fb428f3e8c09
prerequisite-patch-id: a585f61b546ff96be3624ff253f8100b2f465de6
prerequisite-patch-id: 54551cdefaca083b4a4b97528d27d0f3dc9753ee
prerequisite-patch-id: 051423463e4a34728ab524f03e801e7103777684
-- 
2.30.2


