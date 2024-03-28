Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D688904CB
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699112.1091685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsRo-0004Ah-P9; Thu, 28 Mar 2024 16:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699112.1091685; Thu, 28 Mar 2024 16:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsRo-000480-MK; Thu, 28 Mar 2024 16:17:48 +0000
Received: by outflank-mailman (input) for mailman id 699112;
 Thu, 28 Mar 2024 16:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vqfy=LC=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rpsRn-0003xV-DL
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 16:17:47 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5a95fb8-ed1e-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 17:17:45 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42SGHX9t088861
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 28 Mar 2024 12:17:39 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 42SGHXbn088860;
 Thu, 28 Mar 2024 09:17:33 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: b5a95fb8-ed1e-11ee-a1ef-f123f15fe8a2
Date: Thu, 28 Mar 2024 09:17:33 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZgWYHfke5UffjvM4@mattapan.m5p.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <ZcqoVBnsgUJw8G0l@mattapan.m5p.com>
 <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
 <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
 <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
 <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZgWLN5G9WeyXttv4@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgWLN5G9WeyXttv4@mattapan.m5p.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Thu, Mar 28, 2024 at 08:22:31AM -0700, Elliott Mitchell wrote:
> On Thu, Mar 28, 2024 at 07:25:02AM +0100, Jan Beulich wrote:
> > On 27.03.2024 18:27, Elliott Mitchell wrote:
> > > On Mon, Mar 25, 2024 at 02:43:44PM -0700, Elliott Mitchell wrote:
> > >> On Mon, Mar 25, 2024 at 08:55:56AM +0100, Jan Beulich wrote:
> > >>>
> > >>> In fact when running into trouble, the usual course of action would be to
> > >>> increase verbosity in both hypervisor and kernel, just to make sure no
> > >>> potentially relevant message is missed.
> > >>
> > >> More/better information might have been obtained if I'd been engaged
> > >> earlier.
> > > 
> > > This is still true, things are in full mitigation mode and I'll be
> > > quite unhappy to go back with experiments at this point.
> > 
> > Well, it very likely won't work without further experimenting by someone
> > able to observe the bad behavior. Recall we're on xen-devel here; it is
> > kind of expected that without clear (and practical) repro instructions
> > experimenting as well as info collection will remain with the reporter.
> 
> The first reporter: https://bugs.debian.org/988477 gave pretty specific
> details about their setups.
> 
> While the exact border isn't very well defined, that seems enough to give
> a pretty good start.  We don't know whether all Samsung SATA devices are
> effected, but most of the recent ones (<5 years old) are.  This requires
> a pair of devices in software RAID1.  Likely reproduces better with AMD
> AM4/AM5 processors, but almost certainly needs a fully operational IOMMU.
> 
> (ASUS motherboards tend to have well setup IOMMUs)
> 
> I would be surprised if you don't have all of the hardware on-hand.  Only
> issue would be finding an appropriate pair of SATA devices, since those
> tend to remain in service.  I would look for older devices which were
> removed from service due to being too small (128GB 840 PRO from the first
> report), or were pulled from service due to having had too many writes.

Come to think of it, one more possible ingredient to this.  Similar to
the first report, when the problem occurred, the SATA device was plugged
into an on chipset SATA port, not the extra controller this motherboard
has.  I don't know whether the performance difference of an off-main
chip controller would influence this, but it might.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



