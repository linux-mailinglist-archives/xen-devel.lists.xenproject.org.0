Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5555386D9A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 01:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128519.241265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1limXO-0004wv-Ep; Mon, 17 May 2021 23:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128519.241265; Mon, 17 May 2021 23:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1limXO-0004uO-Bn; Mon, 17 May 2021 23:20:38 +0000
Received: by outflank-mailman (input) for mailman id 128519;
 Mon, 17 May 2021 23:20:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FDvn=KM=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1limXM-0004uI-W5
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 23:20:37 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb74cd38-aafa-40c4-8105-c44409986b93;
 Mon, 17 May 2021 23:20:36 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id c10so6163012qtx.10
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 16:20:35 -0700 (PDT)
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
X-Inumbo-ID: eb74cd38-aafa-40c4-8105-c44409986b93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=48ejumFBodxIZN3IPhbRMcDcDg17r4FZ0iR6BIZLfY4=;
        b=kIRPSwAL0ToihqsoHdQgfaKI1L160IYK2edVerfcWZR06NHKQkeoe+r57HBCv0NteH
         ZyRndzcV1xGO65Ds/DqrrWoyM8C5SYFvcCkWPItXdbYcwH2lzaPYpN4wrDH2/XOq6UX8
         ibbyHBPuZ8O7oz3hNyQS8+n2k+Z02kjYoj8Qv01eV12//CpR3ipWATZufaDvf3wXwpuG
         H32b+Htc2/qN9EhpCI3cAbYGgodgxNRnKQnQ0iHCAwZ3glXJM4s5iQgYfHWzGXjUuKyD
         dOUXUcZaF3k9P4wQFtJoP1kI3TwWEqaaqWSZTbqjKUh7XjBrjOVxy8NB3lj1OgCk/kCn
         /+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=48ejumFBodxIZN3IPhbRMcDcDg17r4FZ0iR6BIZLfY4=;
        b=Mlqm2/q69128HiuU/2Xp+7JEauu1v990qyq4j9bajFSqr0zVpf/ZiebtxtkUhokEZ2
         dhPIxZ4LNxbC/unoWSfC4Wt84pMyIT3+8d7vCRMHZLKMHTjqMh56klDv1zmbvpQMYrnc
         FzhWx7ZbtH3JhpYWgue6Pqkqz5sZ+mEy4vXTBQbnxWVaS2P5H+YaLS2i24gNZbpR6Gws
         BycI+EJRXzW3jNQ7/RR9N3Qi6Y7d76685vKkehVvgGBwOPP8o5U335j9/dGOhm4wwHWm
         tuamy/QiphYKCSlI2UYaeKoho0ZmKMwQurnujsnVjgYJuRUAt2uodKFxrZWWxhzvdCrj
         yJFw==
X-Gm-Message-State: AOAM532aYzfCps2xwqt5mAJEx6o7nLWBxvg+8bABany3X4VAWfqkhCuj
	6KJHstAKqctBtQ1yCsI7jllFtbFCmYi+2IrLXjlT8Q==
X-Google-Smtp-Source: ABdhPJyr6wjblgST+W2ar+L4ad0ZMa/GLuuq/shpKxBr57/yPZc2dTWA1O146h+urKRNP9EAIZPBn+7kk8+HZ5Z7H/0=
X-Received: by 2002:ac8:4b44:: with SMTP id e4mr1952476qts.266.1621293635621;
 Mon, 17 May 2021 16:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621017334.git.connojdavis@gmail.com>
In-Reply-To: <cover.1621017334.git.connojdavis@gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 17 May 2021 16:20:24 -0700
Message-ID: <CAMmSBy-9_egM5j4aiOWx_fa5FwDy1ZpgOSdt8Pywqui38z52fw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Minimal build for RISCV
To: Connor Davis <connojdavis@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair23@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
	Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="UTF-8"

FWIW: for project EVE, the timing on this is perfect -- I've just
started a complete RISC-V port:
    https://github.com/lf-edge/eve/pull/2083

Targeting KVM for now, but would be awesome to see at least some
rudimentary RISC-V support land in Xen.

Connor, I'll be merging your changes into my patchset on EVE side ASAP
-- just to start playing with it.

Thanks,
Roman.

On Fri, May 14, 2021 at 11:54 AM Connor Davis <connojdavis@gmail.com> wrote:
>
> Hi all,
>
> This series introduces a minimal build for RISCV. It is based on Bobby's
> previous work from last year[0] rebased onto current Xen.
>
> This series provides the patches necessary to get a minimal build
> working. The build is "minimal" in the sense that it only supports
> building TARGET=head.o. The arch/riscv/head.S is just a simple while(1).
>
> The first 3 patches are mods to non-RISCV bits that enable building a
> config with:
>
>   !CONFIG_HAS_NS16550
>   !CONFIG_HAS_PASSTHROUGH
>   !CONFIG_GRANT_TABLE
>
> respectively. The fourth patch adds the make/Kconfig boilerplate
> alongside head.S and asm-riscv/config.h (head.S references ENTRY
> that is defined in asm-riscv/config.h).
>
> The last adds a docker container for doing the build. To build from the
> docker container (after creating it locally), you can run the following:
>
>   $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=head.o
>
> --
> Changes since v2:
>   - Reduced number of riscv files added to ease review
>
> Changes since v1:
>   - Dropped "xen/sched: Fix build when NR_CPUS == 1" since this was
>     fixed for 4.15
>   - Moved #ifdef-ary around iommu_enabled to iommu.h
>   - Moved struct grant_table declaration above ifdef CONFIG_GRANT_TABLE
>     instead of defining an empty struct when !CONFIG_GRANT_TABLE
>
> Connor Davis (5):
>   xen/char: Default HAS_NS16550 to y only for X86 and ARM
>   xen/common: Guard iommu symbols with CONFIG_HAS_PASSTHROUGH
>   xen: Fix build when !CONFIG_GRANT_TABLE
>   xen: Add files needed for minimal riscv build
>   automation: Add container for riscv64 builds
>
>  automation/build/archlinux/riscv64.dockerfile |  33 ++++++
>  automation/scripts/containerize               |   1 +
>  config/riscv64.mk                             |   5 +
>  xen/Makefile                                  |   8 +-
>  xen/arch/riscv/Kconfig                        |  52 +++++++++
>  xen/arch/riscv/Kconfig.debug                  |   0
>  xen/arch/riscv/Makefile                       |   0
>  xen/arch/riscv/Rules.mk                       |   0
>  xen/arch/riscv/arch.mk                        |  16 +++
>  xen/arch/riscv/asm-offsets.c                  |   0
>  xen/arch/riscv/configs/riscv64_defconfig      |  12 ++
>  xen/arch/riscv/head.S                         |   6 +
>  xen/common/memory.c                           |  10 ++
>  xen/drivers/char/Kconfig                      |   2 +-
>  xen/include/asm-riscv/config.h                | 110 ++++++++++++++++++
>  xen/include/xen/grant_table.h                 |   3 +-
>  xen/include/xen/iommu.h                       |   8 +-
>  17 files changed, 261 insertions(+), 5 deletions(-)
>  create mode 100644 automation/build/archlinux/riscv64.dockerfile
>  create mode 100644 config/riscv64.mk
>  create mode 100644 xen/arch/riscv/Kconfig
>  create mode 100644 xen/arch/riscv/Kconfig.debug
>  create mode 100644 xen/arch/riscv/Makefile
>  create mode 100644 xen/arch/riscv/Rules.mk
>  create mode 100644 xen/arch/riscv/arch.mk
>  create mode 100644 xen/arch/riscv/asm-offsets.c
>  create mode 100644 xen/arch/riscv/configs/riscv64_defconfig
>  create mode 100644 xen/arch/riscv/head.S
>  create mode 100644 xen/include/asm-riscv/config.h
>
> --
> 2.31.1
>
>

