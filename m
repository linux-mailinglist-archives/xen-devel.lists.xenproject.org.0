Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE2ADE437
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018837.1395709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmrt-0005Vx-1l; Wed, 18 Jun 2025 07:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018837.1395709; Wed, 18 Jun 2025 07:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmrs-0005UJ-Uk; Wed, 18 Jun 2025 07:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1018837;
 Wed, 18 Jun 2025 07:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRmrq-0004U2-Hc
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:05:54 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abc52071-4c12-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 09:05:52 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so4551691f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 00:05:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31429aae8eesm2736086a91.40.2025.06.18.00.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 00:05:51 -0700 (PDT)
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
X-Inumbo-ID: abc52071-4c12-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750230352; x=1750835152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ahgmDD+UAYdCA6LK0dCpFHM/dWs4Qa1gLE1F4JjLxuE=;
        b=a0dhouonyI7wSKGy7F+FDE51AumGj6ZZHyHkJKCrej3AXKLlgQvN/vMpQLiBERLKoQ
         w/nXHvvhAvXEyYwKa4HD+boSO3XRveBK9RJtowOA8xUnl7gRjpZ1XQj3Hu5g7bfTOtt3
         VbbrgFY95EQemKB8zObCxL7pLAVx0Q05d7kyWyAjaCZNiVnDtIkLsQ+FPOebQOs1m4O6
         wV3BIuS+CuqpND0/x273dytPvvLlAQFGaYdr6Y0H2b7uQIFeUPD8pj3TkdWBcr4APUzQ
         c9SRQTpaKaRZ4jUj+teR1rpgWsrF10V/1dWIfApJydtneMGzWuiU15HnsJowOBiEkser
         T0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230352; x=1750835152;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahgmDD+UAYdCA6LK0dCpFHM/dWs4Qa1gLE1F4JjLxuE=;
        b=BWvOKcSaV88AsfywUKvRVreJCEDaxBwr51oG+WeAslCmBe6d8IIRc+MLKVjRFYp8iC
         cNrt7Vq9sygjj60sUl0Z93QQkZu3DqU+1XmZpexOvTliJFa4sNdtfLU6K/SFvE+/kf1N
         mQWeRT8eEtMvjRjdzxNZU/YI1+Al/gPSm4cJPMgfwSGpBdcDEHy12M/J7voSpHC+18NR
         Cg9AcPA4b1nXYQzzNLqHyrwEt97Xn510yTm97hmMpuOt/+eo9uP+gj6pvCQoNfHaREkU
         algbivZ7AfAJpn8XADfuTsn7fuEDSbFlUfii42H4zwK6HFSIoCprSqv3+3um+8nRJVnZ
         AQ3w==
X-Gm-Message-State: AOJu0YzlzEiVB/Yz5VK2YXV3h+38Ur3sU2AXGtCdqxiqU0sUhp1/73fk
	N0h3iUG96Kz0HP2C1RgStE4yEl9xFMrA61A7kqxxtn+/eBsxcWHqlH3pmGlVDxHygSy7deseyhK
	FAfE=
X-Gm-Gg: ASbGncvZyHgvlIlfbcM+S3g/LiDKvPyqSk14+acOHg6DZA2l9ZlTwbCpYURwFcjCpJX
	MsLEmg2m0JYqMN3vAga+9quscZznlCX8ZhaTALUoJbngJkwAK3TCMDBNmPOzRRVBV1i6ySc1JC8
	HhcqXShv0h4sSeCHIzdwJ4ovp2C47XiiDnL5aCZ112oEwMshiaZLUexFLQb2kTD2sOzi2PdtoAE
	rUHg0zY5l7Pf6tB/ygLBmQAOkxaQ2w440N9hSZLKyPRAGLG72OeaK8sPar67qll5RKwgaX7rSlx
	7hPl0n9QdJ0IopF6HzJKjHvibVe+GJXRSLb9xAxNWRwEdYFVzG8o3r12EywRgn/ZCus0HlI/W7U
	D6SDwg+esw1gC4QE1VSqnqX2NSyTc63ttn11er/UkUTGwoGo=
X-Google-Smtp-Source: AGHT+IF2KH8iYqLtvWdlCIBMhALI5ywkB7SAScVAcGgMtKSrka/uiLIBi9UJ3BGFviNLMBwFwvLemA==
X-Received: by 2002:a5d:64ee:0:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a5723a2dafmr11947449f8f.29.1750230351745;
        Wed, 18 Jun 2025 00:05:51 -0700 (PDT)
Message-ID: <25af4f84-8e24-4738-bf4b-79e8ead3e970@suse.com>
Date: Wed, 18 Jun 2025 09:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 3/7] x86emul: support USER_MSR instructions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <585f1b0b-6768-4f9c-8f9f-bcf6e20fbfb7@suse.com>
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
In-Reply-To: <585f1b0b-6768-4f9c-8f9f-bcf6e20fbfb7@suse.com>
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

The forced setting of cpu_policy.feat.utmr could likely be done
globally, i.e. early in main(). Limiting its scope is merely "just in
case". Thoughts?
---
v8: Switch to using fallthrough pseudo-keyword. Re-base.
v7.1: Add MSR-specific feature checks for UWRMSR (incl the UTMR feature
      bit and its overriding in the test harness).
v7: Add missing vcpu_must_have() and override in emul_test_init(). Use
    MSR constants even more.
v6: Add MSR_UINTR_TIMER to header. Use MSR constants in test harness.
    Re-base.
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
@@ -2420,7 +2429,8 @@ void predicates_test(void *instr, struct
 
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W0) )
                 {
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2430,7 +2440,8 @@ void predicates_test(void *instr, struct
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L1) )
                     {
                         ptr[-1] |= 4;
-                        memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                        memcpy(ptr, vex[x].tbl[t].opc,
+                               MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
                                 vex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
@@ -2441,7 +2452,8 @@ void predicates_test(void *instr, struct
                 if ( vex[x].tbl[t].w == WIG || (vex[x].tbl[t].w & W1) )
                 {
                     ptr[-1] = 0xf8 | vex[x].tbl[t].pfx;
-                    memcpy(ptr, vex[x].tbl[t].opc, vex[x].tbl[t].len);
+                    memcpy(ptr, vex[x].tbl[t].opc,
+                           MIN(vex[x].tbl[t].len, ARRAY_SIZE(vex->tbl->opc)));
 
                     if ( vex[x].tbl[t].l == LIG || (vex[x].tbl[t].l & L0) )
                         do_test(instr, vex[x].tbl[t].len + ((void *)ptr - instr),
@@ -2451,7 +2463,8 @@ void predicates_test(void *instr, struct
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
+    RD(MSR_IA32_APERF),
+    WR(MSR_UINTR_TIMER),
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
+    case MSR_USER_MSR_CTL:
+        *val = (unsigned long)umsr_bitmap | 1;
+        return X86EMUL_OKAY;
+#endif
+
     case MSR_BARRIER:
         *val = 0;
         return X86EMUL_OKAY;
 
+    case MSR_IA32_APERF:
+#define APERF_LO_VALUE 0xAEAEAEAE
+#define APERF_HI_VALUE 0xEAEAEAEA
+        *val = ((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE;
+        return X86EMUL_OKAY;
+
     case MSR_EFER:
         *val = ctxt->addr_size > 32 ? EFER_LME | EFER_LMA : 0;
         return X86EMUL_OKAY;
@@ -756,6 +778,12 @@ static int write_msr(
 {
     switch ( reg )
     {
+    case MSR_UINTR_TIMER:
+        if ( ctxt->addr_size < 64 )
+            break;
+        uintr_timer = val;
+        return X86EMUL_OKAY;
+
     case MSR_GS_BASE:
         if ( ctxt->addr_size < 64 || !is_canonical_address(val) )
             break;
@@ -1484,6 +1512,68 @@ int main(int argc, char **argv)
          (gs_base != 0x0000222244446666UL) ||
          (gs_base_shadow != 0x0000111122224444UL) )
         goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing urdmsr %rdx,%rcx...");
+    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8; instr[4] = 0xd1;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rdx = MSR_IA32_APERF;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[5]) ||
+         (regs.rcx != (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing urdmsr $MSR_IA32_APERF,%rdx...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7b; instr[3] = 0xf8; instr[4] = 0xc2;
+    *(uint32_t *)&instr[5] = MSR_IA32_APERF;
+    regs.rip = (unsigned long)&instr[0];
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (regs.rdx != (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+        goto fail;
+    printf("okay\n");
+
+    /* Our write_msr() knows of MSR_UINTR_TIMER. */
+    i = cpu_policy.feat.utmr;
+    cpu_policy.feat.utmr = true;
+
+    printf("%-40s", "Testing uwrmsr %rdi,%rsi...");
+    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8; instr[4] = 0xf7;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = MSR_UINTR_TIMER;
+    regs.rdi = 0x0011223344556677UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[5]) ||
+         (uintr_timer != 0x0011223344556677UL) )
+        goto fail;
+    printf("okay\n");
+
+    printf("%-40s", "Testing uwrmsr %rsi,$MSR_UINTR_TIMER...");
+    instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7a; instr[3] = 0xf8; instr[4] = 0xc6;
+    *(uint32_t *)&instr[5] = MSR_UINTR_TIMER;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0x8877665544332211UL;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_OKAY) ||
+         (regs.rip != (unsigned long)&instr[9]) ||
+         (uintr_timer != 0x8877665544332211UL) )
+        goto fail;
+    printf("okay\n");
+
+    cpu_policy.feat.utmr = i;
+
+    printf("%-40s", "Testing uwrmsr %rsi,$MSR_UARCH_MISC_CTRL...");
+    *(uint32_t *)&instr[5] = MSR_UARCH_MISC_CTRL;
+    regs.rip = (unsigned long)&instr[0];
+    regs.rsi = 0;
+    rc = x86_emulate(&ctxt, &emulops);
+    if ( (rc != X86EMUL_EXCEPTION) ||
+         (regs.rip != (unsigned long)&instr[0]) )
+        goto fail;
 
     emulops.write_msr     = NULL;
 #endif
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -88,6 +88,7 @@ bool emul_test_init(void)
     cpu_policy.feat.lkgs = true;
     cpu_policy.feat.wrmsrns = true;
     cpu_policy.feat.msrlist = true;
+    cpu_policy.feat.user_msr = true;
     cpu_policy.extd.clzero = true;
 
     if ( cpu_has_xsave )
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
@@ -195,6 +199,8 @@
 #define  MCU_CONTROL_DIS_MCU_LOAD           (_AC(1, ULL) <<  1)
 #define  MCU_CONTROL_EN_SMM_BYPASS          (_AC(1, ULL) <<  2)
 
+#define MSR_UINTR_TIMER                     0x00001b00
+
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
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
@@ -1602,6 +1624,7 @@ int x86emul_decode(struct x86_emulate_st
             s->simd_size = ext8f09_table[b].simd_size;
             break;
 
+        case ext_map7:
         case ext_8f08:
         case ext_8f0a:
             /*
@@ -1816,6 +1839,7 @@ int x86emul_decode(struct x86_emulate_st
 
     case ext_map5:
     case ext_map6:
+    case ext_map7:
     case ext_8f09:
     case ext_8f0a:
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -202,6 +202,7 @@ enum vex_opcx {
     vex_0f3a,
     evex_map5 = 5,
     evex_map6,
+    vex_map7,
 };
 
 enum vex_pfx {
@@ -258,6 +259,7 @@ struct x86_emulate_state {
         ext_0f3a = vex_0f3a,
         ext_map5 = evex_map5,
         ext_map6 = evex_map6,
+        ext_map7 = vex_map7,
         /*
          * For XOP use values such that the respective instruction field
          * can be used without adjustment.
@@ -614,6 +616,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
 #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
 #define vcpu_has_avx_vnni_int16() (ctxt->cpuid->feat.avx_vnni_int16)
+#define vcpu_has_user_msr()    (ctxt->cpuid->feat.user_msr)
 
 #define vcpu_must_have(feat) \
     generate_exception_if(!vcpu_has_##feat(), X86_EXC_UD)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7075,10 +7075,73 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
-    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
-    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
+    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
+    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
+        if ( ea.type == OP_MEM )
+            goto enqcmd;
+        imm1 = src.val;
+        fallthrough;
+    case X86EMUL_OPC_VEX_F3(7, 0xf8): /* uwrmsr r64,imm32 */
+    case X86EMUL_OPC_VEX_F2(7, 0xf8): /* urdmsr imm32,r64 */
+        generate_exception_if(!mode_64bit() || ea.type != OP_REG, X86_EXC_UD);
+        generate_exception_if(vex.l || vex.w, X86_EXC_UD);
+        generate_exception_if(vex.opcx && ((modrm_reg & 7) || vex.reg != 0xf),
+                              X86_EXC_UD);
+        vcpu_must_have(user_msr);
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
+                generate_exception_if(!cp->feat.utmr, X86_EXC_GP, 0);
+                break;
+
+            case 0x1b01: /* UARCH_MISC_CTL */
+                generate_exception_if(!cp->arch_caps.doitm, X86_EXC_GP, 0);
+                break;
+
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
@@ -357,7 +357,9 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(AMX_COMPLEX,        15*32+ 8) /*   AMX Complex Instructions */
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
+XEN_CPUFEATURE(UTMR,               15*32+13) /*   User Timer */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */
+XEN_CPUFEATURE(USER_MSR,           15*32+15) /*   U{RD,WR}MSR Instructions */
 XEN_CPUFEATURE(UIRET_UIF,          15*32+17) /*   UIRET updates UIF */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 XEN_CPUFEATURE(SLSM,               15*32+24) /*   Static Lockstep Mode */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -275,7 +275,7 @@ def crunch_numbers(state):
         # NO_LMSL indicates the absense of Long Mode Segment Limits, which
         # have been dropped in hardware.
         LM: [CX16, PCID, LAHF_LM, PAGE1GB, PKU, NO_LMSL, AMX_TILE, CMPCCXADD,
-             LKGS, MSRLIST],
+             LKGS, MSRLIST, USER_MSR],
 
         # AMD K6-2+ and K6-III processors shipped with 3DNow+, beyond the
         # standard 3DNow in the earlier K6 processors.


