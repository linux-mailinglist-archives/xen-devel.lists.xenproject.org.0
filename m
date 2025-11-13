Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0AC5A7D6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 00:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162180.1489927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJgUz-0001WZ-A9; Thu, 13 Nov 2025 23:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162180.1489927; Thu, 13 Nov 2025 23:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJgUz-0001Up-7C; Thu, 13 Nov 2025 23:13:05 +0000
Received: by outflank-mailman (input) for mailman id 1162180;
 Thu, 13 Nov 2025 23:13:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fq0p=5V=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1vJgUy-0001Uj-Ef
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 23:13:04 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c4f5c03-c0e6-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 00:13:01 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 5ADNCohx031081
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Nov 2025 18:12:56 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 5ADNCoUX031080;
 Thu, 13 Nov 2025 15:12:50 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 4c4f5c03-c0e6-11f0-980a-7dc792cee155
Date: Thu, 13 Nov 2025 15:12:50 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen DomU Bootloader Experiences
Message-ID: <aRZl8juO9RqN36lF@mattapan.m5p.com>
References: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
 <364eca04-63d0-4ceb-b6c8-84fa6efc3aeb@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <364eca04-63d0-4ceb-b6c8-84fa6efc3aeb@epam.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Thu, Nov 13, 2025 at 10:13:07PM +0200, Grygorii Strashko wrote:
> 
> On 12.11.25 23:13, Elliott Mitchell wrote:
> > 
> > Recommendations:
> > PyGRUB is functional within its limits.  Problems are GRUBv1 syntax and
> > running within Domain 0.  Given this I feel the Xen Project should be
> > heading towards deprecating PyGRUB.  Since PvGRUB works for x86 now, I
> > would default to neither building nor installing PyGRUB on x86.  For
> > other architectures PyGRUB is still useful.
> > 
> > The Xen Project should formally ask the GRUB Project to port PvGRUB to
> > ARM, RISC-V and PowerPC.  The need for PvGRUB on ARM seems rather urgent.
> > Without a proper bootloader VMs aren't too useful.
> > 
> > 
> > The Xen Project needs people to work with EDK2/Tianocore.  The oldest
> > report I've seen of the EDK2/Tianocore issue dates to mid-2023.  Now two
> > years later the bug is still present.
> > 
> > The ability to configure XEN_EFI.fd as a domain kernel is a feature
> > highly worthy of being ported to x86.  For OSes which don't particularly
> > like GRUB, but do have PV drivers this is an ideal boot method.
> 
> Just curious, you did not mention u-boot which is widely used on ARM,
> for example Android guests boot using it.

As I have not used U-Boot to load a DomU I did not write about something
I have not done.  Have you used U-Boot to load a DomU?  Was it a pleasant
experience?  Was it easy to setup?  Was it difficult to setup?

PyGRUB still has a bit of value since it can still load some Linux
guests.  GRUBv1 syntax is a major weakness, so I think the Xen Project
should be heading towards deprecating PyGRUB.  Mostly this needs GRUB's
Xen support to be ported to ARM and RISC-V.

GRUB's Xen support works great for x86.  Pleasant experience with minimal
trouble.  This is great for loading Linux in a DomU.

Tianocore/EDK2 support worked (past tense) great for ARM64.  Pleasant
experience with minimal trouble.  I haven't done full installation, but I
expect full installation will be a breeze (sigh getting patches into some
projects is extremely difficult).



Grygorii Strashko, do you think U-Boot is likely to cover some scenario
not covered by either GRUB or Tianocore/EDK2?  Do you think U-Boot is
likely to do a better job with some scenario than either GRUB or
Tianocore/EDK2?

You mentioned using U-Boot to load Android DomUs on ARM.  Is that likely
to be difficult to switch to Tianocore/EDK2?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



