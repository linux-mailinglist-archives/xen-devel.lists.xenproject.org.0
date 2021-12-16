Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960BB476E58
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247794.427310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTJ-0005D9-BB; Thu, 16 Dec 2021 09:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247794.427310; Thu, 16 Dec 2021 09:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTJ-00059w-78; Thu, 16 Dec 2021 09:54:45 +0000
Received: by outflank-mailman (input) for mailman id 247794;
 Thu, 16 Dec 2021 09:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxnTI-00058M-JP
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3070c026-5e56-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 10:54:43 +0100 (CET)
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
X-Inumbo-ID: 3070c026-5e56-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ihpelIPg6Kn5U7wqbrqGt9VXxmF63gDVFbDxvOc0uT0=;
  b=d16DqkhE4Ug2SSVDn/vDRHYlvSYliVxymRpXB1geJjgoTL10qdRZwR3z
   T9goOdYkjw5OA9OrpLY4hCaq+umdXviXcdrQg+ZAYLDGjOSLf4P90mYFn
   AQgPTCUQ9kQJkzv2ZuR2BsuG4O4TXp6rSMCKZ3YzmNWub3zgewTBmU+oD
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8mJNhzLqrse/pUMk4lmSKtVCbNxIRcPVqSRHnU04+4QVkbCaNgtMpdIZnPrQOuJRV2onTGUI+D
 yb6jLXj+oP4kQO7xN7LqguwBn3k/D3abfMAbjrQdnY9fP1ck5igdTcGV/YIv5zYr2St4ljfXbO
 75u4ULpsj3BPomrZfcLQp8HtMARCfh+q/AqTFA61fdxD3e/UGbwgYIj8CEng2w5q3fXogNnpHM
 gnDpgit0lLczdtZUI9BEyiSfk+pK+xiD9dbg7p6ScwZQAE1L3VfIddg9APUmAQUxMpk+pyk9OT
 HLen+MHlam8XSVRz/N1VrVjr
X-SBRS: 5.1
X-MesageID: 60174026
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:C1JfhaP3PMAQYWjvrR1okMFynXyQoLVcMsEvi/4bfWQNrUon0zJVn
 DQZDGqAa66KZzb9eNFzaN/goBkD6MKEm95lSQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowyUn4Bq7
 upijre1azg3EuqTibw5ChYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm9p2ZwWR6i2i
 8wxYCRwYErhXTh1Zmg4EL4PoeGq1l7mfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvla9ox5MQPxvPNYR7SOy1IaTvBfBIjELG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7DFDFtW
 1BexKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sBvWAlexc0aJ5fEdMMX
 KM1kVkLjHO0FCH1BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:M3O/iK12XQQWbJZW+n+3UQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="60174026"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/6] x86/prot-key: Enumeration for Protection Key Supervisor
Date: Thu, 16 Dec 2021 09:54:16 +0000
Message-ID: <20211216095421.12871-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211216095421.12871-1-andrew.cooper3@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Protection Key Supervisor works in a very similar way to Protection Key User,
except that instead of a PKRU register used by the {RD,WR}PKRU instructions,
the supervisor protection settings live in MSR_PKRS and is accessed using
normal {RD,WR}MSR instructions.

PKS has the same problematic interactions with PV guests as PKU (more infact,
given the guest kernel's CPL), so we'll only support this for HVM guests for
now.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 2 +-
 xen/arch/x86/include/asm/msr-index.h        | 2 ++
 xen/arch/x86/include/asm/x86-defns.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index e1acf6648db4..efd01fd5c5b5 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -211,6 +211,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
         {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
         {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
+        {"pks",          0x00000007,  0, CPUID_REG_ECX, 31,  1},
 
         {"avx512-4vnniw",0x00000007,  0, CPUID_REG_EDX,  2,  1},
         {"avx512-4fmaps",0x00000007,  0, CPUID_REG_EDX,  3,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index fb36cac07baa..f5b67acacc48 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -133,7 +133,7 @@ static const char *const str_7c0[32] =
     /* 24 */                   [25] = "cldemote",
     /* 26 */                   [27] = "movdiri",
     [28] = "movdir64b",        [29] = "enqcmd",
-    [30] = "sgx-lc",
+    [30] = "sgx-lc",           [31] = "pks",
 };
 
 static const char *const str_e7d[32] =
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index ab68ef2681a9..3a1b4438e939 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -122,6 +122,8 @@
 #define MSR_PL3_SSP                         0x000006a7
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
+#define MSR_PKRS                            0x000006e1
+
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x00000bff
 
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 28628807cb98..37bbb3594e88 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -74,6 +74,7 @@
 #define X86_CR4_SMAP       0x00200000 /* enable SMAP */
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
+#define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
 
 /*
  * XSTATE component flags in XCR0
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 647ee9e5e277..79a8f244d88a 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -244,6 +244,7 @@ XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
 XEN_CPUFEATURE(MOVDIR64B,     6*32+28) /*a  MOVDIR64B instruction */
 XEN_CPUFEATURE(ENQCMD,        6*32+29) /*   ENQCMD{,S} instructions */
+XEN_CPUFEATURE(PKS,           6*32+31) /*   Protection Key for Supervisor */
 
 /* AMD-defined CPU features, CPUID level 0x80000007.edx, word 7 */
 XEN_CPUFEATURE(HW_PSTATE,     7*32+ 7) /*   Hardware Pstates */
-- 
2.11.0


