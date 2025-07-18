Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E5B0AB31
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 22:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1049207.1419239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucs0c-00010a-3v; Fri, 18 Jul 2025 20:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1049207.1419239; Fri, 18 Jul 2025 20:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucs0c-0000y9-0W; Fri, 18 Jul 2025 20:48:46 +0000
Received: by outflank-mailman (input) for mailman id 1049207;
 Fri, 18 Jul 2025 20:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/TGD=Z7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ucs0b-0000y3-3W
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 20:48:45 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 960ed893-6418-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 22:48:42 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 56IKmJmc053108
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 18 Jul 2025 16:48:24 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 56IKmHNe053107;
 Fri, 18 Jul 2025 13:48:17 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 960ed893-6418-11f0-b894-0df219b8e170
Date: Fri, 18 Jul 2025 13:48:17 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/netfront: Fix TX response spurious interrupts
Message-ID: <aHqzEUtvIz1KpRW3@mattapan.m5p.com>
References: <20250710161029.3773630-1-anthoine.bourgeois@vates.tech>
 <d2c05c2b-ee50-4121-bedd-17ec6bcfa75f@suse.com>
 <aHSth3FOCpiRRfwv@mail.vates.tech>
 <aHWi3ncNrVBO6jrh@mattapan.m5p.com>
 <aHYPktKlOyFJ49bb@mail.vates.tech>
 <aHapxmJ6miJnWYit@mattapan.m5p.com>
 <aHdZInm-EC487zKi@mail.vates.tech>
 <aHfv6jj4GkW7ZR2S@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHfv6jj4GkW7ZR2S@mattapan.m5p.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Wed, Jul 16, 2025 at 11:31:06AM -0700, Elliott Mitchell wrote:
> On Wed, Jul 16, 2025 at 07:47:48AM +0000, Anthoine Bourgeois wrote:
> > On Tue, Jul 15, 2025 at 12:19:34PM -0700, Elliott Mitchell wrote:
> > >On Tue, Jul 15, 2025 at 08:21:40AM +0000, Anthoine Bourgeois wrote:
> > >>
> > >> Thank you for the test!
> > >> Could you send me the domU/dom0 kernel version and xen version ?
> > >
> > >I tend to follow Debian, so kernel 6.1.140 and 4.17.6.  What may be
> > >more notable is AMD processor.
> > >
> > >When initially reported, it was reported as being more severe on systems
> > >with AMD processors.  I've been wondering about the reason(s) behind
> > >that.
> > 
> > AMD processors could make a huge difference. On Ryzen, this patch could
> > almost double the bandwidth and on Epyc close to nothing with low
> > frequency models, there is another bottleneck here I guess.
> > On which one do you test?
> > 
> > Do you know there is also a workaround on AMD processors about remapping
> > grant tables as WriteBack?
> > Upstream patch is 22650d605462 from XenServer.
> > The test package for XCP-ng with the patch:
> > https://xcp-ng.org/forum/topic/10943/network-traffic-performance-on-amd-processors
> > 
> 
> Why are you jumping onto mostly unrelated issues when the current bug is
> unfinished?
> 
> Spurious events continue to be observed on the network backend.  Spurious
> events are also being observed on block and PCI backends.  You identified
> one cause, but others remain.
> 
> (I'm hoping the next one effects all the back/front ends; the PCI backend
> is a bigger issue for me)
> 
> Should add, one VM being observed with these issue(s) is using 6.12.38.

For reference, the following:

for d in /sys/devices/{pci,vbd,vif}-*[0-9]-*[0-9]/xenbus
do      if [ -f "$d/spurious_events" ]
        then    read s < "$d/spurious_events"
        else    s=0
        fi
        if [ "$s" -gt 0 ]
        then    printf "problem %s: %d\\n" "$d/spurious_events" "$s"
        else    printf "clean: %s\\n" "$d/spurious_events"
        fi
done

Flags all passthrough and virtual devices.  Even though there is a
reduction with virtual network devices, that is only a 10% reduction.
Most of the problem remains even though there is progress.

I was mentioning an AMD processor since the initial report stated the
problem was more severe with AMD processor machines.

This is likely a driver design issue.  Most pieces of hardware, telling
the hardware to process an empty queue is quite cheap.  Perhaps minor
energy loss, but most hardware isn't (yet) too worried about being
attacked.

Passthrough and virtual devices are quite unusual in there being a
concern over attacks.  There could be major design flaws due to the
front-ends being designed similar to normal drivers.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



