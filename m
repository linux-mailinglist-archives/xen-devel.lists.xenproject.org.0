Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF989950B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701098.1095210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rscnU-0007hT-7P; Fri, 05 Apr 2024 06:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701098.1095210; Fri, 05 Apr 2024 06:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rscnU-0007fP-4e; Fri, 05 Apr 2024 06:11:32 +0000
Received: by outflank-mailman (input) for mailman id 701098;
 Fri, 05 Apr 2024 06:11:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rscnT-0007f6-6G
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:11:31 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5761627b-f313-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 08:11:29 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4162e19b663so2248085e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 23:11:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b0041562a58b75sm1661483wmq.13.2024.04.04.23.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 23:11:28 -0700 (PDT)
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
X-Inumbo-ID: 5761627b-f313-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712297489; x=1712902289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Bl7ViLyOyKQv5bJk7PktfW2fra0xVZpISax68+IzpQ=;
        b=g+RdgF/Y4PnqIcIFn1qwDtwNHHFZoxLjGH92hFsPOc13mU5J9sXRfC8qh1u9AlsXr6
         jiP4Zj88Y+xer6TFCEcohzUP57ua4O+I/66mk8jJ0AInc+hltoaPX1Ulu2H5vRanmHRa
         IH7OA+Y5kssregTPiL0IX6+ptLrO/+gWlLbdnE7Ips0jZ/r8t0cDmKnNnY8KBdpw6QJP
         UD3e/iLgEkNaVukJ5Iw5/0QGfaxiC6yShLOyvnpxfQ97xabA5BufiTuCsXE+QhwKom7j
         PyxkKy9ZBFKGuqdF7RyI8/im2d+vxEuBLzjYJT9Olrl2RDPaIMw6erpAiUga58WZOimR
         6UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712297489; x=1712902289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Bl7ViLyOyKQv5bJk7PktfW2fra0xVZpISax68+IzpQ=;
        b=IPEpyPVq7VL0g2dYGEDXUZzu2ckPNAvhNB15t0LvQcowuLGf8jKeUhp/2KetcmIXyH
         GYWkTaerNastlJQLoThYNRohV4YmAtd+z+7FRfQEA9ShPatZoKSTipc2htJJQmLLKylP
         YcL7WlxJBtpOcSjMbPReE5e5Q9e+8+BdXkw1ZdNwGYGlcBKANAkHd/qbBjbb0C2IudSA
         mLh/PDkuI648wmUofbExvB954cwhR7nWNPj5I6F3g/1NInRsyGjuCV1C/3g/nw8shOYX
         quDfz61jn63elg9iMbjPBHIiSyQsWhJ3ufjeL8KZzbbR7jmA/c3+K7yRHY0C/r8YTs7Y
         +j0A==
X-Forwarded-Encrypted: i=1; AJvYcCVqfJ3G3zXFV2PP9kJJqNKIRVYvz0GCeihKczP2lQcZ6x1XoPOROGzKAIVtySa0yA/ZHR8uHWwcIyGUU8OuBvTNB6AorwNwJ++1RnbIS8w=
X-Gm-Message-State: AOJu0YydWwqsVVni/O285eV9FFBkLv9SoDKyOOLZCEJyBa9ynH7VFNFh
	A1Fuqj139/biCGgq++ji2eKhnl5LnsMkwM5NvHY10TvxhI6vE/tlx7zVgAR0iA==
X-Google-Smtp-Source: AGHT+IEavEQCjLB0xEzZzS7kRNFokF8SgOTo9MEYBjr3kaxYqO5bLqiK4s9fOjdNNOB4TUhlv5SN4A==
X-Received: by 2002:a05:600c:35c3:b0:415:540e:760d with SMTP id r3-20020a05600c35c300b00415540e760dmr464227wmq.5.1712297488758;
        Thu, 04 Apr 2024 23:11:28 -0700 (PDT)
Message-ID: <edd36d22-a2da-4e38-a586-14c742da18f7@suse.com>
Date: Fri, 5 Apr 2024 08:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
 <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
 <4ba7c962-a635-4a7d-8e03-093361cc6353@suse.com>
 <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
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
In-Reply-To: <c92ef420468fdf45a878efda37c582c0cab2332f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.04.2024 18:24, Oleksii wrote:
> On Thu, 2024-04-04 at 18:12 +0200, Jan Beulich wrote:
>> On 04.04.2024 17:45, Oleksii wrote:
>>> On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
>>>> On 03.04.2024 12:19, Oleksii Kurochko wrote:
>>>>> --- a/xen/include/xen/bitops.h
>>>>> +++ b/xen/include/xen/bitops.h
>>>>> @@ -65,10 +65,164 @@ static inline int generic_flsl(unsigned
>>>>> long
>>>>> x)
>>>>>   * scope
>>>>>   */
>>>>>  
>>>>> +#define BITOP_BITS_PER_WORD 32
>>>>> +/* typedef uint32_t bitop_uint_t; */
>>>>> +#define bitop_uint_t uint32_t
>>>>
>>>> So no arch overrides permitted anymore at all?
>>> Not really, I agree that it is ugly, but I expected that arch will
>>> use
>>> undef to override.
>>
>> Which would be fine in principle, just that Misra wants us to avoid
>> #undef-s
>> (iirc).
> Could you please give me a recommendation how to do that better?
> 
> The reason why I put this defintions before inclusion of asm/bitops.h
> as RISC-V specific code uses these definitions inside it, so they
> should be defined before asm/bitops.h; other option is to define these
> definitions inside asm/bitops.h for each architecture.

Earlier on you had it that other way already (in a different header,
but the principle is the same): Move the generic definitions immediately
past inclusion of asm/bitops.h and frame them with #ifndef.

Jan

