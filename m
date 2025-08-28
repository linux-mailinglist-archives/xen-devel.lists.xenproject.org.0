Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C7B39CB7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098630.1452635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbYs-0002PD-Sl; Thu, 28 Aug 2025 12:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098630.1452635; Thu, 28 Aug 2025 12:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbYs-0002Mk-PA; Thu, 28 Aug 2025 12:17:02 +0000
Received: by outflank-mailman (input) for mailman id 1098630;
 Thu, 28 Aug 2025 12:17:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urbYr-0002Me-MH
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:17:01 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e648a41d-8408-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 14:17:00 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f501cso1088347a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 05:17:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c311a02b5sm10810852a12.1.2025.08.28.05.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 05:16:54 -0700 (PDT)
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
X-Inumbo-ID: e648a41d-8408-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756383420; x=1756988220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zQh2JZtFVRMc4Oq8/jNGlceVOcPkc1UDRC4lZ4c/vf0=;
        b=CV0J0bdtcP5ZSVR04UvJRvTxHSsSi0KNsZB179JUlhLViTsM8ZLNEpHKTBSpkG9OXb
         8dYTwQInl/EhyukyyI7aexL7diSc795SflO3jtJRhpZuJDrhBHBpKghwOgGtd1yd0uLC
         NpyvwJdCNa8RTgoYnIFgEyhpXX6dRvz7ttpmZyDWfZSymp+J9/LBtOUVR0NwOWdwl0VO
         0t+bGXEkEg31cZXkGr208+YHPYodalsbu7aPgb+vlYhihN2dcCRvLNK7Vxy5jt0xwe7/
         UCe250Je8bjWvMhKvT501pJDFp2ZlYcrxLlJo9+syv00OgmZqcIEWglDayKfQaBG0j5H
         MCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383420; x=1756988220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQh2JZtFVRMc4Oq8/jNGlceVOcPkc1UDRC4lZ4c/vf0=;
        b=pFQbc1ONXhZExjNvx5DksoUeiYMwqjM3JoVPppHuOpe1QsvUptET4BuOfr4YTkZwEB
         cO92yr5maoBjbhmhDFXpqR9hP4121fv/qQ+amRPnAsuPb0KcNZiaeRRPprr/2qwJQO5Q
         0O1HYgMSpBiKkCMUewZJpYASeiPpKmHnqVSEd21VkvFnhw28ckmxfqnqgpP8rT26KY0f
         r8ejJiwms47LHxjubmvhMf1Q78ywuwOjwcK0vlK34T9WA2QYjRGeaZjxDeLeLB9tvVWV
         Qy7706mrYERV/zrCYTQwDo9cwkRlbgfNCCrsdzoi+rvmWiH36+77zbiVt2AK3G3MiDot
         Nm9g==
X-Forwarded-Encrypted: i=1; AJvYcCWHBNCCHcGMX6pPHxqWn0EIqH4glFNcALJbeJ53z7y1JF3i6Qkbz8Kw4GHOhfan7bxEJ4Ag3uLmhrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1CNL0tb9oHk91UsZDObBP+cDHuxSgAe1s8I88Ksk9H5f3yo0x
	oTeOLjzvP5rXJ+JaLIyxVED4DgQD/TjqLf4SQk4+s3ZQxNV03hdkrWW8aOQM1YZOlw==
X-Gm-Gg: ASbGncupDN+xxO18hYB3zGUxOWxB+h9oHsSUNdDScupCwr7BWIRWIPoJKGMgEe+BETd
	OpdR+o16KRfvNoXf9FObSKBpmqaVdMeimPF2zKVNgjNta7fh7M1JcbQAQZvNLkN8HqPt0Sv+w6V
	nzeZc9oLAb7gBhNBlZWEjUYtpXAxwsxOUbv/8x4rxzm3Sj2fk9i+uMf8KmMKklwQcRlPe3875u0
	x6mqf1xL+mjCogPh5Tuz1O2ZuT458KiUA3lESYG79KimxxBdkTLpcvzzHdsfpcERpjvW5wFKyYI
	tQC2w2wrITGqBLRc6c45XThXZzs6HOZHsznYOCjLNzsMMOzbM05UFXSOt2b38epO/MTACvPdksS
	HOnV8fyKlRftRHx2VkUocXGiotJTRTBuOlxQVd0dYvEpBtM2eKHUbEdHE4MiIVGSxwcs5LF9lXT
	zQethoBmvzElvUoS+mLg==
X-Google-Smtp-Source: AGHT+IGK7RJKGiiMDLf6hyY59X6poOsi//7aEb4tHPvsU08qcdA74qsJNtm9TL97s/a1HF4UgDK4NQ==
X-Received: by 2002:a05:6402:52c4:b0:617:b662:2272 with SMTP id 4fb4d7f45d1cf-61c1b6f9d31mr19268044a12.33.1756383414766;
        Thu, 28 Aug 2025 05:16:54 -0700 (PDT)
Message-ID: <d934464e-03f5-4133-8b87-d5bb1b031d9b@suse.com>
Date: Thu, 28 Aug 2025 14:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/9] x86/hvm: Use direct structures instead of guest
 handles
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech>
 <de595114d532e0fa6c885c47cf2b3551ad495525.1755785258.git.teddy.astie@vates.tech>
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
In-Reply-To: <de595114d532e0fa6c885c47cf2b3551ad495525.1755785258.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:25, Teddy Astie wrote:
> Make these functions work with hypervisor-owned pointer rather than
> guest handles, so the function parameters don't have to live in guest memory.

This is odd to read - the function parameters (arguments) didn't live in
guest memory before either.

> No functional changes intended.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
>  xen/arch/x86/hvm/hvm.c | 126 +++++++++++++++++++++++------------------
>  1 file changed, 70 insertions(+), 56 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 56c7de3977..8bf59c63fe 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4142,19 +4142,14 @@ static int hvmop_flush_tlb_all(void)
>      return paging_flush_tlb(NULL) ? 0 : -ERESTART;
>  }
>  
> -static int hvmop_set_evtchn_upcall_vector(
> -    XEN_GUEST_HANDLE_PARAM(xen_hvm_evtchn_upcall_vector_t) uop)
> +static int hvmop_set_evtchn_upcall_vector(xen_hvm_evtchn_upcall_vector_t op)

Please can we avoid passing structures by value?

More generally: This one-by-one adjustment is what I'd really like to avoid
with any new interface. It would be far better if ...

>  {
> -    xen_hvm_evtchn_upcall_vector_t op;
>      struct domain *d = current->domain;
>      struct vcpu *v;
>  
>      if ( !is_hvm_domain(d) )
>          return -EINVAL;
>  
> -    if ( copy_from_guest(&op, uop, 1) )
> -        return -EFAULT;

... copy_from_guest() could transparantly handle both cases (virtual and
physical addresses being used). And yes, this would exclude an "everying in
registers" approach.

> @@ -5115,28 +5087,70 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>      switch ( op )
>      {
>      case HVMOP_set_evtchn_upcall_vector:
> -        rc = hvmop_set_evtchn_upcall_vector(
> -            guest_handle_cast(arg, xen_hvm_evtchn_upcall_vector_t));
> +    {
> +        struct xen_hvm_evtchn_upcall_vector op;
> +
> +        if ( copy_from_guest(&op, arg, 1) )
> +        {
> +            rc = -EFAULT;
> +            break;
> +        }
> +
> +        rc = hvmop_set_evtchn_upcall_vector(op);
>          break;
> +    }
>      
>      case HVMOP_set_param:
> -        rc = hvmop_set_param(
> -            guest_handle_cast(arg, xen_hvm_param_t));
> +    {
> +        struct xen_hvm_param op;
> +        
> +        if ( copy_from_guest(&op, arg, 1) )
> +        {
> +            rc = -EFAULT;
> +            break;
> +        }
> +
> +        rc = hvmop_set_param(op);
>          break;
> +    }
>  
>      case HVMOP_get_param:
> -        rc = hvmop_get_param(
> -            guest_handle_cast(arg, xen_hvm_param_t));
> +    {
> +        struct xen_hvm_param op;
> +        
> +        if ( copy_from_guest(&op, arg, 1) )
> +        {
> +            rc = -EFAULT;
> +            break;
> +        }
> +
> +        rc = hvmop_get_param(&op);
> +
> +        if ( !rc && copy_to_guest(arg, &op, 1) )

Why would the original __copy_to_guest() need to change to copy_to_guest()?

Jan

