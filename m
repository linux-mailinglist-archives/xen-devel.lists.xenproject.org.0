Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CCCA042A1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 15:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866390.1277718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAeR-0007Wv-VU; Tue, 07 Jan 2025 14:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866390.1277718; Tue, 07 Jan 2025 14:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAeR-0007Ub-Sp; Tue, 07 Jan 2025 14:33:47 +0000
Received: by outflank-mailman (input) for mailman id 866390;
 Tue, 07 Jan 2025 14:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVAeQ-0007Ry-Ta
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 14:33:46 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66c4d068-cd04-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 15:33:46 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436202dd730so111878555e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 06:33:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c639sm593718505e9.31.2025.01.07.06.33.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 06:33:45 -0800 (PST)
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
X-Inumbo-ID: 66c4d068-cd04-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736260425; x=1736865225; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ut97ADWYFWCwK59oH2ymgDLqpDldkiEh2jNuUZ/O1nc=;
        b=cn+nBphlgQ3yf0JN2yLYaRcdXUcL3UsdYNz2YHpucJOUGRwDNMmSYLh0NvYg2xDHxV
         F6SRRzo3t/2ZNJMrRwxT2ASZJqodaC3B5HofN/nrgbRQTIWMbNKT1fO4gcvVFU9xxDWe
         buAiC9GSQxTgs5UpCKlpI+s9F3/6O3o+8VqKsjpPnTmYOUCkRsoYdRyHqzQjGFyGdcnI
         qOzh7Do44qfHbR2fvDK+kJTuiB3ViMpUxpKhdS71ZnY/sykkQ7jo1egjzar+PyHCZGU7
         0NKiqh/S2j8hlNF18bSU0gacOh2MnSJ+RdQ6QMF1qmW5nU4gkCCLoDyymOM64TAtgl/N
         2BDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736260425; x=1736865225;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ut97ADWYFWCwK59oH2ymgDLqpDldkiEh2jNuUZ/O1nc=;
        b=SpFHWzavtP5FjBhuRE9/bX0JWRazVzt5MMAqkxZVD3KwTpsaAusHVvC+steFaFno2T
         lsgMswXzhEc/aXd70QXRXB4KKdwYJ6gNUdaA0QqKBZH/bD3zbMeRQi/Vc7/bskzoaJ3n
         IP8+AXgS9iipL4gDoRHjhvcYURlkawjCBLkNXETzVlFBn2ynESE1SpaOtSAhs1mOhfZy
         lT9zr/0JL2vSjzNhaHK7gABTMU33E3L/mXmuIyHTDDmmQlu3ECPADx2KRnyirWO5baFC
         Rdufky1MctlDWP8vJMpWumCRyQcajjM3QmMrOyaVeFAHUlBcCqn/43WP1T081umxi0hd
         HFLg==
X-Gm-Message-State: AOJu0YwvyKPmjwLEyz8YpU7r7sLSecoDGLdc+1+MXLD4ufj+gEFEI/qj
	uR6lD1/LGtGsSnw9PPV3BRJoktTdYoXtEeQ+tXv8/qf2JorK5tLvD3xAtNL+NVHlf43IG6K/2k0
	=
X-Gm-Gg: ASbGnctBcO5PZxGCsVr5BGRDr9X+tSNwdcZqqWAr/DmyhbhvP9C9Q7O0lgvsMT1S+FP
	UKSYH4gCpzTOjZ3QQSFpAtg1L5tHLAL8GTlie7iNsnho/kggS43XTVwyfR/gZ03Tnl69RuXTW9w
	4+8fVXybANA+WOe6Gd1jeNtPcA/znY47wLnDZChKRWMZjbUL9Gs0pqAJaoSX9JPUHA+UuoikviB
	U8YwTXgZlB3skw2dqmJNZ3dKXWt7V5WrTtz/o03Up8CkNgGACKzDcpZqfOn+u3jLQ5iJrlD044t
	npaFmIUstKKfSi1Eq84HkkRnBbNj+S5d2DAccs5nNA==
X-Google-Smtp-Source: AGHT+IHUGgVWH2JAP0p+TPewdO8msvVuiF2XBJbv51PW3qMIwCDyUd4zvIgVbo5xqFs2uXA/8TuMPA==
X-Received: by 2002:a05:600c:1c21:b0:436:aaf:7eb9 with SMTP id 5b1f17b1804b1-43668b5dfcbmr456590825e9.20.1736260425520;
        Tue, 07 Jan 2025 06:33:45 -0800 (PST)
Message-ID: <81428267-e963-4403-989d-d96fb0b59ffc@suse.com>
Date: Tue, 7 Jan 2025 15:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: correct put_fpu()'s segment selector handling
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All selector fields under ctxt->regs are (normally) poisoned in the HVM
case, and the four ones besides CS and SS are potentially stale for PV.
Avoid using them in the hypervisor incarnation of the emulator, when
trying to cover for a missing ->read_segment() hook.

To make sure there's always a valid ->read_segment() handler for all HVM
cases, add a respective function to shadow code, even if it is not
expected for FPU insns to be used to update page tables.

Fixes: 0711b59b858a ("x86emul: correct FPU code/data pointers and opcode handling")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The code comment may want adjusting in the course of FRED work.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -287,11 +287,29 @@ hvm_emulate_cmpxchg(enum x86_segment seg
     return rc;
 }
 
+static int cf_check
+hvm_emulate_read_segment(enum x86_segment seg,
+                         struct segment_register *reg,
+                         struct x86_emulate_ctxt *ctxt)
+{
+    struct sh_emulate_ctxt *sh_ctxt =
+        container_of(ctxt, struct sh_emulate_ctxt, ctxt);
+    const struct segment_register *sreg = hvm_get_seg_reg(seg, sh_ctxt);
+
+    if ( IS_ERR(sreg) )
+        return -PTR_ERR(sreg);
+
+    *reg = *sreg;
+
+    return X86EMUL_OKAY;
+}
+
 static const struct x86_emulate_ops hvm_shadow_emulator_ops = {
     .read       = hvm_emulate_read,
     .insn_fetch = hvm_emulate_insn_fetch,
     .write      = hvm_emulate_write,
     .cmpxchg    = hvm_emulate_cmpxchg,
+    .read_segment = hvm_emulate_read_segment,
 };
 
 const struct x86_emulate_ops *shadow_init_emulation(
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -447,14 +447,37 @@ static void put_fpu(
         if ( state->ea.type == OP_MEM )
         {
             aux.dp = state->ea.mem.off;
-            if ( ops->read_segment &&
-                 ops->read_segment(state->ea.mem.seg, &sreg,
-                                   ctxt) == X86EMUL_OKAY )
+            if ( state->ea.mem.seg == x86_seg_cs )
+                aux.ds = aux.cs;
+            else if ( ops->read_segment &&
+                      ops->read_segment(state->ea.mem.seg, &sreg,
+                                        ctxt) == X86EMUL_OKAY )
                 aux.ds = sreg.sel;
+#ifdef __XEN__
+            /*
+             * While generally the expectation is that input structures are
+             * fully populated, the selector fields under ctxt->regs normally
+             * aren't set, with the exception of CS and SS for PV domains.
+             * Read the real selector registers for PV, and assert that HVM
+             * invocations always set a properly functioning ->read_segment()
+             * hook.
+             */
+            else if ( is_pv_vcpu(current) )
+                switch ( state->ea.mem.seg )
+                {
+                case x86_seg_ds: aux.ds = read_sreg(ds);  break;
+                case x86_seg_es: aux.ds = read_sreg(es);  break;
+                case x86_seg_fs: aux.ds = read_sreg(fs);  break;
+                case x86_seg_gs: aux.ds = read_sreg(gs);  break;
+                case x86_seg_ss: aux.ds = ctxt->regs->ss; break;
+                default:         ASSERT_UNREACHABLE();    break;
+                }
+            else
+                ASSERT_UNREACHABLE();
+#else
             else
                 switch ( state->ea.mem.seg )
                 {
-                case x86_seg_cs: aux.ds = ctxt->regs->cs; break;
                 case x86_seg_ds: aux.ds = ctxt->regs->ds; break;
                 case x86_seg_es: aux.ds = ctxt->regs->es; break;
                 case x86_seg_fs: aux.ds = ctxt->regs->fs; break;
@@ -462,6 +485,7 @@ static void put_fpu(
                 case x86_seg_ss: aux.ds = ctxt->regs->ss; break;
                 default:         ASSERT_UNREACHABLE();    break;
                 }
+#endif
             aux.dval = true;
         }
         ops->put_fpu(ctxt, X86EMUL_FPU_none, &aux);

