Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1124B3276
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 02:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270695.465022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIhIi-0007af-In; Sat, 12 Feb 2022 01:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270695.465022; Sat, 12 Feb 2022 01:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIhIi-0007Zr-CJ; Sat, 12 Feb 2022 01:34:12 +0000
Received: by outflank-mailman (input) for mailman id 270695;
 Sat, 12 Feb 2022 01:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1S/=S3=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1nIhIh-0007Zl-9p
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 01:34:11 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de2dc48e-8ba3-11ec-b215-9bbe72dcb22c;
 Sat, 12 Feb 2022 02:34:08 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 21C1Xtom026988
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 11 Feb 2022 20:34:01 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 21C1XtsZ026987;
 Fri, 11 Feb 2022 17:33:55 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: de2dc48e-8ba3-11ec-b215-9bbe72dcb22c
Date: Fri, 11 Feb 2022 17:33:55 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>,
        xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH RFC 1/3] xen/efi: Always query the console information
 and get GOP
Message-ID: <YgcOg6p8D+6hWWsE@mattapan.m5p.com>
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-2-julien@xen.org>
 <88741681-929f-4cda-e841-023bdbf8f772@suse.com>
 <26cdd9cf-15d6-a463-b1bb-28964005f618@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26cdd9cf-15d6-a463-b1bb-28964005f618@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Mon, Feb 07, 2022 at 06:52:57PM +0000, Julien Grall wrote:
> On 07/02/2022 08:46, Jan Beulich wrote:
> > On 06.02.2022 20:28, Julien Grall wrote:
> >>
> >> It is not entirely clear to me why the GOP was only fetched when
> >> the configuration file is used.
> >>
> >> I have tested this on RPI4 and it seems to work. Any chance this
> >> was done to workaround an x86 platform?
> > 
> > This was done so in the context of making the code work for Arm. See
> > commit c38cf865ec82 ("EFI: ignore EFI commandline, skip console setup
> > when booted from GRUB"), the description of which explicitly says
> > 
> > "Don't do EFI console or video configuration when booted by GRUB.  The EFI boot
> >   code does some console and video initialization to support native EFI boot from
> >   the EFI boot manager or EFI shell.  This initlization should not be done when
> >   booted using GRUB."
> 
> I read that and still couldn't figure out why this was done like that.

The most likely motivation was simply "Eww!  ACPI/UEFI use gobs of
memory!  Purge the abomination!"

Unfortunately ACPI/UEFI are large an complex due to trying to solve a
large and complex problem.  ACPI/UEFI attempt to provide an OS agnostic
presentation of the hardware layout.  Whereas device-trees are a common
*format* for presenting hardware to *an* OS (similar to how JSON is a
common format).

Due to the size and complexity, most developers have preferred the
simpler device-tree format even though that severely limits OS choice.
As such, nuking ACPI/UEFI's presence is common in the ARM world.  Versus
the x86 world where Intel dragged everyone onto ACPI/UEFI.

One can see this in patches like Roman Shaposhnik's "Making full 2G of
memory available to Xen on HiKey" which simply tosses EFI into the
garbage bin as useless overhead.

Yet the ARM world is now large enough to justify OS-agnostic solutions
such as ACPI/UEFI.  The standards behind device-trees might be heading in
this direction, but they're way behind.




You stated your patch was for 5.17-rc2.  How much backporting would you
expect this patch to be viable for?  (I'm unsure how much churn is
occuring in the relevant portions of Linux) The long-term branches of
Linux include 5.4.179, 5.10.100 and 5.15.23.  `patch` indicated it could
apply to 5.10.92 source with fuzz (hmm).  This suggests 5.15 is likely
viable, but 5.10 is risky and 5.4 is a very long shot.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



