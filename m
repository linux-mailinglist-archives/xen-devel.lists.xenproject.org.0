Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B867838A6F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 10:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670314.1042989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSDCR-0002TW-KJ; Tue, 23 Jan 2024 09:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670314.1042989; Tue, 23 Jan 2024 09:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSDCR-0002Rx-GJ; Tue, 23 Jan 2024 09:36:07 +0000
Received: by outflank-mailman (input) for mailman id 670314;
 Tue, 23 Jan 2024 09:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSDCP-0002Rr-M8
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 09:36:05 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d14430ba-b9d2-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 10:36:00 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50ed808db11so4388485e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 01:36:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c14-20020a056602334e00b007bc102fb67asm6447160ioz.10.2024.01.23.01.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 01:35:59 -0800 (PST)
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
X-Inumbo-ID: d14430ba-b9d2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706002560; x=1706607360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYACSnM4Nds9rkSEky8dqN9W2fWdG1pOgTBOHbhwjCk=;
        b=Mp2zgnueG0aRUqWTPl0R/Vwh00gqZrDKvesRkCnCxqxo+HcPQHrh05ofC/95BKzDXr
         DvvuFXezSFeuRp0+8FPRJbiUVEw37U7mJp/Y8G8MO/mkI+E9Ne5CFfXRLvQCUnIa9/dK
         dLnnmnk2FMOI8YvYMpufA3CnsCVvR52dEe4UStIYGJ9F/3NXuuQZLM6/lzJQ1mUsnL0p
         GE8E0nvBZrRzSgXAswLEBQKmn85Q+k+XqVrAVttTy06FlLevrvtDrVdQRFXLoYG5L8m2
         Ajv3E6ovJ3UyAR1pzmCVQCoqJ+LUJBAkDec89E7pQehodIGzy/aPz5VF6PfNAdeMEkpc
         +65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002560; x=1706607360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYACSnM4Nds9rkSEky8dqN9W2fWdG1pOgTBOHbhwjCk=;
        b=O8BeFc3pTSPfceAOBh5Ilx4xmbOG2FM/wX7cZghOgJNN4KmUCujqoleoZnjCaFYZaV
         k9feRov4mJgBEt8MnNQ9Bhg/4q4cng5DXkaHteAfFdsh0N7RE2U5mwpEasbwDzGsnKsO
         QJMn0GIaIFSmDF/RPulI0ei6Ex2cL7EH6IfKtduaE0DYkugr1MsAjxRl2Oia37mONgfz
         i1YgYYi4sj2829mTTdYu9LC7yQMp151/quTtjaSCLJ05kKrFU85Ip5e26xitPAplkPPh
         qbuOmgy+UC0dtukeOmdVlNxc9EaOWL3wkJY3l9fqiHfxDJRfJRhRsQN/6ftApV4/ex/v
         qOsw==
X-Gm-Message-State: AOJu0YwWJXpzoFuDb9JGXDAzI+qmYR3iQ/LlcZWd6B4wF6Tla6dBFrxa
	gbp46SH8Zs8Xb8glPzL8HNJ4gpsKFVJ/LEiG8uCXr0jhYcV87uvOT7Im7QNI7w==
X-Google-Smtp-Source: AGHT+IEPv++9856r6Tdz6Y4UTcn8yVe9YiORLRmTI/L6DES9SXdJ1RFoCwnQw/yYx1p2GZqDvrafzA==
X-Received: by 2002:a05:6512:12d6:b0:50e:dc84:114 with SMTP id p22-20020a05651212d600b0050edc840114mr2767185lfg.45.1706002560074;
        Tue, 23 Jan 2024 01:36:00 -0800 (PST)
Message-ID: <6c16291a-be97-4b74-8fe6-c71b515607c4@suse.com>
Date: Tue, 23 Jan 2024 10:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/entry: Make intra-funciton symbols properly local
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240122181714.1543738-1-andrew.cooper3@citrix.com>
 <20240122181714.1543738-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240122181714.1543738-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 19:17, Andrew Cooper wrote:
> Each of these symbols are local to their main function.  By not having them
> globally visible, livepatch's binary diffing logic can reason about the
> functions properly.

I'm not happy with this, and not only because of the way you're putting
things: "globally visible" is misleading - the symbols aren't global.
What you're doing is even eliminate the local symbols from the symbol
table. Which in turn yields less easy to follow disassembly. I could
perhaps be talked into accepting this as long as we agree to not go as
far as converting labels which can be jumped to from other functions as
well. Yet even then ...

> @@ -859,9 +859,9 @@ handle_exception_saved:
>  #endif
>  
>  /* No special register assumptions. */
> -exception_with_ints_disabled:
> +.L_exception_with_ints_disabled:
>          testb $3,UREGS_cs(%rsp)         # interrupts disabled outside Xen?
> -        jnz   FATAL_exception_with_ints_disabled
> +        jnz   .L_FATAL_exception_with_ints_disabled
>          movq  %rsp,%rdi
>          call  search_pre_exception_table
>          testq %rax,%rax                 # no fixup code for faulting EIP?
> @@ -891,7 +891,7 @@ exception_with_ints_disabled:
>          jmp   restore_all_xen           # return to fixup code
>  
>  /* No special register assumptions. */
> -FATAL_exception_with_ints_disabled:
> +.L_FATAL_exception_with_ints_disabled:

... perhaps with the exception of this one label I'd like to ask that
.L not be followed by an underscore. That carries no useful information,
while prefix and name are already properly separated by the difference
in case (see e.g. .Lcompat_bounce_exception).

To suggest a possible middle ground: Can we perhaps have the .L prefixes
added only conditionally upon LIVEPATCH=y (by way of a suitable macro)?

Jan

