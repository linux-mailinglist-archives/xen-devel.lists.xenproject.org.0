Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504339D4E2E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 14:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841533.1257021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE7fy-0000gb-Cp; Thu, 21 Nov 2024 13:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841533.1257021; Thu, 21 Nov 2024 13:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE7fy-0000eE-AB; Thu, 21 Nov 2024 13:56:54 +0000
Received: by outflank-mailman (input) for mailman id 841533;
 Thu, 21 Nov 2024 13:56:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XSdi=SQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tE7fx-0000e8-D2
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 13:56:53 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72e9a985-a810-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 14:56:47 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso11001951fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 05:56:47 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cff44de5easm1862316a12.11.2024.11.21.05.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 05:56:46 -0800 (PST)
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
X-Inumbo-ID: 72e9a985-a810-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmMiLCJoZWxvIjoibWFpbC1sajEteDIyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcyZTlhOTg1LWE4MTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTk3NDA3LjQ0MTc1NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732197407; x=1732802207; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zqLC8Pz2gcau834AtUw4JojvAPpbkb4hEOalyD/543Y=;
        b=KeKWN+R1NmgCO/A+1g+YuGhMPGUH0C7S9xwUQ4yfXblEJCKHTFOo0AnV4vwm/ZQMkR
         INgiEYplUnsjbd00wMJ4VAwrjbtzAi1DxdOO32rHlNEdZCDm/hQH9krO6fdOAEBmF9hi
         U/TKdwtrM6pw3SBVih8F5vl4jKv7m/T7iaB4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732197407; x=1732802207;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqLC8Pz2gcau834AtUw4JojvAPpbkb4hEOalyD/543Y=;
        b=l4HQvUY2/dFO+3Y11AuGykkpEwuR3mtplmW7e+ufUXmxdDhXeZDnY6aHB00Rora4j3
         gXRx+hmuD85bXqIJavb5KU63b0a7WefMr5F/n9EqSW08qTVDiUquWSInwDUr//N8fBfF
         wOCFtcG26Nhqy8NpbjaUv2F7mPCjdVJFnqkHjGUFxGu4mIRKBJrhResGRDqSu8Rj54yh
         XpzA/eX8s/l4AtBRovpKKx9rrdAVlUfSyFmsBXW+WKS5O5H0Zb2w+6p6ziGqWcvJXv2C
         UMtl72NAHSZ29xqzrGXiKr8uAz1sw0kEbuF3OQHYpg4ybqzQ2QxCC3PbcGPa5ji019SC
         o/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2el7Q5u25qYMRYzqju8DOFtjkEJkM/8zK/mJlg4Q81Id/81eNAxkUxCqmv2eFK7SKWMvKOMOqw4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgeyexS5+aJXYnuGzc+Y8Qd5aleDlACMaG/mg1/Gi+Rf9tB7u1
	nPlnxvUMngSOCy5swxdGP10yBuAi4dvh+aQlNXF7nchjKttTxRcPnwW5S7A+0V4=
X-Gm-Gg: ASbGncvWlG41UiyHHmZbjtWkRcJYSIXS6eFz1odR0982a2TRBhMdynZ7hP9kNgeztHG
	bDuFJt6sNjU5U+4eT3Jqv9q1AXTc9j2PIZ8KvXLHUbjq2vZAfNz9aIC6KtTEeOhmZrmRo6QcNrt
	rR8DyfeI1eXeN4fUklFt0oubwdf0NSQEczPrZxS70xAp59dtTnp2qyTFhf2gGeVRsePyoUcutwT
	aoVLK04fliVWgtIG4mS1iIKBM3lRB6OEstXakM4I8hV6/DBiGuMn1AfarQDFmg=
X-Google-Smtp-Source: AGHT+IEC7lMkZVWOhiiNZMndp6Y06EpGsFlH0QRxGCLPRwiGHxTS+GBiM4h/a6rVJyQ9/G3SXF+AHQ==
X-Received: by 2002:a2e:a906:0:b0:2fb:51a2:4f63 with SMTP id 38308e7fff4ca-2ff8dc89e2cmr40003191fa.34.1732197406741;
        Thu, 21 Nov 2024 05:56:46 -0800 (PST)
Message-ID: <604cf91c-0ccf-48d6-a2fa-cfaa320a163c@citrix.com>
Date: Thu, 21 Nov 2024 13:56:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 release schedule
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: oleksii.kurochko@gmail.com, Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com>
 <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com>
 <CACHz=ZjnfL_MorLcwduhJpUjFLX2y3KtQE8Pd4s=V68OgiV_rA@mail.gmail.com>
 <21cfb919-9150-4276-b613-d972a4b1d864@suse.com>
 <CACHz=Zhf6Gh62eeWj-jBTcMrOpa1g+_dC-uT-D8vF2BLbFwX0Q@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=Zhf6Gh62eeWj-jBTcMrOpa1g+_dC-uT-D8vF2BLbFwX0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2024 1:47 pm, Frediano Ziglio wrote:
> On Thu, Nov 21, 2024 at 1:40 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 21.11.2024 13:53, Frediano Ziglio wrote:
>>> On Wed, Oct 30, 2024 at 1:25 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> On 21/10/2024 1:02 pm, oleksii.kurochko@gmail.com wrote:
>>>>> Hello everyone,
>>>>>
>>>>> As there were no objections to the proposed release schedule
>>>>> (https://lore.kernel.org/xen-devel/CAMacjJxEi6PThwH2=NwG3He8eQn39aiaxZCw3bQF7i4YcmjuNw@mail.gmail.com/
>>>>> ), I've updated the wiki with the schedule for Xen 4.20 release
>>>>> (https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes), and
>>>>> it is now accessible from
>>>>> https://xenbits.xen.org/docs/unstable-staging/support-matrix.html.
>>>> I have a blocker to raise (against myself...) and no good idea of how to
>>>> proceed.
>>>>
>>>> The for_each_bit work has a unexpected bug.
>>>>
>>>>     for_each_bit ( ... )
>>>>     {
>>>>         if ( ... )
>>>>             break;
>>>>     }
>>>>
>>>> will fall into an infinite loop.  This is caused by for_each_bit()
>>>> hiding a double for() loop, in order to declare two scope-local
>>>> variables of different types.
>>>>
>>>> The two variables are one copy of the source expression (really quite
>>>> important to keep), and one unsigned int iterator (improved optimisation
>>>> capability by not using a wider-scope variable).
>>>>
>>>> Options are (off the top of my head)
>>>>
>>>> 1) Always take the iterator from outer scope
>>>> 2) Iterator always the same type as the source expression
>>>> 3) Figure out some way of expressing "once" in the outer loop
>>>>
>>>> Or anything else that I've missed.
>>>>
>>>> ~Andrew
>>>>
>>> Something like
>>>
>>> #define for_each_set_bit(iter, val)                     \
>>>     for ( typeof(val) __v = (val), __c=1; __c; __c=0)   \
>>>         for ( unsigned int (iter);                      \
>>>               __v && ((iter) = ffs_g(__v) - 1, true);   \
>>>               __v &= __v - 1 )
>>>
>>> ?

Yes, that was the option 3 I was thinking about, although I'd not got as
far as doing the thinking bit yet.

>> Hmm, right, but then we don't even need a 2nd variable, do we?
>>
>> #define for_each_set_bit(iter, val)                     \
>>     for ( typeof(val) __v = (val); __v; __v = 0 )       \
>>         for ( unsigned int (iter);                      \
>>               __v && ((iter) = ffs_g(__v) - 1, true);   \
>>               __v &= __v - 1 )

This does look like a better option.

>>
>> Jan
> In theory it should work too, not sure if the variable aliasing would
> compromise the assembly output. We depend on the compiler doing some
> optimizations.

We already depend on some optimisation to get rid of the double loop
(both -O2 and -O1 cope).

I'll double check the result here too.

~Andrew

