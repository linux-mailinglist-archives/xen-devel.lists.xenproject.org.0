Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320E87E94B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 13:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694659.1083628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmC5n-00055g-9M; Mon, 18 Mar 2024 12:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694659.1083628; Mon, 18 Mar 2024 12:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmC5n-00053W-6C; Mon, 18 Mar 2024 12:27:51 +0000
Received: by outflank-mailman (input) for mailman id 694659;
 Mon, 18 Mar 2024 12:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmC5l-00053Q-C6
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 12:27:49 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed6246a7-e522-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 13:27:47 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-690b24973beso43511296d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 05:27:47 -0700 (PDT)
Received: from [10.80.67.23] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jo4-20020a056214500400b00696147f229fsm1552831qvb.83.2024.03.18.05.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 05:27:45 -0700 (PDT)
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
X-Inumbo-ID: ed6246a7-e522-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710764866; x=1711369666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dqy3uGGUTCCJ04acWTfAoJy8UG8EAW2DBMPEf+PuuY=;
        b=pgle5gptn6HecOOHP4HDDKnikDTjurOVZh9gGp8HxMuDi3OhczQlK5j6Ptu3CrKVgL
         UAidy6OPjn8SDoves1YaVBy6LCv2i0dJfmybhn7R2HdX50bIqG/eJia65dQPX6ccBEtO
         Su9i+EkiFENFt5Qt8JN04ixLN6IsgiHjLkKwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710764866; x=1711369666;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Dqy3uGGUTCCJ04acWTfAoJy8UG8EAW2DBMPEf+PuuY=;
        b=joo/EJ4dtc6GXUCHf69hLH3v75ppt1fdEclRqn2+MrExw3btiP0ETcLhU40TJXKcDU
         IGNyzACJMtOI1SeE+4rfw7hkt1FKsfR1u17Q1TX/AZWelOrCjtAzjkRjdsek3ZWcORzz
         WMGKHYmdfiXJfUCFA1JHWNDEr0xikqNA9dCBuafzb0D4Cr2eg6BKSjrrcBNC1uXNKWrF
         9mTahoYhEbI6Qtm8ca4x1Gt80rnjTdL9Elbs1K+JJbpnyEjAzpJ4fWhFGAK1sWZ+lV04
         5zizQhuMKqKsBqWIOfh3zerytYijI0aOetJWDInZJIE1CEoD2uvSFcz+BEOFU6B6X89W
         r6tA==
X-Forwarded-Encrypted: i=1; AJvYcCXpsjZEglNjDdJQlWOInoenoPnqrD0St0b91mPHep3oGNvS0G02P2u5VW0axscOgbE3T9DM6pw78/81iwcKBKbpNlvoS2zl2Fy6QG/GiTA=
X-Gm-Message-State: AOJu0Yy/I7bjU8gHlGbkAPayb3oRomoF6TrIO/OWeDpmVRF8szCv0FTA
	sE7HbgIGCEzLdJEnJyzPRYx47dmf5NwGEkpms5ZY2q3kFEyLHRlzjuwj4UuRMwU=
X-Google-Smtp-Source: AGHT+IHQYRWvquMY99FoEEq6TMEPjL4BHr2fO6YqBLzxWEBlz8HILXUMSDhBdyCh6SNWpaC7L6lohA==
X-Received: by 2002:a0c:8ec7:0:b0:691:497a:334 with SMTP id y7-20020a0c8ec7000000b00691497a0334mr19268365qvb.2.1710764866433;
        Mon, 18 Mar 2024 05:27:46 -0700 (PDT)
Message-ID: <2b40f2d6-9096-4e14-bdb3-e218bc3919fa@citrix.com>
Date: Mon, 18 Mar 2024 12:27:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
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
 <cc3c0484-a896-4100-8400-50036d1e8c71@citrix.com>
 <f088d9ac-fded-495e-9cc2-8514f7eb3e31@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f088d9ac-fded-495e-9cc2-8514f7eb3e31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2024 9:13 am, Jan Beulich wrote:
> On 14.03.2024 19:51, Andrew Cooper wrote:
>> On 14/03/2024 6:47 pm, Andrew Cooper wrote:
>>> On 14/03/2024 2:30 pm, Jan Beulich wrote:
>>>> On 13.03.2024 18:27, Andrew Cooper wrote:
>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>> @@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
>>>>>      if ( contig_mask )
>>>>>      {
>>>>>          /* See pt-contig-markers.h for a description of the marker scheme. */
>>>>> -        unsigned int i, shift = find_first_set_bit(contig_mask);
>>>>> +        unsigned int i, shift = ffsl(contig_mask) - 1;
>>>> The need for subtracting 1 is why personally I dislike ffs() / ffsl() (and
>>>> why I think find_first_set_bit() and __ffs() (but no __ffsl()) were
>>>> introduced).
>>> It's sad that there are competing APIs with different bit-labelling, but
>>> the optimiser does cancel the -1 with arch_ffs() (for at least x86 and
>>> ARM that I studied in detail).
>>>
>>> I firmly believe that fewer APIs which are fully well defined (and can
>>> optimise based on the compiler's idea of safety) is still better than a
>>> maze of APIs with different behaviours.
> I agree here. The anomaly (as I would call it) with ffs(), though, is what
> makes me wonder whether we might not be better off introducing ctz() and
> clz() instead. Unlike ffs() their name says exactly what is meant. This is
> then also a clear hint, for Arm and RISC-V at least, what underlying
> instruction is used. Plus there are matching builtins (unlike for e.g.
> fls()).

I considered this, but I think it will be a bad idea.

Right now, almost all of our logic is expressed in terms of
ffs()/fls().  Rearranging this to clz/ctz is risky enough on its own,
let alone the potential for mistakes during backport.

Both ffs() and fls() are well defined for all inputs, and I've found a
way to let the optimiser deal with simplifying things when safe to do so.

Therefore, keeping ffs()/fls() is the right thing to do.  It's harder to
shoot yourself in the foot with, and optimiser can still do an good job
in the general case.

~Andrew

