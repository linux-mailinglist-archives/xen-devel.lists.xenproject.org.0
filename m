Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67EC3F57A4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 07:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170669.311523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIP7b-0004NY-GK; Tue, 24 Aug 2021 05:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170669.311523; Tue, 24 Aug 2021 05:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIP7b-0004LO-Bu; Tue, 24 Aug 2021 05:37:15 +0000
Received: by outflank-mailman (input) for mailman id 170669;
 Tue, 24 Aug 2021 05:37:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jcJD=NP=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1mIP7Z-0004LF-Vu
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 05:37:14 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41aace8f-9d1f-46d5-86fd-ce9912672c55;
 Tue, 24 Aug 2021 05:37:12 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 17O5b1Hf003445
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 24 Aug 2021 01:37:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 17O5b1Tg003444;
 Mon, 23 Aug 2021 22:37:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 41aace8f-9d1f-46d5-86fd-ce9912672c55
Date: Mon, 23 Aug 2021 22:37:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen C-state Issues
Message-ID: <YSSFffDK5/5MUAdj@mattapan.m5p.com>
References: <YSEo9Box2AFnmdLZ@mattapan.m5p.com>
 <dea9cf97-9332-b1c9-2cff-d87564832529@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dea9cf97-9332-b1c9-2cff-d87564832529@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Mon, Aug 23, 2021 at 09:12:52AM +0200, Jan Beulich wrote:
> On 21.08.2021 18:25, Elliott Mitchell wrote:
> > ACPI C-state support might not see too much use, but it does see some.
> > 
> > With Xen 4.11 and Linux kernel 4.19, I found higher C-states only got
> > enabled for physical cores for which Domain 0 had a corresponding vCPU.
> > On a machine where Domain 0 has 5 vCPUs, but 8 reported cores, the
> > additional C-states would only be enabled on cores 0-4.
> > 
> > This can be worked around by giving Domain 0 vCPUs equal to cores, but
> > then offlining the extra vCPUs.  I'm guessing this is a bug with the
> > Linux 4.19 xen_acpi_processor module.
> > 
> > 
> > 
> > Appears Xen 4.14 doesn't work at all with Linux kernel 4.19's ACPI
> > C-state support.  This combination is unable to enable higher C-states
> > on any core.  Since Xen 4.14 and Linux 4.19 are *both* *presently*
> > supported it seems patch(es) are needed somewhere for this combination.
> 
> Hmm, having had observed the same quite some time ago, I thought I had
> dealt with these problems. Albeit surely not in Xen 4.11 or Linux 4.19.
> Any chance you could check up-to-date versions of both Xen and Linux
> (together)?

I can believe you got this fixed, but the Linux fixes never got
backported.

Of the two, higher C-states working with Linux 4.19 and Xen 4.11, but
not Linux 4.19 and Xen 4.14 is more concerning to me.  While offlining
extra vCPUs after boot is inefficient, it does work.  I'm unaware of any
potential workaround for disabled C-states.

Though on second thought some breakage with Xen showed up between
Linux 4.19.181 and 4.19.194.  Now I'm wondering whether the higher
C-states might have worked with 4.19.181...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



