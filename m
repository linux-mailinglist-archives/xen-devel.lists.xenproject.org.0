Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D287C0BB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 16:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693344.1081294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknRA-00081R-9Q; Thu, 14 Mar 2024 15:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693344.1081294; Thu, 14 Mar 2024 15:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rknRA-0007yu-69; Thu, 14 Mar 2024 15:56:08 +0000
Received: by outflank-mailman (input) for mailman id 693344;
 Thu, 14 Mar 2024 15:56:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rR1U=KU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rknR9-0007yo-7X
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 15:56:07 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bd8a0b3-e21b-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 16:56:03 +0100 (CET)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-430a0d6c876so3244191cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 08:56:03 -0700 (PDT)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jx5-20020a0562142b0500b0068f4520e42dsm616461qvb.16.2024.03.14.08.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:56:01 -0700 (PDT)
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
X-Inumbo-ID: 5bd8a0b3-e21b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710431762; x=1711036562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cZ4RQK3/QRbhwXTVy1hgCxBHnNNmY9tzE2Sh2FydxA=;
        b=P1Uf/lofcsYpE4ZPkDkFTm0pCbvMRxwZYQHzICEHKCdM3tl4I6va/KgaSX3OJuaD0C
         VLUNAICHf5xhSsE2hcGSEMKv+iYVvOjg/Io1nXxJkikfwG7i8Z+BDZdIfw7KX3OrYuLI
         kK8jSGp4Tgx+lELoBxrOtQ9nrz/bttVH8W6Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431762; x=1711036562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cZ4RQK3/QRbhwXTVy1hgCxBHnNNmY9tzE2Sh2FydxA=;
        b=tyx9NsOXO5mL30o+53BHP+r3mMcfQ/+RQzmMWYBJmcKeVT7zMtAE1OGHDed/WoGNmV
         LaP+QX6ELQs8TznzAqyhALVAdsFwYjfGuX6EXhj4UljMnwv1F0Jg/AkoLDPP3P3nvItH
         DGJmrUogsW8FhrK1iptqC4ZkU5VzmvUtwTubQ4PZ9xEHOMRC7plvcCjH/+6EtTHN4Y86
         bMHFHOVTDhuoEtsQMUUvWApTxoOGSDT5JTuqM7jLSh40vI1xHGQFAoU7uVntMKXjFtQL
         5yoQW1ZS6uOO4VexjvRc1magBbqqIudy2r5c9EC7VsbPEW0ylOg0y3IoASKJQuN8Sa2m
         Rb+w==
X-Forwarded-Encrypted: i=1; AJvYcCWwbxj4GP/Hsk2sPEfucr3irjwSZD1B9MdOXQBX4wu/CRyHM0N6SJdlrUFZpIfjDbwxMSGiRrykXdOLMZT2h3wX5b6vwOA6Ai5aHgkq8NE=
X-Gm-Message-State: AOJu0YzOApgXqBlTuU+0BoslSSQstLGrim3aJ3TkaN+beCcPe5PuqCY6
	QAO20Whc1z4ZJmrmHAfEofu/gZAtPc/q5voRKnx/5SeFVQ9PXjWWyiLkXsTcv68=
X-Google-Smtp-Source: AGHT+IE1fkpWVniQXZnpVpjD9QrkVQUhmbpQ0qf62KPdP+zbWQApGqW1VEl/Xo8mnS2RLaVCaD2RxA==
X-Received: by 2002:a0c:e346:0:b0:690:bd8c:c360 with SMTP id a6-20020a0ce346000000b00690bd8cc360mr2098200qvm.43.1710431762300;
        Thu, 14 Mar 2024 08:56:02 -0700 (PDT)
Message-ID: <747617cf-e24d-4c66-988b-2fee365404a0@citrix.com>
Date: Thu, 14 Mar 2024 15:55:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RISCV] [PATCH 0/7] xen/bitops: Reduce the mess, starting with
 ffs()
Content-Language: en-GB
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
 <1805b028-e21f-448f-bf94-2156092e40a5@citrix.com>
 <e233c298-66aa-4653-9b83-18006abe63eb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e233c298-66aa-4653-9b83-18006abe63eb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2024 3:33 pm, Jan Beulich wrote:
> On 14.03.2024 15:45, Andrew Cooper wrote:
>> On 13/03/2024 5:27 pm, Andrew Cooper wrote:
>>> Start cleaning it up with ffs() and friends.  Across the board, this adds:
>>>
>>>  * Functioning bitops without arch-specific asm
>> It turns out that RISC-V doesn't have a CLZ instruction in the base
>> ISA.  As a consequence, __builtin_ffs() emits a library call to ffs() on
>> GCC, or a de Bruijn sequence on Clang.
>>
>> The optional Zbb extension adds a CLZ instruction, after which
>> __builtin_ffs() emits a very simple sequence.
>>
>> This leaves us with several options.
>>
>> 1) Put generic_ffs() back in, although if we do this then it's going to
>> be out-of-line in lib/ where it can be mostly ignored.
>>
>> 2) Require Zbb for Xen.
>>
>> 3) Alternative it up with Zbb or generic_ffs().
>>
>>
>> I've got half a mind to do 1) irrespective.  It's mostly just shuffling
>> logic out of bitops.h into lib/.
> Yes. Might also help with the bi-sectability issue you faced.

I'm not sure it will help for bisectability in this case.  But it might
simplify some of the other rearrangements.


>> I also think we should do option 2 for RISCV.  Given the instruction
>> groups that H does mandate, it's unrealistic to expect that such a chip
>> wouldn't support Zbb/etc.
> I'm not so sure here.
>
>> Also, getting full alternatives working is yet-more work that's not
>> trivial at this point in RISCV's development.  I think it is entirely
>> reasonable to avoid this work for now, and make it a problem for anyone
>> who has an H-capable Zbb-incapable system.  (with a strong implication
>> that this is work that probably never needs to be done.)
> That's definitely for later.

The argument being made is that it seems highly unlikely for there to be
non-Zbb systems running Xen, and furthermore, if this turns out not to
be true, it is reasonable to offload the effort of making it work to
whomever has hardware looking like that.

i.e. it's fine to require Zbb at this point.

This doesn't prevent someone else doing the work to alter this in the
future, for what appears to be an absurd configuration that is unlikely
to exist in reality.

~Andrew

