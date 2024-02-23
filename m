Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C06860B6F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 08:43:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684653.1064654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdQDR-0005OF-SO; Fri, 23 Feb 2024 07:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684653.1064654; Fri, 23 Feb 2024 07:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdQDR-0005LY-Pi; Fri, 23 Feb 2024 07:43:29 +0000
Received: by outflank-mailman (input) for mailman id 684653;
 Fri, 23 Feb 2024 07:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rdQDQ-0005LS-BJ
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 07:43:28 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a6b21c9-d21f-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 08:43:26 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563b7b3e3ecso572754a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 23:43:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 da16-20020a056402177000b00564e4debe29sm2517408edb.78.2024.02.22.23.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 23:43:25 -0800 (PST)
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
X-Inumbo-ID: 3a6b21c9-d21f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708674205; x=1709279005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7HsQO81s/fhD77QVQwHTCJVNUl5T8w6MyX423vUmDg=;
        b=cuvwuLzABNJmxEyEYrBO395PhshU/qetcYVtdkorRnfQUF+7LZe6m3d2xs+cxv8MMp
         MdWv6r5LwYG+J8XtHfnUGrzFn4zFqBW4lCLMOHFNNVBQiRuMJITW82AEBlUd4JQMFhKS
         gWsZJu8nsg/CWE2Z+j7m9ENPjnHZvJHAa9/hmbkpZlsx23nXvq6UzXif1bspXlFizW1K
         sDgJhlxxJOnMF2LGr9NZMnKm++U82cGTwxK2CooIyjGUvA0bCa3iyHu3YaHjhTCLMj+t
         pvtrvA8XXqnZ6Pbl91rTEhvIY3W+fwBbbJdTcd+lGPySl+BTlGc7Po/L1K1fuInDapeu
         f+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708674205; x=1709279005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7HsQO81s/fhD77QVQwHTCJVNUl5T8w6MyX423vUmDg=;
        b=suUDMaAx7WFuFfsEGqT/q7URE1N+IZLixYgHSExj7j4YsNc1E9bNcquj2rgxkoXhKW
         iJ3U2ia+gcW/xqsyQsKN131a6DOY1myCxHVNWkAs8O4LzJ7zde1CyDTRZ3myrVcZ+IaV
         wjW5ViW9ixYSz9xfqxl7+/7P6ICPGYq07HIG1WzGY//NI4/wDMTnNArJJHUoj403hFJZ
         OghvZg9oH04SySe2Eu1kS2rVk1RIC2T11/bm8znpXmnLiTvN6AXvn4FidTx1ExcFTaLm
         aTM58opY2Ci7NNVwn2Ah0zmP8US81c8PqkiQgU077ndEPHpMC0q+NWppXFF1B/DFa6Gd
         ZbpA==
X-Forwarded-Encrypted: i=1; AJvYcCVWCVEURBDmRampV2kSlsa1LR102VYFG6dpAjDrj4j6XYPVcVT371fLG2/UqFigGaOXEATiE/CZTlQ0FM0/xe420qy/CviRptLsoS70P+c=
X-Gm-Message-State: AOJu0Yy63GDDaxdTiRizTtNXJRplBiAYisnJfVNiQtj/Chvf84WH6aah
	upI+HPNqAptaLn5i5X84+zTH6DJW+YjXNfRJM9TRT1Hwtw0erQVmz+DpO4DO2w==
X-Google-Smtp-Source: AGHT+IHfBWxBo4rWvgTMPqfQ6qvGftE8tA46rGuCuKHtT4T9sFBA31ibVrLSST45Q6VBuvvkwEPyxw==
X-Received: by 2002:aa7:d50a:0:b0:564:b822:9204 with SMTP id y10-20020aa7d50a000000b00564b8229204mr613516edq.17.1708674205655;
        Thu, 22 Feb 2024 23:43:25 -0800 (PST)
Message-ID: <2f68276d-0b10-4cec-8636-5456314c194e@suse.com>
Date: Fri, 23 Feb 2024 08:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-2-roger.pau@citrix.com>
 <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com>
 <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
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
In-Reply-To: <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 19:03, Tamas K Lengyel wrote:
> On Thu, Feb 22, 2024 at 5:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 22.02.2024 10:05, Roger Pau Monne wrote:
>>> The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
>>> can be achieved with an atomic increment, which is both simpler to read, and
>>> avoid any need for a loop.
>>>
>>> The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
>>> instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit ...
>>
>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>> @@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct page_info *pg)
>>>
>>>  static shr_handle_t get_next_handle(void)
>>>  {
>>> -    /* Get the next handle get_page style */
>>> -    uint64_t x, y = next_handle;
>>> -    do {
>>> -        x = y;
>>> -    }
>>> -    while ( (y = cmpxchg(&next_handle, x, x + 1)) != x );
>>> -    return x + 1;
>>> +    return arch_fetch_and_add(&next_handle, 1) + 1;
>>>  }
>>
>> ... the adding of 1 here is a little odd when taken together with
>> next_handle's initializer. Tamas, you've not written that code, but do
>> you have any thoughts towards the possible removal of either the
>> initializer or the adding here? Plus that variable of course could
>> very well do with moving into this function.
> 
> I have to say I find the existing logic here hard to parse but by the
> looks I don't think we need the + 1 once we switch to
> arch_fetch_and_add. Also could go without initializing next_handle to
> 1. Moving it into the function would not really accomplish anything
> other than style AFAICT?

Well, limiting scope of things can be viewed as purely style, but I
think it's more than that: It makes intentions more clear and reduces
the chance of abuse (deliberate or unintentional).

Jan

