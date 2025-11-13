Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1496C56DAE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 11:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160902.1488953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUaD-00064d-Dq; Thu, 13 Nov 2025 10:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160902.1488953; Thu, 13 Nov 2025 10:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUaD-00061m-A3; Thu, 13 Nov 2025 10:29:41 +0000
Received: by outflank-mailman (input) for mailman id 1160902;
 Thu, 13 Nov 2025 10:29:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJUaB-00061f-Jj
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 10:29:39 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a78378b0-c07b-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 11:29:37 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7277324204so81265066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 02:29:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80a06sm134164866b.38.2025.11.13.02.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:29:36 -0800 (PST)
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
X-Inumbo-ID: a78378b0-c07b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763029777; x=1763634577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ttcA9edh9vnp+IaPKlmzYvg8f0SUWfOabydm86TO2Q=;
        b=IVvmGsSri+tFlOnVbL3aze43B6fFD8AtxRt4miNXjRpkCArPL1vR/0e3d9CKeIloqf
         09qpWv8V41MH2b0faxwdNulhTfHFw78pomfa8vokN2cs95ksXnQNqcGl9adO9//iURLb
         JuMbtyMFoWR4iNSq2/IFIwknyXyCPrFNc+4xGsZILZi+V2a7WcfMo8qlZAywKUOtggmc
         KLJNDKNxxkZr0XqJLqUYp/gsLuMkuyUBAflTj5e1+G8h1DPtVlj0GMUvFVizlMc5IZeP
         NbRzfEemd/avyX/eWempmjxmFZDQb1nRwvIgm5tuCbDJPOLTzgyXJQ8K8uKdgz16My7+
         IrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763029777; x=1763634577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ttcA9edh9vnp+IaPKlmzYvg8f0SUWfOabydm86TO2Q=;
        b=BUZLNeShmqTXVWpdm3oGi5rKx1Fsu96dVx3dyTW9sjqGhFcIPq38oQF0ml3/TX+E3F
         UzGyIwIW4ETWzEyXTA+/c6OPsqlLpYbD8NMbpKKCBK22GcExAshRliIIVZcCo2ikSsO+
         +vYjM5V3eZkAdqzCn524ylAWLPlwb3P1ZtbKRDeKqSGifDXR+WbbIgHkKF7z9+8qkR+7
         3WjKckHs8jkMR2SiogPhkAZKLnsDlbeqs4fsuzDeuLJ5D075U0A+j2C5yo0En75RNFjC
         VoDl+3FsMvKe+Up3Z5du8+/dygztZjPKi4L/9yoHu4oR+vnPvPkxIUFUdq9v2BXySrE/
         daxA==
X-Forwarded-Encrypted: i=1; AJvYcCVjpp55myJPL6DJ5DUeK/rI8eRe9IsuA0x5q9ToommJ2C3aoLJ34vkMh9/uPni4TOZviUaD5zqypEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUTuATFNe1Lv71dsCQn0GV23T3WWr24vePh2HqReeJ/SmqUykN
	/vHSag9oA1nGQU5+NvNFO45SJep5qThCoywDGYCq3kGOcjs31UdPY0Z5BqeE6MyVpA==
X-Gm-Gg: ASbGncubMvPYQEjFI1taie4MaqrJxt7oKgd2Y6Inv8OLJj9g/4Q+UUWx1WddyKlJCuV
	Q4ebgT8uevY7Hj00bBg8ptkZWhDElHkGimprXnwTIb+v2/s+N/cL7ywnvu9NvtYFxyLSI5gue+X
	fbNdIScwMjLoaWaoH/GfsCNwzbnztX8y4WxyTvJut+qeJWaIjGSLEr8px+fy+ERcS3NjgGbCVed
	MM8RcsgmqbsUyTUO0QE1Vvb2wdGIq6O/fj2Up/bLk9oVbV0i3Zrb6uADYmaU46WiOrxhCf+Z+cp
	7Y3/6ojVIeJtbQG40KiMbLblTu0h6mtBzqZEvwA70KBrW/f2dehzmu7a5KWyzsuCLffZzM+cCSG
	OAdpNZ1jF3eBqv+inD2pZa4yBfC2SoLEjw3nXaK9MgaWk436IbOWg4RqEZpMlZ2O+iGqA7KVvxC
	z+XSGM5mZqdmhwuiFNVsmIBZ06FV48dRKER/8/wG1Yrvd7Y6tHtqga4x7Y9KwCAEH6AgKurtevD
	KQVTvjEIWJyyw==
X-Google-Smtp-Source: AGHT+IFlknKAqvfPEPQoWhbYleuFC3W8dyH1oZCn+Zw67IzAu9StQ82zBWbFs6ALa223/eCd74evVw==
X-Received: by 2002:a17:906:31d2:b0:b73:52c7:faba with SMTP id a640c23a62f3a-b7352c81c04mr114435266b.4.1763029776630;
        Thu, 13 Nov 2025 02:29:36 -0800 (PST)
Message-ID: <2b05b9e8-3f87-41d9-8073-5a4d5c9238ae@suse.com>
Date: Thu, 13 Nov 2025 11:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20251112201800.3678184-1-kevin.lampis@citrix.com>
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
In-Reply-To: <20251112201800.3678184-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 21:18, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.

Needs you S-o-b. Also the subject is too generic - it gives the impression
that you do the transformation for all of xen/arch/x86/.

Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with two remarks:

> @@ -657,8 +659,8 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
>  	/* Work around errata */
>  	Intel_errata_workarounds(c);
>  
> -	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> -		(c->x86 == 0x6 && c->x86_model >= 0x0e))
> +	if ((c->family == 0xf && c->model >= 0x03) ||
> +		(c->family == 0x6 && c->model >= 0x0e))
>  		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);

While you touch this, indentation also wants correcting.

> --- a/xen/arch/x86/include/asm/intel-family.h
> +++ b/xen/arch/x86/include/asm/intel-family.h
> @@ -179,6 +179,10 @@
>  #define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
>  #define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
>  
> +/* Family 15 - NetBurst */
> +#define INTEL_P4_WILLAMETTE		IFM(15, 0x01) /* Also Xeon Foster */
> +#define INTEL_P4_PRESCOTT		IFM(15, 0x03)

Any reason not to also add the other two that Linux has in this group:

#define INTEL_P4_PRESCOTT_2M		IFM(15, 0x04)
#define INTEL_P4_CEDARMILL		IFM(15, 0x06) /* Also Xeon Dempsey */

?

Jan

