Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B33908A5
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 20:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132281.246798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llbYr-0004Dw-58; Tue, 25 May 2021 18:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132281.246798; Tue, 25 May 2021 18:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llbYr-0004C3-1d; Tue, 25 May 2021 18:13:49 +0000
Received: by outflank-mailman (input) for mailman id 132281;
 Tue, 25 May 2021 18:13:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t54O=KU=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1llbYp-0004Bx-3s
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 18:13:47 +0000
Received: from mail-pf1-x432.google.com (unknown [2607:f8b0:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92100fca-13d5-4cd3-b4dc-76b749713528;
 Tue, 25 May 2021 18:13:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id f22so15874728pfn.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 May 2021 11:13:45 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::1? ([2601:1c2:4f80:d230::1])
 by smtp.gmail.com with ESMTPSA id n8sm13774742pfu.111.2021.05.25.11.13.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 11:13:44 -0700 (PDT)
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
X-Inumbo-ID: 92100fca-13d5-4cd3-b4dc-76b749713528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WR6mTTTVXMLqVbQDN7NW3T5xTnC8y2i35vuOHkOhoyg=;
        b=CfJuS8idlpaud2LoV35hBSWgemSQsHzWc5gL/G9Ehbe2p3X6P9Q1boKvazOlD9X9HJ
         REleBvlUx7E8F7iBDnOXB7BR8SiBK0v2AcoVjSOhUvMex3xUlCBc3d4QpGfULAFr7VRD
         XAiVGMeOEvtDJRvN09FWzjKwtQU6G1kElN1FsoOcafrPWYL3IuAz2xM03BjGoVo7GtGM
         EZk0G/c4zaGd9/9/xiJCl9WaEYWxSF6u8bD9soDNY6c4qYDl1GdRvZBXVRR8Of3SedoI
         akCsHz1vEOxNGQQOrAZBenjddAf7kyBrNfVIUuMYYhTxzBD+Y0HfRDe+mCtLgIA6rqvw
         z2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WR6mTTTVXMLqVbQDN7NW3T5xTnC8y2i35vuOHkOhoyg=;
        b=UWcP2kujZqI1ObCluf8Qf+sdTM/DJc/3CvTUVBV8akpEGTdWOOP1lKJPcyt+6hbcjv
         8u/m4DTkRxi9H68qrfegLGuGGXe6xjBV54tHupj+CHkQNKpTPD7oKwf2PpImVaqOFMF3
         46mEVKgdszzDBXaOul54Mc1LTSfCqVMXm+QBIIyRhszAFohVEoe/OyW/xR4KfsbWsmus
         eknDde5qMuTP9NB6UEDmow0FR4b9OuurU82NeZm6F/XIJdz7ver/RAlflduocAGqOcuG
         4tmrCPA2er3f8oOmOGE81D7XpBOrlrC10CMMtLXaH90/L41r/5WIJeeYfLnyquZK/hdu
         P/sw==
X-Gm-Message-State: AOAM5310/TzyGl/vs3cVLYQa3fml6jk4AAkAm050Iq1ALo9KSKCvubxH
	k8nHi1zxXsmUO0a9kPfO7ErHeOWM3PcVtYHU
X-Google-Smtp-Source: ABdhPJwRuBXjX83mcUr1iyjBIx2c/PZA3tiBUUVxGwuMsJ9A51Bbr1HN6onDODU/bfW4tDtUnujbiw==
X-Received: by 2002:a65:564c:: with SMTP id m12mr20973639pgs.298.1621966424666;
        Tue, 25 May 2021 11:13:44 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Jan Beulich <jbeulich@suse.com>, Connor Davis <connojdavis@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
 <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <39a8a78c-3662-528f-fde4-d47427e64b15@gmail.com>
Date: Tue, 25 May 2021 11:13:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/25/21 1:48 AM, Jan Beulich wrote:
> On 24.05.2021 16:34, Connor Davis wrote:
>> Add arch-specific makefiles and configs needed to build for
>> riscv. Also add a minimal head.S that is a simple infinite loop.
>> head.o can be built with
>>
>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
>>
>> No other TARGET is supported at the moment.
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> ---
>>  config/riscv.mk                         |  4 +++
>>  xen/Makefile                            |  8 +++--
>>  xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>>  xen/arch/riscv/Kconfig.debug            |  0
>>  xen/arch/riscv/Makefile                 |  0
>>  xen/arch/riscv/Rules.mk                 |  0
>>  xen/arch/riscv/arch.mk                  | 14 ++++++++
>>  xen/arch/riscv/asm-offsets.c            |  0
>>  xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>>  xen/arch/riscv/head.S                   |  6 ++++
>>  xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>>  11 files changed, 137 insertions(+), 2 deletions(-)
>>  create mode 100644 config/riscv.mk
>>  create mode 100644 xen/arch/riscv/Kconfig
>>  create mode 100644 xen/arch/riscv/Kconfig.debug
>>  create mode 100644 xen/arch/riscv/Makefile
>>  create mode 100644 xen/arch/riscv/Rules.mk
>>  create mode 100644 xen/arch/riscv/arch.mk
>>  create mode 100644 xen/arch/riscv/asm-offsets.c
>>  create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>>  create mode 100644 xen/arch/riscv/head.S
>>  create mode 100644 xen/include/asm-riscv/config.h
> 
> I think this wants to be accompanied by an addition to ./MAINTAINERS
> right away, such that future RISC-V patches can be acked by the
> respective designated maintainers, rather than falling under "THE REST".
> Question is whether you / we have settled yet who's to become arch
> maintainer there.
> 
> Jan
> 

I'd like to volunteer myself for this, as I'm slated to continue
with the port indefinitely and would at least like to review
patches.  If Connor has the time, I think it makes sense for him
to be listed there too.

Until we have others (it's just us two right now), it'll be a
lot of us reviewing each other's arch-specific work (in addition to
reviewers elsewhere in the Xen project, of course).

-Bobby

-- 
Bobby Eshleman
SE at Vates SAS

