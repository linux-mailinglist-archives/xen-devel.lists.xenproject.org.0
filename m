Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94586C00717
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 12:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149003.1480798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsTg-0002tG-Gg; Thu, 23 Oct 2025 10:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149003.1480798; Thu, 23 Oct 2025 10:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBsTg-0002rD-E4; Thu, 23 Oct 2025 10:23:28 +0000
Received: by outflank-mailman (input) for mailman id 1149003;
 Thu, 23 Oct 2025 10:23:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBsTf-0002r7-Oy
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 10:23:27 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bb68348-affa-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 12:23:19 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so523209f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 03:23:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf152absm34838685e9.9.2025.10.23.03.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 03:23:18 -0700 (PDT)
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
X-Inumbo-ID: 4bb68348-affa-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761214999; x=1761819799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9pckMg9OLfO9T6ehFt7aH0wM/G15AH9tNKcWADy/tE=;
        b=cvtZyTL7A2AxWAMBrOcWWww45nOyss/NmylSfOUxshIogzvIIK/SD1VK30BmlY31Zy
         KG3S5ADlfEU50FPqlfUFrT2aXHIL7DOlAGTcHgmZnD4ckvnrWcuSLk2bGPtaSUqRi8E+
         w+kUR2Z0wpb0A7z+jIhjlqtTqfsgwTsXvCQXIgFg8pVLIHKR6AdHVifqbR+ZdVdfFRac
         F9S/lYCf/QqwqwF8vs1wTdrk8vLX8zoo1v+fYZI2o9NmlJLmS/kpTYdTu7X5Zdw88Ki8
         E6jtKhumTj339vGL0m2SQ3a3wYoV8tbDFllkvdN1asqrCHjl+mUdF81IzqSd86LrE1AV
         SuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214999; x=1761819799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9pckMg9OLfO9T6ehFt7aH0wM/G15AH9tNKcWADy/tE=;
        b=tvSA35yIUZQkZhjnWuv/cidjt8YFdc7OE7GsRTwLa0oUbbMkZy6ohgAOEAjWCLpQ6V
         cbFlWC3XRszDMP2GGPqxDAfU2dzrEHnxEBGF0Am4D3e2JB2iPzEBuXQqnoE6kOQn5ic0
         Z+EiFP35s7lSvTMDo/UJS6kYNLkVa3Tx7OyIKjeXRj4zYy1wgHU9DtkQlC6A3p+mMNRD
         VQaoNqALz32FuF4ZQgaoz1+fR6qjHNAj+sJAvHStcWlyeMJSjXu+XuA4+GY5TDwx62uM
         Zc3fyR4iMn1CoZ9cRtmdvQM2q0ezEGmCArLlC5OlSrue1kAwnnZ3jNChjovmiBsPsLe9
         Nc8w==
X-Forwarded-Encrypted: i=1; AJvYcCVCz+kX8H5siQMPWf4+5SStSAoppJv+/3ZflMnz15/8ByQnAtMlpMdouud2N9h3zIU8dyIxZE6oJqU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3bfqnWlf/Cj7v40WTQpNtFHijuKZKvE5Xyhzu9ct0GgwhR0IC
	fuM6hoHktEuK6F2envvFJm0qzJQOBtyghDOhYRRrGI5hRZXmyRhgMctWiAoN+vN6Qg==
X-Gm-Gg: ASbGncsUDyXlLiE3xcFpxg0QAo5umP2bNAh6BIaw+LyNOPz5uBfCD2Ub6X2zM0CQEn6
	Gl/9/AdZhNXib2A/P9s1u6BO+XCRe17YsBtGq7Ai11lWD6Eiv8tVEQP0XTd924vrCB33uVhn5gd
	w4tybG4pOTXK4TWQQwvyxqzYBR6UAQNPTPbWxqY+wGHk7j88j86r/fPeIaQ1T3OGooHYROpQs9O
	u9YaqJWhfk9WKLiP3bKR2PR2A/9pwhMb53L8ongSPIP2ujjT2b6p5EfI7CNE3MaKdpDphM12ne4
	MGghSS9vTuP9+ZTI7wY9AL1UrWP2J2WkRrcRFPHFwjANpThLiuGECZemSFnHK6SJRbz+7UuGfcW
	3D+upeff3OWUswofBpTux7T4p5XtAZZgBb4qseDNo29ILRFdqBS5r60cboD2MIj8UVIRULy7k1m
	AK1Ibt0VIOCeDvtrO4AUGGA10XdKmhJV8x2DnMQZ/XCi9nM4snlHI3GK0RVJNDHTo7zxyn4QI=
X-Google-Smtp-Source: AGHT+IGmIUvEx5qWqSjDPImlrC3N7HxCLg3i1skhnlT7Rjvr9RK7k1MjLs4I7CfOyHPXmZ0FLAp6bg==
X-Received: by 2002:a05:6000:1884:b0:3e9:ad34:2b2e with SMTP id ffacd0b85a97d-42704dc92bfmr16958373f8f.46.1761214999076;
        Thu, 23 Oct 2025 03:23:19 -0700 (PDT)
Message-ID: <64411f5b-a826-48b6-9122-bf80ac377c7a@suse.com>
Date: Thu, 23 Oct 2025 12:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
 <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
 <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
 <0767a5c4-6a2c-4ed0-92d3-f9f89313ad85@epam.com>
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
In-Reply-To: <0767a5c4-6a2c-4ed0-92d3-f9f89313ad85@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 12:00, Dmytro Prokopchuk1 wrote:
> On 10/17/25 10:09, Nicola Vetrini wrote:
>> On 2025-10-15 08:20, Jan Beulich wrote:
>>> On 14.10.2025 18:16, Dmytro Prokopchuk1 wrote:
>>>> --- a/xen/common/version.c
>>>> +++ b/xen/common/version.c
>>>> @@ -217,6 +217,20 @@ void __init xen_build_init(void)
>>>>  #endif /* CONFIG_X86 */
>>>>  }
>>>>  #endif /* BUILD_ID */
>>>> +
>>>> +#if defined(__i386__) || defined(__x86_64__) || defined(__arm__) || 
>>>> defined(__aarch64__)
>>>
>>> Why __i386__? Also (nit): Line too long.
> 
> Well, I copied this line from Xen codebase,
> but yeah, __i386__ is outdated now.
> I'll remove it.
> 
>>>
>>> And why this restriction without any comment here or ...
>>>
>>>> +static void __init __maybe_unused build_assertions(void)
>>>> +{
>>>> +    /*
>>>> +     * To confirm conversion compatibility between unsigned long, 
>>>> (void *)
>>>> +     * and function pointers for X86 and ARM architectures only.
>>>
>>> ... explanation here? More generally - how would people know to update
>>> the condition if another port was to be certified?
>>>
>>> Finally, with the v3 addition here, is Nicola's R-b really still 
>>> applicable?
>>>
>>
>> I agree with the point you make about i386 (e.g., C-language- 
>> toolchain.rst may be mentioned to provide some context about the 
>> preprocessor guard); that said, my R-by can be retained
>>
>>> Jan
>>>
>>>> +     */
>>>> +
>>>> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>>> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>>>> +}
>>>> +#endif
>>>> +
>>>>  /*
>>>>   * Local variables:
>>>>   * mode: C
>>
> 
> And probably v4 can have the following wording:
> 
> /*
>   * This assertion checks compatibility between 'unsigned long', 'void *',
>   * and function pointers. This is true for X86 (x86_64) and ARM (arm, 
> aarch64)
>   * architectures, which is why the check is restricted to these.
>   *
>   * For more context on architecture-specific preprocessor guards, see
>   * docs/misc/C-language-toolchain.rst.
>   *
>   * If Xen is ported to a new architecture, verify that this 
> compatibility holds
>   * before adding its macro to the condition below. If the compatibility 
> does not
>   * hold, this assertion may need to be revised or removed for that 
> architecture.
>   */

Except that this doesn't address my concern. Imo the checks want to be there
unconditionally, and ports where they're _not_ applicable would then need
excluding (with suitable commentary and/or alternative checks).

Jan

