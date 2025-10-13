Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BE9BD1B2D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 08:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141706.1475868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CD4-00006B-Lc; Mon, 13 Oct 2025 06:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141706.1475868; Mon, 13 Oct 2025 06:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8CD4-0008VZ-Ia; Mon, 13 Oct 2025 06:39:06 +0000
Received: by outflank-mailman (input) for mailman id 1141706;
 Mon, 13 Oct 2025 06:39:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8CD2-0008VT-TR
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 06:39:04 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cc501fa-a7ff-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 08:38:59 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so39126055e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 12 Oct 2025 23:38:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5d0006sm16716231f8f.34.2025.10.12.23.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Oct 2025 23:38:58 -0700 (PDT)
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
X-Inumbo-ID: 4cc501fa-a7ff-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760337539; x=1760942339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jd8+QyBTWjBwaHmrtZxdx4BkaQvMhuH7x7IlLdKsqtg=;
        b=PP0Etkke3XWS2V0FyQjx9hARaa2fUDOTR4qX9zKHpTU+E3e5dmCeY4YVdHgg7RS6WB
         OLwKlf8omQ5fZXm+jSSM5GDyWWXix46TISITbgmeEL8f+2TxBypjvrydqYteLAB7ThIG
         7K5ko1jIFMvWTiRFsu1VeawPiZVYlg4cFJNxWmVz517JR3Qf1rKlB9gHvt7z8wszeoR3
         wyxngsIG6kpyiGW/WOmbjAnTJI+bIJ9juCYID+o6AF97hXlzLjgAPOBH0+fdLjCn1RPV
         Z7cMJjC88uFB4QfBGwatua6mr5S6WXUxM5YIf1VJ1ekCadNVcFjNFmgkCdRDOcql93Mo
         uc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760337539; x=1760942339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd8+QyBTWjBwaHmrtZxdx4BkaQvMhuH7x7IlLdKsqtg=;
        b=cnQwomVugwaM32vMcGDMuzVpKR+kcHsLcsyTJMG+atmGc/y4dwFOOOpfAZAyS6c5D0
         UWqCGWeQ3aMwCWsa0KsdHvB+UkZC5oTfZKm09xk1V6McyD74RjmHl+vq0wx3IOGeoFIX
         b1MSELS9Df6PWKu4gNMflS2/APhUFLRlx9RkL31k9X3tMEP8s8gsfFo1OrI7giUT9ojR
         KvplnxjbdBxCJDfnRw7c3tOZOvq3mTAi5uwHzczK/K5mOYHNE9YCcYatPAt/YNdrFZPS
         lSHzk90jXOBn6qC/8hSIEPBYl225A/Oyl/JXkwOyC0zUkBKs7+YxBs6JKPWRd+zhbG9z
         q6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEYo06ahoRX0WtyDDLsHDryUbN/NGAUANZ8W1sNmllXy0J1LL2l+UC5vRvJdYpZDLa4B2EnjmL1G8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/RxVKRkc0rOaTpy6csd39VM8geE8b2P3iQIJaUf8vBPOKqRBN
	8x4VPk/rEEimRcFvd0MIwaE604gGLDg3fdtuWPj4U2aR3Mmxu+tVQf4ARoxO71hvNA==
X-Gm-Gg: ASbGncssHpQHvxEICMFN1XEu097YQtLKwkh/4cDlQMLptIgpYN0GToW6Os9gihgIhrb
	69Ic9o+iGa1KHh0A+DmCPqIQIlCpkQ2fMKsaLnKWdBbc76t84/kbuA0Hyap//N2a4DyxWpJQGDR
	b0m+rmMSRZ+941BM9NjkZTOSlvspphp8Ougif44DbsshwpxhA3HecvtwBRO6exOP5WGyb1/5Wpo
	98Q5If22j6TindNmxkrrwocv7R89DPpKR3P10b14sKUJGgsTB81uLmuH3iTJtpMC8pAXoY6SFF3
	Dh/bqaZKimD3izWLYBR/CN1aslD8HO0YvXuxZGCKaM8O7qiO/g/XttfPZAVNH6rtKVVdC8grqgT
	l8t0zbD1SLBwOT8yQl36hGK7X2w7vyGVJD6c+AA88qrZmN4pblr/ZQg52zMxw0xr4xxIJ7Ki90v
	iy0nLXoUORzEeDuV769kwCu86AT1rvYLImcNNqrCd1m/DfUmc=
X-Google-Smtp-Source: AGHT+IH5UcS5iKaaJ9CT2aDcDaXnunbohTGVuHI+KliL42QkWFolOhEWLZKKHXR+h6YUdVmAeuOQOA==
X-Received: by 2002:a05:600c:3d87:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-46fa9a9ede8mr134667155e9.12.1760337538888;
        Sun, 12 Oct 2025 23:38:58 -0700 (PDT)
Message-ID: <ac8842df-5c31-4257-a75e-ad06defa1387@suse.com>
Date: Mon, 13 Oct 2025 08:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: guard synthetic feature and bug enumerators
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8ecbf8b7-91fe-4f9e-9542-7ec22b6a47bb@suse.com>
 <48dcc0e0-2772-49b9-9383-5bf69f922053@suse.com>
 <1439ec29-4319-43d0-b4ff-0eb5bfe9405b@amd.com>
 <c9d04edf-4801-46c7-ae6d-8479ef985972@suse.com>
 <057c91eb-c6c3-4e00-bf2f-6611181ebfd7@amd.com>
 <b241871b-0b86-497b-afb5-86a0aa9813ce@suse.com>
 <6a546de3-0e1d-4de2-b25c-acab646bc270@amd.com>
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
In-Reply-To: <6a546de3-0e1d-4de2-b25c-acab646bc270@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2025 02:30, Jason Andryuk wrote:
> On 2025-10-08 01:56, Jan Beulich wrote:
>> On 07.10.2025 21:38, Jason Andryuk wrote:
>>> On 2025-10-07 08:22, Jan Beulich wrote:
>>>> On 30.09.2025 01:36, Jason Andryuk wrote:
>>>>> On 2025-09-25 06:48, Jan Beulich wrote:
>>>>>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>>>>>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>>>>>> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>>>>>>     
>>>>>>         /* (ab)use alternative_input() to specify clobbers. */
>>>>>>         alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
>>>>>> -                      : "rax", "rcx");
>>>>>> +                      "i" (0) : "rax", "rcx");
>>>>>
>>>>> "i" (0) is to work around the trailing comma in alternative_input() and
>>>>> does nothing?
>>>>
>>>> Yes. If more such "uses" appeared, we may want to introduce some kind of
>>>> abstraction.
>>>
>>> Thanks for confirming.
>>>
>>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Thanks.
>>
>>> Though I also wondered if just #define X86_BUG_MAX/X86_SYNTH_MAX
>>> combined with a BUILD_BUG_ON might be good enough.  Your approach avoids
>>> the extra define but is more complicated.  Anyway, just a thought.
>>
>> How would that end up simplifying things? IOW what would the BUILD_BUG_ON()
>> look like that you're thinking about? After all X86_{SYNTH,BUG}_MAX aren't
>> meaningfully different from X86_NR_{SYNTH,BUG}.
> 
> Originally, I was thinking something like
>   XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
> +#define X86_SYNTH_MAX 31 /* Bump when adding flags */

I don't really like this. Especially as presented is creates an ambiguity:
Would one need to increase the value upon any flag addition, or only upon
adding a new flag with a value divisible by 32. (From the patch fragment
you appended it's clear the latter is meant, but that's not clear here,
and when one learns to routinely ignore the comment, there's a risk of also
ignoring it when it shouldn't be ignored. Whereas if the bump was required
every time a new flag was added, I would dislike the unnecessary churn. In
the end - yes, there's a reason why I did things the way done, even if
there are other aspects to it which are (for the patch itself, but imo not
once it would have gone in) not overly nice.

Jan

