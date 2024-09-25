Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8C0984F92
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 02:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803416.1213974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stGDC-0001GZ-JE; Wed, 25 Sep 2024 00:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803416.1213974; Wed, 25 Sep 2024 00:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stGDC-0001E8-Fz; Wed, 25 Sep 2024 00:48:58 +0000
Received: by outflank-mailman (input) for mailman id 803416;
 Wed, 25 Sep 2024 00:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+cYr=QX=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1stGDB-0001E2-Ei
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 00:48:57 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eddded45-7ad7-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 02:48:51 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 48P0mAe2019775
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 24 Sep 2024 20:48:15 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 48P0m5gn019774;
 Tue, 24 Sep 2024 17:48:05 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: eddded45-7ad7-11ef-99a2-01e77a169b0f
Date: Tue, 24 Sep 2024 17:48:05 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Ariadne Conill <ariadne@ariadne.space>, xen-devel@lists.xenproject.org,
        alsa-devel@alsa-project.org, stable@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZvNdxXCNu4Uc5gc_@mattapan.m5p.com>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
 <Zt9UQJcYT58LtuRV@mattapan.m5p.com>
 <8734m77o7k.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734m77o7k.wl-tiwai@suse.de>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Tue, Sep 10, 2024 at 01:17:03PM +0200, Takashi Iwai wrote:
> On Mon, 09 Sep 2024 22:02:08 +0200,
> Elliott Mitchell wrote:
> > 
> > On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> > > 
> > > Individual subsystems ought not to know or care about XENPV; it's a
> > > layering violation.
> > > 
> > > If the main APIs don't behave properly, then it probably means we've got
> > > a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> > > which is probably affecting other subsystems too.
> > 
> > This is a big problem.  Debian bug #988477 (https://bugs.debian.org/988477)
> > showed up in May 2021.  While some characteristics are quite different,
> > the time when it was first reported is similar to the above and it is
> > also likely a DMA bug with Xen.
> 
> Yes, some incompatible behavior has been seen on Xen wrt DMA buffer
> handling, as it seems.  But note that, in the case of above, it was
> triggered by the change in the sound driver side, hence we needed a
> quick workaround there.  The result was to move back to the old method
> for Xen in the end.
> 
> As already mentioned in another mail, the whole code was changed for
> 6.12, and the revert isn't applicable in anyway.
> 
> So I'm going to submit another patch to drop this Xen PV-specific
> workaround for 6.12.  The new code should work without the workaround
> (famous last words).  If the problem happens there, I'd rather leave
> it to Xen people ;)

I've seen that patch, but haven't seen any other activity related to
this sound problem.  I'm wondering whether the problem got fixed by
something else, there is activity on different lists I don't see, versus
no activity until Qubes OS discovers it is again broken.


An overview of the other bug which may or may not be the same as this
sound card bug:

Both reproductions of the RAID1 bug have been on systems with AMD
processors.  This may indicate this is distinct, but could also mean only
people who get AMD processors are wary enough of flash to bother with
RAID1 on flash devices.  Presently I suspect it is the latter, but not
very many people are bothering with RAID1 with flash.

Only systems with IOMMUv2 (full IOMMU, not merely GART) are effected.

Samsung SATA devices are severely effected.

Crucial/Micron NVMe devices are mildly effected.

Crucial/Micron SATA devices are uneffected.


Specifications for Samsung SATA and Crucial/Micron SATA devices are
fairly similar.  Similar IOps, similar bandwith capabilities.

Crucial/Micron NVMe devices have massively superior specifications to
the Samsung SATA devices.  Yet the Crucial/Micron NVMe devices are less
severely effected than the Samsung SATA devices.


This seems likely to be a latency issue.  Could be when commands are sent
to the Samsung SATA devices, they are fast enough to start executing them
before the IOMMU is ready.

This could match with the sound driver issue.  Since the sound hardware
is able to execute its first command with minimal latency, that is when
the problem occurs.  If the first command gets through, the second
command is likely executed with some delay and the IOMMU is reliably
ready.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



