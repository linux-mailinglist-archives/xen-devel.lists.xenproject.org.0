Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ACA9DB42B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 09:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845152.1260619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGaCA-0005op-FX; Thu, 28 Nov 2024 08:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845152.1260619; Thu, 28 Nov 2024 08:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGaCA-0005mo-Cr; Thu, 28 Nov 2024 08:48:18 +0000
Received: by outflank-mailman (input) for mailman id 845152;
 Thu, 28 Nov 2024 08:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGaC9-0005mh-G8
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 08:48:17 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80c3067b-ad65-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 09:48:13 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-382325b0508so257316f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 00:48:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd68a47sm1039678f8f.65.2024.11.28.00.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 00:48:12 -0800 (PST)
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
X-Inumbo-ID: 80c3067b-ad65-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzEiLCJoZWxvIjoibWFpbC13cjEteDQzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjgwYzMwNjdiLWFkNjUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzgzNjkzLjczMDAwOCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732783693; x=1733388493; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tShiKqT8s0GGopK/ogXX43OnTmoNPFAdyZhJBGCdNTY=;
        b=CdnA6eNz+xaiWhq3r4729K4+6KpJH0LoQ3moyw5rGgBHYibD4H2sjkM7DrjBQYHaNe
         Vg4ezSV2S3t7U9rNso/dt9LnVyqUfXANc2mm/fye70XZUGbMYcPbgupazhRwB8+XUDGL
         9AVEx+mTpC8/8kZj2geenvCpPGWTxgyf6Ys3Gekrm5WIjsZLRL5HM6SJTJajh0OXk0AW
         WqBlCehyKXBTFWPYRzV5iyWlCmnOfyCqfAfEbavBVWB0XP11Bw5EbzxkHDEBU0PzTR31
         sT35hEBLlR3uGYSuTllkKctMlnmC0C8JKBzxmP1hbvls54I/yxQw9OVs2Wce17I3KdGQ
         dKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783693; x=1733388493;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tShiKqT8s0GGopK/ogXX43OnTmoNPFAdyZhJBGCdNTY=;
        b=BXXsKWZiJZIVm9/AmXfhqvr7Ei9yOjIn0TAASYmEawF3JBXhImMxcjwBEHelke6bqr
         qe2hFfqi8Rttsx2fI12BEABhv/KegaRW5q8SmQlDRBhsA6KOfC31g8iRM6q8oIJKG5nv
         lb9jUsGAN8Lq4dFy3PEvwVcWm4iCKAJFcQccrWuFCPWaVaYywsblsM43mcb2f31ukTx8
         6bAR0KdpJx2ReAl3OAP6P26WvvmVBDnULGJjkXU4az5melYs5NKlQb4j5yUXxhagKT/R
         ltAz0AiMCiDibPy6OsZG/UN5qMM8QmpVQurCbiyNVkNp69F7k0OfcX66CdZXAxF7JdJo
         1QIA==
X-Gm-Message-State: AOJu0Yy0blptmvB52j/BhsiPOJoZFztu1JRu4Y42zTeQvz2ynFKFzkeG
	laSe2TZ7xtnaNuZ1h/7cF5PorPMN48J4O1oBAd3VYJ0u5V7P+pKGC5dIPYQ97UKxuXiBmbXrF5o
	=
X-Gm-Gg: ASbGncsdqt8PYJfg1Drd5gzd/AaBfaAFWSiBTPsKBrUnYpkLouOOE0ywwQVq7CsQmZs
	x+TEDclswnvLibj9qJW9RBp1X56qe7I3QRfqAevjjAZZsbRnU93Ly/Oiif+EaRI6aJOB8gIHB9o
	ZwWukK/AXGyGl0QOLVMeiPyEUFmhAWvO1++mUQwPEY0mB3FJqH6+wgeXFJALq9df//cZRttAhht
	lly86XAcGXSu9NfCkYNwYXJDPKc87YisnhFTTjXZSyHi7Q39C6hIYR/6yj/EWUpNMImbhO04Udb
	KjUPDjbx0IKQOmbqeE+fXqbKQGCqdAghRwQ=
X-Google-Smtp-Source: AGHT+IEzhecAuv7Dw/L4B4uqaU4COnBYVExGv4e37/rtMsZsl6Fk4GrVMO7TvHZK4lwKerX/YuqGRg==
X-Received: by 2002:a05:6000:389:b0:382:5016:fd0b with SMTP id ffacd0b85a97d-385c6ee2190mr5007212f8f.50.1732783693159;
        Thu, 28 Nov 2024 00:48:13 -0800 (PST)
Message-ID: <d4d1708b-1900-4282-a5fb-57b6e260a7dc@suse.com>
Date: Thu, 28 Nov 2024 09:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] x86emul: support USER_MSR instructions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com>
 <55bbfdf5-3f4b-47d6-bcbf-557e9c52de6c@suse.com>
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
In-Reply-To: <55bbfdf5-3f4b-47d6-bcbf-557e9c52de6c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 16:06, Jan Beulich wrote:
> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -7037,10 +7037,68 @@ x86_emulate(
>          state->simd_size = simd_none;
>          break;
>  
> -    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 */
> -    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 */
> +    case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
> +    case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
> +        if ( ea.type == OP_MEM )
> +            goto enqcmd;
> +        imm1 = src.val;
> +        /* fall through */
> +    case X86EMUL_OPC_VEX_F3(7, 0xf8): /* uwrmsr r64,imm32 */
> +    case X86EMUL_OPC_VEX_F2(7, 0xf8): /* urdmsr imm32,r64 */
> +        generate_exception_if(!mode_64bit() || ea.type != OP_REG, X86_EXC_UD);
> +        generate_exception_if(vex.l || vex.w, X86_EXC_UD);
> +        generate_exception_if(vex.opcx && ((modrm_reg & 7) || vex.reg != 0xf),
> +                              X86_EXC_UD);
> +        vcpu_must_have(user_msr);
> +        fail_if(!ops->read_msr);
> +        if ( ops->read_msr(MSR_USER_MSR_CTL, &msr_val, ctxt) != X86EMUL_OKAY )
> +        {
> +            x86_emul_reset_event(ctxt);
> +            msr_val = 0;
> +        }
> +        generate_exception_if(!(msr_val & USER_MSR_ENABLE), X86_EXC_UD);
> +        generate_exception_if(imm1 & ~0x3fff, X86_EXC_GP, 0);
> +
> +        /* Check the corresponding bitmap. */
> +        ea.mem.off = msr_val & ~0xfff;
> +        if ( vex.pfx != vex_f2 )
> +            ea.mem.off += 0x800;
> +        ea.mem.off += imm1 >> 3;
> +        if ( (rc = ops->read(x86_seg_sys, ea.mem.off, &b, 1,
> +                             ctxt)) != X86EMUL_OKAY )
> +            goto done;
> +        generate_exception_if(!(b & (1 << (imm1 & 7))), X86_EXC_GP, 0);
> +
> +        /* Carry out the actual MSR access. */
> +        if ( vex.pfx == vex_f2 )
> +        {
> +            /* urdmsr */
> +            if ( (rc = ops->read_msr(imm1, &msr_val, ctxt)) != X86EMUL_OKAY )
> +                goto done;
> +            dst.val = msr_val;
> +            ASSERT(dst.type == OP_REG);
> +            dst.bytes = 8;
> +        }
> +        else
> +        {
> +            /* uwrmsr */
> +            switch ( imm1 )
> +            {
> +            case 0x1b00: /* UINTR_TIMER */
> +            case 0x1b01: /* UARCH_MISC_CTL */
> +                break;

These lack MSR-specific feature checks; adding the missing raising of #GP(0)
for v8.

Jan

