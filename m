Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1B9B7CCD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828754.1243761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6W8B-0006VQ-Iz; Thu, 31 Oct 2024 14:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828754.1243761; Thu, 31 Oct 2024 14:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6W8B-0006Sh-Fo; Thu, 31 Oct 2024 14:26:35 +0000
Received: by outflank-mailman (input) for mailman id 828754;
 Thu, 31 Oct 2024 14:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6W89-0006Qr-LK
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:26:33 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f1097da-9794-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 15:26:30 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so565643f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:26:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113dd8asm2242115f8f.73.2024.10.31.07.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:26:29 -0700 (PDT)
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
X-Inumbo-ID: 1f1097da-9794-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmYiLCJoZWxvIjoibWFpbC13cjEteDQyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFmMTA5N2RhLTk3OTQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzg0NzkwLjU5MDgzNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730384790; x=1730989590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qal1gIjXdA4vh02b5fd6E5qWbvDTN6ixswVz4acBsXg=;
        b=Y/MTFHb32uilnmlNbH4wDuC1RYa3kSLe48dUseUkAHQJobJRCZhlh2BNJfWYABGZaM
         pBhjRQFX0iV1/QNincCzcRKbF0XcGnct9124r3No0tIWTd4H9ijXb24PLetnJwXO7XEp
         Z4iKl14pehbkMJjb6h0nVXTjit7g2ddqJDIjpwV8BTgJRqizYDDfa/mDyxFZJHvGv845
         qe/yZO0ZEnGgEZnnJR1ziengFNgXBWVRtIGscKdwowlr5p3+uP7dcn0sA/iStvan+1lR
         Z/nw11AeqrEV75Bd1epo5gc4TqqacWwllCvby8MKdxIv8AAcOJSth5jEL7/N0atAq0DR
         TNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730384790; x=1730989590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qal1gIjXdA4vh02b5fd6E5qWbvDTN6ixswVz4acBsXg=;
        b=Q2kjKnc8opf5gQ8E4ZjY+PhbFUT6/nYJ1Qtktbsh48AK3v9OnQFy8zWGersKqgD+Ke
         UsNOtjVdGavzRhLIbIhU3K0xfUmYGKJKeZjKtExROJRcxEOPim/dl+ayR58+dTXMYfRA
         eLrkTepo5bYdeX3nxxXCj9HQwf6PaJR1YyHy7oSxPd8Z8aNKnRjLVugw2fJAXNx+Vwzc
         Xyb6JcChaG6Ry6LmqPwGst/om48sbyNrBbNC52qpPA8/kYlTPkLifvZqYO3kT2JpmXJ1
         NhblPwVtNr+5ttkGw3YlHPcCBkOrR8hgK1GymaEjgqOE7yXfL4rYM9eBFiyP0lFCdV4t
         QpyA==
X-Forwarded-Encrypted: i=1; AJvYcCU8qHF1rkE1IXwR5K+KymN+g1wVbsAzpcuMkQZJ4ElmGiTyvH6Q8XS/DqZQVJQFiX4+fAX/uRIEfXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWLpgLKQ8I73Kd0psj/0iDKMyVLKNESh1HFgye+kOFEa1VgH2m
	P3oGzMOpq0VRHFRGnSKVTUSnHB2X6FaQ0mCpT5IonZecQsLE/Q0T0mcXnYNQkg==
X-Google-Smtp-Source: AGHT+IFx5wwPdzST4N+1Nd30O3An4sG7tr6TWWwq0FzZnXuzvw9ipp4m9huJDdaAUqoG/Ki0puaqGg==
X-Received: by 2002:a05:6000:4007:b0:37d:5232:a963 with SMTP id ffacd0b85a97d-381c7a4a492mr122628f8f.14.1730384789746;
        Thu, 31 Oct 2024 07:26:29 -0700 (PDT)
Message-ID: <59142741-ba58-4c26-b965-950b5c527c62@suse.com>
Date: Thu, 31 Oct 2024 15:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] byteorder: replace __u16
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
 <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com>
 <a7b6fc68-a568-4b61-895d-c295ba3d3095@citrix.com>
 <b5b20a0c-7584-4885-b7b0-c4b1cba8c0bd@suse.com>
 <f5572afc-7c9e-4c2e-ba3f-6ce4f3b71d59@suse.com>
 <56b2b751-74bc-4b47-a966-2c8a6ef2b35d@suse.com>
 <f105fe2f-1b76-4f0d-889b-ec12e95a0ac8@citrix.com>
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
In-Reply-To: <f105fe2f-1b76-4f0d-889b-ec12e95a0ac8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2024 13:20, Andrew Cooper wrote:
> On 31/10/2024 11:23 am, Jan Beulich wrote:
>> On 16.10.2024 11:37, Jan Beulich wrote:
>>> On 09.10.2024 15:34, Jan Beulich wrote:
>>>> On 09.10.2024 15:20, Andrew Cooper wrote:
>>>>> On 09/10/2024 10:21 am, Jan Beulich wrote:
>>>>>> In {big,little}_endian.h the changes are entirely mechanical, except for
>>>>>> dealing with casting away of const from pointers-to-const on lines
>>>>>> touched anyway.
>>>>>>
>>>>>> In swab.h the casting of constants is done away with as well - I simply
>>>>>> don't see what the respective comment is concerned about in our
>>>>>> environment (sizeof(int) >= 4, sizeof(long) >= {4,8} depending on
>>>>>> architecture, sizeof(long long) >= 8). The comment is certainly relevant
>>>>>> in more general cases. Excess parentheses are dropped as well,
>>>>>> ___swab16()'s local variable is renamed, and __arch__swab16()'s is
>>>>>> dropped as being redundant with ___swab16()'s.
>>>>>>
>>>>>> With that no uses of the type remain, so it moves to linux-compat.h.
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> I'm unconvinced of the need of the separate ___constant_swab16(). I'm
>>>>>> also unconvinced of the need for said constants (that even had casts on
>>>>>> them).
>>>>> There is a still-good series deleting the whole of byteorder/ and
>>>>> replacing it with a few-hundred line single header.
>>>>>
>>>>> It is the second thing stalled on a governance change (prohibited
>>>>> reasons to object to a change) which clearly no-one gives a damn about
>>>>> fixing.  In fact double spite because it denied a good engineer his
>>>>> first changes in Xen.
>>>>>
>>>>>
>>>>> I don't particularly feel like trying to polish byteorder.  I'm inclined
>>>>> to rebase+repost Lin's patches, at which point the majority of this
>>>>> series simply disappears.
>>>> I wouldn't mind you doing so, as long as that other series then progresses.
>>>> What I don't want to get into is the other series being stuck rendering this
>>>> one stuck, too. Then it would imo be better to take this one first, rebase
>>>> the other on top, and work towards it becoming unstuck (whatever that takes;
>>>> I have no recollection of what the issue was back at the time, all I recall
>>>> is that, yes, there was such work at some point).
>>> Just to have a clear picture: Was your reply an objection, with you indeed
>>> meaning me to hold back this tidying work? If so, can you please indicate
>>> when, at least roughly, you mean to re-post what you think wants re-posting?
>>> If not, can you please indicate so, for me to commit stuff that's otherwise
>>> ready to go in (and which that other work should be easy to re-base over)?
>> Just to mention here - short of an answer I'm going to commit this with the
>> R-b from Frediano that I've got.
> 
> nack.

Too late.

> The reason there's even anything to do here is, in part, because you
> were obstructive to Lin's series.
> 
> It wasn't only you, but the maintainers (plural) behaviour on that
> series was so outrageous that it started the effort to governance to
> prohibit certain classes of feedback, to make Xen a less toxic place to
> contribute to.
> 
> I will get to it when I get to it.   You can use the time to reflect on
> how you could have been more helpful in the past, and avoided this whole
> issue.

Do you really think that with this kind of reply you do any better than
what you complain about in my (supposed) earlier behavior? I can't help
the impression that you simply can't live with views differing from your
own in certain cases. If you have specific, reasonably objective comments
on that past communication (which I no longer have to hand), I may
certainly try to do better in the future. Blanket statements like those
above simply aren't actionable (and wording-wise close to a conduct
violation imo).

Jan

