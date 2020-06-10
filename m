Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642D1F5523
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:47:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj089-0004lR-46; Wed, 10 Jun 2020 12:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jj087-0004lM-CJ
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:46:55 +0000
X-Inumbo-ID: 7525f4b6-ab18-11ea-bca7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7525f4b6-ab18-11ea-bca7-bc764e2007e4;
 Wed, 10 Jun 2020 12:46:52 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IOxINSA+UxuA5GreV127XwoCoD48f/pHDw4nhs5FlCzjJN+fnZRg3DoGI9fIinbZ0GU26qw81a
 C7mvgSlkpKBHHA5o0UQ4SsJlTFNDAj1PLegxtAZURnbW7jPVRWhf/Xs9y0sPQzEgybBfPP3FGP
 98vHRjvsXTcqm+Ii6stmcB6WMRK/sSatu9+5An6pxvLipjD845Sf18LS4e2TUJq21jaUUvURIY
 AbMAmMEmDU9w2geST+3rETiXtX9JBmUPrYWbxrRBBbtSPgKWET8+4n2A1B6F0h7UIxEN9/XZro
 2bs=
X-SBRS: 2.7
X-MesageID: 19976294
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="19976294"
Date: Wed, 10 Jun 2020 14:46:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.14 2/2] x86/passthrough: introduce a flag for GSIs
 not requiring an EOI or unmask
Message-ID: <20200610124645.GB4920@Air-de-Roger>
References: <20200610115103.7592-1-roger.pau@citrix.com>
 <20200610115103.7592-3-roger.pau@citrix.com>
 <c70eef2d-d780-6d76-decb-e921cf6a570c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c70eef2d-d780-6d76-decb-e921cf6a570c@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 10, 2020 at 01:37:15PM +0100, Andrew Cooper wrote:
> On 10/06/2020 12:51, Roger Pau Monne wrote:
> > @@ -920,6 +927,11 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
> >          if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
> >          {
> >              hvm_gsi_assert(d, pirq->pirq);
> > +            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
> > +            {
> > +                spin_unlock(&d->event_lock);
> > +                return;
> > +            }
> 
> Urgh.  Could I possibly talk you into fixing hvm_dirq_assist() to have a
> "goto out;" and a single unlock path ?  (How far are you expecting this
> to be backported?)

I was very tempted to go that way but didn't want to introduce more
churn. Since you agree I will do so.

> I'm also totally unconvinced that the atomic test_and_clear() needs to
> be done with the event lock held (it should either be non-atomic, or the
> locking should be inside the if() condition), but that is probably not a
> can of worms wanting opening right now...

There's some reasoning about all this in 104072fc1c7e6ed. I also think
naming it masked is confusing, since the underlying interrupt might
not be masked. Anyway, this seems like something I don't really want
to get into now, as it seems quite fragile.

Thanks, Roger.

