Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69D87809A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 14:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691488.1077489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjfgt-0001Mf-KY; Mon, 11 Mar 2024 13:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691488.1077489; Mon, 11 Mar 2024 13:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjfgt-0001L8-Hw; Mon, 11 Mar 2024 13:27:43 +0000
Received: by outflank-mailman (input) for mailman id 691488;
 Mon, 11 Mar 2024 13:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjfgs-0001L2-Fj
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 13:27:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22ba6173-dfab-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 14:27:41 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a44cdb2d3a6so608379366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 06:27:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k13-20020a1709065fcd00b00a44f0d99d58sm2840433ejv.208.2024.03.11.06.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 06:27:40 -0700 (PDT)
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
X-Inumbo-ID: 22ba6173-dfab-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710163660; x=1710768460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hyc/fCYjIBQbOdpQFKuI9KPdXdwvVUgTGvJ8uWgzWZg=;
        b=HBhxZkc0c3Ep+XgnU2kQVRFpNA75fASIDhpbE0nd1DY04OyOE/Mk3XvXVoTAaS5Lut
         n7UvC6gk8Ei0uyyef9wI2hbJ+nlEgH2u1WBMFL02XjLLktSrTYNxVXFe1g3nAtkCnOmS
         ACRuHWaCaiLcMfd52C7IBczKtf13fYMy0ahO4PYUVAWwDQURLZ4ILBHC0JC6fD2aQYE+
         /MFKXnjVxkq44RIYwhXV2FCszZzQWAeqlM6z+2WEfp4bUbGxgIRdcyNk6qdZZNRI8MC+
         SzSxejz0wYqcJIdJ641VW6sff7rhgEGa4SQ5Xy20IbBFN5piniLx+f3yTdy7Oe1Ds0a5
         CEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163660; x=1710768460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hyc/fCYjIBQbOdpQFKuI9KPdXdwvVUgTGvJ8uWgzWZg=;
        b=cg1cx7VRm9C9OwERO71iV9JC3cMg70O8cYVu4nvrpKEHoPsGxIPoaa0RXsmMezwbtm
         pfZ1zjk4SMEbfbcjFXwoLt+ojEL2jsHJbBT75WjEbFU7T1tSKnVSNcCpGHFzNbDiVa7A
         j7TIb3uqV3In9TsgNo18rvImfTFSrkPrSpesP3i5vTH+ZVTF7XseiAaxnY/Wom7tBYAQ
         HjL+uRdxyO1EBQKV39BAoWX/3XK6cuZUQFoJWs6Sl01CNb2yaIsLk1ZLJBu7Ur42b2xY
         132+mjt/sPrzX6AKZVHdmUImz3juBqbAZ2maOozcELrjzk9gQ6FxxN4UK1Rr3XJqhKg4
         SfAw==
X-Forwarded-Encrypted: i=1; AJvYcCUO0oI0rG8JIJGv6uMS3qqWLvawvQ6qzfZGlwhHqgXM+cVqqQhUYUnMYzF6YI+PGXFED25USKeS9/WXK3lLYtW+UvHc7e1zXB9ntVMbb6k=
X-Gm-Message-State: AOJu0YyZfJDWqGMIk8pIDJcVDzi56929ShY3fE42vJmBZQHvaT2UE9Ko
	lT15ajbvyBmkWWVwfCj/qbH3BNwaDkddXXZ+O/Ha+67P8mBIhtuJH3Z1KodJpA==
X-Google-Smtp-Source: AGHT+IEsSikZrp4z1pNULPMGsvAyMeROrjCGGp8GxVk/K2flPycktt6ZToWXPCBKiVy7OHrwKkTvsw==
X-Received: by 2002:a17:906:d1cb:b0:a46:23e8:2fb2 with SMTP id bs11-20020a170906d1cb00b00a4623e82fb2mr321132ejb.62.1710163660590;
        Mon, 11 Mar 2024 06:27:40 -0700 (PDT)
Message-ID: <0756f3b5-6efa-4113-b88e-9638327b3e1e@suse.com>
Date: Mon, 11 Mar 2024 14:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 00/16] xen: address violation of MISRA C:2012
 Directive 4.10
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <b5c9c975-4c6a-4724-8cf4-a6b90dd137cb@suse.com>
 <93179ace-f201-40d9-8348-372d59e4030b@bugseng.com>
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
In-Reply-To: <93179ace-f201-40d9-8348-372d59e4030b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 12:41, Simone Ballarin wrote:
> On 11/03/24 10:59, Jan Beulich wrote:
>> On 11.03.2024 09:59, Simone Ballarin wrote:
>>> The Xen sources contain violations of MISRA C:2012 Directive 4.10 whose headline states:
>>> "Precautions shall be taken in order to prevent the contents of a header file
>>> being included more than once".
>>>
>>> As stated in v2, the following naming convention has been estabilished:
>>> - arch/.../include/asm/ headers -> ASM_<filename>_H
>>> - private headers -> <dir>_<filename>_H
>>> - asm-generic headers -> ASM_GENERIC_<filename>_H
>>>
>>> Since there would have been conflicting guards between architectures (which is a violation
>>> of the directive),
>>
>> Why would this be a violation? The two sets of headers aren't use together,
>> and any scan should only point out collisions in what's actively used, I'd
>> hope.
>>
> 
> A header guard cannot be used multiple times in the same project, so it's a question
> of whether or not we want to consider each arch variant part of the same project.
> In case, we can define a new rule for these files.
> 
>>> there has been a need for ASM headers to specify  if the inclusion guard
>>> referred to ARM or X86. Hence it has been decided to adopt instead:
>>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>>>
>>> The subdir used is the smallest possible to avoid collisions. For example, it has been
>>> observed that in "xen/arch/arm/include/asm/arm32" and "xen/arch/arm/include/asm/arm64" there
>>> are plenty of header files with the same name, hence  _ARMxx_ was added as subdirectory.
>>
>> Why couldn't <arch>_<subdir> together be ARMxx there, allowing us to get
>> away with one less name component.
>>
> 
> I agree.
> 
>>> There has been a need to define a standard for generated headers too:
>>>   - include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
>>>   - arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H
>>>
>>> To summarize, here are all the rules that have been applied:
>>> - private headers -> <dir>_<filename>_H
>>
>> And <dir> here is the full path? I thought I had indicated before that
>> this is going to lead to excessively long identifiers.
>>
> 
> Yes, dir is the full path. This general fallback rule to use when more specific rules do not apply.
> If this generates excessively long guards, we can simply add more rules.
>>> - asm-generic headers -> ASM_GENERIC_<filename>_H
>>> - arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
>>> - include/generated/<subdir>/<filename>.h-> GENERATED_<subdir>_<filename>_H
>>> - arch/<architecture>/include/generated/asm/<filename>.h-> <arch>_GENERATED_ASM_<name>_H
>>
>> And _ASM_ is merely a precaution for stuff appearing outside of asm/ (which
>> doesn't seem very likely)?
> 
> Yes, it is. Do you prefer dropping the _ARM_?

Well, I prefer any measure keeping down the length of these identifiers.

Jan

