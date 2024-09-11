Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB1F9754EF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 16:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796677.1206427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNya-00016f-F5; Wed, 11 Sep 2024 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796677.1206427; Wed, 11 Sep 2024 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soNya-000158-CM; Wed, 11 Sep 2024 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 796677;
 Wed, 11 Sep 2024 14:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soNyZ-000152-Gn
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 14:05:43 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee009e0a-7046-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 16:05:41 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so541294366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 07:05:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c727fcsm615515966b.119.2024.09.11.07.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 07:05:36 -0700 (PDT)
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
X-Inumbo-ID: ee009e0a-7046-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726063541; x=1726668341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WhLYI+WH2rjAQ15cEzLwb0tlF+B4QF8tQmpD1iXPMtg=;
        b=ZwkxLZuduPha556fc080XUhEHSXgDG5ejoW7aqahKgImTrb44sa+XrEEoN/IYQAxsZ
         MDojxjveAiIT8NBFpnIlfhnXUYDoGclW16NSfgnskFgvfxxUrU9H0Uikn8RQFIGptOia
         uINVg0KMSpM8YHYNOLL+M+KXxvH4X81C4hv9Yn2wlB3Qz98YXpS38xbN4goOAK6J8kMA
         h96iDfM+m85iWm9tTR3VdDMncLuGjx7V5iZm+ZVGZ6mzvIw9NGroUt1jU6/Hl0+U3+wT
         Oq6JAUUZI+CFceYUmFEh3G10QB67I22fg7Cvrn1UqjWwz8fyqE7SLWOXfM/m+u6DkvYV
         KMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726063541; x=1726668341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhLYI+WH2rjAQ15cEzLwb0tlF+B4QF8tQmpD1iXPMtg=;
        b=WgWRJ9qLBYj0yd4hpw6AM5BI0FvZ0fowDYzdnDeiMA+wpeReh3HdYwZsCXuVD/7QWf
         aMphZOQsu3JIUc/fI6Vj6Vjm40n1rOqsty+jP+QBSbJlPMkYzmcjmIgvln4kbcaectuX
         enOBFhyjxIvp8o5lDAG4o42Z1RftFG+L+Dk83/0jAI7y9hnNAm3Ruj5LRyUm7EJ6ZsP/
         jVGMrHOqslURgU5cIpiWpDd6wfnEDc2sJV9mWzz6iFSxjqnS4tSHC5X20X8qX7PWegX+
         tpJkn+yWYO5s4P0LiE/AxlZCGtKe8Kibv5XuIRxeeZfyyyfZWr6SqdoVYObllk6a9t/4
         SgZg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Brf2nAJqK8zU2A02lx5aGTpGrFA6S0GdAQ6MPtWcXIg125MdVW+sIdNGG/2Gvs99R8emRcyQgRQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCM58CB3qYWajcK5OGIrb6pJyzRIXWy+vZn8qvU/lUeYuI0MNF
	o0hwFLePXqe8zqdfdqp6RX8zL6qlphLbvEvAY76A2CfGj7nBEchy3zuUd1cN5bo5WnyutVnlYiY
	=
X-Google-Smtp-Source: AGHT+IEyeFq8hsLHdogrd/8rn6+qhvbzUrav/AAq/ytx73jmyr9/QF1cYHs2bNOPKtH7vpdf6JhKIg==
X-Received: by 2002:a17:907:9807:b0:a89:f1b9:d391 with SMTP id a640c23a62f3a-a8ffab292fcmr431803466b.14.1726063536758;
        Wed, 11 Sep 2024 07:05:36 -0700 (PDT)
Message-ID: <346e9f49-463a-4451-a499-8b0c3129a53b@suse.com>
Date: Wed, 11 Sep 2024 16:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] x86/HVM: drop stdvga's "lock" struct member
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
 <716868cb-6a94-4470-a1a5-a4b5994e8195@suse.com>
 <dcc120ce-6634-465b-81ee-d652bd0935a7@citrix.com>
 <d7394132-e3ed-4804-8da0-6333a1dcf466@suse.com>
 <db97215e-4e78-413c-b86d-aec8c87f8a86@citrix.com>
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
In-Reply-To: <db97215e-4e78-413c-b86d-aec8c87f8a86@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.09.2024 15:07, Andrew Cooper wrote:
> On 11/09/2024 1:58 pm, Jan Beulich wrote:
>> On 11.09.2024 14:42, Andrew Cooper wrote:
>>> On 11/09/2024 1:29 pm, Jan Beulich wrote:
>>> However for performance, we also want to do the dir/ptr/count exclusions
>>> before the address range exclusions, meaning that ...
>>>
>>>>  
>>>> -    spin_lock(&s->lock);
>>>> -
>>>>      if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 )
>>>>      {
>>>>          /*
>>>>           * Only accept single direct writes, as that's the only thing we can
>>>>           * accelerate using buffered ioreq handling.
>>>>           */
>>> ... it wants merging with this into a single expression.
>> I'm not convinced, and hence would at least want to keep this separate.
>> Which exact order checks want doing in would require more detailed
>> analysis imo. Or do you have blindingly obvious reasons to believe that
>> the re-ordering you suggest is always going to be an improvement?
> 
> I'm not overly fussed if this is delayed to a later patch.  My review
> stands as long as the comment is gone.
> 
> But, right now, accept() is called linearly over all handlers (there's
> not range based registration) so *every* IO comes through this logic path.

Not exactly every, only ones not claimed earlier. But yes.

> The likely path is the excluded path.  ioreq_mmio_{first,last}_byte()
> are non-trivial logic because they account for DF, so being able to
> exclude based on direction/size before the DF calculations is a definite
> improvement.

Perhaps. Yet if we were to re-order, calling ioreq_mmio_{first,last}_byte()
becomes questionable in the first place. I wouldn't expect the compiler to
spot that it can reduce those expressions as a result of knowing ->count
being 1 (and hence ->df playing no role at all). Maybe I'm overly
pessimistic ...

Jan

