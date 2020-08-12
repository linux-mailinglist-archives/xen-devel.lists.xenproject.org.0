Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92163242A8C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 15:44:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5r2s-0003su-Ui; Wed, 12 Aug 2020 13:43:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5r2r-0003sp-C9
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 13:43:57 +0000
X-Inumbo-ID: 9cf50278-98af-461b-b8b1-301f67f41ec4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cf50278-98af-461b-b8b1-301f67f41ec4;
 Wed, 12 Aug 2020 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597239836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PlS63ekx8nrnXrbNL+3z/URf7dbPVXgTBbFS7mDoLrI=;
 b=O2nEhzrx2+/18f6qYeoJ+xZXeYxNlP1LIpJpjHt6Cbwgq8HM2jFL1ft4
 A9PakFl3q1hS7F4GEnghuPYCkLkGzCVFFgz8i2vB0a09XmfMn6ILplphp
 9lLrweN1gEDkSYmgW06mDlpCVVGd/Hz0xtMA4o5FnbibRtpqAPDDwEz6y c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 4CmgGT2R6x8nZl1fZQov6cFgjEN7YeA1HxGvQ9lcQs8UwE9CD/nfZBKpb9X9xJ8lOqA7rEHcWe
 nDe2/q2xevcq//D55iJrbomm8w7SkggLL5b/v0z6RNJumup5ryQNIyUl0Y6H+BsZuGRZX3PdYZ
 ls4hk3Tj4wLPX9bWPhhIrstgBHjo2Jlul+niwc10cO7xXqtUxBwDVcyfieHwCAYV5OmLQzXHsi
 DQe1/ZzH6NPd6RCVU4MWmPuEzosqd1oOdvdIzV8bAsW/BgvFoKXbt4dFTmpNSbYTi8nD1b1ELS
 pc0=
X-SBRS: 2.7
X-MesageID: 24529896
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24529896"
Date: Wed, 12 Aug 2020 15:43:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: Paul Durrant <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>, 
 Eslam Elnikety <elnikety@amazon.de>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Shan Haitao <haitao.shan@intel.com>, Jan Beulich
 <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: re-work viridian APIC assist code
Message-ID: <20200812134348.GB975@Air-de-Roger>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7547be305e3ede9edb897e2be898fe54e0b4065c.camel@infradead.org>
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

Sorry for not replying earlier, wanted to finish something first.

On Tue, Aug 11, 2020 at 02:25:16PM +0100, David Woodhouse wrote:
> Resending this straw man patch at Roger's request, to restart discussion.
> 
> Redux: In order to cope with the relatively rare case of unmaskable
> legacy MSIs, each vlapic EOI takes a domain-global spinlock just to
> iterate over all IRQs and determine that there's actually nothing to
> do.
> 
> In my testing, I observe that this drops Windows performance on passed-
> through NVMe from 2.2M IOPS down to about 1.0M IOPS.
> 
> I have a variant of this patch which just has a single per-domain "I
> attached legacy unmaskable MSIs" flag, which is never cleared. The
> patch below is per-vector (but Roger points out it should be per-vCPU
> per-vector). I don't know that we really care enough to do more than
> the single per-domain flag, which in real life would never happen
> anyway unless you have crappy hardware, at which point you get back to
> today's status quo.

I've just posted a series [0] that should allow setting of EOI
callbacks for lapic vectors, which I think could be relevant for the
use-case here. Note the series itself doesn't change the current
behavior much, as it will still register a callback for each injected
MSI, regardless of whether it's maskable or non-maskable.

I think you could easily make a patch on top of my series that
prevents registering the EOI callback for maskable MSIs, and it would
avoid having to add a per-domain flag or anything like that.

> My main concern is that this code is fairly sparsely documented and I'm
> only 99% sure that this code path really *is* only for unmaskable MSIs,
> and doesn't have some other esoteric use. A second opinion on that
> would be particularly welcome.

That's also my reading, maskable MSIs will have ack_type set to
ACKTYPE_NONE according to irq_acktype, which will then prevent
do_IRQ_guest from setting pirq->masked and thus turn desc_guest_eoi
into a noop.

I assume this is because maskable MSIs can always be masked by Xen if
required, so there's no reason to hold them pending in the lapic. OTOH
Xen has no way to prevent non-maskable MSIs except from keeping the
vector ISR bit set.

[0] https://lore.kernel.org/xen-devel/20200812124709.4165-1-roger.pau@citrix.com/T/#mb300899b0d95d5b6e78ca8caea21482d91b1cea8

Roger.

