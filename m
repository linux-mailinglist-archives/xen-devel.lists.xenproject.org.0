Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F4A960974
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783895.1193199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siut9-0000VY-Gc; Tue, 27 Aug 2024 12:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783895.1193199; Tue, 27 Aug 2024 12:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siut9-0000TZ-Cj; Tue, 27 Aug 2024 12:01:31 +0000
Received: by outflank-mailman (input) for mailman id 783895;
 Tue, 27 Aug 2024 12:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siut8-0000TT-1W
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:01:30 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17243d7b-646c-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 14:01:28 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53351642021so6275345e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 05:01:28 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e588ade7sm100494566b.180.2024.08.27.05.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:01:26 -0700 (PDT)
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
X-Inumbo-ID: 17243d7b-646c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724760087; x=1725364887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dmJUwda64ZAH64yKwNwkUhBN3CEud0mGq6sIUI2oScU=;
        b=DYMmTEZGjndDxZ0Mn57ceAJpv75MCs6Kpp4DbtRpVXJxBhL3f7uRDGy84cs9jYQJYT
         gpdh497TMHe5xkLWOsJkNanlavge1SgD7JGY0nyMXWWhqMkBs0OqLkLsSuhYUREKMe9Q
         s7q+9g0A2mbR+v2bsIIWbMoaCTRX/IWWj+BBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724760087; x=1725364887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmJUwda64ZAH64yKwNwkUhBN3CEud0mGq6sIUI2oScU=;
        b=SrNnJc5AgrJHqC4rn6tGgOH8HE7ynbpZIYx8Q9+ZQ1MRVIWddIuVvyR7A932a2BGKi
         6VzumG2X+8QXK3FLqoDrnG05pXkpEUrLxjowS1pY9UlvuK9HuFoHNgBC0JhdPNQYjC/5
         mtXdnd9M8jpZ+pZP3O4vugV8yEeE3sw4fV7TLhgtalxIe0emjvvk8IXB51e1PhvoWgdi
         ESH9kn9AiOPHlR8bE+NvDP80DquwKmxhl5rNOULAgzOawZHHVnMwMbxfRbXtWc3Kj9Aw
         wJvVPbAGbS6vxML+hmYj6DCmbWcGTjn7ymCAfy6IxUNZPvANd75ZWLPlcGRIHLxHFY/H
         vrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC5RKTuJr/f39lMXfgzUGVAk/4kQ6g5uT0xLLE3nnsGYZzi+rZzTOo9npbEEQc+qbdreNXBJZieyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkSTAMrsUayaK6XZMPyMW9fsB8ptS7CA4a4AYmEEHIjBRMgByb
	NTWH/+7pwQoLFnQmU+ic0bV+1wl/++bJwsQy4X00pUGi4dudFYEGC6BW+SkpsLU=
X-Google-Smtp-Source: AGHT+IEIAjChwL26EE6ed4i3/OnhM3YCEpYx2ZhM2gAAX6X8JFydd+vKf+MrHA9NpUyI29EwXgdxiQ==
X-Received: by 2002:a05:6512:108b:b0:52b:c1cc:51f1 with SMTP id 2adb3069b0e04-5343877b490mr8236635e87.23.1724760086810;
        Tue, 27 Aug 2024 05:01:26 -0700 (PDT)
Message-ID: <239165e3-6f96-452f-9c81-05f29012269f@citrix.com>
Date: Tue, 27 Aug 2024 13:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] xen/bitops: Introduce a multiple_bits_set() helper
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-3-andrew.cooper3@citrix.com>
 <841e2cde-6fc2-49d9-b947-534bd53bc00e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <841e2cde-6fc2-49d9-b947-534bd53bc00e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/08/2024 11:30 am, Jan Beulich wrote:
> On 23.08.2024 01:06, Andrew Cooper wrote:
>> This will be used to simplify real logic in the following patch.  Add compile
>> and boot time testing as with other bitops.
>>
>> Because the expression is so simple, implement it as a function-like macro
>> which is generic on the type of it's argument, rather than having multiple
>> variants.
>>
>> Testing function-like macros needs a minor adjustments to the infrastructure
>> in xen/self-tests.h to avoid bracketing the fn parameter.  The utility of this
>> outweighs the associated risks.
> We may need to mark these two places as deviated.

Perhaps, although it would want to be a project-wide deviation.

Eclair was green with this patch in place, so it's not blocking.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one remark/request:
>
>> --- a/xen/common/bitops.c
>> +++ b/xen/common/bitops.c
>> @@ -84,8 +84,32 @@ static void __init test_fls(void)
>>      CHECK(fls64, 0x8000000000000001ULL, 64);
>>  }
>>  
>> +static void __init test_multiple_bits_set(void)
>> +{
>> +    /*
>> +     * multiple_bits_set() is generic on the type of it's parameter, as the
>> +     * internal expression is so simple.
>> +     */
>> +
>> +    CHECK(multiple_bits_set, 0, false);
>> +    CHECK(multiple_bits_set, 1, false);
>> +    CHECK(multiple_bits_set, 2, false);
>> +    CHECK(multiple_bits_set, 3, true);
>> +
>> +    CHECK(multiple_bits_set, 1 | (1UL << (BITS_PER_LONG - 1)), true);
> This is really the same as ...
>
>> +#if BITS_PER_LONG > 32
>> +    CHECK(multiple_bits_set, 1 | (1UL << 32), true);
>> +    CHECK(multiple_bits_set, 1 | (1UL << 63), true);
> ... this, at least as long as BITS_PER_LONG > 32 in practice means
> BITS_PER_LONG == 64. Perhaps not really worth keeping that line?

I suppose not.  I'll drop it.

However, It occurs to me that I do need a test of 0x8000000000000001ULL
mostly for 32bit builds to check that even when the argument is split,
the answer is still accurate.

~Andrew

