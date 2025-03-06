Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2BAA546C0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 10:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903288.1311198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq7mA-0006wp-Lu; Thu, 06 Mar 2025 09:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903288.1311198; Thu, 06 Mar 2025 09:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq7mA-0006u7-IN; Thu, 06 Mar 2025 09:44:22 +0000
Received: by outflank-mailman (input) for mailman id 903288;
 Thu, 06 Mar 2025 09:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tq7m8-0006u1-P1
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 09:44:20 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9051675f-fa6f-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 10:44:14 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390fb1b987fso493622f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 01:44:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba66esm1515136f8f.18.2025.03.06.01.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 01:44:13 -0800 (PST)
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
X-Inumbo-ID: 9051675f-fa6f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741254253; x=1741859053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=usAvTaqBcr/bbnOPithLGeq2n3hcMXLefPSQ95lBAFA=;
        b=G/kFwYvd3EohL4zOch0L6axeN2/p8EN+m2PSBLC4sCj6c1pQT1pyTz/hemr5hpljn1
         aOY9MYAsAMhiZGLqFiRpLceIiTmJnfAyLfctz+m2VIlADytoj2GB9jru6PnQ7M645QSD
         JVH6oNPwPLxZfMxu2BILqnYrHza/BW6kTb5z24vEIXCnC8sTaDsDDumXbrp1gocAPk+3
         IqZ5Yxn05h1u5Gl7vBtBI5PZ8/fdtwWUGc5KXywOiUc/B7QKYHuKMnBaHA3pihugiutF
         iJBfoU5WC/v5nnh+Dyft79vI59pfMYXCnz15d8nkeyBeR6CX2pCr5C/u+YiRz33HrWn3
         G50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254253; x=1741859053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usAvTaqBcr/bbnOPithLGeq2n3hcMXLefPSQ95lBAFA=;
        b=qI28xrWCLa/d+5Awt3SwHeXqFIKdGnR3NmfSoutS5PuTZA/Ej8w/WNu+4UFTlbNBhr
         b1PaZGq9R5JhdLLx8K5hXKgGYXqv8CMoFZaA9HazrArnAYo4ijs4sZXpx32GcURo+y5O
         4UB4fYxsHZKAvbVc7+vUMI7YVQr+mIx5Oj8jNg6tQ/lQaWJrmIHqf+bw4RBaRLO9nQ3N
         8PNBvRyHzOK67tM65NQ21tYv//jbYlPGHinqVAd/DXStOuyIpzK0ByorXVOgYwZqjqjk
         ZaZHBeNjcgC1Cfv15YLo1SNnznZKwyusQv9XqnYDEiYbeH+8yTbQvS3p68npqdavJfRw
         y8Sw==
X-Gm-Message-State: AOJu0YyThPHbGjtBfsUFPivXqI2ceY3qwtvUHpHPUDP3ngN/zFQxGA8R
	58I7JtkdOjxg615lhJN6Jrikw2m2ttomvxYMaY1x7awOZH7EOcvFa2nbwwqLqw==
X-Gm-Gg: ASbGncsPd1xQG2idhKNKKt7BCvdZ5Fm/+D38B71qNeKoXvH77DhNB+SLgS07LtMAjWn
	MQqxEsopYXUduakLFPcl2ON/Kc6+MNrBK/o26Mnp/8hiq2+FBd8iWwwI8IQk+wgT1Nbjg2nEV77
	92XFdoXa1RxNpiGHQUfF27rmahvpC8o9cbMuqQGZ6uaZJSJYUaODlPjau6YoXlpm+FNHA6eJcAi
	PADu/I/ciy+ucHIKQTsLpkEJe1DU5JeKxWuxO3BPM4rq9gOPB6N/A44k4Sv8HMH7G0t3eXu0Xc2
	THdycI5RzZjlCfcMMCnJmyjQiXDIVQ0VOiNV1vlMtzekZS3XOGUjnOeS5PITR6+X3XMSwksQz8Z
	3V4rsmLTYgIQjX3sTgRQnbvb4JbBQpQ==
X-Google-Smtp-Source: AGHT+IFszLHIdk4KjC2kAQ8p2Zo6v1fOygNBpS6gv3efciqn8eIT4nAPgsz+i0XsIAbZ+qgFnvvkXw==
X-Received: by 2002:a05:6000:2d08:b0:391:ba6:c069 with SMTP id ffacd0b85a97d-3911f7c246bmr4246469f8f.44.1741254253605;
        Thu, 06 Mar 2025 01:44:13 -0800 (PST)
Message-ID: <f955e83e-4177-4eb3-b65f-cd8428c6be4c@suse.com>
Date: Thu, 6 Mar 2025 10:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] x86/HVM: improve CET-IBT pruning of ENDBR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <748548e8-79e5-4957-be16-c5ea4d202d21@suse.com>
 <29cc2974-a1d8-4123-83b0-b44a3151f900@suse.com>
 <Z8hkLjMAQfhBR2Cm@macbook.local>
 <5978ed8d-ecef-41f7-adde-bc52312b483c@suse.com>
 <Z8hwTL8bsgjU3fJi@macbook.local>
 <0d298a29-91f6-4e3f-abac-c14fcbfbccf5@suse.com>
 <Z8iJKJN17mILVEGS@macbook.local>
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
In-Reply-To: <Z8iJKJN17mILVEGS@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.03.2025 18:26, Roger Pau Monné wrote:
> On Wed, Mar 05, 2025 at 05:23:05PM +0100, Jan Beulich wrote:
>> On 05.03.2025 16:39, Roger Pau Monné wrote:
>>> On Wed, Mar 05, 2025 at 04:02:51PM +0100, Jan Beulich wrote:
>>>> On 05.03.2025 15:48, Roger Pau Monné wrote:
>>>>> On Tue, Feb 25, 2025 at 12:37:00PM +0100, Jan Beulich wrote:
>>>>>> __init{const,data}_cf_clobber can have an effect only for pointers
>>>>>> actually populated in the respective tables. While not the case for SVM
>>>>>> right now, VMX installs a number of pointers only under certain
>>>>>> conditions. Hence the respective functions would have their ENDBR purged
>>>>>> only when those conditions are met. Invoke "pruning" functions after
>>>>>> having copied the respective tables, for them to install any "missing"
>>>>>> pointers.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Thanks.
>>>>
>>>>> However I find this filling slightly ugly, and prone to be forgotten
>>>>> when further hooks are added.
>>>>
>>>> Indeed. Luckily, while undesirable, that wouldn't be an outright bug.
>>>>
>>>>> Would it make sense to delay enabling of IBT until after alternatives
>>>>> have been applied, and thus simply not use the cf_clobber attribute on
>>>>> functions that are patched to not be indirectly called?
>>
>> Hmm, wait - how would that work? cf_clobber is used on function pointer
>> tables; any function indirectly callable prior to patching still needs
>> marking with cf_check, for build-time analysis to not throw errors (with
>> the specially patched gcc that Andrew prepared with a patch of H.J.'s).
> 
> Yeah, we would need something there?
> 
> Maybe disable such detection around alternative_{,v}call() usages if
> possible?
> 
> I assume the build-time detection is done based on call sites?

I think the build-time detection is based on places where addresses of
functions are taken. Call sites are close to impossible to re-associate
with the possible set of functions being called. If at all, that would
require the compiler to have a view of the entire image. Whereas the
warnings are issued as individual objects are being built.

Jan

>  We
> would need to figure out whether the detection can be disabled for
> chunks of code.
> 
> Thanks, Roger.


