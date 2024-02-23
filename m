Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8F860FB3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684775.1064884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdT1T-0007hc-5e; Fri, 23 Feb 2024 10:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684775.1064884; Fri, 23 Feb 2024 10:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdT1T-0007fO-2u; Fri, 23 Feb 2024 10:43:19 +0000
Received: by outflank-mailman (input) for mailman id 684775;
 Fri, 23 Feb 2024 10:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rdT1R-0007fI-IC
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:43:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59db54d8-d238-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 11:43:16 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so917123a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:43:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l15-20020a056402124f00b00564c8800f66sm3201461edw.14.2024.02.23.02.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 02:43:15 -0800 (PST)
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
X-Inumbo-ID: 59db54d8-d238-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708684996; x=1709289796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgRvYUCzO9ua3jx3wY953h1RsOgnIZJoPBbhabQAgvA=;
        b=RoP4Bed3Q8iodn22LB0iTIvm91uzqIcK+VbxjOYi459ZXynInYecM9wFigSPcaxspW
         Vn1I7y4z2DF8aHnAfbOOwhF4pZ1aWE65EQtaIHEv4iVcGYBuQyUE7i2GVM6yMfp5p7oZ
         fo4IBUFy6ls1coQyNpNEj5VZwfewgfPVkIiKGh/gPrXoGdco9mWon9Stc2AvMbApu2QE
         waq7XKC0J97iuh/6JS0WCcjIWTVaGbyw2ba5S9RFUaHilmjn7A3mqFJaJI671AKkIHm0
         PEuzdtl81s15PuRLhVWs+KUBoDEX8ZBkxmco1GxYnA7N7RNyTmlogUW2LfY4ZmxS7/f2
         4pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708684996; x=1709289796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgRvYUCzO9ua3jx3wY953h1RsOgnIZJoPBbhabQAgvA=;
        b=l47Hr8Q5lXdnqCMkZChQoY1RsPLlybGwJGScigv/No/iXrBxZhI/beymnNtBLdbqst
         YcGvk7mpGUdkbeQAJX/e7WknNuaWJycJzmItQ1qic/mT4WW3urwEhGARHxESVlgd75IP
         SW7MK2vyjz/ZCo+iCEnsVq8WjV0xXv0MK7Xi5GnGDqDjRcbOXCS3kHM1XiK74lM1J/x1
         hXHwq5EKoAD4Uj1hi0QhywbRxEsZvuZ7OjVbUQH/vl5DaWPBnC5DNfby1Q71gxR7tfGz
         Jq6mudimmNtJLR5+Yteg9W7fGgRQ8xDKmk7rLgtFy8ODLwvSlXyQB2I3EuDPsAdI+s8A
         QY6A==
X-Forwarded-Encrypted: i=1; AJvYcCUOQK2pPGxJF4dvLiN/Eo+swXfjEG2kInOi3zrhlLSNos9/ShBte+Cv0pN7I1U3TPN2sWugLHLOWdQA08aTz+SYtHuO2OKmrnOeSVNR8n4=
X-Gm-Message-State: AOJu0Yx38biafHqZRqR7gDN/C6wgkqQ2WbSioYjuVvUr1j1oQgI7ma9W
	8m2P0EPgiPUroyqwYBSsl+Oq8qRxXf8WlLe9MLrhb1Mr2wOltH8K6Z9c8lgVLQ==
X-Google-Smtp-Source: AGHT+IE/xsuzIbBqb9tUoFzg4G9E8Ymr0Ym7dT86fz2lSweyCkLfET3uslwp/X4AduYio3bjHqJXyg==
X-Received: by 2002:aa7:d3d4:0:b0:565:5924:9d8b with SMTP id o20-20020aa7d3d4000000b0056559249d8bmr918908edr.35.1708684995909;
        Fri, 23 Feb 2024 02:43:15 -0800 (PST)
Message-ID: <b62f223d-8baa-4d5b-aeba-9890c101b28c@suse.com>
Date: Fri, 23 Feb 2024 11:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/altcall: use an union as register type for
 function parameters
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Matthew Grooms <mgrooms@shrew.net>, xen-devel@lists.xenproject.org
References: <20240222164455.67248-1-roger.pau@citrix.com>
 <b1c96b93-fd75-4077-b622-4781b7811ee8@suse.com> <ZdhjDBlHRtO4MIhM@macbook>
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
In-Reply-To: <ZdhjDBlHRtO4MIhM@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.02.2024 10:19, Roger Pau Monné wrote:
> On Thu, Feb 22, 2024 at 05:55:00PM +0100, Jan Beulich wrote:
>> On 22.02.2024 17:44, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/alternative.h
>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>> @@ -167,9 +167,25 @@ extern void alternative_branches(void);
>>>  #define ALT_CALL_arg5 "r8"
>>>  #define ALT_CALL_arg6 "r9"
>>>  
>>> +#ifdef CONFIG_CC_IS_CLANG
>>> +/*
>>> + * Use an union with an unsigned long in order to prevent clang from skipping a
>>> + * possible truncation of the value.  By using the union any truncation is
>>> + * carried before the call instruction.
>>> + * https://github.com/llvm/llvm-project/issues/82598
>>> + */
>>
>> I think it needs saying that this is relying on compiler behavior not
>> mandated by the standard, thus explaining why it's restricted to
>> Clang (down the road we may even want to restrict to old versions,
>> assuming they fix the issue at some point). Plus also giving future
>> readers a clear understanding that if something breaks with this, it's
>> not really a surprise.
> 
> What about:
> 
> Use a union with an unsigned long in order to prevent clang from
> skipping a possible truncation of the value.  By using the union any
> truncation is carried before the call instruction.

..., in turn covering for ABI-non-compliance in that the necessary
clipping / extension of the value is supposed to be carried out in
the callee.

>  Note this
> behavior is not mandated by the standard, and hence could stop being
> a viable workaround, or worse, could cause a different set of
> code-generation issues in future clang versions.
> 
> This has been reported upstream at:
> https://github.com/llvm/llvm-project/issues/82598
> 
>> Aiui this bug is only a special case of the other, much older one, so
>> referencing that one here too would seem advisable.
> 
> My report has been resolved as a duplicate of:
> 
> https://github.com/llvm/llvm-project/issues/43573
> 
> FWIW, I think for the context the link is used in (altcall) my bug
> report is more representative, and readers can always follow the trail
> into the other inter-related bugs.

While true, the comment extension suggested above goes beyond that
territory, and there the other bug is quite relevant directly. After all
what your change does is papering over a knock-on effect of them not
following the ABI. And that simply because it is pretty hard to see how
we could work around the ABI non-conformance itself (which btw could
bite us if we had any affected C function called from assembly).

43537 looks to be a newer instance of 12579; funny they didn't close
that as a duplicate then, too.

Jan

