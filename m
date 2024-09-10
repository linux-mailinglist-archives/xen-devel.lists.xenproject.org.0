Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC69733F3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795314.1204600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyEe-0003pp-Be; Tue, 10 Sep 2024 10:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795314.1204600; Tue, 10 Sep 2024 10:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyEe-0003mn-8U; Tue, 10 Sep 2024 10:36:36 +0000
Received: by outflank-mailman (input) for mailman id 795314;
 Tue, 10 Sep 2024 10:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snyEc-0003mh-VW
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:36:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c0b3869-6f60-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:36:33 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so5814134a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 03:36:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c61240sm461709066b.133.2024.09.10.03.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 03:36:32 -0700 (PDT)
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
X-Inumbo-ID: 8c0b3869-6f60-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725964592; x=1726569392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3qO3AnhqEMS2Kbw7j2DwQl9O1sQ0wtFXso1l1jiGGZs=;
        b=b1U6kqZRVH8T4QNuhLnhBEQMcDHdi750NJ51dLkoZhMbbfixx3wiM8/w9mKBrbhwIr
         PPbwXXY+sXMUpGyM+9CMYMdwIMdq4DU2IWC8oTqRjq4cEusnrLw9Z5O2Br26ZigLTTzJ
         g/lEszwXXKbIgurFvtFqW85HoXmroiiwPBVw++si0wQYGikSWMuina/O+4mxduruBnYB
         ycUo+36nMz9rYRqUSzfVQYKAMxrmKPiqBpxIjSamx4kWopdMW7sx3dDaP80PIhw1SIOr
         zpJpHWK/b87kFvWDNLDFl55VpAgc0SMx5heczDZcD0iFCVZFRoe0cjFzKWimU2FiAr1t
         PwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725964592; x=1726569392;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qO3AnhqEMS2Kbw7j2DwQl9O1sQ0wtFXso1l1jiGGZs=;
        b=O9Y/DMRoKZuQnRMymq1l8PC1yIR32xzYUvDhOu4QIxG8i2qIcQUK5dScJrjGwt0PVh
         fAI5Xqq35xXKpNEgCiHLYvAXVEt7hYvAZknOmyE+iAVLaZ5CDFXAu7dfhmxV7BPoKVnO
         aDfig4+HgIyt/uHuPcaA5n8vrnvM0OfuNo9w/KAq2VD/hFLrV9TH8H6rnbynBLhVO2Bg
         HzvpnwRE3Y52D74wIsMwN7GY3V8zybjtFKRhNRKBde6cmSedrYfzymBnNjMic8vU5L+n
         7mVO6sjFfl0oatkmHNuDpJfqONoz+jW99i9j0ya1axJxCQBC/M/KTLbeDZzadZd9wbvW
         r5IA==
X-Forwarded-Encrypted: i=1; AJvYcCVCFhYAYcFOkGKZnSpo5nmQowu8i5ZyndMPhLVKFj2zDYy3hsjNV1pB09Yth8CIq5bHmSkW1u9c7FE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykoEVPlw1kvIIl00HfT/4NqqZtipPWeB/pDKHxbO+L9E9Qyr3j
	e/CuKGQZADt/K7pyeXA/CncTs9aj4uqWqh4zuHKp+ydKlLseM0mfCBxx5Wy37A==
X-Google-Smtp-Source: AGHT+IEtM/Fzttow5EbkyNvKQTzV2mzsxSnuuCjZUmpTvKE3tysPHQxX7/nUz0WnJjsb8jBYDjVnfA==
X-Received: by 2002:a17:906:7951:b0:a8d:60e2:3972 with SMTP id a640c23a62f3a-a8ffaadace8mr32293166b.23.1725964592292;
        Tue, 10 Sep 2024 03:36:32 -0700 (PDT)
Message-ID: <da7f6320-06e1-42f0-b507-cf1ec9415568@suse.com>
Date: Tue, 10 Sep 2024 12:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86: p2m-pod: address violation of MISRA C Rule
 2.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <43b3a42f9d323cc3f9747c56e8f59f9dffa69321.1719556140.git.nicola.vetrini@bugseng.com>
 <38b57a6f-187c-440a-b3b4-9e7e124e1802@suse.com>
 <25b6a974b7c9aaec32b11930168148a5@bugseng.com>
 <4e54f8e0-43ce-4dd6-b1b4-cf72b59d96be@suse.com>
 <1a139b44effdeefab6b3e0ee7ae0c43d@bugseng.com>
 <38c34b50-56a5-498a-8ed6-d57a8f02a964@suse.com>
 <3f3f43e894a2b9e506dcfba38a578880@bugseng.com>
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
In-Reply-To: <3f3f43e894a2b9e506dcfba38a578880@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:17, Nicola Vetrini wrote:
> On 2024-09-10 12:03, Jan Beulich wrote:
>> On 10.09.2024 11:53, Nicola Vetrini wrote:
>>> On 2024-09-10 11:08, Jan Beulich wrote:
>>>> On 10.09.2024 10:56, Nicola Vetrini wrote:
>>>>> On 2024-07-01 10:36, Jan Beulich wrote:
>>>>>> On 28.06.2024 08:30, Nicola Vetrini wrote:
>>>>>> This being about unreachable code, why are the domain_crash() not 
>>>>>> the
>>>>>> crucial points of "unreachability"? And even if they weren't there,
>>>>>> why
>>>>>> wouldn't it be the goto or ...
>>>>>>
>>>>>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>>>>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>>>>>> @@ -1040,6 +1040,7 @@ out_unmap:
>>>>>>>       * Something went wrong, probably crashing the domain.  Unmap
>>>>>>>       * everything and return.
>>>>>>>       */
>>>>>>> +    /* SAF-8-safe Rule 2.1: defensive programming */
>>>>>>>      for ( i = 0; i < count; i++ )
>>>>>>>          if ( map[i] )
>>>>>>>              unmap_domain_page(map[i]);
>>>>>>
>>>>>> ... the label (just out of context) where the comment needs to go?
>>>>>
>>>>> Because of the way this rule's configuration work, deviations are
>>>>> placed
>>>>> on the construct that ends up being the target of the 
>>>>> unreachability,
>>>>
>>>> What's "target" here? What if this loop was removed from the 
>>>> function?
>>>> Then both the label and the domain_crash() invocations would still be
>>>> unreachable in debug builds. Are you telling me that this then 
>>>> wouldn't
>>>> be diagnosed by Eclair? Or that it would then consider the closing
>>>> figure brace of the function "the target of the unreachability"?
>>>
>>> Exactly, the end brace is a target to which the "function end" 
>>> construct
>>> is associated.
>>> It would be kind of strange, though: why not just doing 
>>> "domain_crash();
>>> return;" in that case?
>>
>> Sure, the question was theoretical. Now if "return" was used directly
>> there, what would then be the "target"? IOW - the more abstract 
>> question
>> of my earlier reply still wasn't answered.
>>
> 
> The return statement in
> 
> ...
> domain_crash();
> return;
> <~~~~~>
> 
> Whichever statement is found to be unreachable in the current 
> preprocessed code.

Yet then again: Why is it the return statement and not the function call
one (really, it being a macro invocation: the do/while one that the macro
expands to)? That's the first thing that won't be reached.

Jan

