Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983619C5B23
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 16:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834706.1250486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsNQ-0006rW-0x; Tue, 12 Nov 2024 15:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834706.1250486; Tue, 12 Nov 2024 15:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAsNP-0006pU-U1; Tue, 12 Nov 2024 15:00:19 +0000
Received: by outflank-mailman (input) for mailman id 834706;
 Tue, 12 Nov 2024 15:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAsNO-0005Nh-Fm
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 15:00:18 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2bd0d6c-a106-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 16:00:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so54933045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 07:00:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970d4fsm15943613f8f.5.2024.11.12.07.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 07:00:14 -0800 (PST)
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
X-Inumbo-ID: d2bd0d6c-a106-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzIiLCJoZWxvIjoibWFpbC13bTEteDMzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQyYmQwZDZjLWExMDYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDIzNjE1LjExNTIzMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731423614; x=1732028414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2e73lNpqWAQaerd/QqjxQ4QTEF6fQc4PS73hY19V+HU=;
        b=O3et9FqtEJNDsiAPMa8csFZDpmlfRSWNngaH9fMs65bUTcZtAWUJPpNyKmTVnQCRrr
         ub78j4f4M4ddkKLJTebqQBXPwoSaL8XrAkPr7NjtBOBnZCEaScgV2lLUeKcuCfbBg+mf
         gxd/puXol131YaVaAigCcBpRt2CpVpjMn0PpYDqB4SCQKjX0jr5otSVUqctS7Po5d1nM
         xDBoDXMPQlrEei3ayvqK44hOMuRBdH0eDTqUDFoe23WcIW1cNnZ9pzppX93scid0Mmkz
         b4r3vEY+YD6Qzw0nNvDaTd7pKqmctaiPG4ZdpZVWRWMngs/SFSMYsqdW9d/Gu3h9iudO
         nVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731423614; x=1732028414;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e73lNpqWAQaerd/QqjxQ4QTEF6fQc4PS73hY19V+HU=;
        b=XmCutP59hqrUAJbYMv2PST3W5u/mpiqF8Xq9CE2g4Vy101I5lI3di5Z8EsqzMAkqQj
         dX8oDUr+zvABqK1oFSe7kTtJ52dJQ53P+AcmmJwslqXfsA5Z0i1BCn1bzn0g8a8G5h+Q
         zJnSiVSKhGRu7WYMxl0ylf2CtvsMlY4KT+gB+mSxs7I4ZsjeYKLRVW2KDRm4nYRRjA13
         cimODBpAcE833qQjJg7WcPrfMwva4FdLZvCAtSlx+uNUEbX4L0qQc/gNOuSOaFUshi8e
         GItG0JfaNQvyya3pjyRGeJYNXFyRCYgp5pqMDByralof5/LmZJKsXOdjxSSpv3nL5wdh
         b8gg==
X-Gm-Message-State: AOJu0Yx0/HbW/AAOHZhSP/WGUGSMlnDheojOOOrIHM9Wn8icDUks9G1t
	YOwZ/5rTcyCjc2RoIwL0G5m06sE+8Z3PIhZkaHnAvCXotbUCR9ssAEOVHN9HU6yUywpz5N17MSk
	=
X-Google-Smtp-Source: AGHT+IF67DGfviVwmtxPkZ3i+sojSiv+/cZPnownk4sLN26pXgCUrSd3iPqqJI6f11YwAxrBj2WyfQ==
X-Received: by 2002:a05:6000:480b:b0:37d:45f0:dd08 with SMTP id ffacd0b85a97d-381f186731amr14552355f8f.11.1731423614413;
        Tue, 12 Nov 2024 07:00:14 -0800 (PST)
Message-ID: <39de64e1-c615-4ec3-ad05-ff99f27a8e30@suse.com>
Date: Tue, 12 Nov 2024 16:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86emul: ignore VEX.W for BMI{1,2} insns in 32-bit mode
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
Content-Language: en-US
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
In-Reply-To: <367ba117-f376-433b-bd70-586d7519d94c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While result values and other status flags are unaffected as long as we
can ignore the case of registers having their upper 32 bits non-zero
outside of 64-bit mode, EFLAGS.SF may obtain a wrong value when we
mistakenly re-execute the original insn with VEX.W set.

Note that the memory access, if any, is correctly carried out as 32-bit
regardless of VEX.W. Internal state also isn't leaked, as the field the
memory value is read into (which is then wrongly accessed as a 64-bit
quantity when executing the stub) is pre-initialized to zero.

Fixes: 771daacd197a ("x86emul: support BMI1 insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2021,6 +2021,30 @@ int main(int argc, char **argv)
               (EFLAGS_ALWAYS_SET | X86_EFLAGS_SF) ||
              !check_eip(blsr) )
             goto fail;
+
+#ifdef __x86_64__
+        /* Re-test with VEX.W set while emulating 32-bit mode. */
+        ctxt.lma       = 0;
+        ctxt.addr_size = 32;
+        ctxt.sp_size   = 32;
+
+        memcpy(instr, blsr, blsr_end - blsr);
+        instr[2] |= 0x80;
+        regs.rip = (unsigned long)&instr[0];
+        regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_OF | X86_EFLAGS_ZF | \
+                      X86_EFLAGS_CF;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) || regs.ecx != 0xfedcba90 ||
+             (regs.eflags & (EFLAGS_MASK & ~(X86_EFLAGS_AF | X86_EFLAGS_PF))) !=
+              (EFLAGS_ALWAYS_SET | X86_EFLAGS_SF) ||
+             (regs.rip != (unsigned long)&instr[blsr_end - blsr]) )
+            goto fail;
+
+        ctxt.lma       = 1;
+        ctxt.addr_size = 64;
+        ctxt.sp_size   = 64;
+#endif
+
         printf("okay\n");
     }
     else
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6896,6 +6896,8 @@ x86_emulate(
         *pvex = vex;
         pvex->b = 1;
         pvex->r = 1;
+        if ( !mode_64bit() )
+            pvex->w = 0;
         pvex->reg = 0xf; /* rAX */
         buf[3] = b;
         buf[4] = 0x09; /* reg=rCX r/m=(%rCX) */
@@ -6930,6 +6932,8 @@ x86_emulate(
         *pvex = vex;
         pvex->b = 1;
         pvex->r = 1;
+        if ( !mode_64bit() )
+            pvex->w = 0;
         pvex->reg = 0xf; /* rAX */
         buf[3] = b;
         buf[4] = (modrm & 0x38) | 0x01; /* r/m=(%rCX) */


