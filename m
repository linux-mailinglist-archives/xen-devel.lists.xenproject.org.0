Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6E8B3C72
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 18:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712965.1113890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0O8G-0003ou-HM; Fri, 26 Apr 2024 16:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712965.1113890; Fri, 26 Apr 2024 16:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0O8G-0003me-E1; Fri, 26 Apr 2024 16:09:04 +0000
Received: by outflank-mailman (input) for mailman id 712965;
 Fri, 26 Apr 2024 16:09:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0O8F-0003mY-C6
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 16:09:03 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c1c163e-03e7-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 18:09:02 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a587831809eso276056666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 09:09:02 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bu6-20020a170906a14600b00a57c75871d8sm5315763ejb.106.2024.04.26.09.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 09:09:00 -0700 (PDT)
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
X-Inumbo-ID: 4c1c163e-03e7-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714147741; x=1714752541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gD5q9PEj+9Tsia93/15fwjsbfZRGM0kGz/xaTFxAsYg=;
        b=Dy0F0kMeKEZHB+6QDnOGf5SieAiaHDC/yk4X9RoJe0cLYyBcJd6IcNPTSPpu/gZB1I
         AZUJTapuWUbsTRooVd2TNjpsCBVf/IP8sKx5jiYIQx5m5rbyG83DwjVc/y/LNNdXaDg+
         FSoCKAeMDmWfQoA9qRO5vWj6vk9mF4nkFqI1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147741; x=1714752541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gD5q9PEj+9Tsia93/15fwjsbfZRGM0kGz/xaTFxAsYg=;
        b=P3AIDvGKlmRor6bIw5kkzwnvi2ACaxC/u8KmUJFMo0iYnSB6CpqevxTbF/ghYbJrqg
         Ya8L1ro9BXw0T5/9qtIJz0pmMC3NcCxCfDo5rq1SSvrLRL01bxl8Fk5khTQgo5jPPODP
         2sS6PU/H59Kzjj3+llIqCU+/VzYrHJs/xKo/T88B6leNIRssw7yOJs+5cb/2o+nWH0km
         v+HiMjD89+qDLGrTIQ4Nj4lzbcdLr+kujxu/uRHD3sf5iOGttGhsnRVAbBRh418gnHmz
         vVf67dCCP+SRt2LYSNZvhQD4mR2m2X5xh6iSwxzjzGKtWdF9lV9t5Gxw1xoawb4kBgRG
         TDSQ==
X-Gm-Message-State: AOJu0YxXUmxN104A8CZsngxbjwMEMmfpG22H5CxokTCTTzOJN5oZPtEu
	pAJHllSPIYw9wCMni5nDII/f5wA6/0Ild4QYH9wFEfA7Pt4u5+ab7LYvLONzG0KyiAp4cVNieaa
	u
X-Google-Smtp-Source: AGHT+IH4X7bHy9GJ7y+RIcXHPc4Tqd+jVZ74Q9KvLt4n/XbbkISUkQAB32y4bTMCggnb3rYLybBNYA==
X-Received: by 2002:a17:906:3811:b0:a55:99f4:549f with SMTP id v17-20020a170906381100b00a5599f4549fmr2335713ejc.48.1714147741396;
        Fri, 26 Apr 2024 09:09:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpu-policy: Annotate the accumulated features
Date: Fri, 26 Apr 2024 17:08:59 +0100
Message-Id: <20240426160859.565438-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some features need accumulating rather than intersecting to make migration
safe.  Introduce the new '|' attribute for this purpose.

Right now, it's only used by the Xapi toolstack, but it will be used by
xl/libxl when the full policy-object work is complete, and until then it's
still a useful hint for hand-crafted cpuid= lines in vm.cfg files.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/public/arch-x86/cpufeatureset.h | 15 ++++++++++-----
 xen/tools/gen-cpuid.py                      |  7 +++++--
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 53f13dec31f7..6627453e3985 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -72,6 +72,11 @@ enum {
  *   'H' = HVM HAP guests (not PV or HVM Shadow guests).
  *   Upper case => Available by default
  *   Lower case => Can be opted-in to, but not available by default.
+ *
+ * Migration: '|'
+ *   This bit should be visible to a guest if any anywhere it might run has
+ *   the bit set.  i.e. it needs accumulating across the migration pool,
+ *   rather than intersecting.
  */
 
 /* Intel-defined CPU features, CPUID level 0x00000001.edx, word 0 */
@@ -248,7 +253,7 @@ XEN_CPUFEATURE(IBRS_ALWAYS,   8*32+16) /*S  IBRS preferred always on */
 XEN_CPUFEATURE(STIBP_ALWAYS,  8*32+17) /*S  STIBP preferred always on */
 XEN_CPUFEATURE(IBRS_FAST,     8*32+18) /*S  IBRS preferred over software options */
 XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection */
-XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
+XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S| EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!  MSR_VIRT_SPEC_CTRL.SSBD */
@@ -263,7 +268,7 @@ XEN_CPUFEATURE(AVX512_4FMAPS, 9*32+ 3) /*A  AVX512 Multiply Accumulation Single
 XEN_CPUFEATURE(FSRM,          9*32+ 4) /*A  Fast Short REP MOVS */
 XEN_CPUFEATURE(AVX512_VP2INTERSECT, 9*32+8) /*a  VP2INTERSECT{D,Q} insns */
 XEN_CPUFEATURE(SRBDS_CTRL,    9*32+ 9) /*   MSR_MCU_OPT_CTRL and RNGDS_MITG_DIS. */
-XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*!A VERW clears microarchitectural buffers */
+XEN_CPUFEATURE(MD_CLEAR,      9*32+10) /*!A| VERW clears microarchitectural buffers */
 XEN_CPUFEATURE(RTM_ALWAYS_ABORT, 9*32+11) /*! RTM disabled (but XBEGIN wont fault) */
 XEN_CPUFEATURE(TSX_FORCE_ABORT, 9*32+13) /* MSR_TSX_FORCE_ABORT.RTM_ABORT */
 XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
@@ -292,7 +297,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(NO_NEST_BP,         11*32+ 0) /*A  No Nested Data Breakpoints */
-XEN_CPUFEATURE(FS_GS_NS,           11*32+ 1) /*S  FS/GS base MSRs non-serialising */
+XEN_CPUFEATURE(FS_GS_NS,           11*32+ 1) /*S| FS/GS base MSRs non-serialising */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
 XEN_CPUFEATURE(AUTO_IBRS,          11*32+ 8) /*S  Automatic IBRS */
@@ -343,7 +348,7 @@ XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing
 XEN_CPUFEATURE(SBDR_SSDP_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
 XEN_CPUFEATURE(FBSDP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
 XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
-XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*!A Fill Buffers cleared by VERW */
+XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*!A| Fill Buffers cleared by VERW */
 XEN_CPUFEATURE(FB_CLEAR_CTRL,      16*32+18) /*   MSR_OPT_CPU_CTRL.FB_CLEAR_DIS */
 XEN_CPUFEATURE(RRSBA,              16*32+19) /*!  Restricted RSB Alternative */
 XEN_CPUFEATURE(BHI_NO,             16*32+20) /*A  No Branch History Injection  */
@@ -353,7 +358,7 @@ XEN_CPUFEATURE(PBRSB_NO,           16*32+24) /*A  No Post-Barrier RSB prediction
 XEN_CPUFEATURE(GDS_CTRL,           16*32+25) /*   MCU_OPT_CTRL.GDS_MIT_{DIS,LOCK} */
 XEN_CPUFEATURE(GDS_NO,             16*32+26) /*A  No Gather Data Sampling */
 XEN_CPUFEATURE(RFDS_NO,            16*32+27) /*A  No Register File Data Sampling */
-XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A Register File(s) cleared by VERW */
+XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A| Register File(s) cleared by VERW */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index bf3f9ec01e6e..1fb76f664529 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -21,7 +21,7 @@ class State(object):
         self.names = {}  # Value => Name mapping
         self.values = {} # Name => Value mapping
         self.raw = {
-            '!': set(),
+            '!': set(), '|': set(),
             'A': set(), 'S': set(), 'H': set(),
             'a': set(), 's': set(), 'h': set(),
         }
@@ -48,7 +48,7 @@ def parse_definitions(state):
     feat_regex = re.compile(
         r"^XEN_CPUFEATURE\(([A-Z0-9_]+),"
         "\s+([\s\d]+\*[\s\d]+\+[\s\d]+)\)"
-        "\s+/\*([\w!]*) .*$")
+        "\s+/\*([\w!|]*) .*$")
 
     word_regex = re.compile(
         r"^/\* .* word (\d*) \*/$")
@@ -415,6 +415,8 @@ def write_results(state):
 
 #define INIT_SPECIAL_FEATURES { \\\n%s\n}
 
+#define INIT_SIMPLE_OR { \\\n%s\n}
+
 #define INIT_PV_DEF_FEATURES { \\\n%s\n}
 
 #define INIT_PV_MAX_FEATURES { \\\n%s\n}
@@ -436,6 +438,7 @@ def write_results(state):
        next(featureset_to_uint32s(state.common_1d, 1)),
        format_uint32s(state, state.names.keys(), 4),
        format_uint32s(state, state.raw['!'], 4),
+       format_uint32s(state, state.raw['|'], 4),
        format_uint32s(state, state.pv_def, 4),
        format_uint32s(state, state.pv_max, 4),
        format_uint32s(state, state.hvm_shadow_def, 4),

base-commit: be5b08dd6ea6ef0f01caf537bdae125fa66a2230
-- 
2.30.2


