Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DED950FCE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 00:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776676.1186844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se087-0008Tz-Rt; Tue, 13 Aug 2024 22:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776676.1186844; Tue, 13 Aug 2024 22:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se087-0008Qz-Ok; Tue, 13 Aug 2024 22:36:39 +0000
Received: by outflank-mailman (input) for mailman id 776676;
 Tue, 13 Aug 2024 22:36:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nBzl=PM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1se085-0008Qt-P5
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 22:36:37 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dae220e-59c4-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 00:36:34 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 47DMaNHg032427
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 13 Aug 2024 18:36:29 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 47DMaNsm032426;
 Tue, 13 Aug 2024 15:36:23 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 7dae220e-59c4-11ef-8776-851b0ebba9a2
Date: Tue, 13 Aug 2024 15:36:23 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: AMD EPYC virtual network performances
Message-ID: <Zrvf5wgm6xEI63x2@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
 <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
 <ab4ca68e-ec1b-467f-9b89-38f63cc19b7c@suse.com>
 <ZruckufSjT0GkpJt@mattapan.m5p.com>
 <d556e168-8542-4b93-81a9-a7054b5b69ba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d556e168-8542-4b93-81a9-a7054b5b69ba@suse.com>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Tue, Aug 13, 2024 at 08:55:42PM +0200, Jürgen Groß wrote:
> On 13.08.24 19:49, Elliott Mitchell wrote:
> > On Tue, Aug 13, 2024 at 01:16:06PM +0200, Jürgen Groß wrote:
> > > 
> > > I don't see a connection here, as spurious interrupts (as seen by the
> > > hypervisor in your case) and spurious events (as seen by Andrei) are
> > > completely different (hardware vs. software level).
> > 
> > The entries seem to appear at an average of about 1/hour.  Could be most
> > events are being dropped and 10x that number are occuring.  If so, those
> > extras could be turning into spurious events seen by various domains.
> 
> Even 10 spurious events per hour should not have a measurable impact
> on performance.

Come to think of it, depending upon time that domain is sometimes low
activity (build so it is either pegging or idle).  The 1/hour was during
idle times, so during busy times it might be much worse.  I haven't been
tracking `xl dmesg` as carefully recently.

Do the maintainers ever run machines with "iommu=debug"?  I'm actually
rather concerned *anything* spurious is showing up as I'm left suspecting
there may have been something lurking for some time.

> > There is a possibility spurious interrupts are being turned into spurious
> > events by the back-end drivers.
> 
> No, I don't think so.
> 
> > Jürgen Groß, what is the performance impact of "iommu=debug"?  Seems to
> > mostly cause more reporting and have minimal/no performance effect.
> 
> I guess you are referring to the Xen option? I'm no expert in this
> area.

Drat.  I haven't noticed much, which would match with simply enabling a
bunch of debugging printk()s (alas I'm not monitoring performance closely
enough to be sure).  Guess I wait for Andrei Semenov to state a comfort
level with trying "iommu=debug".


My guess is Andrei Semenov's issue is quite widespread.  I hadn't noticed
the issue until trying `find /sys/devices -name spurious_events -print`.

If you don't know where to look, Linux is apparently pretty good at
hiding this sort of issue.  The impact may not seem too severe if your
baseline was infected.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



