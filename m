Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0D87EA05
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694692.1083711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCyW-0008UI-Iy; Mon, 18 Mar 2024 13:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694692.1083711; Mon, 18 Mar 2024 13:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmCyW-0008Rt-FC; Mon, 18 Mar 2024 13:24:24 +0000
Received: by outflank-mailman (input) for mailman id 694692;
 Mon, 18 Mar 2024 13:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmCyV-0008Rn-EK
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:24:23 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d49f04f9-e52a-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 14:24:21 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a466f796fc1so550134266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:24:21 -0700 (PDT)
Received: from [10.80.67.23] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ko6-20020a170906aa0600b00a46a9c38a64sm2530108ejb.65.2024.03.18.06.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:24:20 -0700 (PDT)
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
X-Inumbo-ID: d49f04f9-e52a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710768261; x=1711373061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUTij3OYTkLsjp4me+RmTl8kZLp1GeHkX4Fe0fiFvV0=;
        b=q64G9Xqwu/9g9PK+UVue6arImly0F61ZGJ7rNkcpp5UJzim04igpWbP/Mx9BSQ3rG0
         lndiGuWBkySlHBfhbY3Uo7l8H5MsnbuoMahHWqfnRMaui97P0gtm3JVlHwQFSvDQSU+D
         Z6F9XjXbQ6Z3cWCPq/ZyFCDJ7Vs7HGRiv1b88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710768261; x=1711373061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUTij3OYTkLsjp4me+RmTl8kZLp1GeHkX4Fe0fiFvV0=;
        b=Bwx+Qy+DbksdOKNOg7Z7JmB8KpgHAMNnbdt0uTybfXdCCJXiCm5mQSok1ks5tDmQ3r
         pm4R8ALPFl1sRt5Po/UQGxNjCqjYuvQLRMCTvOaiJXihEIuvo2BGWRL9mQxbS+YANEvw
         XQBHCT3S7bcqV4iuFjfyrnZKe9TSQh1FkCQV8WOmrb3u9X5VjqpNm5+xrTIkz7DECwQs
         SOeyoPGYbFZv9/XuYlEEmdELNZTcnYZDcFT8u7HeVtLoByhpWrFatyH1nKfIqO2GBHMX
         bzFHGkCnqDayR3fAZFIPZQSBurcx1gPzypTBLB7IwXacTNph+5BR6htsweMHAWFa93wc
         f7ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXsPoIn9aURzmY6IeJ/ThaO93boECALI3+uix9C2a01sWDHXBUfU8agRCWxV6Y+7WaZy0VZSIZTM5aFOvKLRj58lVLrISYUWK1UfEaBSqE=
X-Gm-Message-State: AOJu0YxdczCERqaDKPh1+xR3rU5jk/lgFuFora88apfE59bDLv/+8/9n
	AYhu8FUd2RV5YADZ8YIjuLtRkntDTPF/1ZU/o8jSkd+vapLQA8vT7il9la3c/Ao=
X-Google-Smtp-Source: AGHT+IGM4zB5jQjo/bwV6q90Mzlgxdko60AClFzBe3KfoKnucHSg3wRqcW4QEzeTG4vThFXM5G4m4A==
X-Received: by 2002:a17:906:3708:b0:a45:f215:ce89 with SMTP id d8-20020a170906370800b00a45f215ce89mr8179284ejc.6.1710768260827;
        Mon, 18 Mar 2024 06:24:20 -0700 (PDT)
Message-ID: <fdf6a4fc-f975-4b57-9170-d9e274de1c35@citrix.com>
Date: Mon, 18 Mar 2024 13:24:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen/virtual-region: Rework how bugframe linkage works
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-3-andrew.cooper3@citrix.com>
 <47ae2b45-b5da-4c5c-bbea-387f44d21a2f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <47ae2b45-b5da-4c5c-bbea-387f44d21a2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 1:17 pm, Jan Beulich wrote:
> On 18.03.2024 12:04, Andrew Cooper wrote:
>> The start/stop1/etc linkage scheme predates struct virtual_region, and as
>> setup_virtual_regions() shows, it's awkward to express in the new scheme.
>>
>> Change the linker to provide explicit start/stop symbols for each bugframe
>> type, and change virtual_region to have a stop pointer rather than a count.
>>
>> This marginly simplifies both do_bug_frame()s and prepare_payload(), but it
>> massively simplifies setup_virtual_regions() by allowing the compiler to
>> initialise the .frame[] array at build time.
>>
>> virtual_region.c is the only user of the linker symbols, and this is unlikely
>> to change given the purpose of struct virtual_region, so move their externs
>> out of bug.h
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Of course ...
>
>> --- a/xen/common/virtual_region.c
>> +++ b/xen/common/virtual_region.c
>> @@ -9,12 +9,25 @@
>>  #include <xen/spinlock.h>
>>  #include <xen/virtual_region.h>
>>  
>> +extern const struct bug_frame
>> +    __start_bug_frames_0[], __stop_bug_frames_0[],
>> +    __start_bug_frames_1[], __stop_bug_frames_1[],
>> +    __start_bug_frames_2[], __stop_bug_frames_2[],
>> +    __start_bug_frames_3[], __stop_bug_frames_3[];
>> +
>>  static struct virtual_region core = {
>>      .list = LIST_HEAD_INIT(core.list),
>>      .text_start = _stext,
>>      .text_end = _etext,
>>      .rodata_start = _srodata,
>>      .rodata_end = _erodata,
>> +
>> +    .frame = {
>> +        { __start_bug_frames_0, __stop_bug_frames_0 },
>> +        { __start_bug_frames_1, __stop_bug_frames_1 },
>> +        { __start_bug_frames_2, __stop_bug_frames_2 },
>> +        { __start_bug_frames_3, __stop_bug_frames_3 },
>> +    },
>>  };
>>  
>>  /* Becomes irrelevant when __init sections are cleared. */
>> @@ -22,6 +35,13 @@ static struct virtual_region core_init __initdata = {
>>      .list = LIST_HEAD_INIT(core_init.list),
>>      .text_start = _sinittext,
>>      .text_end = _einittext,
>> +
>> +    .frame = {
>> +        { __start_bug_frames_0, __stop_bug_frames_0 },
>> +        { __start_bug_frames_1, __stop_bug_frames_1 },
>> +        { __start_bug_frames_2, __stop_bug_frames_2 },
>> +        { __start_bug_frames_3, __stop_bug_frames_3 },
>> +    },
>>  };
> ... this is now calling yet louder for splitting runtime from init bug
> frame records.

How do you propose we do this?

We can probably do it for *.init.o objects by renaming the bugframe
sections too, but unless we can do it for *every* bugframe emitted in
all init code, splitting this will break things.

~Andrew

