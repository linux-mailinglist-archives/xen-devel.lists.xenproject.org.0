Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A289871657
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 08:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688602.1072974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhOx5-0000Kv-1A; Tue, 05 Mar 2024 07:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688602.1072974; Tue, 05 Mar 2024 07:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhOx4-0000JP-Uc; Tue, 05 Mar 2024 07:11:02 +0000
Received: by outflank-mailman (input) for mailman id 688602;
 Tue, 05 Mar 2024 07:11:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhOx3-0000JJ-Cm
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 07:11:01 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 844bdb62-dabf-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 08:10:58 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a441d7c6125so32655266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 23:10:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v23-20020a1709067d9700b00a42ee62b634sm5654329ejo.106.2024.03.04.23.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 23:10:58 -0800 (PST)
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
X-Inumbo-ID: 844bdb62-dabf-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709622658; x=1710227458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amVKZ/G30n/Yzg6bBgArHwLkCX61RuWSAll7jyvS1po=;
        b=K8j9lHM9KMNDA9hzZMdsQNuHwz0quIw5FLLnxzyyK/bFZ56ZNyerLuLM0hHUmMP5rY
         g/Ma96W2kZP027Ne63f2S5Ab5/nQRiphHA64ANOtxOz+U6n3Yvw2DXXCn7ul8Ss1SDHD
         SAaHquDQBaY3BXKzdh5ZBeGU0J6gT17iCmGoswH7xG/rA/7psSKahmNaL1YK02J+2el4
         t34tqsoUZEHAd42Iwe85XgvsY9lp/jTlpTWERvRVzjpiv6y4eRL5VJ/8aRUKkFcHipR/
         pZ8tf9gXQDKQ/gMsTD7W6+nn/deU7TsQECPO2sElqGY1F1Q5Gvz60H+ExAPrhzEqzhQ3
         2OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709622658; x=1710227458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amVKZ/G30n/Yzg6bBgArHwLkCX61RuWSAll7jyvS1po=;
        b=MN9cghqQ2Iq1rszpDzsYg7KDBiv5Cm2eBVbpEggHnJfaxoTKe56jiPpcZZL2knb49L
         b4RkldeLIKDc1An2qyOO5d1PwN6UBGSiAHarfqQOGivsRJhTXCXL8blMphziLsY/79Xg
         kXxnJTKkEp4ta805e6HJSA7px3cdWyYf6BnziYQPArKmF0jCeXTn4gzpCkKIVpQbEwlk
         K5scxp7ANQhleqgbDfxGuRIcXwmJEfI+P5bZwqBOeMzq/Ap/6OO6DS0mJjR7C6Fok2As
         8uPyn0unoqoA+XddQVuzq9fcPK77Vdkoz/3ifEq1PglHI+QAQKyxPRtMcqrpn04jFimG
         vniw==
X-Forwarded-Encrypted: i=1; AJvYcCWLWKb3fUm3xg9Mvup2wG5X3/VkupgNYNCKBc9P5yIQNvmvJjXKa+ycxdcctbMUiAbwRCY+5vXtpmNeoHdncL4kqlFvLkQsw4vIgBpM3uM=
X-Gm-Message-State: AOJu0YwKI6q0nPVQas8tMvfdKLAKIgvT3XUvZ7Gur3a8OK0mut/M9bA2
	Fs6Mb0fK5wT2jW2eHuyRoxLQvzwCMvNvlBE+h7IFWiF+Qr0DSUnIfVW8qGy/jA==
X-Google-Smtp-Source: AGHT+IGaLa2uneYabfShH6mk4vIvYURxmB3fkkrVoOSaYBK87QIXSM8kzW/+a5e1MOYJZ5W+KrPHMQ==
X-Received: by 2002:a17:906:2e92:b0:a45:6b65:f6cb with SMTP id o18-20020a1709062e9200b00a456b65f6cbmr2639599eji.26.1709622658427;
        Mon, 04 Mar 2024 23:10:58 -0800 (PST)
Message-ID: <012234d3-3677-4a1e-8e0c-6e67f582c55c@suse.com>
Date: Tue, 5 Mar 2024 08:10:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
 <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
 <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
 <4fb729fa-8519-4244-a795-cc66a79cd346@citrix.com>
 <c6f9c9fa-a252-41c4-b92f-435c57044cd2@xen.org>
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
In-Reply-To: <c6f9c9fa-a252-41c4-b92f-435c57044cd2@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 18:40, Julien Grall wrote:
> Hi Andrew,
> 
> On 04/03/2024 17:07, Andrew Cooper wrote:
>> On 04/03/2024 4:55 pm, Jan Beulich wrote:
>>> On 04.03.2024 17:46, Julien Grall wrote:
>>>> On 04/03/2024 16:41, Jan Beulich wrote:
>>>>> On 04.03.2024 17:31, Julien Grall wrote:
>>>>>> On 04/03/2024 16:10, Andrew Cooper wrote:
>>>>>>> It is daft to require all architectures to provide empty implementations of
>>>>>>> this functionality.
>>>>>> Oleksii recenlty sent a similar patch [1]. This was pushed back because
>>>>>> from naming, it sounds like the helpers ought to be non-empty on every
>>>>>> architecture.
>>>>>>
>>>>>> It would be best if asm-generic provides a safe version of the helpers.
>>>>>> So my preference is to not have this patch. This can of course change if
>>>>>> I see an explanation why it is empty on Arm (I believe it should contain
>>>>>> csdb) and other arch would want the same.
>>>>> Except that there's no new asm-generic/ header here (as opposed to how
>>>>> Oleksii had it). Imo avoiding the need for empty stubs is okay this way,
>>>>> when introducing an asm-generic/ header would not have been. Of course
>>>>> if Arm wants to put something there rather sooner than later, then
>>>>> perhaps the functions better wouldn't be removed from there, just to then
>>>>> be put back pretty soon.
>>>> I am confused. I agree the patch is slightly different, but I thought
>>>> the fundamental problem was the block_speculation() implementation may
>>>> not be safe everywhere. And it was best to let each architecture decide
>>>> how they want to implement (vs Xen decide for us the default).
>>>>
>>>> Reading the original thread, I thought you had agreed with that
>>>> statement. Did I misinterpret?
>>> Yes and no. Whatever is put in asm-generic/ ought to be correct and safe
>>> by default, imo. The same doesn't apply to fallbacks put in place in
>>> headers in xen/: If an arch doesn't provide its own implementation, it
>>> indicates that the default (fallback) is good enough. Still I can easily
>>> see that other views are possible here ...
>>
>> With speculation, there's absolutely nothing we can possibly do in any
>> common code which will be safe generally.
>>
>> But we can make it less invasive until an architecture wants to
>> implement the primitives.
> 
> I understand the goal. However, I am unsure it is a good idea to provide 
> unsafe just to reduce the arch specific header by a few lines. My 
> concern is new ports may not realize that block_speculation() needs to 
> be implemented. This could end to a preventable XSA in the future.
> 
> I guess the risk could be reduced if we had some documentation 
> explaining how to port Xen to a new architecture (I am not asking you to 
> write the doc).

But that's precisely the difference I'm trying to point out between having
a stub header in asm-generic/ vs having the fallback in xen/nospec.h: This
way an arch still has to supply asm/nospec.h, and hence they can be
expected to consider what needs putting there and what can be left to the
fallbacks (whether just "for the time being" is a separate question).
Whereas allowing to simply point at the asm-generic/ header is (imo) far
more likely to have only little thought applied ("oh, there is that
generic header, let's just use it").

Yet as said, the line between the two can certainly be viewed as blurred.

Jan

