Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 858D8ADD3D4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 18:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018342.1395250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYlc-0000U7-QA; Tue, 17 Jun 2025 16:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018342.1395250; Tue, 17 Jun 2025 16:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRYlc-0000S4-NY; Tue, 17 Jun 2025 16:02:32 +0000
Received: by outflank-mailman (input) for mailman id 1018342;
 Tue, 17 Jun 2025 16:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRYlb-0007f6-Cg
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 16:02:31 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 786d636d-4b94-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 18:02:29 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-553bcba4ff8so2877205e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 09:02:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b09f1sm9014057b3a.113.2025.06.17.09.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 09:02:27 -0700 (PDT)
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
X-Inumbo-ID: 786d636d-4b94-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750176149; x=1750780949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m0r2g8AumYTO+yNs7PfmqPv/BjQUKEeF7pA9dmiAzgc=;
        b=NyIwtuHJIHvzl1WfYneJJco0VYKxUq8YTxSwIZdWNcZToPGQqPgyNEHZypWOZQijlw
         aWj+mb9ZE6hJELkKTPbf+YW8td172vgx+plAiu5tYAtZGtqS9Xa2PYBeCQW6HrAzrj/6
         +lv9rRGV8/JVB1avwmjPPy2NEP0O70xaj3gnIvutry0dYZ32iwj9AvTCPJOlNMKXVivR
         r65z4Wi42J1Nw/UsKyoPQ0v9Uc6OafuCG+6ExFL3p5VEKeHBO2dFGXUA962CPkslOs2w
         1yIQsb5aGY+EiaFqUa8bYiMrzKRTDhx+t5e1MR7+KMcDi36rSia4JatrY3Bqb3vMfiXF
         m4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176149; x=1750780949;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0r2g8AumYTO+yNs7PfmqPv/BjQUKEeF7pA9dmiAzgc=;
        b=CJXkUzg+X3GMXH5wMR+PhYsknLfa6XUB93ZglgUQQDXgDlLmyTNHbo06qZLZJP/SrN
         Ou2y0yAZ1pFnCGZ3llm+edtCqrf5UFLC6S2hny05yAfQXfyPT6UB8djmY9F0bY+A8zGU
         X7XhVjDsTaxbtgG/fsS7QIahKgeElLGGcOQwNnuyDSM2Av88hRB+b8iXZqPj8wffzKXQ
         yQpPn9rkPdmw6uTUL0f8Ys3mkgFmrp82zfpNcsxZTu3k+eNNEfmR48VjC4B8eXNDOtKm
         BbNWFsiCeu6xTGQwdnMd+Nm3GiMOTuChtowvFR+keBPEhuOzVDauIYwb+GPW1exvs5CC
         3hfw==
X-Gm-Message-State: AOJu0Yw0XnTBMNJy6NhQZ7LQfM8/1xIkhl6PwCHJGQRXMwetamE2YWOi
	zdWnIkipaZUxpQZAsV5pNamwSX+yvlGZhtOydvyX4OQyn5i8RE+htA0uO4Ml29ktXPSTC9lXYCe
	WeBo=
X-Gm-Gg: ASbGncvFneY6dBcQEaoZLFqkRZj8VF/7kwxoJyBCpSjhvhWV35Z1VOtywaR7kh8VAt8
	SHiM25FChiT8qY6fZlERxWv4O6Zh+RrctVydOXxmcRmt3UkJSwnEOsVjBAOVy2sQ8Mp6vN1fjcT
	9JXob0ABsTATu9mCLcyDcO8vXI4rmc2e1xoQbYNoS/JBRbYfXxNBzZyVM4DDKIjMcvVf076U+LD
	hUd1D0ZSUYYa0sgtXLJYCXqgKMZUloTh+Avs1bgsGwAneXS5M4PR6d+wH9sgVMGVJ7SEHRVgsjL
	4TP06nvJslxFPgBxs/KsNt8NYd7vX4LeonHK9MGLlEjX0vvn0i/YlcuguAzOp4gRLfLFMFGaYDO
	BlWU9TUY5fYx9ugzt487Xr2RYgbCiexSE7Ai9z+6XoJsidNY=
X-Google-Smtp-Source: AGHT+IHW7PvOSxWAKW31+3M7RYDViPeuR9qGeTgU3uJr15ojueHOvA46JpnfdZEme8SB7cuDRQR7Pw==
X-Received: by 2002:a05:6512:15aa:b0:553:34d6:d67d with SMTP id 2adb3069b0e04-553b6f4e4b3mr3497288e87.46.1750176148524;
        Tue, 17 Jun 2025 09:02:28 -0700 (PDT)
Message-ID: <283e9961-7bf8-4f2c-9fcc-f4e09c91a28a@suse.com>
Date: Tue, 17 Jun 2025 18:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/5] vVMX: operand size in decode_vmx_inst()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
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
In-Reply-To: <080f33dc-6381-4b85-8fd5-78e93e265b13@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Address size is entirely irrelevant to operand size determination; For
VMREAD and VMWRITE outside of 64-bit mode operand size is 32 bits, while
in 64-bit mode it's (naturally) 64 bits. For all other insns it's 64
bits (a physical address) or 128 bits (INVEPT, INVVPID). To limit the
amount of change here, keep the latter at reading only 64 bits from
guest space.

Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Beyond the wrong operand handling for INVEPT and INVVPID, the latter
also doesn't even have the part read checked to have bits 16 and above
all clear.

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -411,13 +411,13 @@ static inline u32 __n2_secondary_exec_co
 
 static int decode_vmx_inst(struct cpu_user_regs *regs,
                            struct vmx_inst_decoded *decode,
-                           unsigned long *poperandS)
+                           unsigned long *poperandS, unsigned int size)
 {
     struct vcpu *v = current;
     union vmx_inst_info info;
     struct segment_register seg;
     unsigned long base, index, seg_base, disp, offset;
-    int scale, size;
+    unsigned int scale;
 
     __vmread(VMX_INSTRUCTION_INFO, &offset);
     info.word = offset;
@@ -449,7 +449,8 @@ static int decode_vmx_inst(struct cpu_us
 
         __vmread(EXIT_QUALIFICATION, &disp);
 
-        size = 1 << (info.fields.addr_size + 1);
+        if ( !size )
+            size = 4 << mode_64bit;
 
         offset = base + index * scale + disp;
         base = !mode_64bit || info.fields.segment >= x86_seg_fs ?
@@ -464,7 +465,9 @@ static int decode_vmx_inst(struct cpu_us
         if ( poperandS != NULL )
         {
             pagefault_info_t pfinfo;
-            int rc = hvm_copy_from_guest_linear(poperandS, base, size,
+            int rc = hvm_copy_from_guest_linear(poperandS, base,
+                                                min_t(unsigned int, size,
+                                                      sizeof(*poperandS)),
                                                 0, &pfinfo);
 
             if ( rc == HVMTRANS_bad_linear_to_gfn )
@@ -1561,7 +1564,7 @@ static int nvmx_handle_vmxon(struct cpu_
     uint32_t nvmcs_revid;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1788,7 +1791,7 @@ static int nvmx_handle_vmptrld(struct cp
     unsigned long gpa = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1865,7 +1868,7 @@ static int nvmx_handle_vmptrst(struct cp
     unsigned long gpa = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1891,7 +1894,7 @@ static int nvmx_handle_vmclear(struct cp
     void *vvmcs;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1953,7 +1956,7 @@ static int nvmx_handle_vmread(struct cpu
     u64 value = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, NULL);
+    rc = decode_vmx_inst(regs, &decode, NULL, 0);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1996,7 +1999,7 @@ static int nvmx_handle_vmwrite(struct cp
     enum vmx_insn_errno err;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &operand);
+    rc = decode_vmx_inst(regs, &decode, &operand, 0);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -2038,7 +2041,7 @@ static int nvmx_handle_invept(struct cpu
     unsigned long eptp;
     int ret;
 
-    if ( (ret = decode_vmx_inst(regs, &decode, &eptp)) != X86EMUL_OKAY )
+    if ( (ret = decode_vmx_inst(regs, &decode, &eptp, 16)) != X86EMUL_OKAY )
         return ret;
 
     switch ( reg_read(regs, decode.reg2) )
@@ -2066,7 +2069,7 @@ static int nvmx_handle_invvpid(struct cp
     unsigned long vpid;
     int ret;
 
-    if ( (ret = decode_vmx_inst(regs, &decode, &vpid)) != X86EMUL_OKAY )
+    if ( (ret = decode_vmx_inst(regs, &decode, &vpid, 16)) != X86EMUL_OKAY )
         return ret;
 
     switch ( reg_read(regs, decode.reg2) )


