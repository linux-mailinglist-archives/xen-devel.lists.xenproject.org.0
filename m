Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7183170F52E
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538974.839468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcp-0008Tv-KW; Wed, 24 May 2023 11:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538974.839468; Wed, 24 May 2023 11:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcp-0008Mc-Eb; Wed, 24 May 2023 11:25:51 +0000
Received: by outflank-mailman (input) for mailman id 538974;
 Wed, 24 May 2023 11:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mcn-0006nQ-72
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb3d1b93-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:48 +0200 (CEST)
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
X-Inumbo-ID: bb3d1b93-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2M4LsdJHQ+3Rfju7ux5VA/VnrdGS15MZcIC/IW123ak=;
  b=LuHGGZ0BzxUb6ZDvCDw3FPG+3diMk3Qc8aW8eGcWQ8iINEtjKIgmOAak
   8vLVD4iL7unWp0ym3/GHyDds34b4iJJXSCEbNeBtJhiBIjQRfoLu5+6UO
   uNKPd0SiQRfGSpPKENjDKkgSv8grg3E6rYcIg4lNb2kEwgidEMektka8R
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112680560
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Lwvlqq1rZr2iUEXQzvbD5dtxkn2cJEfYwER7XKvMYLTBsI5bpzIBy
 WUcDT+HP/qLZGv9ctpwb4iyoB4Bv5DUnNJhTQVlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGmJCx
 NY+FCI0TE6qjcG5y6mQR9Zov5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJwPwBbA+
 zyel4j/KgE6P8Oc1BvfyUy9p7WI2hPWVqMbPqLto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooLW6QuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBXQBaR4uazcX2vu9iYsQgRnUZdtcFJfg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Jei8Axkkfi+F1/ronhe3C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvJFPXon8+ORXOjjqFfK0QfUYXY
 M3zTCpRJSxCVfQPIMSeHI/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8rip9pUIL7ffc1UO9aNII6a5/I7NsrdNx8x9/tokN
 FnmMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:a64lz6BZAp9E4RflHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AMFJnNWjHRJ6KlXK5rhMCWYb+NTJuaX7R/V32H12?=
 =?us-ascii?q?BKzhAQp6aQkS79Zxgqp87?=
X-Talos-MUID: 9a23:LoRdkAWLSS/Jm3Hq/C/Mjy5hKeYy2Jq/KRpK1qUrteiNHzMlbg==
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="112680560"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 07/10] x86/cpufeature: Rework {boot_,}cpu_has()
Date: Wed, 24 May 2023 12:25:23 +0100
Message-ID: <20230524112526.3475200-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Drop stdbool.  It is already covered by other includes.
---
 xen/arch/x86/include/asm/cpufeature.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 4140ec0938b2..d0ead8e7a51e 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -17,7 +17,6 @@
 #define X86_FEATURE_ALWAYS      X86_FEATURE_LM
 
 #ifndef __ASSEMBLY__
-#include <xen/bitops.h>
 
 struct cpuinfo_x86 {
     unsigned char x86;                 /* CPU family */
@@ -43,8 +42,15 @@ struct cpuinfo_x86 {
 
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
-- 
2.30.2


