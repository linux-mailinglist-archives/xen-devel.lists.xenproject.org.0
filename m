Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C1EA9E811
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 08:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970029.1358819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9HmJ-00064m-SV; Mon, 28 Apr 2025 06:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970029.1358819; Mon, 28 Apr 2025 06:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9HmJ-00062G-Pi; Mon, 28 Apr 2025 06:15:43 +0000
Received: by outflank-mailman (input) for mailman id 970029;
 Mon, 28 Apr 2025 06:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9HmI-00062A-FX
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 06:15:42 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3433a2d6-23f8-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 08:15:38 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39ee623fe64so4305945f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 23:15:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073bbeb5esm10092810f8f.0.2025.04.27.23.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:15:37 -0700 (PDT)
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
X-Inumbo-ID: 3433a2d6-23f8-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745820938; x=1746425738; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yJvfQki8gan86GKv7XwVCsTyZrKf/Z038F1BPF/KQZI=;
        b=PRxQ2j0JRDnoV4LOLfTnsDLH9JITpD2KXe6FA4cLgAZF+xRCnu78uSQIX+1nNR9qqE
         mh1Q5KaRMS7bdNtZL4/g6cA7qyHoZjC95tzAOQSUiHjXut/mO+qrAJnjaK4UcK0Oq6Uj
         uKsuFqy9p+/v77T2ijoZT/TKdvdXLZbTbTnfG1OXNxlVwfI3HYSuUFh4VpZ+JtrCihrk
         5G9oSCut/OlFg1/BmsOYAhWDywkX/UeMtXMphxNFNB9xPiFF8ts7TK0/GkyGXzgQk6Z1
         KScCfcm8SqFTWgxlRV2R0s0z8ZeiTUQvqNJX1GkRjBXSIW61eknjp3mu5NLFJIrCA+/F
         fUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745820938; x=1746425738;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJvfQki8gan86GKv7XwVCsTyZrKf/Z038F1BPF/KQZI=;
        b=ocX5Gg071JAVTKVl6KHnLvp3fzKbHMeShpehm1zvxB0OdxtB2YRq7HZ0W2sAtLITzu
         S4NTJ48H+BgcLiS1foUKlZ2fRemdhggBKPgKSdH1UDMV08/XToDc7RF+7tnrLiKJq7ps
         WxEcXuhOkzt15LNTPsKRJOw5RiNXP4EiVqpMQzhqNiQtICS+q8BwBcflRS0NJIqZnBMu
         3fP/WVHE9NRanOQuFkiyjfPCmBIS2GfibEAvLPnznfx6u6VnM/1uPZ+Av7oc63eBIvJ9
         vc0rT8ORq8qyOojRvoE1kjCu2UhvieqXVgKIJXcCnEhcoGvIT058ow1wf0ieJ1eHCurh
         IfPA==
X-Forwarded-Encrypted: i=1; AJvYcCUNI5hxPE+1VOqMN/mtHd+PgnTh5++YOiq2KJhAOYzPnNQL/wyW+yZhs3s/Z344HmOCX6ALdc7Bhqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlAOQbJfqp0WIW8piuPt5rH+VusjrOmydLLP7qp5uVjR4rNYIT
	8h+p35P5EbmqnY4I4DEhu24Bg+MQUQi3mq4AxEC46sybGN7oNMw3YwJ/XFG1Ug==
X-Gm-Gg: ASbGnctwYOjFuenjOf/kbmtucqkOo55Fa45VBhVurPdTOgAiLfPNJhGh6qGTVfVUYel
	D6XHpvTa2M8X+cyBHuFcYTfdFVCoMwSjs6BMmq59XIn74p2bi+FLhX92yZNeTYUfoR7RAVnd2Nb
	M6z8M3EAACrKXQJgOG+aPDo9m7uPYeH2uZWszn7muy0Q0WnFZkGEGKXkwO3cVzFoS8pOPWSUsBu
	KkHxnRAlyZQRhPV8y2zQIYE/b59cb0dEZ8vbcX4quWAzDeYjTU4I8jfbbVs5ZdxvV3O7GnJtdGo
	OpZv/fY2FByXXW1lz2KBK4OfF8/qVYf+X6J2C9vvoPcfeq1VNQWrOFmgJcTtYEYLB7a8LXIEORZ
	flpciJ3HCQ3CzgRFPFCkVMQ/ANw==
X-Google-Smtp-Source: AGHT+IE+iK2pfWqyQ/6QhtAyQfIGiQMz6ciuNOkk8TkOxnhiHOFWWUsSgnrZCcdobvnHgKHO/gfjxg==
X-Received: by 2002:a05:6000:4310:b0:39c:dfa:c92a with SMTP id ffacd0b85a97d-3a074f11d2amr7798280f8f.36.1745820937858;
        Sun, 27 Apr 2025 23:15:37 -0700 (PDT)
Message-ID: <b7f7ab2b-baaa-416f-b390-5ed2229d34cb@suse.com>
Date: Mon, 28 Apr 2025 08:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
 <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
 <8d65ee65-ec6f-49a3-8954-d303b08dc2df@suse.com>
 <a9db045cff906a4b7db8730ad1095e4b@bugseng.com>
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
In-Reply-To: <a9db045cff906a4b7db8730ad1095e4b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2025 17:53, Nicola Vetrini wrote:
> On 2025-04-25 10:07, Jan Beulich wrote:
>> On 24.04.2025 23:45, Stefano Stabellini wrote:
>>> On Thu, 24 Apr 2025, Jan Beulich wrote:
>>>> On 23.04.2025 19:54, victorm.lira@amd.com wrote:
>>>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>
>>>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>>>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>>>>> identifier or reserved macro name shall not be declared") violations
>>>>> are not problematic for Xen, as it does not use the C or POSIX
>>>>> libraries.
>>>>>
>>>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are 
>>>>> still
>>>>> __builtin_* functions from the compiler that are available so
>>>>> a deviation is formulated for all identifiers not starting with
>>>>> "__builtin_".
>>>>>
>>>>> The missing text of a deviation for Rule 21.2 is added to
>>>>> docs/misra/deviations.rst.
>>>>>
>>>>> To avoid regressions, tag both rules as clean and add them to the
>>>>> monitored set.
>>>>>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>>>
>>>> While the rule is in the library section, ...
>>>>
>>>>> --- a/docs/misra/deviations.rst
>>>>> +++ b/docs/misra/deviations.rst
>>>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>>>         construct is deviated only in Translation Units that present 
>>>>> a violation
>>>>>         of the Rule due to uses of this macro.
>>>>>       - Tagged as `deliberate` for ECLAIR.
>>>>> -
>>>>> +
>>>>> +   * - R21.1
>>>>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX 
>>>>> standard
>>>>> +       libraries. Xen does not use such libraries and all 
>>>>> translation units
>>>>> +       are compiled with option '-nostdinc', therefore there is no 
>>>>> reason to
>>>>> +       avoid to use `#define` or `#undef` on such identifiers 
>>>>> except for those
>>>>> +       beginning with `__builtin_` for which compilers may perform 
>>>>> (wrong)
>>>>> +       optimizations.
>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>
>>>> ... I'd like to ask that it be explicitly clarified here that it's 
>>>> solely
>>>> the library (and not e.g. the compiler itself) that are of concern 
>>>> here.
>>>
>>> The language can be clarified:
>>>
>>> - Rule 21.1 reports identifiers reserved for the C and POSIX standard
>>>   libraries. Xen does not use such libraries and all translation units
>>>   are compiled with option '-nostdinc', therefore there is no reason 
>>> to
>>>   avoid to use `#define` or `#undef` on C and POSIX standard libraries
>>>   identifiers except for those beginning with `__builtin_` for which
>>>   compilers may perform (wrong) optimizations.
>>
>> Which makes it more apparent that there is a gap: What about e.g. 
>> __x86_64__?
>> That falls within what the rules cover, is not a C or POSIX standard 
>> library
>> identifier, yet very clearly must not be fiddled with. Whereas the text
>> above deviates it.
> 
> that is true, even if unlikely: one approach could be to avoid deviating 
> predefined macros for all CUs as -nostdinc and -fno-builtins should take 
> care of the rest; this kind of deviation is not currently possible in 
> ECLAIR, but it might be in the future.

Is this perhaps because by "all pre-defined macros" you really mean _just_
those, and not the entire reserved (for that purpose) sub-namespace? Imo
we should not go by what a particular compiler may pre-define (we may even
overlook something if we did it this way).

Jan

> I think this could be 
> accomplished also via some gcc trickery on each CU, though I'm not sure 
> how valued that is for Xen.
> 


