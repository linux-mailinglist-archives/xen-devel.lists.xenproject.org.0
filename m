Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887AA99DDDF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 08:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818962.1232244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0abL-0006rM-S4; Tue, 15 Oct 2024 06:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818962.1232244; Tue, 15 Oct 2024 06:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0abL-0006p7-Ov; Tue, 15 Oct 2024 06:00:11 +0000
Received: by outflank-mailman (input) for mailman id 818962;
 Tue, 15 Oct 2024 06:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0abC-0005qb-VB
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 06:00:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b660c132-8aba-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 08:00:00 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a0c40849cso271662966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 23:00:00 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c8b5:94fc:ce22:8335:8123?
 (p200300cab721c8b594fcce2283358123.dip0.t-ipconnect.de.
 [2003:ca:b721:c8b5:94fc:ce22:8335:8123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d4d678esm300627a12.16.2024.10.14.22.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 22:59:59 -0700 (PDT)
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
X-Inumbo-ID: b660c132-8aba-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728971999; x=1729576799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc+9mn57TgRg07eiv0X97eGOtK7RH4OqVhupEyE+Se0=;
        b=dPEJtHKqQmYcDdow3khjjzLmV1memRDUiKPB2x+NGT5912E6BO+q2dICHf8Y+1n1xX
         pG9azjs9jAY2lbW5XYIFus/NrDHkjvGbdqFoNh5pxLTb+gxAV3VadlhSaDkvhWLl+Sea
         83NsIfAaIJqCx9k3Pz71Mh3eatUGOelRsoVSk6zMVnlZpnM8JHzGsr5SVbk+DfGFg+vR
         uvSfaIdPwrtMqL/SD41PG6r0skPaYB8crhXomeTsLRVR7Qv+nfF9y6/HjDPlaFi7lwhs
         Ob3dlJfgr+g5g8VY9O8SCRvy7QGpTcjafifPICwM3r6Sre/M9OU3b3enEYhro7EwhPZN
         vTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728971999; x=1729576799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc+9mn57TgRg07eiv0X97eGOtK7RH4OqVhupEyE+Se0=;
        b=WyL+QGaurwSaRkU08SdzGXb4PDQgXNm4/cr+4SirDfWNIhCSZAi1hW9kXhATqm+jvP
         UJb/+WXRB5SL4ZY7V12MnJhgrDLTQsmHI/wp0epgQLBFenfhy8Knu0U4wYNDvNOAje31
         z+ORRoG8t5oCyxQ7okra3kFqxLhq+9e8xpiGkha60xsG4hFYtN+9zn1IRLxm1AEjiX8k
         iPJWVYTKUVQTxP2/SL32gP8lm26sSy8l/p80BBKYrJF4+c28Nd1bEHz0rQqhDE/5VjMX
         pKS+q6WC4uWMux50NmNOFdZNMVUnBR97tVd0U1jyO0rztvrJdhL/XRmeQXdRnExO3pPS
         Pavw==
X-Gm-Message-State: AOJu0YxV0BJZj91786AFg8K8yEzD4hhLh1KL6mmERwGJsU+T+IiInkii
	CyaHpNKecDpqPOlQpq1KKMdpbzDb84Or2V3Eeq3rNM2PPvgv70EcqBVCm98h2Q==
X-Google-Smtp-Source: AGHT+IGOx3M6cSv3eFCXy5xx6J3YguX99C0uxk0kDPSUkE4NTIIFfpTWxofcs5KLaY0MIROgzwNzdg==
X-Received: by 2002:a17:907:7f12:b0:a99:fb10:1285 with SMTP id a640c23a62f3a-a99fb102403mr691955466b.20.1728971999562;
        Mon, 14 Oct 2024 22:59:59 -0700 (PDT)
Message-ID: <bb7a77b7-f57f-4ce5-a30f-5615e2c29773@suse.com>
Date: Tue, 15 Oct 2024 07:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
 <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
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
In-Reply-To: <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.10.2024 18:32, Frediano Ziglio wrote:
> On Mon, Oct 14, 2024 at 4:31 PM Anthony PERARD
> <anthony.perard@vates.tech> wrote:
>>
>> On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
>>> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
>>> index 1199291d2b..23ad274c89 100644
>>> --- a/xen/arch/x86/boot/Makefile
>>> +++ b/xen/arch/x86/boot/Makefile
>>> @@ -1,4 +1,5 @@
>>>  obj-bin-y += head.o
>>> +obj-bin-y += built_in_32.o
>>
>> I don't quite like that this new object name is "built_in_32.o",
>> It's really closed to "built_in.*" which is used by Rules.mk to collect
>> all objects in a subdirectory. I don't really have a better suggestion at
>> the moment.
>>
> 
> It was cbundle.o before, but people preferred built_in_32.o.
> It's a collection of object files like built_in.o so it does not seem
> so bad to me.
> But seen other replies, some other people prefer "bundle".

Well, I for one don't really _prefer_ bundle. I merely see it as a possible
option to address Anthony's name ambiguity concern.

>>> +     $(LD32) $(orphan-handling-y) -N -T $< -Map $(obj)/built_in_32.$(*F).map -o $(obj)/built_in_32.$(*F).o $(obj)/built_in_32.tmp.o
>>
>> I think this wants to be: -T $(filter %.lds,$^) -Map $(patsubst %.bin,%.map,$@) -o $(patsubst %.bin,%.o,$@) $(filter %.o,$^)
>>
>> :-(, maybe that's lots of $(patsubst,), not sure which is better between
>> $(patsubst,) and using the stem $*.
>>
> 
> Not strong about stem or patsubst.
> The 2 filters seem good, they suggest lds for the script and objects
> for the input, which makes sense.
> 
>> Also, if something tries to use built_in_32.tmp.bin, we have a rule that
>> remove it's prerequisite.
>>
>> BTW, everything is kind of temporary in a build system, beside the few
>> files that we want to install on a machine, so having a target named
>> with "*tmp*" isn't great. But having a rule that create "*tmp*" file but
>> remove them before the end of its recipe is fine (or those *tmp* aren't
>> use outside of this recipe).
>>
> 
> Mumble... yes, I think the XX.tmp.o was a temporary internal rule file.
> So we still don't agree on one name, and now we want to find also
> another, tricky.
> More or less if it can help, one is a 32 bit object file that bundle
> together multiple 32 bits object files while the other is the
> conversion of the 32 bits bundle file to 64 bits.
> XXX_32.o and XXX_32as64.o ??

Whatever the eventual name (I don't care all that much), just one request:
Dashes instead of underscores please.

Jan

