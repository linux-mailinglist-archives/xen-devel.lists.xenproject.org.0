Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70D473F9F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246512.425155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4G0-0002mr-Rf; Tue, 14 Dec 2021 09:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246512.425155; Tue, 14 Dec 2021 09:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4G0-0002jo-O3; Tue, 14 Dec 2021 09:38:00 +0000
Received: by outflank-mailman (input) for mailman id 246512;
 Tue, 14 Dec 2021 09:37:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0izq=Q7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mx4Fz-0002ji-Ay
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:37:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84122035-5cc1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 10:37:57 +0100 (CET)
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
X-Inumbo-ID: 84122035-5cc1-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639474677;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cMounVm5pz5tIlPw8vbYa1F55aMBxu8+npfkaESQRP8=;
  b=QoXyosTT/3B67Ff7OXgU2sByCRdXHQyIenG8U+uY8U++4qqpa+qlNFW7
   pHbzl0SzI3qGcvEjp7ihD+bbTTd5om3GLs4dxb45Q2/NmRZWsmAKoIBJi
   bnpJALOkOGTHS9joJ74DqNg8TfI/NLo7WI3PIJuTS9k5HrKa5nUjCArZt
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vTGboCc3YSm8rOmRU1bc82iYJ8vIqoM1J5eNIWba46QDqfSHym8X7O9OO1OiVMNrSwVwfGRQU4
 4aUXJyg4WL7zwqtMyU6PeOGCE5L5inX2r4RzfChcO/cZZ79KMnnU9puQGYYsE9w2T2Jlo02rqI
 +kqrYRrl8pI+IdwPyIXfnueszn2mHJ3m3WOaZkbYln3U+bs80NLB/GawYOb9LG51/aDGnEEvG8
 DTVhQTwhz6p0f20b+Ej4EIfSLS14J6th59o93kf3DVKbij7eaAoglZR/axE+1VkfVlEZd0EiUt
 6Zr3ElI7YRc197w6DzAdNayQ
X-SBRS: 5.1
X-MesageID: 59909729
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FlcHIq9bmfnWC50Itr4XDrUDTXmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 jEfXTiCMqmJZTD0c9BxaoXipBxXvcSEyINrQQY4/Hw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug6wrRg3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh2z
 4hV7oy3WDwvBZDTqc0HSxlpEjpxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0fTK6PO
 JBIAdZpRC38Y0QeBU0XMplkvb+GlEW4eDEGil3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0XN0NC7Yq7xC2zJHp/DewHHAEfz9aZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 idsdy+2tr9mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ldRsza55ZJ2C4M
 Cc/XD+9ArcJYxNGioctPOqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6CHfjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClIOMAkc5zX5m9vNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:RIDdx6izACkPVoVKYHiMUBOQmHBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59909729"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpuid: Fix TSXLDTRK definition
Date: Tue, 14 Dec 2021 09:37:32 +0000
Message-ID: <20211214093732.30424-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

TSXLDTRK lives in CPUID leaf 7[0].edx, not 7[0].ecx.

Bit 16 in ecx is LA57.

Fixes: a6d1b558471f ("x86emul: support X{SUS,RES}LDTRK")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_cpuid.c              | 2 +-
 tools/misc/xen-cpuid.c                      | 3 +--
 xen/arch/x86/x86_emulate/x86_emulate.c      | 2 +-
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 815498d4f3d0..e1acf6648db4 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -209,7 +209,6 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"avx512-vnni",  0x00000007,  0, CPUID_REG_ECX, 11,  1},
         {"avx512-bitalg",0x00000007,  0, CPUID_REG_ECX, 12,  1},
         {"avx512-vpopcntdq",0x00000007,0,CPUID_REG_ECX, 14,  1},
-        {"tsxldtrk",     0x00000007,  0, CPUID_REG_ECX, 16,  1},
         {"rdpid",        0x00000007,  0, CPUID_REG_ECX, 22,  1},
         {"cldemote",     0x00000007,  0, CPUID_REG_ECX, 25,  1},
 
@@ -220,6 +219,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"srbds-ctrl",   0x00000007,  0, CPUID_REG_EDX,  9,  1},
         {"md-clear",     0x00000007,  0, CPUID_REG_EDX, 10,  1},
         {"serialize",    0x00000007,  0, CPUID_REG_EDX, 14,  1},
+        {"tsxldtrk",     0x00000007,  0, CPUID_REG_EDX, 16,  1},
         {"cet-ibt",      0x00000007,  0, CPUID_REG_EDX, 20,  1},
         {"ibrsb",        0x00000007,  0, CPUID_REG_EDX, 26,  1},
         {"stibp",        0x00000007,  0, CPUID_REG_EDX, 27,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 9b59fec26371..fb36cac07baa 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -128,7 +128,6 @@ static const char *const str_7c0[32] =
     [10] = "vpclmulqdq",       [11] = "avx512-vnni",
     [12] = "avx512-bitalg",
     [14] = "avx512-vpopcntdq",
-    [16] = "tsxldtrk",
 
     [22] = "rdpid",
     /* 24 */                   [25] = "cldemote",
@@ -172,7 +171,7 @@ static const char *const str_7d0[32] =
     [10] = "md-clear",            [11] = "rtm-always-abort",
     /* 12 */                [13] = "tsx-force-abort",
     [14] = "serialize",
-
+    [16] = "tsxldtrk",
     [18] = "pconfig",
     [20] = "cet-ibt",
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 069acde51791..f71015ffa1ff 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2000,7 +2000,6 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
 #define vcpu_has_avx512_vnni() (ctxt->cpuid->feat.avx512_vnni)
 #define vcpu_has_avx512_bitalg() (ctxt->cpuid->feat.avx512_bitalg)
 #define vcpu_has_avx512_vpopcntdq() (ctxt->cpuid->feat.avx512_vpopcntdq)
-#define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_rdpid()       (ctxt->cpuid->feat.rdpid)
 #define vcpu_has_movdiri()     (ctxt->cpuid->feat.movdiri)
 #define vcpu_has_movdir64b()   (ctxt->cpuid->feat.movdir64b)
@@ -2009,6 +2008,7 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
+#define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index d6260c801ab5..647ee9e5e277 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -239,7 +239,6 @@ XEN_CPUFEATURE(VPCLMULQDQ,    6*32+10) /*A  Vector Carry-less Multiplication Ins
 XEN_CPUFEATURE(AVX512_VNNI,   6*32+11) /*A  Vector Neural Network Instrs */
 XEN_CPUFEATURE(AVX512_BITALG, 6*32+12) /*A  Support for VPOPCNT[B,W] and VPSHUFBITQMB */
 XEN_CPUFEATURE(AVX512_VPOPCNTDQ, 6*32+14) /*A  POPCNT for vectors of DW/QW */
-XEN_CPUFEATURE(TSXLDTRK,      6*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(RDPID,         6*32+22) /*A  RDPID instruction */
 XEN_CPUFEATURE(CLDEMOTE,      6*32+25) /*A  CLDEMOTE instruction */
 XEN_CPUFEATURE(MOVDIRI,       6*32+27) /*a  MOVDIRI instruction */
@@ -280,6 +279,7 @@ XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*A  VERW clears microarchitectural buffe
 XEN_CPUFEATURE(RTM_ALWAYS_ABORT, 9*32+11) /*! June 2021 TSX defeaturing in microcode. */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*a  SERIALIZE insn */
+XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
-- 
2.11.0


