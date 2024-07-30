Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B16DF9411AA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 14:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767693.1178385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlnc-0002GL-SC; Tue, 30 Jul 2024 12:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767693.1178385; Tue, 30 Jul 2024 12:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYlnc-0002Et-Ov; Tue, 30 Jul 2024 12:17:52 +0000
Received: by outflank-mailman (input) for mailman id 767693;
 Tue, 30 Jul 2024 12:17:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYlnb-0002El-Ai
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 12:17:51 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd0f7e09-4e6d-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 14:17:50 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so6970279a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 05:17:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59aa5sm7243556a12.43.2024.07.30.05.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 05:17:49 -0700 (PDT)
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
X-Inumbo-ID: bd0f7e09-4e6d-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722341870; x=1722946670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F/Ns7A9vLLtAkaOYavA9pBxbaBVNxBHRAR0jTb8lJxk=;
        b=RHpYFOABTEs3WhKOax4G8NIXRA09GvsFceM73FkmRIB4sY/WcumMAS33YIrX9zg+Fh
         9FjV3KsmipvZJSEctf3M0PH1dJPEwItmMCJ4lB6g9RhE6jV4TxPBlu7XaN7+a69YoZqW
         xKTDuya9Ym1Fw2BUnfswKj/ZTHMTixqd4KsL/J40LJmusdgA3BLVbCQ1YNDBGlSeaPjb
         tSoWqSgKfo5OK1yW/KHCUaPdMG7ZCpZ62ukN+/97Z9fESZA93hbLlx5B7BNicXJsdG8Q
         rgAq+gMoonCaW/sLZW3f3iTPdk7pzhNKrnv9yDAS759GnoiMWXDI+jTwAoRaVK8MjyI2
         3N6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722341870; x=1722946670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/Ns7A9vLLtAkaOYavA9pBxbaBVNxBHRAR0jTb8lJxk=;
        b=JoU/cjIcKGcfC9IzuQEiFPYDtC10LYog1f8x3g2TKASDPJaC78TEl0sPdSXIV0rmdL
         DXLefBcUFmD9B74CgWIKx6GK0wZXhy/lJOaxMRQcjBJ3QiVOIxle9PHzmjHe0RizTgJk
         cPgYVLvuzvsemL1jgyCHThEgt9XEdZ8myORPjIqQVh1dbkarvyPqdqX4TI3uZJyS6ZGk
         2it4+bM/69bLZi3vNHWs5iBVRMANOa7hs/EzQUsJbsnhhlAJxsqs0AIOsOFIOdvHt/vN
         Q5L9coFwGt+h0ypYat2zpN62ktNn0Ma5W2YSiKjCiuAGwJ/gmN6b69viSfZHwaEH/Uax
         gLaw==
X-Forwarded-Encrypted: i=1; AJvYcCWW9VzUnqah5TKW9SYF7O41Mj/N5i/WxKjKgbLRA3CtoVG4L1ZPAt7vplE3Iz/UyPpZG/72BEwJl3iu8tOXIWcFo/zGTip7qNW4Ik5Yds4=
X-Gm-Message-State: AOJu0Yz4U+bScxOBHvwWA/xl8LwhheGcYXQLS16bFJ9n/Uk8/jqXdb/t
	UanI32A2DlCSO+Qr3LGJUQPArOi0ziLemDKUKsi9LUlMQZghWNJ+ZCGfgCw+dA==
X-Google-Smtp-Source: AGHT+IFKRG+Y8ErrHF9ay4aRM7UwV1reznpmbqNPa1/BcBFZL8EHUonoK3KncWSrZIR3D/V5zcz0Ow==
X-Received: by 2002:a05:6402:3508:b0:5aa:32bb:146 with SMTP id 4fb4d7f45d1cf-5b0226baf28mr7740110a12.38.1722341869700;
        Tue, 30 Jul 2024 05:17:49 -0700 (PDT)
Message-ID: <13aa38d9-9554-43d7-aa76-9599ae2824cc@suse.com>
Date: Tue, 30 Jul 2024 14:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] xen/riscv: introduce and init SBI RFENCE extension
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <fb2d24731f870378d79077be39b1bc19cc655327.1721834549.git.oleksii.kurochko@gmail.com>
 <49d3a181-0830-4f55-83a4-c6c9fd54eb17@suse.com>
 <b7433d25bb3ca7a0f4e54f561b450b5724fb46dc.camel@gmail.com>
 <97554cbe-7009-4bc9-8205-7a9e0f29aad0@suse.com>
 <23ef6ff003d4170269eedfc7d3354965f060ba3f.camel@gmail.com>
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
In-Reply-To: <23ef6ff003d4170269eedfc7d3354965f060ba3f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2024 13:57, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-30 at 11:17 +0200, Jan Beulich wrote:
>> On 30.07.2024 10:44, oleksii.kurochko@gmail.com wrote:
>>> On Mon, 2024-07-29 at 17:52 +0200, Jan Beulich wrote:
>>>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>>>
>>>>
>>>>> +/*
>>>>> + * Send SFENCE_VMA to a set of target HARTs.
>>>>> + *
>>>>> + * @param hart_mask mask representing set of target HARTs
>>>>> + * @param start virtual address start
>>>>> + * @param size virtual address size
>>>>
>>>> Are these really virtual addresses, not somehow a bias and a
>>>> number
>>>> of bits (CPUs) or elements? From the rest of the patch I can't
>>>> deduce
>>>> what these two parameters express.
>>> According to SBI doc start is an virtual address:
>>> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-rfence.adoc?plain=1#L44
>>
>> Oh, so these are describing the VA range to be flushed. Okay.
>>
>>> and hart_mask is:
>>> • unsigned long hart_mask is a scalar bit-vector containing hartids
>>
>> Biased by hart_mask_base in the actual SBI call.
> What word "biased" mean here?

The meaning of e.g. bit 0 in hart_mask will, aiui, be determined by
hart_mask_base. If the latter is non-zero, the bit will not name hart 0.

Jan

