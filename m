Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF94387077
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 06:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128588.241381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liqyY-0007pM-9b; Tue, 18 May 2021 04:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128588.241381; Tue, 18 May 2021 04:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liqyY-0007mv-6N; Tue, 18 May 2021 04:04:58 +0000
Received: by outflank-mailman (input) for mailman id 128588;
 Tue, 18 May 2021 04:04:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k696=KN=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1liqyW-0007mp-0S
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 04:04:56 +0000
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c59bddc-d987-4111-98e9-643c8ae21d30;
 Tue, 18 May 2021 04:04:55 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so7500760oth.8
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 21:04:55 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id a18sm3657807otp.48.2021.05.17.21.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 21:04:54 -0700 (PDT)
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
X-Inumbo-ID: 5c59bddc-d987-4111-98e9-643c8ae21d30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TuYjVpp13TZsuq7/CADVizMkRzWxPfWgCLP5dnTDveQ=;
        b=dfI6o7sShjPqqzYHgCa5PMDHdbBtgrfVY/PisFPUA62ayRq0/4e8yLZkj90bgtx0su
         lNLagUKWC+o/7zcbbrPnCcy7KeuhtDk3Aey2VAame1PchlMWI/WWituK3vBCjy28BF4J
         lpG4N7JoH/3uKOF5891jnqSO+VzPzxBVGFjUKcIG770OEXuluIYJGHOpD+f8zVDdmFYB
         kX7bHelMsk4tYQHy7/9YnYEoMbyIvBm+jB6WpEoegRBpo3oPMekgeed3YXpOJLkbeCp1
         c2EToXJNGYak8s39fSUTFgy5rzgf2GuKShBHv9oYRZOW6BOEdzaRf1/wjYJGE0jaFvMw
         udCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TuYjVpp13TZsuq7/CADVizMkRzWxPfWgCLP5dnTDveQ=;
        b=RYslNQCi9sjtruR1CeKbUM9OcU3HwjWA/PIDz4HfEyAmPSJpFWCHvczeuHuKduYFm3
         QCv3mjt95PAJ3HVTp/FRNWl9eBTDDXBTftikcEg1roZDclnDSyNl3BayYPjgxo9/x6pw
         XW+GdFa8/xOM2Y+n1uDU8ypplK0o+4nIuTyTd+QsrCTVPE1gQlvIxuF9IbbGnc3MFh6H
         aIQPDNjJIFXZrR8bb+OjWMO8V8vdn1/To+tsDt++BgitE1simckCOuwFtWWJRVaQ4wz0
         eRCp8ZaWyzcf0KIPZ1tqRb7sT0sY8LKT3fVIy7b7frlKSqCY7v3VdWk6rdH06Lbm+7d4
         E/Vg==
X-Gm-Message-State: AOAM533G4GkabSQoC/uxoRX+AdaZbwHZFNrO4KNX5qUBxnKtd8vgs8kk
	iDCeMO99jVdoQmoMZUQA+vk=
X-Google-Smtp-Source: ABdhPJxXa0u7eT86x6L3KW1czgYdGewExdiIQM6JN+aacEsgaFazI+zk2h2pNmmEjTBJaW9z64g6TA==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr2583971otj.351.1621310694862;
        Mon, 17 May 2021 21:04:54 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] xen: Add files needed for minimal riscv build
To: Bob Eshleman <bobbyeshleman@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1621017334.git.connojdavis@gmail.com>
 <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
 <97815ecd-7335-9c85-5df8-802ed119d518@gmail.com>
 <fcc06468-3249-6e6a-dfbd-fc9f69a3de2b@gmail.com>
 <bbfaf1d6-5d2c-1a79-6237-c42083635d77@gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <07b22852-5e80-695b-2877-bc6ecd03d35c@gmail.com>
Date: Mon, 17 May 2021 22:05:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <bbfaf1d6-5d2c-1a79-6237-c42083635d77@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/17/21 7:43 PM, Bob Eshleman wrote:
> On 5/14/21 4:47 PM, Connor Davis wrote:
>> On 5/14/21 3:53 PM, Bob Eshleman wrote:
>>> On 5/14/21 11:53 AM, Connor Davis wrote:
>>>
>>>> +
>>>> +#ifdef CONFIG_RISCV_64
>>>> +
>>>> +/*
>>>> + * RISC-V Layout:
>>>> + *   0x0000000000000000 - 0x0000003fffffffff (256GB, L2 slots [0-255])
>>>> + *     Unmapped
>>>> + *   0x0000004000000000 - 0xffffffbfffffffff
>>>> + *     Inaccessible: sv39 only supports 39-bit sign-extended VAs.
>>>> + *   0xffffffc000000000 - 0xffffffc0001fffff (2MB, L2 slot [256])
>>>> + *     Unmapped
>>>> + *   0xffffffc000200000 - 0xffffffc0003fffff (2MB, L2 slot [256])
>>>> + *     Xen text, data, bss
>>>> + *   0xffffffc000400000 - 0xffffffc0005fffff (2MB, L2 slot [256])
>>>> + *     Fixmap: special-purpose 4K mapping slots
>>>> + *   0xffffffc000600000 - 0xffffffc0009fffff (4MB, L2 slot [256])
>>>> + *     Early boot mapping of FDT
>>>> + *   0xffffffc000a00000 - 0xffffffc000bfffff (2MB, L2 slot [256])
>>>> + *     Early relocation address, used when relocating Xen and later
>>>> + *     for livepatch vmap (if compiled in)
>>>> + *   0xffffffc040000000 - 0xffffffc07fffffff (1GB, L2 slot [257])
>>>> + *     VMAP: ioremap and early_ioremap
>>>> + *   0xffffffc080000000 - 0xffffffc13fffffff (3GB, L2 slots [258..260])
>>>> + *     Unmapped
>>>> + *   0xffffffc140000000 - 0xffffffc1bfffffff (2GB, L2 slots [261..262])
>>>> + *     Frametable: 48 bytes per page for 133GB of RAM
>>>> + *   0xffffffc1c0000000 - 0xffffffe1bfffffff (128GB, L2 slots [263..390])
>>>> + *     1:1 direct mapping of RAM
>>>> + *   0xffffffe1c0000000 - 0xffffffffffffffff (121GB, L2 slots [391..511])
>>>> + *     Unmapped
>>>> + */
>>>> +
>>> What is the benefit of moving the layout up to 0xffffffc000000000?
>> I thought it made the most sense to use the upper half since Xen is privileged
>>
>> and privileged code is typically mapped in the upper half, at least on x86. I'm happy to
>>
>> move it down if that would be preferred.
>>
>>
> I do like the idea of following norms, but I think I prefer following the ARM norm
> over the x86 norm unless there is a technical reason not to. Just due to
> ARM and RISC-V having much more overlap than x86 and RISC-V.  In this case,
> all things being equal, I'd prefer following the ARM model and use the lower half.
> I definitely like adding the note on the inaccessible region.

Sounds good, I will move it down.


Thanks,

Connor


