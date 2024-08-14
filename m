Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2D5952359
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 22:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777683.1187781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seKa4-0004SA-2s; Wed, 14 Aug 2024 20:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777683.1187781; Wed, 14 Aug 2024 20:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seKa3-0004Pr-VV; Wed, 14 Aug 2024 20:26:51 +0000
Received: by outflank-mailman (input) for mailman id 777683;
 Wed, 14 Aug 2024 20:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sQPB=PN=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1seKa2-0004Pl-NY
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 20:26:50 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86cc453f-5a7b-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 22:26:47 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 47EKQaWC036496
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Aug 2024 16:26:42 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 47EKQZ9p036495;
 Wed, 14 Aug 2024 13:26:35 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 86cc453f-5a7b-11ef-8776-851b0ebba9a2
Date: Wed, 14 Aug 2024 13:26:35 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: AMD EPYC virtual network performances
Message-ID: <Zr0S-2QBf3lkBkfS@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
 <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
 <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
 <ZruckufSjT0GkpJt@mattapan.m5p.com>
 <d556e168-8542-4b93-81a9-a7054b5b69ba@suse.com>
 <Zrvf5wgm6xEI63x2@mattapan.m5p.com>
 <e95ab71d-b985-4ab7-994b-1c562efd5f9f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e95ab71d-b985-4ab7-994b-1c562efd5f9f@suse.com>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Wed, Aug 14, 2024 at 08:15:38AM +0200, Jürgen Groß wrote:
> On 14.08.24 00:36, Elliott Mitchell wrote:
> > On Tue, Aug 13, 2024 at 08:55:42PM +0200, Jürgen Groß wrote:
> > > On 13.08.24 19:49, Elliott Mitchell wrote:
> > > > 
> > > > There is a possibility spurious interrupts are being turned into spurious
> > > > events by the back-end drivers.
> > > 
> > > No, I don't think so.
> > > 
> > > > Jürgen Groß, what is the performance impact of "iommu=debug"?  Seems to
> > > > mostly cause more reporting and have minimal/no performance effect.
> > > 
> > > I guess you are referring to the Xen option? I'm no expert in this
> > > area.
> > 
> > Drat.  I haven't noticed much, which would match with simply enabling a
> > bunch of debugging printk()s (alas I'm not monitoring performance closely
> > enough to be sure).  Guess I wait for Andrei Semenov to state a comfort
> > level with trying "iommu=debug".
> 
> You didn't answer my question.

I guess I did not explicitly do so.  I was referring to the Xen
command-line option.  I was asking in the hope it might be reasonable
for Andrei Semenov to run with it on for some time.


Come to think of it, I now wonder whether "iommu=no-intremap" is part of
the recipe for having the messages I've seen show up.

I can now state they appear to correlate with activity in the HVM domain
(which is associated with network/vif activity) which also increases
Linux's spurious interrupt counters.
I cannot yet state the HVM domain is the exclusive source of these
messages.  I am able to run with that domain shutdown, so I've done so.
If no new messages show up that will seem to attribute those to the HVM
domain.

The other interesting bit is "iommu=no-intremap" seems to have made the
messages associated with the software RAID1 issue disappear (possibly
partially, but not fully mitigated it too).  My observations seem
insufficient to indicate whether or not these are distinct issues
though.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



