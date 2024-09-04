Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED6C96BC4F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:29:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790210.1199931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp8m-0007g1-5E; Wed, 04 Sep 2024 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790210.1199931; Wed, 04 Sep 2024 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slp8m-0007eD-2a; Wed, 04 Sep 2024 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 790210;
 Wed, 04 Sep 2024 12:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slp8k-0005XG-2Q
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:29:38 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 587f3fc0-6ab9-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 14:29:35 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so751737a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 05:29:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988fea68dsm797349966b.26.2024.09.04.05.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 05:29:34 -0700 (PDT)
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
X-Inumbo-ID: 587f3fc0-6ab9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725452975; x=1726057775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YijSHiNzus32wXAJ3o2E5zYA7znHR4DD0weH2KTXGww=;
        b=fScOLy8GDjNifFIlebTty6CR9MKPslCVPy44UFJ9Jro/OoirkeuqcvLfvfHjkiumXO
         /Wh0mQ4f0zOTlt4WOAOKk0HP598zhkG+ywOmZbL/jH34KBteCrLXE2oPn+O4T4OufqC0
         65QLTYFK/6U/HoD10YlG4LHqbAEwx6o6jXf3Z6Or62SS2oOGiDXriRPZfH/pINm2lCoy
         PCkjhqRhK76TeKTM6o7HmYaGSV7YR0wt9Eu9I+4v6OJ0ky/UcCYRh1ehVte3M5etxYpW
         x2fXxZ68fBceMNfri9xp93o7vuY7svOYaaNPGjhu2QWcc7VO1w95RmFfBZ7xKoRDy/Rb
         jiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452975; x=1726057775;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YijSHiNzus32wXAJ3o2E5zYA7znHR4DD0weH2KTXGww=;
        b=Z+9FKgoGRYZi/o43+r9TxSM16GphkBp1DOwAKpdAyxUum/tSZTmJePsE7GMzA9eenl
         ukd87cbZ8p1LLm1uq16al1O2+KuNdBu/HgKmtPmJ0SXSKWOt0dMFKMzJaMgvpAm99Gg4
         4SR/adYAyLku38BcCuVu6r+jnUtvj4hkTDhehr9FawPfrpuYVfQUd29A7iTZI0iFMXwA
         I6Rb1/XKXDhfD1VrfEfr8dUMXPVb5d5Q6IwZOhjKa/gJIAuvzDMaDHGkWxuFYsnTJOBU
         xlZ2dpvJSVFa4C5ozUPebuXT8RPBTuPJMoGa/Y68mHG8S+51B6YYa5/h7V/fKUYvjfX5
         wdOg==
X-Gm-Message-State: AOJu0Yz1senVG5Qfx9VKVRpaHtY1h2QvACcafCGBG2MQWtNCwAYoH4PY
	5vYdBgU1WRApSgq4u9i1YZmwQyg4j8gbPkID3CUeZtVqplPHbMWDaTgxh7NVb3KGA7s5zC6cR80
	=
X-Google-Smtp-Source: AGHT+IFzLgJ4w4NNcs7eX3EL3xkm/3rUQeqiQtXmBemQM80W8sVFkk/qRnkcUNTCjk+1+dw/yEm3oA==
X-Received: by 2002:a17:907:f1df:b0:a86:97c0:9bb3 with SMTP id a640c23a62f3a-a8a3f49dcfcmr184003766b.51.1725452975108;
        Wed, 04 Sep 2024 05:29:35 -0700 (PDT)
Message-ID: <ffecafcd-5a71-4655-8e35-6e1f0f8ecdc1@suse.com>
Date: Wed, 4 Sep 2024 14:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 5/7] x86emul: support USER_MSR instructions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
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
In-Reply-To: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While UWRMSR probably isn't of much use as long as we don't support
UINTR, URDMSR may well be useful to guests even without that (depending
on what OSes are willing to permit access to).

Since the two VEX encodings introduce a lonely opcode point in map 7,
for now don't bother introducing a full 256-entry table.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The retaining of (possible) #PF from the bitmap access is "speculative"
(the spec doesn't mention #PF as a possible exception; conceivably this
might also need converting to #GP).

I'm a little wary of the "MSRs Writeable by UWRMSR" table that the spec
has, and that our code thus also enforces: As new MSRs are added to that
table, we'll need piecemeal updates to that switch() statement.

The choice of using APERF in the test harness is connected to the also
pending RDPRU patch, where the register needs handling anyway.
---
v5: Correct ModR/M.reg check for VEX-encoded forms. Cosmetic test
    harness adjustment. Re-base.
v4: MSR index input regs are 64-bit (albeit only the APX spec has it
    this way for now).
v3: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -864,7 +864,9 @@ static const struct {
     { { 0xf6 }, { 2, 2 }, T, R, pfx_66 }, /* adcx */
     { { 0xf6 }, { 2, 2 }, T, R, pfx_f3 }, /* adox */
     { { 0xf8 }, { 2, 2 }, F, W, pfx_66 }, /* movdir64b */
+    { { 0xf8, 0xc0 }, { 0, 2 }, F, N, pfx_f3 }, /* uwrmsr */
     { { 0xf8 }, { 2, 2 }, F, W, pfx_f3 }, /* enqcmds */
+    { { 0xf8, 0xc0 }, { 0, 2 }, F, N, pfx_f2 }, /* urdmsr */
     { { 0xf8 }, { 2, 2 }, F, W, pfx_f2 }, /* enqcmd */
     { { 0xf9 }, { 2, 2 }, F, W }, /* movdiri */
 };
@@ -1516,6 +1518,9 @@ static const struct vex {
     { { 0xde }, 3, T, R, pfx_66, W0, L0 }, /* vsm3rnds2 */
     { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
     { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
+}, vex_map7[] = {
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* uwrmsr */
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* urdmsr */
 };
 
 static const struct {
@@ -1525,6 +1530,10 @@ static const struct {
     { vex_0f,   ARRAY_SIZE(vex_0f) },
     { vex_0f38, ARRAY_SIZE(vex_0f38) },
     { vex_0f3a, ARRAY_SIZE(vex_0f3a) },
+    { NULL,     0 }, /* map 4 */
+    { NULL,     0 }, /* map 5 */
+    { NULL,     0 }, /* map 6 */
+    { vex_map7, ARRAY_SIZE(vex_map7) },
 };
 
 static const struct xop {
@@ -2425,7 +2434,8 @@ void predicates_test(void *instr, struct
 
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W0) )
                 {
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2435,7 +2445,8 @@ void predicates_test(void *instr, struct
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
                     {
                         ptr[-1] |= 4;
-                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                        memcpy(ptr, vex[x].tbl[t].opc,
+                               MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
                                 vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
@@ -2446,7 +2457,8 @@ void predicates_test(void *instr, struct
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W1) )
                 {
                     ptr[-1] = 0xf8 | vex[x].tbl[t].pfx;
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2456,7 +2468,8 @@ void predicates_test(void *instr, struct
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
                     {
                         ptr[-1] |= 4;
-                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                        memcpy(ptr, vex[x].tbl[t].opc,
+                               MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
                                 vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -674,6 +674,7 @@ static int blk(
 
 #ifdef __x86_64__
 static unsigned long gs_base, gs_base_shadow;
+static unsigned long uintr_timer;
 #endif
 
 static int read_segment(
@@ -708,6 +709,15 @@ static int write_segment(
 
     return X86EMUL_OKAY;
 }
+
+static const uint8_t __attribute__((aligned(0x1000))) umsr_bitmap[0x1000] = {
+#define RD(msr) [(msr) >> 3] = 1 << ((msr) & 7)
+#define WR(msr) [0x800 + ((msr) >> 3)] = 1 << ((msr) & 7)
+    RD(0x000000e8), /* APERF */
+    WR(0x00001b00), /* UINTR_TIMER */
+#undef WR
+#undef RD
+};
 #endif
 
 static int read_msr(
@@ -717,10 +727,22 @@ static int read_msr(
 {
     switch ( reg )
     {
+#ifdef __x86_64__
+    case 0x0000001c: /* USER_MSR_CTL */
+        *val = (unsigned long)umsr_bitmap | 1;
+        return X86EMUL_OKAY;
+#endif
+
     case 0x0000002f: /* BARRIER */
         *val = 0;
         return X86EMUL_OKAY;
 
+    case 0x000000e8: /* APERF */
+#define APERF_LO_VALUE 0xAEAEAEAE
+#define APERF_HI_VALUE 0xEAEAEAEA
+        *val = ((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE;
+        return X86EMUL_OKAY;
+
     case 0xc0000080: /* EFER */
         *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
         return X86EMUL_OKAY;
@@ -756,6 +778,12 @@ static int write_msr(
 {
     switch ( reg )
     {
+    case 0x00001b00: /* UINTR_TIMER */
+        if ( ctxt->addr_size < 64 )
+            break;
+        uintr_timer = val;
+        return X86EMUL_OKAY;
+
     case 0xc0000101: /* GS_BASE */
         if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
             break;
@@ -1555,6 +1583,63 @@ int main(int argc, char **argv)
          (gs_base != 0x0000222244446666UL) ||
          (gs_base_shadow != 0x0000111122224444UL) )
         goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing urdmsr %rdx,%rcx...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8; instr[4] = 0xd1;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rdx = 0x000000e8UL; /* APERF */
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[5]) ||
+         (regs.rcx != (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing urdmsr $0xe8,%rdx...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7b; instr[3] = 0xf8; instr[4] = 0xc2;
+    instr[5] = 0xe8; instr[6] = 0; instr[7] = 0; instr[8] = 0;
+    regs.rip = (unsigned long)&instr[0];
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (regs.rdx != (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing uwrmsr %rdi,%rsi...");
+    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8; instr[4] = 0xf7;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0x00001b00UL; /* UINTR_TIMER */
+    regs.rdi = 0x0011223344556677UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[5]) ||
+         (uintr_timer != 0x0011223344556677UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing uwrmsr %rsi,$0x1b00...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7a; instr[3] = 0xf8; instr[4] = 0xc6;
+    instr[5] = 0x00; instr[6] = 0x1b; instr[7] = 0; instr[8] = 0;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0x8877665544332211UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (uintr_timer != 0x8877665544332211UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing uwrmsr %rsi,$0x1b01...");
+    instr[5] = 0x01; /* UARCH_MISC_CTL (derived from UINTR_TIMER) */
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_EXCEPTION) ||
+         (regs.rip != (unsigned long)&instr[0]) ||
+         (uintr_timer != 0x8877665544332211UL) )
+        goto fail;
 
     emulops.write_msr     = NULL;
 #endif
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -24,6 +24,10 @@
 #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
 #define  APIC_BASE_ADDR_MASK                _AC(0x000ffffffffff000, ULL)
 
+#define MSR_USER_MSR_CTL                    0x0000001c
+#define  USER_MSR_ENABLE                    (_AC(1, ULL) <<  0)
+#define  USER_MSR_ADDR_MASK                 0xfffffffffffff000ULL
+
 #define MSR_BARRIER                         0x0000002f
 
 #define MSR_TEST_CTRL                       0x00000033
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -903,7 +903,7 @@ decode_0f38(struct x86_emulate_state *s,
     {
     case 0x00 ... 0xef:
     case 0xf2 ... 0xf5:
-    case 0xf7 ... 0xf8:
+    case 0xf7:
     case 0xfa ... 0xff:
         s->op_bytes = 0;
         /* fall through */
@@ -948,6 +948,18 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
         break;
 
+    case 0xf8:
+        if ( s->modrm_mod == 3 ) /* u{rd,wr}msr */
+        {
+            s->desc = DstMem | SrcReg | Mov;
+            s->op_bytes = 8;
+            s->simd_size = simd_none;
+        }
+        else /* movdir64b / enqcmd{,s} */
+            s->op_bytes = 0;
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
     default:
         s->op_bytes = 0;
         break;
@@ -1246,6 +1258,16 @@ int x86emul_decode(struct x86_emulate_st
                          */
                         d = twobyte_table[0x38].desc;
                         break;
+
+                    case vex_map7:
+                        opcode |= MASK_INSR(7, X86EMUL_OPC_EXT_MASK);
+                        /*
+                         * No table lookup here for now, as there's only a single
+                         * opcode point (0xf8) populated in map 7.
+                         */
+                        d = DstMem | SrcImm | ModRM | Mov;
+                        s->op_bytes = 8;
+                        break;
                     }
                 }
                 else if ( s->ext < ext_8f08 + ARRAY_SIZE(xop_table) )
@@ -1600,6 +1622,7 @@ int x86emul_decode(struct x86_emulate_st
             s->simd_size = ext8f09_table[b].simd_size;
             break;
 
+        case ext_map7:
         case ext_8f08:
         case ext_8f0a:
             /*
@@ -1814,6 +1837,7 @@ int x86emul_decode(struct x86_emulate_st
 
     case ext_map5:
     case ext_map6:
+    case ext_map7:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -189,6 +189,7 @@ enum vex_opcx {
     vex_0f3a,
     evex_map5 = 5,
     evex_map6,
+    vex_map7,
 };
 
 enum vex_pfx {
@@ -245,6 +246,7 @@ struct x86_emulate_state {
         ext_0f3a = vex_0f3a,
         ext_map5 = evex_map5,
         ext_map6 = evex_map6,
+        ext_map7 = vex_map7,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7028,10 +7028,67 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
-    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
-    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
+    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
+    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
+        if ( ea.type == OP_MEM )
+            goto enqcmd;
+        imm1 = src.val;
+        /* fall through */
+    case X86EMUL_OPC_VEX_F2(7, 0xf8): /* urdmsr imm32,r64 */
+    case X86EMUL_OPC_VEX_F3(7, 0xf8): /* uwrmsr r64,imm32 */
+        generate_exception_if(!mode_64bit() || ea.type != OP_REG, X86_EXC_UD);
+        generate_exception_if(vex.l || vex.w, X86_EXC_UD);
+        generate_exception_if(vex.opcx && ((modrm_reg & 7) || vex.reg != 0xf),
+                              X86_EXC_UD);
+        fail_if(!ops->read_msr);
+        if ( ops->read_msr(MSR_USER_MSR_CTL, &msr_val, ctxt) != X86EMUL_OKAY )
+        {
+            x86_emul_reset_event(ctxt);
+            msr_val = 0;
+        }
+        generate_exception_if(!(msr_val & USER_MSR_ENABLE), X86_EXC_UD);
+        generate_exception_if(imm1 & ~0x3fff, X86_EXC_GP, 0);
+
+        /* Check the corresponding bitmap. */
+        ea.mem.off = msr_val & ~0xfff;
+        if ( vex.pfx != vex_f2 )
+            ea.mem.off += 0x800;
+        ea.mem.off += imm1 >> 3;
+        if ( (rc = ops->read(x86_seg_sys, ea.mem.off, &b, 1,
+                             ctxt)) != X86EMUL_OKAY )
+            goto done;
+        generate_exception_if(!(b & (1 << (imm1 & 7))), X86_EXC_GP, 0);
+
+        /* Carry out the actual MSR access. */
+        if ( vex.pfx == vex_f2 )
+        {
+            /* urdmsr */
+            if ( (rc = ops->read_msr(imm1, &msr_val, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.val = msr_val;
+            ASSERT(dst.type == OP_REG);
+            dst.bytes = 8;
+        }
+        else
+        {
+            /* uwrmsr */
+            switch ( imm1 )
+            {
+            case 0x1b00: /* UINTR_TIMER */
+            case 0x1b01: /* UARCH_MISC_CTL */
+                break;
+            default:
+                generate_exception(X86_EXC_GP, 0);
+            }
+            fail_if(!ops->write_msr);
+            if ( (rc = ops->write_msr(imm1, dst.val, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.type = OP_NONE;
+        }
+        break;
+
+    enqcmd:
         host_and_vcpu_must_have(enqcmd);
-        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
         generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), X86_EXC_GP, 0);
         src.val = truncate_ea(*dst.reg);
         generate_exception_if(!is_aligned(x86_seg_es, src.val, 64, ctxt, ops),
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -337,6 +337,7 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
+XEN_CPUFEATURE(USER_MSR,           15*32+15) /*   U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -275,7 +275,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, LKGS, CMPCCXADD,
-             MSRLIST],
+             MSRLIST, USER_MSR],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


