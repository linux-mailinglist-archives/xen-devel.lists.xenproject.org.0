Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1C256082
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 20:30:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBj86-0002mA-Gs; Fri, 28 Aug 2020 18:29:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8iWR=CG=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1kBj85-0002m5-8r
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 18:29:37 +0000
X-Inumbo-ID: 88985133-3bb0-429f-b9fd-64538be37f02
Received: from mail-oi1-f193.google.com (unknown [209.85.167.193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88985133-3bb0-429f-b9fd-64538be37f02;
 Fri, 28 Aug 2020 18:29:36 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id j21so1471008oii.10
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2020 11:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6N6CVXc5N92G+nbU2aIhyYUGYhEMblWkwdCdwt2MKg=;
 b=AvbrGieCQGG/tHW7/A+C1aDrrMf4GwDxtqUwcVNJV9OKU+gSN4cybcwCedoLb9MKQM
 URHVe/lb0C4uKH/6cvwH9LHtuejBSLF7kxd4bBItK+Jcs3qYErA7/gGZRvcgzxr2JyQq
 i1SbEkLI43Hb7bjiAMnICaYc9CYLqQ56Q0Z6NN6KPsoUvfUqfu68qY0xW02RvjUBmK0s
 t1JrSK8ciK7Es9ogqE6fsQx8AavyRmhzKnW3+Ul7Vk45Xo+95P1oJQRfLGqqUk2fmSx6
 X4fxSGsddvuqTrNSk8GDdcIETR7nzDvQ/RmBAUOuLr7yDobmik6qnhBRiIhYlb9Ca01i
 JAfA==
X-Gm-Message-State: AOAM532Te6QiGUFBjkU1zLu07r4V7oFfh9v+76tniQ/0ny8VpPlPcM7N
 A93yVYMQOX4oUMcXACgEWK7VduswOjF1PDFBMqQ=
X-Google-Smtp-Source: ABdhPJxdGDW4We+8a806jNPDCr6gtzyuAIWR3S9nk6Y0ieqPKP1OFIkyV4At6oDeNttho4/b814wzOLYniNMMI1Z8FU=
X-Received: by 2002:aca:3e8b:: with SMTP id l133mr242310oia.110.1598639375464; 
 Fri, 28 Aug 2020 11:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598042152.git.anchalag@amazon.com>
 <20200828182640.GA20719@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
In-Reply-To: <20200828182640.GA20719@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 28 Aug 2020 20:29:24 +0200
Message-ID: <CAJZ5v0jDtttvGaBCuwK40W7gsYNn4U2dNszsOmtU_dt29Lvb4g@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] Fix PM hibernation in Xen guests
To: Anchal Agarwal <anchalag@amazon.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
 Linux PM <linux-pm@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>, "Kamata,
 Munehisa" <kamatam@amazon.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, roger.pau@citrix.com, 
 Jens Axboe <axboe@kernel.dk>, David Miller <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Peter Zijlstra <peterz@infradead.org>, Eduardo Valentin <eduval@amazon.com>, 
 "Singh, Balbir" <sblbir@amazon.com>, xen-devel@lists.xenproject.org, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, netdev <netdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 28, 2020 at 8:26 PM Anchal Agarwal <anchalag@amazon.com> wrote:
>
> On Fri, Aug 21, 2020 at 10:22:43PM +0000, Anchal Agarwal wrote:
> > Hello,
> > This series fixes PM hibernation for hvm guests running on xen hypervisor.
> > The running guest could now be hibernated and resumed successfully at a
> > later time. The fixes for PM hibernation are added to block and
> > network device drivers i.e xen-blkfront and xen-netfront. Any other driver
> > that needs to add S4 support if not already, can follow same method of
> > introducing freeze/thaw/restore callbacks.
> > The patches had been tested against upstream kernel and xen4.11. Large
> > scale testing is also done on Xen based Amazon EC2 instances. All this testing
> > involved running memory exhausting workload in the background.
> >
> > Doing guest hibernation does not involve any support from hypervisor and
> > this way guest has complete control over its state. Infrastructure
> > restrictions for saving up guest state can be overcome by guest initiated
> > hibernation.
> >
> > These patches were send out as RFC before and all the feedback had been
> > incorporated in the patches. The last v1 & v2 could be found here:
> >
> > [v1]: https://lkml.org/lkml/2020/5/19/1312
> > [v2]: https://lkml.org/lkml/2020/7/2/995
> > All comments and feedback from v2 had been incorporated in v3 series.
> >
> > Known issues:
> > 1.KASLR causes intermittent hibernation failures. VM fails to resumes and
> > has to be restarted. I will investigate this issue separately and shouldn't
> > be a blocker for this patch series.
> > 2. During hibernation, I observed sometimes that freezing of tasks fails due
> > to busy XFS workqueuei[xfs-cil/xfs-sync]. This is also intermittent may be 1
> > out of 200 runs and hibernation is aborted in this case. Re-trying hibernation
> > may work. Also, this is a known issue with hibernation and some
> > filesystems like XFS has been discussed by the community for years with not an
> > effectve resolution at this point.
> >
> > Testing How to:
> > ---------------
> > 1. Setup xen hypervisor on a physical machine[ I used Ubuntu 16.04 +upstream
> > xen-4.11]
> > 2. Bring up a HVM guest w/t kernel compiled with hibernation patches
> > [I used ubuntu18.04 netboot bionic images and also Amazon Linux on-prem images].
> > 3. Create a swap file size=RAM size
> > 4. Update grub parameters and reboot
> > 5. Trigger pm-hibernation from within the VM
> >
> > Example:
> > Set up a file-backed swap space. Swap file size>=Total memory on the system
> > sudo dd if=/dev/zero of=/swap bs=$(( 1024 * 1024 )) count=4096 # 4096MiB
> > sudo chmod 600 /swap
> > sudo mkswap /swap
> > sudo swapon /swap
> >
> > Update resume device/resume offset in grub if using swap file:
> > resume=/dev/xvda1 resume_offset=200704 no_console_suspend=1
> >
> > Execute:
> > --------
> > sudo pm-hibernate
> > OR
> > echo disk > /sys/power/state && echo reboot > /sys/power/disk
> >
> > Compute resume offset code:
> > "
> > #!/usr/bin/env python
> > import sys
> > import array
> > import fcntl
> >
> > #swap file
> > f = open(sys.argv[1], 'r')
> > buf = array.array('L', [0])
> >
> > #FIBMAP
> > ret = fcntl.ioctl(f.fileno(), 0x01, buf)
> > print buf[0]
> > "
> >
> > Aleksei Besogonov (1):
> >   PM / hibernate: update the resume offset on SNAPSHOT_SET_SWAP_AREA
> >
> > Anchal Agarwal (4):
> >   x86/xen: Introduce new function to map HYPERVISOR_shared_info on
> >     Resume
> >   x86/xen: save and restore steal clock during PM hibernation
> >   xen: Introduce wrapper for save/restore sched clock offset
> >   xen: Update sched clock offset to avoid system instability in
> >     hibernation
> >
> > Munehisa Kamata (5):
> >   xen/manage: keep track of the on-going suspend mode
> >   xenbus: add freeze/thaw/restore callbacks support
> >   x86/xen: add system core suspend and resume callbacks
> >   xen-blkfront: add callbacks for PM suspend and hibernation
> >   xen-netfront: add callbacks for PM suspend and hibernation
> >
> > Thomas Gleixner (1):
> >   genirq: Shutdown irq chips in suspend/resume during hibernation
> >
> >  arch/x86/xen/enlighten_hvm.c      |   7 +++
> >  arch/x86/xen/suspend.c            |  63 ++++++++++++++++++++
> >  arch/x86/xen/time.c               |  15 ++++-
> >  arch/x86/xen/xen-ops.h            |   3 +
> >  drivers/block/xen-blkfront.c      | 122 ++++++++++++++++++++++++++++++++++++--
> >  drivers/net/xen-netfront.c        |  96 +++++++++++++++++++++++++++++-
> >  drivers/xen/events/events_base.c  |   1 +
> >  drivers/xen/manage.c              |  46 ++++++++++++++
> >  drivers/xen/xenbus/xenbus_probe.c |  96 +++++++++++++++++++++++++-----
> >  include/linux/irq.h               |   2 +
> >  include/xen/xen-ops.h             |   3 +
> >  include/xen/xenbus.h              |   3 +
> >  kernel/irq/chip.c                 |   2 +-
> >  kernel/irq/internals.h            |   1 +
> >  kernel/irq/pm.c                   |  31 +++++++---
> >  kernel/power/user.c               |   7 ++-
> >  16 files changed, 464 insertions(+), 34 deletions(-)
> >
> > --
> > 2.16.6
> >
> A gentle ping on the series in case there is any more feedback or can we plan to
> merge this? I can then send the series with minor fixes pointed by tglx@

Some more time, please!

