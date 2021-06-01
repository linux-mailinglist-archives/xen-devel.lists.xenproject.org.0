Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A37396B0F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 04:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134610.250367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnu6Z-0004J9-5A; Tue, 01 Jun 2021 02:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134610.250367; Tue, 01 Jun 2021 02:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnu6Z-0004IZ-1Y; Tue, 01 Jun 2021 02:26:07 +0000
Received: by outflank-mailman (input) for mailman id 134610;
 Tue, 01 Jun 2021 02:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ur3e=K3=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lnu6W-0004IQ-Q4
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 02:26:04 +0000
Received: from mail-oo1-xc32.google.com (unknown [2607:f8b0:4864:20::c32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41882eed-3583-42ce-b399-fdeb54c6accd;
 Tue, 01 Jun 2021 02:26:01 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso3151920ooh.11
 for <xen-devel@lists.xenproject.org>; Mon, 31 May 2021 19:26:01 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id q19sm2305346oov.18.2021.05.31.19.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 19:26:00 -0700 (PDT)
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
X-Inumbo-ID: 41882eed-3583-42ce-b399-fdeb54c6accd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PHTJSZWgt9tLZnJJOY4xFyu77OyX5M5HRVhis1msNs0=;
        b=l1YdSZ9kLlNAQiAK8Za8dgUharrK+ruAwZmH0L+0y5EQDBTopHdkI/5cu/69nojmT0
         JNUaCisppDfdUzvvJjIw4aDR7e4DtX04BTpPA6XllsHpSUd9HAOMKZgtw1ae3MdkxFs5
         fy6cCTE4f/mWwYHpbEyQ4bKHvzDfvulXHS1zIux91o7yJxFMQBNN3CoPbCrKrTnS6ExX
         TPFm4TDZXkku0+qfHxTpgn4MOkzm0gXJ5Wsr25m0VWm3RtrHFVwgoKDW/5MLqZ0jKL8O
         /WP9U2uh5npu2y/KemO7G9v4TvSZ9xVrAsmjtz75g05otSpASEHbBWO2R7fNatPue/32
         CUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=PHTJSZWgt9tLZnJJOY4xFyu77OyX5M5HRVhis1msNs0=;
        b=t5cO8xXQhZ1ETDEP6n+5VWe2NRjZxU6w8z4lJOlfHIsvJQM+2zyRijvSZdu8SOZpWm
         QCt5SarJ+9qhFxW3O6pRYq3o7Ch045QM0NrTtiNVbg2P+f++VTBe4BoNZkYVrewhUsaj
         oVWSWP+i+lAQ9V+TuX35Cagen2MV40onIAg6dCVA/0VJcGswk2EJqAorCU8gTedfbuCM
         WZJokJB7aoyzjcvR/iVOTmnkuZhbIu18aTgZOTa6nJ0r2FSa2O+DzyoIaF5Rf0aSTjvJ
         pYMcejcL0mbnTfYfTWICdfo5h/2dB/RdRMQhTqbvKso3MDtp8/iJcJyF71BuoukLYydS
         yV5A==
X-Gm-Message-State: AOAM533pVdL7xQlAXS5lL1JYVz/sQa6B2Oa/TcjrJgqk7bYGOulNR+YK
	TkWnxvNmO7cLmyW233vvmcD+5E7FE1r7EA==
X-Google-Smtp-Source: ABdhPJwq7U/6JNK233hBfcRXDY5zdhbtVgJeraGAPr5DLzlDXIvUzgTF/jomONwXqpbTrX/XP/p1uA==
X-Received: by 2002:a4a:e416:: with SMTP id t22mr18086340oov.39.1622514360774;
        Mon, 31 May 2021 19:26:00 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Bob Eshleman <bobbyeshleman@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
 <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com>
 <39a8a78c-3662-528f-fde4-d47427e64b15@gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <b0699bc4-5e79-7ce0-c885-b4d8dfa8b74f@gmail.com>
Date: Mon, 31 May 2021 20:26:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <39a8a78c-3662-528f-fde4-d47427e64b15@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/25/21 12:13 PM, Bob Eshleman wrote:
> On 5/25/21 1:48 AM, Jan Beulich wrote:
>> On 24.05.2021 16:34, Connor Davis wrote:
>>> Add arch-specific makefiles and configs needed to build for
>>> riscv. Also add a minimal head.S that is a simple infinite loop.
>>> head.o can be built with
>>>
>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
>>>
>>> No other TARGET is supported at the moment.
>>>
>>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>>> ---
>>>   config/riscv.mk                         |  4 +++
>>>   xen/Makefile                            |  8 +++--
>>>   xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>>>   xen/arch/riscv/Kconfig.debug            |  0
>>>   xen/arch/riscv/Makefile                 |  0
>>>   xen/arch/riscv/Rules.mk                 |  0
>>>   xen/arch/riscv/arch.mk                  | 14 ++++++++
>>>   xen/arch/riscv/asm-offsets.c            |  0
>>>   xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>>>   xen/arch/riscv/head.S                   |  6 ++++
>>>   xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>>>   11 files changed, 137 insertions(+), 2 deletions(-)
>>>   create mode 100644 config/riscv.mk
>>>   create mode 100644 xen/arch/riscv/Kconfig
>>>   create mode 100644 xen/arch/riscv/Kconfig.debug
>>>   create mode 100644 xen/arch/riscv/Makefile
>>>   create mode 100644 xen/arch/riscv/Rules.mk
>>>   create mode 100644 xen/arch/riscv/arch.mk
>>>   create mode 100644 xen/arch/riscv/asm-offsets.c
>>>   create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>>>   create mode 100644 xen/arch/riscv/head.S
>>>   create mode 100644 xen/include/asm-riscv/config.h
>> I think this wants to be accompanied by an addition to ./MAINTAINERS
>> right away, such that future RISC-V patches can be acked by the
>> respective designated maintainers, rather than falling under "THE REST".
>> Question is whether you / we have settled yet who's to become arch
>> maintainer there.
>>
>> Jan
>>
> I'd like to volunteer myself for this, as I'm slated to continue
> with the port indefinitely and would at least like to review
> patches.  If Connor has the time, I think it makes sense for him
> to be listed there too.
>
> Until we have others (it's just us two right now), it'll be a
> lot of us reviewing each other's arch-specific work (in addition to
> reviewers elsewhere in the Xen project, of course).
>
> -Bobby
>
Jan: can you list Bobby as the maintainer on commit? You can list me as 
well,
but I can't guarantee a time commitment unlike Bobby.

Thanks,
Connor


