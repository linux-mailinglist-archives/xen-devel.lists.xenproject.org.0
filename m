Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4629E3870
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 12:11:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848517.1263377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tInGz-0004zV-Re; Wed, 04 Dec 2024 11:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848517.1263377; Wed, 04 Dec 2024 11:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tInGz-0004wu-O3; Wed, 04 Dec 2024 11:10:25 +0000
Received: by outflank-mailman (input) for mailman id 848517;
 Wed, 04 Dec 2024 11:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tInGy-0004wo-V8
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 11:10:24 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bb345f9-b230-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 12:10:24 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa51bf95ce1so475547866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2024 03:10:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c19c0sm726507966b.23.2024.12.04.03.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 03:10:23 -0800 (PST)
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
X-Inumbo-ID: 5bb345f9-b230-11ef-a0d4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733310623; x=1733915423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nj7CgqAAQQhNHgK0hte7ZaiQHV8FhEfQVmCLQVxteIQ=;
        b=gkgj05vUx8zaX/JhP0LqWpj6Ly5JJgGp/phokpUS5k+EloaxC6DqoFPiFE/nby/pYK
         +iKBgx0saVJWd9Gxkt8xtWiP5XgBtXSXeV6NDt2ixvVF5lhrvlRQ0dCt7K7LrqAhtCJD
         1ONY5LeL6gbdi02Ww/6rUS9aK0h5NCj8Q/kCuyOyg5wO5qCV79Z0weG2TIdM+CiaNRxL
         hUlGEL12KWz1YA+N14oGSvcvgKENlBWP4q77lTPVsZx//XRNvF9pV9nG0U9p3fU8RNLJ
         7GEMB/lFHpRFBknKGKvqTS6BGWc0QtrRxFojoB9/TJ3RJT9llGugQ00vN7uJLxxXmLkZ
         9KKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310623; x=1733915423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj7CgqAAQQhNHgK0hte7ZaiQHV8FhEfQVmCLQVxteIQ=;
        b=GnTW5OISkSKct6BLqSJF+wudTIvAaVQeRtg9LcKsFnWeiR3ia4zdP/hs6b741HNe9e
         V+ar/ULBPHqshBYYVgYE/EO/Mt/gh52Q0SXv716csGIRSKob96z8nOE4uj7pDLIN2Ai6
         ddpv9RU9iCDUwNZOgQRRVBUQAArVsYl9u8MrGroHZ+M9Idq+gv9173EhFx99WY2Z8Niz
         LFG/THBhypynZ8nfizBwnpMjX5Fd+nt5lwqbrmkAazFdHbukTWbmr+5SPwOoX1AdbJHA
         pDmCg9G+Wq7bxq7jiVYYth0B/DX3icJzCltSPH9va23Tno8rfaozxY4crbU85TA5+QDv
         1fBw==
X-Forwarded-Encrypted: i=1; AJvYcCUFPU9Mry3lmyuQEnMOKMDQQ47K8TlZl9L/vEtnf1YB6c9FlkFF/qWJToJ8nd2JpgcsW2zykQdAzXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxTVPKsNGMxAT/P/JsTq01paM56I2nnOLx0VwlHkbif0JCjPwO
	n9kDy5RAtd34xlHXN8Ea/qwujYeDJEMpUuA9W14MDNoQh0OvCMAD6IgRnmZyyQ==
X-Gm-Gg: ASbGncsk6aTy9CdmwbPP4DrCqropRpzOor3uw3IW/Uod+yGa6u+ejJUCFd+t/NwqQOm
	oZlghNdBr0LE+83Q1AFdr+VxxICZRKYgz17u/W6KH3ZUYR0wrLiYHjTd93oUnKhWIO8kSotOqyu
	+l8wz4pT5rwEeM9RKy++VBCmSEisE1hBPHBTBbsPVyROcPnboUlq31iFuyh549Lqx7Ntk9Xsd5S
	ElZjo9Sp1MOgCPzy7FyBMBwP8m1raIc0mVpTWnfwfM5WX8ohlfP0IwEWLWhRxtx6xGeC+m182iU
	7uhXViHuXWKmlOi0bggcVX9ea/0s96ufVyM=
X-Google-Smtp-Source: AGHT+IGIihWtD8bmSHjj/ucBs5sXCWXky+VH2kSnATRJOI8gu1qj7r/4LD0UEnZcGwbsOwNrj8ZDmQ==
X-Received: by 2002:a17:907:7758:b0:aa5:630d:7de0 with SMTP id a640c23a62f3a-aa6018d8978mr408893866b.44.1733310623459;
        Wed, 04 Dec 2024 03:10:23 -0800 (PST)
Message-ID: <12fcd5dd-5d01-465b-bbaa-4e7e2f598727@suse.com>
Date: Wed, 4 Dec 2024 12:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/hvm: Use constants for x86 modes
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
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
In-Reply-To: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2024 10:49, Teddy Astie wrote:
> In many places of x86 HVM code, constants integer are used to indicate in what mode is
> running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these constants are
> are written directly as integer which hides the actual meaning of these modes.
> 
> This patch introduces X86_MODE_* macros and replace those occurences with it.
> 
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with further style adjustments (see below) and ideally with ...

> ---
> v2:
> Formatting changes (alignment, ...)
> Renamed v86 to vm86. (Jan)

... this extended to ...

> @@ -2952,11 +2954,11 @@ static const char *guest_x86_mode_to_str(int mode)
>  {
>      switch ( mode )
>      {
> -    case 0:  return "Real";
> -    case 1:  return "v86";
> -    case 2:  return "16bit";
> -    case 4:  return "32bit";
> -    case 8:  return "64bit";
> +    case X86_MODE_REAL:   return "Real";
> +    case X86_MODE_VM86:   return "v86";

... the string literal here.

> @@ -112,23 +113,23 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>  
>      switch ( mode )
>      {
> -    case 8:
> +    case X86_MODE_64BIT:
>          eax = regs->rax;
>          fallthrough;
> -    case 4:
> -    case 2:
> +    case X86_MODE_32BIT:
> +    case X86_MODE_16BIT:
>          if ( currd->arch.monitor.guest_request_userspace_enabled &&
>              eax == __HYPERVISOR_hvm_op &&
> -            (mode == 8 ? regs->rdi : regs->ebx) == HVMOP_guest_request_vm_event )
> +            (mode == X86_MODE_64BIT ? regs->rdi : regs->ebx) == HVMOP_guest_request_vm_event )

This line is too long now.

> @@ -2073,7 +2073,8 @@ int nvmx_handle_vmx_insn(struct cpu_user_regs *regs, unsigned int exit_reason)
>  
>      if ( !(curr->arch.hvm.guest_cr[4] & X86_CR4_VMXE) ||
>           !nestedhvm_enabled(curr->domain) ||
> -         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? 8 : 2)) ||
> +         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? X86_MODE_64BIT
> +                                                                 : X86_MODE_16BIT)) ||

As are these two.

Likely easy enough to adjust while committing.

Jan

