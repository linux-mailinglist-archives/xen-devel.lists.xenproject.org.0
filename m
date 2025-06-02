Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA911ACAC27
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003105.1382571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1v6-0002Bg-Ci; Mon, 02 Jun 2025 09:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003105.1382571; Mon, 02 Jun 2025 09:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1v6-00029h-9M; Mon, 02 Jun 2025 09:57:28 +0000
Received: by outflank-mailman (input) for mailman id 1003105;
 Mon, 02 Jun 2025 09:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1v5-00029G-Db
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:57:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcb8795f-3f97-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:57:26 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so21208775e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:57:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e30c697sm5299968a91.36.2025.06.02.02.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:57:24 -0700 (PDT)
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
X-Inumbo-ID: fcb8795f-3f97-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748858246; x=1749463046; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TagJ5NmzFstYvgldSkZEvuo6UCP97Llml2SjE3QBkm0=;
        b=C7CDxJxueJIkNLl2XHvb/RlP7iMjbGGDHV2wCtp3Zqi2drkLpIhWYsB8jj1TdKGDCV
         8GXKE2AYzY1+3C1FvEumaflcVeocC7C2gC5vrxPjbdvqfmcPIjEQHec4J5Nk6rO9ums9
         qGs+yGpEvNRCrH2+EBgwLeKJBBf1BrZw7JnZYY+G2sDUvPFMhaxwBOS0nzeAFlJ79ogM
         Il/WTZTX0+vj3UU04V79eBnYa74ajwdUogaVsrYV5oTmReT/vTK42i2+OBRkHu8jMUPK
         dvsQ0iSR9SsK4ys3Mv09NKBRkfnXoNhDRePnPx6pjzdDPVKHHksBOIZke4jPADXeY1rk
         fw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748858246; x=1749463046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TagJ5NmzFstYvgldSkZEvuo6UCP97Llml2SjE3QBkm0=;
        b=Io8ILOb+KzBJJE/UTC2zTYTjIjNHOvZ0sxNrcc29pjLzuHjEEj6Y73jceBZvJlghgB
         AiqorDtHAM7zJCgXHKbuixHjSIMXG0uVEBJSIlgL4b4kqnwCzkt4L9XN7hntYiXauYKL
         Gsmwt3MWL6aNWANld/OrYLnzdlTp2UC9jcEWuO3wsYF2A3dLjX2U86/jK2lkhzPgxWgx
         H4RkJvCVoB8tuqbrIymmkYDg/QRxIFLy1jt23LhoyV1HSawADIckjNbMCzcMfF8NW1l8
         /UvEK2hVbKC6hcw4Wt1hkulZJs4AYr1Al1vk4cr+LxQ/KPqMOZ5gIu3yBDMQZ+nNaMt0
         iMiA==
X-Forwarded-Encrypted: i=1; AJvYcCX7oR3WlHEJSfM5SypV71VSlrKQjCRDZadeGqDse7CNA70qvPdUDJd9Cpm9TuPaSoHUrxO07lmLtGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1Qn1ZoJ0sBKU0jGOs6gxIyDPNBoDYgtT7SKdaOQou3T0vcozc
	TQpQBOPWtEyRdc+NXXdAyDni6kwW+7iKA25ChlBF5132mVRxF+KGRf8KMzgkmODjOw==
X-Gm-Gg: ASbGncsC04GVq/7ddiDC8OZ/PNXLn+MOsfwrRf50x6TBlFtu8x0vGIgHQS/RB6LxP2G
	5wir1W993pYaUlbXy5S1Gpcby9QT3T/zEei7UkDyyt8wquljEBa1rEJ5/3fPFjXzg01cJptbg40
	Igzp6pty7gkLiHeVqxzkDt9z59ulFtGFKmj3StwXOzGXkuSgZ7UlXyP3Ur7frMfvrzJj2EfpCT+
	sfjp9vJJhzikOJvKL4pD7Ll3+gt76S0ky7A9Xy8gOuk0614Qak5fflGdp7YzXFMdDXljT0FrkEF
	rk3CU5m62m1kFdX7/J3RSSRIwOaXnm3fVsC4qnHORjGlvIG8V4/YvGPZKbTtRnX5dFyBztog6kX
	hP+PTZbvo0gqftpfOA3X7PKfftc8Wy2dBOHt/pICdJFLoH0g=
X-Google-Smtp-Source: AGHT+IEGVugMmWOPJ8+NtAUxdKxYxH9fzczCH7ftA7my9C5nS+L9TdK1jfoHxFjn3NvMvLYMVc81Aw==
X-Received: by 2002:a05:6000:2510:b0:3a4:fc75:d017 with SMTP id ffacd0b85a97d-3a4fc75de24mr6418448f8f.26.1748858245604;
        Mon, 02 Jun 2025 02:57:25 -0700 (PDT)
Message-ID: <99a39800-dbba-4d37-afcb-ae041af648f4@suse.com>
Date: Mon, 2 Jun 2025 11:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/alternatives: Rework get_ideal_nops()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
 <20250522150015.555492-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250522150015.555492-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2025 17:00, Andrew Cooper wrote:
> The {k8,p6}_nops[] arrays are both 80-byte structures indexing 45-byte
> structures.  Furthermore, perhaps unusually for C, the source layout is an
> obvious hint about the trangular nature of the structure.
> 
> Therefore, we can replace the pointer chase with some simple arithmatic.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> The implemenation of get_ideal_nops() changes from:
> 
>     mov    0x19bc41(%rip),%rax        # <ideal_nops>
>     mov    %edi,%edi
>     mov    (%rax,%rdi,8),%rax
>     jmp    <__x86_return_thunk>
> 
> to:
> 
>     lea    -0x1(%rdi),%eax
>     imul   %edi,%eax
>     shr    %eax
>     add    0x67fc1(%rip),%rax        # <ideal_nops>
>     jmp    <__x86_return_thunk>
> 
> The imul has a latency of 3 cycles on all CPUs back to the K8 and Nehalem.
> It's better than an extra deference on all CPUs, even the older ones.

While this is all good, what we're losing is ...

> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -20,7 +20,7 @@
>  #define MAX_PATCH_LEN (255-1)
>  
>  #ifdef K8_NOP1
> -static const unsigned char k8nops[] init_or_livepatch_const = {
> +static const unsigned char k8_nops[] init_or_livepatch_const = {
>      K8_NOP1,
>      K8_NOP2,
>      K8_NOP3,
> @@ -31,22 +31,10 @@ static const unsigned char k8nops[] init_or_livepatch_const = {
>      K8_NOP8,
>      K8_NOP9,
>  };
> -static const unsigned char * const k8_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {

... the (at least visual) connection to ASM_NOP_MAX. Could I talk you into
adding build time array-size checks for both arrays, to restore the
connection?

> -    NULL,
> -    k8nops,
> -    k8nops + 1,
> -    k8nops + 1 + 2,
> -    k8nops + 1 + 2 + 3,
> -    k8nops + 1 + 2 + 3 + 4,
> -    k8nops + 1 + 2 + 3 + 4 + 5,
> -    k8nops + 1 + 2 + 3 + 4 + 5 + 6,
> -    k8nops + 1 + 2 + 3 + 4 + 5 + 6 + 7,
> -    k8nops + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8,
> -};
>  #endif
>  
>  #ifdef P6_NOP1
> -static const unsigned char p6nops[] init_or_livepatch_const = {
> +static const unsigned char p6_nops[] init_or_livepatch_const = {
>      P6_NOP1,
>      P6_NOP2,
>      P6_NOP3,
> @@ -57,21 +45,9 @@ static const unsigned char p6nops[] init_or_livepatch_const = {
>      P6_NOP8,
>      P6_NOP9,
>  };
> -static const unsigned char * const p6_nops[ASM_NOP_MAX+1] init_or_livepatch_constrel = {
> -    NULL,
> -    p6nops,
> -    p6nops + 1,
> -    p6nops + 1 + 2,
> -    p6nops + 1 + 2 + 3,
> -    p6nops + 1 + 2 + 3 + 4,
> -    p6nops + 1 + 2 + 3 + 4 + 5,
> -    p6nops + 1 + 2 + 3 + 4 + 5 + 6,
> -    p6nops + 1 + 2 + 3 + 4 + 5 + 6 + 7,
> -    p6nops + 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8,
> -};
>  #endif
>  
> -static const unsigned char * const *ideal_nops init_or_livepatch_data = p6_nops;
> +static const unsigned char *ideal_nops init_or_livepatch_data = p6_nops;
>  
>  #ifdef HAVE_AS_NOPS_DIRECTIVE
>  
> @@ -86,9 +62,17 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
>  # define toolchain_nops_are_ideal false
>  #endif
>  
> +/*
> + * Both k8_nops[] and p6_nops[] are flattened triangular data structures,
> + * making the offsets easy to calculate.
> + *
> + * To get the start of NOP $N, we want to calculate T($N - 1)
> + */
>  static const unsigned char *get_ideal_nops(unsigned int noplen)
>  {
> -    return ideal_nops[noplen];
> +    unsigned int offset = ((noplen - 1) * noplen) / 2;
> +
> +    return &ideal_nops[offset];
>  }
>  
>  static void __init arch_init_ideal_nops(void)


