Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD46A9C06D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:08:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967296.1357119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8E5z-0006h9-PG; Fri, 25 Apr 2025 08:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967296.1357119; Fri, 25 Apr 2025 08:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8E5z-0006fK-MG; Fri, 25 Apr 2025 08:07:39 +0000
Received: by outflank-mailman (input) for mailman id 967296;
 Fri, 25 Apr 2025 08:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8E5y-0006fE-DU
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:07:38 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fd42561-21ac-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 10:07:20 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so1441151f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 01:07:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e461casm1593348f8f.74.2025.04.25.01.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 01:07:27 -0700 (PDT)
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
X-Inumbo-ID: 4fd42561-21ac-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745568447; x=1746173247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SWU1PEhrpAVMYN5N36PBet5PbNmWcrMovqbMPn1yVtM=;
        b=hHM7f5RXMornKJBxcsGOfa38tp09txgcnspcVWAte8iRc6ufYulqTynuwXqvVK4X7Q
         JaW/fSe2I+JEFxU7CThgvaCk5rmyuigIv9ByqbIR29/21cUzT2t+ppkpMNzeeUtirxsb
         3I/FQ5MoI0+Pilnxm50PHiaXtfNq6WoC/qVmX4f+M6c5jP82l5GOrazVs83yOzUUsfIa
         OvGzVQPG7Ot5HdHXnheCeQPp/pOnhTTaHHDMpz6/r1zIC66bIx8MIJYcARpA2qDReE5K
         Kz3vUWbzb7DKsF5WQaeevUsnH1kPN4kLOAnvPPZmYdduvipPtx+PIXq5WryMFwwG1xzp
         B9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745568447; x=1746173247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWU1PEhrpAVMYN5N36PBet5PbNmWcrMovqbMPn1yVtM=;
        b=Krhfb5pP7Ur2t6kYNOUeswxjprU+HcyT6N1G5AlUj3Mw0oHscJ9x9WW8ckXEF2fZ3e
         sfgWmXdfJSF7XkUXJ4lPMPBIoEy0hKuhQbF9hLT9RC8Lar/VjZxhU7m1HvbKDj1XsVPI
         pW2qRvBZcylK8qHbbCQuKKPJNk9B3HZoVrxF+5WfQQx6ONEs8QUmfmPEmJ1gZ63+6sSY
         Y7aX3WdDIlljj+SwJwISC5U5xRcp09Ztv9t7XPp0fRW6qzxDZ5HPDwQrN+CU6PhnxdK3
         +f6x4o9sUFvVGR0LBTx72R14/Fc7bwbMJAFKvBUXv2wq7pwnh28TCERxM5tkBXQe9kTW
         I60A==
X-Forwarded-Encrypted: i=1; AJvYcCUNeVM1REgh2aRhh/vRK7iCQDMz6rKFmk3J+QKPl9NkahFJzgX133+LW/0Tq9zd++sUzVY/pXeQw7I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypGHMmF2pxFN6zxYlbLpIuf7SGzFDvl+CI59YXe/cSqI7OqQuA
	TAe5OzNt3Aa+QMX+/QkhdMb1bBAsKV1b5HOdcDkk77CPyR4Re4sSolvSY0Pk8w==
X-Gm-Gg: ASbGncue867QDA9Gzfho5fY8TqbwYLLEijkWqeFKsBLEP37+I7jbrR6RI+gJHoHJKiL
	0ES7aXIATJWInLnCgdHKmdisdHg67ojqugxTZxH5fWnXLKHWBASmkcVFTB+78WtTtjFJgztzh6k
	ohEH5EV5xzzFBFYLFdRocibfWi3gxdBrkTIJ2fegbFWHV4dTtdhr3T9wZDPjLuQYMA25umMU9ko
	hY1kHTzn/EXsCzhlUUIFON+5hVsSpdr0HkqovfYASnYVhhVAv9/cDd9aDGVppQDC4zR74gzKBru
	YCJJi1amEz7TDXt7+m7PqJhINT6VSkSaHSA8jocHOr8GyYPcU6w+snsx+O5kreXf+d6UoU7bUtL
	+uOEDpQ8MrZk4WOTTRAsAICDQDZGm4UITeAht
X-Google-Smtp-Source: AGHT+IHQuzSZYrgjgZCr4a0EGokX2J65T8ABMGA7UijjrwLRQirxlAN5S/2VwUy0yEq93F9Wu4bBew==
X-Received: by 2002:a05:6000:2403:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-3a074e41d2bmr851952f8f.29.1745568447596;
        Fri, 25 Apr 2025 01:07:27 -0700 (PDT)
Message-ID: <8d65ee65-ec6f-49a3-8954-d303b08dc2df@suse.com>
Date: Fri, 25 Apr 2025 10:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <f5d35582-9270-4816-84c2-f078afeee711@suse.com>
 <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504241443550.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2025 23:45, Stefano Stabellini wrote:
> On Thu, 24 Apr 2025, Jan Beulich wrote:
>> On 23.04.2025 19:54, victorm.lira@amd.com wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>>> identifier or reserved macro name shall not be declared") violations
>>> are not problematic for Xen, as it does not use the C or POSIX
>>> libraries.
>>>
>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
>>> __builtin_* functions from the compiler that are available so
>>> a deviation is formulated for all identifiers not starting with
>>> "__builtin_".
>>>
>>> The missing text of a deviation for Rule 21.2 is added to
>>> docs/misra/deviations.rst.
>>>
>>> To avoid regressions, tag both rules as clean and add them to the
>>> monitored set.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
>>
>> While the rule is in the library section, ...
>>
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -587,7 +587,31 @@ Deviations related to MISRA C:2012 Rules:
>>>         construct is deviated only in Translation Units that present a violation
>>>         of the Rule due to uses of this macro.
>>>       - Tagged as `deliberate` for ECLAIR.
>>> -
>>> +
>>> +   * - R21.1
>>> +     - Rule 21.1 reports identifiers reserved for the C and POSIX standard
>>> +       libraries. Xen does not use such libraries and all translation units
>>> +       are compiled with option '-nostdinc', therefore there is no reason to
>>> +       avoid to use `#define` or `#undef` on such identifiers except for those
>>> +       beginning with `__builtin_` for which compilers may perform (wrong)
>>> +       optimizations.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> ... I'd like to ask that it be explicitly clarified here that it's solely
>> the library (and not e.g. the compiler itself) that are of concern here.
> 
> The language can be clarified:
> 
> - Rule 21.1 reports identifiers reserved for the C and POSIX standard
>   libraries. Xen does not use such libraries and all translation units
>   are compiled with option '-nostdinc', therefore there is no reason to
>   avoid to use `#define` or `#undef` on C and POSIX standard libraries
>   identifiers except for those beginning with `__builtin_` for which
>   compilers may perform (wrong) optimizations.

Which makes it more apparent that there is a gap: What about e.g. __x86_64__?
That falls within what the rules cover, is not a C or POSIX standard library
identifier, yet very clearly must not be fiddled with. Whereas the text
above deviates it.

Jan

