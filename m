Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483287CE12
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 14:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693860.1082474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7YT-0005LF-AS; Fri, 15 Mar 2024 13:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693860.1082474; Fri, 15 Mar 2024 13:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl7YT-0005ID-79; Fri, 15 Mar 2024 13:25:01 +0000
Received: by outflank-mailman (input) for mailman id 693860;
 Fri, 15 Mar 2024 13:24:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl7YR-0005I7-Py
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 13:24:59 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 683fe153-e2cf-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 14:24:53 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-568b4b9aeeaso599166a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 06:24:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g18-20020a056402091200b00568b6f73491sm240052edz.14.2024.03.15.06.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 06:24:52 -0700 (PDT)
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
X-Inumbo-ID: 683fe153-e2cf-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710509092; x=1711113892; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bociKXp9DNG9xROayi03Wc1oYquHr60jp09vWqzEsUE=;
        b=QLB3CXOp9s6TMiniFVMGgOr03VNI9H6w+GQ6x5gPHkT3ZeEqwoSkjLWeoSZ/hBHhVr
         a+Zd1rfIA0ISyWEtfmHR/wUAmLaUbTY9tg+758YIQU2nmucvxRbFwDaZe9FspWX7Ronr
         DZXFVh9SNuLzHcvb3r/Lux/HXqTs7m+pd3OGn4p/eBfxSW8j4Ss8oCYdEywdp20KHTTC
         OVFQBNTR3MrxRhZ+I3gr9gVQd+mX4oWo55LDvMAMK362imGFkTzqzPlkKOtJS6BJ8zbK
         F/ORtktVSTRQs4Lh5uhZn3b6/90yB8TAOu/73jORADU46iIPC5PSSugTUeECBMa+VAIv
         vrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710509092; x=1711113892;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bociKXp9DNG9xROayi03Wc1oYquHr60jp09vWqzEsUE=;
        b=JIhJWQRgu/SQ5v4dDDtnHvXPlBdieeEEwICt2NjotieClS7G1DGTkqJy+dNfDN/YMf
         Pqmmx/Lr+rVbWV+J41lRLX6YLN/86eEi6nTwZcuLTeXHf7fqsy8LhYw1lok81jp+SaAo
         o/jv6bQviVJvM102jfC53a0TJOHfwlgOV+cQivMkISv3dGgvYI4zZnLCfCg5gCvnQFaR
         gGF61mf4Cec6fRvff16nbk/nLXEo91rlMi5Gd9wpyS0zTxSPB53rR95foNfbAq/qHBKj
         ANh1ul/KbDNpvwYD8/m+Hcxy7LGNvNlKWFB9GkC+qxTtfNMR0Yx2QUjIzqTND4X0X0sQ
         Y5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWC17lgwi/YhT8HPbuFpzR0V9AFFq8OJKFMP3L7w4bKxIASdjcjY29cLZ+w4jd2csnkGOzKUoB7eMC26biatYszvvDaeg5vmZLziFUUD6A=
X-Gm-Message-State: AOJu0YxeE2Z4tlHPAyzY6+iZ5Hf6APQTzsJe2WpJocnIke8QmkGD16Ln
	7HmANisZ60oKHIq/3aTHgC1Am6+olgh5QKpSo46t14qmlC4ZOYkc2uHp9yA2IQ==
X-Google-Smtp-Source: AGHT+IGakwekdhuLRNnsZLRRfXlc3GxQsG7r1CvkZ3NISX90+n3+C1n9FqdP3M3tMjhVfOrGYTgUSg==
X-Received: by 2002:a05:6402:194a:b0:568:9cfe:1974 with SMTP id f10-20020a056402194a00b005689cfe1974mr3106124edz.18.1710509092559;
        Fri, 15 Mar 2024 06:24:52 -0700 (PDT)
Message-ID: <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com>
Date: Fri, 15 Mar 2024 14:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 federico.serafini@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com, julien@xen.org
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
 <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
 <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com>
 <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com>
 <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
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
In-Reply-To: <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.03.2024 13:17, George Dunlap wrote:
> On Fri, Mar 15, 2024 at 11:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> It sounds like Andy and Stefano feel like this is a situation where "a
>>> fixed width quantity is meant"; absent any further guidance from the
>>> CODING_STYLE about when fixed widths should or should not be used, I
>>> don't think this change would be a violation of CODING_STYLE.
>>
>> As with any not sufficiently clear statement, that's certainly true here,
>> too. Yet if we try to give as wide meaning as possible to "a fixed width
>> quantity is meant", there's basically no restriction on use of fixed width
>> types because everyone can just say "but I mean a fixed width quantity
>> here". I think the earlier sentence needs taking with higher priority,
>> i.e. if a basic type does for the purpose, that's what should be used. The
>> 2nd sentence then only tries to further clarify what the 1st means.
> 
> Come, now.  There are lots of situations where we just need some sort
> of number, and there's no real need to worry about the exact size.
> There are other situations, where we mean "whatever covers the whole
> address space" or the like, where it makes sense to have something
> like "unsigned long", which changes size, but in predictable and
> useful ways.  There are other situations, like when talking over an
> API to code which may be compiled by a different compiler, or may be
> running in a different processor mode, where we want to be more
> specific, and set an exact number of bits.
> 
> Should we use uint32_t for random loop variables?  Pretty clearly
> "No".  Should we use uint32_t for the C entry of a hypercall, even
> though the assembly code allegedly makes that unnecessary?  At least
> two core maintainers think "maybe just to be safe".  That's hardly a
> slippery slope of "anyone can say anything".
> 
> Other than "it's in CODING_STYLE", and "it's not really necessary
> because it's ensured in the assembly code", you haven't advanced a
> single reason why "uint32_t" is problematic.

And it isn't, I never said it would be. But if we set rules for
ourselves, why would we take the first opportunity to not respect them?

Jan

