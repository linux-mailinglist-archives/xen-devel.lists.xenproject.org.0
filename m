Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD696A1BDDC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 22:27:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876846.1287172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbRCJ-0007r3-Bb; Fri, 24 Jan 2025 21:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876846.1287172; Fri, 24 Jan 2025 21:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbRCJ-0007pe-8Q; Fri, 24 Jan 2025 21:26:39 +0000
Received: by outflank-mailman (input) for mailman id 876846;
 Fri, 24 Jan 2025 21:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yRFp=UQ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1tbRCI-0007pY-Dw
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 21:26:38 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1f05d25-da99-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 22:26:34 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 50OLQNLa029330
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 24 Jan 2025 16:26:29 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 50OLQNir029329;
 Fri, 24 Jan 2025 13:26:23 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: e1f05d25-da99-11ef-99a4-01e77a169b0f
Date: Fri, 24 Jan 2025 13:26:23 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Serious AMD-Vi issue
Message-ID: <Z5QFf5Ipk3GHd27H@mattapan.m5p.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <Z5OkQgjd4Lt_rtr0@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5OkQgjd4Lt_rtr0@macbook.local>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Fri, Jan 24, 2025 at 03:31:30PM +0100, Roger Pau Monné wrote:
> On Thu, Jan 25, 2024 at 12:24:53PM -0800, Elliott Mitchell wrote:
> > Apparently this was first noticed with 4.14, but more recently I've been
> > able to reproduce the issue:
> > 
> > https://bugs.debian.org/988477
> > 
> > The original observation features MD-RAID1 using a pair of Samsung
> > SATA-attached flash devices.  The main line shows up in `xl dmesg`:
> > 
> > (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I
> 
> I think I've figured out the cause for those faults, and posted a fix
> here:
> 
> https://lore.kernel.org/xen-devel/20250124120112.56678-1-roger.pau@citrix.com/
> 
> Fix is patch 5/5, but you likely want to take them all to avoid
> context conflicts.

I haven't tested yet, but some analysis from looking at the series.

This seems a plausible explanation for the interrupt IOMMU messages.  As
such I think there is a good chance the reported messages will disappear.

Nothing in here looks plausible for solving the real problem, that of
RAID1 mirrors diverging (almost certainly getting zeroes during DMA, but
there is a chance stale data is being read).

Worse, since it removes the observed messages, the next person will
almost certainly have severe data loss by the time they realize there is
a problem.  Notably those messages lead me to Debian #988477, so I was
able to take action before things got too bad.



I'm not absolutely certain this is a pure Xen bug.  There is a
possibility the RAID1 driver is reusing DMA buffers in a fashion which
violates the DMA interface.  Yet there is also a good chance Xen isn't
implementing its layer properly either.



There is one pattern emerging at this point.  Samsung hardware is badly
effected, other vendors are either uneffected or mildly effected.
Notably the estimated age of the devices meant to be handed off to
someone able to diagnose the issue is >10 years.  The uneffected
Crucial/Micron SATA device *should* drastically outperform these, yet
instead it is uneffected.  The Crucial/Micron NVMe is very mildly
effected, yet should be more than an order of magnitude faster.

The simplest explanation is the flash controller on the Samsung devices
is lower latency than the one used by Micron.


Both present reproductions feature AMD processors and ASUS motherboards.
I'm doubtful of this being an ASUS issue.  This seems more likely a case
of people who use RAID with flash tending to go with a motherboard vendor
who reliably support ECC on all their motherboards.

I don't know whether this is confined to AMD processors, or not.  The
small number of reproductions suggests few people are doing RAID with
flash storage.  In which case no one may have tried RAID1 with flash on
Intel processors.  On Intel hardware the referenced message would be
absent and people might think their problem was distinct from Debian
#988477.

In fact what seems a likely reproduction on Intel hardware is the Intel
sound card issue.  I notice that issue occurs when sound *starts*
playing.  When a sound device starts, its buffers would be empty and the
first DMA request would be turned around with minimal latency.  In such
case this matches the Samsung SATA devices handling DMA with low
latency.


> Can you give it a try and see if it fixes the fault messages, plus
> your issues with the disk devices?

Ick.  I was hoping to avoid reinstalling the known problematic devices
and simply send them to someone better setup for analyzing x86 problems.

Looking at the series, it seems likely to remove the fault messages and
turn this into silent data loss.  I doubt any AMD processors have an
IOMMU, yet omit cmpxchg16b (older system lacked full IOMMU, yet did have
cmpxchg16b, newer system has both).  Even guests have cmpxchg16b
available.

If you really want this tested, it will be a while before the next
potential downtime window.

Come to think of it, I wonder whether this might fix a particular device
which was having an interrupt problem.  Problem there being it was being
uncooperative with motherboard firmware...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



