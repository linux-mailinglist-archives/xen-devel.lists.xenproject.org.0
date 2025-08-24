Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421EBB32CF4
	for <lists+xen-devel@lfdr.de>; Sun, 24 Aug 2025 04:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091744.1448135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uq085-0005Tr-GQ; Sun, 24 Aug 2025 02:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091744.1448135; Sun, 24 Aug 2025 02:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uq085-0005RM-D6; Sun, 24 Aug 2025 02:06:45 +0000
Received: by outflank-mailman (input) for mailman id 1091744;
 Sun, 24 Aug 2025 02:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K0KA=3E=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1uq083-0005R8-Sa
 for xen-devel@lists.xenproject.org; Sun, 24 Aug 2025 02:06:43 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f533a404-808e-11f0-b898-0df219b8e170;
 Sun, 24 Aug 2025 04:06:35 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 57O265lc073989
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 23 Aug 2025 22:06:11 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 57O264A3073988;
 Sat, 23 Aug 2025 19:06:04 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: f533a404-808e-11f0-b898-0df219b8e170
Date: Sat, 23 Aug 2025 19:06:04 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Paul Leiber <paul@onlineschubla.de>
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
Message-ID: <aKpzjMnNzxJCoIXb@mattapan.m5p.com>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
 <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Sat, Aug 23, 2025 at 08:59:13AM +0100, Julien Grall wrote:
> 
> On 22/08/2025 21:09, Elliott Mitchell wrote:
> > Since you're not pointing to anything definite, could it be everything
> > has been resolved?
> 
> Unfortunately, the situation has not changed since your last thread about
> enabling CONFIG_ACPI=y a couple of years ago. The main feature we are
> lacking is the parsing the IORT (used to discover SMMUs and MSI
> controllers). Without this...

No one to sponsor this work?  Disappointing with how far ACPI support had
gotten.  Surprising the funding ended here.

> >  We've got at least two people for whom ACPI on ARM
> > works pretty well.
> 
> ... Xen will only properly boot on "simple" case like the Raspberry PI.
> Also, IIRC Xen would use ACPI rather than Device-Tree by default.

What is the "improper" booting on non-simple cases like?  panic()?
Domain 0 boots, but the system isn't properly protected by the SMMU?
Ideally it would be runtime configurable with the former being the
default, but the panic message indicating how to override to produce the
latter.  Perhaps even accompanied by an invitation for sponsorship.

Yet handling those simple cases would help many people.  For a long time
IO-MMUs were rare, yet the world did not end.

> > There may be many more using it.  Perhaps this
> > should even be done on the 4.20 branch given how long this has been
> > working?
> 
> I am guessing you mean 4.21 which will be released in a couple of months
> time, correct?

As it is very simple to flip the default, I was thinking it might be
worthwhile to change it on earlier versions too.  After all it has
actually been known to work for kind of a long time.

> We have been discussing among the committers on whether we are ok to enable
> ACPI despite the fact it is still not feature complete (see above). The
> discussion is not fully finalized but if we were to enable CONFIG_ACPI=y by
> default then I think we would need the following:
> 
>  * Select device-tree by default rather than ACPI
>  * Go through SUPPORT.MD and check what features we marked as SUPPORTED.md
> but doesn't work on ACPI.
> 
> Maybe you can help with that?

I'm not sure this is a good role for me.  I suppose I could do a first
pass marking everything as non-ACPI.  Problem is most recently I've been
focussing on another aspect and I would mostly be guessing about things.

> Out of interest, sorry if this was already mentioned before, is there any
> reason ACPI is used on the Raspberry PI over Device-Tree? Is there any issue
> with the latter on Xen?

Issue is various Linux distributions have differing levels of support for
various targets.  Nearly everyone has some degree of support for
Raspberry PI (even Tianocore!), but the quality does vary from
distribution to distribution.

My favored distribution is rather limited in what it does for !x86.
Everything gets built for !x86, but things such as booting hasn't been
heavily looked at.  There is agreement using U-Boot/UEFI => GRUB would
likely be a Good Thing, but there is a shortage of people with the right
expertise to get that working.  As a result booting Xen is troublesome.

Whereas copying the Tianocore firmware into place and getting it booting
is *extremely* simple.  Further this has very few restrictions (GPT and
a ~200MB FAT filesystem).  Better yet once in place this is extremely
robust.

The only argument in favor of device-trees I've seen is that they're easy
to deal with.  Certainly they need little runtime processing.  Yet they
come with a major weakness that they're really part of the kernel.  When
the Linux kernel is replaced (even patch-level differences) you pretty
well always need to replace the device-trees.  Once you've done that it
is quite difficult to go back to the earlier kernel.

New device-trees often cause older kernels to panic or malfunction.  If
storage is on USB you can unplug and adjust on a nearby desktop, but this
means you need to keep another system handy.  Whereas due to being well
isolated from the OS, the same set of ACPI tables works for many OSes and
nearly all versions of Linux.

The instances of ACPI tables which worked with Windows, but failed for
other operating systems are quite famous.  The instances where a given
set of device-trees work with Linux, but then fail with other OSes
(or even merely different version of Linux) are not notable.  In fact
instances where device-trees *don't* change drastically between kernel
minor versions are newsworthy.


> > The one remaining major issue was the state of EFI-FB support.  There
> > was a patch which had that working for Linux kernel 5.10, but that might
> > need more work for a proper solution.
> 
> Yes. And there was no interest from the other members to fix it properly. So
> I gave up that on that work as I don't have a particular interest of using
> FrameBuffer on the raspberry PI. Feel free to revive it and I would be happy
> to review them.

Uhm, I thought I had expressed a strong desire to have it operational.
My knowledge of ACPI is rather limited, but I am well-setup for debugging
ARM (unlike x86 which is intended for serious work).

As mentioned by others it is kind of a popular platform.  I dislike the
thought of giving it special status merely due to that, but it is rather
readily available.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



