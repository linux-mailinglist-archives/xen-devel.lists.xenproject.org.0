Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B08326B85
	for <lists+xen-devel@lfdr.de>; Sat, 27 Feb 2021 05:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90684.171676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFqqw-0000ep-Eb; Sat, 27 Feb 2021 04:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90684.171676; Sat, 27 Feb 2021 04:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFqqw-0000eQ-BA; Sat, 27 Feb 2021 04:05:14 +0000
Received: by outflank-mailman (input) for mailman id 90684;
 Sat, 27 Feb 2021 04:05:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GzqE=H5=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFqqu-0000eL-78
 for xen-devel@lists.xenproject.org; Sat, 27 Feb 2021 04:05:12 +0000
Received: from mail-ot1-x334.google.com (unknown [2607:f8b0:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a431c4dd-d743-4aa7-ab2c-6997a79ea312;
 Sat, 27 Feb 2021 04:05:10 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id f33so11105367otf.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Feb 2021 20:05:10 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id f29sm2164908ook.7.2021.02.26.20.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 20:05:09 -0800 (PST)
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
X-Inumbo-ID: a431c4dd-d743-4aa7-ab2c-6997a79ea312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=U3GUvGQhE//spACJjXMuj5TJ38Bc8rINQlyfWMkdizY=;
        b=piZga88zF95a+aseMFBPmFFeMX+kgz4bPIrU3YoP31j6+b3pMfPCxm3qA1hakBPGEG
         yX4K4IrkMdopR+4ITrOxswAuGVhJMoeWrkYWyIARuhJbe4IFQWOpo9RenkefPFFyKb0f
         /bKszBs5uTJ42ney5j83jodLggq7VdE2EHua4EFJM2e0fCZEMvBr2pPbJWEPG/cwamOi
         h++UHCwmI6tAVh+epHU1sPx4A8yugxD6gTlmP/AkoMNNAW1Wj+cUsG9LdMr4bTnNLFF7
         2neyviNWw6aLq6bmWUT85zAyPOqkWSN9L7qcqD2EuVWRh/36IyG8ZK3M/Dd6bL5gjrGi
         R91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=U3GUvGQhE//spACJjXMuj5TJ38Bc8rINQlyfWMkdizY=;
        b=PtHRwS78T8jwyhuMxLdOq1EQ9h+0nSPvYhU6Qchu2Vd6pUAUts3ODcsXFdTXq6u+nw
         7Bf/2q1I/VCTDNurOSSTvTGNNyyCszZo8d/ABHgxXhiWz2Ut5ngTwXwK72s5mtQjKIvp
         3cHwSKVorGtqOlpQPPQoG6feFB67q00+aawXbiFF8O+j756aciajQ/pA1wPM1wEu0BJZ
         cVdipaQcvbiAl/bUzSM9QkdaejCqHiY9/TtD7eHnoDKtisUjG8ohfentWZ35ZgD7vYD5
         swXo8Ny4pd+y4P7yTqIYdoMPlxJkY6U3fbHhGtzprzXI5I/5RUkAhygarTGlsSe9ydO0
         fiUQ==
X-Gm-Message-State: AOAM5302FqrzODyNoc2aWxSDltjCezKOt2FNUoOUH1M6Yho5ycNmPrvT
	UIHibgOnzH42TbztUG4aqo0=
X-Google-Smtp-Source: ABdhPJxZlL652HzFUBHzqVc/UgMqYIfXV/xg+T0Ia7A/9t4+e5d/OQ+bYS224QjIIhob18UcWO4Uew==
X-Received: by 2002:a9d:7482:: with SMTP id t2mr1094250otk.261.1614398710174;
        Fri, 26 Feb 2021 20:05:10 -0800 (PST)
Date: Fri, 26 Feb 2021 21:05:07 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [PATCH for-next 5/6] xen: Add files needed for minimal riscv
 build
Message-ID: <20210227040507.wwdg5kgripcec2df@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <7652ce3486c026a3a9f7d850170ea81ba8a18bdb.1614265718.git.connojdavis@gmail.com>
 <9b441529-c5a4-4299-1155-869bcdab06b0@citrix.com>
 <alpine.DEB.2.21.2102251631220.3234@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.21.2102251631220.3234@sstabellini-ThinkPad-T480s>

On Thu, Feb 25, 2021 at 05:06:46PM -0800, Stefano Stabellini wrote:
> On Thu, 25 Feb 2021, Andrew Cooper wrote:
> > On 25/02/2021 15:24, Connor Davis wrote:
> > > Add the minimum code required to get xen to build with
> > > XEN_TARGET_ARCH=riscv64. It is minimal in the sense that every file and
> > > function added is required for a successful build, given the .config
> > > generated from riscv64_defconfig. The function implementations are just
> > > stubs; actual implmentations will need to be added later.
> > >
> > > Signed-off-by: Connor Davis <connojdavis@gmail.com>
> 
> This is awesome, Connor! I am glad you are continuing this work and
> I am really looking forward to have it in the tree.
> 
> 
> > > ---
> > >  config/riscv64.mk                        |   7 +
> > >  xen/Makefile                             |   8 +-
> > >  xen/arch/riscv/Kconfig                   |  54 ++++
> > >  xen/arch/riscv/Kconfig.debug             |   0
> > >  xen/arch/riscv/Makefile                  |  57 ++++
> > >  xen/arch/riscv/README.source             |  19 ++
> > >  xen/arch/riscv/Rules.mk                  |  13 +
> > >  xen/arch/riscv/arch.mk                   |   7 +
> > >  xen/arch/riscv/configs/riscv64_defconfig |  12 +
> > >  xen/arch/riscv/delay.c                   |  16 +
> > >  xen/arch/riscv/domain.c                  | 144 +++++++++
> > >  xen/arch/riscv/domctl.c                  |  36 +++
> > >  xen/arch/riscv/guestcopy.c               |  57 ++++
> > >  xen/arch/riscv/head.S                    |   6 +
> > >  xen/arch/riscv/irq.c                     |  78 +++++
> > >  xen/arch/riscv/lib/Makefile              |   1 +
> > >  xen/arch/riscv/lib/find_next_bit.c       | 284 +++++++++++++++++
> > >  xen/arch/riscv/mm.c                      |  93 ++++++
> > >  xen/arch/riscv/p2m.c                     | 150 +++++++++
> > >  xen/arch/riscv/percpu.c                  |  17 +
> > >  xen/arch/riscv/platforms/Kconfig         |  31 ++
> > >  xen/arch/riscv/riscv64/asm-offsets.c     |  31 ++
> > >  xen/arch/riscv/setup.c                   |  27 ++
> > >  xen/arch/riscv/shutdown.c                |  28 ++
> > >  xen/arch/riscv/smp.c                     |  35 +++
> > >  xen/arch/riscv/smpboot.c                 |  34 ++
> > >  xen/arch/riscv/sysctl.c                  |  33 ++
> > >  xen/arch/riscv/time.c                    |  35 +++
> > >  xen/arch/riscv/traps.c                   |  35 +++
> > >  xen/arch/riscv/vm_event.c                |  39 +++
> > >  xen/arch/riscv/xen.lds.S                 | 113 +++++++
> > >  xen/drivers/char/serial.c                |   1 +
> > >  xen/include/asm-riscv/altp2m.h           |  39 +++
> > >  xen/include/asm-riscv/asm.h              |  77 +++++
> > >  xen/include/asm-riscv/asm_defns.h        |  24 ++
> > >  xen/include/asm-riscv/atomic.h           | 204 ++++++++++++
> > >  xen/include/asm-riscv/bitops.h           | 331 ++++++++++++++++++++
> > >  xen/include/asm-riscv/bug.h              |  54 ++++
> > >  xen/include/asm-riscv/byteorder.h        |  16 +
> > >  xen/include/asm-riscv/cache.h            |  24 ++
> > >  xen/include/asm-riscv/cmpxchg.h          | 382 +++++++++++++++++++++++
> > >  xen/include/asm-riscv/compiler_types.h   |  32 ++
> > >  xen/include/asm-riscv/config.h           | 110 +++++++
> > >  xen/include/asm-riscv/cpufeature.h       |  17 +
> > >  xen/include/asm-riscv/csr.h              | 219 +++++++++++++
> > >  xen/include/asm-riscv/current.h          |  47 +++
> > >  xen/include/asm-riscv/debugger.h         |  15 +
> > >  xen/include/asm-riscv/delay.h            |  15 +
> > >  xen/include/asm-riscv/desc.h             |  12 +
> > >  xen/include/asm-riscv/device.h           |  15 +
> > >  xen/include/asm-riscv/div64.h            |  23 ++
> > >  xen/include/asm-riscv/domain.h           |  50 +++
> > >  xen/include/asm-riscv/event.h            |  42 +++
> > >  xen/include/asm-riscv/fence.h            |  12 +
> > >  xen/include/asm-riscv/flushtlb.h         |  34 ++
> > >  xen/include/asm-riscv/grant_table.h      |  12 +
> > >  xen/include/asm-riscv/guest_access.h     |  41 +++
> > >  xen/include/asm-riscv/guest_atomics.h    |  60 ++++
> > >  xen/include/asm-riscv/hardirq.h          |  27 ++
> > >  xen/include/asm-riscv/hypercall.h        |  12 +
> > >  xen/include/asm-riscv/init.h             |  42 +++
> > >  xen/include/asm-riscv/io.h               | 283 +++++++++++++++++
> > >  xen/include/asm-riscv/iocap.h            |  13 +
> > >  xen/include/asm-riscv/iommu.h            |  46 +++
> > >  xen/include/asm-riscv/irq.h              |  58 ++++
> > >  xen/include/asm-riscv/mem_access.h       |   4 +
> > >  xen/include/asm-riscv/mm.h               | 246 +++++++++++++++
> > >  xen/include/asm-riscv/monitor.h          |  65 ++++
> > >  xen/include/asm-riscv/nospec.h           |  25 ++
> > >  xen/include/asm-riscv/numa.h             |  41 +++
> > >  xen/include/asm-riscv/p2m.h              | 218 +++++++++++++
> > >  xen/include/asm-riscv/page-bits.h        |  11 +
> > >  xen/include/asm-riscv/page.h             |  73 +++++
> > >  xen/include/asm-riscv/paging.h           |  15 +
> > >  xen/include/asm-riscv/pci.h              |  31 ++
> > >  xen/include/asm-riscv/percpu.h           |  33 ++
> > >  xen/include/asm-riscv/processor.h        |  59 ++++
> > >  xen/include/asm-riscv/random.h           |   9 +
> > >  xen/include/asm-riscv/regs.h             |  23 ++
> > >  xen/include/asm-riscv/setup.h            |  14 +
> > >  xen/include/asm-riscv/smp.h              |  46 +++
> > >  xen/include/asm-riscv/softirq.h          |  16 +
> > >  xen/include/asm-riscv/spinlock.h         |  12 +
> > >  xen/include/asm-riscv/string.h           |  28 ++
> > >  xen/include/asm-riscv/sysregs.h          |  16 +
> > >  xen/include/asm-riscv/system.h           |  99 ++++++
> > >  xen/include/asm-riscv/time.h             |  31 ++
> > >  xen/include/asm-riscv/trace.h            |  12 +
> > >  xen/include/asm-riscv/types.h            |  60 ++++
> > >  xen/include/asm-riscv/vm_event.h         |  55 ++++
> > >  xen/include/asm-riscv/xenoprof.h         |  12 +
> > >  xen/include/public/arch-riscv.h          | 183 +++++++++++
> > >  xen/include/public/arch-riscv/hvm/save.h |  39 +++
> > >  xen/include/public/hvm/save.h            |   2 +
> > >  xen/include/public/pmu.h                 |   2 +
> > >  xen/include/public/xen.h                 |   2 +
> > >  xen/include/xen/domain.h                 |   1 +
> > 
> > Well - this is orders of magnitude more complicated than it ought to
> > be.  An empty head.S doesn't (well - shouldn't) need the overwhelming
> > majority of this.
> > 
> > Do you know how all of this is being pulled in?  Is it from attempting
> > to compile common/ by any chance?
> 
> I'd love to see this patch split into several smaller patches. Ideally
> one patch per header file or per group of headers. It is fine if it ends
> up being a very large series. For patches imported from Linux, make sure
> to say that they are coming from Linux commit XXX in the commit message.
> It is going to make it a lot easier to ack them.
 
I was trying to keep the series bisectable so that every commit built
successfully. Not including any of the files above would have cause a build
error. Adding one file per patch would certainly make it easier to review,
but the series wouldn't build cleanly.

> Also, I think we need a concrete build target in mind: we don't want to
> add a function stub if it is not needed to build something. Make sure to
> specify what you are building in patch 0.

Agreed. Do you have a target in mind?

> I tried building this series. The container didn't build for me, so I
> build the toolchain myself. I noticed a couple of things:
> 
> XEN_TARGET_ARCH=riscv64 works but XEN_TARGET_ARCH=riscv doesn't.
> Maybe we should make XEN_TARGET_ARCH=riscv work too using the
> xen/Makefile TARGET transformations.
> 
> It seems to be building quite a few things under common. However it
> breaks with:
> 
> vm_event.c: In function 'vm_event_resume':
> vm_event.c:428:17: error: implicit declaration of function 'vm_event_reset_vmtrace'; did you mean 'vm_event_resume'? [-Werror=implicit-function-declaration]
>   428 |                 vm_event_reset_vmtrace(v);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~
>       |                 vm_event_resume
> vm_event.c:428:17: error: nested extern declaration of 'vm_event_reset_vmtrace' [-Werror=nested-externs]

Yes, I failed to re-test the build after rebasing on the latest master.
Found this myself after I sent it out but then it was too late :/

> I got past that with a hack, but then I got this error:
> 
> ns16550.c: In function 'ns16550_init_preirq':
> ns16550.c:353:42: error: implicit declaration of function 'ioremap'; did you mean 'ioremap_wc'? [-Werror=implicit-function-declaration]
>   353 |         uart->remapped_io_base = (char *)ioremap(uart->io_base, uart->io_size);
>       |                                          ^~~~~~~
>       |                                          ioremap_wc
> ns16550.c:353:42: error: nested extern declaration of 'ioremap' [-Werror=nested-externs]
> ns16550.c:353:34: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   353 |         uart->remapped_io_base = (char *)ioremap(uart->io_base, uart->io_size);
>       |                                  ^
> At top level:
> ns16550.c:628:13: error: 'ns16550_init_common' defined but not used [-Werror=unused-function]
>   628 | static void ns16550_init_common(struct ns16550 *uart)
>       |             ^~~~~~~~~~~~~~~~~~~
> ns16550.c:610:41: error: 'ns16550_driver' defined but not used [-Werror=unused-variable]
>   610 | static struct uart_driver __read_mostly ns16550_driver = {
>       |                                         ^~~~~~~~~~~~~~
> ns16550.c:204:13: error: '__ns16550_poll' defined but not used [-Werror=unused-function]
>   204 | static void __ns16550_poll(struct cpu_user_regs *regs)
>       |             ^~~~~~~~~~~~~~
> ns16550.c:76:3: error: 'ns16550_com' defined but not used [-Werror=unused-variable]
>    76 | } ns16550_com[2] = { { 0 } };
>       |   ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> 
> Which is strange given that ns16550.c shouldn't be built at all.  "QEMU
> RISC-V virt machine support" is forcing CONFIG_HAS_NS16550=y on my
> system. I chose "All Platforms" and CONFIG_HAS_NS16550=y went away. That
> can't be right :-)

Hmm, did you apply patch 1? That patch should have taken care of this
error.

> 
> After that, I could actually finish the build:
> 
> sstabellini@sstabellini-ThinkPad-T480s:/local/repos/xen-upstream/xen$ find . -name \*.o
> ./common/spinlock.o
> ./common/irq.o
> ./common/sysctl.o
> ./common/sched/built_in.o
> ./common/sched/cpupool.o
> ./common/sched/credit2.o
> ./common/sched/core.o
> ./common/stop_machine.o
> ./common/gunzip.init.o
> ./common/multicall.o
> ./common/symbols.o
> ./common/rwlock.o
> ./common/event_channel.o
> ./common/guestcopy.o
> ./common/softirq.o
> ./common/virtual_region.o
> ./common/lib.o
> ./common/wait.o
> ./common/time.o
> ./common/notifier.o
> ./common/cpu.o
> ./common/page_alloc.o
> ./common/string.o
> ./common/vm_event.o
> ./common/tasklet.o
> ./common/version.o
> ./common/symbols-dummy.o
> ./common/memory.o
> ./common/warning.o
> ./common/xmalloc_tlsf.o
> ./common/kernel.o
> ./common/gunzip.o
> ./common/warning.init.o
> ./common/domain.o
> ./common/event_2l.o
> ./common/radix-tree.o
> ./common/timer.o
> ./common/built_in.o
> ./common/bitmap.o
> ./common/smp.o
> ./common/vsprintf.o
> ./common/keyhandler.o
> ./common/shutdown.o
> ./common/rcupdate.o
> ./common/rangeset.o
> ./common/vmap.o
> ./common/domctl.o
> ./common/preempt.o
> ./common/event_fifo.o
> ./common/monitor.o
> ./common/random.o
> ./lib/bsearch.o
> ./lib/rbtree.o
> ./lib/parse-size.o
> ./lib/ctype.o
> ./lib/ctors.o
> ./lib/list-sort.o
> ./lib/sort.o
> ./lib/built_in.o
> ./drivers/built_in.o
> ./drivers/char/serial.o
> ./drivers/char/built_in.o
> ./drivers/char/console.o
> ./arch/riscv/irq.o
> ./arch/riscv/sysctl.o
> ./arch/riscv/delay.o
> ./arch/riscv/lib/built_in.o
> ./arch/riscv/lib/find_next_bit.o
> ./arch/riscv/guestcopy.o
> ./arch/riscv/time.o
> ./arch/riscv/prelink.o
> ./arch/riscv/vm_event.o
> ./arch/riscv/setup.o
> ./arch/riscv/domain.o
> ./arch/riscv/traps.o
> ./arch/riscv/built_in.o
> ./arch/riscv/smp.o
> ./arch/riscv/mm.o
> ./arch/riscv/percpu.o
> ./arch/riscv/p2m.o
> ./arch/riscv/shutdown.o
> ./arch/riscv/head.o
> ./arch/riscv/domctl.o
> ./arch/riscv/smpboot.o
> 
> Which is absolutely astounding! Great job! I didn't imagine you already
> managed to build the whole of commons!


