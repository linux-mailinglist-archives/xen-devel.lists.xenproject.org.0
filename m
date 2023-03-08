Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4046B1628
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 00:09:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508145.782492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pa2tQ-0003xQ-50; Wed, 08 Mar 2023 23:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508145.782492; Wed, 08 Mar 2023 23:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pa2tQ-0003vE-1M; Wed, 08 Mar 2023 23:08:20 +0000
Received: by outflank-mailman (input) for mailman id 508145;
 Wed, 08 Mar 2023 23:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lEal=7A=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pa2tO-0003v8-SA
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 23:08:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a51ae6c-be06-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 00:08:16 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 328N86oW005003
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 8 Mar 2023 18:08:11 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 328N86eF005002;
 Wed, 8 Mar 2023 15:08:06 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 1a51ae6c-be06-11ed-87f5-c1b5be75604c
Date: Wed, 8 Mar 2023 15:08:06 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [BUG] x2apic broken with current AMD hardware
Message-ID: <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Wed, Mar 08, 2023 at 04:50:51PM +0100, Jan Beulich wrote:
> On 08.03.2023 16:23, Elliott Mitchell wrote:
> > Mostly SSIA.  As originally identified by "Neowutran", appears Xen's
> > x2apic wrapper implementation fails with current generation AMD hardware
> > (Ryzen 7xxx/Zen 4).  This can be worked around by passing "x2apic=false"
> > on Xen's command-line, though I'm wondering about the performance impact.
> > 
> > There hasn't been much activity on xen-devel WRT x2apic, so a patch which
> > fixed this may have flown under the radar.  Most testing has also been
> > somewhat removed from HEAD.
> > 
> > Thanks to "Neowutran" for falling on this grenade and making it easier
> > for the followers.  Pointer to first report:
> > https://forum.qubes-os.org/t/ryzen-7000-serie/14538
> 
> I'm sorry, but when you point at this long a report, would you please be a
> little more specific as to where the problem in question is actually
> mentioned? Searching the page for "x2apic" didn't give any hits at all
> until I first scrolled to the bottom of the (at present) 95 comments. And
> then while there are five mentions, there's nothing I could spot that
> would actually help understanding what is actually wrong. A statement like
> "... is because the implementation of x2apic is incorrect" isn't helpful
> on its own. And a later statement by another person puts under question
> whether "x2apic=false" actually helps in all cases.
> 
> Please can we get a proper bug report here with suitable technical detail?
> Or alternatively a patch to discuss?

Mostly I was pointing to the thread to credit Neowutran and company with
originally finding the workaround.  I'm concerned about how
representative my reproduction is since the computer in question is
presently using Debian's build of Xen, 4.14.

As such I'm less than certain the problem is still in HEAD, though
Neowutran and Co working with 4.16 and the commit log being quiet
suggests there is a good chance.

More detail, pretty well most things are broken for Domain 0 without
"x2apic=false".  Trying to boot with a 6.1.12 a USB keyboard was
completely unresponsive, on screen the initial ramdisk script output was
indicating problems interacting with storage devices.  Those two together
suggested an interrupt issue and adding "x2apic=false" caused domain 0 to
successfully boot.
A 5.10 kernel similarly requires "x2apic=false" to successfully boot.

So could be a commit after 4.16 fixed x2apic for current AMD hardware,
but may still be broken.

I sent the message out of concern Neowutran got attention to the TSC
overflow issue, but I haven't seen any mention of the x2apic issue.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



