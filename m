Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B19B1BF96
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 06:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071123.1434661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujVoH-0005hs-3k; Wed, 06 Aug 2025 04:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071123.1434661; Wed, 06 Aug 2025 04:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujVoG-0005dw-Ty; Wed, 06 Aug 2025 04:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1071123;
 Wed, 06 Aug 2025 04:31:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CR+j=2S=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ujVoF-0005b9-4C
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 04:31:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35b26d50-727e-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 06:31:25 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 5764Us6B006240
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 6 Aug 2025 00:30:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 5764Up9t006239;
 Tue, 5 Aug 2025 21:30:51 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 35b26d50-727e-11f0-a322-13f23c93f187
Date: Tue, 5 Aug 2025 21:30:51 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Paul Leiber <paul@onlineschubla.de>
Cc: xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Consider changing CONFIG_ACPI default on ARM? (was: Re: Xen bootup:
 issue with Raspberry Pi 5?)
Message-ID: <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

Sigh, resending as I lost some of the intended Cc targets when originally
creating the message.  Sorry about the duplication for people who have
already seen, but I thought this might be worthy of wider discussion.



I would like to draw the attention of a few people on xen-devel to the
thread which occured on xen-users recently and quoted below:

https://lists.xenproject.org/archives/html/xen-users/2025-07/msg00001.html

On Tue, Jul 01, 2025 at 10:01:13PM +0200, Paul Leiber wrote:
> 
> Unfortunately, I don't have a direct answer to the question (as is so often
> the case, due to my limited knowledge and experience). However, I am
> successfully running Xen on a RPi 4 (mostly, except for some VLAN related
> networking issues).
> 
> I used instructions in [1] to install vanilla Debian on the RPi, including
> UEFI boot and grub. I then compiled Xen with expert options and ACPI
> enabled.
> 
> I don't know if there are better solutions. For example, I suffer from the
> fact that I2C doesn't work when using UEFI boot on a RPi. Nowadays, Debian
> provides their own vanilla Debian images for RPi and with working I2C, but
> these images are using a different boot method that I didn't know how to use
> with Xen.  So far, the procedure described above seems to be the easiest
> solution for me.


> [1] https://forums.raspberrypi.com/viewtopic.php?t=282839
> 
> Am 30.06.2025 um 12:35 schrieb Sumit Semwal:
> > 
> > I've just begun to experiment with the Raspberry Pi 5, trying to run a
> > simple xen + Dom0 setup, using uBoot, and the bookworm based Rpi
> > distro.
> > 
> > I've tried combinations of the following setup:
> > 
> > 1. prebuilt Rpi5 kernel + dtbs, and have also tried to build them from
> > source [1]
> > 2. Xen from upstream [2] and xen-troops [3]
> > 3. upstream uBoot from [4]
> > 
> > but with the same result: [short log below; I can provide a fuller log
> > if needed]
> > 
> > (XEN) DT: ** translation for device /axi/msi-controller@1000130000 **
> > (XEN) DT: bus is default (na=2, ns=2) on /axi
> > (XEN) DT: translating address:<3> 000000ff<3> fffff000<3>
> > (XEN) DT: parent bus is default (na=2, ns=1) on /
> > (XEN) DT: walking ranges...
> > (XEN) DT: default map, cp=0, s=1000000000, da=fffffff000
> > (XEN) DT: default map, cp=1000000000, s=100000000, da=fffffff000
> > (XEN) DT: default map, cp=1400000000, s=400000000, da=fffffff000
> > (XEN) DT: default map, cp=1800000000, s=400000000, da=fffffff000
> > (XEN) DT: default map, cp=1c00000000, s=400000000, da=fffffff000
> > (XEN) DT: not found !
> > (XEN) Unable to retrieve address 1 for /axi/msi-controller@1000130000
> > (XEN) Device tree generation failed (-22).
> > (XEN) debugtrace_dump() global buffer starting
> > 1 cpupool_create(pool=0,sched=6)
> > 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
> > 3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
> > (XEN) wrap: 0
> > (XEN) debugtrace_dump() global buffer finished
> > (XEN)
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) Could not set up DOM0 guest OS (rc = -22)
> > (XEN) ****************************************
> > 
> > 
> > I'm certain I'm missing something, but before I delve deeper, I just
> > wanted to ask if this is a known issue, and if so, are there any
> > workarounds or solutions available for this?
> > 
> > Any help about this is highly appreciated!
> > 
> > Thanks and Best regards,
> > Sumit.
> > 
> > [1]:  https://github.com/raspberrypi/linux rpi-6.12.y branch
> > [2]: git://xenbits.xen.org/xen.git - main branch
> > [3] xen-troops https://github.com/xen-troops/xen - rpi5_dev branch
> > [4]: https://github.com/u-boot/u-boot.git master branch

Ultimately Debian is choosing to leave most defaults alone.  So far the
Xen developers have left CONFIG_ACPI defaulting to off on ARM*.  The
Debian project doesn't have paid people to support Raspberry PI hardware,
despite being rather common.  As a result there aren't any official
Raspberry PI images, but people associated with Tianocore have gotten
generic images to boot on Raspberry PI hardware.

I'm unsure of the likelihood of getting the Debian maintainers to
override the default.  Yet due being by far the simplest way to install
Debian and Xen on a very common ARM64 platform, perhaps the Xen
developers should consider changing?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



