Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA384F4D0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 12:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678652.1056112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYPLK-0002nB-9V; Fri, 09 Feb 2024 11:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678652.1056112; Fri, 09 Feb 2024 11:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYPLK-0002ke-6q; Fri, 09 Feb 2024 11:46:54 +0000
Received: by outflank-mailman (input) for mailman id 678652;
 Fri, 09 Feb 2024 11:46:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rYPLI-0002kX-B4
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 11:46:52 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e99f18bc-c740-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 12:46:51 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b2960ff60so1103957f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 03:46:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d59c3000000b0033b66c2d61esm918936wry.48.2024.02.09.03.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 03:46:49 -0800 (PST)
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
X-Inumbo-ID: e99f18bc-c740-11ee-8a4b-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707479210; x=1708084010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PiEferPHOA1KnMDY4S9rwu+csM6PS8dV3Ai9ITuH0uc=;
        b=UrNZ5/NVWzrwV7cU0ejqGfizR3Qo9CR+rR+OpGzZq7jcZoKBD64C678fR3ONRlM+P9
         pm9P3NpfUaC3uDxt3D2oK+qDZYxko4KQZ+oGWkP0H2KJC9JIKicEjP87eXTZxfITxvMZ
         Xoz+6sFlpuAwF75yVglLKquKO2vKpYfMVHhmnHbRXhiQjAIEDXg9HvgU9AEO1eNl4366
         4kbIIajkKrdT0bfORmQTrSdEf8F8zAhbK2MXlHWsSeffqR0XpmJ2283GrDbrpO5e4Y01
         P2Lm9fvpkbvPm0uMXfn9L4dN0uLvuqgUb8/MqPvlQ5NxVF6hdgPLwPANmD0yUZ7EoKsz
         mV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707479210; x=1708084010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiEferPHOA1KnMDY4S9rwu+csM6PS8dV3Ai9ITuH0uc=;
        b=koNGDOG7WkwhnMgzojcBwv03QOylVqCrcqx+U3MkEDS5ydYAE4lUyXBcNVOoXOXlVK
         ZbI3r/qdm5I8mF+wwat7A6Wm5MdTmh9k6GOAvXIWnJgDrTKALZu8bn04rsYqaKdUbzmg
         OSFm0n8kBFnO53ELN6u7AKeeSYut15MboK6x1JwVsJY/EglahWTE+GPWOHaWA0w3coyd
         2r6W3PmG6d5HitiwkA42AdP2m/+nYcMjss2Rb2WP2UBa5vLQIqv/2EkKANVQIdi/M4Cl
         LNIU8l4P6fOlphmD9Y5JMkF2Ln29sNRoMMeDMmg7Nzjbk+KzkzESIg5KTDvpDq1fFFPV
         Mpsg==
X-Forwarded-Encrypted: i=1; AJvYcCUOdBoii3tnl/Dfm8L1rS5IlceDa5YTGiBNN7K59Nk4zTkrAeu/C1zWgMSte+iDAmfVHiRBeNWOYWrq8jrm7vMuF4pXVPtz+3gcI2bnNQ4=
X-Gm-Message-State: AOJu0YwbuThbw0IaQwzUMcYT9QBWlrTReM+FSOFZ9/V/X16e3cgs0pyR
	7utByMnpi86dpud9JTBOZQ2EzADyWrjPIB2YWIybz6kRfdGmV4RFi81XIR2C1w==
X-Google-Smtp-Source: AGHT+IGr8l83hIgRTnIZkYDs1ZxRuNO9ekH1PsLv7Ku/lMQTgf3mbYHT2NFBp/LTcc9kbdX+8O0adA==
X-Received: by 2002:adf:fb81:0:b0:33b:3c05:cafb with SMTP id a1-20020adffb81000000b0033b3c05cafbmr856871wrr.16.1707479210201;
        Fri, 09 Feb 2024 03:46:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU71sj4KFkgLkNzmL98QHZA6LHuxDn4AwXtnAd+39Pl+4HZu0HIzHDTOkPhr1wQ3Q2dMthMlVYoiU/YOM2wuVU3bD3hKP9tvyaBsnRru2r1JVO3nVTmfG8XC/PncsTD+l0eUA9gTpXY1wfApPChKYFPjDc/lyhLsIbLscS0vDtzPyvXcosEO5/rNOI2eMWSv72bQDqigjljjmDrjbBYCQLlmhd2s5OfmVEDAOcvJ/sbBcBEdWNcUJaq4mlmHRw5XGjLg4zohWkjstHJc7ozjF7ZZj2DUVxO0qimEiMXjpq2okFvnmVzvoLx8IANbwaCu4ok5G59n8M2gLouCJywiyT6u3xf06S7BS36Lpn5PPwgLVn1oOwQiRsims6KrwNF0JFWCJa+gEM712X3/ePxV0h1ncFzzU5NzMVwkwdr7Ec=
Message-ID: <efc0eee4-9903-4228-b33e-cb50d4c545ee@suse.com>
Date: Fri, 9 Feb 2024 12:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] docs/misra: add asm-offset.c to exclude-list
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <09b659e19bf2cc6b3ee4320e019bdfa7def5f3b8.1707406598.git.nicola.vetrini@bugseng.com>
 <891e8cc2-e073-4cd3-9998-4c01ae775a3b@suse.com>
 <8977390f-9549-40d5-bfdc-5c3da81521fc@xen.org>
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
In-Reply-To: <8977390f-9549-40d5-bfdc-5c3da81521fc@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.02.2024 10:40, Julien Grall wrote:
> Replying on the v2 as well.

And answering here despite the respective question was raised on the
v1 thread: I'm certainly okay with the more detailed commit message.
A few nits, though:

> On 08/02/2024 15:56, Jan Beulich wrote:
>> On 08.02.2024 16:50, Nicola Vetrini wrote:
>>> These files contain several deliberate violations of MISRA C rules and
>>> they are not linked in the final Xen binary, therefore they can be exempted
>>> from MISRA compliance.
> 
> I'd like the commit message to be expanded a little bit to explain which 
> MISRA rules are a problem. This helped me to understand why we excluded 
> rather than fixed.
> 
> Base on the previous discussion, I would suggest:
> 
> These files contain several deliberate violation of MISRA C rules such as:

violations

>    * R20.12 on Arm for macros DEFINE and OFFSET, where the second 
> argument of OFFSET is a macro and is used as a normal parameter and a 
> stringification operand.

Is this really for Arm only?

>    * R2.1 because the file is not linked That said it was decided to 
> deviate the rule itselfed to deviate that aspect).

There look to be punctuation issues here. Also s/itselfed/itself/, and
the duplicate "deviate" is also a little odd to read (maybe "deal with"
or "address" in place of the 2nd instance).

> The files are also not linked in the final Xen binary, therefore they 
> can be expempted from MISRA compliance.

Looks to duplicate what the latter half of the 2nd bullet point has.
If to be kept: s/expempted/exempted/.

>>> --- a/docs/misra/exclude-list.json
>>> +++ b/docs/misra/exclude-list.json
>>> @@ -101,6 +101,10 @@
>>>               "rel_path": "arch/x86/efi/check.c",
>>>               "comment": "The resulting code is not included in the final Xen binary, ignore for now"
>>>           },
>>> +        {
>>> +          "rel_path": "arch/*/*/asm-offsets.c",
>>> +          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
>>> +        },
>>>           {
>>>               "rel_path": "common/coverage/*",
>>>               "comment": "Files to support gcov, ignore for now"
>>
>> ... something looks odd with indentation; can probably be adjusted
>> while committing.
> 
> I am happy to take care of both the commit message and the indentation 
> on commit.

Okay, I'll leave that to you then.

Jan

