Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4AACF1A1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006942.1386203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBSZ-000367-BG; Thu, 05 Jun 2025 14:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006942.1386203; Thu, 05 Jun 2025 14:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBSZ-00033e-6j; Thu, 05 Jun 2025 14:20:47 +0000
Received: by outflank-mailman (input) for mailman id 1006942;
 Thu, 05 Jun 2025 14:20:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNBSX-00032D-Jn
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:20:45 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44693dd8-4218-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:20:44 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so1737299a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:20:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c5c5casm10476813a12.25.2025.06.05.07.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:20:43 -0700 (PDT)
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
X-Inumbo-ID: 44693dd8-4218-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749133244; x=1749738044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kXvhzliBSn0/66s1rDoEisb24kfD7RiSMh+LlMkgfdE=;
        b=V9AW+oS0/glAMgEpos93JJNGwY4xft9jSweyG3CME+bt/8lBlsUk8amfoTGSaEC/Am
         XJETEsfGrjz1f9X+wM4F5uNZfJ/dX5gHb1EyQZeefDLXRi80HicOievXawRLaQkK2lTG
         5gm2g5u7B9/0wVBO+RqshIdxGFGQejAONhXFVas1B1zbPDuPxe0RGs/vQkfP5E5DxbAL
         q0BBBcPgmHER9mBTTGGJSvqhcqK9JthRFcIjrriV4kKvhEPXf58vSHMglyW7bIQLQ8Js
         r4vWqhUGzE7bAjCEvhyMdozenT/aGPwVFnpVLQCpjz+0mKd2xqmrNkN7e4JujUfVAM/0
         kUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133244; x=1749738044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXvhzliBSn0/66s1rDoEisb24kfD7RiSMh+LlMkgfdE=;
        b=X60rbe+ezLEA4ux7DQHzyPI3puP1Y6cOmgQzc0MfVZqSfhvvTKDeC3UIsl6lCALBiT
         zCSlLmIxGwCQKEUWQN7bNHPqvASbq70AalCtr5LuG9rK49+c7LFaUF3ooG1MiRHqfTQv
         gHjEDy/atHh4FXUkRJkquV+r1LVuja1pwxM2TQ+Dc04noAlUZdO0yov/iYFEpBmdIOgR
         dnKFF4eyK0lyT6iz0nmBk4TAwy5Juq7Yuc7oW2U+LRD7hlj0zccO8pU55p+LduCwPczj
         SwMu/Sw/zKh/sHR5WWg+wnxxKeKV26wj6yEaO+VxJZ+i/oG8zTACGaIg20WFJNCN/snr
         L+SA==
X-Forwarded-Encrypted: i=1; AJvYcCWYikS/jSBtqK2rM9QVdiTcOZgW71pGeb2ApID8jPlXSp776mBDVV1HR49Hrgr7YWcvYresOOVJai8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE9SM8C5yEeqqVaWLjEYa+IUFeBkeS66aGY8rnH0/MHK+hWUDV
	z/ApvnFFTGNyF9VqJL/uCZRfYFqiOn6inz3MIGIYFwDXpZnKVKectPlUAgW2XKHYAA==
X-Gm-Gg: ASbGncu52oRep54sTStuYivIPfFrlLDxBBgMYtl5JDkoXrN/KMqHzYoq8OkMQe6BQ94
	6skdsNKkMacoDBCcTJuTpzz2W/QHdChRQyV0Cxpo8XDedLWPYisvFgz7f+D+fX2L7IA5Meji1jE
	gr27i7vJ3iU6h8eH6fXkOA/BUlJAtw+40AyB9y41ZVNG8sQ3NG40xRLdKWtiVGWSl2A9QyGukMr
	CANtWzkaKp/veFl6lIxvj4qLnr920U6iHBIxPQziJ5duNjiZFnGj0L/roU5taZgZVcHiAP4brWi
	5sabXpeDEKk1ATc+P9nGJEwG2+9mMQW8cM+2VUGiZNQkzz5zyOj1q7Dpda+QsrL5GySYWUoRjo5
	jQJSg4PyTxlopgXx4YBOTwMqlgNPOUN2LZ7IL
X-Google-Smtp-Source: AGHT+IHasvsxzOMZ7SBhAmuLBoNTQYAbWqktdrp2r7ZdmEHeMxBQxM8Rn62aacGLZaEMdz0a9SE+Zw==
X-Received: by 2002:a05:6402:2351:b0:607:16b1:7489 with SMTP id 4fb4d7f45d1cf-60716b177dcmr4334550a12.20.1749133243785;
        Thu, 05 Jun 2025 07:20:43 -0700 (PDT)
Message-ID: <8768b970-6c62-4fc4-8ef5-b74f1aa650e6@suse.com>
Date: Thu, 5 Jun 2025 16:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] xen: Clean up asm-generic/device.h
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-7-agarciav@amd.com>
 <e69e572f-497d-4521-a28a-a554ac18c271@suse.com>
 <DAC42T9A7DMZ.3P5GWMI89RZ90@amd.com>
 <daa4bf8b-3082-47c0-abab-74a103c1b6b2@suse.com>
 <DAENVFUK1OBR.BKRNCOBGBQ9Q@amd.com>
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
In-Reply-To: <DAENVFUK1OBR.BKRNCOBGBQ9Q@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 16:15, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 4:24 PM CEST, Jan Beulich wrote:
>> On 02.06.2025 16:19, Alejandro Vallejo wrote:
>>> On Mon Jun 2, 2025 at 9:51 AM CEST, Jan Beulich wrote:
>>>> On 30.05.2025 14:02, Alejandro Vallejo wrote:
>>>>> --- a/xen/include/asm-generic/device.h
>>>>> +++ b/xen/include/asm-generic/device.h
>>>>> @@ -6,9 +6,7 @@
>>>>>  
>>>>>  enum device_type
>>>>>  {
>>>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>      DEV_DT,
>>>>> -#endif
>>>>
>>>> Why would this enumerator need exposing on a non-DT arch? In fact I would have
>>>> hoped for ...
>>>
>>> A non-DT arch would not include this. x86 doesn't.
>>
>> Both here and ...
>>
>>>>>      DEV_PCI
>>>>
>>>> ... this to be hidden for arch-es not supporting PCI.
>>>>
>>>> Similar concerns elsewhere in this change.
>>>
>>> This file is exclusively used by arches supporting DT to abstract away where
>>> the device came from. x86 does not use it at all, and while it wouldn't be
>>> impossible to compile-out DEV_PCI, it would needlessly pollute the codebase with
>>> no measurable gain, because the abstractions still need to stay.
>>
>> ... here: In "xen/include/asm-generic/device.h" there's nothing at all saying
>> that this file is a DT-only one. Instead there is something in there saying
>> that it's suitable to use in the entirely "generic" case.
>>
>> Jan
> 
> Try to use it from x86 and observe the build system catch fire. It could be made
> to not go on fire, but it implies heavy refactoring in x86 (particularly IOMMU
> code) for no good reason because there's no devices in a DTB to disambiguate.
> 
> How about adding this to the top of the header?
> 
> ```
>  /*
>   * This header helps DTB-based architectures abstract away where a particular
>   * device comes from; be it the DTB itself or enumerated on a PCI bus. 
>   */
> 
>   [snip]
> 
>  #ifndef CONFIG_HAS_DEVICE_TREE
>  #error "Header meant to be used exclusively by DTB-base architectures."
>  #endif
> ```

Might be fine, together with giving the file a name somewhat referring to DT.

Jan

