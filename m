Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D1960D4A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 16:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784103.1193489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwwh-0001qF-DA; Tue, 27 Aug 2024 14:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784103.1193489; Tue, 27 Aug 2024 14:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwwh-0001o7-9p; Tue, 27 Aug 2024 14:13:19 +0000
Received: by outflank-mailman (input) for mailman id 784103;
 Tue, 27 Aug 2024 14:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siwwg-0001o1-8T
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 14:13:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 814afaff-647e-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 16:13:17 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-371941bbfb0so3184730f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 07:13:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549d00bsm115255766b.66.2024.08.27.07.13.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 07:13:15 -0700 (PDT)
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
X-Inumbo-ID: 814afaff-647e-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724767996; x=1725372796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zoKKxatk2D8XhqZNLis0wZh9HNL7/3YqqSoy0J87A44=;
        b=rfjZzl+SzCxHll/O8A5TtDV9xrlZyNq6DxcVp9wG1GerywoHU64QxGFMNW0wnexau7
         dV5DkI9/w+ptNJSoXK3YRYocHJvDQTgqZ08fUCYFagM00dDQRrX7l9ZGxHEbUN0o68RQ
         PAPVxbGM98lutUBhuSA915fnq+L8UIRDScnl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767996; x=1725372796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoKKxatk2D8XhqZNLis0wZh9HNL7/3YqqSoy0J87A44=;
        b=ivpjzf8Meo6Egc4+E8jFXStdfVBNYuFVlILHIBSqYLvUlbippjSxaBC5kaDKnOjpuk
         6NxT1HzLYUAdPfOohjRBAVHGHEOeiymXpFNeRhkEjo+GGrZMfJAY6aUpXtGTRIj/+ewV
         eSg35aSAzTUsKGfNB/08t9o1MNHXFXXyoGHYSILyvKJG6soKkoHRu3n0vGw1noY13lJw
         gBZR0qS7yA7Z1Ru1oU0PYDR59vXz1M5aQ6qwBJC8xOPEz8Ri4Z3hFEbYdeUbefAPD5Xy
         Ay4bYsGqJcFx7rCVJQ3AaRfw/IxVq07CKy1sSw45LZYMTMajwoKmwVb10IwxxQ1VDb/M
         /5zg==
X-Forwarded-Encrypted: i=1; AJvYcCWlutgAm6Y4StaVXLc++I++IM/1T8lrB+eHiGpapEuCbjtZiR+Wkhv2dfSR50dyehGFKd1kggVtZ/U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw27eE320qme/+PCCHu4tJJ5QEnVC+TOL0cAG4bazOK2ALJrWXr
	Oym8V4dFj4AUK+T4rkQ4DtJ7ea9uClu5Jp8kPy/nLlC6QD3AUIu59UPBI+LGTTg=
X-Google-Smtp-Source: AGHT+IHPJuRnRxcDjVffs9JQ7nZB8s7BvAOVkrJwI4LyYJaN8QaZooTCs2ao2oqrTEBgn0areUlbIw==
X-Received: by 2002:adf:e261:0:b0:371:83a8:afee with SMTP id ffacd0b85a97d-3748c7d4d36mr1805558f8f.27.1724767996058;
        Tue, 27 Aug 2024 07:13:16 -0700 (PDT)
Message-ID: <56ebf62b-ad9e-4f2a-8340-ad5621343a63@citrix.com>
Date: Tue, 27 Aug 2024 15:13:13 +0100
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
 <239165e3-6f96-452f-9c81-05f29012269f@citrix.com>
 <5521cd0f-6baf-4929-a2bd-9ebe67c99268@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5521cd0f-6baf-4929-a2bd-9ebe67c99268@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2024 1:50 pm, Jan Beulich wrote:
> On 27.08.2024 14:01, Andrew Cooper wrote:
>> On 26/08/2024 11:30 am, Jan Beulich wrote:
>>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>>> --- a/xen/common/bitops.c
>>>> +++ b/xen/common/bitops.c
>>>> @@ -84,8 +84,32 @@ static void __init test_fls(void)
>>>>      CHECK(fls64, 0x8000000000000001ULL, 64);
>>>>  }
>>>>  
>>>> +static void __init test_multiple_bits_set(void)
>>>> +{
>>>> +    /*
>>>> +     * multiple_bits_set() is generic on the type of it's parameter, as the
>>>> +     * internal expression is so simple.
>>>> +     */
>>>> +
>>>> +    CHECK(multiple_bits_set, 0, false);
>>>> +    CHECK(multiple_bits_set, 1, false);
>>>> +    CHECK(multiple_bits_set, 2, false);
>>>> +    CHECK(multiple_bits_set, 3, true);
>>>> +
>>>> +    CHECK(multiple_bits_set, 1 | (1UL << (BITS_PER_LONG - 1)), true);
>>> This is really the same as ...
>>>
>>>> +#if BITS_PER_LONG > 32
>>>> +    CHECK(multiple_bits_set, 1 | (1UL << 32), true);
>>>> +    CHECK(multiple_bits_set, 1 | (1UL << 63), true);
>>> ... this, at least as long as BITS_PER_LONG > 32 in practice means
>>> BITS_PER_LONG == 64. Perhaps not really worth keeping that line?
>> I suppose not.  I'll drop it.
>>
>> However, It occurs to me that I do need a test of 0x8000000000000001ULL
>> mostly for 32bit builds to check that even when the argument is split,
>> the answer is still accurate.
> IOW you'll insert an #else in the middle. Fine with me; keep the R-b.

Oh, I already had that case, out of context below what you quoted.  I'll
just drop the one intermediate test.

~Andrew

