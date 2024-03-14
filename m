Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8887C310
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 19:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693451.1081537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqAi-0000oI-F6; Thu, 14 Mar 2024 18:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693451.1081537; Thu, 14 Mar 2024 18:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkqAi-0000la-CM; Thu, 14 Mar 2024 18:51:20 +0000
Received: by outflank-mailman (input) for mailman id 693451;
 Thu, 14 Mar 2024 18:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR1U=KU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkqAh-0000lU-4N
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 18:51:19 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d705c156-e233-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 19:51:18 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-42ee33b2d58so7005851cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 11:51:18 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d13-20020ac847cd000000b0042f21fe66f7sm1066590qtr.73.2024.03.14.11.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 11:51:16 -0700 (PDT)
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
X-Inumbo-ID: d705c156-e233-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710442277; x=1711047077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=35IIQwAtd0xy77CIsxN6/OzZ7I4Hyg1YPyW5Febi9xY=;
        b=Qrq4Fi/wlqCgQDxIpqvMTM1VBJCgN9+Av3XDHcJ6UhbBXGSNFymh2OOGcABeMTrCVG
         O2RxPcX9lyJNhwN+8Cd7OQwWivHF05qhVSib5sVHl5Mj2YuHpXAQGjldFJe6zohIMM+B
         NfcNzjO7Pjpzb99rAPX8qz9t4tSeGPW2jLhdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710442277; x=1711047077;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35IIQwAtd0xy77CIsxN6/OzZ7I4Hyg1YPyW5Febi9xY=;
        b=dlqDoKjy6I41oGoWZ5KvYxM1XuUn+IPB0kRqniSjZUk8KrWgGYGn1KNDN1vGpz2IMn
         JBlxc8ukNw6jGRz6Ocntx84zdzr9JjwxkqCOUJjzu7Wzw9oqirBCmOEX2W5owYo7tEA6
         AxmyM/HYPPTQZM7t25oochzlVddmaesmgZ89q1qthR53g2PC0B+bFURK9jlXbgMfAj3q
         zBJpNMZvk5cZ+TiINwfGm5/LfY/ZKOubcWDgycwoW83PXWuHwaBMkYSx4gO6RZvPntZG
         F8pRIe5bQzQ5ay/Gvw1ZkBHSFJEVwm0mLg5lNgg96D4g/TuK1Xs7nQpIPC47v4KT457o
         ptEA==
X-Forwarded-Encrypted: i=1; AJvYcCUjl/hhZnnkDE4DRS1rCyP91CzjOCvJXapQFrCYKsQ01ptGdTeW9BW9CT1MV+6NAqQOXCXqXk6KbOlqYUTfa3aq8aXgl/hVuhKPnU7wQuQ=
X-Gm-Message-State: AOJu0YyCmvZoWilrKP9M5KaMksogXsWeA7dh0K9nmrkyNdIbIsahE2XJ
	dvILBbVlMw91OnlvAseoqT92Ne3NPEaNmGM8rC9K8wotSubsRK0snWgeompWFLE=
X-Google-Smtp-Source: AGHT+IGPldSYfuK3jyE6mCTuz/mAQ2JfROMvXHyXNdFjJDxuECYBJrBNX8ONvlIRvzcpc/aHqWKgew==
X-Received: by 2002:ac8:5e50:0:b0:42e:d18f:71d9 with SMTP id i16-20020ac85e50000000b0042ed18f71d9mr2790790qtx.5.1710442276817;
        Thu, 14 Mar 2024 11:51:16 -0700 (PDT)
Message-ID: <cc3c0484-a896-4100-8400-50036d1e8c71@citrix.com>
Date: Thu, 14 Mar 2024 18:51:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-7-andrew.cooper3@citrix.com>
 <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
 <1356dd16-03e1-4c01-9aac-597a127dea85@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1356dd16-03e1-4c01-9aac-597a127dea85@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2024 6:47 pm, Andrew Cooper wrote:
> On 14/03/2024 2:30 pm, Jan Beulich wrote:
>> On 13.03.2024 18:27, Andrew Cooper wrote:
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
>>>      if ( contig_mask )
>>>      {
>>>          /* See pt-contig-markers.h for a description of the marker scheme. */
>>> -        unsigned int i, shift = find_first_set_bit(contig_mask);
>>> +        unsigned int i, shift = ffsl(contig_mask) - 1;
>> The need for subtracting 1 is why personally I dislike ffs() / ffsl() (and
>> why I think find_first_set_bit() and __ffs() (but no __ffsl()) were
>> introduced).
> It's sad that there are competing APIs with different bit-labelling, but
> the optimiser does cancel the -1 with arch_ffs() (for at least x86 and
> ARM that I studied in detail).
>
> I firmly believe that fewer APIs which are fully well defined (and can
> optimise based on the compiler's idea of safety) is still better than a
> maze of APIs with different behaviours.
>
>> But what I first of all would like to have clarification on is what your
>> (perhaps just abstract at this point) plans are wrt ffz() / ffzl().
>> Potential side-by-side uses would be odd now, and would continue to be odd
>> if the difference in bit labeling was retained. Since we're switching to
>> a consolidated set of basic helpers, such an anomaly would better not
>> survive imo.
> I honestly hadn't got that far yet.  I was mainly trying to dis-entangle
> the existing mess so RISC-V wasn't making it yet-worse.
>
> But yes - it warrants thinking about.
>
>
> I was intending to do the fls() next then popcnt().   The latter has
> quite a lot of cleanup wanting to come with it, and is more
> architecturally invasive, and I know I've got a years-old outstanding
> piece of work to try and do popcnt more nicely on x86.
>
> I have wanted ffz() in the past.  I think I just went with explicit ~
> because I didn't want to continue this debate at the time.
>
> However, I (very much more) do not want a situation where ffs() and
> ffz() have different bit-labellings.
>
>
> There are no builtins, and having now studied the architectures we care
> about... https://godbolt.org/z/KasP41n1e ...not even x86 has a "count
> leading/trailing zeros" instruction.

Hopefully obviously, I meant ones here.   My point is that the compiler
emitted code always has a NOT in it somewhere.

>
> So using ffs(~val) really will get you the best code generation
> available, and seeing as it halves the number of bitops to maintain, I
> think this is the best tradeoff overall.
>
> I intend to put ffz() and __ffs() into linux-compat.h and leave them
> there to discourage their use generally.
>
> ~Andrew


