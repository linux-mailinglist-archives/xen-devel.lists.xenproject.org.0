Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A0885543
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 09:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696236.1086953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDUX-0001rg-VX; Thu, 21 Mar 2024 08:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696236.1086953; Thu, 21 Mar 2024 08:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDUX-0001pQ-SQ; Thu, 21 Mar 2024 08:09:37 +0000
Received: by outflank-mailman (input) for mailman id 696236;
 Thu, 21 Mar 2024 08:09:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnDUW-0001pI-7l
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 08:09:36 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a2063bb-e75a-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 09:09:34 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4675aaa2e8so87330166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 01:09:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x10-20020a1709060eea00b00a46d786365esm3143356eji.94.2024.03.21.01.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 01:09:33 -0700 (PDT)
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
X-Inumbo-ID: 5a2063bb-e75a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711008573; x=1711613373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnEU5bnbob7D1jOsrxnf1DoG8D9eQYmIIlXmEYTuG4E=;
        b=IgVtwCpqsCTR8ecdhZPnqyLiVvu7hGNafpG05JwvBmdSuXSSoIqZ/xmNqULtcMq7E/
         x9jV2Vw/13rEUsQNif0iopyJx8BmJzab4GFEtNQrAFF3KgslkXaa1tvVB29bfBm8/W1u
         nHfqa3jyk72wfaIAcGyFaZqbJO7tCI3Lvoi1fOwG6MH3FHh+JBFvz9zlozPPmv3NYIdW
         /Ev9fZv7iBZ39QybDPZxTtoeU/jwEN8hDFd+btbeixsnAr5N511swjQuobcQd/438G/O
         fbz3AHku7ME667uUOjYcN5GUT2qjvT9Sq2U5GOV2rYTnljeaMSND1daIay2/mKSzvrUf
         joMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711008573; x=1711613373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnEU5bnbob7D1jOsrxnf1DoG8D9eQYmIIlXmEYTuG4E=;
        b=SOGpE3T9sBtJ3heLqMNGh0JOqg2YLdmFQrZMLC9+4X1pwnuVEiOLIgmWRO833fQyCt
         AkMsXUaEVgskfprfTet8qP6WhXVcDkiwtmtruA58rA7onpsKVa3TxfmnCdpRKZ2dQGqt
         DqoAgVQU/J6cT0MlBctDfWyM+pfOPVItQBcL0BF/UCgiiAtsaO573XoHwvjzrH2uHQiB
         CKMHEKC/l3mZ4an6CUpWu9aqU3W3Q0QqTBLp4IXn7cqufiijwNUtHmmrsW5UWK0q4oxv
         Q8y0rNohXNVhBk3Sd6m/l3PLS6AnuSZtRi+kfnTXgzi6RhfVpsSmNjGwbLyfWqmV1sHn
         b//w==
X-Forwarded-Encrypted: i=1; AJvYcCXnJ2IM79w1DUDJX9el9Yw1cX2Sz+H0bBFz57hZXlDp3YgYMJ0my/n+Sn8kLwcuq34IwQjEyJnK5Qb5a+1mGjMe9gvIcVuWcNyUNsaZFW0=
X-Gm-Message-State: AOJu0YyJNQgUHJBFngSYIoHPKmIzmYFqp6LuhWuQAShurkqjH9i9Z4Ra
	Pd3fAh6l5m7rlRCMv6vyjzdFM9BGvj9MdqCbJJRHi4hpom5FMBHLQnDyhPklKQ==
X-Google-Smtp-Source: AGHT+IHrwG2y+1MErksYWgPeDSd56uAnfznUyDt7bWONAVan4dlhsy7njChSCPCl6TiN3ULKjKc0Rw==
X-Received: by 2002:a17:907:7d8e:b0:a46:ba8e:c22b with SMTP id oz14-20020a1709077d8e00b00a46ba8ec22bmr894977ejc.77.1711008573620;
        Thu, 21 Mar 2024 01:09:33 -0700 (PDT)
Message-ID: <d8b2bf3d-7656-4a60-9888-86755735e825@suse.com>
Date: Thu, 21 Mar 2024 09:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] automation/eclair: add deviation for MISRA C:2012
 Rule 17.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710923235.git.simone.ballarin@bugseng.com>
 <882b442c8c1f73f8116676ab9351defe5c9609ac.1710923235.git.simone.ballarin@bugseng.com>
 <9341a711-74c3-463f-8cc2-a54e19b4b2f4@suse.com>
 <alpine.DEB.2.22.394.2403201848340.1569010@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403201848340.1569010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 02:50, Stefano Stabellini wrote:
> On Wed, 20 Mar 2024, Jan Beulich wrote:
>> On 20.03.2024 09:50, Simone Ballarin wrote:
>>> MISRA C:2012 Rule 17.1 states:
>>> The features of `<stdarg.h>' shall not be used
>>>
>>> The Xen community wants to avoid using variadic functions except for
>>> specific circumstances where it feels appropriate by strict code review.
>>>
>>> Add deviation for functions related to console output (printk and similar).
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>> ---
>>>  .../eclair_analysis/ECLAIR/deviations.ecl     | 26 +++++++++++++++++++
>>>  docs/misra/deviations.rst                     |  5 ++++
>>>  2 files changed, 31 insertions(+)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 9ac3ee4dfd..7c3559a3a0 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
>>>  -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
>>>  -doc_end
>>>  
>>> +#
>>> +# Series 17.
>>> +#
>>> +
>>> +-doc_begin="Functions related to console output are allowed to use the variadic features provided by stdarg.h."
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
>>
>> This isn't concole output related.
> 
> Should we say "related to console output or tracing" ?
> 
> 
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
>>
>> These three and ...
>>
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
>>
>> ... these three aren't either.
> 
> Maybe it is better to write it as:
> 
> "Functions related printk, logging and tracing are allowed..."

How about simply saying "printf()-like functions"? In what you suggest,
sprintf() and friends would still not be covered.

Jan

