Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289A394FAF5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 03:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775794.1185974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdg3v-0005sF-8i; Tue, 13 Aug 2024 01:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775794.1185974; Tue, 13 Aug 2024 01:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdg3v-0005pb-5T; Tue, 13 Aug 2024 01:10:59 +0000
Received: by outflank-mailman (input) for mailman id 775794;
 Tue, 13 Aug 2024 01:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nBzl=PM=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1sdg3u-0005pS-2u
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 01:10:58 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e312f55f-5910-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 03:10:54 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 47D1AgJv027961
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 12 Aug 2024 21:10:48 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 47D1AfGi027960;
 Mon, 12 Aug 2024 18:10:41 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: e312f55f-5910-11ef-8776-851b0ebba9a2
Date: Mon, 12 Aug 2024 18:10:41 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Andrei Semenov <andrei.semenov@vates.tech>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: AMD EPYC virtual network performances
Message-ID: <Zrqykdarr7JHaeOZ@mattapan.m5p.com>
References: <959bbf84-24da-4da3-a059-dc1aa32b27ef@vates.tech>
 <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <352bba40-27fc-416b-985f-20e66c0c4b72@suse.com>
X-Spam-Status: No, score=0.3 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Tue, Jul 09, 2024 at 11:37:07AM +0200, Jürgen Groß wrote:
> 
> In both directories you can see the number of spurious events by looking
> into the spurious_events file.
> 
> In the end the question is why so many spurious events are happening. Finding
> the reason might be hard, though.

Hopefully my comments on this drew your attention, yet lack of response
suggests otherwise.  I'm wondering whether this is an APIC misprogramming
issue, similar to the x2APIC issue which was causing trouble with recent
AMD processors.

Trying to go after the Linux software RAID1, my current attempt is
"iommu=debug iommu=no-intremap".  I'm seeing *lots* of messages from
spurious events in `xl dmesg`.  So many I have a difficult time believing
they are related to hardware I/O.

In which case could the performance problem observed by Andrei Semenov
be due to misprogramming of [x2]APIC triggering spurious events?


If so this is actually rather serious as there is so much noise it is
impossible to debug anything else.

In other news logs are available for private (PGP) viewing.  If one of
the core developers has an appropriate AMD machine (IOMMUv2, Zen 1 or
later; >=2 available SATA ports) I would send a pair of devices *known*
to manifest the RAID1 issue.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



