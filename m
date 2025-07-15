Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF555B066B7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 21:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044688.1414767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ublC0-0006VF-0L; Tue, 15 Jul 2025 19:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044688.1414767; Tue, 15 Jul 2025 19:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ublBz-0006Sm-Tp; Tue, 15 Jul 2025 19:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1044688;
 Tue, 15 Jul 2025 19:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G1ok=Z4=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ublBy-0006Sb-Bl
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 19:19:54 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ade70555-61b0-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 21:19:51 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 56FJJZ4T036126
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 15 Jul 2025 15:19:41 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 56FJJY46036125;
 Tue, 15 Jul 2025 12:19:34 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: ade70555-61b0-11f0-b894-0df219b8e170
Date: Tue, 15 Jul 2025 12:19:34 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aHapxmJ6miJnWYit@mattapan.m5p.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
 <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
 <aHSth3FOCpiRRfwv@mail.vates.tech>
 <aHWi3ncNrVBO6jrh@mattapan.m5p.com>
 <aHYPktKlOyFJ49bb@mail.vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHYPktKlOyFJ49bb@mail.vates.tech>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Tue, Jul 15, 2025 at 08:21:40AM +0000, Anthoine Bourgeois wrote:
> On Mon, Jul 14, 2025 at 05:37:51PM -0700, Elliott Mitchell wrote:
> >On Mon, Jul 14, 2025 at 07:11:06AM +0000, Anthoine Bourgeois wrote:
> >> On Fri, Jul 11, 2025 at 05:33:43PM +0200, Juergen Gross wrote:
> >> >On 10.07.25 18:11, Anthoine Bourgeois wrote:
> >
> >Tested on a VM which this could be tried on.
> >
> >Booting was successful, network appeared to function as it had been.
> >Spurious events continued to occur at roughly the same interval they had
> >been.
> >
> >I can well believe this increases Xen network performance and may
> >reduce the occurrence of spurious interrupts, but it certainly doesn't
> >fully fix the problem(s).  Appears you're going to need to keep digging.
> >
> >I believe this does count as Tested-by since I observed no new ill
> >effects.  Just the existing ill effects aren't fully solved.
> >
> 
> Thank you for the test!
> Could you send me the domU/dom0 kernel version and xen version ?

I tend to follow Debian, so kernel 6.1.140 and 4.17.6.  What may be
more notable is AMD processor.

When initially reported, it was reported as being more severe on systems
with AMD processors.  I've been wondering about the reason(s) behind
that.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



