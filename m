Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E0976641
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797218.1207103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soge8-0004PM-CA; Thu, 12 Sep 2024 10:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797218.1207103; Thu, 12 Sep 2024 10:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soge8-0004MB-96; Thu, 12 Sep 2024 10:01:52 +0000
Received: by outflank-mailman (input) for mailman id 797218;
 Thu, 12 Sep 2024 10:01:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soge7-0004M5-Hg
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:01:51 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f3b1a9-70ee-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:01:49 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so91475766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 03:01:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25979fa3sm716391966b.71.2024.09.12.03.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:01:48 -0700 (PDT)
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
X-Inumbo-ID: 06f3b1a9-70ee-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726135309; x=1726740109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MJ6IVmGsMzkAdtBbbjcJ+33G4KYRMor4RAEGkqCyC90=;
        b=DFu7KmYmEL70IpLSmhV6RL2g07cuToPV6WsscryMHe6xPh/UVZJcv5CEmCe5wsRyqY
         rGnSIkLxgI9yxwxdSbBuO7DUFPtI9Z+ri5hFfyFGqk8Qh/ZbmvcMrYFeVEiGsBMgGfsM
         U487XthVMVM5xxzTkbpReDGlO2z75xsHV3pvsWTx2Fvmm2WfwuoLaO+Egi0OsodAyEPl
         biA3bT2BJ2Vp+JMqdEIk07xdPJaCh1Ey6TV3caubP6GqfOHgSPn2Q8Lz3A+I5FY+8Tka
         D2d/NYV1y5xy5PvReL5EdE7+JQGlQ+7TNxt+n4mzQfLB3fSvzF2LbTRy7rYr4k2b4GyW
         puLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135309; x=1726740109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJ6IVmGsMzkAdtBbbjcJ+33G4KYRMor4RAEGkqCyC90=;
        b=r5Uc4hPYg0pQoptDurafxa/4g/1QxKqufmQBzKeJD3PpKGBeGw2zuisx6w4VbAvDwQ
         tzRBmlcYrcy9LMrCwUchFQUnL05aPyymFzpNWwjVXacIbPU/UmJ/QGvAc+ki57ZETAef
         1gy+/tjGroMlkvE3y8DS8ZmzXDEMzcNgwhQ9PoN7RqKHrUAzQgR4UmUp60Qr/KE5S6Ck
         vOZ2K1WZEP373uj6l1j+iFU6FlkN1KlPOMUn0uKYHXIeH/aJug15JolN+wIwvS/gAep2
         jotzKqwqInUh0BMUImhdgoMxcNDPU7ysLVbNuJm40dFql85E1cWBV/1uKYRvT2zGOqOG
         52sw==
X-Forwarded-Encrypted: i=1; AJvYcCU7FpGlBJ6oTiVKRZfUEaTcAT1+J7U+PkWdL0waK+9OOBu0FyRiYKk4LoOtyh/socQ6E+wwS+G/0lw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYDIjvKz1vCd7ywHFyI+kOskquYhrKgODX3Uv7MotndCj3kaDn
	vVLOJJVmpUYOy4hcyqmklGwUz45YarV78gmah1nfZGkBf5VUmNw9MYEB+89HIw==
X-Google-Smtp-Source: AGHT+IHEF5tAiD9rmTcVFxnfVqbTpo5+R2VIlI8u2s11PLJ5G5/ykJKhaY1Qr4gXo6Xt6IIHueDNKA==
X-Received: by 2002:a17:907:e69a:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a90293dc29dmr213850866b.6.1726135308831;
        Thu, 12 Sep 2024 03:01:48 -0700 (PDT)
Message-ID: <992dbde2-a1fc-472d-9bb9-a4e11a2bc21b@suse.com>
Date: Thu, 12 Sep 2024 12:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/12] x86/emul: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <0fa68b9aee5a7a3f1b696bfc6b18ecc826663212.1725958417.git.federico.serafini@bugseng.com>
 <1e6e2bb8-2a27-4cac-a888-7d785bc4c463@suse.com>
 <6b1ca033-4a6d-4f69-aa6a-54dbcb37e79e@bugseng.com>
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
In-Reply-To: <6b1ca033-4a6d-4f69-aa6a-54dbcb37e79e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 11:17, Federico Serafini wrote:
> On 11/09/24 14:42, Jan Beulich wrote:
>> On 10.09.2024 12:09, Federico Serafini wrote:
>>> --- a/xen/arch/x86/x86_emulate/fpu.c
>>> +++ b/xen/arch/x86/x86_emulate/fpu.c
>>> @@ -218,6 +218,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>                */
>>>               if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>>>                   dst->type = OP_NONE;
>>> +            break;
>>>           }
>>>           break;
>>>   
>>> @@ -296,6 +297,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>               default:
>>>                   generate_exception(X86_EXC_UD);
>>>               }
>>> +            break;
>>>           }
>>>           break;
>>>   
>>> @@ -386,6 +388,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>                */
>>>               if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
>>>                   dst->type = OP_NONE;
>>> +            break;
>>>           }
>>>           break;
>>>   
>>> @@ -457,6 +460,7 @@ int x86emul_fpu(struct x86_emulate_state *s,
>>>               case 7: /* fistp m64i */
>>>                   goto fpu_memdst64;
>>>               }
>>> +            break;
>>
>> Aren't you swapping one violation for another here? Unlike in the earlier
>> three cases, this new break is unreachable, because of the nature of the
>> preceding switch() statement (cases being exhaustive and every case ending
>> in "goto"; this is something even a static analyzer can [in principle]
>> spot).
> 
> You are right, but the resulting violation of Rule 2.1
> ("A project shall not contain unreachable code") is deviated with the
> following justification:
> "The compiler implementation guarantees that the unreachable code is
> removed.

I'm not convinced this is the case here in practice.

Instead of "break", wouldn't "unreachable()" be the better construct
to use in situations like this one?

> Constant expressions and unreachable branches of if and switch
> statements are expected."

This I don't think applies in this particular case?

Jan

