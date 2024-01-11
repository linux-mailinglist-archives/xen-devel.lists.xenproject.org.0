Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E6482AA0A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666041.1036466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqwV-0007jQ-Pp; Thu, 11 Jan 2024 09:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666041.1036466; Thu, 11 Jan 2024 09:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqwV-0007gh-Lr; Thu, 11 Jan 2024 09:01:39 +0000
Received: by outflank-mailman (input) for mailman id 666041;
 Thu, 11 Jan 2024 09:01:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNqwT-000738-PR
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:01:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05ac3722-b060-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 10:01:35 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d87df95ddso52640715e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 01:01:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h6-20020adf9cc6000000b003375d8b0460sm643239wre.1.2024.01.11.01.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 01:01:34 -0800 (PST)
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
X-Inumbo-ID: 05ac3722-b060-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704963695; x=1705568495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb4/gtNUINoS2wM1/nsdXCF2baRKdD1wlLhO/PYM5rs=;
        b=MV6/U1ECSZFT3qjwV5ynq1wv6WVevA5zEaoXDT+mMINpqSOKb1nVYQVxXBoKjPYGqi
         IuV+EampDYirsgKumzV/Ph7LTq5LC2M8L+fvSdZQRR8i4giTawspKBbKm8wl7dShX22/
         lvipRvK79s0UemFUAIQamL4I8PbK9A57/pPiHWh7oY1NO5gFJeNL2WVesSvVTDrCXsrt
         dguSCp57rX1k1khFkXxcR1WuCRLnvuKaAyHXdipGrJAe7QQVpeIiYuVe2kl6yb15txJe
         qo8AuAvhITFfk7qRysnvPb9e83mr8c/urZpL23OCplBE76B6Dp8h6HQyVpBuB50oN3E0
         7cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704963695; x=1705568495;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb4/gtNUINoS2wM1/nsdXCF2baRKdD1wlLhO/PYM5rs=;
        b=WqO5Brav9S1gG0fpUREClPYpZn44qQFFgjUDOEwt9HCp0xGfmTW6BWEfNgl+ZMehE/
         /D9kmPJdr+1O0jUXQ72fE7UMxqmVZwu+y/qTci6IJ7U+iHZJiEk0kzcT5PxvcrayyIa2
         dQZvyW+RLxv+OubeVHvyp9fAeANHQ2Nnm1RrwKuw4P1gfNfdiOiDMRNDJ9OBzjpu7/MG
         NOmqitKp6pGkKlkXltghwikwGRVlr7u9TKVrW0abc0Zg0WHFuShz3Khh4+3XyXezuxim
         /kFqX/dE7srKzVNpFlt4/PjEJno1I7F7Xslrl9kEd7oorJFcXmGIcEB4+uWk97mCtYI4
         Sstg==
X-Gm-Message-State: AOJu0Yy3Obyg2umRIFQxVJ8iGeDeg01DPD1pKdyphuqSveuAp64u33/x
	nHUmSn8JsCDqMJUq9ZXdul/qjO51M5rZnJdkLaQwborhrw==
X-Google-Smtp-Source: AGHT+IGY4ZC6Rz0245ZzEW3qCEXmuJfx52gr0YWe2wxiNWTgara33jsliRW7elEZNrjkHuIU5LSSxw==
X-Received: by 2002:a05:600c:2158:b0:40e:526f:a110 with SMTP id v24-20020a05600c215800b0040e526fa110mr94065wml.107.1704963694917;
        Thu, 11 Jan 2024 01:01:34 -0800 (PST)
Message-ID: <36e89b27-a3a2-4cbf-879c-e24cc00d862c@suse.com>
Date: Thu, 11 Jan 2024 10:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 6/8] x86emul: support USER_MSR instructions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
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
In-Reply-To: <9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com>
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
v4: MSR index input regs are 64-bit (albeit only the APX spec has it
    this way for now).
v3: New.

--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -224,7 +224,7 @@ static const char *const str_7d1[32] =
 {
     [ 4] = "avx-vnni-int8",       [ 5] = "avx-ne-convert",
 
-    [14] = "prefetchi",
+    [14] = "prefetchi",           [15] = "user-msr",
 
     [18] = "cet-sss",
 };
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
@@ -1502,6 +1504,9 @@ static const struct vex {
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
     { { 0xdf }, 3, T, R, pfx_66, WIG, Ln }, /* vaeskeygenassist */
     { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
+}, vex_map7[] = {
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* uwrmsr */
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* urdmsr */
 };
 
 static const struct {
@@ -1511,6 +1516,10 @@ static const struct {
     { vex_0f,   ARRAY_SIZE(vex_0f) },
     { vex_0f38, ARRAY_SIZE(vex_0f38) },
     { vex_0f3a, ARRAY_SIZE(vex_0f3a) },
+    { NULL,     0 }, /* map 4 */
+    { NULL,     0 }, /* map 5 */
+    { NULL,     0 }, /* map 6 */
+    { vex_map7, ARRAY_SIZE(vex_map7) },
 };
 
 static const struct xop {
@@ -2411,7 +2420,8 @@ void predicates_test(void *instr, struct
 
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W0) )
                 {
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2421,7 +2431,8 @@ void predicates_test(void *instr, struct
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
                     {
                         ptr[-1] |= 4;
-                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                        memcpy(ptr, vex[x].tbl[t].opc,
+                               MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
                                 vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
@@ -2432,7 +2443,8 @@ void predicates_test(void *instr, struct
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W1) )
                 {
                     ptr[-1] = 0xf8 | vex[x].tbl[t].pfx;
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2442,7 +2454,8 @@ void predicates_test(void *instr, struct
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
@@ -684,6 +684,7 @@ static int blk(
 
 #ifdef __x86_64__
 static unsigned long gs_base, gs_base_shadow;
+static unsigned long uintr_timer;
 #endif
 
 static int read_segment(
@@ -718,6 +719,15 @@ static int write_segment(
 
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
@@ -727,10 +737,22 @@ static int read_msr(
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
@@ -766,6 +788,12 @@ static int write_msr(
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
@@ -1565,6 +1593,62 @@ int main(int argc, char **argv)
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
@@ -901,7 +901,7 @@ decode_0f38(struct x86_emulate_state *s,
     {
     case 0x00 ... 0xef:
     case 0xf2 ... 0xf5:
-    case 0xf7 ... 0xf8:
+    case 0xf7:
     case 0xfa ... 0xff:
         s->op_bytes = 0;
         /* fall through */
@@ -946,6 +946,18 @@ decode_0f38(struct x86_emulate_state *s,
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
@@ -1251,6 +1263,16 @@ int x86emul_decode(struct x86_emulate_st
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
@@ -1619,6 +1641,7 @@ int x86emul_decode(struct x86_emulate_st
             s->simd_size = ext8f09_table[b].simd_size;
             break;
 
+        case ext_map7:
         case ext_8f08:
         case ext_8f0a:
             /*
@@ -1833,6 +1856,7 @@ int x86emul_decode(struct x86_emulate_st
 
     case ext_map5:
     case ext_map6:
+    case ext_map7:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -185,6 +185,7 @@ enum vex_opcx {
     vex_0f3a,
     evex_map5 = 5,
     evex_map6,
+    vex_map7,
 };
 
 enum vex_pfx {
@@ -241,6 +242,7 @@ struct x86_emulate_state {
         ext_0f3a = vex_0f3a,
         ext_map5 = evex_map5,
         ext_map6 = evex_map6,
+        ext_map7 = vex_map7,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7125,10 +7125,67 @@ x86_emulate(
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
+        generate_exception_if(vex.opcx && (modrm_reg || vex.reg != 0xf),
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
@@ -315,6 +315,7 @@ XEN_CPUFEATURE(MCDT_NO,            13*32
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
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


