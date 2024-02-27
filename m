Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CBB86942C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686198.1067909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexrX-0003CO-JX; Tue, 27 Feb 2024 13:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686198.1067909; Tue, 27 Feb 2024 13:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexrX-0003A5-Gp; Tue, 27 Feb 2024 13:51:15 +0000
Received: by outflank-mailman (input) for mailman id 686198;
 Tue, 27 Feb 2024 13:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rexrW-00038n-3m
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:51:14 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d069d5-d577-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 14:51:11 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3ed9cae56fso707621066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 05:51:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qu24-20020a170907111800b00a3e559aaff9sm793030ejb.29.2024.02.27.05.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 05:51:10 -0800 (PST)
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
X-Inumbo-ID: 43d069d5-d577-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709041871; x=1709646671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yok1+WIrlSpKjzylNjv4/P+Vhf513Inyq/FWByxKCmE=;
        b=Rii8jCE1bm5TUyf79sgOXULtgfNEFUexvRa4IIouvvEVQvMxpp+V1FQQnWGHfXG19C
         OlnCEw2u7avchLCEn23e5gdLzJT4iiOPqXriLdw8VbnXbI1mBCUqth1243c6LYOQfxYc
         jaLxDiqOBZ4jibrZ/zHz1bFEMjUaxbp0dxu4fayN2VI+Y6oEjhdSBhr0V/uL88+aC9KZ
         /4yp4RQCRPjbeVJB2qfl3Z8pW/uzEnkBuydBSXEAum9Doyg5p4+2RMzHs1NgrFIIrnRZ
         xi4DiMyw2P8VrBF/6EBTI5JFFyLMS0T3pnMEaW1GUaJR/S5vh99NJEKbpi/T7bPueJ2o
         ykfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709041871; x=1709646671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yok1+WIrlSpKjzylNjv4/P+Vhf513Inyq/FWByxKCmE=;
        b=YCFFSRghLcKgO56fHILtdGjY1poANoRYmAE41Nh+Li74xmnv2/j4j8vb70SbuCR55g
         y40A+e/xt/vo8KqSNPKQjAGRsCuwNJXUiRLLVPBDt8L+N9kmCBhkFeVLAafVNx9sA9sr
         Dnq2lCDKAycy3SuK19XlHuuVpeaDxrnwdstlwIOMdmOmLZtri9/rVb35CthSnahlToxC
         A0ysj1lrCsfCplQHJEG8p3NDqlffLUO+z8ZMwuxaSPuqIUX/9ofGnn2jjD3O8Lk8hCSN
         SrbMSMWBu0hudYNHRePCaS0a45aw6mKgKsOHonJVUoGgI1mvpdIIkep+mdBzXq7/vD7D
         O+mg==
X-Forwarded-Encrypted: i=1; AJvYcCX0l3P7iBXR4u1tphDgRJLJByqm0Yoenc/V0mWPLBWWEUvflwiPKW9FJOzjzza3SH2ZHVeF/GxjZowDuYQbDtxQ88LfGk3pJeNZzf8bjQc=
X-Gm-Message-State: AOJu0Yy2MoDU9DgYhFr6wUPiZBU/y09OW7K2PApGHLM3opWJd8P8Xe0b
	m9iDv1Sq2rFHefbYh1ouJdwoHdmpd2edJS+SnDCH5u/qpc9/s9K42hup1V3yzw==
X-Google-Smtp-Source: AGHT+IH8VLsGz+Y4Ea4tBem0tNCKa+IINLd1n31PrY+W9qxCYbu4aJWOjdPT+W4dAPf/rcUB5m4Q1g==
X-Received: by 2002:a17:906:2844:b0:a3f:adad:9ce1 with SMTP id s4-20020a170906284400b00a3fadad9ce1mr8545201ejc.18.1709041870637;
        Tue, 27 Feb 2024 05:51:10 -0800 (PST)
Message-ID: <0acb5dc2-e665-4c8e-a10b-2c7664823bf7@suse.com>
Date: Tue, 27 Feb 2024 14:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <b41daccb-d402-4da8-bc88-933facd088a8@suse.com>
 <c3edf84d-3177-4125-bdd6-ba99190340a3@amd.com>
 <23dc102e-e827-4f1e-876d-76a7df4c4927@suse.com>
 <ca749e1e-569e-4d7d-8009-63a9469d3ffd@amd.com>
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
In-Reply-To: <ca749e1e-569e-4d7d-8009-63a9469d3ffd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2024 14:35, Henry Wang wrote:
> Hi Jan,
> 
> On 2/27/2024 9:27 PM, Jan Beulich wrote:
>> On 27.02.2024 14:24, Henry Wang wrote:
>>> On 2/26/2024 4:25 PM, Jan Beulich wrote:
>>>> On 26.02.2024 02:19, Henry Wang wrote:
>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>>>>            }
>>>>>            else
>>>>>            {
>>>>> -            if ( is_domain_direct_mapped(d) )
>>>>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>>>>>                {
>>>>>                    mfn = _mfn(gpfn);
>>>>>    
>>>> I wonder whether is_domain_direct_mapped() shouldn't either be cloned
>>>> into e.g. is_gfn_direct_mapped(d, gfn), or be adjusted in-place to gain
>>>> such a (then optional) 2nd parameter. (Of course there again shouldn't be
>>>> a need for every domain to define a stub is_domain_direct_mapped() - if
>>>> not defined by an arch header, the stub can be supplied in a single
>>>> central place.)
>>> Same here, it looks like you prefer the centralized
>>> is_domain_direct_mapped() now, as we are having more archs. I can do the
>>> clean-up when sending v2. Just out of curiosity, do you think it is a
>>> good practice to place the is_domain_direct_mapped() implementation in
>>> xen/domain.h with proper arch #ifdefs?
>> arch #ifdefs? I'd like to avoid such, if at all possible. Generic fallbacks
>> generally ought to key their conditionals to the very identifier not
>> (already) being defined.
> 
> I meant something like this (as I saw CDF_directmap is currently gated 
> in this way in xen/domain.h):
> 
> #ifdef CONFIG_ARM
> #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
> #else
> #define is_domain_direct_mapped(d) ((void)(d), 0)
> #endif
> 
> I am having trouble to think of another way to keep the function in a 
> centralized place while
> avoiding the #ifdefs. Would you mind elaborating a bit? Thanks!

What is already there is fine to change. I took your earlier reply to
mean that you want to add an "#ifndef CONFIG_ARM" to put in place some
new fallback handler.

Of course the above could also be done without any direct CONFIG_ARM
dependency. For example, CDF_directmap could simply evaluate to zero
when direct mapped memory isn't supported.

Jan

