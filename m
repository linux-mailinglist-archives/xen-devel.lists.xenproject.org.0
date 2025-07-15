Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71CB04D05
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 02:39:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043263.1413405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubTgY-0003FL-KZ; Tue, 15 Jul 2025 00:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043263.1413405; Tue, 15 Jul 2025 00:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubTgY-0003CS-H7; Tue, 15 Jul 2025 00:38:18 +0000
Received: by outflank-mailman (input) for mailman id 1043263;
 Tue, 15 Jul 2025 00:38:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G1ok=Z4=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ubTgX-0003CM-Kl
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 00:38:17 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc949c97-6113-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 02:38:13 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 56F0bqDS031899
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 14 Jul 2025 20:37:57 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 56F0bpwU031898;
 Mon, 14 Jul 2025 17:37:51 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: fc949c97-6113-11f0-b894-0df219b8e170
Date: Mon, 14 Jul 2025 17:37:51 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aHWi3ncNrVBO6jrh@mattapan.m5p.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
 <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
 <aHSth3FOCpiRRfwv@mail.vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHSth3FOCpiRRfwv@mail.vates.tech>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Mon, Jul 14, 2025 at 07:11:06AM +0000, Anthoine Bourgeois wrote:
> On Fri, Jul 11, 2025 at 05:33:43PM +0200, Juergen Gross wrote:
> >On 10.07.25 18:11, Anthoine Bourgeois wrote:
> >> We found at Vates that there are lot of spurious interrupts when
> >> benchmarking the PV drivers of Xen. This issue appeared with a patch
> >> that addresses security issue XSA-391 (see Fixes below). On an iperf
> >> benchmark, spurious interrupts can represent up to 50% of the
> >> interrupts.
> >>
> >> Spurious interrupts are interrupts that are rised for nothing, there is
> >> no work to do. This appends because the function that handles the
> >> interrupts ("xennet_tx_buf_gc") is also called at the end of the request
> >> path to garbage collect the responses received during the transmission
> >> load.
> >>
> >> The request path is doing the work that the interrupt handler should
> >> have done otherwise. This is particurary true when there is more than
> >> one vcpu and get worse linearly with the number of vcpu/queue.
> >>
> >> Moreover, this problem is amplifyed by the penalty imposed by a spurious
> >> interrupt. When an interrupt is found spurious the interrupt chip will
> >> delay the EOI to slowdown the backend. This delay will allow more
> >> responses to be handled by the request path and then there will be more
> >> chance the next interrupt will not find any work to do, creating a new
> >> spurious interrupt.
> >>
> >> This causes performance issue. The solution here is to remove the calls
> >> from the request path and let the interrupt handler do the processing of
> >> the responses. This approch removes spurious interrupts (<0.05%) and
> >> also has the benefit of freeing up cycles in the request path, allowing
> >> it to process more work, which improves performance compared to masking
> >> the spurious interrupt one way or another.
> >>
> >> Some vif throughput performance figures from a 8 vCPUs, 4GB of RAM HVM
> >> guest(s):
> >>
> >> Without this patch on the :
> >> vm -> dom0: 4.5Gb/s
> >> vm -> vm:   7.0Gb/s
> >>
> >> Without XSA-391 patch (revert of b27d47950e48):
> >> vm -> dom0: 8.3Gb/s
> >> vm -> vm:   8.7Gb/s
> >>
> >> With XSA-391 and this patch:
> >> vm -> dom0: 11.5Gb/s
> >> vm -> vm:   12.6Gb/s
> >>
> >> Fixes: b27d47950e48 ("xen/netfront: harden netfront against event channel storms")
> >> Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
> >
> >Please resend this patch with the relevant maintainers added in the
> >recipients list.
> 
> Ok, I will resend the patch tomorrow.
> >
> >You can add my Reviewed-by: tag, of course.
> 
> Thanks!

Tested on a VM which this could be tried on.

Booting was successful, network appeared to function as it had been.
Spurious events continued to occur at roughly the same interval they had
been.

I can well believe this increases Xen network performance and may
reduce the occurrence of spurious interrupts, but it certainly doesn't
fully fix the problem(s).  Appears you're going to need to keep digging.

I believe this does count as Tested-by since I observed no new ill
effects.  Just the existing ill effects aren't fully solved.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



