Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAB493903C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 15:58:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762006.1172093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtXu-0007ui-LF; Mon, 22 Jul 2024 13:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762006.1172093; Mon, 22 Jul 2024 13:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtXu-0007sj-IU; Mon, 22 Jul 2024 13:57:46 +0000
Received: by outflank-mailman (input) for mailman id 762006;
 Mon, 22 Jul 2024 13:57:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVtXt-0007sd-Qv
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 13:57:45 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ded8159-4832-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 15:57:43 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4267300145eso37083325e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 06:57:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8be83esm424789866b.113.2024.07.22.06.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 06:57:43 -0700 (PDT)
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
X-Inumbo-ID: 5ded8159-4832-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721656663; x=1722261463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1BHUUPT+SxXGKu48PmE5Ac3pzSobMaZaFAvTthtVBHE=;
        b=YfvB03XYospKXY/8B5/JqnbEV37o8pP5G+G3tButCKwRPU9bLSsf3SQVSv785y2IwD
         pGCqF6W9Q1bmdi+RkbJZ+8GDAz1cn+Fk0z2jetbATFSkNEaSwQ1pwhdSF3LqCn4TxvpM
         yTj050hQ6sYWUp5ZDJljwK0NEYMisfmf7c24ERdE3ZFyWUdO/SkTAqOWjll2FqLcLEUm
         HSbfV8vMVF/iuNNny7HQzcb9MYz5XaoH/JfeOzQ1iZizS9BD9U+xRhv9u7SX5mBilUn1
         OHzxsUWMQwGuTSeR4NLJsHGu4ZwsbonQCGd1nUie//qKbVaA/Xg9iVUJzfT388pa2Njt
         FgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721656663; x=1722261463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BHUUPT+SxXGKu48PmE5Ac3pzSobMaZaFAvTthtVBHE=;
        b=vtVN+nQyykKH1orXKOTRxswGf4HBjYU8zSz8i0MNTbFFJMP3SuboB9G4LwlF2dR78J
         4dOb3jt1E65ZuFG1u0lur07a5S/sV70cCIltdY4nrKNw3UHXTcLHzgOQYS2U54krdMM1
         qZzevypnAw2x7z/jeDXGndIIf8EAT1Pu1frhEZ5lSh4hxyFQIJ4Tjko1dajbwKxIGEo4
         j5VzZlGj6vVCEqVgh8XSTPqgLejk4a2IKMU6Yxp7BYkFlsMdzqMxit0egZdv5lDMQk0w
         6xrAEwCnaTL2EJI81cd82SDYKbSGrier8aT+o4cCVkxLUF8TPdKi4fhbNceh7PrpS2XX
         fw0A==
X-Forwarded-Encrypted: i=1; AJvYcCWE8Z+x+bXsstoQn6cSUI3jm4SG8bJ2BDndEpcAKh9eHCo+VlUlRk1DbehEcwMvUog/zBTJbhljou/eZvTEXVfZA5JsxFg06GK4GrZCwMo=
X-Gm-Message-State: AOJu0Yzi0rwRHINY7du9p0plXft8yea2MyEQKWOc5kXSNuAM3m2iS7g0
	92wEPkxxrFiiytk0tw2XDmsp4WawGpuKY1UIr9CFEYdwMGx3O87aRLJ42foWPA==
X-Google-Smtp-Source: AGHT+IGCTf2Q3MeiMgGL+frTyVn/8HN066cVstQRj33HsvaxsY+prrvinQLefhGHWezLO0N/VZhpSg==
X-Received: by 2002:a05:6000:4026:b0:362:4f55:6c43 with SMTP id ffacd0b85a97d-369bad7b763mr6021853f8f.0.1721656663304;
        Mon, 22 Jul 2024 06:57:43 -0700 (PDT)
Message-ID: <4d2d38ab-170f-4c98-9908-007adb9da950@suse.com>
Date: Mon, 22 Jul 2024 15:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] Add libfuzzer target to
 fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20240722112752.4981-1-tamas@tklengyel.com>
 <9013e512-2710-4492-8e60-8f25ba32bbe6@suse.com>
 <CABfawhmPm18vuqVR6S6K2Rv0nCssUsrY0jgJthVF_y7TuKVx-w@mail.gmail.com>
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
In-Reply-To: <CABfawhmPm18vuqVR6S6K2Rv0nCssUsrY0jgJthVF_y7TuKVx-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 15:51, Tamas K Lengyel wrote:
> On Mon, Jul 22, 2024 at 8:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.07.2024 13:27, Tamas K Lengyel wrote:
>>> This target enables integration into oss-fuzz. Changing invalid input return
>>> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
>>> missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
>>> build.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>> ---
>>> v3: don't include libfuzzer-harness in target 'all' as it requires specific cc
>>
>> With this, how is it going to be built at all? Only by invoking the special
>> target "manually" as it seems? Which sets this up for easy bit-rotting. I
>> wonder what others think here ...
> 
> Yes, by calling make with the specific target. It's not going to
> bitrot because oss-fuzz will pick up any regression on a daily basis
> to this target. I assume you would be interested in receiving the
> fuzzing reports so it would show as a build failure in case something
> broke it.

Please forgive my lack of knowledge here, but which part of whose
infrastructure would pick up stuff in a daily basis, and what fuzzing
reports (I've never seen any, daily or not) are you talking about?
For now it feels to me as if you're talking of what's possible down
the road, not what's going to happen from the moment this patch was
committed in a 2nd try. If so, the gap between both points in time
may be significant, and hence my bit-rotting concern would still
apply.

Jan

