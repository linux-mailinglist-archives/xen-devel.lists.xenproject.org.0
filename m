Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E585A6E1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682965.1062242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5E9-0008Hg-9b; Mon, 19 Feb 2024 15:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682965.1062242; Mon, 19 Feb 2024 15:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5E9-0008G3-6w; Mon, 19 Feb 2024 15:06:41 +0000
Received: by outflank-mailman (input) for mailman id 682965;
 Mon, 19 Feb 2024 15:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc5E8-0008Fu-03
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 15:06:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b3d7905-cf38-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 16:06:39 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d5ec64351so324878f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 07:06:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bt21-20020a056000081500b0033d1f25b798sm10322896wrb.82.2024.02.19.07.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 07:06:37 -0800 (PST)
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
X-Inumbo-ID: 7b3d7905-cf38-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708355198; x=1708959998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D36QrkvcP0hG+KI2ygjRzaJwbdaS9gH77TGdUvrLq28=;
        b=cnXX9PQbJr/rC+xFVxWkvHrizb+Veycloet5r2cFvgGy23qSktc8EBTOZ9F9dLP2I0
         lIdPPQ4qYmMOF6v4AyxUYyjIePRefxXxecWsonYiwgoQ45hKBjLGa/cnAGx9jB64J4U7
         l48XZcXvaGxDGy0nAHpbEZ22k6YlqouP9bfp7R/HBzDuUzPgomSiq+2rAb3XxxZDjcAv
         PFlJxXxW8tav8VkgdroG0QprQ+MBp/p6IbuuPsENj2IOX4hL/plXHH6cPUlbDE02IoLO
         EnK5zs4/O2uOKv+/K5Hl1fi97QRDnpY/av78s5iiQaCAsM1tv60rd9dvVvqTrQR7Ut8i
         mXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708355198; x=1708959998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D36QrkvcP0hG+KI2ygjRzaJwbdaS9gH77TGdUvrLq28=;
        b=LqhYEzP29PxOJyPwzGuepk1E90UzsIpADcpKQpaTg7drIbBJJbljQw1RjC01MaYAoj
         XqgfyNgL7lqPY6C+AATuhy9Sym1mJE1VsHIj3BRnb+0Zc7Lpf4kbgUFlKRC8KN7bhN4k
         NKwmR6mgjZbWfvjEwIbf4oD4tIPHyIFtFqJPOO1NfNnnwulELMGdwAnRzOQhI5VyXiIp
         ktVuNdR9nC7PLROPkeiVW8wKlcAn3kDt0z/BbOTJNI/J6ySStBFUOEsIZE8cC+OmWXlg
         R9F0CnGVFnEl9rZwc9sQhAm9CZ4iGUQOPg9j4P/EO4JyETWLdSazANWU5yzTjT6YEkbk
         9Fmw==
X-Forwarded-Encrypted: i=1; AJvYcCU09G9Atza6+++CQVqJ8/JGe4j0zZgYc3HfhZ8ChBRB1eF+Wjx+nkKjGjynx8Tij7NftOV2jeIzKKsGXvRl7m5bjJLr+WLRwQkawvJGJVw=
X-Gm-Message-State: AOJu0YzP/0/zuwplxjbM4Bw5jY9ws+HGYeTmrbiM3LUTQyZhrFnB+0NS
	KemgWafI5j/QULU/YTWkzz6Q7xkNLhLvBSZuVrTfIAxxoBdStg0EUQ7HmdTcOA==
X-Google-Smtp-Source: AGHT+IHHWw9BowhEJnek4kopE4MGu37ZQlbkOR8Ls49s+4kE4iJMw6fYUxjtKd6/DivPuRHKNdYmGA==
X-Received: by 2002:adf:e80a:0:b0:33d:20ea:7a3a with SMTP id o10-20020adfe80a000000b0033d20ea7a3amr5199552wrm.27.1708355198263;
        Mon, 19 Feb 2024 07:06:38 -0800 (PST)
Message-ID: <4d2c5a69-4807-4af3-84c2-128d16ee2b43@suse.com>
Date: Mon, 19 Feb 2024 16:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b1d2b64c8117d61ea42cf4e9feae128541eb0b61.1708348799.git.federico.serafini@bugseng.com>
 <a6e8bd32-cc32-4084-907d-e2cd6d46e3e6@suse.com>
 <f28aed5e-0983-48fa-828f-b2133ca35086@bugseng.com>
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
In-Reply-To: <f28aed5e-0983-48fa-828f-b2133ca35086@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.02.2024 15:59, Federico Serafini wrote:
> On 19/02/24 14:43, Jan Beulich wrote:
>> On 19.02.2024 14:24, Federico Serafini wrote:
>>> Update ECLAIR configuration to consider safe switch clauses ending
>>> with __{get,put}_user_bad().
>>>
>>> Update docs/misra/deviations.rst accordingly.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>
>> As mentioned I'm not happy with this, not the least because of it being
>> unclear why these two would be deviated, when there's no sign of a
>> similar deviation for, say, __bad_atomic_size(). Imo this approach
>> doesn't scale, and that's already leaving aside that the purpose of
>> identically named (pseudo-)helpers could differ between architectures,
>> thus putting under question ...
>>
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -368,6 +368,10 @@ safe."
>>>   -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
>>>   -doc_end
>>>   
>>> +-doc_begin="Switch clauses ending with constructs \"__get_user_bad()\" and \"__put_user_bad()\" are safe: they denote an unreachable program point."
>>> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/__(put|get)_user_bad\\(\\);/))))"}
>>> +-doc_end
>>
>> ... the global scope of such a deviation. While it may not be a good idea,
>> even within an arch such (pseudo-)helpers could be used for multiple
>> distinct purposes.
> 
> Would you agree with adding the missing break statement after
> the uses of __{put,get}_user_bad() (as it is already happening for
> uses of __bad_atomic_size())?

I probably wouldn't mind that (despite being a little pointless).
Perhaps declaring them as noreturn would also help?

Jan

