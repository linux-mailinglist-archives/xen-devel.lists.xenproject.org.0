Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C29799210
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 00:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598216.932826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qejlX-0002U1-IX; Fri, 08 Sep 2023 22:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598216.932826; Fri, 08 Sep 2023 22:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qejlX-0002RP-FI; Fri, 08 Sep 2023 22:15:51 +0000
Received: by outflank-mailman (input) for mailman id 598216;
 Fri, 08 Sep 2023 22:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qejlV-0002RJ-Qc
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 22:15:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 435873f3-4e95-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 00:15:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EBF4B82223;
 Fri,  8 Sep 2023 22:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2564BC433CA;
 Fri,  8 Sep 2023 22:15:45 +0000 (UTC)
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
X-Inumbo-ID: 435873f3-4e95-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694211346;
	bh=7VujQNNjwdsBhnaJLZekauTU/ZzItKifUATaJ/OH2Xs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eNLpeWP7z4UpHzsuWJL1Yy3FQmj7EpnkSzBpcZkMngdzlm9ZYxqn5IF2+NUZixtHF
	 7QsOP/KJlwKTEA3j7MWhsLLomR59jsqxYnaQmcX/lBjzy5sxBsPYR5qUNssYn9DBVk
	 lFT+LsfK+TXwMi5WP7yLBmLoP+LWxI6+ZiABnc1ZtWuHfEjkdc1lPQpjC5g0gITayT
	 NTBs9YXeyvhHy65QNWI5y6oSmIsF6SE0GwvfDWgJmNvJaNuQIS8g3Krtd0qqPpUOoX
	 kayuTChTCKwMWVW9J8/NaFZJ5FNHMIV43bHr4uWIAKUK2XbztP+FgeBsqNEx8tbVV9
	 jMY9EHTYqTzOg==
Date: Fri, 8 Sep 2023 15:15:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>, 
    Penny Zheng <penny.zheng@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 00/13] xen/arm: Split MMU code as the prepration of
 MPU work
In-Reply-To: <20230828013224.669433-1-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309081515340.6458@ubuntu-linux-20-04-desktop>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I committed patches 1-5

On Mon, 28 Aug 2023, Henry Wang wrote:
> Based on the discussion in the Xen Summit [1], sending this series out after
> addressing the comments in v5 [2] as the preparation work to add MPU support.
> The series passed the GitLab CI check in [3].
> 
> Mostly code movement and function folding, with some of Kconfig and build
> system (mainly Makefiles) adjustment.
> 
> This series is based on:
> ec272d8d4c CI: Always move the bisect build log back
> 
> [1] https://lore.kernel.org/xen-devel/AS8PR08MB799122F8B0CB841DED64F4819226A@AS8PR08MB7991.eurprd08.prod.outlook.com/
> [2] https://lore.kernel.org/xen-devel/20230814042536.878720-1-Henry.Wang@arm.com/
> [3] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/982592897
> 
> Henry Wang (9):
>   xen/arm: Introduce CONFIG_MMU Kconfig option
>   xen/arm64: Split and move MMU-specific head.S to mmu/head.S
>   xen/arm64: Fold setup_fixmap() to create_page_tables()
>   xen/arm: Split page table related code to mmu/pt.c
>   xen/arm: Split MMU system SMP MM bringup code to mmu/smpboot.c
>   xen/arm: Fold mmu_init_secondary_cpu() to head.S
>   xen/arm: Extract MMU-specific MM code
>   xen/arm: Split MMU-specific setup_mm() and related code out
>   xen/arm: Fold pmap and fixmap into MMU system
> 
> Penny Zheng (2):
>   xen/arm: Rename init_secondary_pagetables() to prepare_secondary_mm()
>   xen/arm: mmu: move MMU specific P2M code to mmu/p2m.{c,h}
> 
> Wei Chen (2):
>   xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()
>   xen/arm: Move MMU related definitions from config.h to mmu/layout.h
> 
>  xen/arch/arm/Kconfig                    |    5 +-
>  xen/arch/arm/Makefile                   |    1 +
>  xen/arch/arm/arm32/Makefile             |    1 +
>  xen/arch/arm/arm32/head.S               |   22 +-
>  xen/arch/arm/arm32/mmu/Makefile         |    1 +
>  xen/arch/arm/arm32/mmu/mm.c             |  301 ++++
>  xen/arch/arm/arm64/Makefile             |    2 +-
>  xen/arch/arm/arm64/head.S               |  460 +-----
>  xen/arch/arm/arm64/mmu/Makefile         |    2 +
>  xen/arch/arm/arm64/mmu/head.S           |  481 ++++++
>  xen/arch/arm/arm64/{ => mmu}/mm.c       |   84 ++
>  xen/arch/arm/include/asm/arm32/mm.h     |    1 +
>  xen/arch/arm/include/asm/arm64/macros.h |   36 +
>  xen/arch/arm/include/asm/config.h       |  132 +-
>  xen/arch/arm/include/asm/mm.h           |   28 +-
>  xen/arch/arm/include/asm/mmu/layout.h   |  146 ++
>  xen/arch/arm/include/asm/mmu/mm.h       |   41 +
>  xen/arch/arm/include/asm/mmu/p2m.h      |   18 +
>  xen/arch/arm/include/asm/p2m.h          |   26 +-
>  xen/arch/arm/include/asm/page.h         |   15 -
>  xen/arch/arm/include/asm/setup.h        |    5 +
>  xen/arch/arm/kernel.c                   |   28 -
>  xen/arch/arm/mm.c                       | 1212 ---------------
>  xen/arch/arm/mmu/Makefile               |    4 +
>  xen/arch/arm/mmu/p2m.c                  | 1736 +++++++++++++++++++++
>  xen/arch/arm/mmu/pt.c                   |  743 +++++++++
>  xen/arch/arm/mmu/setup.c                |  372 +++++
>  xen/arch/arm/mmu/smpboot.c              |  121 ++
>  xen/arch/arm/p2m.c                      | 1837 +----------------------
>  xen/arch/arm/setup.c                    |  324 +---
>  xen/arch/arm/smpboot.c                  |    4 +-
>  xen/arch/arm/xen.lds.S                  |    1 +
>  32 files changed, 4222 insertions(+), 3968 deletions(-)
>  create mode 100644 xen/arch/arm/arm32/mmu/Makefile
>  create mode 100644 xen/arch/arm/arm32/mmu/mm.c
>  create mode 100644 xen/arch/arm/arm64/mmu/Makefile
>  create mode 100644 xen/arch/arm/arm64/mmu/head.S
>  rename xen/arch/arm/arm64/{ => mmu}/mm.c (60%)
>  create mode 100644 xen/arch/arm/include/asm/mmu/layout.h
>  create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
>  create mode 100644 xen/arch/arm/include/asm/mmu/p2m.h
>  create mode 100644 xen/arch/arm/mmu/Makefile
>  create mode 100644 xen/arch/arm/mmu/p2m.c
>  create mode 100644 xen/arch/arm/mmu/pt.c
>  create mode 100644 xen/arch/arm/mmu/setup.c
>  create mode 100644 xen/arch/arm/mmu/smpboot.c
> 
> -- 
> 2.25.1
> 

