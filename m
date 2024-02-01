Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28611845B06
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 16:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674501.1049470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYlK-0004nr-Ch; Thu, 01 Feb 2024 15:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674501.1049470; Thu, 01 Feb 2024 15:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVYlK-0004lm-9a; Thu, 01 Feb 2024 15:13:58 +0000
Received: by outflank-mailman (input) for mailman id 674501;
 Thu, 01 Feb 2024 15:13:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVYlI-0004lb-FB
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 15:13:56 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 840f4193-c114-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 16:13:55 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d051fb89fbso14707001fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 07:13:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fd12-20020a056402388c00b00557d839727esm6884848edb.7.2024.02.01.07.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 07:13:54 -0800 (PST)
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
X-Inumbo-ID: 840f4193-c114-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706800435; x=1707405235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aXKi7HcGOdYt1N8wDuA8yYqEyLVPLGkiW5x+mctbQnA=;
        b=bWkIisqtI5SzalPgEt5kCQ7YohYzKYzey2y5EKPQzdI4TmcfSk7Pm1rChK9jdqIZQS
         KVJc7PR3SQVxBggJUm59TqBUf5sPLow3leh86El51BpRRKdHSCvSHZ+OCb5l/QXUCgV8
         JNfWAjoRdibA4PclPlMOgsTSJnSm+6gw+neHEsfH8ap999y5KO2c0mtJD6yv0bXS034A
         kA9uH2jPS5qOaZiVP1TbgNjduI9kKrU83lelUBydZfEtwPCsSioY1h2Dgtteg5oGzgHb
         CIO2zOU5O5+CxcR4V3vK2PZdls2anfjYS3R4AM8X8oobWlQbRB/ispLWVu9LXb07SYrE
         TccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706800435; x=1707405235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXKi7HcGOdYt1N8wDuA8yYqEyLVPLGkiW5x+mctbQnA=;
        b=MUz7CIGyy3LJhuyH0jsr+2C/kIHzQHcPaNXZYrwhCu/tl+ICjiucP+FgpOEWCy8PhL
         MWoO5bCud2ex+ai6u4arHMXVEpGGQzJl+OO7cFCHFPJaI1WjRTA1DQud7cE2QD/tUQpC
         JgyggVXB0sFviGJipPA2llxP2+Sg6bj4qQkU/8lDfbcUc4f9etdz0ywweUt0KlGwboxQ
         R99lk4wA3skc6sVYGZ69S8pq69DHiajqwK2NlMI+qTNEgTYFsDo1d4tKs60FQsJfnugh
         +t29EGKh3fkbdrZjJpndye9/y3EVLLpG3EMXlA76O9Sfn5FI/1s3q2gr69v5Jn+My3Lz
         b06w==
X-Gm-Message-State: AOJu0YwXec05dMGqoiVFRJ4eRWa3f+0W24HlAqEHhZ9WDwPGNSmTYxOd
	q+yfVTiwWFnXdXIb9rn1Kl5shxPTI2avACSfRVnczO+WVF7mp0z9CpWpp5lX1w==
X-Google-Smtp-Source: AGHT+IEwSjCvoaggmdb4kXFYQ3RqVlua5qOImD5wc0V+Ei6g/Qsou0fiRFdsxrx/AZH+QvWRLeq67A==
X-Received: by 2002:a2e:9858:0:b0:2d0:438d:fb2b with SMTP id e24-20020a2e9858000000b002d0438dfb2bmr3924988ljj.33.1706800434948;
        Thu, 01 Feb 2024 07:13:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXCnKVNGws8gZYP1EY2/PjY6v/uPpFtl6vBpS+NUH7YIylRcIrznKZsk39x9ci+NlSxlAgPIS01v9xRBuDifvM23uRKe+uP7rZN2W0MVQnREkGVJJQ0NuNRmqChVhrtl6q3tfWTvoLzR8r84dAFz0OQrgB/df9I4jdimor7gKgAp7GgTg10I/54TdqZaS76eT0t/PnZTx91S7FnK5py6w7YDBrqVomlnlrRuaxkOaHbhzqUE7uEGtw=
Message-ID: <246c970c-7fad-4842-8305-bcee78a52843@suse.com>
Date: Thu, 1 Feb 2024 16:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-10-carlo.nonato@minervasys.tech>
 <8a3f3c38-b290-417a-86cb-216e36182abe@suse.com>
 <CAG+AhRU5Yhz_VF02CfaFD5ifvw8cUQbsM7-UiMcRWm+1LR4btg@mail.gmail.com>
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
In-Reply-To: <CAG+AhRU5Yhz_VF02CfaFD5ifvw8cUQbsM7-UiMcRWm+1LR4btg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.02.2024 15:49, Carlo Nonato wrote:
> On Thu, Feb 1, 2024 at 3:24 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> PGC_static and PGC_extra are flags that needs to be preserved when assigning
>>> a page. Define a new macro that groups those flags and use it instead of
>>> or'ing every time.
>>
>> While here you say where the "preserving" applies, ...
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -157,6 +157,8 @@
>>>  #define PGC_static 0
>>>  #endif
>>>
>>> +#define PGC_preserved (PGC_extra | PGC_static)
>>
>> ... nothing is said here. From the earlier version I also seem to recall
>> that the constant was then used outside of assign_pages(). That would
>> then mean amending whatever comment would be added here.
> 
> Yes, but it was used in places where the name didn't fit (to stop merging in
> free_heap_pages()) and so I thought it would've been better to use the
> constant only for one of the two concepts: only for preserved flags in
> assign_pages().
> 
> Are you suggesting adding a comment to this #define to clarify its usage?

Yes. Albeit if I understand the earlier paragraph right, you don't use
it further (anymore). In which case the question would be: Is the patch
still needed, and if so is it rightfully part of this series?

Jan

