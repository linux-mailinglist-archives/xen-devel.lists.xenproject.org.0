Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B117B07CF5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 20:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045601.1415735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc6uj-0007dd-AI; Wed, 16 Jul 2025 18:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045601.1415735; Wed, 16 Jul 2025 18:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc6uj-0007cH-7b; Wed, 16 Jul 2025 18:31:33 +0000
Received: by outflank-mailman (input) for mailman id 1045601;
 Wed, 16 Jul 2025 18:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I3aj=Z5=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1uc6uh-0007cB-P6
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 18:31:31 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15dff715-6273-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 20:31:28 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 56GIV7JV041469
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 16 Jul 2025 14:31:12 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 56GIV6jJ041468;
 Wed, 16 Jul 2025 11:31:06 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 15dff715-6273-11f0-b894-0df219b8e170
Date: Wed, 16 Jul 2025 11:31:06 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aHfv6jj4GkW7ZR2S@mattapan.m5p.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
 <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
 <aHSth3FOCpiRRfwv@mail.vates.tech>
 <aHWi3ncNrVBO6jrh@mattapan.m5p.com>
 <aHYPktKlOyFJ49bb@mail.vates.tech>
 <aHapxmJ6miJnWYit@mattapan.m5p.com>
 <aHdZInm-EC487zKi@mail.vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHdZInm-EC487zKi@mail.vates.tech>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Wed, Jul 16, 2025 at 07:47:48AM +0000, Anthoine Bourgeois wrote:
> On Tue, Jul 15, 2025 at 12:19:34PM -0700, Elliott Mitchell wrote:
> >On Tue, Jul 15, 2025 at 08:21:40AM +0000, Anthoine Bourgeois wrote:
> >> On Mon, Jul 14, 2025 at 05:37:51PM -0700, Elliott Mitchell wrote:
> >> >On Mon, Jul 14, 2025 at 07:11:06AM +0000, Anthoine Bourgeois wrote:
> >> >> On Fri, Jul 11, 2025 at 05:33:43PM +0200, Juergen Gross wrote:
> >> >> >On 10.07.25 18:11, Anthoine Bourgeois wrote:
> >> >
> >> >Tested on a VM which this could be tried on.
> >> >
> >> >Booting was successful, network appeared to function as it had been.
> >> >Spurious events continued to occur at roughly the same interval they had
> >> >been.
> >> >
> >> >I can well believe this increases Xen network performance and may
> >> >reduce the occurrence of spurious interrupts, but it certainly doesn't
> >> >fully fix the problem(s).  Appears you're going to need to keep digging.
> >> >
> >> >I believe this does count as Tested-by since I observed no new ill
> >> >effects.  Just the existing ill effects aren't fully solved.
> >>
> >> Thank you for the test!
> >> Could you send me the domU/dom0 kernel version and xen version ?
> >
> >I tend to follow Debian, so kernel 6.1.140 and 4.17.6.  What may be
> >more notable is AMD processor.
> >
> >When initially reported, it was reported as being more severe on systems
> >with AMD processors.  I've been wondering about the reason(s) behind
> >that.
> 
> AMD processors could make a huge difference. On Ryzen, this patch could
> almost double the bandwidth and on Epyc close to nothing with low
> frequency models, there is another bottleneck here I guess.
> On which one do you test?
> 
> Do you know there is also a workaround on AMD processors about remapping
> grant tables as WriteBack?
> Upstream patch is 22650d605462 from XenServer.
> The test package for XCP-ng with the patch:
> https://xcp-ng.org/forum/topic/10943/network-traffic-performance-on-amd-processors
> 

Why are you jumping onto mostly unrelated issues when the current bug is
unfinished?

Spurious events continue to be observed on the network backend.  Spurious
events are also being observed on block and PCI backends.  You identified
one cause, but others remain.

(I'm hoping the next one effects all the back/front ends; the PCI backend
is a bigger issue for me)

Should add, one VM being observed with these issue(s) is using 6.12.38.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



