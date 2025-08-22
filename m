Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722AB32366
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 22:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090468.1447670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upY5A-0000eY-Sk; Fri, 22 Aug 2025 20:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090468.1447670; Fri, 22 Aug 2025 20:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upY5A-0000bQ-Pr; Fri, 22 Aug 2025 20:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1090468;
 Fri, 22 Aug 2025 20:09:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4vUW=3C=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1upY59-0000at-2Y
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 20:09:51 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f8be6f-7f93-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 22:09:48 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 57MK9EEh068393
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 22 Aug 2025 16:09:19 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 57MK9DMg068392;
 Fri, 22 Aug 2025 13:09:13 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: f1f8be6f-7f93-11f0-a32b-13f23c93f187
Date: Fri, 22 Aug 2025 13:09:13 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, xen-users@lists.xenproject.org,
        xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Paul Leiber <paul@onlineschubla.de>
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
Message-ID: <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Fri, Aug 15, 2025 at 10:14:42AM +0200, Jan Beulich wrote:
> On 14.08.2025 23:27, Demi Marie Obenour wrote:
> > On 8/14/25 02:55, Jan Beulich wrote:
> >> On 06.08.2025 06:30, Elliott Mitchell wrote:
> >>> On Tue, Jul 01, 2025 at 10:01:13PM +0200, Paul Leiber wrote:
> >>>>
> >>>> Unfortunately, I don't have a direct answer to the question (as is so often
> >>>> the case, due to my limited knowledge and experience). However, I am
> >>>> successfully running Xen on a RPi 4 (mostly, except for some VLAN related
> >>>> networking issues).
> >>>>
> >>>> I used instructions in [1] to install vanilla Debian on the RPi, including
> >>>> UEFI boot and grub. I then compiled Xen with expert options and ACPI
> >>>> enabled.
> >>>>
> >>>> I don't know if there are better solutions. For example, I suffer from the
> >>>> fact that I2C doesn't work when using UEFI boot on a RPi. Nowadays, Debian
> >>>> provides their own vanilla Debian images for RPi and with working I2C, but
> >>>> these images are using a different boot method that I didn't know how to use
> >>>> with Xen.  So far, the procedure described above seems to be the easiest
> >>>> solution for me.
> >>>
> >>>
> >>>> [1] https://forums.raspberrypi.com/viewtopic.php?t=282839
> >>>>
> >>>> Am 30.06.2025 um 12:35 schrieb Sumit Semwal:
> >>>>>
> >>>>> I've just begun to experiment with the Raspberry Pi 5, trying to run a
> >>>>> simple xen + Dom0 setup, using uBoot, and the bookworm based Rpi
> >>>>> distro.
> >>>>>
> >>>>> I've tried combinations of the following setup:
> >>>>>
> >>>>> 1. prebuilt Rpi5 kernel + dtbs, and have also tried to build them from
> >>>>> source [1]
> >>>>> 2. Xen from upstream [2] and xen-troops [3]
> >>>>> 3. upstream uBoot from [4]
> >>>>>
> >>>>> but with the same result: [short log below; I can provide a fuller log
> >>>>> if needed]
> >>>>>
> >>>>> (XEN) DT: ** translation for device /axi/msi-controller@1000130000 **
> >>>>> (XEN) DT: bus is default (na=2, ns=2) on /axi
> >>>>> (XEN) DT: translating address:<3> 000000ff<3> fffff000<3>
> >>>>> (XEN) DT: parent bus is default (na=2, ns=1) on /
> >>>>> (XEN) DT: walking ranges...
> >>>>> (XEN) DT: default map, cp=0, s=1000000000, da=fffffff000
> >>>>> (XEN) DT: default map, cp=1000000000, s=100000000, da=fffffff000
> >>>>> (XEN) DT: default map, cp=1400000000, s=400000000, da=fffffff000
> >>>>> (XEN) DT: default map, cp=1800000000, s=400000000, da=fffffff000
> >>>>> (XEN) DT: default map, cp=1c00000000, s=400000000, da=fffffff000
> >>>>> (XEN) DT: not found !
> >>>>> (XEN) Unable to retrieve address 1 for /axi/msi-controller@1000130000
> >>>>> (XEN) Device tree generation failed (-22).
> >>>>> (XEN) debugtrace_dump() global buffer starting
> >>>>> 1 cpupool_create(pool=0,sched=6)
> >>>>> 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
> >>>>> 3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
> >>>>> (XEN) wrap: 0
> >>>>> (XEN) debugtrace_dump() global buffer finished
> >>>>> (XEN)
> >>>>> (XEN) ****************************************
> >>>>> (XEN) Panic on CPU 0:
> >>>>> (XEN) Could not set up DOM0 guest OS (rc = -22)
> >>>>> (XEN) ****************************************
> >>>>>
> >>>>>
> >>>>> I'm certain I'm missing something, but before I delve deeper, I just
> >>>>> wanted to ask if this is a known issue, and if so, are there any
> >>>>> workarounds or solutions available for this?
> >>>>>
> >>>>> Any help about this is highly appreciated!
> >>>>>
> >>>>> Thanks and Best regards,
> >>>>> Sumit.
> >>>>>
> >>>>> [1]:  https://github.com/raspberrypi/linux rpi-6.12.y branch
> >>>>> [2]: git://xenbits.xen.org/xen.git - main branch
> >>>>> [3] xen-troops https://github.com/xen-troops/xen - rpi5_dev branch
> >>>>> [4]: https://github.com/u-boot/u-boot.git master branch
> >>>
> >>> Ultimately Debian is choosing to leave most defaults alone.  So far the
> >>> Xen developers have left CONFIG_ACPI defaulting to off on ARM*.  The
> >>> Debian project doesn't have paid people to support Raspberry PI hardware,
> >>> despite being rather common.  As a result there aren't any official
> >>> Raspberry PI images, but people associated with Tianocore have gotten
> >>> generic images to boot on Raspberry PI hardware.
> >>>
> >>> I'm unsure of the likelihood of getting the Debian maintainers to
> >>> override the default.  Yet due being by far the simplest way to install
> >>> Debian and Xen on a very common ARM64 platform, perhaps the Xen
> >>> developers should consider changing?
> >>
> >> In an open source project everyone is a developer. There is a
> >> significant amount of work someone needs to pick up to change this
> >> SUPPORT.md entry:
> >>
> >> ### Host ACPI (via Domain 0)
> >>
> >>     Status, x86 PV: Supported
> >>     Status, ARM: Experimental
> >>
> >> Parties interested in changing the support status of any component are the
> >> primary candidates to actually carry out the necessary work.
> > 
> > What is that work?
> 
> To determine what exactly needs doing is part of the exercise. I, for one, am
> unaware of a concrete written down set of things which need doing.

Since you're not pointing to anything definite, could it be everything
has been resolved?  We've got at least two people for whom ACPI on ARM
works pretty well.  There may be many more using it.  Perhaps this
should even be done on the 4.20 branch given how long this has been
working?

The one remaining major issue was the state of EFI-FB support.  There
was a patch which had that working for Linux kernel 5.10, but that might
need more work for a proper solution.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



