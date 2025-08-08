Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF606B1F0A4
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 00:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075293.1437723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukVRk-00029e-0B; Fri, 08 Aug 2025 22:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075293.1437723; Fri, 08 Aug 2025 22:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukVRj-00028Q-Sl; Fri, 08 Aug 2025 22:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1075293;
 Fri, 08 Aug 2025 22:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukVRi-00028K-1B
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 22:20:18 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc7fa2d7-74a5-11f0-a324-13f23c93f187;
 Sat, 09 Aug 2025 00:20:17 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so22935735e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 15:20:16 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5843021sm168998675e9.3.2025.08.08.15.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 15:20:15 -0700 (PDT)
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
X-Inumbo-ID: dc7fa2d7-74a5-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754691616; x=1755296416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1kWj+Bc4KrYJW7fHKpr7xe5mQtHUF28JS4QCE9FHKg=;
        b=Tii0DgkMlIYOOVI0mimUTkIYgVfgromxNfPXV0UwzqsrleevcT4ZhR8mgKP9LrnCxA
         75Fm9Reh8hFygX4e5cfABnksJcixipTi/0ijNXNvEcLEje09zCTfRKG1iOKDqBMhB5M6
         N+ElgKo8Yz2W/uYLbORGwbN3G8Tep+fQ4ems4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754691616; x=1755296416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1kWj+Bc4KrYJW7fHKpr7xe5mQtHUF28JS4QCE9FHKg=;
        b=l97IYR8QZR7dMqsbJMoWtHNtM3QCit4+eJ5ll2gWA/vyHhl9x/IXRpwOb7wXDHjaE/
         T4hbf87SQPn7syoOTp3nULUjbJw1PhI7LAdUJaJpY+GGaiYtYRtL0UUOz2aqkQhYw7nX
         gXS0bufpTIYaDqo6hg/ZEuLfDTDQ5D7jJGT9R8BzxEEfoENEt77GUW9gXyL3eBR/vRB7
         vm7UmaVlAh6nVkANGYsp6q8og3dO+LZJgYv15+5UjcudHTPOP1ApGWrlgsJyGoYbaIdm
         a6wMPS7k4h+kbjYZB09SyD7SoKhDRobmS+fFg1JbUgauweOuqz3+OF0FxE+aQy+tmLLR
         gwsA==
X-Gm-Message-State: AOJu0Yyk+J4hEDVNkVyGlL3yFo/8/JPtBnGhDVqmUZV9TiCtSFvA5y8P
	P1+tVulf2QOr5EZBLhzbgW11SKd1Z8CJQ2/zzNcZztYZeL5uZ9pHiVJE6vpnfqtJfrxEA4Nx3Wf
	Bb1g2h2I=
X-Gm-Gg: ASbGncs95XPkBSXZzfHG7/FOPXnUuhpynFsZy1sCEeXU9YvQIh5h1pCwY349SpuGWf2
	PIOAZh4SY1rMsQDcltQr5E28qXrJ8gdG69LD1LufI/H8PYD3He9S9jUmZI2Lt8aZhSYrUyZvVuZ
	kOUq8HD//n6WbHocKeV8ZXrdtJvMLo/2sF+D0akY0vRxxuBmtBu/xxEE+JXYS7kvXkZrFih52Er
	7KNwhfel9Q70eyYD6KAxdg5Wg5heBCKaCR/HaNdjmvUNslSR114G43tSofe0ezx9lnzG+IFA/ln
	iRdGud+7X47erWvI2/A23oHiEC3S7cgyJ8Qhge5oONPo1LHDJBapopGFdszWrUDdTTBOT1lZYGh
	hUW6kfDbXH+XRjaCPoIcYQoO77vsM0kwrs66Q60vgv1QBCQQ/eSKWKW9AqCzQ4ukf9iZjeBpFNR
	fL
X-Google-Smtp-Source: AGHT+IHlHxElapDMSIPic5DXWAqyyQx0siuGpbJGWcIRtiF1mpMpy9DWchBPoQdu8yhTgXcZKPqCEA==
X-Received: by 2002:a05:600c:1c2a:b0:459:d8c2:80b2 with SMTP id 5b1f17b1804b1-459f4f3dc83mr35257895e9.7.1754691615817;
        Fri, 08 Aug 2025 15:20:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] RFC x86/msr: Use WRMSRNS $imm when available
Date: Fri,  8 Aug 2025 23:20:13 +0100
Message-Id: <20250808222013.1071291-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This is on top of the FRED series for the wrmsrns() cleanup, but otherwise
unrelated.

The code generation isn't entirely ideal

  Function                                     old     new   delta
  init_fred                                    255     274     +19
  vmx_set_reg                                  248     256      +8
  enter_state_helper.cold                     1014    1018      +4
  __start_xen                                 8893    8897      +4

but made worse by the the prior codegen for wrmsrns(MSR_STAR, ...) being mad:

  mov    $0xc0000081,%ecx
  mov    $0xe023e008,%edx
  movabs $0xe023e00800000000,%rax
  cs wrmsr

The two sources of code expansion come from the compiler not being able to
construct %eax and %edx separately, and not being able propagate constants.

Loading 0 is possibly common enough to warrant another specialisation where we
can use "a" (0), "d" (0) and forgo the MOV+SHR.

I'm probably overthinking things.  The addition will be in the noise in
practice, and Intel are sure the advantage of MSR_IMM will not be.
---
 xen/arch/x86/include/asm/alternative.h      |  7 ++++
 xen/arch/x86/include/asm/msr.h              | 39 ++++++++++++++++++++-
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 0482bbf7cbf1..fe87b15ec72c 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -151,6 +151,13 @@ extern void alternative_instructions(void);
         ALTERNATIVE(oldinstr, newinstr, feature)                        \
         :: input )
 
+#define alternative_input_2(oldinstr, newinstr1, feature1,              \
+                            newinstr2, feature2, input...)              \
+    asm_inline volatile (                                               \
+        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
+                      newinstr2, feature2)                              \
+        :: input )
+
 /* Like alternative_input, but with a single output argument */
 #define alternative_io(oldinstr, newinstr, feature, output, input...)   \
     asm_inline volatile (                                               \
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 01f510315ffe..434fcac854e1 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -38,9 +38,46 @@ static inline void wrmsrl(unsigned int msr, uint64_t val)
         wrmsr(msr, lo, hi);
 }
 
+/*
+ * Non-serialising WRMSR with a compile-time constant index, when available.
+ * Falls back to plain WRMSRNS, or to a serialising WRMSR.
+ */
+static always_inline void __wrmsrns_imm(uint32_t msr, uint64_t val)
+{
+    /*
+     * For best performance, WRMSRNS %r64, $msr is recommended.  For
+     * compatibility, we need to fall back to plain WRMSRNS, or to WRMSR.
+     *
+     * The combined ABI is awkward, because WRMSRNS $imm takes a single r64,
+     * whereas WRMSR{,NS} takes a split edx:eax pair.
+     *
+     * Always use WRMSRNS %rax, $imm, because it has the most in common with
+     * the legacy forms.  When MSR_IMM isn't available, emit setup logic for
+     * %ecx and %edx too.
+     */
+    alternative_input_2(
+        "mov $%c[msr], %%ecx\n\t"
+        "mov %%rax, %%rdx\n\t"
+        "shr $32, %%rdx\n\t"
+        ".byte 0x2e; wrmsr",
+
+        /* WRMSRNS %rax, $msr */
+        ".byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]", X86_FEATURE_MSR_IMM,
+
+        "mov $%c[msr], %%ecx\n\t"
+        "mov %%rax, %%rdx\n\t"
+        "shr $32, %%rdx\n\t"
+        ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
+
+        [msr] "i" (msr), "a" (val) : "rcx", "rdx");
+}
+
 /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
-static inline void wrmsrns(uint32_t msr, uint64_t val)
+static always_inline void wrmsrns(uint32_t msr, uint64_t val)
 {
+    if ( __builtin_constant_p(msr) )
+        return __wrmsrns_imm(msr, val);
+
     /*
      * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
      * prefix to avoid a trailing NOP.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cd778586f10..af69cf3822eb 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -352,6 +352,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 XEN_CPUFEATURE(UC_LOCK_DIS,        13*32+ 6) /*   UC-lock disable */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
+XEN_CPUFEATURE(MSR_IMM,            14*32+ 5) /*   {RD,WR}MSR $imm32 */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
-- 
2.39.5


