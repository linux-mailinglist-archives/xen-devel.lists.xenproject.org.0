Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14080AD832B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 08:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013794.1392007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPxme-0008OK-K9; Fri, 13 Jun 2025 06:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013794.1392007; Fri, 13 Jun 2025 06:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPxme-0008Mw-H5; Fri, 13 Jun 2025 06:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1013794;
 Fri, 13 Jun 2025 06:20:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPxmc-0008Mp-Od
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 06:20:58 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90207c10-481e-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 08:20:55 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1357763f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 23:20:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365de78169sm7145115ad.123.2025.06.12.23.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 23:20:54 -0700 (PDT)
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
X-Inumbo-ID: 90207c10-481e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749795655; x=1750400455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GuhmqzkGgYKtcPNMkVVUgIyrlCfhaxVJeTKzU0mfgaM=;
        b=bhibq4UeMIWN4DZ3YGvrAvBVN3f6fdL4sjm42/OSjj74F3T9xz+GvG8TP1VJ2yzzVx
         EQJ2fAWDnSdVWCGfbzj1HvWKYRWNtVKofojxLKITje/8KsCoM2SlYJPseVExbPtTYKBn
         XKJlH3HnXXm9+hBar6FnQm/VWsC3aqTaRlwaFg96upplscQZZXVM49aRYhJuX2E76cYt
         sksxfsHJUacwD6IZABrih1/zMQ4XNzle0O4c7DQTLnxc0lLFcuWjVkAOI4Gmylk4ZHYh
         GivN7KEnPsoeVmRy46EyRMbE1mMUN5kG6o1krsT+OzIa2oMDSCek6bOi4Ej8KU3IVyTY
         99nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749795655; x=1750400455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuhmqzkGgYKtcPNMkVVUgIyrlCfhaxVJeTKzU0mfgaM=;
        b=ArvTHD28U2Qj9UEFi3/+TEa9VfvV0LpQa8jje0riwM3u9dFO8truQ+ZILDgfLB3fU1
         q+w63nYvbAtHJpRSvOn7s6w2cW60joevsbe8xOG1dX02RBUGisGM5GG2kmKUR9XPSwq+
         pOE9qhXgetWvjyVyYhzBGLHrvpaMya5sswvik68qh6GI4CeKD9jdprCYIc2z3GRIp3St
         2BBmmQ2CzRRRC9h7KiETiv2rASg7xRDk/B+7Q8dMasoXj9OMc+k0vKP1mu4W7aeF9fIO
         jy+tedwcdWR8QWVKieMpcjdtsxxTVva/xGxCnpsiInnWbMQAjeLDnCPaJlnxTNdDbv2h
         MWCA==
X-Forwarded-Encrypted: i=1; AJvYcCUGy6ct8UowgzRskt6/66R2uZ2zXAREO5hA7cpF/wLMDcOPebqHDLG75um7RAaA4Z4+x0EtLAleuQE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRGksb9AG1PsU3nHY8gswDDgpmiCqO3WULTKLbmBWNrzghrjn7
	pRSFfDKZCIDLGJsqA60Gh7EtS4NCk1eIUtlGiHIGSZRtqHzPIFFsedVpfYnkpGsgbw==
X-Gm-Gg: ASbGncspL0wbUHLVTENnZvMwXPa1N/5kzZxMBtNG8/85HctBXUhatNeRdkVscMkIoV1
	ngHiNb4YfVDZI/5s3gPAhIbTiocJcxTAHlZyZ0zokmaGpgX1KpAjzYL31DPX+bP3Ji1BON7lBo2
	W4hUh2wEHrrltdbWlUEoRKxwntQ9p6/qQA+etZ633o47s/ZmuXsBq/RFX/nLOW3kKFUhlL4Y7nL
	og3Cv8syb1naevDKW2u5Yo/8v8xisXb0oKD1b4/Jxw9n96StcMhg5l6M0p4DaX0nRIVKM7o7vyx
	FsZziUiKH8myC08lkMgLGfEM3OLsmErTpfKGMY6vGa1ObFMsBg4e4u8jl2paj1NuTGUxedGgoiq
	p8LzTgZp+tIE0A+JYtnQ1eab65GwNasEdWLKNamM/RIiUUOc=
X-Google-Smtp-Source: AGHT+IHvgWd++SMkJ8DbupvE+BAw7rTlgJued/UIvKksWby3Obp6hSRg3JvhbW1KRCA/HFiOQnQTbQ==
X-Received: by 2002:a5d:64c2:0:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3a5687176d4mr1190627f8f.47.1749795654819;
        Thu, 12 Jun 2025 23:20:54 -0700 (PDT)
Message-ID: <c7df3ed4-9c29-45b2-8be7-9f5d08560d1f@suse.com>
Date: Fri, 13 Jun 2025 08:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xsm/silo: Support hwdom/control domains
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-3-jason.andryuk@amd.com>
 <0f47268e-0674-46e7-bfd4-8a395ee1ddf6@suse.com>
 <6cc69b45-7347-4250-ab32-a1e2857b7d23@amd.com>
 <805abeee-0cad-4cc9-88ae-77e4c1e23fac@suse.com>
 <fc719213-3ac4-4f3a-ab20-47b2170b2a1f@amd.com>
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
In-Reply-To: <fc719213-3ac4-4f3a-ab20-47b2170b2a1f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 18:56, Jason Andryuk wrote:
> On 2025-06-12 03:52, Jan Beulich wrote:
>> On 11.06.2025 06:20, Jason Andryuk wrote:
>>> On 2025-06-11 09:17, Jan Beulich wrote:
>>>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>>>> --- a/xen/xsm/silo.c
>>>>> +++ b/xen/xsm/silo.c
>>>>> @@ -20,6 +20,12 @@
>>>>>    #define XSM_NO_WRAPPERS
>>>>>    #include <xsm/dummy.h>
>>>>>    
>>>>> +static bool is_priv_domain(const struct domain *d)
>>>>> +{
>>>>> +    return is_xenstore_domain(d) || is_hardware_domain(d) ||
>>>>> +           is_control_domain(d);
>>>>> +}
>>>>
>>>> This construct expands to two evaluate_nospec(), which likely isn't
>>>> wanted. Some open-coding may be pretty much unavoidable here.
>>>
>>> Thanks, yes, good point.
>>>
>>>> (I'm
>>>> surprised it's not three, i.e. I find it odd that is_xenstore_domain()
>>>> doesn't also use that guard.)
>>>
>>> It looks okay to me.  There were only 2 uses until I added a 3rd in the
>>> dom0less code.  The XSM check has evaluate_nospec() and the other 2 uses
>>> aren't security critical - Setting a domain info flag, and __init code
>>> for dom0less.  Maybe moving the evaluate_nospec() would be safer in case
>>> use grows in the future, but it looks okay to me today.
>>
>> When some of the hardening was first introduced, actual use sites were
>> indeed taken into account. That wasn't quite right though, I think. Any
>> such construct ought to be safe to use anywhere. For uses with clearly
>> no concerns towards speculative abuse, a 2nd lightweight form of such
>> constructs should then exist, imo. As to your use of "security critical":
>> I'm not convinced you what mean is covering the potential of speculative
>> abuse of involved code paths.
> 
> I can't parse this last sentence, and I think it's your main point.

Oh, sorry - the "you" and "what" ought to have swapped places.

> XSM -> don't speculate around permission checks.  That's what I meant by 
> "security critical".
> 
> The __init code is inaccessible to users, so it doesn't matter.
> 
>          if ( is_xenstore_domain(d) )
>              continue;
> 
> getdomaininfo sets a flag, so I don't see this making a security 
> difference.  It's not controlling loads or code paths.

Right, but this is what I said should imo not have been done: Make a
predicate speculation-safe (or not) based on its present uses. It's
imo more likely than not that a new use being added won't result in
the predicate being looked at, re-considering its safety for the new
use.

And indeed there's a 3rd use, in xsm_default_action():

    case XSM_XS_PRIV:
        if ( action == XSM_XS_PRIV &&
             evaluate_nospec(is_xenstore_domain(src)) )
            return 0;
        fallthrough;

It should not have been necessary to open-code the speculation safety
here, just like such isn't required a few lines later:

    case XSM_PRIV:
        if ( is_control_domain(src) )
            return 0;
        return -EPERM;

I am, btw, also not convinced the uses of evaluate_nospec() are fully
correct here, in that they apply to only part of the if() conditions.
For "action == XSM_XS_PRIV" it's okay as long as
- the function is indeed inlined, and
- the function argument is compile-time constant.
For "target" the same applies, but there is more room there for the
latter of the constraints to not be met. The argument in favor of
the present arrangements likely was that our main concern here is
with the "success" paths. Yet such argumentation would again be
dependent upon all call sites fitting the assumption that on the
"failure" paths there would be nothing critical that follows.

Jan

