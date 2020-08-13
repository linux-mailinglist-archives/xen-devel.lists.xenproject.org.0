Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5762437DA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 11:46:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k69oE-0006JL-Sz; Thu, 13 Aug 2020 09:46:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIW0=BX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k69oD-0006JG-8c
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 09:46:05 +0000
X-Inumbo-ID: 008cff7d-c0ae-4230-bdf7-f06653cddcb9
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 008cff7d-c0ae-4230-bdf7-f06653cddcb9;
 Thu, 13 Aug 2020 09:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597311964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QeTpugyBiDgi/gDGvHUvDyN0TmjuJjbT7YxbknorkZ8=;
 b=FLtm0me9rBzd7FcjjBFd+ruPr9Gn2j3pEvFux2xQE2QMTOQOkVr6OOyq
 Bi8hq+AbY7x2mbxExiZzwXti188QK9tmEsDccA1nXUYQ3Uo81qdAVGAN9
 Czr7CKPv9yL6e1HRSCqDLYYs7tD/4r+F4cj6FrzDati5ANiCzPCDzqduI E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DEwYsPlcplQwLqWCNEVkvjQae5jlvCcG8q+I+D+62nzWWwIzVG5nCx4TD6z6j99yZJBx7DmqKE
 wOx5dIJsQCwj0+DL5Vg19rtAi1ueKIm3ufkrLGISLb20qcLLaTjAcJpqZpvux9KaTgriCQ/Dvc
 tlSDQJ52wRZb+P0rZl2IMkzANxItY3WDU2Oz4QIshdEaSOzYAGErlVfBtXQZyGgUcc7fAJWRUr
 YvZLXwhbheIJL5FG7NWfnbkm13OT//hx3+uYBpwIJ46Csn8HVlppDtnX4sd/9UHDKeszLX0S8l
 MwU=
X-SBRS: 2.7
X-MesageID: 24421430
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,307,1592884800"; d="scan'208";a="24421430"
Date: Thu, 13 Aug 2020 11:45:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: 'David Woodhouse' <dwmw2@infradead.org>, 'Paul Durrant'
 <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>, 'Eslam Elnikety'
 <elnikety@amazon.de>, 'Andrew Cooper' <andrew.cooper3@citrix.com>, "'Shan
 Haitao'" <haitao.shan@intel.com>, 'Jan Beulich' <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
Message-ID: <20200813094555.GF975@Air-de-Roger>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
 <002d01d67149$37404b00$a5c0e100$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <002d01d67149$37404b00$a5c0e100$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 13, 2020 at 09:10:31AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of David Woodhouse
> > Sent: 11 August 2020 14:25
> > To: Paul Durrant <paul.durrant@citrix.com>; xen-devel@lists.xenproject.org; Roger Pau Monne
> > <roger.pau@citrix.com>
> > Cc: Eslam Elnikety <elnikety@amazon.de>; Andrew Cooper <andrew.cooper3@citrix.com>; Shan Haitao
> > <haitao.shan@intel.com>; Jan Beulich <jbeulich@suse.com>
> > Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
> > 
> > Resending this straw man patch at Roger's request, to restart discussion.
> > 
> > Redux: In order to cope with the relatively rare case of unmaskable
> > legacy MSIs, each vlapic EOI takes a domain-global spinlock just to
> > iterate over all IRQs and determine that there's actually nothing to
> > do.
> > 
> > In my testing, I observe that this drops Windows performance on passed-
> > through NVMe from 2.2M IOPS down to about 1.0M IOPS.
> > 
> > I have a variant of this patch which just has a single per-domain "I
> > attached legacy unmaskable MSIs" flag, which is never cleared. The
> > patch below is per-vector (but Roger points out it should be per-vCPU
> > per-vector). I don't know that we really care enough to do more than
> > the single per-domain flag, which in real life would never happen
> > anyway unless you have crappy hardware, at which point you get back to
> > today's status quo.
> > 
> > My main concern is that this code is fairly sparsely documented and I'm
> > only 99% sure that this code path really *is* only for unmaskable MSIs,
> > and doesn't have some other esoteric use. A second opinion on that
> > would be particularly welcome.
> > 
> 
> The loop appears to be there to handle the case where multiple
> devices assigned to a domain have MSIs programmed with the same
> dest/vector... which seems like an odd thing for a guest to do but I
> guess it is at liberty to do it. Does it matter whether they are
> maskable or not?

Such configuration would never work properly, as lapic vectors are
edge triggered and thus can't be safely shared between devices?

I think the iteration is there in order to get the hvm_pirq_dpci
struct that injected that specific vector, so that you can perform the
ack if required. Having lapic EOI callbacks should simply this, as you
can pass a hvm_pirq_dpci when injecting a vector, and that would be
forwarded to the EOI callback, so there should be no need to iterate
over the list of hvm_pirq_dpci for a domain.

Roger.

