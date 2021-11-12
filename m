Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916544EE67
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 22:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225435.389299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mldtG-000664-W6; Fri, 12 Nov 2021 21:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225435.389299; Fri, 12 Nov 2021 21:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mldtG-00063G-SP; Fri, 12 Nov 2021 21:15:18 +0000
Received: by outflank-mailman (input) for mailman id 225435;
 Fri, 12 Nov 2021 21:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cipi=P7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mldtG-000638-6M
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 21:15:18 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1587b65-43fd-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 22:15:16 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1ACLF1bt086405
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 12 Nov 2021 16:15:07 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1ACLF0jZ086404;
 Fri, 12 Nov 2021 13:15:00 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: a1587b65-43fd-11ec-9787-a32c541c8605
Date: Fri, 12 Nov 2021 13:15:00 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YY7ZVPQSTapB7Jnj@mattapan.m5p.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <YY6bsu8/y/LeMfg3@mattapan.m5p.com>
 <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40474f12-e269-f251-99b1-cb5b0a317bb2@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Nov 12, 2021 at 05:38:02PM +0000, Julien Grall wrote:
> 
> On 12/11/2021 16:52, Elliott Mitchell wrote:
> > On Fri, Nov 12, 2021 at 04:02:36PM +0000, Julien Grall wrote:
> >>
> >> On 12/11/2021 15:44, Elliott Mitchell wrote:

> >>> Julien Grall and Stefano Stabellini had been proposing doing ACPI table
> >>> parsing in a stub domain, but I'm unaware of the status.  Not finding
> >>> much suggests it hasn't gone very far yet.
> >>
> >> This was a very early proposal in case we needed to parse the DSDT in
> >> Xen. This hasn't been needed so far, hence why this is not implemented
> >> and no-one worked on it.
> >>
> >> I am not very familiar how the framebuffer is detected in ACPI. Can you
> >> provide more details on what exactly you want to parse?
> >>
> >> Alternatively, UEFI is meant to provide an API to access the
> >> framebuffer. Would that be suitable for you?
> > 
> > Last time I tried booting on UEFI, Domain 0 (Linux) was unable to access
> > the framebuffer on this device.  Whereas the same kernel directly on top
> > of UEFI/ACPI was fully able to access the framebuffer (and graphics
> > chip).
> 
> Do you have any log or pointer to any previous discussion about the issue?

https://lists.xenproject.org/archives/html/xen-devel/2020-10/
https://lists.xenproject.org/archives/html/xen-devel/2020-11/

My thread was "Xen on RP4", pretty sure there have been others.  I see
several approaches suggested, but none overtly agreed on.  Seems like the
end sort of amounts to "We really should have ACPI/UEFI support", but no
specific plans.


> > I had been left with the impression the DSDT parsing was going to be
> > needed for Domain 0 to access the framebuffer.  This was found
> > unnecessary for framebuffer access for Domain 0?
> 
> I thought you were asking for using framebuffer in Xen. There is no need 
> for Xen to parse the DSDT if the framebuffer is solely used by Dom0.
> 
> Your problem with the framebuffer is likely not related to the DSDT. But 
> I can't really provide a lot of input until I see the logs.

https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01841.html

That is more or less a statement of handling of DSDT is the Right(tm)
solution for Domain 0 to have framebuffer on such a platform.  Though
there are plenty of short-term hacks for the issue.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



