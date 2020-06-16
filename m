Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971B1FAAFD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 10:21:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl6pI-0004x4-9C; Tue, 16 Jun 2020 08:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jl6pH-0004wz-F8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 08:20:11 +0000
X-Inumbo-ID: 31c87180-afaa-11ea-b893-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31c87180-afaa-11ea-b893-12813bfff9fa;
 Tue, 16 Jun 2020 08:20:10 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JOYXLTr9zv/b1G07GcaAIU6MeekcuFiFnBqH0Ve2kdkm18NqJ5UI4TPpJZVMeZ+8ocqK5u9iz5
 /UQl7RxtSRcXH83BBQ96THbVre7iVc8agwC3sOlw+NFlYzb/PeugK4aaT/c7HiGTxHFmVd/AxP
 6D1yX6VZhEbZ+1/ji6L5sxJJjYnDDWP5avbOeWXxIFSzgLJhHJtiz17XUTN/xYRkzcgGOiM2kJ
 XrPW2rD9NVSwoVlVCVuQm3+Jr2q6XyHANrqLzlkZtbp6izfayKP+yNYY643IlkbjKbSm50WBqN
 V9A=
X-SBRS: 2.7
X-MesageID: 20368986
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20368986"
Date: Tue, 16 Jun 2020 10:20:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 v2 1/2] x86/passthrough: do not assert edge
 triggered GSIs for PVH dom0
Message-ID: <20200616082002.GK735@Air-de-Roger>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-2-roger.pau@citrix.com>
 <b3bd8641-4cf9-d432-145a-d19bb852ffdc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b3bd8641-4cf9-d432-145a-d19bb852ffdc@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 08:11:12AM +0200, Jan Beulich wrote:
> On 10.06.2020 16:29, Roger Pau Monne wrote:
> > @@ -186,9 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
> >       * to know if the GSI is pending or not.
> >       */
> >      spin_lock(&d->arch.hvm.irq_lock);
> > -    if ( !hvm_irq->gsi_assert_count[gsi] )
> > +    if ( trig == VIOAPIC_EDGE_TRIG || !hvm_irq->gsi_assert_count[gsi] )
> >      {
> > -        hvm_irq->gsi_assert_count[gsi] = 1;
> > +        if ( trig == VIOAPIC_LEVEL_TRIG )
> > +            hvm_irq->gsi_assert_count[gsi] = 1;
> 
> Btw, along the lines of how you do things here, I think ...
> 
> > @@ -196,11 +198,12 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
> >  
> >  void hvm_gsi_deassert(struct domain *d, unsigned int gsi)
> >  {
> > +    int trig = vioapic_get_trigger_mode(d, gsi);
> >      struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> >  
> > -    if ( gsi >= hvm_irq->nr_gsis )
> > +    if ( trig <= VIOAPIC_EDGE_TRIG || gsi >= hvm_irq->nr_gsis )
> 
> ... this would better have been "trig != VIOAPIC_LEVEL_TRIG", to
> avoid the code being dependent upon the actual values of both
> VIOAPIC_*_TRIG constants.

Sure, let me send a follow up patch, it's trivial to fix.

Thanks, Roger.

