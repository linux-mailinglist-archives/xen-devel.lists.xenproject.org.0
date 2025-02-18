Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF833A3920E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 05:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891052.1300151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkErp-00009c-BJ; Tue, 18 Feb 2025 04:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891052.1300151; Tue, 18 Feb 2025 04:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkErp-000086-7f; Tue, 18 Feb 2025 04:05:53 +0000
Received: by outflank-mailman (input) for mailman id 891052;
 Tue, 18 Feb 2025 04:05:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SsuC=VJ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1tkErn-00007u-S1
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 04:05:51 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d50c9d-edad-11ef-9aa6-95dc52dad729;
 Tue, 18 Feb 2025 05:05:49 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 51I45cwh009253
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 17 Feb 2025 23:05:43 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 51I45cRs009252;
 Mon, 17 Feb 2025 20:05:38 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: a1d50c9d-edad-11ef-9aa6-95dc52dad729
Date: Mon, 17 Feb 2025 20:05:38 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Serious AMD-Vi issue
Message-ID: <Z7QHEiwFmvd6CuNo@mattapan.m5p.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <Z5OkQgjd4Lt_rtr0@macbook.local>
 <Z5QFf5Ipk3GHd27H@mattapan.m5p.com>
 <Z5dVgd3aF_n9Q3hZ@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5dVgd3aF_n9Q3hZ@macbook.local>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Mon, Jan 27, 2025 at 10:44:33AM +0100, Roger Pau Monné wrote:
> On Fri, Jan 24, 2025 at 01:26:23PM -0800, Elliott Mitchell wrote:
> > On Fri, Jan 24, 2025 at 03:31:30PM +0100, Roger Pau Monné wrote:
> > > 
> > > I think I've figured out the cause for those faults, and posted a fix
> > > here:
> > > 
> > > https://lore.kernel.org/xen-devel/20250124120112.56678-1-roger.pau@citrix.com/
> > > 
> > > Fix is patch 5/5, but you likely want to take them all to avoid
> > > context conflicts.
> > 
> > I haven't tested yet, but some analysis from looking at the series.
> > 
> > This seems a plausible explanation for the interrupt IOMMU messages.  As
> > such I think there is a good chance the reported messages will disappear.
> > 
> > Nothing in here looks plausible for solving the real problem, that of
> > RAID1 mirrors diverging (almost certainly getting zeroes during DMA, but
> > there is a chance stale data is being read).
> > 
> > Worse, since it removes the observed messages, the next person will
> > almost certainly have severe data loss by the time they realize there is
> > a problem.  Notably those messages lead me to Debian #988477, so I was
> > able to take action before things got too bad.
> 
> I think it's the first time I get complains from the reported of a bug
> after attempting to fix it.
> 
> Maybe my original message wasn't clear enough.  So far I consider the
> IOMMU faults and the disk issues different bugs, and hence me asking
> specifically whether the posted series make any different for any of
> those issues.
> 
> I would be surprised if it also fixed the data loss issue, but wanted
> to ask regardless.

I could readily believe there are two issues here.  An interrupt issue
causing the messages, plus a distinct bug causing IOMMU issues.  The one
trick being the correlation means the interrupt issue serves to allow
rendezvous among reportters.

Problem is if so, the IOMMU is a *much* more severe issue.  Fixing the
interrupt issue is nice, but that doesn't cause data loss.

> > There is one pattern emerging at this point.  Samsung hardware is badly
> > effected, other vendors are either uneffected or mildly effected.
> > Notably the estimated age of the devices meant to be handed off to
> > someone able to diagnose the issue is >10 years.  The uneffected
> > Crucial/Micron SATA device *should* drastically outperform these, yet
> > instead it is uneffected.  The Crucial/Micron NVMe is very mildly
> > effected, yet should be more than an order of magnitude faster.
> > 
> > The simplest explanation is the flash controller on the Samsung devices
> > is lower latency than the one used by Micron.
> > 
> > 
> > Both present reproductions feature AMD processors and ASUS motherboards.
> > I'm doubtful of this being an ASUS issue.  This seems more likely a case
> > of people who use RAID with flash tending to go with a motherboard vendor
> > who reliably support ECC on all their motherboards.
> > 
> > I don't know whether this is confined to AMD processors, or not.  The
> > small number of reproductions suggests few people are doing RAID with
> > flash storage.  In which case no one may have tried RAID1 with flash on
> > Intel processors.  On Intel hardware the referenced message would be
> > absent and people might think their problem was distinct from Debian
> > #988477.
> 
> As said above - my current hypothesis is that the IOMMU fault message
> is just a red herring, and has nothing to do with the underlying data
> loss issue that you are seeing.
> 
> I expect there will be no similar IOMMU fault message on Intel
> hardware, as updating of interrupt remapping entries was already done
> atomically on VT-d.

Entirely possible.  Within the past 24 hours I notice the message:

Message-ID: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
Subject: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card

There is a fair bit of similarity, but some distinct differences there.
This may or may not be the exact same bug.

> > In fact what seems a likely reproduction on Intel hardware is the Intel
> > sound card issue.  I notice that issue occurs when sound *starts*
> > playing.  When a sound device starts, its buffers would be empty and the
> > first DMA request would be turned around with minimal latency.  In such
> > case this matches the Samsung SATA devices handling DMA with low
> > latency.
> 
> Can you reproduce the data loss issue without using RAID in Linux?
> You can use fio with verify or similar to stress test it.

I'm not setup to do this.  The only combination I've found where this
occurs features Linux software RAID.  This doesn't mean that is an
absolute requirement though.

> Can you reproduce if dom0 is PVH instead of PV?

I've tried to boot with PVH domain 0 a few times, but so far never had
any success.  I was planning to retry PVH domain 0 when the next Debian
update comes through.  As a result, I've only reproduced with PV
domain 0.

I notice the other report indicates it only effects PV domain 0.
Hopefully I'll have more success with PVH domain 0 next time.

> Can you reproduce with dom0-iommu=strict mode in the Xen command line?

Not yet tried.

> > > Can you give it a try and see if it fixes the fault messages, plus
> > > your issues with the disk devices?
> > 
> > Ick.  I was hoping to avoid reinstalling the known problematic devices
> > and simply send them to someone better setup for analyzing x86 problems.
> > 
> > Looking at the series, it seems likely to remove the fault messages and
> > turn this into silent data loss.  I doubt any AMD processors have an
> > IOMMU, yet omit cmpxchg16b (older system lacked full IOMMU, yet did have
> > cmpxchg16b, newer system has both).  Even guests have cmpxchg16b
> > available.
> 
> Silent data loss> data loss might or not be there, regardless of whether
> IOMMU faults are being reported.  IMO it's unhelpful to make this kind of
> comments, as you seem to suggest a preference for leaving the IOMMU
> fault bug unfixed, which I'm sure it's not the case.

Indeed.

> > If you really want this tested, it will be a while before the next
> > potential downtime window.
> 
> No worries, I already have confirmation from someone else that was
> seeing the same IOMMU faults has tested the fix.  I was mostly
> wondering whether it would affect your data loss issues in any way, as
> for that I have no one else that can reproduce.

I'm extremely doubtful it will effect that issue.  In the more immediate
time-frame, the question is whether:

Message-ID: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
Subject: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card

Is the same issue, or not?  There are enough differences to suspect it
is a distinct issue, but there is enough similarity to suspect it may
be the same issue.

Even if it is the same issue, some of the observations there might be
red herrings too.  I'm unsure about whether it is limited to particular
block ranges here.  (may or may not be)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



