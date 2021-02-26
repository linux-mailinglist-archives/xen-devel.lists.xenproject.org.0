Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327DF325BF8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 04:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90040.170254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTpG-0003cG-LV; Fri, 26 Feb 2021 03:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90040.170254; Fri, 26 Feb 2021 03:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTpG-0003br-IO; Fri, 26 Feb 2021 03:29:58 +0000
Received: by outflank-mailman (input) for mailman id 90040;
 Fri, 26 Feb 2021 03:29:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwhq=H4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFTpE-0003bm-MA
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 03:29:56 +0000
Received: from mail-ot1-x330.google.com (unknown [2607:f8b0:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1304e1f-9fa0-4aa4-9fcb-c9c700ddf45b;
 Fri, 26 Feb 2021 03:29:55 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id x9so3524637otp.8
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 19:29:55 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id v8sm442279oto.6.2021.02.25.19.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:29:54 -0800 (PST)
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
X-Inumbo-ID: a1304e1f-9fa0-4aa4-9fcb-c9c700ddf45b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=W1FQI9aWKNKJtvIyZ8F4EorqAzKoWuW76K5qdY1SWF8=;
        b=GQTx874fmSLocK1B45MefWBuW09+NMhrFEZCuja1QlGRUZ4zptlKTKe6s7wzwEnN4U
         tvkxnzfc97oHrABSNnAMN8aCdHK3emuFscoi+fO7bdGmy+QgrOEXpcgYm5OCvj3Org1C
         xkR8JdaZ+tpLE19yntZLMkziTmZq7JMSqjQKLbNwt1Q3fJShvH+lHSpQemS1Q297LIPC
         6DsA6egcrBQjt/Hrx12ygX62c0YgixoyrNXEqrzxx2Bh/TrO8boxIeWnc4IYC2FUF33c
         BBW4PiPL+K2K204KJhbJXqE0JWkNXa2IpiX5QjibfqjzvODz7HTSwGSP4kAJ5QnHCjU1
         ayCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=W1FQI9aWKNKJtvIyZ8F4EorqAzKoWuW76K5qdY1SWF8=;
        b=Ldt3xYUCZqC9cVYpGKVe2Zvr+drNFr9/801X7CzOO28wg4g6NRCwly+JcVm2QaGJaL
         BAqYN+HUKDXIq29/boRNYWXstkJ4Jzb5BwIObiHe6u3WKggOHWw/WCUMA9z23SM+0api
         cxkQoJiRgn1YYD3oMe2E9BFhpt80eLgWQu0RFZxDQCk6B5NFbgtiVxvMr6QpT0v0t+i9
         0tfdG4vrL4uzXoJgOIStKGVfhF/fcwNJIAnvVU/909F34xd8u0yyHchpROi07zY2M7DE
         8vnCJoTs5VZfjuSObmJ5w8J7vHSln7TYYy13bmYDQVnALvKsTKJ07ZBBWFJmUvwpthN3
         MCIw==
X-Gm-Message-State: AOAM531e80xV8YZSBwkNXaBRp/ty4P4WUbM8kN6GfSg5hGV98hT2X84N
	qzAWF+EmCy68bQK7zRq41x0=
X-Google-Smtp-Source: ABdhPJzFyUBVWo3Iu7xW5KbObrIxZndKMMWSg+1yH8YOZ/oKWSTMCj2cgtF/a1ZlHFzoK1H5Rt2DnA==
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr758451ote.231.1614310194590;
        Thu, 25 Feb 2021 19:29:54 -0800 (PST)
Date: Thu, 25 Feb 2021 20:29:52 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
Message-ID: <20210226032952.dbi2rdkbqa533yme@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
 <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>

On Thu, Feb 25, 2021 at 11:14:53PM +0000, Andrew Cooper wrote:
> On 25/02/2021 15:24, Connor Davis wrote:
> > Add the minimum code required to get xen to build with
> > XEN_TARGET_ARCH=riscv64. It is minimal in the sense that every file and
> > function added is required for a successful build, given the .config
> > generated from riscv64_defconfig. The function implementations are just
> > stubs; actual implmentations will need to be added later.
> >
> > Signed-off-by: Connor Davis <connojdavis@gmail.com>
> > ---
> >  config/riscv64.mk                        |   7 +
> >  xen/Makefile                             |   8 +-
> >  xen/arch/riscv/Kconfig                   |  54 ++++
> >  xen/arch/riscv/Kconfig.debug             |   0
> >  xen/arch/riscv/Makefile                  |  57 ++++
> >  xen/arch/riscv/README.source             |  19 ++
> >  xen/arch/riscv/Rules.mk                  |  13 +
> >  xen/arch/riscv/arch.mk                   |   7 +
> >  xen/arch/riscv/configs/riscv64_defconfig |  12 +
> >  xen/arch/riscv/delay.c                   |  16 +
> >  xen/arch/riscv/domain.c                  | 144 +++++++++
> >  xen/arch/riscv/domctl.c                  |  36 +++
> >  xen/arch/riscv/guestcopy.c               |  57 ++++
> >  xen/arch/riscv/head.S                    |   6 +
> >  xen/arch/riscv/irq.c                     |  78 +++++
> >  xen/arch/riscv/lib/Makefile              |   1 +
> >  xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++++++++++++
> >  xen/arch/riscv/mm.c                      |  93 ++++++
> >  xen/arch/riscv/p2m.c                     | 150 +++++++++
> >  xen/arch/riscv/percpu.c                  |  17 +
> >  xen/arch/riscv/platforms/Kconfig         |  31 ++
> >  xen/arch/riscv/riscv64/asm-offsets.c     |  31 ++
> >  xen/arch/riscv/setup.c                   |  27 ++
> >  xen/arch/riscv/shutdown.c                |  28 ++
> >  xen/arch/riscv/smp.c                     |  35 +++
> >  xen/arch/riscv/smpboot.c                 |  34 ++
> >  xen/arch/riscv/sysctl.c                  |  33 ++
> >  xen/arch/riscv/time.c                    |  35 +++
> >  xen/arch/riscv/traps.c                   |  35 +++
> >  xen/arch/riscv/vm_event.c                |  39 +++
> >  xen/arch/riscv/xen.lds.S                 | 113 +++++++
> >  xen/drivers/char/serial.c                |   1 +
> >  xen/include/asm-riscv/altp2m.h           |  39 +++
> >  xen/include/asm-riscv/asm.h              |  77 +++++
> >  xen/include/asm-riscv/asm_defns.h        |  24 ++
> >  xen/include/asm-riscv/atomic.h           | 204 ++++++++++++
> >  xen/include/asm-riscv/bitops.h           | 331 ++++++++++++++++++++
> >  xen/include/asm-riscv/bug.h              |  54 ++++
> >  xen/include/asm-riscv/byteorder.h        |  16 +
> >  xen/include/asm-riscv/cache.h            |  24 ++
> >  xen/include/asm-riscv/cmpxchg.h          | 382 +++++++++++++++++++++++
> >  xen/include/asm-riscv/compiler_types.h   |  32 ++
> >  xen/include/asm-riscv/config.h           | 110 +++++++
> >  xen/include/asm-riscv/cpufeature.h       |  17 +
> >  xen/include/asm-riscv/csr.h              | 219 +++++++++++++
> >  xen/include/asm-riscv/current.h          |  47 +++
> >  xen/include/asm-riscv/debugger.h         |  15 +
> >  xen/include/asm-riscv/delay.h            |  15 +
> >  xen/include/asm-riscv/desc.h             |  12 +
> >  xen/include/asm-riscv/device.h           |  15 +
> >  xen/include/asm-riscv/div64.h            |  23 ++
> >  xen/include/asm-riscv/domain.h           |  50 +++
> >  xen/include/asm-riscv/event.h            |  42 +++
> >  xen/include/asm-riscv/fence.h            |  12 +
> >  xen/include/asm-riscv/flushtlb.h         |  34 ++
> >  xen/include/asm-riscv/grant_table.h      |  12 +
> >  xen/include/asm-riscv/guest_access.h     |  41 +++
> >  xen/include/asm-riscv/guest_atomics.h    |  60 ++++
> >  xen/include/asm-riscv/hardirq.h          |  27 ++
> >  xen/include/asm-riscv/hypercall.h        |  12 +
> >  xen/include/asm-riscv/init.h             |  42 +++
> >  xen/include/asm-riscv/io.h               | 283 +++++++++++++++++
> >  xen/include/asm-riscv/iocap.h            |  13 +
> >  xen/include/asm-riscv/iommu.h            |  46 +++
> >  xen/include/asm-riscv/irq.h              |  58 ++++
> >  xen/include/asm-riscv/mem_access.h       |   4 +
> >  xen/include/asm-riscv/mm.h               | 246 +++++++++++++++
> >  xen/include/asm-riscv/monitor.h          |  65 ++++
> >  xen/include/asm-riscv/nospec.h           |  25 ++
> >  xen/include/asm-riscv/numa.h             |  41 +++
> >  xen/include/asm-riscv/p2m.h              | 218 +++++++++++++
> >  xen/include/asm-riscv/page-bits.h        |  11 +
> >  xen/include/asm-riscv/page.h             |  73 +++++
> >  xen/include/asm-riscv/paging.h           |  15 +
> >  xen/include/asm-riscv/pci.h              |  31 ++
> >  xen/include/asm-riscv/percpu.h           |  33 ++
> >  xen/include/asm-riscv/processor.h        |  59 ++++
> >  xen/include/asm-riscv/random.h           |   9 +
> >  xen/include/asm-riscv/regs.h             |  23 ++
> >  xen/include/asm-riscv/setup.h            |  14 +
> >  xen/include/asm-riscv/smp.h              |  46 +++
> >  xen/include/asm-riscv/softirq.h          |  16 +
> >  xen/include/asm-riscv/spinlock.h         |  12 +
> >  xen/include/asm-riscv/string.h           |  28 ++
> >  xen/include/asm-riscv/sysregs.h          |  16 +
> >  xen/include/asm-riscv/system.h           |  99 ++++++
> >  xen/include/asm-riscv/time.h             |  31 ++
> >  xen/include/asm-riscv/trace.h            |  12 +
> >  xen/include/asm-riscv/types.h            |  60 ++++
> >  xen/include/asm-riscv/vm_event.h         |  55 ++++
> >  xen/include/asm-riscv/xenoprof.h         |  12 +
> >  xen/include/public/arch-riscv.h          | 183 +++++++++++
> >  xen/include/public/arch-riscv/hvm/save.h |  39 +++
> >  xen/include/public/hvm/save.h            |   2 +
> >  xen/include/public/pmu.h                 |   2 +
> >  xen/include/public/xen.h                 |   2 +
> >  xen/include/xen/domain.h                 |   1 +
> 
> Well - this is orders of magnitude more complicated than it ought to
> be.  An empty head.S doesn't (well - shouldn't) need the overwhelming
> majority of this.
> 
> Do you know how all of this is being pulled in?  Is it from attempting
> to compile common/ by any chance?
> 

Yes, IIRC most is pulled in from common code. If it would be helpful
I could play around with not building common to see what the difference
is.

> Now is also an excellent opportunity to nuke the x86isms which have
> escaped into common code (debugger and xenoprof in particular), and
> rethink some of our common/arch split.
> 
> When it comes to header files specifically, I want to start using
> xen/arch/$ARCH/include/asm/ and retrofit this to x86 and ARM.  It has
> two important properties - first, that you don't need to symlink the
> tree to make compilation work, and second that patches touching multiple
> architectures have hunks ordered in a more logical way.

+1 for removing the symlink, that would have saved me an embarrasingly
large amount of time when I started this work and had failed to clean
the existing x86 symlink :).

    Connor

