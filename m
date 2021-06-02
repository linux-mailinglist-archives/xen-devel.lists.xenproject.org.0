Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA4C397E9A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 04:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135394.251522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loGNv-0007tp-Nc; Wed, 02 Jun 2021 02:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135394.251522; Wed, 02 Jun 2021 02:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loGNv-0007ry-JM; Wed, 02 Jun 2021 02:13:31 +0000
Received: by outflank-mailman (input) for mailman id 135394;
 Wed, 02 Jun 2021 02:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loGNt-0007rm-UZ
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 02:13:29 +0000
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d5fc445-9341-4c48-aa70-13bc70078d96;
 Wed, 02 Jun 2021 02:13:29 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 h19-20020a9d6f930000b02903c0c4560e99so1184506otq.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jun 2021 19:13:29 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id c13sm4172605oto.18.2021.06.01.19.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 19:13:27 -0700 (PDT)
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
X-Inumbo-ID: 5d5fc445-9341-4c48-aa70-13bc70078d96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TqB9mFSMTqI1XSKPJCVgfXa0Mx+awWAIK9TXEgCzqhI=;
        b=bhy0P3vlljDZxlrsBqKA/r2209pTsAkEuGpLS/LTF1ljOzPDqIn08cH5SksdOJzGO2
         gQSE2B/ymQGvpgKRYMObs4uXkY9XrFfDX1gNh8sCwMZbwZ0k5CHovSYSp4cZISfkSp2M
         NELj/WBCTdZ398F91bQgRhLV9pBnaOh43jApNwNoszGPH6bsh0u3KPaYM5HFYuta0LP2
         SbeCSPF3d0/wkk66YB5Y1qs7t1Cq6INPPxlKSAuizBJzDuxadO4gfHKOQxA/EeDL5aWJ
         rM5eK6MijGugoRZnIf2xfjVawf5V0JC+zwXdcUOlCGbDLhcvgZWl16DyeiaZwKxF09RU
         wzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TqB9mFSMTqI1XSKPJCVgfXa0Mx+awWAIK9TXEgCzqhI=;
        b=NGX9CSgle5fzCpNDor3TYBkmLMNctGQgmvU2vgCQSGhFOUMm9liF97yJGLcZTqSUFw
         Kj/ZU4IMHchpTbMBGrM8vYcxKBtIuNIAMgBKFY4YheLuqFS/XUAHk5bDGPpiGf6xiyTZ
         5VfzwVvdys3cqrt00N5dG2c+X9VS3DWZnTTKM5Il0C7CjoXUHrTyghwT7pq+86grODAX
         yapSlHOdIH2JywoW8Olz7sphDc7W/FpE9odIqaWYWx/S9pnPzlgbPCx14fX9Oq62I9hQ
         2+uVjPb+hc9cJG1Ga8nPJ70/TXS3DO+L/4KsKtTGdfZ4YOeEr5kmjRmELATTgNmiY8y+
         8sSw==
X-Gm-Message-State: AOAM531c3VYSMqQoDpSNHmYSZIcZakKPVUY9rUmPYjzgMBXZI9tPHgau
	Lc5Y0uXl0zPrsUaxS+Vgjx6Jexgz25/eFQ==
X-Google-Smtp-Source: ABdhPJzcL6mcBvH0fViT7+12H1U2mbRfhpqFqgufbxQRBk63YFe34gSsHfeYtFQ7ehRIaEf35ndbRw==
X-Received: by 2002:a05:6830:4110:: with SMTP id w16mr23309299ott.372.1622600008303;
        Tue, 01 Jun 2021 19:13:28 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
 <7d1b6d2a-641c-4508-9b29-b74db4769170@suse.com>
 <39a8a78c-3662-528f-fde4-d47427e64b15@gmail.com>
 <b0699bc4-5e79-7ce0-c885-b4d8dfa8b74f@gmail.com>
 <0eab888a-4c48-497d-6c43-b749389e52dd@suse.com>
 <e95a2ae5-16a7-aa2d-67c9-b8a0d6f0c2e5@xen.org>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <1a73a6d0-af96-b009-9c74-651eecc61109@gmail.com>
Date: Tue, 1 Jun 2021 20:13:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <e95a2ae5-16a7-aa2d-67c9-b8a0d6f0c2e5@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/1/21 2:40 AM, Julien Grall wrote:
> Hi,
>
> On 01/06/2021 07:03, Jan Beulich wrote:
>> On 01.06.2021 04:26, Connor Davis wrote:
>>>
>>>
>>> On 5/25/21 12:13 PM, Bob Eshleman wrote:
>>>> On 5/25/21 1:48 AM, Jan Beulich wrote:
>>>>> On 24.05.2021 16:34, Connor Davis wrote:
>>>>>> Add arch-specific makefiles and configs needed to build for
>>>>>> riscv. Also add a minimal head.S that is a simple infinite loop.
>>>>>> head.o can be built with
>>>>>>
>>>>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
>>>>>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
>>>>>>
>>>>>> No other TARGET is supported at the moment.
>>>>>>
>>>>>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>>>>>> ---
>>>>>>    config/riscv.mk                         |  4 +++
>>>>>>    xen/Makefile                            |  8 +++--
>>>>>>    xen/arch/riscv/Kconfig                  | 47 
>>>>>> +++++++++++++++++++++++++
>>>>>>    xen/arch/riscv/Kconfig.debug            |  0
>>>>>>    xen/arch/riscv/Makefile                 |  0
>>>>>>    xen/arch/riscv/Rules.mk                 |  0
>>>>>>    xen/arch/riscv/arch.mk                  | 14 ++++++++
>>>>>>    xen/arch/riscv/asm-offsets.c            |  0
>>>>>>    xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>>>>>>    xen/arch/riscv/head.S                   |  6 ++++
>>>>>>    xen/include/asm-riscv/config.h          | 47 
>>>>>> +++++++++++++++++++++++++
>>>>>>    11 files changed, 137 insertions(+), 2 deletions(-)
>>>>>>    create mode 100644 config/riscv.mk
>>>>>>    create mode 100644 xen/arch/riscv/Kconfig
>>>>>>    create mode 100644 xen/arch/riscv/Kconfig.debug
>>>>>>    create mode 100644 xen/arch/riscv/Makefile
>>>>>>    create mode 100644 xen/arch/riscv/Rules.mk
>>>>>>    create mode 100644 xen/arch/riscv/arch.mk
>>>>>>    create mode 100644 xen/arch/riscv/asm-offsets.c
>>>>>>    create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>>>>>>    create mode 100644 xen/arch/riscv/head.S
>>>>>>    create mode 100644 xen/include/asm-riscv/config.h
>>>>> I think this wants to be accompanied by an addition to ./MAINTAINERS
>>>>> right away, such that future RISC-V patches can be acked by the
>>>>> respective designated maintainers, rather than falling under "THE 
>>>>> REST".
>>>>> Question is whether you / we have settled yet who's to become arch
>>>>> maintainer there.
>>>>>
>>>>> Jan
>>>>>
>>>> I'd like to volunteer myself for this, as I'm slated to continue
>>>> with the port indefinitely and would at least like to review
>>>> patches.  If Connor has the time, I think it makes sense for him
>>>> to be listed there too.
>>>>
>>>> Until we have others (it's just us two right now), it'll be a
>>>> lot of us reviewing each other's arch-specific work (in addition to
>>>> reviewers elsewhere in the Xen project, of course).
>>>>
>>>> -Bobby
>>>>
>>> Jan: can you list Bobby as the maintainer on commit? You can list me as
>>> well,
>>> but I can't guarantee a time commitment unlike Bobby.
>>
>> Well, actually I did expect a v5 submission with whatever entry you
>> both deem suitable. Otoh I now realize that patch 1 had my extra
>> request addressed (by myself) and hence with this one needing just
>> that entry, I could indeed add that addition myself while committing.
>> Let me move the mails back to the to-be-committed folder...
>
> At the risk of being picky, I don't think this should be done of 
> commit. Instead, a formal patch should be sent with both maintainers + 
> one of the committer acking (or signed-off-by) the proposal.

No problem, I will send a v5.

Thanks,
Connor

