Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D6B9C79E7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 18:25:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835945.1251815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBH7Z-0001CC-Lj; Wed, 13 Nov 2024 17:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835945.1251815; Wed, 13 Nov 2024 17:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBH7Z-0001AU-Iz; Wed, 13 Nov 2024 17:25:37 +0000
Received: by outflank-mailman (input) for mailman id 835945;
 Wed, 13 Nov 2024 17:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAIE=SI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1tBH7Z-00015K-16
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 17:25:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4734b2ba-a1e4-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 18:25:30 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 4ADHPJ48038375
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 13 Nov 2024 12:25:25 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 4ADHPIlf038374;
 Wed, 13 Nov 2024 09:25:18 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 4734b2ba-a1e4-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6Ijc0LjEwNC4xODguNCIsImhlbG8iOiJtYWlsaG9zdC5tNXAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ3MzRiMmJhLWExZTQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTE4NzMwLjkyNjczNSwic2VuZGVyIjoiZWhlbUBtNXAuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
Date: Wed, 13 Nov 2024 09:25:18 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrei Semenov <andrei.semenov@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        jgross@suse.com
Subject: Re: AMD EPYC virtual network performances
Message-ID: <ZzTg_p-8E0_jrkii@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Tue, Jul 09, 2024 at 08:36:18AM +0000, Andrei Semenov wrote:
> 
> After some investigations we notices a huge performances drop (perfs divided
> by
> factor of 5) starting from 5.10.88 Linux kernel version on the AMD EPYC
> platforms. The patch introduced in this kernel version that allows to
> pinpoint
> the buggy behavior is :
> 
>  “xen/netfront: harden netfront against event channel storms”
> d31b3379179d64724d3bbfa87bd4ada94e3237de
> 
> The patch basically binds the network frontend to the `xen_lateeoi_chip`
> irq_chip (insead of `xen_dynamic_chip`) which allows to its clients to
> inform
> the chip if spurious interrupts are detected and so the delay in interrupt
> treatment is introduced by the chip.

I worry I'm being knave here.

For the heck of it, I took a glance at b27d47950e48.  If my understanding
is correct, b27d47950e48 is making a very basic (and wrong) assumption
about timing/latency.

In particular any time either side receive an event, it will handle
X # of incoming payloads and Y # of acknowledged outgoing payloads.  As
such if X + Y > 1, then up to X + Y - 1 spurious events may be detected.
The issue is there is no synchronization between the event channel and
the work queues.

In particular the network back end could legitimately generate:

work0	signal0	work1	signal1	work2	signal2	work3	signal3

Whereas the network front end may handle this as:

event0	work0	work1	work2	work3	event1	event2	event3

Where b27d47950e48 would interpret events 1-3 as spurious, even though
they're perfectly legitimate.  The same phenomenon could occur in both
directions and also with the Xen block devices.

Ultimately how is the network portion of XSA-391 any different from any
other network DoS?  If an interrupt is generated for every single packet
of a series of runt frames, there will be heavy processor use for little
network traffic.

AMD systems may fair worse than Intel systems due to differing cache
coherence behavior/latency.  Perhaps AMD's NUMA implementation adds
some latency.  (huh, suddenly the RAID1 issue comes to mind)


Hopefully I'm not making knave speculation here.  Might this be the
simplest of issues, just it was missed due to being too obvious?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



