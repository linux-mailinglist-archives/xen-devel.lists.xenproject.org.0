Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40751953B4A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 22:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778266.1188344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seglv-00008O-Tk; Thu, 15 Aug 2024 20:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778266.1188344; Thu, 15 Aug 2024 20:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seglv-00006h-Qu; Thu, 15 Aug 2024 20:08:35 +0000
Received: by outflank-mailman (input) for mailman id 778266;
 Thu, 15 Aug 2024 20:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l8AG=PO=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1seglu-00006b-Nu
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 20:08:34 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23c166e8-5b42-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 22:08:32 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 47FK8Kd2040787
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 15 Aug 2024 16:08:25 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 47FK8JXf040786;
 Thu, 15 Aug 2024 13:08:19 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 23c166e8-5b42-11ef-8776-851b0ebba9a2
Date: Thu, 15 Aug 2024 13:08:19 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: AMD EPYC virtual network performances
Message-ID: <Zr5gMxp0zKC8cCwO@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
 <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
 <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
 <ZruckufSjT0GkpJt@mattapan.m5p.com>
 <d556e168-8542-4b93-81a9-a7054b5b69ba@suse.com>
 <Zrvf5wgm6xEI63x2@mattapan.m5p.com>
 <e95ab71d-b985-4ab7-994b-1c562efd5f9f@suse.com>
 <Zr0S-2QBf3lkBkfS@mattapan.m5p.com>
 <07396e04-1def-447a-b83b-ffe3a5b01fbe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07396e04-1def-447a-b83b-ffe3a5b01fbe@suse.com>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Thu, Aug 15, 2024 at 10:33:52AM +0200, Jürgen Groß wrote:
> On 14.08.24 22:26, Elliott Mitchell wrote:
> > On Wed, Aug 14, 2024 at 08:15:38AM +0200, Jürgen Groß wrote:
> > > On 14.08.24 00:36, Elliott Mitchell wrote:
> > > > 
> > > > Drat.  I haven't noticed much, which would match with simply enabling a
> > > > bunch of debugging printk()s (alas I'm not monitoring performance closely
> > > > enough to be sure).  Guess I wait for Andrei Semenov to state a comfort
> > > > level with trying "iommu=debug".
> > > 
> > > You didn't answer my question.
> > 
> > I guess I did not explicitly do so.  I was referring to the Xen
> > command-line option.
> 
> And again you didn't supply the information I asked for (command line
> options of Xen and dom0).

I had thought that was aimed at the initial reporter, Andrei Semenov.
I've already supplied all options which could plausibly effect this.

Xen: placeholder watchdog=true loglvl=info iommu=debug iommu=no-intremap cpuidle dom0_mem=... no-real-mode edd=off

Linux; placeholder root=... ro concurrency=none vga=normal xen_pciback.hide=... net.ifname=1 nomodeset blacklist=...

Somehow the others really don't seem likely to effect either issue as
they don't effect interrupts (okay some drivers don't get loaded, but
those drivers would render the problem irreproduceable).

> Did you consider that asking for help while not supplying data which has
> been asked for is going to result in no help at all? You are wasting the
> time of volunteers, which will reduce the motivation to look into your
> issue a lot.

Sorry about being a bit inconsistent, but there is little I can do in
the short-term about that.  I would *strongly* prefer to keep information
protected (PGP).  Large commercial installations have a rather different
risk/privacy threshold.

It is also notable that I am not the sole reporter of any of these
issues.


My speculation was wrong, the "CPU*: No irq handler for vector..."
messages are not strictly tied to the HVM domain.  I think I'm simply
reproducing what Andrei Semenov observed, HVM domains are more severely
effected by this issue.

I think I need to repeat an earlier observation of mine.  It is NOT just
vifs being effected by this, event channels associated with virtual
block-devices are also seeing spurious interrupts though at a lower rate.

What comes to mind is vifs would generate interrupts at a much greater
rate than vbds.  I kind of suspect a timing issue involving closely
spaced interrupt.  I wonder if there is a simple timing issue with the
vif/vbd protocol.  Problem is how would these turn into spurious
interrupts observed by Xen?  (I had suspected Qemu for the HVM domain,
but that was disproven)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



