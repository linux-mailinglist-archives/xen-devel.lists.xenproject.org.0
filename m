Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AA399659
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 01:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136270.252733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaGF-00046A-HZ; Wed, 02 Jun 2021 23:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136270.252733; Wed, 02 Jun 2021 23:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loaGF-000446-Do; Wed, 02 Jun 2021 23:26:55 +0000
Received: by outflank-mailman (input) for mailman id 136270;
 Wed, 02 Jun 2021 23:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loaGD-00043x-Ul
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 23:26:54 +0000
Received: from mail-ot1-x32e.google.com (unknown [2607:f8b0:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcd289a3-4d84-419f-a791-9f768d72cf95;
 Wed, 02 Jun 2021 23:26:53 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 c31-20020a056830349fb02903a5bfa6138bso4041580otu.7
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 16:26:53 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id m189sm303869oif.45.2021.06.02.16.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 16:26:52 -0700 (PDT)
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
X-Inumbo-ID: fcd289a3-4d84-419f-a791-9f768d72cf95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=if2k95Xcwhu7SiKaprmYQn758izSoEUYUBQKX0dMrn4=;
        b=K5ZQIEVzIevNmBeUHFWq2i6+8Gur5QNfCozrPUBPtGKQRKEkxOrWTqVN5JB9Bootgd
         LYaQj8TdCRBbBKKxNHmpCe5MZl1/XHu3237aVcvX4veynbX6znmYvPrSAz1uqu1ZseF1
         0sescp+evpmgj9AcUPsaD7YzJy2t8kJK0F+qG90lxThDKEMhJ9WHkihqbwL2twjJDAPV
         qObC6v5creOlXQ0zC1sU3QkTAjNTm6X0jOp4Z5tm+IsNKZz4r5i4Oon/NzZLEOuaJCET
         H83GnUY0/X/w5dWgAqrC/LOtZQp5qxvqSlTYrtLiLDnGVH830ZvKZWTDVlOjB0OvzGzA
         v+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=if2k95Xcwhu7SiKaprmYQn758izSoEUYUBQKX0dMrn4=;
        b=oDw5teviwHzGot08d3hC5+nwqpa6NnyTXOrDPHq1eQUTAMvO5a4yb3CqQgxj/Ai4dm
         d2+rXT7wgSsq14qYRyetUPB8puhIVjznmm9UVV4OdmjIYFRrWwDiGGlUPlNPZaA9LRO/
         GiecMTCHJfhn/u2K+m7VmKl+JGmqta3EWCFsMYGl+KWaGn+PH3f/E2Wg9EJs4PtJBv+z
         vEL0QHForW4M41XiBgKwvcxnpTxVn1RKqaa5t3qMK4iNkgXl0rwq9s9vXaUg8re4DnL2
         CwYOg8QBbAD8AmhWC1LCDz+TkF7Q40WU06R5yd50KmIjL6XDzuOuGxbdiWiOnZZsVY4a
         ST6w==
X-Gm-Message-State: AOAM533CE7cX2Z1kGiObcq8pVQqSVRDBK1XFLRLB9y26jRdI2zTcYUfx
	P4nc4WYMN3zgFgTcNhAn/B4=
X-Google-Smtp-Source: ABdhPJwMknXsNXyiNZKY5veFoP+mF91rPo/KRGcv1QuTEpOfbFdRNtIuGVVlFo0Wv8NyFQREf2dv3w==
X-Received: by 2002:a9d:6a05:: with SMTP id g5mr27413704otn.354.1622676412591;
        Wed, 02 Jun 2021 16:26:52 -0700 (PDT)
Subject: Re: [PATCH v5 0/2] Minimal build for RISCV
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1622675569.git.connojdavis@gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <6f73fc6a-1edc-695b-d224-43590fde4f0c@gmail.com>
Date: Wed, 2 Jun 2021 17:26:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <cover.1622675569.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sigh.. lets try this again with the version numbers in sync

On 6/2/21 5:20 PM, Connor Davis wrote:
> Hi all,
>
> This series introduces a minimal build for RISCV. It is based on Bobby's
> previous work from last year[0] rebased onto current Xen.
>
> This series provides the patches necessary to get a minimal build
> working. The build is "minimal" in the sense that it only supports
> building TARGET=riscv64/head.o. The arch/riscv/riscv64/head.S is just
> a simple while(1).
>
> The first patch is a mod to non-RISCV bits that enable building a
> config with !CONFIG_HAS_NS16550.
>
> The second patch adds the make/Kconfig boilerplate alongside head.S and
> asm-riscv/config.h (head.S references ENTRY that is defined in
> asm-riscv/config.h).
>
> [0] https://lore.kernel.org/xen-devel/cover.1579615303.git.bobbyeshleman@gmail.com/
>
> Thanks,
> Connor
>
> --
> Changes since v5:
>    - Added missing A-by from Jan to patch 1
>
> Changes since v4:
>    - Dropped patches 2 and 4 as these have been applied
>    - Moved arch/riscv/head.S to arch/riscv/riscv64/head.S for consistency
>      with ARM.
>    - Added Bob and myself to MAINTAINERS
>
> Changes since v3:
>    - Dropped "xen: Fix build when !CONFIG_GRANT_TABLE" since this was
>      applied by Jan
>    - Adjusted Kconfig condition for building NS16550
>    - Use bool rather than bool_t
>    - Removed riscv memory map, as this should probably be done later once
>      the frametable size is figured out
>    - Consolidated 64-bit #defines in asm-riscv/config.h
>    - Renamed riscv64_defconfig to tiny64_defconfig, added CONFIG_DEBUG
>      and CONFIG_DEBUG_INFO
>    - Fixed logic/alignment/whitespace issues in Kconfig files
>    - Use upstream archlinux riscv64 cross-compiler packages instead of
>      custom built toolchain in docker container
>
> Changes since v2:
>    - Reduced number of riscv files added to ease review
>
> Changes since v1:
>    - Dropped "xen/sched: Fix build when NR_CPUS == 1" since this was
>      fixed for 4.15
>    - Moved #ifdef-ary around iommu_enabled to iommu.h
>    - Moved struct grant_table declaration above ifdef CONFIG_GRANT_TABLE
>      instead of defining an empty struct when !CONFIG_GRANT_TABLE
> --
> Connor Davis (2):
>    xen/char: Default HAS_NS16550 to y only for X86 and ARM
>    xen: Add files needed for minimal riscv build
>
>   MAINTAINERS                             |  8 +++++
>   config/riscv64.mk                       |  5 +++
>   xen/Makefile                            |  8 +++--
>   xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>   xen/arch/riscv/Kconfig.debug            |  0
>   xen/arch/riscv/Makefile                 |  2 ++
>   xen/arch/riscv/Rules.mk                 |  0
>   xen/arch/riscv/arch.mk                  | 14 ++++++++
>   xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>   xen/arch/riscv/riscv64/asm-offsets.c    |  0
>   xen/arch/riscv/riscv64/head.S           |  6 ++++
>   xen/drivers/char/Kconfig                |  1 +
>   xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>   13 files changed, 149 insertions(+), 2 deletions(-)
>   create mode 100644 config/riscv64.mk
>   create mode 100644 xen/arch/riscv/Kconfig
>   create mode 100644 xen/arch/riscv/Kconfig.debug
>   create mode 100644 xen/arch/riscv/Makefile
>   create mode 100644 xen/arch/riscv/Rules.mk
>   create mode 100644 xen/arch/riscv/arch.mk
>   create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>   create mode 100644 xen/arch/riscv/riscv64/asm-offsets.c
>   create mode 100644 xen/arch/riscv/riscv64/head.S
>   create mode 100644 xen/include/asm-riscv/config.h
>


