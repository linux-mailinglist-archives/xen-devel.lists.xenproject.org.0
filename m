Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8947ACF057
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006847.1386093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAaD-0005qg-Oh; Thu, 05 Jun 2025 13:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006847.1386093; Thu, 05 Jun 2025 13:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAaD-0005oI-LK; Thu, 05 Jun 2025 13:24:37 +0000
Received: by outflank-mailman (input) for mailman id 1006847;
 Thu, 05 Jun 2025 13:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNAaC-0005oC-EG
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:24:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bb719db-4210-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 15:24:34 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so12021835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 06:24:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe967easm12789921b3a.21.2025.06.05.06.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 06:24:33 -0700 (PDT)
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
X-Inumbo-ID: 6bb719db-4210-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749129874; x=1749734674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u8+sxsowr6AU5P36Xo1cUQ+rCEgTxvqKRs52I670ZnA=;
        b=Piw8DG1GHrhtpnAO9SvXVQMaGEBGiWUiopOmRgJNbSiHzEnapnwuKuR5Qko4+gbzMB
         4B4i778VQzzRjOWoVcI7s3oreDCpp4Hi0Sc/U1H4fhwyM+PH5duz/cK/yfMogwT/Kk1h
         NY6zFdmYAY/3SGlDVerpDZsaZyVWURXuoDeKr+rKO8nm9i01b5HPRNb7osze19YaIhF5
         lm1cems3NaKAzEx6j1YA3ZhrrpUOBjsge4he3AHpMZ3utbN58FL7MT75Ta78jQxRZk/2
         kql5Z7383ytLJ0PRCis7t3iO4suoq9eTCcL7NIAAsFBZ71HSnbAp/8ctNMeSNrM4G9wn
         jNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129874; x=1749734674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8+sxsowr6AU5P36Xo1cUQ+rCEgTxvqKRs52I670ZnA=;
        b=XnL1sFNqwYV0jLV9mnfhuVkdd8pqXSkvyYI+GTyz9t76ok5nGzHOklSNUyHu6vW/7a
         xmNo2F4fLuN1O3ss3kTlfgnySbXL5m08ZQ+VUosi2+g7I7y+QJ4OXQW1oUa2etNAUXuY
         +LXpKlpopiFY32MZXoZ3ceT0GI5XhjKLBcyI3HCjJoLIVp/FoQiUCz38YDcF80cinKIw
         0AK3wP3PNC9G3Dge8TgclT9HZcN3RrmDvuKF97UztOpJpwf0Zoq9zRAqLSQ1TrWRRIti
         x3lWDeUcLUBKGY5CQrI4nAkYnRg+Ldr6PDwmYEADwPn1MQ4FcuOG7lvCXbtAyu7ArLkX
         Q23g==
X-Forwarded-Encrypted: i=1; AJvYcCXQXsrRuvE9r3RQ/lsif9w6cG+1OLyDQavfpRrNHCSrXmmsIhelvl6t43XXEirGWSBL7A8i55jAtnM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYfA7D1fLoUU7i8WqqOE/EAD8xhPDY7esq9Em8RKpmRUAELB8D
	11j/efZuVpM2BmpkAJZWIs/RTfoaLyzLzcC98sUflvyy52HMQ8/Pg8DNLttL65btcA==
X-Gm-Gg: ASbGncsxgOFWj63SUtflDe9AxzxAWhl9Yttb7ofWyFyAsUOpUNk97tvf5HMFkYADWCJ
	t1cc6yMevqqIHg/XARqHAEy/4whRDFBwPJt/g277YxnzPZRuc4VuBqRkKat2r7jgWFwMKVXIIua
	M1+S+pteog1qiyGlG6mkt0W72N7olRMPPXPMLLdrSq6tPxwz/ys7MjrDwb2Q5/cdCWisHc7l8Hp
	dZH6hpj0TAFR5kKeqQEJmObm8huI/2p9Axp9Z8X6oypP3W7GvEJ4OYiwOgdTw5NloLgmbZv5S8H
	Urk5Qzpdyz6moRi0WtbkzobXhB81iq5/Uiwiao5Bxi3ajv1ovPdinoBBpgO4317EAMSvmfPRBmv
	Zj8lMlaug6pyu+KRtmVtUbcPfNSr2hMRIysUQ
X-Google-Smtp-Source: AGHT+IFL8X4WjAs9RHgsM+f9mOC15fIN0FKD7wUFR7IdyO4+Vr1DYsdhd3IHsTS+NiImdstm9/nZRw==
X-Received: by 2002:a05:6000:381:b0:3a4:d722:5278 with SMTP id ffacd0b85a97d-3a51d9769c2mr6155181f8f.39.1749129873757;
        Thu, 05 Jun 2025 06:24:33 -0700 (PDT)
Message-ID: <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
Date: Thu, 5 Jun 2025 15:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
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
In-Reply-To: <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 14:14, Andrew Cooper wrote:
> On 05/06/2025 1:02 pm, Jan Beulich wrote:
>> On 05.06.2025 13:16, Andrew Cooper wrote:
>>> The format of the buildid is a property of the binary, not a property of how
>>> it was loaded.  This fixes buildid recognition when starting xen.efi from it's
>>> MB2 entrypoint.
>>>
>>> Suggested-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> I'll pick this up without a Fixes: tag, but I think it ought to have one. (I
>> didn't check whether MB2 or build-id support came later, hence introducing the
>> issue.)
> 
> MB2+EFI came long before any buildid support.  If you want a fixes tag,
> it's eee5909e9d1

That commit talks of an earlier hack, though. And no, MB2 work came later,
albeit still in the 4.9 dev window (commit 9180f53655245).

>>> --- a/xen/common/version.c
>>> +++ b/xen/common/version.c
>>> @@ -203,8 +203,11 @@ void __init xen_build_init(void)
>>>      rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
>>>  
>>>  #ifdef CONFIG_X86
>>> -    /* Alternatively we may have a CodeView record from an EFI build. */
>>> -    if ( rc && efi_enabled(EFI_LOADER) )
>>> +    /*
>>> +     * xen.efi built with a new enough toolchain will have a CodeView record,
>>> +     * not an ELF note.
>>> +     */
>>> +    if ( rc )
>> Instead of dropping the efi_enabled(), I think you want to replace EFI_LOADER
>> by EFI_BOOT.
> 
> No - that's differently buggy.  I suppose the commit message wasn't
> clear enough?
> 
> We'd still have a CodeView record if we booted xen.efi using it's MB2
> entrypoint without the EFI extensions.

Hmm, if that's a possible mode of operation (as said in reply to Marek, I
wasn't aware of that) - yes.

> This really is a property of being a PE32+ binary, and nothing to do
> with EFI.

Which still can be checked for without having this code path being taken
for xen.gz, too: You could e.g. check for &efi > &_end. That's firmly an
image property (yet I expect you're going to sigh about yet another hack).

Jan

