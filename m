Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE757664746
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474874.736281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH2-0003UR-AS; Tue, 10 Jan 2023 17:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474874.736281; Tue, 10 Jan 2023 17:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH2-0003SG-75; Tue, 10 Jan 2023 17:18:56 +0000
Received: by outflank-mailman (input) for mailman id 474874;
 Tue, 10 Jan 2023 17:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH0-0003Rz-Lx
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:18:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d99b1fde-910a-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 18:18:52 +0100 (CET)
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
X-Inumbo-ID: d99b1fde-910a-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nlcu1l1czYrvkQ6yAjB0ab/hxX/LNf+c8nxTwGFVhRM=;
  b=arkGuz02Y/TSqhJka3P0D7BPkhsPmZs/BAcU4ELfx/tMfyrNSAYwtAH+
   mXEiN9eQtMeNPCPEYSHLQIlBuVbnSthuw50vp8dc3IKpPcK+mncDFmETz
   x1y4EObzV/TGWZcgj5NTNIqtSxLkl+ka6NYRMftbZt9Tce9sGQhh+OUD/
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92390969
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MnqQCa2gwGaBC4Zd3vbD5cBxkn2cJEfYwER7XKvMYLTBsI5bp2QGy
 WEfCDiCMq2JZzP1L9siPo6z/ENU78fcndRmSVNlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlD5gVnPagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDX112
 tcoER00TxmDgfu9y5eUT8pHr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbH54ExhfG9
 woq+UzFJAxEHtu5xQGdsW+pg8LQuRK4eKM7QejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 24+9zcqrKMy3Fe2VdS7VBq9yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyLGnluJkd+sESQJFkApVRYpdCoM49/6q4oWoRfsZf82RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3oBZPnqgKulmSwXuF1e5aEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPcMrJF7fo3wzPBT4M4XRfK4Ey/lX1
 XCzKJjEMJrnIf4/kGreqxk1jdfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrlR0U9wmy2Mq
 4w3H5LTm31ivBjWPnG/HXg7cQpbchDWxPne96RqSwJ0ClE6RDBwWqKMn+hJlk4Mt/09q9okN
 0qVAidwoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:Xj6syKk04uxO5DNMXQHtoTXZa7XpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="92390969"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/8] x86: Initial support for WRMSRNS
Date: Tue, 10 Jan 2023 17:18:41 +0000
Message-ID: <20230110171845.20542-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

WRMSR Non-Serialising is an optimisation intended for cases where an MSR needs
updating, but architectural serialising properties are not needed.

In is anticipated that this will apply to most if not all MSRs modified on
context switch paths.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/include/asm/msr.h              | 12 ++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 4 files changed, 15 insertions(+)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index cbd4e511e8ab..8da78773a886 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -235,6 +235,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
+        {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
 
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
         {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index ea7ff320e0e4..f482c4e28f30 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -189,6 +189,7 @@ static const char *const str_7a1[32] =
 
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
+    /* 18 */                [19] = "wrmsrns",
 };
 
 static const char *const str_e21a[32] =
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index dd1eee04a637..191e54068856 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -38,6 +38,18 @@ static inline void wrmsrl(unsigned int msr, __u64 val)
         wrmsr(msr, lo, hi);
 }
 
+/* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
+static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
+{
+    /*
+     * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
+     * prefix to avoid a trailing NOP.
+     */
+    alternative_input(".byte 0x2e; wrmsr",
+                      ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
+                      "c" (msr), "a" (lo), "d" (hi));
+}
+
 /* rdmsr with exception handling */
 #define rdmsr_safe(msr,val) ({\
     int rc_; \
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index ad7e89dd4c40..5444bc5d8374 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -281,6 +281,7 @@ XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
+XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*   WRMSR Non-Serialising */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
-- 
2.11.0


