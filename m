Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC3A06FF2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 09:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867860.1279406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVntR-0004St-U9; Thu, 09 Jan 2025 08:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867860.1279406; Thu, 09 Jan 2025 08:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVntR-0004Q0-Qs; Thu, 09 Jan 2025 08:27:53 +0000
Received: by outflank-mailman (input) for mailman id 867860;
 Thu, 09 Jan 2025 08:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVntQ-0004Pu-NS
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 08:27:52 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d460930-ce63-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 09:27:50 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso7173895e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 00:27:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03f54sm12838605e9.21.2025.01.09.00.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 00:27:49 -0800 (PST)
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
X-Inumbo-ID: 9d460930-ce63-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736411270; x=1737016070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3nZGtdavISqmXEDZk3a2Nqq+lmQWsnkRigWGu/w1YH4=;
        b=A37zP+Xt3/PHd5jEdptHchp79ewFMPShUeRyzoQuWrTxeBVGnRWfLOXmLk2g5IfLAg
         Ff+BucbH2uM+LOvRpX+04s5nWoCQWM5spG3zTikMrBVE9degxTOpVQH+7c9rmt5S8huv
         4sj5Fgm1TDJbfaytdV5ijo+hIMkbsuGoX//6pnGfDX2aNCZNJtxZMCEKpNUlMG4dxK0k
         csToGhQT4ClKlk67yZr5bLGFwTBSizvxNXjXfFk+RPfaZYE2AKggiS/xOv77GgeYag/e
         2aLF8OnjbXUxhn0CYorBzDVQNSUD5gfb5kS9jp4zXTccOtjPHteJbAuWLMIFnLnX6llR
         VV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736411270; x=1737016070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nZGtdavISqmXEDZk3a2Nqq+lmQWsnkRigWGu/w1YH4=;
        b=Tb/EBYyZCuYMfWQDzB0nAmv1soVYw6Pa0LIZv3NkgEMTqS1YukY48h2iUZ4MqNUvRy
         LqkmnNBpblfU/KxMOyxFfgbj0szgvTq/vs2kpI5sD0oWtMSvcEpfIXJytCW3px1w6aEi
         ke+fED2NwMkSW3cz9avJAWf2zftDwz2Jhn5CInR5vx/jGnTsmLwdxAXp9qRXpPLg4Nxp
         JfQsWcm4TZT6a6EStCixK2Ebw1bGxvV5MZtS9R2l20k7w0vBSwv0kObp5LEoQccvy8S+
         R00kbNDQQLj1hB5Q6jeAokpLE8KVsKIVryBMiZhArCXfflTkH+IS5wEhXh0fttSacg9V
         uRzg==
X-Forwarded-Encrypted: i=1; AJvYcCWBbrJ80WJJ+QMYraLOlzZh2FUazgfsECx6BbueJyZfyFvT99CRPtWq09ozDZmrf3yYoFKw55pJVhc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI2MTudlMgm+agrrS1/hp2p3VT7nvDDaIo9Sb+rwf3C/KdyehI
	e1M9B35d6Dy9xqS/eENcM64IBnlAA7sH7bmUknhXz+ZRpUN64ChaByM1RgChtQ==
X-Gm-Gg: ASbGncswZ/Qx1J34tS7RLDQOLPsltuSked4pYyOscK0WsQP7KowBOTZzXIHLYWHA8dZ
	arBS49UK7z7zyTHpFtXTgjsnyLfTnj+HoDzIK7XsLXDLOiqtwER6qE0fGyKv8fjIwJN16JT9qtO
	F1iwXbQqLFkw4FOq1KDl1+ozm7BngJoDnjQhaeVrpbiZOpFcqHOxQ+zFh8ixXksDpBbWmC1xwgV
	skZAcn8R/Ewji/FvZO/oFrlXRfujxAuLoC2BeL+q/7CsxJTAmF4eTVETJBNrz3rOpKOVgfTyPrX
	bV8apfnraxd4JJ3CocWKQdEfm/h2IY04Ae7oUYpw1w==
X-Google-Smtp-Source: AGHT+IFWqyyjdxWZRaahpMlhdQyu1UtAOqpMnYoFKxQIsXY4AW0HzwHIJql+JJgLTXzF/rww0DWR4Q==
X-Received: by 2002:a5d:64ed:0:b0:38a:4b8a:e477 with SMTP id ffacd0b85a97d-38a87306a84mr5121968f8f.22.1736411270149;
        Thu, 09 Jan 2025 00:27:50 -0800 (PST)
Message-ID: <e936ebe8-f729-4878-843e-639755b2fefb@suse.com>
Date: Thu, 9 Jan 2025 09:27:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: Denis Mukhin <dmkhn@proton.me>
Cc: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@ford.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
 <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
 <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
 <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
 <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com>
 <Z34xhkNu5YLyEzut@macbook.local>
 <121ae72e-6229-40a4-8b9f-4f8b0764b712@suse.com>
 <Z344xgqtpNZIDxHD@macbook.local>
 <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me>
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
In-Reply-To: <m5iIn0DzBY1VE3oW8MMk5aJD5yovtFe2u7eorkGQVf0czY2gzIYl9k2aKmrdyh1AG6YAgyasVn86Js-vUQyudqjHY7bRYE1hXdCkdFVF0U8=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.01.2025 23:15, Denis Mukhin wrote:
> On Wednesday, January 8th, 2025 at 12:35 AM, Roger Pau Monné <roger.pau@citrix.com> wrote:
> 
>>
>>
>> On Wed, Jan 08, 2025 at 09:13:02AM +0100, Jan Beulich wrote:
>>
>>> On 08.01.2025 09:04, Roger Pau Monné wrote:
>>>
>>>> On Wed, Jan 08, 2025 at 08:28:32AM +0100, Jan Beulich wrote:
>>>>
>>>>> On 08.01.2025 00:40, Stefano Stabellini wrote:
>>>>>
>>>>>> On Tue, 7 Jan 2025, Jan Beulich wrote:
>>>>>>
>>>>>>> On 06.01.2025 19:48, Stefano Stabellini wrote:
>>>>>>>
>>>>>>>> On Mon, 6 Jan 2025, Jan Beulich wrote:
>>>>>>>>
>>>>>>>>> On 04.01.2025 05:15, Denis Mukhin wrote:
>>>>>>>>>
>>>>>>>>>> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich jbeulich@suse.com wrote:
>>>>>>>>>>
>>>>>>>>>>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>>>>>>>>>>
>>>>>>>>>>>> From: Denis Mukhin dmukhin@ford.com
>>>>>>>>>>>>
>>>>>>>>>>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
>>>>>>>>>>>>
>>>>>>>>>>>> The call is used in NS8250 emulator to identify the case when physical xen
>>>>>>>>>>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
>>>>>>>>>>>> messages from guest OS are formatted w/o '(XEN)' prefix.
>>>>>>>>>>>
>>>>>>>>>>> Such messages ought to be processed through guest_printk(), which wants a
>>>>>>>>>>> domain pointer, not a domid_t anyway. Plus isn't that going to be
>>>>>>>>>>> current->domain anyway at the callsite, eliminating the need for such a
>>>>>>>>>>>
>>>>>>>>>>> helper altogether?
>>>>>>>>>>
>>>>>>>>>> If the current domain is owning the physical console and printing, say, Linux
>>>>>>>>>> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
>>>>>>>>>> can be disabled from Xen command line.
>>>>>>>>>
>>>>>>>>> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
>>>>>>>>> which domain a message came from. As long as only Dom0 messages are left un-
>>>>>>>>> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
>>>>>>>>> messages (and have console "focus") I think the prefix needs to be there.
>>>>>>>>
>>>>>>>> It looks like we are aligned on the desired behavior,
>>>>>>>
>>>>>>> Hmm, no, I don't think we are. I don't ...
>>>>>>>
>>>>>>>> but for clarity,
>>>>>>>> see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
>>>>>>>> here:
>>>>>>>>
>>>>>>>> I think we should provide a consistent behavior across architectures.
>>>>>>>> The current behavior with vpl011 and dom0less on ARM is the following:
>>>>>>>>
>>>>>>>> - no prefix for Dom0 output
>>>>>>>> - DOM$NUM for DomUs when not in focus, otherwise no prefix
>>>>>>>
>>>>>>> ... view this model as a desirable one. It leaves room for ambiguity.
>>>>>>
>>>>>> Adding a few more people in CC for feedback.
>>>>>>
>>>>>> My priority is to keep the architectures aligned. It might be OK to
>>>>>> change output format, but then let's do it uniformly on ARM as well.
>>>>>>
>>>>>> Jan, please clarify what you think would be better than the above. Is it
>>>>>> the following? I don't think I understood your preference.
>>>>>>
>>>>>> - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix
>>>>>
>>>>> No, I mean like we have it with guest_printk() today. (XEN) for Xen's
>>>>> own messages, (d<N>) for ordinary domains' ones, and no prefix
>>>>> exclusively for the hardware/control domain. What is best to do when
>>>>> hardware and control domains are distinct I'm uncertain - I'd be
>>>>> inclined to suggest that the hardware domain then stay the one without
>>>>> any prefix.
>>>>
>>>> One concern I have with this approach is whether the addition of the
>>>> (d<N>) prefixes will skew output of interactive applications. So far
>>>> the prefix is added to output from all domains different than dom0
>>>> because the console is not interactive for them, and hence no input
>>>> can be consumed.
>>>
>>> Hmm, that's an aspect I have to admit I didn't think of.
>>>
>>>> If that changes however, and domains different than dom0 can get input
>>>> from the Xen console then I wonder how much the added prefix will skew
>>>> output. Another possible option would be to not print the prefix for
>>>> the domain that has the console input assigned (current target), and
>>>> print it for all other domains (even for dom0 when not in focus).
>>>
>>> That's largely what aiui was proposed. My extra requirement there would
>>> then be that we make sure a log message is always emitted when console
>>> focus shifts, so it's possible to identify the owner for any part of
>>> the log.
>>
>> Indeed, printing console input shifting should be a requirement
>> regardless of how we decide to print the prefix.
> 
> Console input focus switch is indicated after pressing Crtl+aaa, e.g.:
> [[
> ...
> (XEN) [15359.353038] *** Serial input to Xen (type 'CTRL-aaa' to switch input)
> (XEN) [15361.176754] *** Serial input to DOM0 (type 'CTRL-aaa' to switch input)
> (XEN) [15711.297202] *** Serial input to DOM1 (type 'CTRL-aaa' to switch input)
> ...
> ]]

And just to double check: These messages aren't affected by "loglvl=" settings,
i.e. they're _always_ there (as asked for earlier; see context above)?

Jan

