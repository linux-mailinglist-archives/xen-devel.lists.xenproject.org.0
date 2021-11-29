Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ECA461BBF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 17:29:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234751.407376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrjW7-0001li-JT; Mon, 29 Nov 2021 16:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234751.407376; Mon, 29 Nov 2021 16:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrjW7-0001jy-GM; Mon, 29 Nov 2021 16:28:35 +0000
Received: by outflank-mailman (input) for mailman id 234751;
 Mon, 29 Nov 2021 16:28:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hMvs=QQ=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mrjW6-0001js-3I
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 16:28:34 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63461d97-5131-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 17:28:32 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1ATGS5If007059
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 29 Nov 2021 11:28:11 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1ATGS5OF007058;
 Mon, 29 Nov 2021 08:28:05 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 63461d97-5131-11ec-b941-1df2895da90e
Date: Mon, 29 Nov 2021 08:28:05 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Henry Wang <Henry.Wang@arm.com>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YaT/lVRDTn+fsORz@mattapan.m5p.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <64e9208d-ecda-2e62-e10f-81750c0279fb@suse.com>
 <78aa1ec7-3d47-716d-c9d6-b74d66486e9e@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78aa1ec7-3d47-716d-c9d6-b74d66486e9e@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Mon, Nov 15, 2021 at 07:09:45PM +0000, Julien Grall wrote:
> On 15/11/2021 10:13, Jan Beulich wrote:
> > On 12.11.2021 17:02, Julien Grall wrote:
> >> On 12/11/2021 15:44, Elliott Mitchell wrote:
> >>>
> >>> Julien Grall and Stefano Stabellini had been proposing doing ACPI table
> >>> parsing in a stub domain, but I'm unaware of the status.  Not finding
> >>> much suggests it hasn't gone very far yet.
> >>
> >> This was a very early proposal in case we needed to parse the DSDT in
> >> Xen. This hasn't been needed so far, hence why this is not implemented
> >> and no-one worked on it.
> >>
> >> I am not very familiar how the framebuffer is detected in ACPI. Can you
> >> provide more details on what exactly you want to parse?
> > 
> > I don't think there's any ACPI support involved there. Instead UEFI data
> > needs propagating to Dom0, as that can't access EFI boot services itself.
> > At least this is all that's needed on the x86 side (and all the needed
> > code is there, just presumably not [fully] wired up on Arm).
> 
> Thanks for the feedback. At the moment, we don't enable EFI runtime 
> services nor propagate it to Dom0. So this needs to be wired up.
> 
> However, for Elliott's case, I am not sure this is going to sufficient. 
> The Raspberry PI has some devices that can only DMA into the first 1GB 
> of the RAM (the GPU seems to be one). So we need to make sure Xen is 
> allocating enough memory for Dom0 below that limit.
> 
> Do you have similar problem on x86? If so, how do you deal with it?

Is it just me or has anyone else commented you seem to have become
obsessed with DMA?  Otherwise are detail-oriented tendencies getting out
of control?

You keep bringing up DMA, but once the initial teething troubles (DMA
addresses versus memory addresses) were over there hadn't been any
issues attributed to DMA.  While bounce buffers are suboptimal, they are
good enough for most cases.

For DMA what most concerns me is the design of the allocate_memory_11().
The approach strongly favors *large* allocations.  Notably it requires a
chunk of 128MB or larger, if Domain 0 has been allocated at least 128MB.
If allocate_memory_11() finds a 128MB chunk it then prefers to enlarge
that chunk, rather than emphasizing allocating low addresses.

It has been a while since I last tried the Tianocore build, but there are
two crucial observations.  I don't recall the actual size, but Tianocore
was giving the framebuffer/GPU either 16MB or 64MB, and this was placed
below 512MB.  Combine this with the behavior of allocate_memory_11() and
guess what Xen/ARM/ACPI allocated to Domain 0.

I recall the lowest memory address being given to Domain 0 being above
the 512MB line.  I think it was at 768MB, but this is from my memory.
The rest of the memory allocated to Domain 0 was at higher addresses.

I would suggest allocate_memory_11()'s behavior needs to be adjusted
roughly as follows.  If a Domain 0 is allocated more than 256MB,
allocate_memory_11() should try for DMA-capable memory for at least half
of Domain 0's allocation (I'm unsure whether there should be 128MB of
non-DMA memory, versus only half).  I would emphasize lower addresses
over size for the DMA-capable memory.


I'm unsure how ACPI/UEFI/Tianocore were expressing the framebuffer
memory.  I've got the impression that memory allocation is marked
distinctly from the rest of main memory.

I don't know what was happening, but I suspect Xen had been leaving that
memory blank and never touching it (display never showed any output,
even pixel dust).  I'm suspecting Xen/ARM's ACPI implementation was
handling the specially marked memory by dropping it on the floor.
Instead of handing it to Domain 0 as a specialized region.


Could also be the complete lack of EFI runtime services was the problem.


Julien Grall might I inquire as to your general location/situation?  I
suspect giving you a Raspberry PI 4B could be *highly* valuable to the
Xen Project.  You would suddenly have a Xen-capable system with ACPI and
framebuffer.

A Raspberry PI 4B is cheap enough to need minimal expense justification.
I suspect you've got a spare TTL-serial on hand.  Only issue might be the
mini-HDMI.

I wouldn't dare send one without a SD Card, out of fear it might end up
being used with device-trees instead of Tianocore...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



