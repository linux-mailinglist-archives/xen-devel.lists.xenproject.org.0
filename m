Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A259D51D9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 18:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841642.1257132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEB5V-0007uN-I6; Thu, 21 Nov 2024 17:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841642.1257132; Thu, 21 Nov 2024 17:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEB5V-0007rk-FV; Thu, 21 Nov 2024 17:35:29 +0000
Received: by outflank-mailman (input) for mailman id 841642;
 Thu, 21 Nov 2024 17:35:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XSdi=SQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tEB5T-0007rd-9X
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 17:35:27 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa291fa7-a82e-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 18:35:19 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so12564281fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 09:35:19 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d2f9a3asm20314a12.0.2024.11.21.09.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 09:35:17 -0800 (PST)
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
X-Inumbo-ID: fa291fa7-a82e-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzYiLCJoZWxvIjoibWFpbC1sajEteDIzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZhMjkxZmE3LWE4MmUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjEwNTE5LjI0MDg0Mywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732210519; x=1732815319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wXXakLYoF97BXBj5v7CgjEOwh8KoQ2gpscStqUJXiVw=;
        b=MUkKg9YU3e6jiV3aSEKvvw1XtjCnaZIPGp9ay1YwqptsNBGgn7uRH5oIk2y9VZ+2Am
         36Ewm/SYlFlekrUqCEFh4VHc5jJzvqUaPG9Z5ul68C0jhfzPqt03PonzrlMs/j2jqUcF
         PUqQymsGR2nyOaj9v0/2RdCDcl6E7gdpZFDv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732210519; x=1732815319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXXakLYoF97BXBj5v7CgjEOwh8KoQ2gpscStqUJXiVw=;
        b=M6EwT6D07IDa8XjknenBjiE6EoM7voc3/vm4b1BCJF4Ung0JQWBv1cu1mnZ1gJOiMV
         kPPNtqPXJcnfNc8kuQ/fzlbkNVTlylx80CKsIl2IcgwkPlxlcFCGG0qdAIx8U0UFarsx
         GCw0htLWTEa1kqMbcYtxNXSFKTBC0ratnVP3isjWSqktpNNaQg8u1ZTvx6QoAKkfCHD5
         pqYLmSZ5A2ybhG65SlMjFjp897OyETV09z8d/hkiqcQgUTZKSUNkmo723ul5TG89emDh
         XzCkxDArj1yaSsRGltk320eGypKO/tX52zkgqf/q6WYnAAffznae0ncFDZke48zKDOPL
         ygVQ==
X-Gm-Message-State: AOJu0Ywb3L2MDJ950nKYnX4z59erO+paXa3Hqi46u4IoTCnqIx1yrrOy
	3A8wuioMlakSbSBVCvmxwoEKifhXU/KzpXcpievLtZ37K+UmEtL4ohYUjgUk6D0=
X-Gm-Gg: ASbGncttjQt4UMjzJOHwTIYoa4WQCh55RJLvVhv4ecSa4A44XHTEPViZ4PKDWxBw/Tj
	9xaFr7bscVns4HswlP5Y++GRtWNWKmcCZqgQyf/8e4dl4L1B1mrk0lDNl6lRCgUu3B+A7wn7VIV
	ojOxK/z8oz9juQZ4beam+9mqx7mhqXBQUwJIKXjwBjAXK1FfYT5js2pR+GUCHhy4i+xSzTnCql7
	Y3+miJ2xHV+hMVAwLMQkCpEros0YVuCMdTIIoe8aSt48HsWNkpES0eRVLpGjb0=
X-Google-Smtp-Source: AGHT+IEeko8JLxJLsoVU2mvp1liAyjj1RnFjffExJNeKYTR7GfEIMJbWwL6HQuNJoVHLABqLPFkDFg==
X-Received: by 2002:a05:651c:553:b0:2f3:a06a:4c5 with SMTP id 38308e7fff4ca-2ff8dc89b77mr50044481fa.29.1732210518591;
        Thu, 21 Nov 2024 09:35:18 -0800 (PST)
Message-ID: <bb6736b2-ec3e-4e72-bd6c-fabeccc3654b@citrix.com>
Date: Thu, 21 Nov 2024 17:35:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitops: Fix break with in a for_each_set_bit() loop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Frediano Ziglio
 <frediano.ziglio@cloud.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
 <Zz9gkhQgsOtJUA0I@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zz9gkhQgsOtJUA0I@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2024 4:32 pm, Roger Pau Monné wrote:
> On Thu, Nov 21, 2024 at 02:50:00PM +0000, Andrew Cooper wrote:
>> for_each_set_bit()'s use of a double for loop had an accidental bug with a
>> break in the inner loop leading to an infinite outer loop.
>>
>> Adjust for_each_set_bit() to avoid this behaviour, and add extend
>> test_for_each_set_bit() with a test case for this.
>>
>> Fixes: ed26376f20bf ("xen/bitops: Introduce for_each_set_bit()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>
> I have to admit it took me a while to understand what was going on.
>
> Subject should likely be "Fix break usage in for_each_set_bit() loop"
>
> Or similar?

I'll adjust.

>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>>
>> Both GCC and Clang seem happy with this, even at -O1:
>>
>>   https://godbolt.org/z/o6ohjrzsY
>> ---
>>  xen/common/bitops.c      | 16 ++++++++++++++++
>>  xen/include/xen/bitops.h |  2 +-
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
>> index 91ae961440af..0edd62d25c28 100644
>> --- a/xen/common/bitops.c
>> +++ b/xen/common/bitops.c
>> @@ -110,6 +110,22 @@ static void __init test_for_each_set_bit(void)
>>  
>>      if ( ull != ull_res )
>>          panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
>> +
>> +    /* Check that we break from the middle of the loop */
>> +    ui = HIDE(0x80001008U);
>> +    ui_res = 0;
>> +    for_each_set_bit ( i, ui )
>> +    {
>> +        static __initdata unsigned int count;
> Preferably as you suggested without the static variable, I may suggest
> that you use ui_tmp instead of plain tmp as the variable name?

For this, I'd prefer not to.

For ui, ul and ull, there are a pair of variables with precise usage.

This is one random number that gets as far as 2.  And it's test code.

~Andrew

