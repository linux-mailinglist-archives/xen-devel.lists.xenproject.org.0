Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B700B8B9486
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715525.1117211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Pdc-0001YL-8L; Thu, 02 May 2024 06:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715525.1117211; Thu, 02 May 2024 06:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Pdc-0001WM-5L; Thu, 02 May 2024 06:09:48 +0000
Received: by outflank-mailman (input) for mailman id 715525;
 Thu, 02 May 2024 06:09:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2Pdb-0001WG-3g
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:09:47 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9245ef7a-084a-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 08:09:44 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2dcc8d10d39so87918471fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 23:09:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 da11-20020a056000196b00b00349ff2e0345sm375751wrb.70.2024.05.01.23.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 23:09:43 -0700 (PDT)
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
X-Inumbo-ID: 9245ef7a-084a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714630184; x=1715234984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+46cTmuwJjSR/h4dKhc9adX6YxlzB3CKB2cLjGOi9Y=;
        b=DALnIoi1qV9AeemgiZqGYV5oxM+dTTqII5A7X2TiPv8rajx+G0inE5TFL8l1N8CzFR
         Q1NXXR7XE3BmNGvS81KWeyaJaee6FEMQz0gl4+wf8qZw12fvz3a6GTfGFRgMevZFEBcu
         44fKMADpoGFrIw8j+QpHVO7qHpL5PA8qLDk4TWtxUgVnl93se5FWIgFNxbhjDCGXLizB
         Vd50CdqoOSfudKtlxy0LEUFvBKQPbOQzoTtLtGV9UPLk0BRu45YFyVlQs7uTNhNkiOwx
         el1aBNOUeQKhXNgi0AtTkH/iXqdPwUNfZkg2xyE/IA2JZcipCxmSFRrXSNCNToz+Y4RX
         DCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714630184; x=1715234984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+46cTmuwJjSR/h4dKhc9adX6YxlzB3CKB2cLjGOi9Y=;
        b=KX4sNfgyVgBd/AQqRfAxY7XpnUzCGgveLUTjqNywMRksp7Iuuda6fexp938pZH2pn0
         HbYBsyx7zODZBmprgik0cfxZ3JF1nu1jsu3Lx0G2t1LJjgzOTnBc+GbM1s2LOotaqIAH
         jRiFyDu2bIlmrylJT1FuTybtaRLbz6Cv1yvwrA13Y04gTjMMEsYsA886ucEzFrdu0ZSk
         fDUFmoq3AeUHxh61YypsKoc6PuJbGtjMzLnk8KOelZoixaA5F1OnVibWhyceEbXzcVVQ
         2bhiwprNHiRFN/Rj15JOtRpjuhDqTNXPaMjeikx/RzVrESRPDJlYpH96mW0z5HGuarFQ
         hC8w==
X-Forwarded-Encrypted: i=1; AJvYcCXTYyxzhEU4YTNCytUiyxuE6w3DVnbp5ST5Fc2y1gaQtvs+mbQhrkW33NQoTujvfXFxAYSMNR3oUf2EYxZnJ5+XfzbsmpCBLWDLm/B66pU=
X-Gm-Message-State: AOJu0YxTiI64ZodJAeo1pL83VdFpCSSyN6OTRjrk1rUxFXVxAn+pLun0
	Di1ns1lfcdmCBpsY+iSsrPc8RbNx02FgYeu74vlJn3Sdn/ESTZLP321NlQ2rzw==
X-Google-Smtp-Source: AGHT+IG7QAKO6zUDxtwbKSWW29cukgU7JUMi5JHjdYqFlTHW+Sr30inMOp6lrfyOt7Ot2tMHqsLqDg==
X-Received: by 2002:a2e:b784:0:b0:2df:907e:6de3 with SMTP id n4-20020a2eb784000000b002df907e6de3mr3186593ljo.35.1714630184116;
        Wed, 01 May 2024 23:09:44 -0700 (PDT)
Message-ID: <16815d66-ffe7-45e9-8311-5d4ed8754d2f@suse.com>
Date: Thu, 2 May 2024 08:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-2-luca.fancellu@arm.com>
 <cd2352aa-e94b-43ef-b3fc-359cc1f43fb0@suse.com>
 <2AB02E85-2746-4DD6-A821-B858E52A6954@arm.com>
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
In-Reply-To: <2AB02E85-2746-4DD6-A821-B858E52A6954@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.05.2024 08:54, Luca Fancellu wrote:
>> On 30 Apr 2024, at 12:43, Jan Beulich <jbeulich@suse.com> wrote:
>> On 30.04.2024 13:09, Luca Fancellu wrote:
>>> --- a/xen/include/xen/kernel.h
>>> +++ b/xen/include/xen/kernel.h
>>> @@ -54,6 +54,27 @@
>>>         typeof_field(type, member) *__mptr = (ptr);             \
>>>         (type *)( (char *)__mptr - offsetof(type,member) );})
>>>
>>> +/**
>>> + * __struct_group() - Create a mirrored named and anonyomous struct
>>> + *
>>> + * @TAG: The tag name for the named sub-struct (usually empty)
>>> + * @NAME: The identifier name of the mirrored sub-struct
>>> + * @ATTRS: Any struct attributes (usually empty)
>>> + * @MEMBERS: The member declarations for the mirrored structs
>>> + *
>>> + * Used to create an anonymous union of two structs with identical layout
>>> + * and size: one anonymous and one named. The former's members can be used
>>> + * normally without sub-struct naming, and the latter can be used to
>>> + * reason about the start, end, and size of the group of struct members.
>>> + * The named struct can also be explicitly tagged for layer reuse, as well
>>> + * as both having struct attributes appended.
>>> + */
>>> +#define __struct_group(TAG, NAME, ATTRS, MEMBERS...) \
>>> +    union { \
>>> +        struct { MEMBERS } ATTRS; \
>>> +        struct TAG { MEMBERS } ATTRS NAME; \
>>> +    } ATTRS
>>
>> Besides my hesitance towards having this construct, can you explain why
>> ATTR needs using 3 times, i.e. also on the wrapping union?
> 
> The original commit didn’t have the third ATTRS, but afterwards it was introduced due to
> this:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20231120110607.98956-1-dmantipov@yandex.ru/#25610045

Hmm. Since generally packing propagates to containing compound types, I'd
say this cannot go without a code comment, or at the very least a mention
in the description. But: Do we use this old ABI in Xen at all? IOW can we
get away without this 3rd instance?

> Now, I have to say that for the Origin tag I used the SHA of the commit introducing the macro
> and the SHA doing this modification is different, how are these cases handled?

I'd say the hash of the original commit is enough even if the 3rd instance
needs keeping for whatever reason.

Jan

