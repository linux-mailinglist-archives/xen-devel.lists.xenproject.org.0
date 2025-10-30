Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D9C20F73
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 16:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153829.1484095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUh7-0003vy-LW; Thu, 30 Oct 2025 15:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153829.1484095; Thu, 30 Oct 2025 15:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEUh7-0003tr-IM; Thu, 30 Oct 2025 15:36:09 +0000
Received: by outflank-mailman (input) for mailman id 1153829;
 Thu, 30 Oct 2025 15:36:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEUh6-0003tl-Ax
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 15:36:08 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 264cc6ce-b5a6-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 16:36:06 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so809680f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 08:36:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728999a4bsm43679985e9.2.2025.10.30.08.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 08:36:05 -0700 (PDT)
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
X-Inumbo-ID: 264cc6ce-b5a6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761838565; x=1762443365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8jx/+qhGjGKWiPV+geDAqdLZpuKDoM0Df0ubRzuT4Ls=;
        b=IIEC0lg57koG7AjsqakJ/8TrKnKjr9/Ftw1Wcfrtm9HGoKSiW9HqlWBN56sPQesEaY
         BOr7DxmgcKt4QhJbnbm6wLCS5Ulg3w0IOCSI8Q4eNihgApHeFIpVwYdgc19JUnzPnlCP
         FxZ9WHZFWRYsCwikCXWu2cMutk3wRR3UJSAX712SZfL9dVAizpSQVQSdy5XfouDtH6CJ
         l0Ggi2iMv/gjIC0G73lx92Z96RGcdWWNiUwDlkTfrF/taFnzfnLMz72poryCgJqxQfGC
         i7gnH3ioanHfkEpirtPNwRVC4Evgv6No2cK8+jdWGEBwR+oCuYTp4o45c3xJjTjkDvM0
         lpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838565; x=1762443365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jx/+qhGjGKWiPV+geDAqdLZpuKDoM0Df0ubRzuT4Ls=;
        b=DloHQ/SGkf5Rp+stcDjjV/c77yo86mR8tiIo1WrX3dfQvruz4FWThE+AtG8A3VKct4
         RuZrOI7fjBMr3sFLseMtCtaHVMH0hwbl8sMf51Pb/35D2hBKDnW5HT/NdTuQDzDgQHce
         6AvfloGdZCayPWJx1vaG230MMwiIQWGR4sWCWWdh10kp+KVMwnKLyh97IFkXwf7+J3Iq
         xmvtiTKsVQkqiRQoMQcE/TBYwkvjDSveQSmxnmT44XBLXpV0CV1NSiE4KpndJS/mniV5
         0PQwY4R+AoquqvJmLc6ci3DqqCujdCinS+3LaD5Y5F19zIFqu8ZtVTHPBYNicxepKgi3
         3HHg==
X-Gm-Message-State: AOJu0YwFIDCNytTx+W2UsQL0yQbxqNRGHIpdfXNYteKszZatJvrMF5RN
	SadgLo4ym7wo0RSn2lg2/moYFYYlhzF8uAG/DTy3CjPHvvMYCRyYDJDRBFjeRWBIfA==
X-Gm-Gg: ASbGncv1H8M3fqfAsqchsANdEc28PTyJp9kjP7lcrfP5F9x69F+6XNxUNtNfb1mUcQh
	2lBa4TYjpRtqo3eUgarJ1gjB4y/3v8w2vwfuLZ45Tg9oMnCH4C8vcasvFJkPD8EAcT+rG8ybHV1
	4dJwMyECbBhvwVtQ2H7srxMfdDUowGkdcRBaMHFKEblZ7GA7UYItFnvf9a3wy3cqQGwnyw7xeds
	CYojEd4E/UwVcK5F1/YyxlFisWUwvnCZM4TU6xIKLBhQYdjLQzenIv4GV4YuL2azNnX2/CIJ42y
	fkbMsYumFtcsX6pas5T+UuAwD5wIcSnSXhkc5YxizJQutMXOpBNOlcgLDakPqACfT5z/cxt3Iaa
	KskYkT7+fpeIqwHzomKvdJlv31HpssVNfWPPJk1YlCjrbgsAsxxctFVqo8H/Nlumy3ZWPBwXAC0
	SllNKbra8xUNQBHFqBakFHfcHjvK0fXI2667qvgpRRdaFVF50VabTYhKll/xHz
X-Google-Smtp-Source: AGHT+IHer9vtSzX2YIDggxerdgmi93NL1oZQqlNBwz34AdCpZq4pCOPcaqnh+UNSUjODkHb1WmZCsA==
X-Received: by 2002:a05:6000:40c9:b0:427:665:e37f with SMTP id ffacd0b85a97d-429bd68328cmr15990f8f.4.1761838565423;
        Thu, 30 Oct 2025 08:36:05 -0700 (PDT)
Message-ID: <0a03cfe0-680e-444c-a1d2-85b3a0f6e90d@suse.com>
Date: Thu, 30 Oct 2025 16:36:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64
 maintainer
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, shawn <shawn@anastas.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com>
 <alpine.DEB.2.22.394.2510291238140.495094@ubuntu-linux-20-04-desktop>
 <35b2e61b-d1c1-47c0-90e2-7efa1f45243f@suse.com>
 <1788041210.6163.1761836977190.JavaMail.zimbra@raptorengineeringinc.com>
 <8b4b5561-af7f-4917-aea1-4ed65a0f3023@suse.com>
 <927229739.6325.1761838270637.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <927229739.6325.1761838270637.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2025 16:31, Timothy Pearson wrote:
> 
> 
> ----- Original Message -----
>> From: "Jan Beulich" <jbeulich@suse.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "shawn" <shawn@anastas.io>, "Andrew Cooper"
>> <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony
>> PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Roger Pau Monné" <roger.pau@citrix.com>
>> Sent: Thursday, October 30, 2025 10:28:57 AM
>> Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64 maintainer
> 
>> On 30.10.2025 16:09, Timothy Pearson wrote:
>>> ----- Original Message -----
>>>> From: "Jan Beulich" <jbeulich@suse.com>
>>>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>>>
>>>> On 29.10.2025 20:38, Stefano Stabellini wrote:
>>>>> On Wed, 29 Oct 2025, Timothy Pearson wrote:
>>>>>> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
>>>>>> reviewer.
>>>>>>
>>>>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>>>>> ---
>>>>>>  MAINTAINERS | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index ecd3f40df8..c8764a8c5f 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
>>>>>>  F:	xen/include/acpi/cpufreq/
>>>>>>  
>>>>>>  PPC64
>>>>>> -M:	Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>>> +M:	Timothy Pearson <tpearson@raptorengineering.com>
>>>>>>  F:	xen/arch/ppc/
>>>>>
>>>>> The "R" letter is used for reviewers. The change can be done while
>>>>> committing.
>>>>
>>>> And with that change:
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> Just to mention: I can't see what you used as basis to compose the Cc list.
>>>> George's
>>>> email address has been out of use for quite a while, and he isn't with the
>>>> project
>>>> anymore. Wei had turned to other activities yet longer ago. And with Shawn
>>>> having
>>>> left Raptor (as you indicated), I expect his email address there would now also
>>>> bounce. I have, therefore, heavily edited the Cc list of this reply.
>>>
>>> I had pulled the CC list from the "Rest" in the MAINTAINERS file in the root of
>>> the GIT tree.  Should I have been looking elsewhere?
>>
>> That's the right place, but did you perhaps look at a (very) stale version?
> 
> Not that I know of...
> 
> commit 9db10d89c41e0272066a8547ec5ee2a642663baa
> Author: Jason Andryuk <jason.andryuk@amd.com>
> Date:   Mon Oct 13 10:41:01 2025 +0200
> 
>     MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
> 
>     Split out AMD SVM and AMD IOMMU, and add myself as a reviewer.  Jan,
>     Andrew and Roger are set as maintainers as they were for the X86 entry.
> 
>     Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>     Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> commit ac58e34a0960bcc71583edfc6b4d6baa5e81c7d0
> Author: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Date:   Thu Sep 25 09:19:21 2025 +0200
> 
>     MAINTAINERS: add myself as vPCI reviewer
> 
>     I'd like to take a more active role in reviewing vPCI bits.
> 
>     Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>     Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Ends with:
> 
> 
> THE REST
> M:      Andrew Cooper <andrew.cooper3@citrix.com>
> M:      Anthony PERARD <anthony.perard@vates.tech>
> M:      Michal Orzel <michal.orzel@amd.com>
> M:      Jan Beulich <jbeulich@suse.com>
> M:      Julien Grall <julien@xen.org>
> M:      Roger Pau Monné <roger.pau@citrix.com>
> M:      Stefano Stabellini <sstabellini@kernel.org>
> L:      xen-devel@lists.xenproject.org
> S:      Supported
> F:      *
> F:      */
> V:      xen-maintainers-1

And where did George and Wei come from then, while several of the people above
were missing?

Jan

