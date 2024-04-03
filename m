Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEC896E84
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 13:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700495.1093758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzBv-0003w5-9S; Wed, 03 Apr 2024 11:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700495.1093758; Wed, 03 Apr 2024 11:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrzBv-0003tf-5b; Wed, 03 Apr 2024 11:54:07 +0000
Received: by outflank-mailman (input) for mailman id 700495;
 Wed, 03 Apr 2024 11:54:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrzBu-0003tZ-9b
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 11:54:06 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de4f33a4-f1b0-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 13:54:04 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-416254f2312so1701555e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 04:54:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b00413eb5aa694sm21401196wmo.38.2024.04.03.04.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 04:54:03 -0700 (PDT)
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
X-Inumbo-ID: de4f33a4-f1b0-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712145244; x=1712750044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ac1nCRLJzIkJPYlolYpu43UN/U6/d09aEgVTr4LxfDQ=;
        b=FANczhlRYFSk0/997OXW95UR/1XkmoTFPwUnBNxncFCcdr85ZlIlFvhijelbOnbO1k
         yvSJQFLpOWJuANRU3RbVp9P86skF8tnhOcB9/mv0kaiwfE85RIChipe+dKbOhX5atMgm
         K2+G+92khIc/XXmp2kNHkhshvKWfAI7St3gXhHO31TGE0HsTf2xpKAa/43QViJR1wPrB
         hZsWRw/P9Hy2pBtEfliIyxA+IPTX5O6yFPN6dQ03i5lUwSscDEDCD4VRDI2btPwmla0b
         TDXl9ZlGdsBWtcnzfFKlt9snEm73/EZ18cMv/Yvgd1GmEv596v+/AYALnwkif343q9OH
         VSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712145244; x=1712750044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac1nCRLJzIkJPYlolYpu43UN/U6/d09aEgVTr4LxfDQ=;
        b=G0JyioBc4KsNWIGEXrtFkGG3b14U5iN9AijFl/O/eNQxUDFbr6937P5SmdR5Jd+x7Q
         2l8VO6K52eYuY2YPSFg/JyEjYtUYVLqnBtApD3js+QfCLs4PhYtCbCNY7z/U0w1H5p4v
         XUwt8lW/jkW4L4u2Rjj6KW+SyKtnRp414clPfMAZfQQQfLag+bHUlmWMUYK6MJHgJg9B
         vtwt1q/vsZzSgIBQDMkZYPPmaA9jRh5tqM52KxPnfOB4QABjTP1n2ZT6uZuj55Xhuz0o
         KReuAy3VlW3ZmCGWor0FfsqBhv1OqAAEhYAmu0pi5E8IMVPORrN5Hp1mVD2mSdGCRfHE
         6NMA==
X-Forwarded-Encrypted: i=1; AJvYcCU2EYH0WArkxgCg+0W/Bx6TFHUjiAXSGPoB1NXygutHY66Z9U3z+0pqPZ33OvRplk0CKnPO43Oij2NeOegMCsPPGXb984C8CqcXMmBLFyQ=
X-Gm-Message-State: AOJu0YyRZITMdJKHpxwF2fCFsqDtSLntUmY63qa9AcTAhWh6iJss4+6X
	kHHdUopjzN25+RjfKF4ncuGuEp3rg69rSuFP9yk6hNH4y3qjmOOc6TxM0FZHvg==
X-Google-Smtp-Source: AGHT+IFridJIaqsdJWailYwm5lIZVriSU8n2O15d73SqH+o8wdXHfuT81x3McmAZlcDFb9L2XuSzNg==
X-Received: by 2002:a7b:ca46:0:b0:414:9072:98dc with SMTP id m6-20020a7bca46000000b00414907298dcmr14745624wml.41.1712145243874;
        Wed, 03 Apr 2024 04:54:03 -0700 (PDT)
Message-ID: <3b8ec757-d2f3-4143-a843-de8c6d51944d@suse.com>
Date: Wed, 3 Apr 2024 13:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <f2b596e6-0aec-4948-ad7a-aa38adaa7dcc@suse.com>
 <3aa0893b-7efd-4ca1-a405-e897edc7402f@apertussolutions.com>
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
In-Reply-To: <3aa0893b-7efd-4ca1-a405-e897edc7402f@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 13:50, Daniel P. Smith wrote:
> On 4/3/24 02:52, Jan Beulich wrote:
>> On 03.04.2024 08:16, Jan Beulich wrote:
>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>> and it's not acceptable to short circuit the XSM on the matter.
>>>
>>> I can certainly accept this as one possible view point. As in so many cases
>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>
>> Further to this: Is there even a way to express the same denial in XSM?
>> alloc_unbound_xen_event_channel() doesn't specifically "mark" such a
>> channel, and (yes, it could in principle be open-coded in Flask code)
>> consumer_is_xen() is private to event_channel.c. I also dare to question
>> whether in SILO mode status information like this should be available.
> 
> To build on the previous response: if the natural failure return value 
> is -EACCESS in response to a domain resource access attempt, then the 
> probability is extremely high that it should be implemented under a XSM 
> hook and not hard-coded into the resource logic.

Possibly. But first of all - could you answer the earlier question I raised?

Jan

