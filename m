Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950F9F77DE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860918.1272899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCO6-0004ln-QA; Thu, 19 Dec 2024 09:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860918.1272899; Thu, 19 Dec 2024 09:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOCO6-0004lH-N3; Thu, 19 Dec 2024 09:00:06 +0000
Received: by outflank-mailman (input) for mailman id 860918;
 Thu, 19 Dec 2024 09:00:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOCO6-0004fz-01
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:00:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a367b2d4-bde7-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 10:00:05 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43635796b48so3283435e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 01:00:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e219sm1050713f8f.84.2024.12.19.01.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 01:00:04 -0800 (PST)
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
X-Inumbo-ID: a367b2d4-bde7-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734598804; x=1735203604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kQiQUgyKCisRHAMfx9IO5/2Zroj9JsEB2aEdSBKqYTk=;
        b=UgbHGKZsDsFwB3aG6tEqWaCk+sBgg9FhX9fuURWf1cvqGt/TdQeYIMEOvVtCzPaQCC
         XgI76LtuYaqmD8zLMfKjCgZNMpvltfvFegSfCKg1NiZDhm4yC4+Gv+gzqATx/cwjsG+B
         fGjZ6xBDzSzIZd1q7Qer/eX3dMPe6XVDV1eoTqJrhhqKOVOLfOgtdcL8Z3CLlsSemN2n
         nRreuR5hyMtkmRRdFx7/mKV9Cg00ant/nqSNqWyytAqDO7IhK6e6MDeAB4Z+zHdToGGa
         wYWzXQBtqH3yb/yc0Uat+GpkAIzoEvUNdNZNG1kFyb9kFlycRefPGKYveekaDhQorqUi
         K8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734598804; x=1735203604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQiQUgyKCisRHAMfx9IO5/2Zroj9JsEB2aEdSBKqYTk=;
        b=plK5fyZkKF10d3ZvM6Urf3/HO/enzV9b35fXkx1jFL17WdqhCvsHyw1pvsYmlzgZES
         jKJ+KStdESBjZflpVdfufuPilGrdXngW/MmwP782JsHQTn10HeFyHLrUKpTR2RlgoiBV
         lBzoQ9zd7njuJvuCOEf6Hz40Qi7P6KIdWH20bT46UYYFpMVR6WRHlHgPQlZBWCqGVOWc
         4kqvscb1k3o+emhmlIDDRjaNQfuFv3LW2+h1dh1LX//SHHhamI+ARUkimUClJkJesxgi
         J4KkkJ69wEuHKeWuSVAgiP2ED2zZZx2ctU3qOHQsc64uS48nUycsapsS4K+7uJfMFOt8
         hPjw==
X-Forwarded-Encrypted: i=1; AJvYcCWRuHqVQEihwJwzNPx8ky9D9HX0GuXzTvPLx5dm7ZvbP0VO/Hg24o1tROGtR/8LRUUR2zdBPWa0M64=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsT56nCKMtAfP2OtxX2q966NITxzCVALZzuwgRL0THALU8U6Vc
	b7ed36RearOBOEqeDo7kA/O02rdApGhIxZjeVaZpkvfyGP4kbWQfyX1aAzUqQw==
X-Gm-Gg: ASbGncvNx251YrNB096giqR9ju5Kcz+mawlKpnlpN5fAbgwo+bQHKQsUE295cMgv/65
	hpDe+pu9gzcViHrpFryKHHzbTbvuGjsMB7Y7Xo8xqg0X37dG4ECONNiBvcNIU+SA/uInvQtnVJk
	Opt9avCRqEiOPQ3CYmqP2HqlMktyWNFwQRtrNHUNyTIrAsTU8DYAXaylByWUEMv/CBEuFQqlteG
	ZNG8JSlUV4p4tspljTvXmL7mCh9uCC8GVUE+b9sKe9VmkorX/XbOwcB7WotmU/f3/9neGyQnu8N
	mAXLav2o3bqc77DAw+iBLhpOQZyxUxVxQHIKngtIEw==
X-Google-Smtp-Source: AGHT+IHBv+07Nnp3XhzssPGS4IlJ2EGtp6wPyQ68swDninOyrBRb5Cqd19AhilpXVlYK1qnYpNTETg==
X-Received: by 2002:a05:600c:594f:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-4365c53d8a7mr18233595e9.0.1734598804402;
        Thu, 19 Dec 2024 01:00:04 -0800 (PST)
Message-ID: <d9beec69-a167-4768-9bce-5067ab18f0ad@suse.com>
Date: Thu, 19 Dec 2024 10:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviation for MISRA C Rule R11.8.
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <7e4f836606d72769a80299c5451f6f7241471d8a.1734530952.git.alessandro.zucchelli@bugseng.com>
 <d312a46a-238a-4fa3-84d7-4836c610c8ea@suse.com>
 <58439457588e585b08b48931e94754b2@bugseng.com>
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
In-Reply-To: <58439457588e585b08b48931e94754b2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2024 09:58, Nicola Vetrini wrote:
> On 2024-12-19 09:49, Jan Beulich wrote:
>> On 18.12.2024 15:25, Alessandro Zucchelli wrote:
>>> Rule 11.8 states as following: "A cast shall not remove any `const' or
>>> `volatile' qualification from the type pointed to by a pointer".
>>>
>>> Function `__hvm_copy' in `xen/arch/x86/hvm/hvm.c' is a double-use
>>> function, where the parameter needs to not be const because it can be
>>> set for write or not. As it was decided a new const-only function will
>>> lead to more developer confusion than it's worth, this violation is
>>> addressed by deviating the function.
>>> All cases of casting away const-ness are accompanied with a comment
>>> explaining why it is safe given the other flags passed in; such 
>>> comment is used
>>> by the deviation in order to match the appropriate function call.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>> ---
> 
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -393,6 +393,12 @@ Fixing this violation would require to increase 
>>> code complexity and lower readab
>>>  
>>> -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
>>>  -doc_end
>>>
>>> +-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a 
>>> double-use
>>> +function, where the parameter needs to not be const because it can be 
>>> set for
>>> +write or not"
>>> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest 
>>> doesn't modify.*$)))"}
>>
>> This is probably good enough for now, yet still: It constrains 
>> re-formatting
>> that we may want to do on such function calls. Personally I'd consider 
>> it
>> entirely unexpected if I ended up (re)introducing a violation just by 
>> re-
>> formatting one of those function calls to
>>
>>     return __hvm_copy(
>>                (void *)buf /* HVMCOPY_to_guest doesn't modify */,
>>                addr, size, current, HVMCOPY_to_guest | HVMCOPY_linear,
>>                PFEC_page_present | PFEC_write_access | pfec, pfinfo);
>>
>> yet aiui the pattern above would have this effect (I don't think .* 
>> matches
>> newlines; instead I expect such regex-es to be applied to individual 
>> lines
>> only). Thoughts anyone?
> 
> we can simply drop the "__hvm_copy" part from the regex. The regex can 
> be made multiline, or alternatively we can apply the search to a range 
> of lines. By default it searches on the same location mentioned by the 
> report, which in this case is the line containing __hvm_copy (range 
> defaults to 0..0). However I would leave it either as is or without the 
> __hvm_copy prefix.

Omitting the __hvm_copy part would again widen it too much for my taste.

Jan

