Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2EC94A566
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 12:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773282.1183720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdsE-0003n2-8F; Wed, 07 Aug 2024 10:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773282.1183720; Wed, 07 Aug 2024 10:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbdsE-0003kw-4z; Wed, 07 Aug 2024 10:26:30 +0000
Received: by outflank-mailman (input) for mailman id 773282;
 Wed, 07 Aug 2024 10:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sbdsC-0003MI-Lk
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 10:26:28 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8141d2b7-54a7-11ef-bc04-fd08da9f4363;
 Wed, 07 Aug 2024 12:26:27 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so2153948a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 03:26:27 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0b8dasm624162266b.83.2024.08.07.03.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 03:26:26 -0700 (PDT)
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
X-Inumbo-ID: 8141d2b7-54a7-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723026387; x=1723631187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+yWkpUGbn5rI64AYdVaoeb2qv2IE7IG5GMZ/XTUW3k=;
        b=VJtN49MNG+63nukO45Y81oOKxNx3sIsZntyxgwVx5XFG9GWm+XVQiE2fARzuMJUSks
         t0X6IfKG+/IZIYLKjjFSvRocs50xdG27dCCdTnoRD4IsfmXMjUB7DuOGu69mQO8NzT9E
         5WhepqvyUQNtE/vao6b3rKXzAWWIesQcOVI+0eS4H/erPHwKVh+erhSGoVa7IugYL+ex
         M6kJg8O7oFPSXGu7hfomxwXpV9LsXIwfmR4y/qqmI9i5xBrgExwzo+7/xiPS8SEim3TM
         L4+oGsA7rPkVIz+kMqramcn3pAqAnZe/AzNQfjfmCqNlWLRh6UwcfD+jwTfoOfvocSGW
         p5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723026387; x=1723631187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+yWkpUGbn5rI64AYdVaoeb2qv2IE7IG5GMZ/XTUW3k=;
        b=ny+FcNWOkGwWGZ8NxET+KXB7RH6u/qXGS1r22Wxd7JsjjwRKuXp0TOmRq8PHY+uyZp
         DzdBbNiinn90LhkGPP4ipezm8R2u6B5zoweh2Nj5LthSR4dhw7DXNfTHf3a/wDP6Kflo
         J1LTV9GSjVnGSl4TOlgexGlteoeohzqCnvlsAmWNs2PHlKtXrgi7mWI15kktJbxFAPy/
         Jk/koHPigncsp5mgsbYyq/fjUHQ/by8MtYNDQJYT4kGgxwbnq/GPSa7KjvX8/R5Vx6zg
         omUs7O42u7NiVgEvq8fBUKb+8ffpwIDGWcWRas/qqRqoNSQX3+Sz5B7fllsgSyd5J5Nq
         R9dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL90D2BD5ICrfi4YNdbyeiZneG1tQmYagTUsshap/SRyiN4M5N1YZA89eFftrWECFnwL5SQuXSeSkEXBBaTh1q5wpbCWy6arP41hylKCM=
X-Gm-Message-State: AOJu0YzreeL4YIhLlWzjhPktgSg2v1mIrJFYlZ6PMHVe8/vnUuSi1RlL
	byVt749gNWgA6fxQzniEfq1beUTaohvz++wfQXZGadgr7+/k6Ho+y4AhPOYMEYk=
X-Google-Smtp-Source: AGHT+IGMq/EWEpoUXL5nXdqEBBXqLYJ72GtWWY89H2AwugTgFUvaX31KAHfjOpZUqY64Vwcc+HcDkA==
X-Received: by 2002:a17:907:d92:b0:a77:dcda:1fe1 with SMTP id a640c23a62f3a-a7dc4fb01ddmr1391606166b.25.1723026387024;
        Wed, 07 Aug 2024 03:26:27 -0700 (PDT)
Message-ID: <73dd2dea-d3bc-490e-b5a4-3d426cf5660b@suse.com>
Date: Wed, 7 Aug 2024 12:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl> <6a7508dd-9f81-4fce-9c83-8b4fae924d48@suse.com>
 <ZrI_YSBSiC7w5iP6@mail-itl> <1dc37ba4-c0ef-4be7-9699-31cf839c6deb@suse.com>
 <ZrNLDmRC_5DC_1K3@mail-itl>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZrNLDmRC_5DC_1K3@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07.08.24 12:23, Marek Marczykowski-Górecki wrote:
> On Tue, Aug 06, 2024 at 05:24:22PM +0200, Jürgen Groß wrote:
>> On 06.08.24 17:21, Marek Marczykowski-Górecki wrote:
>>> On Tue, Aug 06, 2024 at 04:12:32PM +0200, Jürgen Groß wrote:
>>>> Marek,
>>>>
>>>> On 17.06.24 16:03, Marek Marczykowski-Górecki wrote:
>>>>> On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
>>>>>> Hello,
>>>>>>
>>>>>> while it feels like we had a similar situation before, I can't seem to be
>>>>>> able to find traces thereof, or associated (Linux) commits.
>>>>>
>>>>> Is it some AMD Threadripper system by a chance? Previous thread on this
>>>>> issue:
>>>>> https://lore.kernel.org/xen-devel/CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com/
>>>>>
>>>>>> With
>>>>>>
>>>>>> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
>>>>>> ...
>>>>>> (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 pages to be allocated)
>>>>>> ...
>>>>>> (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
>>>>>>
>>>>>> the kernel occupies the space from 16Mb to 64Mb in the initial allocation.
>>>>>> Page tables come (almost) directly above:
>>>>>>
>>>>>> (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
>>>>>>
>>>>>> I.e. they're just above the 64Mb boundary. Yet sadly in the host E820 map
>>>>>> there is
>>>>>>
>>>>>> (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
>>>>>>
>>>>>> i.e. a non-RAM range starting at 64Mb. The kernel (currently) won't tolerate
>>>>>> such an overlap (also if it was overlapping the kernel image, e.g. if on the
>>>>>> machine in question s sufficiently much larger kernel was used). Yet with its
>>>>>> fundamental goal of making its E820 match the host one I'm also in trouble
>>>>>> thinking of possible solutions / workarounds. I certainly do not see Xen
>>>>>> trying to cover for this, as the E820 map re-arrangement is purely a kernel
>>>>>> side decision (forward ported kernels got away without, and what e.g. the
>>>>>> BSDs do is entirely unknown to me).
>>>>>
>>>>> In Qubes we have worked around the issue by moving the kernel lower
>>>>> (CONFIG_PHYSICAL_START=0x200000):
>>>>> https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac1682370977d4d0dc1d782c428d860282
>>>>>
>>>>> Far from ideal, but gets it bootable...
>>>>>
>>>>
>>>> could you test the attached kernel patches? They should fix the issue without
>>>> having to modify CONFIG_PHYSICAL_START.
>>>>
>>>> I have tested them to boot up without problem on my test system, but I don't
>>>> have access to a system showing the E820 map conflict you are seeing.
>>>>
>>>> The patches have been developed against kernel 6.11-rc2, but I think they
>>>> should apply to a 6.10 and maybe even an older kernel.
>>>
>>> Sure, but tomorrow-ish.
>>
>> Thanks.
> 
> Seems to work :)
> 
> Snippets from Xen log:
> 
>      (XEN) EFI RAM map:
>      (XEN)  [0000000000000000, 000000000009ffff] (usable)
>      (XEN)  [00000000000a0000, 00000000000fffff] (reserved)
>      (XEN)  [0000000000100000, 0000000003ffffff] (usable)
>      (XEN)  [0000000004000000, 0000000004011fff] (ACPI NVS)
>      (XEN)  [0000000004012000, 0000000009df1fff] (usable)
>      (XEN)  [0000000009df2000, 0000000009ffffff] (reserved)
>      (XEN)  [000000000a000000, 00000000a8840fff] (usable)
>      (XEN)  [00000000a8841000, 00000000a9d9ffff] (reserved)
>      (XEN)  [00000000a9da0000, 00000000a9dd4fff] (ACPI data)
>      (XEN)  [00000000a9dd5000, 00000000a9dd5fff] (reserved)
>      (XEN)  [00000000a9dd6000, 00000000a9f20fff] (ACPI data)
>      (XEN)  [00000000a9f21000, 00000000aa099fff] (ACPI NVS)
>      (XEN)  [00000000aa09a000, 00000000ab1fefff] (reserved)
>      (XEN)  [00000000ab1ff000, 00000000abffffff] (usable)
>      (XEN)  [00000000ac000000, 00000000afffffff] (reserved)
>      (XEN)  [00000000b2500000, 00000000b2580fff] (reserved)
>      (XEN)  [00000000b3580000, 00000000b3600fff] (reserved)
>      (XEN)  [00000000e2100000, 00000000e2280fff] (reserved)
>      (XEN)  [00000000fa180000, 00000000fa200fff] (reserved)
>      (XEN)  [00000000fa300000, 00000000fa3fffff] (reserved)
>      (XEN)  [00000000fea00000, 00000000feafffff] (reserved)
>      (XEN)  [00000000fec00000, 00000000fec00fff] (reserved)
>      (XEN)  [00000000fec10000, 00000000fec10fff] (reserved)
>      (XEN)  [00000000fed00000, 00000000fed00fff] (reserved)
>      (XEN)  [00000000fed40000, 00000000fed44fff] (reserved)
>      (XEN)  [00000000fed80000, 00000000fed8ffff] (reserved)
>      (XEN)  [00000000fedc2000, 00000000fedcffff] (reserved)
>      (XEN)  [00000000fedd4000, 00000000fedd5fff] (reserved)
>      (XEN)  [00000000fee00000, 00000000feefffff] (reserved)
>      (XEN)  [00000000ff000000, 00000000ffffffff] (reserved)
>      (XEN)  [0000000100000000, 000000104f1fffff] (usable)
>      (XEN)  [000000104f200000, 000000104fffffff] (reserved)
>      (XEN)  [0000010000000000, 00000100103fffff] (reserved)
>      (XEN)  [0000018030000000, 00000180403fffff] (reserved)
>      (XEN)  [0000018060000000, 00000180703fffff] (reserved)
>      (XEN)  [0000020090000000, 00000200a03fffff] (reserved)
>      ...
>      (XEN) Dom0 has maximum 1400 PIRQs
>      (XEN)  Xen  kernel: 64-bit, lsb
>      (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4800000
>      (XEN) PHYSICAL MEMORY ARRANGEMENT:
>      (XEN)  Dom0 alloc.:   0000001010000000->0000001018000000 (1000315 pages to be allocated)
>      (XEN)  Init. ramdisk: 000000104b57b000->000000104f1ffe72
>      (XEN) VIRTUAL MEMORY ARRANGEMENT:
>      (XEN)  Loaded kernel: ffffffff81000000->ffffffff84800000
>      (XEN)  Phys-Mach map: 0000008000000000->0000008000800000
>      (XEN)  Start info:    ffffffff84800000->ffffffff848004b8
>      (XEN)  Page tables:   ffffffff84801000->ffffffff8482a000
>      (XEN)  Boot stack:    ffffffff8482a000->ffffffff8482b000
>      (XEN)  TOTAL:         ffffffff80000000->ffffffff84c00000
>      (XEN)  ENTRY ADDRESS: ffffffff838b7640
> 
> So, it would indeed conflict with the ACPI NVS region, but the system
> started, and later dom0 reports this region remapped:
> 
>      [    0.000000] BIOS-provided physical RAM map:
>      [    0.000000] Xen: [mem 0x0000000000000000-0x000000000007ffff] usable
>      [    0.000000] Xen: [mem 0x0000000000080000-0x00000000000fffff] reserved
>      [    0.000000] Xen: [mem 0x0000000000100000-0x0000000009df1fff] usable
>      [    0.000000] Xen: [mem 0x0000000009df2000-0x0000000009ffffff] reserved
>      [    0.000000] Xen: [mem 0x000000000a000000-0x00000000a8840fff] usable
>      [    0.000000] Xen: [mem 0x00000000a8841000-0x00000000a9d9ffff] reserved
>      [    0.000000] Xen: [mem 0x00000000a9da0000-0x00000000a9dd4fff] ACPI data
>      [    0.000000] Xen: [mem 0x00000000a9dd5000-0x00000000a9dd5fff] reserved
>      [    0.000000] Xen: [mem 0x00000000a9dd6000-0x00000000a9f20fff] ACPI data
>      [    0.000000] Xen: [mem 0x00000000a9f21000-0x00000000aa099fff] ACPI NVS
>      [    0.000000] Xen: [mem 0x00000000aa09a000-0x00000000ab1fefff] reserved
>      [    0.000000] Xen: [mem 0x00000000ab1ff000-0x00000000abffffff] usable
>      [    0.000000] Xen: [mem 0x00000000ac000000-0x00000000afffffff] reserved
>      [    0.000000] Xen: [mem 0x00000000b2500000-0x00000000b2580fff] reserved
>      [    0.000000] Xen: [mem 0x00000000b3580000-0x00000000b3600fff] reserved
>      [    0.000000] Xen: [mem 0x00000000e2100000-0x00000000e2280fff] reserved
>      [    0.000000] Xen: [mem 0x00000000fa180000-0x00000000fa200fff] reserved
>      [    0.000000] Xen: [mem 0x00000000fa300000-0x00000000fa3fffff] reserved
>      [    0.000000] Xen: [mem 0x00000000fea00000-0x00000000feafffff] reserved
>      [    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
>      [    0.000000] Xen: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
>      [    0.000000] Xen: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
>      [    0.000000] Xen: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
>      [    0.000000] Xen: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
>      [    0.000000] Xen: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
>      [    0.000000] Xen: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
>      [    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
>      [    0.000000] Xen: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
>      [    0.000000] Xen: [mem 0x0000000100000000-0x0000000156c4bfff] usable
>      [    0.000000] Xen: [mem 0x000000104f1ee000-0x000000104f1fffff] ACPI NVS
>      [    0.000000] Xen: [mem 0x000000104f200000-0x000000104fffffff] reserved
>      [    0.000000] Xen: [mem 0x0000010000000000-0x00000100103fffff] reserved
>      [    0.000000] Xen: [mem 0x0000018030000000-0x00000180403fffff] reserved
>      [    0.000000] Xen: [mem 0x0000018060000000-0x00000180703fffff] reserved
>      [    0.000000] Xen: [mem 0x0000020090000000-0x00000200a03fffff] reserved

Thanks for the testing!

Are you fine with me adding your "Tested-by:"?


Juergen

