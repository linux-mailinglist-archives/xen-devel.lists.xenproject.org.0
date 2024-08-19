Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE3956EFF
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 17:40:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779842.1189528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4Tu-0004qK-Bk; Mon, 19 Aug 2024 15:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779842.1189528; Mon, 19 Aug 2024 15:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4Tu-0004nf-7s; Mon, 19 Aug 2024 15:39:42 +0000
Received: by outflank-mailman (input) for mailman id 779842;
 Mon, 19 Aug 2024 15:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg4Tt-0004nY-3o
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 15:39:41 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eddb099-5e41-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 17:39:39 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso4468419a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 08:39:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947245sm656629566b.179.2024.08.19.08.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:39:38 -0700 (PDT)
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
X-Inumbo-ID: 3eddb099-5e41-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724081979; x=1724686779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jp+1se8/GzVkyfESYNKFhWK5PhWBoK/fbmbLbPByNPE=;
        b=f/3iI/ZECpnXYX/yvQsZcJCcnTaot0fgol1tu4o/KhzeuN+Vgrn+SW/tKUcvQYqE8I
         6BGa2/Mt3I1GsZFXeUMO8tbMoa7EE/t1evClFfKrH3dtAlNvK5QcHKFr5fZzmjIXSJEi
         pAGbuk7ucBmfNz2UK2QhETn0RjwD5j6d4PmicdWWEto9y2yQR4REsYdvnhudhOBDZxfO
         1OKO7heiA+4k3rwt+Xd+YKOBeuAFkulin1NSkH77Xg0yg6bBr/TS4MH1W76/zC62hVHa
         apMGL0RhM54K8mg4hl2m08mraMvrlhRvO8h7Ge5KOYEOJ//MqJYvo+Vsctuq2z5dv0zt
         x5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724081979; x=1724686779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp+1se8/GzVkyfESYNKFhWK5PhWBoK/fbmbLbPByNPE=;
        b=Lev61miUTSoXSm0n/hOdVbqrhgP0kdRQvO7xCRCFmPH5z2lyeCddCwkIC+Ih7yHbA0
         idvI7o0fb1ZM6bHUk92jmGVWG3gQJZ7ubRdaJbB7XirhEOmWpQpTpwNLhuIyfoFM4MwU
         w+6T6uXOhm+Jwp3za2L1HTluUfZRvq/f4PbDL+jEgNPA6tMKjppvQnIdYebkJhBpQ9g+
         Q/RM/lmM+opo2oVwHG+6OwYPr5oDl36whokpVaKjxxIdHUBsGMOC8u5FDur4bK/YCeGY
         J/hZGB4lcHcFk1Tf8aUSWCbkO8qUiIdUJtnPkkdrscRsHkA0Jo4Mot8wUt677WgZUtVd
         aYYg==
X-Forwarded-Encrypted: i=1; AJvYcCUOYWBfmJsuAlVvznpNTd0PW379H4FLqvabvtPEVoLsNQuoqJpqSzOQLVCBmanki19vjrjfEXPRJq2oXp4Fr2r1kZ4MnQ0jX6DKJ77rG+g=
X-Gm-Message-State: AOJu0YwUXcDVh0QP0swgiLX/lHxl/p2NVMo7QNxRer6StoL/U92HunIT
	LXZudQU81KJ4F/tnE1t4ToD525zBn14QBv5qWbcfgkOGMKM6CFHCeH7YNX2F9w==
X-Google-Smtp-Source: AGHT+IF7+xbkgSM5cdBGF06lnO7PYe6rwA8yvHC56n5MRZ73ng+2F0DtNvb5gPNzS5+Jh2MvjoKzLg==
X-Received: by 2002:a17:907:e216:b0:a7a:9f0f:ab17 with SMTP id a640c23a62f3a-a83929544bamr666442266b.32.1724081978464;
        Mon, 19 Aug 2024 08:39:38 -0700 (PDT)
Message-ID: <a84aaeed-6310-42fa-97e9-b391273c0132@suse.com>
Date: Mon, 19 Aug 2024 17:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: PE/COFF image header
To: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Cc: oleksii.kurochko@gmail.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Milan Djokic <milan.djokic@rt-rk.com>,
 xen-devel@lists.xenproject.org
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
 <728bb10e944a7ec28a67c2e9e62910632eb2366b.1721758832.git.milandjokic1995@gmail.com>
 <1e898a3c-b881-4ca8-99f0-48f51ed28098@suse.com>
 <CAKp59VEM6UWHM1Yu9NToFu9T4GfJpgKiXdAzA096KMVcMRqEsg@mail.gmail.com>
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
In-Reply-To: <CAKp59VEM6UWHM1Yu9NToFu9T4GfJpgKiXdAzA096KMVcMRqEsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2024 17:34, Milan Đokić wrote:
> On Mon, Jul 29, 2024 at 1:42 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.07.2024 20:22, Milan Djokic wrote:
>>> From: Nikola Jelic <nikola.jelic@rt-rk.com>
>>>
>>> Added PE/COFF generic image header which shall be used for EFI
>>> application format for x86/risc-v. x86 and risc-v source shall be adjusted
>>> to use this header in following commits. pe.h header is taken over from
>>> linux kernel with minor changes in terms of formatting and structure member comments.
>>> Also, COFF relocation and win cert structures are ommited, since these are not relevant for Xen.
>>>
>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 36e4fc57fc16
>>>
>>> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>
>>> Signed-off-by: Milan Djokic <milan.djokic@rt-rk.com>
>>
>> This looks okay to me now, but I can't ack it (or more precisely my ack
>> wouldn't mean anything). There are a few style issues in comments, but
>> leaving them as they are in Linux may be intentional. Just one question,
>> more to other maintainers than to you:
>>
> Are we supposed to CC someone additionally for approval?

No, you did Cc the right people afaics. You may want to ping the maintainers,
though.

Jan

