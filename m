Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7E827213
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 16:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663578.1033570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrA4-0008B2-RP; Mon, 08 Jan 2024 15:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663578.1033570; Mon, 08 Jan 2024 15:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrA4-000893-NC; Mon, 08 Jan 2024 15:03:32 +0000
Received: by outflank-mailman (input) for mailman id 663578;
 Mon, 08 Jan 2024 15:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMrA3-00088x-EJ
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 15:03:31 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1599c091-ae37-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 16:03:30 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so19572341fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 07:03:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d9945000000b007b3e503d59csm2246274ios.47.2024.01.08.07.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 07:03:27 -0800 (PST)
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
X-Inumbo-ID: 1599c091-ae37-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704726210; x=1705331010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWUAbNYAO2+Spgxj6aL5izZjrXw75y0lx8J6TlelOLs=;
        b=AVMFYRPIu6+3XYoCkaaEF87N0obVvWRWnIKC+IErxeBwOTrf4msuiv1Hx8A66rUg/4
         vfMwpr+bazRVPspF/7/h3R/JrrUF0+Moru/aFAQa2X2bt6dFthpaf5nUIzk2TlLRCQDq
         R6QBri4yJtiYi1v7Z5B21hhdcbtZRzquca10P+53FeLvdsh1APxRShe+jBbIFzU5b5nF
         yEk1NPP2f0QlKqkc+FS8ES81tVJ65qo1acVIXE3AMtyceLnzspGjwTknF+F0hN/Jt5Ui
         OOGD25sHHcEQfdv+hGXApefxZQCiW5VbY5L9tl48ltb/8Q55BsPv5ufoW4Op91AxKiU/
         2gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704726210; x=1705331010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWUAbNYAO2+Spgxj6aL5izZjrXw75y0lx8J6TlelOLs=;
        b=c5hplexokRfLl9KymRgMuEjDXkKCQ1ufHIKqupN8QDlQb0jbRiq6Xi2L4t9e71yk1h
         1yEZ5YqhGr0I0vLo1rBBP048XdGChhVwppUa29Zt/afxGoVmv6grsHeXD6op5VY07BXS
         It7ung1IDltl1BveIqj1HBVSf/5tzRK5bPU5nr/dULD2wErcNhBVbdyfbGCmeJPXVHI6
         700iBYVmGlD+Z6GVHRp05frv1OKiwOHRkZO+jaQCvvvL9EdyUkz8frVbee+Wa5waY0am
         ZnXt7vOxXlFkAGFly7wqH6lORfh/rKXepwQJkZPYLyLL8jX+iIrg7lYOdOOIp4oX6hCf
         SMmw==
X-Gm-Message-State: AOJu0YyVt1PvIBzD1v+8wM7HFkHURn5fJpajEkhyXO9tmbOVfhDbD4GQ
	t4Hl0C9wtas6GEmfUyPLBJYZeT4Nr7Mh
X-Google-Smtp-Source: AGHT+IF2h1TzYmYYHPeA+/Ip2xaMJQ8IT/Rphrwz+rUsX0vWk32WRKHggMcz7vWxOSQwDWwRGdMyIg==
X-Received: by 2002:a2e:9645:0:b0:2cc:56b9:73e3 with SMTP id z5-20020a2e9645000000b002cc56b973e3mr1440120ljh.65.1704726209200;
        Mon, 08 Jan 2024 07:03:29 -0800 (PST)
Message-ID: <88b36324-a2f9-4cc7-a727-7546818a735d@suse.com>
Date: Mon, 8 Jan 2024 16:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: limit first_valid_mfn exposure
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <224db25e-bd4c-4415-aff8-6ff3e84343d8@suse.com>
 <a99d9d1a-2395-4771-95f3-5dab64e10ce7@xen.org>
 <0872306a-fefb-424b-b27a-b67ba21828c7@suse.com>
 <829125ea-c220-47e9-a9f4-343126787f27@xen.org>
 <6889e19d-c6d4-43f0-9752-738d2a54e311@suse.com>
 <f54bd4a4-0bc6-490d-a990-46c62b0d10a3@xen.org>
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
In-Reply-To: <f54bd4a4-0bc6-490d-a990-46c62b0d10a3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2024 15:57, Julien Grall wrote:
> Hi Jan,
> 
> On 08/01/2024 14:47, Jan Beulich wrote:
>> On 08.01.2024 15:13, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 08/01/2024 11:43, Jan Beulich wrote:
>>>> On 08.01.2024 12:37, Julien Grall wrote:
>>>>> On 08/01/2024 11:31, Jan Beulich wrote:
>>>>>> Address the TODO regarding first_valid_mfn by making the variable static
>>>>>> when NUMA=y, thus also addressing a Misra C:2012 rule 8.4 concern (on
>>>>>> x86).
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> Julien suggests something like
>>>>>>
>>>>>> STATIC_IF(CONFIG_NUMA) unsigned long first_valid_mfn;
>>>>>>
>>>>>> but I view this as non-scalable (or at least I can't see how to
>>>>>> implement such in a scalabale way) and hence undesirable to introduce.
>>>>>
>>>>> I don't really see the scalability problem. Can you explain a bit more?
>>>>
>>>> Well, when seeing your original suggestion, I first considered it quite
>>>> reasonable. But when thinking how to implement it, I couldn't see what
>>>>
>>>> #define STATIC_IF(cfg)
>>>>
>>>> should expand to. That's simply because a macro body cannot itself have
>>>> pre-processor directives. Hence all I could think of was
>>>>
>>>> #ifdef CONFIG_NUMA
>>>> # define static_if_CONFIG_NUMA static
>>>> #else
>>>> # define static_if_CONFIG_NUMA
>>>> #endif
>>>> #define STATIC_IF(cfg) static_if_ ## cfg
>>>>
>>>> And I think it is easy to see how this wouldn't scale across CONFIG_xyz.
>>>> Plus that that point STATIC_IF() itself would be pretty much redundant.
>>>> But maybe I'm simply overlooking the obvious ...
>>>
>>> You can use the same trick as for IS_ENABLED. The code below will select
>>> static or nothing:
>>>
>>> #define static_enabled(cfg) _static_enabled(cfg)
>>> #define _static_enabled(value) __static_enabled(__ARG_PLACEHOLDER_##value)
>>> #define __static_enabled(arg1_or_junk) ___static_enabled(arg1_or_junk
>>> static,)
>>> #define ___static_enabled(__ignored, val, ...) val
>>>
>>> #define STATIC_IF(option) static_enabled(option)
>>>
>>> I have tested both with CONFIG_NUMA and !CONFIG_NUMA to confirm the
>>> visibility of the variable will be correct.
>>
>> Hmm, okay. Then my 2nd scalability concern, in another dimension: What
>> if static-ness ends up depending on two (or more) CONFIG_*?
> 
> Do you have any concrete example where this would be useful? If not, 
> then I suggest to go with this solution and we can cross the bridge when 
> we have an example.
> 
> We don't have to solve everything at once and at least with the approach 
> I proposed we can start to use STATIC_IF() (or EXTERN_IF) a bit more 
> often without open-coding it.

Well. IS_ENABLED() is okay in this regard because you can combine
multiple of them (with && or ||). The same isn't true here (afaict).
After all I could equally well say that as long as we don't have
a sufficient number of such examples, but just one, not introducing
a special construct is going to be okay for the time being.

Jan

