Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDC19050D7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739185.1146150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLYC-0007Ko-EF; Wed, 12 Jun 2024 10:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739185.1146150; Wed, 12 Jun 2024 10:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLYC-0007IL-Ba; Wed, 12 Jun 2024 10:49:56 +0000
Received: by outflank-mailman (input) for mailman id 739185;
 Wed, 12 Jun 2024 10:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHLYB-0007IF-5o
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:49:55 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f938287-28a9-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 12:49:52 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so238250766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:49:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1da43b48sm394577166b.195.2024.06.12.03.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 03:49:52 -0700 (PDT)
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
X-Inumbo-ID: 7f938287-28a9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718189392; x=1718794192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kCHi9i7kiAc1JKyqc9KQQd8JvO+yBsQDZQQQuXhfu7E=;
        b=Q2bxN5WYbw7SZUaNkfs93IsmtLWfuCCcEfM7YK/zoqOCgtLqxDvaU9srrkeBKYmaRB
         +oJ5bTCF/q8r9emV/6XZKGb3Xt8WZtSaLyjzOLoSVy9GSxl4yRVuW5gqCPtqhc/ExGDT
         LLHfMvFYv2idI7I6OO/TxnaU8JYly1cZPpK72oJKKQYLk3JBC+YMAr+sRZvMzsADxF3S
         OZJywFJoNl5XqGdsmvVbQoqnsXpCtgj5aMhl3RDdWZsnTVAqj5QPbIsXa8nStVEvj+XN
         wCiBFcODB9fbaGg8/6U5lOvYU7WtgeY7+9qZGbPZ22pX91uURU7mTU7gE0SKz3GZ/2uk
         +VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189392; x=1718794192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCHi9i7kiAc1JKyqc9KQQd8JvO+yBsQDZQQQuXhfu7E=;
        b=g9d8+0cmAI24xnVsJbU+E/lO3OOsSC5hoIIQ5+WB6iC0JVKcCeL0chWwDBkRNapNOw
         ML9/plcjotqiizA1oi6/ajWu3qf+KtiVknsXiR1krrb1cp9z1oJK5K4Ho4V8odWHreYx
         j5n5Ci9D1fypsNXjkyBYYhmPyX+4NCNjrUNl/1rw2kJzsUC1LMIeh+d0pe+7ZhD/VXc1
         wMfNln/H3B0za0HPTzpNx5a3OTBuYq9/MxgkUQy1vSg5X/t2syIq9p3o2igB/AOQxy3E
         7LxsjGfAbECWiO4c5G7bsUpo4MzvFRBtMEHAJmfVBZZMa6AMtUKaCuie8DFgVxqS5Iq4
         3X9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxURAaVlPOzQIZXl8Pix18pI1jA357pX358n15RUp+k199igUxA+YmyDwxfipTRcaob8tKR0Nbv90s816VECAEc8HifjahICDftKTuvV0=
X-Gm-Message-State: AOJu0YzZQ0ia5DlIGJFC47OETa3Th9hcQEzx3AdvHVuYInfFWUZxeby7
	eLIlvup+dn3mYDM6/zscF+H9oo1n4Knai+lNc+q4wRAX7Hua7U5k41c3B1ap6Q==
X-Google-Smtp-Source: AGHT+IHTGawWv1MOPTU/1//RtsPxP2m9rYAYIbKMsVppJiovMaDyNVw9fu4s1AmLLKHfBoPwjv/ZPg==
X-Received: by 2002:a17:906:350c:b0:a6f:3e18:f9e8 with SMTP id a640c23a62f3a-a6f47d5f67amr81931566b.76.1718189392233;
        Wed, 12 Jun 2024 03:49:52 -0700 (PDT)
Message-ID: <7a7b10da-8429-4f5c-a946-7442d4896ab5@suse.com>
Date: Wed, 12 Jun 2024 12:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BlueIris error on Xen 4.17
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <ced16fca-3b55-40a1-a7e2-ffadd9707394@vates.tech>
 <1eaed8c1-981f-4c16-a2f6-e783fa43963f@citrix.com>
Content-Language: en-US
Cc: Damien Thenot <damien.thenot@vates.tech>, xen-devel@lists.xenproject.org
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
In-Reply-To: <1eaed8c1-981f-4c16-a2f6-e783fa43963f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 12:25, Andrew Cooper wrote:
> On 12/06/2024 10:40 am, Damien Thenot wrote:
>> Hello,
>>
>> A XCP-ng 8.3 user that use Blue Iris Software encountered a crash with 
>> Xen upgraded to version 4.17.
>> It worked correctly when XCP-ng 8.3 used Xen 4.13.
>> It is happening on Intel Xeon E-2378 CPU @ 2.60GHz CPUs and it seems 
>> more recent Intel CPUs.
>> His guests are Windows with a NVIDIA GPU given to the guest.
>>
>> The user added:
>>  > On an older box with i9-9900K CPU it does not happen and the VM works 
>> as expected. Also working on an older
>>  > Xeon Intel Xeon E-2146G and a E-2276G. Anything newer than that 
>> however the VM will just BSOD.
>>
>> You can find more information in the XCP-ng forum post: 
>> https://xcp-ng.org/forum/topic/8873/windows-blue-iris-xcp-ng-8-3
>>
>> The user tried enabling `msr-relaxed` following notes in Xen 4.15 
>> documentation.
>> But it didn't change the behavior and the guest still crashes.
>>
>> Has someone else observed such behavior?
>>
>> Here is a Xen dmesg output with the error that the user was able to obtain:
>>
>> ```
>>
>> (d1) [  132.028963] xen|BUGCHECK: ====>
>> (d1) [  132.029008] xen|BUGCHECK: SYSTEM_SERVICE_EXCEPTION: 
>> 00000000C0000096 FFFFF80418A21E27 FFFFAC009F27B900 0000000000000000
>> (d1) [  132.029057] xen|BUGCHECK: EXCEPTION (FFFFF80418A21E27):
>> (d1) [  132.029096] xen|BUGCHECK: - Code = 8589320F
>> (d1) [  132.029134] xen|BUGCHECK: - Flags = 000000A8
>> (d1) [  132.029174] xen|BUGCHECK: - Address = 8589320F008EECE9
>> (d1) [  132.029214] xen|BUGCHECK: - Parameter[0] = 0F000001D9B90000
>> (d1) [  132.029255] xen|BUGCHECK: - Parameter[1] = 4166300FFCE08332
>> (d1) [  132.029297] xen|BUGCHECK: - Parameter[2] = 0355000002C881F7
>> (d1) [  132.029338] xen|BUGCHECK: - Parameter[3] = 0002A0818B497B74
>> (d1) [  132.029379] xen|BUGCHECK: - Parameter[4] = 000002A8918B4900
>> (d1) [  132.029421] xen|BUGCHECK: - Parameter[5] = 8B49CA230FC0230F
>> (d1) [  132.029462] xen|BUGCHECK: - Parameter[6] = 918B49000002B081
>> (d1) [  132.029502] xen|BUGCHECK: - Parameter[7] = 0FD0230F000002B8
>> (d1) [  132.029544] xen|BUGCHECK: - Parameter[8] = 0002C8918B49DA23
>> (d1) [  132.029585] xen|BUGCHECK: - Parameter[9] = 230FF0230FC03300
>> (d1) [  132.029626] xen|BUGCHECK: - Parameter[10] = 008AE22504F665FA
>> (d1) [  132.029667] xen|BUGCHECK: - Parameter[11] = 00C2F76639740200
>> (d1) [  132.029709] xen|BUGCHECK: - Parameter[12] = 81342405F7327403
>> (d1) [  132.029753] xen|BUGCHECK: - Parameter[13] = 6626750000000200
>> (d1) [  132.029794] xen|BUGCHECK: - Parameter[14] = C88303740200C2F7
>> (d1) [  132.029835] xen|BUGCHECK: EXCEPTION (0D8B000000AC9589):
>> (d1) [  132.029888] xen|BUGCHECK: CONTEXT (FFFFAC009F27B900):
>> (d1) [  132.029925] xen|BUGCHECK: - GS = 002B
>> (d1) [  132.029959] xen|BUGCHECK: - FS = 0053
>> (d1) [  132.029994] xen|BUGCHECK: - ES = 002B
>> (d1) [  132.030028] xen|BUGCHECK: - DS = 002B
>> (d1) [  132.030056] xen|BUGCHECK: - SS = 0018
>> (d1) [  132.030089] xen|BUGCHECK: - CS = 0010
>> (d1) [  132.030123] xen|BUGCHECK: - EFLAGS = 00040046
>> (d1) [  132.030160] xen|BUGCHECK: - RDI = 00000000000002C4
>> (d1) [  132.030199] xen|BUGCHECK: - RSI = 00000000005FFA48
>> (d1) [  132.030237] xen|BUGCHECK: - RBX = 00000000426ED080
>> (d1) [  132.030275] xen|BUGCHECK: - RDX = 0000000000000000
>> (d1) [  132.030312] xen|BUGCHECK: - RCX = 00000000000001DD
>> (d1) [  132.030349] xen|BUGCHECK: - RAX = 0000000000000000
>> (d1) [  132.030386] xen|BUGCHECK: - RBP = 00000000E4427520
>> (d1) [  132.030424] xen|BUGCHECK: - RIP = 0000000018A21E27
>> (d1) [  132.030463] xen|BUGCHECK: - RSP = 00000000E4427498
>> (d1) [  132.030504] xen|BUGCHECK: - R8 = 0000000000000000
>> (d1) [  132.030543] xen|BUGCHECK: - R9 = 000000009F25A000
>> (d1) [  132.030580] xen|BUGCHECK: - R10 = 00000000000002C4
>> (d1) [  132.030618] xen|BUGCHECK: - R11 = 0000000000000246
>> (d1) [  132.030657] xen|BUGCHECK: - R12 = 0000000002CEB528
>> (d1) [  132.030696] xen|BUGCHECK: - R13 = 00000000A81E3A80
>> (d1) [  132.030735] xen|BUGCHECK: - R14 = 00000000000002C4
>> (d1) [  132.030775] xen|BUGCHECK: - R15 = 0000000000000000
>> (d1) [  132.030812] xen|BUGCHECK: STACK:
>> (d1) [  132.030858] xen|BUGCHECK: 00000000E44274A0: (00000000426ED080 
>> 00000000005FF898 0000000000000000 0000000000000000) ntoskrnl.exe + 
>> 000000000043667A
>> (d1) [  132.030935] xen|BUGCHECK: 00000000005FFA18: (00000000A74AD76E 
>> 0000000000000000 00000000A81E3A80 000000000000000E) 00007FFBA9BFF4D4
>> (d1) [  132.031010] xen|BUGCHECK: 00000000005FFA20: (0000000000000000 
>> 00000000A81E3A80 000000000000000E 0000000000000003) 00007FFBA74AD76E
>> (d1) [  132.031086] xen|BUGCHECK: 00000000005FFA28: (00000000A81E3A80 
>> 000000000000000E 0000000000000003 00000000005FFB10) 0000000000000000
>> (d1) [  132.031151] xen|BUGCHECK: <====
>> (XEN) [  132.040828] memory_map:remove: dom1 gfn=f60c0 mfn=a3080 nr=4
>> (XEN) [  132.040975] memory_map:remove: dom1 gfn=f5000 mfn=a2000 nr=1000
>> (XEN) [  132.041124] memory_map:remove: dom1 gfn=e0000 mfn=4000000 nr=10000
>> (XEN) [  132.041463] memory_map:remove: dom1 gfn=e8000 mfn=4008000 nr=8000
>> (XEN) [  132.041905] memory_map:remove: dom1 gfn=f8000 mfn=4010000 nr=2000
>> (XEN) [  132.042072] ioport_map:remove: dom1 gport=c100 mport=6000 nr=80
>> ```
> 
> There was a #GP fault accessing MSR 0x1DD

That's LASTINTFROMIP, so ...

> You'll need to investigate how that MSR is supposed to behave on real
> hardware, and see if Xen's behaviour matches or not.

... I'd be inclined to assume our get_model_specific_lbr() isn't up-to-date.
Even with architectural LBRs (which I might guess is what their hardware is
offering, except that then software wouldn't be respecting CPUID output) I
take it that LASTINT{FROM,TO}IP would still be available and working as
before (leaving aside layout aspects).

Jan

