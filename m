Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801A1C27F5
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 21:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUxZ7-0000aM-VF; Sat, 02 May 2020 19:12:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0nVz=6Q=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1jUxZ6-0000aH-Di
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 19:12:44 +0000
X-Inumbo-ID: e5ecae1c-8ca8-11ea-9bf4-12813bfff9fa
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5ecae1c-8ca8-11ea-9bf4-12813bfff9fa;
 Sat, 02 May 2020 19:12:43 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 042Imbho096734
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Sat, 2 May 2020 14:48:43 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 042ImaYR096733;
 Sat, 2 May 2020 11:48:36 -0700 (PDT) (envelope-from ehem)
Date: Sat, 2 May 2020 11:48:36 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Corey Minyard <minyard@acm.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
Message-ID: <20200502184836.GA96674@mattapan.m5p.com>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <20200501114201.GE9902@minyard.net>
 <CAMmSBy_h9=5cjMv3+-BKHYhBikgna731DoA+t-8FK-2tbPUH-A@mail.gmail.com>
 <20200502021647.GG9902@minyard.net>
 <4f6ef562-e213-8952-66d6-0f083bf8c593@xen.org>
 <20200502173529.GH9902@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502173529.GH9902@minyard.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
 autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Roman Shaposhnik <roman@zededa.com>, jeff.kubascik@dornerworks.com,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, May 02, 2020 at 12:35:29PM -0500, Corey Minyard wrote:
> On Sat, May 02, 2020 at 12:46:14PM +0100, Julien Grall wrote:
> > 
> > On 02/05/2020 03:16, Corey Minyard wrote:
> > > 
> > > Nope.  If you say 4096M of RAM, your issue is almost certainly DMA, but
> > > it's not (just) the Linux code.  On the Raspberry Pi 4, several devices
> > > cannot DMA to above 1024M of RAM, but Xen does not handle this.  The
> > > 1024M of RAM is a limitation you will have to live with until Xen has a
> > > fix.
> > 
> > IIUC, dom0 would need to have some memory below 1GB for this to work, am I
> > correct?
> 
> No.  If I am understanding this correctly, all the memory in dom0 below
> 1GB would have to be physically below 1GB.
> 
> The Linux patch set starts at:
> 
> https://lore.kernel.org/linux-iommu/20191015174616.GO13874@arrakis.emea.arm.com/t/
> 

Actually, things get worse.  What if someone wants to run an X-server in
DomU and have a DomU accessing the graphics hardware?  Really needs to be
a case of allocating DMA-capable memory means talking to Xen.

As pointed out in that discussion different boards are going to have the
DMA-borderline in different places.  There could be enough variation that
it needs to be settable at run time.  Then some boards might have some
DMA devices which can access all memory, and some which cannot (full-DMA
versus limited-DMA?).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



