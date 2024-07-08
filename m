Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0174929EAA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755182.1163453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkIv-0004EU-BK; Mon, 08 Jul 2024 09:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755182.1163453; Mon, 08 Jul 2024 09:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkIv-0004Bi-87; Mon, 08 Jul 2024 09:05:01 +0000
Received: by outflank-mailman (input) for mailman id 755182;
 Mon, 08 Jul 2024 09:04:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jnsg=OI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sQkIt-0004Bc-UU
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:04:59 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2617ab0a-3d09-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 11:04:57 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a77d9217e6fso247197066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:04:57 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab065208sm911918466b.118.2024.07.08.02.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 02:04:56 -0700 (PDT)
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
X-Inumbo-ID: 2617ab0a-3d09-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720429497; x=1721034297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLguUnqOILj2nltoMSMd+O56+i+Df9CclOmYvB+j5Mk=;
        b=aRT78EgWHoUw0eZmzs+oFanbCP86u3XyAWd3oD+I/Gr9d6c3CAyfZzFPtJnfHX+F1f
         Hb2x5bdLagEPuNlqwxAcu3XyZQulXhDY6s/vx5Rek9Gf5FikS6isPQadW7x6FQZP4ey6
         75eBuxS6hzEpzZvbUxJRhwTcDzAxbEwRQJ8s2gBQ+SiSRZoAP2ijBT9ONJSIEEvyWrg6
         qy5LnQykQI/YKLFoj2XXEIYnO8hHwjr5MFQKAtgyfpDO//qMzUv9Ejrzw9xY3RNZHBYS
         EYttipsazhc52xXFnqFC6MeXloM9qbCgBHnmIisLyNPm7HqzKF2jaRHq+1GfYV9Y6dAR
         BWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720429497; x=1721034297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLguUnqOILj2nltoMSMd+O56+i+Df9CclOmYvB+j5Mk=;
        b=bjzFWOaNqzrfbRWtypvgfogAytFCHv7WIITTOeK5XOAIPsshGh2nPQRUVviQQ1iSqC
         0m3xdr9czmx2rMyQoAD3z32uSK9Wq30RgpD/xS2kyHnJjpBr03bqcwEsPu5SUuhkL5vJ
         4eGjCMLSFWmjIriJ8vyFEHjP0BI51PmAwpHkAM+R1zVxGkT9ysi5+QnGKuMRfc3mykO2
         9ryGjNk5L2XTEr0QDYG7YgH6LKpuBFfhQ/XsZDN8cT55kGlyGSo+xk53G4pBTbxgbXHy
         1JSuINEJ59XTTbbpB00PLYc4Yv6SXhhYED+T/rU9Ti0zO845OWUKOBrM5vsXJTWS2ES5
         bYew==
X-Forwarded-Encrypted: i=1; AJvYcCVmxrnMlIhVcaamiyoOoTZvmjvecqDjke2drUQ4YgTRCcjj7q5wfBllKvtuL45zGgEh6eR7dltcK01cOvrjrSYlTAIzHbtTK039i9hJLIk=
X-Gm-Message-State: AOJu0YzckDVf5SNcXvnXf2k4YshzUEFIMRU1YPDNJ0Ge/YGpWuLn7D9B
	Tk70D77uGdtQzUbUTPXauUvLrjHxmqNsIINfFhUgbG7NtSvmC2ZNWj1FuA21hQs=
X-Google-Smtp-Source: AGHT+IEfKmbjb7PP9nIF3X70+mcGNp57v/tF5rZEvNSyggSxpN3frMu/fbTIhNoinwcH4OyrIkBJcw==
X-Received: by 2002:a17:907:118e:b0:a72:7c0d:8fdc with SMTP id a640c23a62f3a-a77ba45525dmr798422866b.14.1720429496940;
        Mon, 08 Jul 2024 02:04:56 -0700 (PDT)
Message-ID: <2d9ffe19-1663-499c-9699-c13ab7a341ee@suse.com>
Date: Mon, 8 Jul 2024 11:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make multicall debug boot time selectable
To: boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org
References: <20240703115620.25772-1-jgross@suse.com>
 <d28f8da5-7903-41c8-9213-4e24e376c837@oracle.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <d28f8da5-7903-41c8-9213-4e24e376c837@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.07.24 00:36, boris.ostrovsky@oracle.com wrote:
> 
> 
> On 7/3/24 7:56 AM, Juergen Gross wrote:
> 
>>   #define MC_BATCH    32
>> -#define MC_DEBUG    0
>> -
>>   #define MC_ARGS        (MC_BATCH * 16)
>>   struct mc_buffer {
>>       unsigned mcidx, argidx, cbidx;
>>       struct multicall_entry entries[MC_BATCH];
>> -#if MC_DEBUG
>> -    struct multicall_entry debug[MC_BATCH];
>> -    void *caller[MC_BATCH];
>> -#endif
>>       unsigned char args[MC_ARGS];
>>       struct callback {
>>           void (*fn)(void *);
>> @@ -50,13 +46,84 @@ struct mc_buffer {
>>       } callbacks[MC_BATCH];
>>   };
>> +struct mc_debug_data {
>> +    struct multicall_entry debug[MC_BATCH];
> 
> 'entries'? It's a mc_debug_data's copy of mc_buffer's entries.

Yes, this is better.

> Also, would it be better to keep these fields as a struct of scalars and instead 
> have the percpu array of this struct? Otherwise there is a whole bunch of 
> [MC_BATCH] arrays, all of them really indexed by the same value. (And while at 
> it, there is no reason to have callbacks[MC_BATCH] sized like that -- it has 
> nothing to do with batch size and can probably be made smaller)

As today the mc_buffer's entries are copied via a single memcpy(), there
are 3 options:

- make mc_debug_data a percpu pointer to a single array, requiring to
   copy the mc_buffer's entries in a loop

- let struct mc_debug_data contain two arrays (entries[] and struct foo {}[],
   with struct foo containing the other pointers/values)

- keep the layout as in my patch

Regarding the callbacks: I think the max number of callbacks is indeed MC_BATCH,
as for each batch member one callback might be requested. So I'd rather keep it
the way it is today.

>> +    void *caller[MC_BATCH];
>> +    size_t argsz[MC_BATCH];
>> +};
>> +
>>   static DEFINE_PER_CPU(struct mc_buffer, mc_buffer);
>> +static struct mc_debug_data __percpu *mc_debug_data;
>> +static struct mc_debug_data mc_debug_data_early __initdata;
> 
> How about (I think this should work):
> 
> static struct mc_debug_data __percpu *mc_debug_data __refdata = 
> &mc_debug_data_early;
> 
> Then you won't need get_mc_debug_ptr().

I like this idea.


Juergen

