Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDD1886E36
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 15:12:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696903.1088117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfct-0003az-Q0; Fri, 22 Mar 2024 14:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696903.1088117; Fri, 22 Mar 2024 14:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnfct-0003ZS-NA; Fri, 22 Mar 2024 14:12:07 +0000
Received: by outflank-mailman (input) for mailman id 696903;
 Fri, 22 Mar 2024 14:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnfcr-0003ZM-Rz
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 14:12:05 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 283e4783-e856-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 15:12:03 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a47062136c0so272994566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 07:12:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ww9-20020a170907084900b00a4721dd8063sm1022951ejb.172.2024.03.22.07.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 07:12:02 -0700 (PDT)
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
X-Inumbo-ID: 283e4783-e856-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711116723; x=1711721523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03iaJSx5gKNAx+dpX987/CTQrY1R8zCc7N+ZGoxeKY4=;
        b=PUyQEAMVdgqK0gaSgexC9X6CcAMMzjET0SkMdVyQJ50QTQ8DHOKcmVRbD30qkmKaCx
         PfU7/m5SbWLCmjHId40npBhiOdsYMQtZoz2U9NfqEDsOa1aupANi2VLudbkZQv9gtkjG
         ztJRL/cXydonykXg/yfMzUugApPmaN9iXvd/YGremqdqfHVLqjqR+LB1B3KVneMznQQJ
         odj2Ds+vKmH7GHKPU2QUKzKIvgiSzERCmZFJkrx5rWacEw4pDmLmWlCTzRvwqnIWKWWK
         1+LcABbp9Y0QrZ5Ph/jR51vjHlZMvz7O8aq+BuZspchd/LNRwHqy6acNvX8wFVks/6PD
         5aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711116723; x=1711721523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03iaJSx5gKNAx+dpX987/CTQrY1R8zCc7N+ZGoxeKY4=;
        b=TDKCTwdDK4RKzMuiOqBmnlpuluFdM6EsgVbXMnKW3+0o1lTmvlTOmEqcc+PTOVTmf8
         UFqKZgi32RRSKuu81ADG8IW2bNbDdzxQ/DmZ+Fb2umpVlqD510aKj78fwGc31T/SXXIH
         1/uUi8yxADX2bTtfBukiQ8eoOyDouyYFvgDIBNB72fcMYUviE68Jf87Z2hNIXLw9D1iJ
         +RuRq1vnYo2rIx8S8/icsp9v/1uvST0MuofQ5i2z+E4N4C2DjQybcclRi+hurM3tQ4mY
         xHHow0wdeh8braeBPz2vu5XNKkp75OVxkPfrARmNEf6JaaL0aGY+MDYOKwaVERI2F4Yl
         Mm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEvCtcgBh21bmEmKt+x4BpDbYVAFYV9W6ZYFzGPJ+Q9AnMJERo5FrhLM2FFlI0n3unBbH3UYaiuOKkil+zKjoFy6TacNlahGZ7AYBVcKs=
X-Gm-Message-State: AOJu0Yxsu2C2Bna2cFBW3Qrvim15KBxV97lidyZjudSQw9kUescXTRRn
	b5oiQcqnPa4IXb0YR7Soo9l54o00xuXepBHX51VhhwkI/rRNiRT7fibnX97JHQ==
X-Google-Smtp-Source: AGHT+IFFMH6b7d7E+xFTz0eNYQsPZEiGPevAN5wAgSvZYQTgk+Pv/f788HjRzcgQnMCeDCQhA7XAKQ==
X-Received: by 2002:a17:906:2310:b0:a46:bd1d:d9c9 with SMTP id l16-20020a170906231000b00a46bd1dd9c9mr1837025eja.31.1711116723061;
        Fri, 22 Mar 2024 07:12:03 -0700 (PDT)
Message-ID: <60181473-501a-4f17-ac11-e1598ead8b29@suse.com>
Date: Fri, 22 Mar 2024 15:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] automation/eclair: add deviation for MISRA
 C:2012 Rule 17.1
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1711096695.git.simone.ballarin@bugseng.com>
 <dc3c8f2913a9efd54767828bf11fc5767afbbfa5.1711096695.git.simone.ballarin@bugseng.com>
 <9c6f4afd-00af-41f0-86dc-4f4558cb739c@suse.com>
 <7b5bad43-88f2-4d91-abc4-6b527446cb4a@bugseng.com>
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
In-Reply-To: <7b5bad43-88f2-4d91-abc4-6b527446cb4a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 14:44, Simone Ballarin wrote:
> On 22/03/24 10:44, Jan Beulich wrote:
>> On 22.03.2024 09:46, Simone Ballarin wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
>>>   -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
>>>   -doc_end
>>>   
>>> +#
>>> +# Series 17.
>>> +#
>>> +
>>> +-doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
>>> +-config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>>> +-doc_end
>>
>> Repeating v1 comments which weren't addressed> 
>> Is there a reason xyzprintk() are all listed individually? Surely if
>> we'd introduce a new flavor, we'd want that excluded too.
>>> {,g}dprintk() in neither of their incarnation use any of the va_*
>> items listed. Why do they need mentioning here?
> 
> What do you mean with "xyzprintk()"? Maybe you mean a regex-based
> deviation using ".*printk\(.*\)"?

Regex or globbing, whatever is available.

> That would unnecessarily deviate "{,g}dprintk()" as you said.

Depends on how the regex would be written.

> Moreover, to cover also "vprintk_common", we would instead need something like
> "^.*printk.*\(.*\)$".

Or simply accept that such outliers need listing individually. That
would imo still be better than a dozen entries.

> I'm fine in using "^.*printk.*\(.*\)$", I just preferred the individual
> whitelisting to avoid unwanted exclusions.
> 
> P.S:
> using regex I cannot match only the name, but I have to match
> the entire signature.

Interesting. Is that a tool limitation?

Jan

