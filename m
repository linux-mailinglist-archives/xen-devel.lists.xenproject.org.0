Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB6C8EAAC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 15:00:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173947.1498935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcY7-0007RW-N6; Thu, 27 Nov 2025 14:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173947.1498935; Thu, 27 Nov 2025 14:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcY7-0007Q1-K8; Thu, 27 Nov 2025 14:00:43 +0000
Received: by outflank-mailman (input) for mailman id 1173947;
 Thu, 27 Nov 2025 14:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOcY5-0007Pv-LB
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 14:00:41 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74eb2bdf-cb99-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 15:00:40 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so4056255e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 06:00:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a3f1sm3662121f8f.28.2025.11.27.06.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 06:00:39 -0800 (PST)
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
X-Inumbo-ID: 74eb2bdf-cb99-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764252040; x=1764856840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+hh/H9+a2nmzntRCVdm/MBGgCA5WgecCNBi1C9iDcTw=;
        b=PjTTAuKnQp8m7ODc7E2QBBpRV0YIPgzkf+YLmJIgrDYBm8HdC3HcuqGoaRzmT75HFV
         5dJKgs8W3ku6TFIDIcm+vcwoNZUGd9YlisZ8yYC+rzGaqhyw4EHj2hF8nsHzyw6jDR8j
         VqW0ijhAKHbsnLLbU9oopODFgyC5dkQ1QXTlTYsMXt1dfwpvRqEzzSe85dKFybjri73H
         cGF8Qn79MLl5OiYo0AgF1CZeiWWdKOtD0xA+6YZ5ikuhyy8Lp3Xqpr8ol93Fua9GHxNd
         Ex7efrxVs5YLXvPKeU8OS6VnFi1nYj3Fn727X81eTsGBqKL8UNtTS/nUdBgr//UEzk4D
         3mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252040; x=1764856840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hh/H9+a2nmzntRCVdm/MBGgCA5WgecCNBi1C9iDcTw=;
        b=D1o59AHLmmpjnN7ORJnqEL0YnGIah2jccs8kNEHOjMxizKcmN9nN4KVEwi0U2abZOj
         zOhBuWRuhQy5SnjTeaMpfVKAxnzZeMsXQHDS4PMjerf+5AKUI1bvH7LAd6sVj2Cv0eiM
         SsFKSd5qWhGSmJTBXOe6SHwFZ/tYatsdNbHEMOqAuklGwVMnjntIzFvb1Ndpsgn6rg2m
         tnYSlxMmu4AmsDyzB+dbnRoVns8ujLfHlUyKVBIPDmpqoyBKBVc9FAST1AL62Cp7I14d
         QgrEv1L6WcOCw5MAxe5LLR8rkppj82ORLXlAa9nwrRBPaXBo5JIhvJ5QPUHBCn3d4sCs
         9G6w==
X-Forwarded-Encrypted: i=1; AJvYcCX5ipZvRf8nqSwZDh9Cfx0Dycyxhn2bnSVmKsOHoc3QonI9lzoJoqc9C0HOZttR72dTdMwE820eXwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8P5SmQOEJj/1lDHeA6orDPaOR5gzqemEAtYe/6jo2RXCIkhY4
	TrgfzP58H0aqSrXGIBnsLeaZ6JLGWH5ViTiR8d1v5WPOMi+uCaDsLsWC9/zMrd7USw==
X-Gm-Gg: ASbGncuMSF5Su56MmfuFPznFRdK747IEfQ/tc6XM+2g6BsWhPkJGx7t1lNj6vaS0520
	1LGvKUk+pgSJww19ubFhiF4ie8cIHrQ6AgDCu0uhE/GDWbT+GPhmcIpiqNpb8zXUuzQmcuflOB9
	/q+yvL2I+bIjGs24fgc8aESca5m0Akc3W1cF+L7pxTwIgyWh9vHsG6xYSc/Ff1J+VM7YukitGiM
	Pmvj2Whp2cD75lNaSZ1lAvsdecCfjD4GV5wjDTGSwx3d8K+zN2g/Afb2zEBMEUjyChZBBqObwD0
	nXQU93iwbS7bChqnv3Lm+x9i0maXuhXU3nilE6QrQ37hIu0U23HFhQodUvPLfNvLDpWJXCt2Kc+
	egMd5zbRPXwjK8r+4fx+I5ot0jGgSAdyvSd8XwzolAAdi5gj1yETKyRqIgS2AK0DemBaBcsR7rp
	qUJhz1ge6fS81Ze0fKZFYdWetahYFPTI+igw7fg6NK5+UHTOyICgyX1RaTjRT4tDk7i5DPxvN9t
	to=
X-Google-Smtp-Source: AGHT+IGwGqbr/MwnAU69FDoHG2q5YG6m021ESpczSxx7Bp/rafOau6GbAvkyKvB8j0oPxeazGcdQ8Q==
X-Received: by 2002:a05:600c:4591:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-477c10e1cacmr230379935e9.14.1764252039518;
        Thu, 27 Nov 2025 06:00:39 -0800 (PST)
Message-ID: <d72627cb-242a-4ed5-92df-40fad49aa043@suse.com>
Date: Thu, 27 Nov 2025 15:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
 <868f28fe-f2dd-469d-a0cf-111885184dfe@suse.com>
 <DEJHD0L6BMLD.1IWHHEXGAHH4I@amd.com>
 <7cbca09d-919f-490a-9b68-26a466c84831@suse.com>
 <DEJISRV113CH.PGYQKBCR6OMZ@amd.com>
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
In-Reply-To: <DEJISRV113CH.PGYQKBCR6OMZ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 14:44, Alejandro Vallejo wrote:
> On Thu Nov 27, 2025 at 2:19 PM CET, Jan Beulich wrote:
>> On 27.11.2025 13:36, Alejandro Vallejo wrote:
>>> On Thu Nov 27, 2025 at 10:43 AM CET, Jan Beulich wrote:
>>>> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>>>>> --- a/xen/arch/x86/Kconfig.cpu
>>>>> +++ b/xen/arch/x86/Kconfig.cpu
>>>>> @@ -19,4 +19,49 @@ config INTEL
>>>>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>>>>  	  must be enabled for Xen to work suitably on Intel platforms.
>>>>>  
>>>>> +config HYGON
>>>>> +	bool "Support Hygon CPUs"
>>>>> +	depends on AMD
>>>>> +	default y
>>>>> +	help
>>>>> +	  Detection, tunings and quirks for Hygon platforms.
>>>>> +
>>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>>> +	  must be enabled for Xen to work suitably on Hygon platforms.
>>>>> +
>>>>> +
>>>>> +config CENTAUR
>>>>> +	bool "Support Centaur CPUs"
>>>>> +	depends on INTEL
>>>>> +	default y
>>>>> +	help
>>>>> +	  Detection, tunings and quirks for Centaur platforms.
>>>>> +
>>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>>> +	  must be enabled for Xen to work suitably on Centaur platforms.
>>>>> +
>>>>> +config SHANGHAI
>>>>> +	bool "Support Shanghai CPUs"
>>>>> +	depends on INTEL
>>>>> +	default y
>>>>> +	help
>>>>> +	  Detection, tunings and quirks for Shanghai platforms.
>>>>> +
>>>>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>>>>> +	  must be enabled for Xen to work suitably on Shanghai platforms.
>>>>> +
>>>>> +config UNKNOWN_CPU
>>>>> +	bool "Support unknown CPUs"
>>>>
>>>> "Unknown CPUs" can be of two kinds: Such of vendors we don't explicitly support,
>>>> and such of vendors we do explicitly support, but where we aren't aware of the
>>>> particular model. This needs to be unambiguous here, perhaps by it becoming
>>>> UNKNOWN_CPU_VENDOR (and the prompt changing accordingly).
>>>
>>> Right, what I do in this RFC is have compiled-out vendors fall back onto the
>>> unknown vendor path. Because it really is unknown to the binary.
>>>
>>> I could call it GENERIC_CPU_VENDOR, or anything else, but the main question
>>> is whether a toggle for this seems acceptable upstream. I don't see obvious
>>> drawbacks.
>>
>> I'd recommend against "generic" or anything alike, as it'll rather suggest any
>> vendor's CPU will work reasonably. I'm fine with "unknown", just that the nature
>> of the unknown-ness needs making unambiguous.
> 
> Got it, if UNKNOWN_CPU_VENDOR sounds better I'm fine with that.
> 
> What are your thoughts on the panic-on-compiled-out-vendor vs use-unknown?

Both have benefits and downsides, I think. The choice may need to be another
Kconfig or command line option. I'm also curious what other x86 maintainers
may think.

Jan

