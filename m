Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1B6A3A1E6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891971.1300978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPzN-0006BU-GF; Tue, 18 Feb 2025 15:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891971.1300978; Tue, 18 Feb 2025 15:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPzN-00068t-DO; Tue, 18 Feb 2025 15:58:25 +0000
Received: by outflank-mailman (input) for mailman id 891971;
 Tue, 18 Feb 2025 15:58:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkPzL-0004rx-FC
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:58:23 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d8b1ecb-ee11-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 16:58:21 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5deb1266031so10041162a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:58:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53232039sm1082376466b.9.2025.02.18.07.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:58:21 -0800 (PST)
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
X-Inumbo-ID: 2d8b1ecb-ee11-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739894301; x=1740499101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=keJpOkJI/SZSeQsFY2/E2yV+wluNgLR7CM9pKD8X+j8=;
        b=f6Guzxu3M065iuDt0wK2fYvAf2Bmqsf1L/xoYEQIR4I2ClTb/fvr7okhuHtLEPaR2P
         8woj4AVZgH+5ecpRjkccGejXtdADkMUfWqq/56bze+9zHnxFzdG/Owe3VHYm0IEKs3O6
         A6w7kjFOuGlgYl5fpJG5xhG22dKqvVg6obRFTvmsJrqd05O57p7lP1qE7fe/odTeDAZR
         lVFeyba8AvljPtsmZWTyIqqpSy1yErRqFDd5TZ9OQEqCDmCLoNKdL9tHvry0nGvBzU1u
         lTOoZkr3PWO4LUo+Cfm8gS4ZJcFH4orz4X+oTBIP2+UtvohuWgvxbzz1ByfSC7YGBxRR
         MXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739894301; x=1740499101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keJpOkJI/SZSeQsFY2/E2yV+wluNgLR7CM9pKD8X+j8=;
        b=OX6En1QB4y1rWnI5bdKlb8cumiB73ZPgMrRKpGTX1JBpiGHiGVkrtdgwy3gjj5h9TS
         3e87SIWgwLPddeC89wgB07GarhNVPaW525uBZytvxmjmqTsEujwQ+N4Ke93IAtA1Jz9V
         0yp+pvXjyGJmWY3xAF2AV6MxdI+NLUl0zxCC65hoW0j4G2+5SklOWjfq26ly2HRBOwQA
         sXproUB4mIpL2VHMKZZqMEa4uLl5zbt/T6Twc7TMTPIonUFcPUFqIAij1mQAOc8Z22GJ
         kqT7rm8o3y3Sk7lVpb1gPjtTD4WS+VJX0+iG6tcJ+BSP9ieIYIru6BnMfg2yHqFJA6U9
         MDbw==
X-Forwarded-Encrypted: i=1; AJvYcCXCJKtVBK9eGtEtZcs5iM2GSU4ZX8XG9B/LDo/7H76TQyhkDKzjVhdZMg3xV5k91ZTvkrT5oJhx5O8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTDtVBeAtbBVj11E2jNsJ0IarbU9kLil2N7cr+mmWVI50U817N
	8ITQr67Gq40G7WHMaiTDbKDQGXSDl2SvTCMFVc5w4uy9q0sjQ5an2ENOjHgbgg==
X-Gm-Gg: ASbGnctkboCVzf2CwxP5Qso7TbvXqzwPXWH9LStJhrOt9QTwPeDlGtU0ASr0x1l4TYf
	wVrcG48qOy6SeFmBYLD7GIFstgFgCw2WSr8XheplDpunmhVpVcUthIdYGjGmh0LFZYtc49PjuzD
	GwMWI1xOd6h9LIl4/OUzmeUhVXFxyAJT7kfqNcak0FlRT+lxeZyKtkuaRNlSBnNBZwhh4UFc5vM
	7c36KRbeT7mBTY9ESxcrurjWmFYLuE/MDEGi/OrFzXfHAf3q3TpCLBZfOTnMhEahkn06WQXkd/a
	/SkakK0ZCKbnGk0H1woi69yTD97kf2ly1FRX3tCjkxNX5ocSIlHfPOXr/NOd7A2gSfkoNxCP1/5
	U
X-Google-Smtp-Source: AGHT+IHiDA8pK4OTZ1tdSoWZnNI1+lXBcGulFxpDaPVphFmd50xFe/3JLrTAwPzcDGXHa679fj1aVQ==
X-Received: by 2002:a17:906:314f:b0:abb:6b1a:7b22 with SMTP id a640c23a62f3a-abb70b3b6f4mr1391598366b.29.1739894301284;
        Tue, 18 Feb 2025 07:58:21 -0800 (PST)
Message-ID: <eb003947-612e-475f-911c-f42e45d552da@suse.com>
Date: Tue, 18 Feb 2025 16:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250218143504.77638-1-roger.pau@citrix.com>
 <20250218143504.77638-3-roger.pau@citrix.com>
 <Z7Sq4wXr3nqQpdMk@macbook.local>
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
In-Reply-To: <Z7Sq4wXr3nqQpdMk@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.02.2025 16:44, Roger Pau Monné wrote:
> On Tue, Feb 18, 2025 at 03:35:04PM +0100, Roger Pau Monne wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -822,7 +822,8 @@ Specify the bit width of the DMA heap.
>>  
>>  ### dom0
>>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
>> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
>> +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
>> +                pf-fixup=<bool> ] (x86)
>>  
>>      = List of [ sve=<integer> ] (Arm64)
>>  
>> @@ -883,6 +884,19 @@ Controls for how dom0 is constructed on x86 systems.
>>  
>>      If using this option is necessary to fix an issue, please report a bug.
>>  
>> +*   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
>> +    defaults to false.
> 
> I'm considering whether the default should instead be true, so that
> PVH is closer to what which regions a classic PV dom0 gets access to.

I was wondering about this too, but then thought that we may want to do
this in a separate step, once we've had some more coverage.

Jan

