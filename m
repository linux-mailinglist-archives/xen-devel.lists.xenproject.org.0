Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF509EB1DC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852396.1266201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0GQ-0004PD-GV; Tue, 10 Dec 2024 13:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852396.1266201; Tue, 10 Dec 2024 13:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0GQ-0004N0-D8; Tue, 10 Dec 2024 13:26:58 +0000
Received: by outflank-mailman (input) for mailman id 852396;
 Tue, 10 Dec 2024 13:26:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0GO-0004Mc-Ga
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:26:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c296b24-b6fa-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 14:26:54 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-435005192d1so12279945e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:26:54 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf3cd1sm15724820f8f.11.2024.12.10.05.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:26:53 -0800 (PST)
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
X-Inumbo-ID: 6c296b24-b6fa-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733837214; x=1734442014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jJMXFVxMugF63Nop9kk5EIhsyJ/0PX6YgvNpqTxhmV4=;
        b=F7nrgCVlCpglRHwDYuODJgNRg1FzBgp6ZHGb4LFsznyEKQxpBmQ+AittFxZoyRUNYP
         BsBz6PLhxk7xsmPAgFzPQpQnzRpAnGDMYdO+2Q5ssIfdGubVwtCcn3nru7KF71ucSBUo
         Orb3xKFKDV6tnktLf/wG68Nr7DBG+Chad635Ae1Ake2f90cMCdTOqnjit1iNFXPyRxB7
         HpprjCCScb3c7X+xxSs/XrFAg2+NvgRkPw2ATmJ+tBVY0LurxDFrsxvAkVKdfyK75VNV
         zXRoE5bP7v2uuJJHQz9qC4GUNlJcg3av49TIu8IZGJdKqd1mAuXIKYtYZ5IyF4cntjKM
         X5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733837214; x=1734442014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJMXFVxMugF63Nop9kk5EIhsyJ/0PX6YgvNpqTxhmV4=;
        b=e2r6XSjas/d7jbPfuVdP23osSQorF/xHAz3E3OkcOVIjq4OHWh3fQSjzd2K1nY5ERc
         WW480BbTc95i7mPZTRrFu6Tvd6JqGoKccLzsUFjoG7/Hgl5t96CkvGbJNv/DmK2fo1fo
         /gh/t863342GQi4T2Fac0IGP8T/28kRpvttmWJ58Wj2K8E90mbNILVXx8N4pQ6sv9IDj
         YnwKirRz927Y79YSxLTz4jEO9acc+/8qzaENeO3q4Ld2lgMplPd46gfvshJl9kWX4GkS
         OwsRoRPIPsOUOS3rcxPOUhIC1qpGzc+CJGaAo7WCEWvr1tW5R81lcjEEMcwU+NatAqMk
         2VCw==
X-Forwarded-Encrypted: i=1; AJvYcCVwP3eGkTOx2TIF6xmb13h8l3U9BGHq79CCjP7Y1XyFNqBHdMjgQsAuU9zIpHoGMT99Iq3LeWg0el4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRjJtf99SrRyCLyLaYnbmv4dFMcgpvaGYP9l60OZB/86OowNeV
	RvDNZfpJJ54D9vG6p4iVN2Qcy7JFgpbv5Moe8ptFfmOXH0PIY7TTnVlaWK0NYQ==
X-Gm-Gg: ASbGncu6IlzpcTYIZZR6AbADveEMewkzl2lvYslVpIKxXQ5rqwEHw7buWGz1RH2dLzu
	k1DMAQNrRHG+hZrjtMZSy2aiDNjj7pAOCpBLDr+5emxIyMTFjHB92sp/KFIOmhC3wSKtMGR4JSA
	08IehEIvAVAq3mJHdVAFnRklsz7OT9frMsK7OY65It/0OXJCtLosbSz6/d7pb1iwwASdg4T7kKW
	qSd3S2/tPU7stoUbqw/kE+QG2/t3Xcz3aTbktc7MTAkV8djfvig2IpYR6hRkqTVsw4bh73nLzO+
	8G8d9yBk1rbvkTbi3q75RCYMYCF8SEpyVaEkFKc8RAr/gWW+/FBTIiNWHHtGOoWFbWktaCq1cW0
	YnUGh3w+oDQ==
X-Google-Smtp-Source: AGHT+IHJy5jf/nkFHcTuKmAZWrxeF0bdXR3TuRJ5r+3ScchBmI/bhZB5G506a0q+8dzai4Bbb1dnrQ==
X-Received: by 2002:a05:6000:794:b0:385:f64e:f163 with SMTP id ffacd0b85a97d-3862b397b58mr12534704f8f.32.1733837214035;
        Tue, 10 Dec 2024 05:26:54 -0800 (PST)
Message-ID: <904a209f-a917-4767-baf4-333b1cf8c084@suse.com>
Date: Tue, 10 Dec 2024 14:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/35] x86/domain: introduce domain_has_vuart()
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-8-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-8-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -506,6 +506,9 @@ struct arch_domain
>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>  #define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
>  
> +/* NB: same symbol as in Arm port */
> +#define domain_has_vuart(d) false

This being the 3rd effectively identical patch, perhaps instead we want
to default domain_has_vuart() to false unless an arch provides its own
definition? Much like we do for a few other such items?

Jan


