Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39984227AAD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 10:31:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxnfV-0002ab-6N; Tue, 21 Jul 2020 08:30:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gK6X=BA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxnfT-0002aW-LR
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 08:30:31 +0000
X-Inumbo-ID: 6f5ac2e4-cb2c-11ea-84f6-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f5ac2e4-cb2c-11ea-84f6-bc764e2007e4;
 Tue, 21 Jul 2020 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595320230;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BzY2QweQF/rQiDbWv7Jn9Mmq9ZfmwWs8Ov87vMZGyUU=;
 b=NMatKYSKM8Qv9ope82+19TQxsi+Vc+EtzyekOsRyuuE1K49xkzQRo3VU
 6425hCIOVRGhPLvvY0tTQmQoBdj4wXeYpRDpr3J54zTz4T2HYonILqKyQ
 tlYfe5Nh9nNQ0Kw+kNG+nJ/GVs/dXG/P4DxP6DhKffsMY0F/99KD19ZbK E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: x0OiNrk4e0Kv/geF7/GsMS3ajUnY+7gsSFFEXbjmHoWrn0Lxe6gtvxgEn0GR/cqaG+YYQcjcmB
 y9cXZDaFN18y2oIa9h8b9NAh7AkUkC7xN6pUY0g7UBLeXlTrlJ4gdZ2eS3wMmI4P/wL7ISLp8w
 /rH69WDGB4HRSyD8Mi1RPaLwy67UwO/DxY+phNhaDtpaI/XDgb+g5Z7PhX+c3q5qRqoauEaBxR
 Eblv/h6LWWnHOFZ3YXG0BABZ9rg/RT1Z7xPJGXBV02waTGeDtwxItb0TozFEIVA2hEWlnwbpcU
 zt4=
X-SBRS: 2.7
X-MesageID: 23153757
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23153757"
Date: Tue, 21 Jul 2020 10:30:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anchal Agarwal <anchalag@amazon.com>, <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
Message-ID: <20200721083018.GM7191@Air-de-Roger>
References: <cover.1593665947.git.anchalag@amazon.com>
 <20200702182136.GA3511@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <50298859-0d0e-6eb0-029b-30df2a4ecd63@oracle.com>
 <20200715204943.GB17938@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <0ca3c501-e69a-d2c9-a24c-f83afd4bdb8c@oracle.com>
 <20200717191009.GA3387@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
 <20200720093705.GG7191@Air-de-Roger>
 <20200721001736.GB19610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721001736.GB19610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
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
Cc: eduval@amazon.com, len.brown@intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, x86@kernel.org, linux-mm@kvack.org, pavel@ucw.cz,
 hpa@zytor.com, tglx@linutronix.de, sstabellini@kernel.org, kamatam@amazon.com,
 mingo@redhat.com, xen-devel@lists.xenproject.org, sblbir@amazon.com,
 axboe@kernel.dk, konrad.wilk@oracle.com, bp@alien8.de,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, jgross@suse.com,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Marek: I'm adding you in case you could be able to give this a try and
make sure it doesn't break suspend for dom0.

On Tue, Jul 21, 2020 at 12:17:36AM +0000, Anchal Agarwal wrote:
> On Mon, Jul 20, 2020 at 11:37:05AM +0200, Roger Pau Monné wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Sat, Jul 18, 2020 at 09:47:04PM -0400, Boris Ostrovsky wrote:
> > > (Roger, question for you at the very end)
> > >
> > > On 7/17/20 3:10 PM, Anchal Agarwal wrote:
> > > > On Wed, Jul 15, 2020 at 05:18:08PM -0400, Boris Ostrovsky wrote:
> > > >> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > >>
> > > >>
> > > >>
> > > >> On 7/15/20 4:49 PM, Anchal Agarwal wrote:
> > > >>> On Mon, Jul 13, 2020 at 11:52:01AM -0400, Boris Ostrovsky wrote:
> > > >>>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > >>>>
> > > >>>>
> > > >>>>
> > > >>>> On 7/2/20 2:21 PM, Anchal Agarwal wrote:
> > > >>>> And PVH dom0.
> > > >>> That's another good use case to make it work with however, I still
> > > >>> think that should be tested/worked upon separately as the feature itself
> > > >>> (PVH Dom0) is very new.
> > > >>
> > > >> Same question here --- will this break PVH dom0?
> > > >>
> > > > I haven't tested it as a part of this series. Is that a blocker here?
> > >
> > >
> > > I suspect dom0 will not do well now as far as hibernation goes, in which
> > > case you are not breaking anything.
> > >
> > >
> > > Roger?
> > 
> > I sadly don't have any box ATM that supports hibernation where I
> > could test it. We have hibernation support for PV dom0, so while I
> > haven't done anything specific to support or test hibernation on PVH
> > dom0 I would at least aim to not make this any worse, and hence the
> > check should at least also fail for a PVH dom0?
> > 
> > if (!xen_hvm_domain() || xen_initial_domain())
> >     return -ENODEV;
> > 
> > Ie: none of this should be applied to a PVH dom0, as it doesn't have
> > PV devices and hence should follow the bare metal device suspend.
> >
> So from what I understand you meant for any guest running on pvh dom0 should not 
> hibernate if hibernation is triggered from within the guest or should they?

Er no to both I think. What I meant is that a PVH dom0 should be able
to properly suspend, and we should make sure this work doesn't make
this any harder (or breaks it if it's currently working).

Or at least that's how I understood the question raised by Boris.

You are adding code to the generic suspend path that's also used by dom0
in order to perform bare metal suspension. This is fine now for a PV
dom0 because the code is gated on xen_hvm_domain, but you should also
take into account that a PVH dom0 is considered a HVM domain, and
hence will get the notifier registered.

> > Also I would contact the QubesOS guys, they rely heavily on the
> > suspend feature for dom0, and that's something not currently tested by
> > osstest so any breakages there go unnoticed.
> > 
> Was this for me or Boris? If its the former then I have no idea how to?

I've now added Marek.

Roger.

