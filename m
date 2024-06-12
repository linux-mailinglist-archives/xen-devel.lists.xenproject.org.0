Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048F9905083
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739154.1146107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLLS-00022V-Jm; Wed, 12 Jun 2024 10:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739154.1146107; Wed, 12 Jun 2024 10:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLLS-000203-GH; Wed, 12 Jun 2024 10:36:46 +0000
Received: by outflank-mailman (input) for mailman id 739154;
 Wed, 12 Jun 2024 10:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHLLR-0001zS-3w
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:36:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9bf1503-28a7-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 12:36:44 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so283047566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:36:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f16427842sm455078866b.100.2024.06.12.03.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 03:36:43 -0700 (PDT)
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
X-Inumbo-ID: a9bf1503-28a7-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718188604; x=1718793404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ghMlT45U+M0R4YXPKCzBM3f2z/I7uLceGhZXqbMMbOQ=;
        b=IQXe57s8McFFJ+iFONEGPBPsBWL19RXdwihSp8sPlLlswiAKE7j1Wl2RuUhZeE9Hfs
         +cFcy1lgbJ0RzqoeGsHSC/dCi5yXfTBFF/gQHDibdvYprqs/7xKP9xR6Yt0C/h2sl4ft
         QGZuakiPELMNXhMfTzLJtCxWl9A7BDQ/zwVD4YS669MOZ5YHBNET6hXJsDfUuuBo0LsR
         sLOFiygYQviK/RKMU24BoyBhN2FQDVCB/S5NnUZZCfD15M/cD5CcDGBVnbeY2JJSXX6J
         L96THnFmnZgfbnYtBhWq6WQQr2UTeA4pRFPUFJZ5vTiFvfORPjmB3bIJL+UCqfEEc49U
         5L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718188604; x=1718793404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghMlT45U+M0R4YXPKCzBM3f2z/I7uLceGhZXqbMMbOQ=;
        b=MEJY4K7p7YZ3mieH/RESQdf4HQ/q3xQl67jXPzsR1I5aUiKa24X32CRKgu3h/PF+7k
         k7nbKwibNK9Ta+HP+DYRu+MvX44CEB35lKmE+h57pC73+bDoNsoH/kAkCLlvm1B82r3U
         3AMlAS7GR1taPtLJic/Z8Hc8+IHdH6m/Anmkq94DJpPVSDehONj/SBmiOQxJOD5g6gm0
         lA86ju/VliN97/OR2hTlFdQRjv6M3xscLAk5MxX9rbsPlmKp2VLimo3CGZo27R54EkIX
         62wSluWq8arntYsxBkiDp9MIZ3GnzrrrIafnx1ss+mVlirUOH4Y0wFYUrjuVERXU9Sbn
         xVEA==
X-Forwarded-Encrypted: i=1; AJvYcCVMhJXYxuZvaVYuxY75bAjq1tvckpHyEoLfT6afqTJI+w1X605/0FgawMhpnbupmOIeoSh76CBTtwcaTzlZ4bICnuZlOpXLwwFKKQehP3A=
X-Gm-Message-State: AOJu0YwvxpcJUIPwok4JJHB0bPxwQJ8haJ99HWFtl6riKiTf/yWbvxEH
	Ixrb5Mpqcsi1hl4tX1qEkh1EkrNPdwr4BKNqjXIWMo8sdvKBrIwWfgA5FYHZ6A==
X-Google-Smtp-Source: AGHT+IGuFnNylE/bptuT+c/FeVzA7aLpmi44cGFEyR02p96hc6dXVYElIiYyAccoFaCW+O/GvbJmaw==
X-Received: by 2002:a17:906:1d55:b0:a6f:2253:d1f7 with SMTP id a640c23a62f3a-a6f480086b4mr110643966b.61.1718188603972;
        Wed, 12 Jun 2024 03:36:43 -0700 (PDT)
Message-ID: <c40bcf67-ebdd-4bcf-b6bc-ecec6a1fd7eb@suse.com>
Date: Wed, 12 Jun 2024 12:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/6] x86emul: address violations of MISRA C Rule 20.7
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
 <0a502d2a9c5ce13be13281d9de49d263313b7852.1718117557.git.nicola.vetrini@bugseng.com>
 <12ce10af-cd36-492e-a73b-2b81b5bf60cc@suse.com>
 <ac1faf5feded028ce80752ce69983352@bugseng.com>
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
In-Reply-To: <ac1faf5feded028ce80752ce69983352@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 11:52, Nicola Vetrini wrote:
> On 2024-06-12 11:19, Jan Beulich wrote:
>> On 11.06.2024 17:53, Nicola Vetrini wrote:
>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>> of macro parameters shall be enclosed in parentheses". Therefore, some
>>> macro definitions should gain additional parentheses to ensure that 
>>> all
>>> current and future users will be safe with respect to expansions that
>>> can possibly alter the semantics of the passed-in macro parameter.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> These local helpers could in principle be deviated, but the 
>>> readability
>>> and functionality are essentially unchanged by complying with the 
>>> rule,
>>> so I decided to modify the macro definition as the preferred option.
>>
>> Well, yes, but ...
>>
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -2255,7 +2255,7 @@ x86_emulate(
>>>          switch ( modrm_reg & 7 )
>>>          {
>>>  #define GRP2(name, ext) \
>>> -        case ext: \
>>> +        case (ext): \
>>>              if ( ops->rmw && dst.type == OP_MEM ) \
>>>                  state->rmw = rmw_##name; \
>>>              else \
>>> @@ -8611,7 +8611,7 @@ int x86_emul_rmw(
>>>              unsigned long dummy;
>>>
>>>  #define XADD(sz, cst, mod) \
>>> -        case sz: \
>>> +        case (sz): \
>>>              asm ( "" \
>>>                    COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
>>>                    _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
>>
>> ... this is really nitpicky of the rule / tool. What halfway realistic
>> ways do you see to actually misuse these macros? What follows the 
>> "case"
>> keyword is just an expression; no precedence related issues are 
>> possible.
>>
> 
> I do share the view: no real danger is possible in sensible uses. Often 
> MISRA rules are stricter than necessary to have a simple formulation, by 
> avoiding too many special cases.
> 
> However, if a deviation is formulated, then it needs to be maintained, 
> for no real readability benefit in this case, in my opinion. I can be 
> convinced otherwise, of course.

Well, aiui you're thinking of a per-macro deviation here. Whereas I'd be
thinking of deviating the pattern.

Jan

