Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE9228992
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 21:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxyMY-0000r6-HZ; Tue, 21 Jul 2020 19:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EbhO=BA=amazon.com=prvs=46490858e=anchalag@srs-us1.protection.inumbo.net>)
 id 1jxyMX-0000r1-4x
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 19:55:41 +0000
X-Inumbo-ID: 2733a318-cb8c-11ea-85b6-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2733a318-cb8c-11ea-85b6-bc764e2007e4;
 Tue, 21 Jul 2020 19:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1595361340; x=1626897340;
 h=date:from:to:cc:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to:subject;
 bh=5vreiwo8fMlL1xtpYFrbID02dZ/n0SD7ehepl0EtZ6c=;
 b=R4LPQiyfhyWjdwbHOUSAKz2huhmE0SICxVM2roiMCqqAjDItCFtMUEJI
 mQnJ5PYNAz/BGmIeTFmJpBLptzqsdEHq+vJ17ibCIHT+325mLBrbN8+xw
 HwXTQVdVFWAm29c5jAgWf8Llvx8GQ8Fxc/sKUZnL84JzhDKU3jf//yt+v c=;
IronPort-SDR: qkBMVLCMhOgpZ4WzlwZUhSxPSGeQdV7KpMOrhhIruU5PoAtatjY3hzMicEpmWdiM7OgXDrZMKk
 oyFa+lhnjHgA==
X-IronPort-AV: E=Sophos;i="5.75,379,1589241600"; d="scan'208";a="43212392"
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 21 Jul 2020 19:55:38 +0000
Received: from EX13MTAUWC001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 094CE2826E7; Tue, 21 Jul 2020 19:55:31 +0000 (UTC)
Received: from EX13D05UWC003.ant.amazon.com (10.43.162.226) by
 EX13MTAUWC001.ant.amazon.com (10.43.162.135) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 21 Jul 2020 19:55:09 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05UWC003.ant.amazon.com (10.43.162.226) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 21 Jul 2020 19:55:09 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 21 Jul 2020 19:55:09 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id 813E040839; Tue, 21 Jul 2020 19:55:09 +0000 (UTC)
Date: Tue, 21 Jul 2020 19:55:09 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200721195509.GA14682@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <cover.1593665947.git.anchalag@amazon.com>
 <20200702182136.GA3511@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <50298859-0d0e-6eb0-029b-30df2a4ecd63@oracle.com>
 <20200715204943.GB17938@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <0ca3c501-e69a-d2c9-a24c-f83afd4bdb8c@oracle.com>
 <20200717191009.GA3387@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
 <20200720093705.GG7191@Air-de-Roger>
 <20200721001736.GB19610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200721083018.GM7191@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721083018.GM7191@Air-de-Roger>
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
 hpa@zytor.com, tglx@linutronix.de, sstabellini@kernel.org, kamatam@amazon.com,
 marmarek@invisiblethingslab.com, mingo@redhat.com,
 xen-devel@lists.xenproject.org, sblbir@amazon.com, axboe@kernel.dk,
 konrad.wilk@oracle.com, anchalag@amazon.com, bp@alien8.de,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 21, 2020 at 10:30:18AM +0200, Roger Pau Monné wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> Marek: I'm adding you in case you could be able to give this a try and
> make sure it doesn't break suspend for dom0.
> 
> On Tue, Jul 21, 2020 at 12:17:36AM +0000, Anchal Agarwal wrote:
> > On Mon, Jul 20, 2020 at 11:37:05AM +0200, Roger Pau Monné wrote:
> > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > >
> > >
> > >
> > > On Sat, Jul 18, 2020 at 09:47:04PM -0400, Boris Ostrovsky wrote:
> > > > (Roger, question for you at the very end)
> > > >
> > > > On 7/17/20 3:10 PM, Anchal Agarwal wrote:
> > > > > On Wed, Jul 15, 2020 at 05:18:08PM -0400, Boris Ostrovsky wrote:
> > > > >> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > > >>
> > > > >>
> > > > >>
> > > > >> On 7/15/20 4:49 PM, Anchal Agarwal wrote:
> > > > >>> On Mon, Jul 13, 2020 at 11:52:01AM -0400, Boris Ostrovsky wrote:
> > > > >>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > > >>>>
> > > > >>>>
> > > > >>>>
> > > > >>>> On 7/2/20 2:21 PM, Anchal Agarwal wrote:
> > > > >>>> And PVH dom0.
> > > > >>> That's another good use case to make it work with however, I still
> > > > >>> think that should be tested/worked upon separately as the feature itself
> > > > >>> (PVH Dom0) is very new.
> > > > >>
> > > > >> Same question here --- will this break PVH dom0?
> > > > >>
> > > > > I haven't tested it as a part of this series. Is that a blocker here?
> > > >
> > > >
> > > > I suspect dom0 will not do well now as far as hibernation goes, in which
> > > > case you are not breaking anything.
> > > >
> > > >
> > > > Roger?
> > >
> > > I sadly don't have any box ATM that supports hibernation where I
> > > could test it. We have hibernation support for PV dom0, so while I
> > > haven't done anything specific to support or test hibernation on PVH
> > > dom0 I would at least aim to not make this any worse, and hence the
> > > check should at least also fail for a PVH dom0?
> > >
> > > if (!xen_hvm_domain() || xen_initial_domain())
> > >     return -ENODEV;
> > >
> > > Ie: none of this should be applied to a PVH dom0, as it doesn't have
> > > PV devices and hence should follow the bare metal device suspend.
> > >
> > So from what I understand you meant for any guest running on pvh dom0 should not
> > hibernate if hibernation is triggered from within the guest or should they?
> 
> Er no to both I think. What I meant is that a PVH dom0 should be able
> to properly suspend, and we should make sure this work doesn't make
> this any harder (or breaks it if it's currently working).
> 
> Or at least that's how I understood the question raised by Boris.
> 
> You are adding code to the generic suspend path that's also used by dom0
> in order to perform bare metal suspension. This is fine now for a PV
> dom0 because the code is gated on xen_hvm_domain, but you should also
> take into account that a PVH dom0 is considered a HVM domain, and
> hence will get the notifier registered.
>
Ok that makes sense now. This is good to be safe, but my patch series is only to
support domU hibernation, so I am not sure if this will affect pvh dom0.
However, since I do not have a good way of testing sure I will add the check.

Moreover, in Patch-0004, I do register suspend/resume syscore_ops specifically for domU
hibernation only if its xen_hvm_domain. I don't see any reason that should not
be registered for domU's running on pvh dom0. Those suspend/resume callbacks will
only be invoked in case hibernation and will be skipped if generic suspend path
is in progress. Do you see any issue with that?

> > > Also I would contact the QubesOS guys, they rely heavily on the
> > > suspend feature for dom0, and that's something not currently tested by
> > > osstest so any breakages there go unnoticed.
> > >
> > Was this for me or Boris? If its the former then I have no idea how to?
> 
> I've now added Marek.
> 
> Roger.
Anchal

