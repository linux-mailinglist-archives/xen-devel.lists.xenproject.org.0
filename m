Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E0C01D84
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 16:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149174.1480878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwVK-0004Qr-Jb; Thu, 23 Oct 2025 14:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149174.1480878; Thu, 23 Oct 2025 14:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwVK-0004OM-Gv; Thu, 23 Oct 2025 14:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1149174;
 Thu, 23 Oct 2025 14:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBwVI-0004OG-M2
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 14:41:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58b4d566-b01e-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 16:41:23 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso12778065e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 07:41:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57b7sm4316628f8f.16.2025.10.23.07.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:41:22 -0700 (PDT)
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
X-Inumbo-ID: 58b4d566-b01e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761230483; x=1761835283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8fgE/KC4SJltnCyi7haaayIMb3G7u7CuGUQ2LqtW354=;
        b=N6lslltTVDsbEc9eydW29kmjsqehz1nzUnx6EHrPN5E2qQko1hn4tlOqBDcvsVE27O
         5wFYGOtzGBCQ8J2u9rkwseHHwOItcpNZwP3qJo3DKWCz9ITfVJ3LG6zB99qqtq/y12rE
         k1aSWfPF1ZQEQ6hd8IoOau22WDPBXfNJtFXnAYHJckpccNwLhCxYO39dezu1UnkicJkp
         iFjbri7w4tTFGZ0HfvyWG6ceyE06IURPykJZC0fmbe429/JK9OViWraWsbO5uo0frYqv
         TQ18y3h2VQrdE7hVob86s5z+dSWPdYR1XpH69zONA/oDZRfJyq6RAe8H0WtqIfx0O4bn
         bsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230483; x=1761835283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fgE/KC4SJltnCyi7haaayIMb3G7u7CuGUQ2LqtW354=;
        b=sKxLk/xsFdhV9qw7MgoMKHMmSFd3YGS94Lohtb6Py9CgPjuyN3KljFcuBhSIhYfIrR
         8DLj5iBrm1pfA/OimK/3pGX5IZ9dAEHA72AttYUHmn2lP40OKMPptI9TFdX9svfmEnTp
         HbluIL8I7XEDgl1J93G5PZQFx/rQcOqjGYiBpcaUaLMVAy/CO1Mg9KFRhD7fLy8EddBU
         rhR3YxBhF4MqJ/2BHETf5t9/N0BIi7W6V+R1rAqPeRQTxwipu/X6X6jMfPPZdqU6+E9e
         MlZQIPBOtw51pyioLCV+ahzJBxkO2b+GITvz14c2sf8xMhvji8kD8WrgCcRPLj96FGV3
         mjXA==
X-Forwarded-Encrypted: i=1; AJvYcCWU608vizE098Vv0OFJueqxgBralzSy212J4r2G0A2ukQ+3dvOGVkcaTnr60vk7d8V+6Na961t8ASQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzD0t0W3p8zNeHtg4K+grmP6GERQQ1OXDLWUx4Eo0rESjjVWqst
	GImMSSS13Be1IqR9nucXXUnvODxLWmzsi0V7PSZLmly/5WaPr6uOz7mpWxHKmq1xqA==
X-Gm-Gg: ASbGncstfEFKkXUdCFRSwLgoU2ADxJY2vEZsUhwqc1IDvhxiXojw6SAJU4fqs7DESv2
	kWL7WeD7HZ+4YLgc2z8sZXRhD9L4yUy1DkBXcw+x+PBnYQYy9JCLsAt4hb36F/qz7yItdqMuKkf
	uZlwAaeWIRW7E+BetdwPnPEXXAuvxol5bNWvpKSyEpYh/Edvk9haZFI9PJiZ6z792KRM6b9VSg8
	dZucS9WPV0y+Nvow0WEk5I5EaFwG/8Q/j1NbnodLDOP3F9JoUrKmJTfqrZ6B4TQvtQH1oG8HM18
	rU+4BJh9sGuIg7xfPVsNMujBddQ/6ivagEPdRhQEtBId98nFSDc9np7uMv8Vnh/r7AqdzS8yAkE
	7HHO/OSIxLD6dTIiCjz3HQpmc4QuiiZSsqxfJeQOb30t8ZRWPEridw8vdvGD4sgQdOPo4Tx4elF
	CpKZVNDRQWP/+jLy30qXfRWbAD2m1OqYCevHVoSrnoifcRzXtKyFSyfmd/szooDEnKP25Hn9k=
X-Google-Smtp-Source: AGHT+IExrqAjVHKujobi7mzXkEG7pQsvxwQR8KPboOwbDCqf1/uyAT9F2Aen+KP8O92hY6mPhh+SVg==
X-Received: by 2002:a05:600c:4e86:b0:471:13fc:4ad3 with SMTP id 5b1f17b1804b1-4711787847bmr218143765e9.2.1761230482765;
        Thu, 23 Oct 2025 07:41:22 -0700 (PDT)
Message-ID: <5a6d1670-ce9e-4264-bbea-786df5cc5679@suse.com>
Date: Thu, 23 Oct 2025 16:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
 <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
 <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
 <0767a5c4-6a2c-4ed0-92d3-f9f89313ad85@epam.com>
 <64411f5b-a826-48b6-9122-bf80ac377c7a@suse.com>
 <9a09cbab-851c-46f1-8026-603a7cb9d79b@epam.com>
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
In-Reply-To: <9a09cbab-851c-46f1-8026-603a7cb9d79b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 15:57, Dmytro Prokopchuk1 wrote:
> 
> 
> On 10/23/25 13:23, Jan Beulich wrote:
>> On 23.10.2025 12:00, Dmytro Prokopchuk1 wrote:
>>> On 10/17/25 10:09, Nicola Vetrini wrote:
>>>> On 2025-10-15 08:20, Jan Beulich wrote:
>>>>> On 14.10.2025 18:16, Dmytro Prokopchuk1 wrote:
>>>>>> --- a/xen/common/version.c
>>>>>> +++ b/xen/common/version.c
>>>>>> @@ -217,6 +217,20 @@ void __init xen_build_init(void)
>>>>>>   #endif /* CONFIG_X86 */
>>>>>>   }
>>>>>>   #endif /* BUILD_ID */
>>>>>> +
>>>>>> +#if defined(__i386__) || defined(__x86_64__) || defined(__arm__) ||
>>>>>> defined(__aarch64__)
>>>>>
>>>>> Why __i386__? Also (nit): Line too long.
>>>
>>> Well, I copied this line from Xen codebase,
>>> but yeah, __i386__ is outdated now.
>>> I'll remove it.
>>>
>>>>>
>>>>> And why this restriction without any comment here or ...
>>>>>
>>>>>> +static void __init __maybe_unused build_assertions(void)
>>>>>> +{
>>>>>> +    /*
>>>>>> +     * To confirm conversion compatibility between unsigned long,
>>>>>> (void *)
>>>>>> +     * and function pointers for X86 and ARM architectures only.
>>>>>
>>>>> ... explanation here? More generally - how would people know to update
>>>>> the condition if another port was to be certified?
>>>>>
>>>>> Finally, with the v3 addition here, is Nicola's R-b really still
>>>>> applicable?
>>>>>
>>>>
>>>> I agree with the point you make about i386 (e.g., C-language-
>>>> toolchain.rst may be mentioned to provide some context about the
>>>> preprocessor guard); that said, my R-by can be retained
>>>>
>>>>> Jan
>>>>>
>>>>>> +     */
>>>>>> +
>>>>>> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>>>>> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>>>>>> +}
>>>>>> +#endif
>>>>>> +
>>>>>>   /*
>>>>>>    * Local variables:
>>>>>>    * mode: C
>>>>
>>>
>>> And probably v4 can have the following wording:
>>>
>>> /*
>>>    * This assertion checks compatibility between 'unsigned long', 'void *',
>>>    * and function pointers. This is true for X86 (x86_64) and ARM (arm,
>>> aarch64)
>>>    * architectures, which is why the check is restricted to these.
>>>    *
>>>    * For more context on architecture-specific preprocessor guards, see
>>>    * docs/misc/C-language-toolchain.rst.
>>>    *
>>>    * If Xen is ported to a new architecture, verify that this
>>> compatibility holds
>>>    * before adding its macro to the condition below. If the compatibility
>>> does not
>>>    * hold, this assertion may need to be revised or removed for that
>>> architecture.
>>>    */
>>
>> Except that this doesn't address my concern. Imo the checks want to be there
>> unconditionally, and ports where they're _not_ applicable would then need
>> excluding (with suitable commentary and/or alternative checks).
>>
>> Jan
> 
> Ok, below is the updated logic:
> 
> /*
>   * This assertion checks compatibility between 'unsigned long', 'void *',
>   * and function pointers. This is true for most supported architectures,
>   * including X86 (x86_64) and ARM (arm, aarch64).
>   *
>   * For more context on architecture-specific preprocessor guards, see
>   * docs/misc/C-language-toolchain.rst.
>   *
>   * If porting Xen to a new architecture where this compatibility does 
> not hold,
>   * exclude that architecture from these checks and provide suitable 
> commentary
>   * and/or alternative checks as appropriate.
>   */
> static void __init __maybe_unused build_assertions(void)
> {
>      /*
>       * Exclude architectures where function pointers are larger than 
> data pointers:
>       * - IA-64: uses 'fat' function pointers (code address + global 
> pointer)
>       */
> #if !defined(__ia64__)
>      BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>      BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
> #endif
> }

I would omit architectures we don't support, though. I gave IA-64 as an
example where things are more complicated (albeit iirc the checks would still
succeed there). However, I didn't expect any trace of it to be added to the
code base (again).

Jan

