Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9096D1F1E2E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 19:11:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiLI9-0005pW-Nr; Mon, 08 Jun 2020 17:10:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHR7=7V=amazon.com=prvs=42145175d=anchalag@srs-us1.protection.inumbo.net>)
 id 1jiLI7-0005pR-FH
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 17:10:31 +0000
X-Inumbo-ID: f25fd204-a9aa-11ea-9282-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25fd204-a9aa-11ea-9282-bc764e2007e4;
 Mon, 08 Jun 2020 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1591636227; x=1623172227;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=t5Ht9pQ/L15OhRjsj3oBdWbi3godPK4J8lNDSU8Sric=;
 b=NhgdstKIFBHILGXKhwpX0Ez6RrU+EaB2VpVhkDN/FX0/maWd1ncx1LzJ
 8QS/xbluKIHuUth/qcQiO6B1lkL14ifLSAnMOkWyiiXRMCI8xMRtzRSyI
 Ba5vt/UtG504/9wP466frqPdmRxYSJJ3WyNhBVFGmkINTkr1QyUDN2KBf E=;
IronPort-SDR: S8JB7UWD4QsekyIBB/T3lttKcrT1Ne/0DCTZfl8uIv+BINZ1G4WVygkiGFpts8j2A2qHCjsFIu
 YrHU8J2n5sQQ==
X-IronPort-AV: E=Sophos;i="5.73,487,1583193600"; d="scan'208";a="49364832"
Subject: Re: [PATCH 04/12] x86/xen: add system core suspend and resume
 callbacks
Received: from sea32-co-svc-lb4-vlan2.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.47.23.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 08 Jun 2020 17:10:17 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id C791814168C; Mon,  8 Jun 2020 17:10:08 +0000 (UTC)
Received: from EX13D05UWC001.ant.amazon.com (10.43.162.82) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 8 Jun 2020 17:09:48 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC001.ant.amazon.com (10.43.162.82) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 8 Jun 2020 17:09:48 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Mon, 8 Jun 2020 17:09:47 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id F15BC40832; Mon,  8 Jun 2020 17:09:47 +0000 (UTC)
Date: Mon, 8 Jun 2020 17:09:47 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200608170947.GA4392@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
 <79cf02631dc00e62ebf90410bfbbdb52fe7024cb.1589926004.git.anchalag@amazon.com>
 <4b577564-e4c3-0182-2b9e-5f79004f32a1@oracle.com>
 <B966B3A2-4F08-42FA-AF59-B8AA0783C2BA@amazon.com>
 <e2073aa4-2410-4630-fee6-4e4abc172876@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2073aa4-2410-4630-fee6-4e4abc172876@oracle.com>
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
Cc: "Valentin, Eduardo" <eduval@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "bp@alien8.de" <bp@alien8.de>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 05:24:37PM -0400, Boris Ostrovsky wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 6/3/20 6:40 PM, Agarwal, Anchal wrote:
> >     CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >
> >
> >
> >     On 5/19/20 7:26 PM, Anchal Agarwal wrote:
> >     > From: Munehisa Kamata <kamatam@amazon.com>
> >     >
> >     > Add Xen PVHVM specific system core callbacks for PM suspend and
> >     > hibernation support. The callbacks suspend and resume Xen
> >     > primitives,like shared_info, pvclock and grant table. Note that
> >     > Xen suspend can handle them in a different manner, but system
> >     > core callbacks are called from the context.
> >
> >
> >     I don't think I understand that last sentence.
> >
> > Looks like it may have cryptic meaning of stating that xen_suspend calls syscore_suspend from xen_suspend
> > So, if these syscore ops gets called  during xen_suspend do not do anything. Check if the mode is in xen suspend
> > and return from there. These syscore_ops are specifically for domU hibernation.
> > I must admit, I may have overlooked lack of explanation of some implicit details in the original commit msg.
> >
> >     >  So if the callbacks
> >     > are called from Xen suspend context, return immediately.
> >     >
> >
> >
> >     > +
> >     > +static int xen_syscore_suspend(void)
> >     > +{
> >     > +     struct xen_remove_from_physmap xrfp;
> >     > +     int ret;
> >     > +
> >     > +     /* Xen suspend does similar stuffs in its own logic */
> >     > +     if (xen_suspend_mode_is_xen_suspend())
> >     > +             return 0;
> 
> 
> With your explanation now making this clearer, is this check really
> necessary? From what I see we are in XEN_SUSPEND mode when
> lock_system_sleep() lock is taken, meaning that we can't initialize
> hibernation.
> 
I see. Sounds plausible. I will fix both the code and commit message
for better readability. Thanks for catching this.
> 
> >     > +
> >     > +     xrfp.domid = DOMID_SELF;
> >     > +     xrfp.gpfn = __pa(HYPERVISOR_shared_info) >> PAGE_SHIFT;
> >     > +
> >     > +     ret = HYPERVISOR_memory_op(XENMEM_remove_from_physmap, &xrfp);
> >     > +     if (!ret)
> >     > +             HYPERVISOR_shared_info = &xen_dummy_shared_info;
> >     > +
> >     > +     return ret;
> >     > +}
> >     > +
> >     > +static void xen_syscore_resume(void)
> >     > +{
> >     > +     /* Xen suspend does similar stuffs in its own logic */
> >     > +     if (xen_suspend_mode_is_xen_suspend())
> >     > +             return;
> >     > +
> >     > +     /* No need to setup vcpu_info as it's already moved off */
> >     > +     xen_hvm_map_shared_info();
> >     > +
> >     > +     pvclock_resume();
> >     > +
> >     > +     gnttab_resume();
> >
> >
> >     Do you call gnttab_suspend() in pm suspend path?
> > No, since it does nothing for HVM guests. The unmap_frames is only applicable for PV guests right?
> 
> 
> You should call it nevertheless. It will decide whether or not anything
> needs to be done.
Will fix it in V2.
> 
> 
> -boris
> 
Thanks,
Anchal
> 

