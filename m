Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C05B26417
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 13:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081530.1441605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umW0x-0001od-Vq; Thu, 14 Aug 2025 11:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081530.1441605; Thu, 14 Aug 2025 11:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umW0x-0001nA-T7; Thu, 14 Aug 2025 11:20:59 +0000
Received: by outflank-mailman (input) for mailman id 1081530;
 Thu, 14 Aug 2025 11:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umW0w-0001lk-7F
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 11:20:58 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf1df41b-7900-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 13:20:56 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb7a0442bso136683266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 04:20:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3149sm2565093466b.38.2025.08.14.04.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 04:20:55 -0700 (PDT)
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
X-Inumbo-ID: bf1df41b-7900-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755170456; x=1755775256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6fc/wb4jrsgoIo5YDPeTh8g1djNMjtrG7jQODLitUpI=;
        b=dZNv/4D71ZZ4xHkfmXFFYosh6BDhoiuXJ/1nvjr4wESYrt/lwf5dkrm3Nt8muqeZzh
         +MZ+InExjCp7oWP+Ez4iEcmI1ISGFumPqwYNt70A/m8wJx7fTOdTp6bYcdm6u8wl0UvN
         +6hvw5+Zqg064aKRe1p3ok/4QZmDk3x40EYuevKP4pm/N3NbITqYrOZzgrd+UkIpQELE
         /WZ6nw4vxFsHQ6Wc2S0DqQfbamVu8RFooOQwr19mE2f5u29JWhACp1KikBlrVc6QQnco
         kYWfFtcruexobTfqno4YSLi1lTjBgsv6WxBXperww+ULeZQHExWeHiGeO1CIWHy8AEY8
         ekmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755170456; x=1755775256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fc/wb4jrsgoIo5YDPeTh8g1djNMjtrG7jQODLitUpI=;
        b=Dsp4Q19idNroaywB5b01omQXv6slaSlA+rY7v7J66imreduAOmdqspUeaZLfHAQAdt
         bNzziZNvN/aA6+Q2wGkAarPDHEwibXLcokb26PuzK61Lx6T/j2TJJSL61VFhnTZ9TGrR
         pXFhqJUoF+bCQUWo/9/QN3TE0JdBBcqxWWkDQvpoFoz2TEH4FPfLZGbVDu4TVt9isR6j
         bzC8PbG0drZPidzSGicu2ADPJxfb/uaMWjVQbUkoLTGpkDm0DhlzIZHgrCWSmBvDozfV
         JkqfihVd2R/cKBgFtZuNtOHCwEViGGuleq7e3rEj9pJIJSU8EmAQBmFgNegJIi81iMOZ
         XC9w==
X-Forwarded-Encrypted: i=1; AJvYcCU6APnqyxHGYsro44fZM7Ho5XNEFf3hhhekdRj20K9Pnh7gp111AXz1n7sMgDh0wpYKBNgYMeFnYCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHMTvXAElmzeg7lWyP3NKZ3n7eXpY4PDRo3sjlsD9+07mxAstF
	ohG4YMeqpCJBit3PIl6px5/HAkq/a38smSdXgnx5ik8VE6HStc15zz7wByMtZbRm6A==
X-Gm-Gg: ASbGncs4+6B+dleRn1tERcvrLqHTSbNldvuKyDPyDB14BALXWtGTMET8uZxunX+JORK
	+FPw9quFZJYZ6bqLQcrdfTmOUMIUJ8/kVGx1fao8yLKWuFgabTo6tMdM+zQvSCTjlRz9DL0fkEg
	XhZtGxgXfV3kcYHnCRtjdEC91dtt20pAnI1rIRPnZmTkRktHL6wCYOn0Hr1C8IfnRZwh5z6W2v5
	Hvu8SXVkWBP9pQZp8U7zL7w8T9G+pDcbsGUTZsBqTWagdkkSh13erPFoPxru9PgMt737Z1/JesE
	w5NdVZfvVqDkygm3Mu5ogtZOqdO7haQ0oV9yUxdio0wmHCjlICMgpe/hsbGLRXltJ6/xdYpcD2x
	O5BUwMZpZLJuUXM5sMz4+mZWC/kGaief/IT+X01gCFmXpq2Xta1ywx2FrWrF+yujBNHFby17+ZZ
	23HhERhes=
X-Google-Smtp-Source: AGHT+IFOjE/rJ5EAckCS6Ta36o/7jIoiuqtDOAcWmTxCSt4CWTEE2XsFR8Q3uanLF37d+oK7Eu7UPg==
X-Received: by 2002:a17:907:3d91:b0:af9:c1f7:802 with SMTP id a640c23a62f3a-afcb98c0a88mr266773766b.31.1755170455618;
        Thu, 14 Aug 2025 04:20:55 -0700 (PDT)
Message-ID: <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
Date: Thu, 14 Aug 2025 13:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] x86: FRED enumerations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20250808202314.1045968-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> Of note, CR4.FRED is bit 32 and cannot enabled outside of 64bit mode.
> 
> Most supported toolchains don't understand the FRED instructions yet.  ERETU
> and ERETS are easy to wrap (they encoded as REPZ/REPNE CLAC), while LKGS is
> more complicated and deferred for now.
> 
> I have intentionally named the FRED MSRs differently to the spec.  In the
> spec, the stack pointer names alias the TSS fields of the same name, despite
> very different semantics.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -57,6 +57,10 @@ config HAS_CC_CET_IBT
>  	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93654
>  	def_bool $(cc-option,-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern) && $(as-instr,endbr64)
>  
> +config HAS_AS_FRED
> +	# binutils >= 2.41 or LLVM >= 19
> +	def_bool $(as-instr,eretu;lkgs %ax)

..., as per your reply, this preferably dropped (without me insisting), and
with ...

> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -75,6 +75,7 @@
>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>  #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
> +#define X86_CR4_FRED      0x100000000 /* Fast Return and Event Delivery */

... a UL suffix added here for Misra.

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -310,7 +310,10 @@ XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+8) /*   Architectural Perfmon */
>  XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
>  XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
>  XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
> +XEN_CPUFEATURE(FRED,         10*32+17) /*   Fast Return and Event Delivery */
> +XEN_CPUFEATURE(LKGS,         10*32+18) /*   Load Kernel GS instruction */
>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
> +XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-Source Reporting */
>  XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
>  XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>  XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */

I'd like to note that we could long have had this if my long-pending emulator
patch had gone in at some point.

Jan

