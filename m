Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025E5AD5257
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011496.1389957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIwA-0003Oq-6D; Wed, 11 Jun 2025 10:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011496.1389957; Wed, 11 Jun 2025 10:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIwA-0003Mt-3M; Wed, 11 Jun 2025 10:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1011496;
 Wed, 11 Jun 2025 10:44:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIw8-0002CX-KM
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:44:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdf916c7-46b0-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:44:03 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so6220707f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:44:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603b6a5aasm84831165ad.112.2025.06.11.03.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:44:02 -0700 (PDT)
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
X-Inumbo-ID: fdf916c7-46b0-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749638643; x=1750243443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=78s+oTdG4m8V+BkuHjMC+SQ/rabCHl4SaflHSRJvwWk=;
        b=Ihp5lGw0xguKeUn1ASg8awTshC94Ybir7DI4qwPEUIhhzqc1Du/07tDaRdawu87JvF
         WXw0vtUqQAh4AMLHJgv+Zm+NKYjpO1WPxayNsrjboGyX7+/Im99YM9zzF6yrRRnORxVN
         D6mdkpP26e0rcqTle4DB9pMAQMf8MLWfOpoxHZRfU0rEw4EuBqyxK+SBiXCt4atoVMD6
         D2Klx5ckQIZsRVZU0Jka4VwyxclarRWm8oiBtv92y5+ih+ogKSIRWqPFTK1qAljtuXq7
         n1lmEvdBPc749/avGya04iu9z/J6BLGF4Gq+N1xEng1zS/+jZbljkQmTTMi/L1xJ2JVH
         XX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638643; x=1750243443;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78s+oTdG4m8V+BkuHjMC+SQ/rabCHl4SaflHSRJvwWk=;
        b=l/jieDi/tt6Tkp0ccMUL4OBaAn7CGjDLMThWVloSjlh7Lqj8RAvpE45Cl/9tGr/Rex
         3bsbd2ZJ0CgfJtb7UmD3/UWLMwNRd0Tq869S+XZb/+tVSJsO1Q4TRKAZDCEOOO7kbb+q
         gM+hH1KAdQSzIuWgoi9EYcsBh7UuMGgujaTgtdXohBDTfqhCN/UvSRSG1oGlv5p3m0LA
         YdqOX6kO5rSiFc30oNkqRahQf3gLsog5A0bmk2klC7iQGiyyxzNjn+oGdMyyk3crnIv7
         m8OlOOpT1biF+yP3aG1QSxplqZ1DsGuFBPxqDpu9u4DoHIiCLNvl3GwclG/xVX/pFdo8
         7PBg==
X-Gm-Message-State: AOJu0Yx6/aQBjDwTwej/Pokb9Qk9JKP3AWDVz2SrwMssQ09yisVusWPp
	A0tNyplx4Bw876zykqv2pGWbw6z4C6eZ/Z23e7fEIU56mZasMyzeOOw/UjARHXPyAHGsQ9lqf0o
	xBl0=
X-Gm-Gg: ASbGncvKZ0ixxSZmcyVQWXhQGvrIX/Julz8b5GuUtuMLxQPnwkU1EhRF3lQ8jR+kTEs
	zVngvye6fV8we0Ho2JtmEopECBNAYfiiUZZnk2fDnR1yEJu8aPYUD3RbxeF99eD2MnJPGGdYNMA
	o80xrOa5k1Meuh8IpP3p6fWRV1YQ9MbMDpmMr7KRKNhcyJKHKJbwsvrp4gM/De9Vwt0Nfr/xF9r
	W95FJ30UigHVwgS8unnsHl9yX62EEpBxQYxF6Ux4CPav4h29FUIrWW/Xh/6wJK8EU0E4AVLmbFD
	C486A/j/DOZjUdWkY7Xb8Mey0T6TkpDhWGgn3cNZplxcCk1uM3bR7QlBNj0Wnfdg7eSfG0msyjQ
	iFW6xsgGMOTFTK/4nedLqjtAwiA8mTwEHPpqhqJgHCKEwjF8=
X-Google-Smtp-Source: AGHT+IFACdp4m3LDG1YkFCFK1VppSwoqF/paJctwk6K1X+i8fFNYhou+1x10i8tCcMGEobd95MqfYA==
X-Received: by 2002:a05:6000:2888:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a558a9a0c7mr1954562f8f.2.1749638643304;
        Wed, 11 Jun 2025 03:44:03 -0700 (PDT)
Message-ID: <14bb65f3-5b6e-4b12-8914-25528efee557@suse.com>
Date: Wed, 11 Jun 2025 12:44:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] vVMX: operand size in decode_vmx_inst()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
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
In-Reply-To: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
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
@@ -399,13 +399,13 @@ static inline u32 __n2_secondary_exec_co
 
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
@@ -437,7 +437,8 @@ static int decode_vmx_inst(struct cpu_us
 
         __vmread(EXIT_QUALIFICATION, &disp);
 
-        size = 1 << (info.fields.addr_size + 1);
+        if ( !size )
+            size = 4 << mode_64bit;
 
         offset = base + index * scale + disp;
         base = !mode_64bit || info.fields.segment >= x86_seg_fs ?
@@ -452,7 +453,9 @@ static int decode_vmx_inst(struct cpu_us
         if ( poperandS != NULL )
         {
             pagefault_info_t pfinfo;
-            int rc = hvm_copy_from_guest_linear(poperandS, base, size,
+            int rc = hvm_copy_from_guest_linear(poperandS, base,
+                                                min_t(unsigned int, size,
+                                                      sizeof(*poperandS)),
                                                 0, &pfinfo);
 
             if ( rc == HVMTRANS_bad_linear_to_gfn )
@@ -1549,7 +1552,7 @@ static int nvmx_handle_vmxon(struct cpu_
     uint32_t nvmcs_revid;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1776,7 +1779,7 @@ static int nvmx_handle_vmptrld(struct cp
     unsigned long gpa = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1853,7 +1856,7 @@ static int nvmx_handle_vmptrst(struct cp
     unsigned long gpa = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1879,7 +1882,7 @@ static int nvmx_handle_vmclear(struct cp
     void *vvmcs;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &gpa);
+    rc = decode_vmx_inst(regs, &decode, &gpa, sizeof(gpa));
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1941,7 +1944,7 @@ static int nvmx_handle_vmread(struct cpu
     u64 value = 0;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, NULL);
+    rc = decode_vmx_inst(regs, &decode, NULL, 0);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -1984,7 +1987,7 @@ static int nvmx_handle_vmwrite(struct cp
     enum vmx_insn_errno err;
     int rc;
 
-    rc = decode_vmx_inst(regs, &decode, &operand);
+    rc = decode_vmx_inst(regs, &decode, &operand, 0);
     if ( rc != X86EMUL_OKAY )
         return rc;
 
@@ -2026,7 +2029,7 @@ static int nvmx_handle_invept(struct cpu
     unsigned long eptp;
     int ret;
 
-    if ( (ret = decode_vmx_inst(regs, &decode, &eptp)) != X86EMUL_OKAY )
+    if ( (ret = decode_vmx_inst(regs, &decode, &eptp, 16)) != X86EMUL_OKAY )
         return ret;
 
     switch ( reg_read(regs, decode.reg2) )
@@ -2054,7 +2057,7 @@ static int nvmx_handle_invvpid(struct cp
     unsigned long vpid;
     int ret;
 
-    if ( (ret = decode_vmx_inst(regs, &decode, &vpid)) != X86EMUL_OKAY )
+    if ( (ret = decode_vmx_inst(regs, &decode, &vpid, 16)) != X86EMUL_OKAY )
         return ret;
 
     switch ( reg_read(regs, decode.reg2) )


