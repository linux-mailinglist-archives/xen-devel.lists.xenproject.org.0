Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D0BC57A22
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161523.1489455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXJd-0002KK-2W; Thu, 13 Nov 2025 13:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161523.1489455; Thu, 13 Nov 2025 13:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXJc-0002Ih-W2; Thu, 13 Nov 2025 13:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1161523;
 Thu, 13 Nov 2025 13:24:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXJb-0002Ib-7M
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:24:43 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c4ded53-c094-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:24:41 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so89352166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:24:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80841sm166261066b.41.2025.11.13.05.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:24:39 -0800 (PST)
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
X-Inumbo-ID: 1c4ded53-c094-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763040281; x=1763645081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldd/ucrpDEI3NtzsEB427Xdl7SVMnamsSXVE6QKJ2+w=;
        b=dfLZQ9uzBrMc8nOEfP+/3N2DG3w3tZA6htdOhGmHdx67i6hCyh9jj+OVNRXkhrF1pz
         K4QxUdi4dE0E3O0YaxQNiEZsNCbZnXZJhYRJd4Br+0B4KTuohb4lKyE/dF3v7M9BNTBt
         T9gBuxdpftQoEY/k2fwC4K8SCooamAK9CHJhezoyPYgiRDSvacoC4SenlEyLj2RcG1/P
         N2MhQogklBNszJV5LonLEhsXX1n7aOrR2SZIVFH4VCU6k2HwUtV7y5lVqKbWqPC3KUAh
         n95hCulpx12V7QXEJTgbvlXhAmTQ7Cl5cKHTL1cHwdmPsFxRfMzGgejMJi31akUhgorC
         vUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040281; x=1763645081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ldd/ucrpDEI3NtzsEB427Xdl7SVMnamsSXVE6QKJ2+w=;
        b=bxW5BpS2zdu7diA3w20vOY6eCm+nKkEhzQ05TxAhAqYZh3vbivN42u3IQl1c3BNw5v
         C3VD0plAVcZBbF4nRbevBYZjMQZkB/dzYLeUQJr4iYPV0ig6KJV9LWyolX77s+5eb7Sq
         I5TCMmDWgW6XoHGADr9k6VYQshiCaojky8i8GeQZv9UdIEKSMDfU0Rg2F3MeF+8VOGd4
         1xtv/qtvdRAl13sRWEAPPiI/tnFv9BLbZZQKP0jebnoKAGF7QqnhudtsmBXmZ3OsjXE2
         UEePm2o4/X06rzxSW4nfUz+dTxBYz5p+zkBarKFL05tta0FFKqQxRUkRLoL3zcC4Zfb7
         MPNw==
X-Gm-Message-State: AOJu0YxHIp3tzlY3ssGpcpUHz9UZLqhTgS15U91M8LxYugxlqTy+DpmK
	5+z3BST/+hV/24SBiYbU4X0955rCo82l5VicRMH3P1qg2Z/WlsRuu21eSIBkdEXb5w==
X-Gm-Gg: ASbGncv+4GVzZ0Mn1Y+emGtORD0SHcZDtzn17e++SggC91BolfrhLQZw7uD3oVIdwLB
	ngzWa3Do8c0ndYSAmdtZ8iLwEeuZez+dKI5O5AZPxD08/3EnZjXDcGgcsVV9YChEBS1CTxEPI7B
	jOi87MsWEZZESSHBEPAFUXTjEezwHfJ2MZ/bkxw1WhQEae9VG0zZE2riWLi7weZ7guk+Vr61jFD
	k8AkrmT8x5ysiwcIYyOasbTrpoh9vZeJ4lzY1brolCuh6rYSavtonYVWvHiBh4AKipzeTjmKe8K
	j5cAftRrJruvG8aESJ2pgfo6QQZfDSd+lRYy7d7edHDqofZJ/Z9nkDpUErTsFXXHzWy0aXDwXS1
	3JDh2Qh9TVFtwOlMJH3Yf1q8HnpoODKDZxBf2elWjOaWJR9kpyQ/w4V5XWAhjKpUPkocG32meE0
	FBJyEDMW/y60HAVL5va6zmtbEw4J9c5ikyRCdqfgzlDl61Kk+ru2YoyYjIhwbWw+4aRgECe2rUb
	Zg=
X-Google-Smtp-Source: AGHT+IH56ZCFaD9fOtKXzDZV1ZoayVd9++TEy19W02z6zvxooQSQG93ibbfn0VDE3DenNkZoy3zK9Q==
X-Received: by 2002:a17:907:c14:b0:b6d:50f7:a805 with SMTP id a640c23a62f3a-b7331af6803mr543011866b.59.1763040280571;
        Thu, 13 Nov 2025 05:24:40 -0800 (PST)
Message-ID: <19ab9d24-057e-4c70-a663-b8288ea630a1@suse.com>
Date: Thu, 13 Nov 2025 14:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/EFI: replace ebmalloc()
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bdbb2884-c2d2-415a-8891-a598d112e34c@suse.com>
 <452fdf1f-646a-4bb1-83ea-ac4c998a096b@suse.com> <aRXRtY10cFN38d02@mail-itl>
 <4391d560-870e-4010-b3bb-dee2935f9732@suse.com> <aRXWLrEGbSRdqDA7@mail-itl>
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
In-Reply-To: <aRXWLrEGbSRdqDA7@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 13:59, Marek Marczykowski wrote:
> On Thu, Nov 13, 2025 at 01:46:20PM +0100, Jan Beulich wrote:
>> On 13.11.2025 13:40, Marek Marczykowski wrote:
>>> On Thu, Nov 13, 2025 at 12:09:37PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/include/asm/brk.h
>>>> +++ b/xen/arch/x86/include/asm/brk.h
>>>> @@ -2,6 +2,10 @@
>>>>  
>>>>  #include <xen/types.h>
>>>>  
>>>> +#define DEFINE_BRK(var, size) \
>>>> +    static char __section(".bss..brk.page_aligned") __aligned(PAGE_SIZE) \
>>>> +        __used var ## _brk_[size]
>>>
>>> This chunk belongs to the previous patch I think.
>>
>> It could, but it's not used there yet (i.e. would count as dead code).
> 
> But in the current shape the linker script change in the first patch is
> unused. IOW, I think adding .bss..brk.page_aligned to the linker script
> should go together with DEFINE_BRK.

Again - could be done that way, but there's no concept of "dead code" in
the linker script (afaik at least).

Jan

