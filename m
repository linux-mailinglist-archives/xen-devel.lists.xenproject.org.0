Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B403C38145C
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 01:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127625.239882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhWV-000888-Ri; Fri, 14 May 2021 23:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127625.239882; Fri, 14 May 2021 23:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhWV-00086E-OV; Fri, 14 May 2021 23:47:15 +0000
Received: by outflank-mailman (input) for mailman id 127625;
 Fri, 14 May 2021 23:47:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhhWT-000868-QU
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 23:47:13 +0000
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38dfd6f4-f401-48ab-b9a1-a7c045a3d441;
 Fri, 14 May 2021 23:47:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id n10so417687ion.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 16:47:12 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id x5sm2442284ilj.28.2021.05.14.16.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 16:47:12 -0700 (PDT)
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
X-Inumbo-ID: 38dfd6f4-f401-48ab-b9a1-a7c045a3d441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=U4pRru/QMk+VbrTz7X/lmqPanNtSdNtq+IjuZFqazRI=;
        b=rrneePu+QjkAiTpOd0rpjcVYJlqzNWjs8UGqBVC0Zap92j9MkIQB+RbZ7OrZOss5qI
         seWkh8ORZpsv/knrsL9/6pNlVl3njJz+s/iLX3eW4yQKvNXjHnisYq9O7O3ORF9M3GXw
         1tJ5rMFBS30GAtqxUHFILAewKJ3VCMW4WflQXG2/4FzGAfaW70X+Izez19S3XiEK2zTf
         SxqUJRN+l7Sswje6/AEcQwyckP/sD2W1dTeeRiQToC9iGHpSNPWi5Kh/xRayZPZgwvTY
         1M6p9PQBeY+2kLFBiH0vrlRrkx31zEIUw2VZkm71dzS0EebYx9XzLLRr5Z0ToPyODfht
         kCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=U4pRru/QMk+VbrTz7X/lmqPanNtSdNtq+IjuZFqazRI=;
        b=Lv28/xwUyniqi9ZTt6Kyl4ptHhT40HesGJL8pYx+/LxxROSroV0h1AwaQRkF/qp4ni
         8u5lxU4U1lozzGzX+QacTruaTMjTJiizTloAg9mmwDjzySoJcozS7N0R6NLtiZXeuaWL
         DkGycKYQ8iiBnmhJWwDjMoz99rgn+ETWJlxO/7dLC7vZz/Hen9MJRacCqC68RenKkjTj
         BjAfqPbTLPU1sOiZf+vZF+vNB7vwyCqdyeD4p774/RnAzn+HmAm945dn5ImPQgT3x1AO
         lFEczZT5hMHJLuHSngvQzyJKyPmE2uWw5LSHCcjpwIqCu78k1njFaqpjMAz1Y+yR+zoa
         81xw==
X-Gm-Message-State: AOAM532giOJpjJdnfrYnUrx24dPSl0uHWEFwmcGu7n8i/KPMeyj55qMD
	ae9i6urNonfuV5NrtH8YSwg=
X-Google-Smtp-Source: ABdhPJy5zP9S+o6KKWFozMpDmudizL16bG006I8qKB4/3Y7yZer0Dsog3Saw5p82cDlLZjbWR8PgUw==
X-Received: by 2002:a05:6638:3013:: with SMTP id r19mr46160047jak.36.1621036032591;
        Fri, 14 May 2021 16:47:12 -0700 (PDT)
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
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <fcc06468-3249-6e6a-dfbd-fc9f69a3de2b@gmail.com>
Date: Fri, 14 May 2021 17:47:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <97815ecd-7335-9c85-5df8-802ed119d518@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/14/21 3:53 PM, Bob Eshleman wrote:
> On 5/14/21 11:53 AM, Connor Davis wrote:
>> Add arch-specific makefiles and configs needed to build for
>> riscv64. Also add a minimal head.S that is a simple infinite loop.
>> head.o can be built with
>>
>> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=head.o
>>
> I recently realized that the Linux kernel build uses `ARCH=riscv`
> with 32 vs 64 being differentiated by Kconfig opts (and __riscv_xlen).
> I think `riscv64` was inherited by `arm64`.  This is something I'd
> like to eventually change the Xen build to (i.e.,
> `XEN_TARGET_ARCH=riscv make`) would it be possible for us to get that
> in this series?

Sure, I can do that

>
>> diff --git a/xen/include/asm-riscv/config.h b/xen/include/asm-riscv/config.h
>> new file mode 100644
>> index 0000000000..84cb436dc1
>> --- /dev/null
>> +++ b/xen/include/asm-riscv/config.h
>> @@ -0,0 +1,110 @@
>> +/******************************************************************************
>> + * config.h
>> + *
>> + * A Linux-style configuration list.
>> + */
>> +
>> +#ifndef __RISCV_CONFIG_H__
>> +#define __RISCV_CONFIG_H__
>> +
> ...
>
>> +
>> +#ifdef CONFIG_RISCV_64
>> +
>> +/*
>> + * RISC-V Layout:
>> + *   0x0000000000000000 - 0x0000003fffffffff (256GB, L2 slots [0-255])
>> + *     Unmapped
>> + *   0x0000004000000000 - 0xffffffbfffffffff
>> + *     Inaccessible: sv39 only supports 39-bit sign-extended VAs.
>> + *   0xffffffc000000000 - 0xffffffc0001fffff (2MB, L2 slot [256])
>> + *     Unmapped
>> + *   0xffffffc000200000 - 0xffffffc0003fffff (2MB, L2 slot [256])
>> + *     Xen text, data, bss
>> + *   0xffffffc000400000 - 0xffffffc0005fffff (2MB, L2 slot [256])
>> + *     Fixmap: special-purpose 4K mapping slots
>> + *   0xffffffc000600000 - 0xffffffc0009fffff (4MB, L2 slot [256])
>> + *     Early boot mapping of FDT
>> + *   0xffffffc000a00000 - 0xffffffc000bfffff (2MB, L2 slot [256])
>> + *     Early relocation address, used when relocating Xen and later
>> + *     for livepatch vmap (if compiled in)
>> + *   0xffffffc040000000 - 0xffffffc07fffffff (1GB, L2 slot [257])
>> + *     VMAP: ioremap and early_ioremap
>> + *   0xffffffc080000000 - 0xffffffc13fffffff (3GB, L2 slots [258..260])
>> + *     Unmapped
>> + *   0xffffffc140000000 - 0xffffffc1bfffffff (2GB, L2 slots [261..262])
>> + *     Frametable: 48 bytes per page for 133GB of RAM
>> + *   0xffffffc1c0000000 - 0xffffffe1bfffffff (128GB, L2 slots [263..390])
>> + *     1:1 direct mapping of RAM
>> + *   0xffffffe1c0000000 - 0xffffffffffffffff (121GB, L2 slots [391..511])
>> + *     Unmapped
>> + */
>> +
> What is the benefit of moving the layout up to 0xffffffc000000000?

I thought it made the most sense to use the upper half since Xen is 
privileged

and privileged code is typically mapped in the upper half, at least on 
x86. I'm happy to

move it down if that would be preferred.


Thanks,

Connor


