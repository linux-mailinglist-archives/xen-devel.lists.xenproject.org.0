Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E984950BA8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776538.1186700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdve6-0000DI-74; Tue, 13 Aug 2024 17:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776538.1186700; Tue, 13 Aug 2024 17:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdve6-0000Bc-48; Tue, 13 Aug 2024 17:49:22 +0000
Received: by outflank-mailman (input) for mailman id 776538;
 Tue, 13 Aug 2024 17:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nBzl=PM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1sdve4-0000BW-U2
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:49:20 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c925054-599c-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 19:49:19 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 47DHn7tw031758
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 13 Aug 2024 13:49:13 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 47DHn6gB031757;
 Tue, 13 Aug 2024 10:49:06 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 5c925054-599c-11ef-a505-bb4a2ccca743
Date: Tue, 13 Aug 2024 10:49:06 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: AMD EPYC virtual network performances
Message-ID: <ZruckufSjT0GkpJt@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
 <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
 <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Tue, Aug 13, 2024 at 01:16:06PM +0200, Jürgen Groß wrote:
> On 13.08.24 03:10, Elliott Mitchell wrote:
> > On Tue, Jul 09, 2024 at 11:37:07AM +0200, Jürgen Groß wrote:
> > > 
> > > In both directories you can see the number of spurious events by looking
> > > into the spurious_events file.
> > > 
> > > In the end the question is why so many spurious events are happening. Finding
> > > the reason might be hard, though.
> > 
> > Hopefully my comments on this drew your attention, yet lack of response
> > suggests otherwise.  I'm wondering whether this is an APIC misprogramming
> > issue, similar to the x2APIC issue which was causing trouble with recent
> > AMD processors.
> > 
> > Trying to go after the Linux software RAID1, my current attempt is
> > "iommu=debug iommu=no-intremap".  I'm seeing *lots* of messages from
> > spurious events in `xl dmesg`.  So many I have a difficult time believing
> > they are related to hardware I/O.
> 
> Seeing them in `xl dmesg` means those spurious events are seen by the
> hypervisor, not by the Linux kernel.

Indeed.  Yet this seems to be pointing at a problem, whereas most other
information sources merely indicate there is a problem.

I'm unable to resolve those to hardware.  This could mean those are being
synthesized by software and when crossing some interface they get
reinterpreted as hardware events.  This could mean those are hardware
events, but somewhere inside Xen information is being corrupted and the
information displayed is unrelated to the original event (x2APIC
misinterpretation?).


> > In which case could the performance problem observed by Andrei Semenov
> > be due to misprogramming of [x2]APIC triggering spurious events?
> 
> I don't see a connection here, as spurious interrupts (as seen by the
> hypervisor in your case) and spurious events (as seen by Andrei) are
> completely different (hardware vs. software level).

The entries seem to appear at an average of about 1/hour.  Could be most
events are being dropped and 10x that number are occuring.  If so, those
extras could be turning into spurious events seen by various domains.

There is a possibility spurious interrupts are being turned into spurious
events by the back-end drivers.

Jürgen Groß, what is the performance impact of "iommu=debug"?  Seems to
mostly cause more reporting and have minimal/no performance effect.


Andrei Semenov, if you're allowed to release information about your
systems:  What is your mix of guest types (<1% PV, 90% PVH, 9% HVM?)?

Is there any pattern of PIC type and driver on effected/uneffected
systems?  I would suspect most/all of your systems to have a x2APIC.
Which of, cluster mode, mixed mode, physical mode, or other do they use?
("Using APIC driver x2apic_mixed" => x2APIC, mixed-mode)

Assuming Jürgen Groß confirms "iommu=debug" has minimal/no performance
impact;  Would it be possible to try booting one or more effected systems
with "iommu=debug" on Xen's command-line?  I'm wondering whether you
observe lines of "No irq handler for vector" or spurious interrupt lines
in Xen's dmesg.


The pattern of events in `xl dmesg` seems to better match spurious events
being sent to/from my single HVM domain, rather than the RAID1 issue.  In
particular there are too many distinct interrupt numberss to match the
hardware used for RAID.  Whereas there aren't enough distinct interrupt
numbers to account for every single event channel with spurious events
(several PVH domains).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



