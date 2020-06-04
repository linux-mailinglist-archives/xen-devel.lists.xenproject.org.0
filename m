Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81851EEE1B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 01:05:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgytx-0007qL-Uh; Thu, 04 Jun 2020 23:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zxGl=7R=amazon.com=prvs=41758ceaf=anchalag@srs-us1.protection.inumbo.net>)
 id 1jgytv-0007qG-Sh
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 23:03:55 +0000
X-Inumbo-ID: aa20ad9c-a6b7-11ea-9947-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa20ad9c-a6b7-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 23:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1591311836; x=1622847836;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=XlvjY2cbK79XKJQbABj6I52DuwNCmkoPmmNUgRZuzx4=;
 b=FsgtDi4Pv7uJuxVHUmYuYmjeDKtjri0bEhdXdULKxXlXZik0elc8l+1H
 Okxa5LoVs10W2+uh5dWu2Zf9V5m9t2BE0I58KYm4xTOcr/TBdkUTsGe8X
 xlus2sPLU/yRrLu7yrqqc7QwunL6zfIgt1D1iFB1k5N0GuJGFiMgyqMB0 I=;
IronPort-SDR: BU/B31Mc2p1teKXE8T0M/Qekrk1iOuiIqPmHAVira61H+IDlK+H6BZmL2NxaskgX4guwfy+OUc
 I5F/nNdpGkaw==
X-IronPort-AV: E=Sophos;i="5.73,472,1583193600"; d="scan'208";a="34541182"
Subject: Re: [PATCH 03/12] x86/xen: Introduce new function to map
 HYPERVISOR_shared_info on Resume
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 04 Jun 2020 23:03:43 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7E52614194D; Thu,  4 Jun 2020 23:03:35 +0000 (UTC)
Received: from EX13D05UWC001.ant.amazon.com (10.43.162.82) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 4 Jun 2020 23:03:07 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC001.ant.amazon.com (10.43.162.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 4 Jun 2020 23:03:07 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Thu, 4 Jun 2020 23:03:07 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 705A940712; Thu,  4 Jun 2020 23:03:07 +0000 (UTC)
Date: Thu, 4 Jun 2020 23:03:07 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200604230307.GB25251@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
 <529f544a64bb93b920bf86b1d3f86d93b0a4219b.1589926004.git.anchalag@amazon.com>
 <72989b50-0c13-7a2b-19e2-de4a3646c83f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72989b50-0c13-7a2b-19e2-de4a3646c83f@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, kamatam@amazon.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, axboe@kernel.dk,
 konrad.wilk@oracle.com, bp@alien8.de, tglx@linutronix.de, jgross@suse.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, May 30, 2020 at 07:02:01PM -0400, Boris Ostrovsky wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 5/19/20 7:25 PM, Anchal Agarwal wrote:
> > Introduce a small function which re-uses shared page's PA allocated
> > during guest initialization time in reserve_shared_info() and not
> > allocate new page during resume flow.
> > It also  does the mapping of shared_info_page by calling
> > xen_hvm_init_shared_info() to use the function.
> >
> > Signed-off-by: Anchal Agarwal <anchalag@amazon.com>
> > ---
> >  arch/x86/xen/enlighten_hvm.c | 7 +++++++
> >  arch/x86/xen/xen-ops.h       | 1 +
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
> > index e138f7de52d2..75b1ec7a0fcd 100644
> > --- a/arch/x86/xen/enlighten_hvm.c
> > +++ b/arch/x86/xen/enlighten_hvm.c
> > @@ -27,6 +27,13 @@
> >
> >  static unsigned long shared_info_pfn;
> >
> > +void xen_hvm_map_shared_info(void)
> > +{
> > +     xen_hvm_init_shared_info();
> > +     if (shared_info_pfn)
> > +             HYPERVISOR_shared_info = __va(PFN_PHYS(shared_info_pfn));
> > +}
> > +
> 
> 
> AFAICT it is only called once so I don't see a need for new routine.
> 
> 
HYPERVISOR_shared_info can only be mapped in this scope without refactoring
much of the code.
> And is it possible for shared_info_pfn to be NULL in resume path (which
> is where this is called)?
> 
> 
I don't think it should be, still a sanity check but I don't think its needed there
because hibernation will fail in any case if thats the case. 
However, HYPERVISOR_shared_info does needs to be re-mapped on resume as its been
marked to dummy address on suspend. Its also safe in case va changes.
Does the answer your question?
> -boris

-Anchal
> 
> 

