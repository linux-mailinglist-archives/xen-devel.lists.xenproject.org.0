Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41BB9D4CCD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 13:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841482.1256972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE6LN-0004ka-Cv; Thu, 21 Nov 2024 12:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841482.1256972; Thu, 21 Nov 2024 12:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE6LN-0004ia-97; Thu, 21 Nov 2024 12:31:33 +0000
Received: by outflank-mailman (input) for mailman id 841482;
 Thu, 21 Nov 2024 12:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE6LL-0004iU-RY
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 12:31:31 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 878146ca-a804-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 13:31:28 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so1028538a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 04:31:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f43804b8sm74664466b.192.2024.11.21.04.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 04:31:27 -0800 (PST)
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
X-Inumbo-ID: 878146ca-a804-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg3ODE0NmNhLWE4MDQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTkyMjg4LjAxNzMxNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732192287; x=1732797087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GM94cePoMwgOwGo6f8OylyDYk3VBlIp+ay66kLsiCxc=;
        b=FGlYnLuJsDLiCMq0XKmUuNyjcgeNty2g2XPg30EfajcWw/1VlXOMqbCnoSz703PimU
         jjhKdt58lzT/ElGdyJQQ2ZPzREjdQQmw5b6O2mFNLBSI1lmvceXxhPuz27CbRZ0ECsUz
         dZXuDLVCLvzwUooSltDBnRMnaH4SA4SO0+EIiTNkhTqSEpDBXs2XueLjDupNdjw9bLgl
         ZIIKmRUyVZQZ050gtDNHZ3BPFWE+l1tH3I7u9hNZmQXX8CK7FVgA64oBS+DGoLUd/GYe
         7APrMRToD6uJVkNME6ppx2Jw+Hxyig3MOfYuRZbqzbYNlP+lYlBkHpOJe5KD8C61RV+B
         mjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732192287; x=1732797087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM94cePoMwgOwGo6f8OylyDYk3VBlIp+ay66kLsiCxc=;
        b=erGeCX1hhYS9mqIoXOYcWxbiWo+sHQO4cqxLWs7xGVWp6LBuqeYQN2880qHdeahSer
         taVmMxC9JJZwh/GTwiIzwt6tHuCKefkcA65QvBwJ4hEubisMkOnFl9MccFYhnwkcOu5r
         XWMECJ/QrnI61HbUzp2W2kjGW/nkwvXXQXx5lZwsjERLIjKR/o9TO+8ROEIIE4TfVHpC
         5lBBL/bymD28fbapCYSss/CGGHJU4tSDrzQ9TCmFQmDHD5dlVn2f2N6kUf5Jvb0yLzJO
         Gzd+Bh+DIPxRqmNYbTPOVkXMAlyHbAYn2wotV78x6xi1+Qxzo0dPxjXvEwNLthlaMdzm
         Y9fg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5kg63G492PlU9FLkH941dx92NA+ngNNpv4cd/LsXz1LTdG2zAY4nGMIKxdczzt1jKu47K/jh6dw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNaBEZcELJvFAFpNwUfHQlBiGWNbsPosa8jWvEx+4pGdcSGrSD
	RDVcopJ0G5d8l8Vigmjnvc5wtlizAlBw/I+AfGO+AdIOM2LgFnhRwwnPOaTxAg==
X-Gm-Gg: ASbGncs61AkHXifLl36lnbC38cBVWmA6AtFYqUfrREDE/PxqjL4HX8Wx1ly9DPf8b7n
	PXYr4iJENa3EhKWtn2/r81Iq9p45lfKb+4wRpRGZO478mhkWj7Qb96mLnrt4HILPG/5yPafu/k7
	ALMfzzS/OdsDnyT3tQPkI/208AYdR3Ck6MCWCBMJSER1y7WHp6cL8sVX9FymWLWobB8GkwoF4yt
	jhJOWhZbqDS/5piakSXHeNQlK75/7p5GGaTXbTu/rj2N01fcMDeVGDEuil4tcMnj6mWAUb6WDiN
	/n5lZKVm0463pctI6aoE4CmonqMqVz6vPSg=
X-Google-Smtp-Source: AGHT+IG4uhZFj2XDsdJdKs2Hk6BCAiR6xINtkEHtwllqiCwcAHyLLT8et5bNpcyY8LAWPxejpPr//w==
X-Received: by 2002:a05:6402:3587:b0:5cf:a830:d84f with SMTP id 4fb4d7f45d1cf-5cff4c42cefmr4841891a12.15.1732192287344;
        Thu, 21 Nov 2024 04:31:27 -0800 (PST)
Message-ID: <d041eb0c-9339-4280-8a10-5a267ca950fd@suse.com>
Date: Thu, 21 Nov 2024 13:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 release schedule
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: oleksii.kurochko@gmail.com, Xen-devel <xen-devel@lists.xenproject.org>
References: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com>
 <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com>
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
In-Reply-To: <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 14:25, Andrew Cooper wrote:
> On 21/10/2024 1:02 pm, oleksii.kurochko@gmail.com wrote:
>> Hello everyone,
>>
>> As there were no objections to the proposed release schedule
>> (https://lore.kernel.org/xen-devel/CAMacjJxEi6PThwH2=NwG3He8eQn39aiaxZCw3bQF7i4YcmjuNw@mail.gmail.com/
>> ), I've updated the wiki with the schedule for Xen 4.20 release
>> (https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes), and
>> it is now accessible from
>> https://xenbits.xen.org/docs/unstable-staging/support-matrix.html.
> 
> I have a blocker to raise (against myself...) and no good idea of how to
> proceed.
> 
> The for_each_bit work has a unexpected bug.
> 
>     for_each_bit ( ... )
>     {
>         if ( ... )
>             break;
>     }
> 
> will fall into an infinite loop.  This is caused by for_each_bit()
> hiding a double for() loop, in order to declare two scope-local
> variables of different types.
> 
> The two variables are one copy of the source expression (really quite
> important to keep), and one unsigned int iterator (improved optimisation
> capability by not using a wider-scope variable).
> 
> Options are (off the top of my head)
> 
> 1) Always take the iterator from outer scope
> 2) Iterator always the same type as the source expression
> 3) Figure out some way of expressing "once" in the outer loop
> 
> Or anything else that I've missed.

How about requiring the use of another auxiliary construct in place of "break"
inside such loop bodies:

#define for_each_bit_break ({ __v = 0; break; })

? Of course the risk remains that people might forget that plain break can't
be used there.

If we expected such may want/need using elsewhere as well, introduce

#define BREAK(stmt...) ({ stmt; break; })

and then use that for for_each_bit_break. Albeit the latter may face your
opposition as to using a statement as macro argument; you didn't like such
in my ASSERT_UNREACHABLE() extension proposal.

Another option, requiring such conditions to come ahead of anything changing
state, would be to require use of "continue" in place of "break". That would
result in a number of useless loop iterations, though. Plus it would require
the exit condition to hold for all subsequent values of "iter", too. IOW not
something I'd seriously consider ...

Jan

