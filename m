Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24467906E26
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 14:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739872.1146821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjEZ-00062W-KX; Thu, 13 Jun 2024 12:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739872.1146821; Thu, 13 Jun 2024 12:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHjEZ-0005zn-HB; Thu, 13 Jun 2024 12:07:15 +0000
Received: by outflank-mailman (input) for mailman id 739872;
 Thu, 13 Jun 2024 12:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHjEY-0005zh-1K
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 12:07:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7733bbef-297d-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 14:07:12 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f04afcce1so127265866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 05:07:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f41721sm65334466b.154.2024.06.13.05.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 05:07:11 -0700 (PDT)
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
X-Inumbo-ID: 7733bbef-297d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718280431; x=1718885231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tXvak5OJKqvKSELC6b06Z8QGY6YuES4yko3UV3ZxhZE=;
        b=EPcihI5UqRyVl5WolnqRpKoMSv77xtbGXp/5JvxpG1jEzyqJOAPpMAUZiwWox1EHs4
         simKblHxjkRLZ9n8RN35m3JoqNR43aSQX5Jx/L1wdioEd/kFFaKVDj+r4NUODVr8bYEZ
         x2KWnSGbYXut+sx6rSooS7/RNTur//HiGwpW+ssxN1GwrJk6cdmeFusgPcZaiRqeAXLn
         0wm261DBlmk2Qk1a1587rQc4esN4R1IiCsK6CI652v40DLulMtzuh3vD6rnb1RlUDKsg
         N3qxCSPs6Vq95X5SjS+SH8Xg+HpgEG5Y4t0s/XmkDD2YlC9g/BLtfE8wjb96qqNeOlnZ
         XiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718280431; x=1718885231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXvak5OJKqvKSELC6b06Z8QGY6YuES4yko3UV3ZxhZE=;
        b=cAbDNIxrj164rGOn70/mtARayGDuzSD7zq3N7J8Twjts8fL3Tg5S/DFK0G2uGC3khG
         qIjq1T8dVG+2vM7Sc5vRlTP8Nu+KO5W3/xAX7b4Lwdq3NEskR4Pq5ivcOmhnga1wG/Zt
         tjcK2fChBjgO4ztKCmPJq/Iwcba6Va1neNPUG796qyzRLYc/w2RwPOh+q7STGER/D2iD
         ZP422HdgW88WFW5jWhVnTbeN5oX7i9FvZJeAoqeudr0IgfRV/hIl4BkLVFiwnKB5wULM
         ld+SZ5MKcE3eR3gGPSef7773bd5fpMR1Cc/1NfNbSNEgMmffBkH6WQge/z+4s7tBxTGF
         IIfA==
X-Forwarded-Encrypted: i=1; AJvYcCV5j6aiWJz5OOuZYz6+R06AUfnVWJvxUn0rbQUBd6fMuEjnBdVBt5tF/85jMr6qd3Zua6xHE3RmsZvpBwTVTHQjjaF9HVTOstfjKKcYquQ=
X-Gm-Message-State: AOJu0Yyp4tPQDBHg39FhE157TpUnbO+z2GgrtoiQVqyKvzNAGqJSicwh
	xEFCxpPqT8aTKbsrvtXUCDK99+JsF935C9cRFSpY7Ry1M/JlBAkHiEINs1YI1w==
X-Google-Smtp-Source: AGHT+IGl3UsvU7WX/OH4GGzmvBcLOXgG7noV1Z3uNCCDxU9oJRwI09foBu2AgLoNP3hUiNzY1v1yVA==
X-Received: by 2002:a17:906:c193:b0:a6f:1004:dc30 with SMTP id a640c23a62f3a-a6f48019244mr342647966b.65.1718280431455;
        Thu, 13 Jun 2024 05:07:11 -0700 (PDT)
Message-ID: <0c523073-e8fa-4bb8-81fb-e8c3d2c1d9d3@suse.com>
Date: Thu, 13 Jun 2024 14:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C Rule
 17.7
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <a5137c812eefab7e0417670386b0fee35468504d.1718264354.git.federico.serafini@bugseng.com>
 <55f46457-4182-4e1b-a792-e94cc6c16864@suse.com>
 <c1f92d1f-0934-4603-b3b8-a77402643f22@bugseng.com>
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
In-Reply-To: <c1f92d1f-0934-4603-b3b8-a77402643f22@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2024 13:50, Federico Serafini wrote:
> On 13/06/24 12:08, Jan Beulich wrote:
>> On 13.06.2024 11:07, Federico Serafini wrote:
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -364,6 +364,17 @@ Deviations related to MISRA C:2012 Rules:
>>>          by `stdarg.h`.
>>>        - Tagged as `deliberate` for ECLAIR.
>>>   
>>> +   * - R17.7
>>> +     - Not using the return value of a function do not endanger safety if it
>>> +       coincides with the first actual argument.
>>> +     - Tagged as `safe` for ECLAIR. Such functions are:
>>> +         - __builtin_memcpy()
>>> +         - __builtin_memmove()
>>> +         - __builtin_memset()
>>> +         - __cpumask_check()
>>> +         - strlcat()
>>> +         - strlcpy()
>>
>> These last two aren't similar to strcat/strcpy in what they return, so I'm
>> not convinced they should be listed here. Certainly not with the "coincides"
>> justification.
> 
> Thanks to violations of Rule 17.7 I noticed that safe_strcpy()
> and safe_strcat() are used without checking the return value.
> Is this intentional?

I expect that's case by case judgement. The main thing for them is to make
sure the destination buffer isn't overrun. There may be callers which can
live with possible truncation, there may be other callers which guarantee
a suitably sized buffer, and there may also be callers which actually ought
to check.

Jan

