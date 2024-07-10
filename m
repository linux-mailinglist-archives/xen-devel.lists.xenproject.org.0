Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B513492D850
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 20:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757044.1165772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRcAC-00043A-7V; Wed, 10 Jul 2024 18:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757044.1165772; Wed, 10 Jul 2024 18:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRcAC-00040w-4W; Wed, 10 Jul 2024 18:35:36 +0000
Received: by outflank-mailman (input) for mailman id 757044;
 Wed, 10 Jul 2024 18:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRb1=OK=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1sRcAB-00040q-E2
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 18:35:35 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30435e3b-3eeb-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 20:35:33 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 46AIZJIs031912
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 10 Jul 2024 14:35:25 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 46AIZJRR031911;
 Wed, 10 Jul 2024 11:35:19 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 30435e3b-3eeb-11ef-bbfb-fd08da9f4363
Date: Wed, 10 Jul 2024 11:35:19 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <Zo7UZ7l6m0KUl/Gx@mattapan.m5p.com>
References: <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
 <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook>
 <Zn4BRxTcXKufonw5@mattapan.m5p.com>
 <ZoLwfUsSEJzcQ4kI@mattapan.m5p.com>
 <ZocdQFCkH7p5nkiz@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZocdQFCkH7p5nkiz@mattapan.m5p.com>

On Thu, Jul 04, 2024 at 03:08:00PM -0700, Elliott Mitchell wrote:
> On Mon, Jul 01, 2024 at 11:07:57AM -0700, Elliott Mitchell wrote:
> > On Thu, Jun 27, 2024 at 05:18:15PM -0700, Elliott Mitchell wrote:
> > 
> > Most processors were mentioned roughly equally.  Several had fewer
> > mentions, but not enough to seem significant.  I discovered processor 1
> > did NOT show up.  Whereas processor 0 had an above average number of
> > occurrences.  This seems notable as these 2 processors are both reserved
> > exclusively for domain 0.
> 
> All of the patterns continue.  There are more reports on processor 0 than
> any other processor, but not enough to look particularly suspicious.
> What *does* look suspicious is the complete absence of reports from
> processor 1.

Bit more work with sort/uniq here and there is more of a pattern.
Odd-numbered processors (1,3,5) are seeing fewer reports, with CPU1 being
an outlier for having none.  Even-numbered processors (0,2,4) are seeing
more reports, with CPU0 displaying the most of any processor.  There is
also a pattern of lower-numbered processors seeing more of the reports
and higher numbered ones seeing less (CPU1 being an outlier).

If my reading of `xl dmesg` is correct, then the lower-numbered
processors are the first die and higher-numbered processors are the
second die.  My guess is the 0 and 1 are the first conjoined pair which
share more of their silicon with each other.

> > There have also been a few "spurious 8259A interrupt" lines.  So far
> > there haven't been very many of these.  The processor and IRQ listed
> > don't yet appear to show any patterns.  So far no IRQ has been listed
> > twice.
> 
> IRQs 3-7 and 9-15 have each shown up once.  1-2 and 8 haven't shown up
> so far.

#8 has now shown up, so 8259A interrupts 3-15 have now all shown up
*once*.  0-2 haven't show up at all.


Certain MSI IRQs are showing up.  The complete list is:

IRQ70	2
IRQ71	82
IRQ72	368
IRQ73	81
IRQ90	22
IRQ107	27
IRQ108	92
IRQ109	23
IRQ111	29
IRQ117	1

I'm unsure whether this actually works, but looking at /proc/interrupts,
all of these are associated with Xen according to Domain 0.  68-91 are
all listed as "xen-percpu", 105-120 are listed as "xen-dyn-lateeoi".

*IF* I am understanding this correctly, this *might* be the same problem
https://lists.xenproject.org/archives/html/xen-devel/2024-07/msg00454.html
Domain 0 is reportting plenty of spurious events.

I'm starting to wonder if this isn't a Linux software RAID1 on AMD
hardware issue, but instead a more generalized issue towards the core
of Xen's interrupt handling.  Just AMD hardware gets hit harder.

> Things look different enough to try reenabling Linux software RAID1.  I'm
> going to continue monitoring closely, but so far it seems
> "iommu=no-intremap" may in fact mitigate the issue with software RAID1.

At this point I've monitored for problems and not found any for long
enough to declare this a tentative mitigation.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



