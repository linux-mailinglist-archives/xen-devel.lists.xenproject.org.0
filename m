Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC89380AFE
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 16:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127372.239376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYOY-0007Ag-Cq; Fri, 14 May 2021 14:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127372.239376; Fri, 14 May 2021 14:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYOY-00077O-8y; Fri, 14 May 2021 14:02:26 +0000
Received: by outflank-mailman (input) for mailman id 127372;
 Fri, 14 May 2021 14:02:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhYOX-00077I-39
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 14:02:25 +0000
Received: from mail-il1-x12f.google.com (unknown [2607:f8b0:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d2a19cb-8365-4b0d-b450-7620496b5d4b;
 Fri, 14 May 2021 14:02:24 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id j30so4012142ila.5
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 07:02:24 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id h14sm3092234ils.13.2021.05.14.07.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:02:23 -0700 (PDT)
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
X-Inumbo-ID: 6d2a19cb-8365-4b0d-b450-7620496b5d4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uCLR6cY/lL8p7GrHVOGJbJLWtyXk2C9x9HUgrPSWLvo=;
        b=eGJr9DvMrrfXRbrjjysZHqyij7bTdRuRfBMgAAe0pxdpsFlfQbw2YLvEBv2HwufKhd
         v+NhGYafD4mXBqiFMuHJaYA3+M4XmGtaeZTrCne8901nXVrruu7PWu3e5TWI8mdhfftd
         fqJ3Nro6nxGvWrYvRZb53iDoArNk5tU+lAMsjQ9NMmE7mMnLVs2kxO7W5DqB4WvXKiuG
         5+Nu/uEVTtRNowBBM2lTBa5mWMy+PFe82IOJcxNbrUKms9XkmIbpA94ozNAJLd6GHWz4
         Ya6uoVzWWPsaHvsnUEcPL3m60NviFOIRqwkT1MvTgeIThkzhlDcHUMORXXBmbIGU99IA
         QThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uCLR6cY/lL8p7GrHVOGJbJLWtyXk2C9x9HUgrPSWLvo=;
        b=unWCW3FhunjcZ3fMPOevylMUoJDgovkbOnJ4NnjBzd1MP1cOMU3l5BQc4hGZOezRvk
         NqpBnSIJhWCcRD03eixDQ6vELqPW5DultdQaJ2yuiFM4j0jRVaS9kdJQ306e+qntdmB4
         YcjlDxzmGkrJdwkgLlog37gGGjgiiK6PQ5a9wP0mWA2cLiQYZbOhtZ27/eW8kzPXHn/y
         hzoZAIIFOZi1Vn2oh5hSjMq3Kez/1f9Bh/8nEV/rEslTnjUGbdRjp2aJxyfNXPSqOl0O
         DzwiweE2xS3cHCNl9yS/Ui+AGgrATaoFO4n3Kta7kRd42+IwnqesnMH7/KK9OKiO9tW5
         D5uw==
X-Gm-Message-State: AOAM532XEb0SrpQ2y5rqQOthLtV8riO9QCkDjlqtfFEWX5iKu3t/vapX
	6rpEaKJ4dYt6j+Ia0TATPF4=
X-Google-Smtp-Source: ABdhPJx1LV9n+PI9gZBXokDgcuoYKWqQFxuABdKAmUOVHdVBGouxSjgjVeZ2t2gwaUbKB+ZzAJ21ug==
X-Received: by 2002:a05:6e02:48b:: with SMTP id b11mr29413540ils.110.1621000943788;
        Fri, 14 May 2021 07:02:23 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Minimal build for RISCV
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
 <CAKmqyKN1+we16d3AkYg9GLXxic-Y=JZKdjqHfE5JRJTaGmaaHw@mail.gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <3d2e6213-3b38-1329-cb78-0e964577eb84@gmail.com>
Date: Fri, 14 May 2021 08:02:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN1+we16d3AkYg9GLXxic-Y=JZKdjqHfE5JRJTaGmaaHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/13/21 10:43 PM, Alistair Francis wrote:
> On Fri, May 14, 2021 at 2:18 PM Connor Davis <connojdavis@gmail.com> wrote:
>> Hi all,
>>
>> This series introduces a minimal build for RISCV. It is based on Bobby's
>> previous work from last year[0]. I have worked to rebase onto current Xen,
>> as well as update the various header files borrowed from Linux.
>>
>> This series provides the patches necessary to get a minimal build
>> working. The build is "minimal" in the sense that 1) it uses a
>> minimal config and 2) files, functions, and variables are included if
>> and only if they are required for a successful build based on the
>> config. It doesn't run at all, as the functions just have stub
>> implementations.
>>
>> My hope is that this can serve as a useful example for future ports as
>> well as inform the community of exactly what is imposed by common code
>> onto new architectures.
>>
>> The first 3 patches are mods to non-RISCV bits that enable building a
>> config with:
>>
>>    !CONFIG_HAS_NS16550
>>    !CONFIG_HAS_PASSTHROUGH
>>    !CONFIG_GRANT_TABLE
>>
>> respectively. The fourth patch adds the RISCV files, and the last patch
>> adds a docker container for doing the build. To build from the docker
>> container (after creating it locally), you can run the following:
>>
>>    $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen
>>
>> The sources taken from Linux are documented in arch/riscv/README.sources.
>> There were also some files copied from arm:
>>
>>    asm-arm/softirq.h
>>    asm-arm/random.h
>>    asm-arm/nospec.h
>>    asm-arm/numa.h
>>    asm-arm/p2m.h
>>    asm-arm/delay.h
>>    asm-arm/debugger.h
>>    asm-arm/desc.h
>>    asm-arm/guest_access.h
>>    asm-arm/hardirq.h
>>    lib/find_next_bit.c
>>
>> I imagine some of these will want some consolidation, but I put them
>> under the respective RISCV directories for now.
> Awesome!
>
> Do you have a public branch I could pull these from to try out?
>
> Alistair
Yes you can find the latest here: 
https://gitlab.com/connojd/xen/-/commits/riscv-build


Thanks,

Connor


