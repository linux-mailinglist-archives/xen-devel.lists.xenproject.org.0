Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAAB60AF46
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 17:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429221.680104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzY5-0001mA-Ee; Mon, 24 Oct 2022 15:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429221.680104; Mon, 24 Oct 2022 15:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omzY5-0001jR-BN; Mon, 24 Oct 2022 15:39:33 +0000
Received: by outflank-mailman (input) for mailman id 429221;
 Mon, 24 Oct 2022 15:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QvrT=2Z=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1omzY4-0001jL-AT
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 15:39:32 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d2b3fa6-53b2-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 17:39:31 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id kt23so404896ejc.7
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
Received: from [192.168.1.93] (adsl-235.109.242.224.tellas.gr.
 [109.242.224.235]) by smtp.gmail.com with ESMTPSA id
 15-20020a170906328f00b007933047f930sm25891ejw.157.2022.10.24.08.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
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
X-Inumbo-ID: 0d2b3fa6-53b2-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esmhnhHFIe2Ujg1U7XAoozwzNzCLUpinlNTIJUCh4Pk=;
        b=HJj35EQAF02Z+C2xzkSIU9Ype0BxK766yMfzeKS9ZqmMcm7V3lFr19JWXxaAx3dgfF
         70Rtc84puCUDzFY9elkMfl7euow7lERGpL8NGRwvNbuNsMuXcyu3itDJNPE9Qr4Tt5Bj
         0sUsoagBnXB9C4iRNSuMY8f9Wf0EgLwr+Jxam7iQjozbSQ+2s9CrMtM3n8TX2Ai00Mc/
         tj98IgYNZvJQrTXJw2sWSsv2vi85c9Y+zf6s4VkUOQvZ/t7AxPHi2gy2igyL57X2gHV4
         golLI97UCvIsNpXGzEVSOZWrsMToBqJkf/cGDJgsyvhxOkkxTb4KjBeUVE9I5+21XLyj
         mWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=esmhnhHFIe2Ujg1U7XAoozwzNzCLUpinlNTIJUCh4Pk=;
        b=b+rfJSYrhZ0lNPcLTHNOfhfL8TUW83M/GzAT8mQQtH4JB0YJ9uZGCJdQdQlckzo3uc
         dirYOReRJqh1v0aPvYgekdpQSjjU8PiDlhDaPy05BChACMwQRI1mvg1RG6XYXIvAp+NI
         pqGOHElqCMUwRA26d+MbvrX/zJcRc+laTxnx/szG2Uz/IYoxa2x22ebgGPlxACrv/fex
         xzR85xKx9tWhxFPfITfuNSKbkWlD7rz2UFUDv3DEoXd7feDruouqmYD6lex2vrpKDu3C
         Y8W+to0e/P+JZoNVnzIyIElj5PxH9xqdavATLkyMgq+cJ91ZCSPdpBCBcf+1q1Jsqr3c
         3xFw==
X-Gm-Message-State: ACrzQf3K4i8urrCMCSZ7Jt2FgyENRCHHbFoAbdsALLaY4WrMH1ODShB5
	GqC5BOaOAip1POu91LLceO8=
X-Google-Smtp-Source: AMsMyM4Ed+uvUG4XENTSta0eWZE2lk1UYlbCbu8Mmmg5wag6a+3wR/pV3WHfaZVZiw6wTrbeZbYuXg==
X-Received: by 2002:a17:906:4a09:b0:78d:b6bb:ff5f with SMTP id w9-20020a1709064a0900b0078db6bbff5fmr27126076eju.538.1666625970443;
        Mon, 24 Oct 2022 08:39:30 -0700 (PDT)
Message-ID: <8202b890-5aea-f785-55dd-970d82f50d37@gmail.com>
Date: Mon, 24 Oct 2022 18:39:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v2 00/12] xen/arm: Don't switch TTBR while the MMU is on
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech, lucmiccio@gmail.com,
 carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20221022150422.17707-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien

On 10/22/22 18:04, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> Currently, Xen on Arm will switch TTBR whilst the MMU is on. This is
> similar to replacing existing mappings with new ones. So we need to
> follow a break-before-make sequence.
> 
> When switching the TTBR, we need to temporary disable the MMU
> before updating the TTBR. This means the page-tables must contain an
> identity mapping.
> 
> The current memory layout is not very flexible and has an higher chance
> to clash with the identity mapping.
> 
> On Arm64, we have plenty of unused virtual address space Therefore, we can
> simply reshuffle the layout to leave the first part of the virtual
> address space empty.
> 
> On Arm32, the virtual address space is already quite full. Even if we
> find space, it would be necessary to have a dynamic layout. So a
> different approach will be necessary. The chosen one is to have
> a temporary mapping that will be used to jumped from the ID mapping
> to the runtime mapping (or vice versa). The temporary mapping will
> be overlapping with the domheap area as it should not be used when
> switching on/off the MMU.
> 
> The Arm32 part is not yet addressed in this version. The series is
> sent as an early RFC to gather some feedback on the approach.
> 
> After this series, most of Xen page-table code should be compliant
> with the Arm Arm. The last two issues I am aware of are:
>   - domheap: Mappings are replaced without using the Break-Before-Make
>     approach.
>   - The cache is not cleaned/invalidated when updating the page-tables
>     with Data cache off (like during early boot).
> 
> The long term plan is to get rid of boot_* page tables and then
> directly use the runtime pages. This means for coloring, we will
> need to build the pages in the relocated Xen rather than the current
> Xen.
> 
> For convience, I pushed a branch with everything applied:
> 
> https://xenbits.xen.org/git-http/people/julieng/xen-unstable.git
> branch boot-pt-rework-v2

Are you sure that the branch has been pushed remotely? If yes, ignore.

> 
> Cheers,
> 
> Julien Grall (12):
>    xen/arm: Clean-up the memory layout
>    xen/arm32: head: Jump to the runtime mapping in enable_mmu()
>    xen/arm32: head: Introduce an helper to flush the TLBs
>    xen/arm32: head: Remove restriction where to load Xen
>    xen/arm32: head: Widen the use of the temporary mapping
>    xen/arm: Enable use of dump_pt_walk() early during boot
>    xen/arm64: Rework the memory layout
>    xen/arm: mm: Allow xen_pt_update() to work with the current root table
>    xen/arm: mm: Allow dump_hyp_walk() to work on the current root table
>    xen/arm64: mm: Introduce helpers to prepare/enable/disable the
>      identity mapping
>    xen/arm64: mm: Rework switch_ttbr()
>    xen/arm64: smpboot: Directly switch to the runtime page-tables
> 
>   xen/arch/arm/arm32/head.S           | 253 ++++++++++++++++++----------
>   xen/arch/arm/arm32/smpboot.c        |   4 +
>   xen/arch/arm/arm64/Makefile         |   1 +
>   xen/arch/arm/arm64/head.S           |  86 +++++-----
>   xen/arch/arm/arm64/mm.c             | 160 ++++++++++++++++++
>   xen/arch/arm/arm64/smpboot.c        |  15 +-
>   xen/arch/arm/domain_page.c          |   9 +
>   xen/arch/arm/include/asm/arm32/mm.h |   4 +
>   xen/arch/arm/include/asm/arm64/mm.h |  12 ++
>   xen/arch/arm/include/asm/config.h   |  63 +++++--
>   xen/arch/arm/include/asm/mm.h       |   2 +
>   xen/arch/arm/include/asm/setup.h    |  11 ++
>   xen/arch/arm/include/asm/smp.h      |   1 +
>   xen/arch/arm/mm.c                   | 105 +++++++-----
>   xen/arch/arm/smpboot.c              |   1 +
>   15 files changed, 536 insertions(+), 191 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/mm.c
> 

-- 
Xenia

