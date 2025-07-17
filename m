Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE4FB087AF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 10:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046343.1416661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJiC-0006Tn-RB; Thu, 17 Jul 2025 08:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046343.1416661; Thu, 17 Jul 2025 08:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJiC-0006R4-Ng; Thu, 17 Jul 2025 08:11:28 +0000
Received: by outflank-mailman (input) for mailman id 1046343;
 Thu, 17 Jul 2025 08:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucJiB-0006Qy-H8
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 08:11:27 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a196f9cb-62e5-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 10:11:24 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b611665b96so346805f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 01:11:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf828a39sm1034997a91.44.2025.07.17.01.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 01:11:23 -0700 (PDT)
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
X-Inumbo-ID: a196f9cb-62e5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752739884; x=1753344684; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SSr7XjYCDDILexVG3Wa24/Z+XpPF5/17BvhJtf9qYzc=;
        b=HGEtGalzamCS3VKdukfB3JHLWrHD31Lw/slFvjFjbPC8dm/eYTndJbt0gpkgSdlbDr
         BPFkHzRjZM11vG50KlSpedVa0Dae0W/u4lVj9ERPUbJ2wI7QtQi7jJVlqf56kHRRw0LX
         uQUOHhG7w+xBIldZvPIo+HI4YHlr1sDHWtqd6iHpuTKwAYlht1voYvX4BlxeFLG81CyW
         CCSf/+udGCwVk4hTNhPcrpWkVFDLoe883et1NmVELyK+eVuZe2xJSazfFsaisxccj/IB
         eGEHMdwE4Oz8f3KXdSVwTK8XLemhWfieStiFM/2xVxBeEfsjgt2a4rddwxD4degwuWtU
         p7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752739884; x=1753344684;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSr7XjYCDDILexVG3Wa24/Z+XpPF5/17BvhJtf9qYzc=;
        b=mhQIDwn4BPPJSP+MoGyNpXBzLTANtV9zVdsU88WnQGZ2kErsdV0DS17mpGwACZmGVX
         moyHmANz8IuRWE9OrzjUKGvkB3p5KPCqkXXflbl7c8XWczxAHIAYDC3Un8vlmAz46LJb
         tqXNBBk6qy5h5rMKVfqE3HinLPVNBqWb4wi/xZexD7g0hzE4IimN2V8/MVyKMM8rYOCP
         pluxbc+PuCAkcMju1GC4dbSqbOBdn8pLvgTHNgV/mUX4G29SQjXHcFgoBVGr3PlE8xXC
         mk9esTPaGfE4qAaKhzD9/Y4yhMx5vAu+NZSTjTnRphPjz/gmMhTTtOjjS08GiQw/o4A/
         9VXg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+xQXHWKijrFt3NDVF4SXYEISsq7HGYNigqJSokzwz+2Ttx5u/M1vx9GdEsO42j+J4EVA0MccLtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyzi5RkxaEM438wCx47WGHBZYWLG12vDiOo0nVzcSSeCvGqsxHv
	x5gDPfNIU0h+INH5fdH+S7bvv81kOGJysXU1gXzVr1Y4+mfSHHM6I1Jzy6laJkBErHnA5+jDkLo
	S8D8=
X-Gm-Gg: ASbGncuzB8UZkQXBb6tYrDHzb/S/KWxP4Oxq/6p84QAWLw5kDxdnqnsfXTlwITzTLNW
	CWvV93MQAK9nD4jLwldpy84WozpGmaqDRfRgIRAAE9rLFlmTuk6HMJI64gpmZyO+nLWzUxMIxYG
	yaZTAS8udeFRJazL+zCQGYdFBtUQtYo4mdRT/4BITqPSsyLA3kVKNecaeBS+I2x7OzD8zy4Oa8P
	aTnl3xQKG2plY6SrAc8wYpmf6saqIlvx+dn3cKB2LgE+PYqmKiTOK9cR7Tb3Rq0tLjXkeKUI7VS
	zLeH78f8LlgnzwvWe2me+Rd4UaRc9se8v3LB+bbwl47V5WsCcMcyRDYTfNX3+p1gpIHuD1Qkn0N
	aXUwSp5p0m0bI8Rhc41m/mf1BhK3QYvG7V100netw4W8UX8PayMtSEa4mALQVi9qatMQcx+YbXR
	mjFlzRAE4=
X-Google-Smtp-Source: AGHT+IEbOyerxwJLitLyUD93swIaqJyeDxxUOvbt8w2X6DmE1GcfVADfUGS6GNKq+PS0X7jR4jHSrQ==
X-Received: by 2002:a05:6000:288b:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b60e51bb18mr4738473f8f.44.1752739883953;
        Thu, 17 Jul 2025 01:11:23 -0700 (PDT)
Message-ID: <a6abcc07-535f-433b-948a-702dc33093fa@suse.com>
Date: Thu, 17 Jul 2025 10:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/match-cpu: Support matching on steppings
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250716173132.2213891-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 19:31, Andrew Cooper wrote:
> Architecturally, stepping is a 4-bit field, so a uint16_t suffices for a
> bitmap of steppings.
> 
> In order to keep the size of struct x86_cpu_id the same, shrink the vendor and
> family fields, neither of which need to be uint16_t in Xen.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Linux supports all fields being optional.  This has lead to using
> X86_MATCH_CPU(ANY, ANY, ANY, ANY, FEATURE_FOO, NULL) in place of
> boot_cpu_has(), and is not a construct I think we want to encorage.

+1

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -1003,13 +1003,15 @@ const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
>  	const struct x86_cpu_id *m;
>  	const struct cpuinfo_x86 *c = &boot_cpu_data;
>  
> -	for (m = table; m->vendor | m->family | m->model | m->feature; m++) {
> +	for (m = table; m->vendor | m->family | m->model | m->steppings | m->feature; m++) {

Nit: Line length. But - do we need the change at all? It looks entirely
implausible to me to use ->steppings with all of vendor, family, and
model being *_ANY (if, as per below, they would be 0 in the first place).

Tangential: The ->feature check is slightly odd here. With everything
else being a wildcard (assuming these are 0; I can't find any X86_*_ANY
in the code base; INTEL_FAM6_ANY expands to X86_MODEL_ANY, but is itself
also not used anywhere), one wouldn't be able to use FPU, as that's
feature index 0. I notice though that ...

>  		if (c->x86_vendor != m->vendor)
>  			continue;
>  		if (c->x86 != m->family)
>  			continue;
>  		if (c->x86_model != m->model)
>  			continue;

... X86_*_ANY also aren't catered for here. Hence it remains unclear
what value those constants would actually be meant to have.

Further tangential: The vendor check could in principle permit for
multiple vendors (e.g. AMD any Hygon at the same time), considering that
we use bit masks now. That would require the != there to change, though.

> --- a/xen/arch/x86/include/asm/match-cpu.h
> +++ b/xen/arch/x86/include/asm/match-cpu.h
> @@ -8,28 +8,32 @@
>  #include <asm/intel-family.h>
>  #include <asm/x86-vendors.h>
>  
> +#define X86_STEPPINGS_ANY 0

Given the (deliberate aiui) plural, maybe better X86_STEPPINGS_ALL?

Also perhaps use 0xffff as the value, allowing to drop part of the
conditional in x86_match_cpu()?

>  #define X86_FEATURE_ANY X86_FEATURE_LM
>  
>  struct x86_cpu_id {
> -    uint16_t vendor;
> -    uint16_t family;
> +    uint8_t vendor;

Is shrinking this to 8 bits a good idea? We use 5 of them already. (Of
course we can re-enlarge later, if and when the need arises.)

> +    uint8_t family;

The family formula allows the value to be up to 0x10e. The return type
of get_cpu_family() is therefore wrong too, strictly speaking. As is
struct cpuinfo_x86's x86 field.

>      uint16_t model;

Whereas the model is strictly limited to 8 bits.

Jan

