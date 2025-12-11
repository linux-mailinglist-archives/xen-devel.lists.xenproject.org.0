Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE59BCB51DA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 09:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183674.1506288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTc9g-0005LB-24; Thu, 11 Dec 2025 08:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183674.1506288; Thu, 11 Dec 2025 08:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTc9f-0005Ic-Vk; Thu, 11 Dec 2025 08:36:07 +0000
Received: by outflank-mailman (input) for mailman id 1183674;
 Thu, 11 Dec 2025 08:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTc9e-0005IW-9T
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 08:36:06 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e75e10f-d66c-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 09:36:04 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so3838575e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 00:36:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a6fd62sm4583373f8f.10.2025.12.11.00.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 00:36:03 -0800 (PST)
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
X-Inumbo-ID: 6e75e10f-d66c-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765442164; x=1766046964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bDtPUDKKMk4nFwEr5IHIcAO4aTBeiNvZxrTN7QzbzB4=;
        b=YXhNOyhZHJfVGP63YZ0BRFkNfGgW0r1FOhDVoIU6ug6yOXL2sQ7hqDRaLjNnk95PaH
         KE3MQFAto1LJCUpHEEQccyA/yhVwwpSo26igteuDlXive1XtDBdwV1IKIamg4gV0UGJW
         b144QBd1HvGFpABi/q9WdCqsI330Hiy6zJj50a7iRfaxCbPqMdwsUkUDfHYXApxvxFEB
         vIIp98ZWCTjhVWLcvY5/02SfSSZUEamu8B7bbfh8e5C5rYMbGJGXUiYKQ+fSj7IX50Em
         c05JLDFxURhXBFvwNXko2z+EjnfnEYtgoEMc6opFTVS5bA+Q+ZnMQJ/LOVNUhrDSDhyn
         9GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765442164; x=1766046964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDtPUDKKMk4nFwEr5IHIcAO4aTBeiNvZxrTN7QzbzB4=;
        b=JK5/7pUGMFMqcBv4pd9slAH9M4hlBO5wyeFaEfzbR6IcHLmQyYiaBdH+pt8Mwyfhhg
         ZRTCwW6K/yqy9BMzNbv5EwQxybsLRnJTJvLfY7G7BW0sD6m4EeBxJ3GXRdZj3lM2vCBR
         pR9/HeAKaCEyBKPfHjwvWDCYelNRZXE7u0HVyT8QGJO6/z1ueBMgl1cFaBoMGzqy3a5D
         KB1AmBc22V/yxzN8fskNgeIbgDujn4t0wKJ518xjrt0/9pgWnp5WuLXrEhwZ/n8txSzS
         uJKKECxQI6Xwd5OhCieeHIyX6P89rpcBWPFRnaDuaOS4QYcDctdU9TCK3I57W/H54U7F
         hWZw==
X-Forwarded-Encrypted: i=1; AJvYcCUzm0qrdpa6vW4Rzwas8y0dmC1d95ifko9xPMiQ+M5FAKhio0r0XtxTujABdfcoIbJta/N18RA3Xi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoDlzWfnKGhEguLTjrSBS+tesYD6WX7X3H57KbaBVljb48rBzc
	9jVNqjQS1D6vtilVC29V4Uw72kH+oT0cGnxjdMXwp79yn0qOYy5AAVqc4EmoPC267Q==
X-Gm-Gg: AY/fxX7Aq0Z8qXOb38NAitgs6sekIDd2ioTvebSP3xJb22iq/24XABQX7Fn+G2CtR33
	R3Ozn5WxodHcjrI/ec7TpKLt9vjekfDOnXXMHNUzLWVJGyxOGkmBpITowjIBEshGXMb6pVH6dNJ
	cCK/NZt+qHKtTDOnqKz4HRO2PaosIg3QhBYjpxxjSxyceW8wSPNkeRtFcJUcvIzI78fK7urb+Rg
	iHtu7wnghA0/47M4MBWne2a/LyuZB3bwoRAsUWKAdZD7PYD3Mie6em20MVBCDjk0JQni6mjTF2b
	0sP8W538E9iZSJxB7KbN1EgtYm0fknPhxus8QKZkDPcF1J0Nzw5d0tyVczEp41TedHBNR+zEBmw
	pWZ4L7CHVZHTq/rcQHnVH5jHTYSVGVS5hlAzn0972akYw6WMDDwgOjDH1jVc5NY/pd9ZQsgDn2X
	BDR3RHPm14ifRdN91wic14qsFMDA0IT6JcY9BIElR5FsvasQyEObbZ1AWcTiHNQ0+oI6yl9f8Yi
	v0=
X-Google-Smtp-Source: AGHT+IH+J2vMvGfmMfwvQ3NNycFMFPkAMKrM7+frFdHNpodC+UaWuzUWz0q/0Du7wd64YFGW+KLhwA==
X-Received: by 2002:a05:6000:40c8:b0:42b:3bc4:16dc with SMTP id ffacd0b85a97d-42fa39d2c8emr4601631f8f.21.1765442164166;
        Thu, 11 Dec 2025 00:36:04 -0800 (PST)
Message-ID: <5a4695fa-1520-4d52-adc3-72c159892e33@suse.com>
Date: Thu, 11 Dec 2025 09:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251210183019.2241560-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 19:30, Andrew Cooper wrote:
> With the wider testing, some more violations have been spotted.  This
> addresses violations of Rule 20.7 which requires macro parameters to be
> bracketed.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/mm/shadow/multi.c     | 2 +-
>  xen/arch/x86/mm/shadow/private.h   | 6 +++---
>  xen/drivers/passthrough/vtd/dmar.h | 2 +-
>  xen/include/xen/kexec.h            | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
> index 03be61e225c0..36ee6554b4c4 100644
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -781,7 +781,7 @@ do {                                                                    \
>          (_sl1e) = _sp + _i;                                             \
>          if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )           \
>              {_code}                                                     \
> -        if ( _done ) break;                                             \
> +        if ( (_done) ) break;                                           \

I don't understand this: There are parentheses already from if() itself.

> --- a/xen/arch/x86/mm/shadow/private.h
> +++ b/xen/arch/x86/mm/shadow/private.h
> @@ -636,9 +636,9 @@ prev_pinned_shadow(struct page_info *page,
>  }
>  
>  #define foreach_pinned_shadow(dom, pos, tmp)                    \
> -    for ( pos = prev_pinned_shadow(NULL, (dom));                \
> -          pos ? (tmp = prev_pinned_shadow(pos, (dom)), 1) : 0;  \
> -          pos = tmp )
> +    for ( (pos) = prev_pinned_shadow(NULL, dom);                \
> +          (pos) ? (tmp = prev_pinned_shadow(pos, dom), 1) : 0;  \
> +          (pos) = tmp )

What about tmp (twice)?

Jan

