Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A472B0BA8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 18:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25996.54108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdGln-00028I-RL; Thu, 12 Nov 2020 17:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25996.54108; Thu, 12 Nov 2020 17:52:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdGln-00027v-Ni; Thu, 12 Nov 2020 17:52:27 +0000
Received: by outflank-mailman (input) for mailman id 25996;
 Thu, 12 Nov 2020 17:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zwMZ=ES=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1kdGll-00027q-Ii
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:52:25 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e15a3fc2-f6e3-4e06-830c-b1d07598f259;
 Thu, 12 Nov 2020 17:52:24 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1kdGlh-000BVF-1b; Thu, 12 Nov 2020 17:52:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zwMZ=ES=xen.org=tim@srs-us1.protection.inumbo.net>)
	id 1kdGll-00027q-Ii
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:52:25 +0000
X-Inumbo-ID: e15a3fc2-f6e3-4e06-830c-b1d07598f259
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e15a3fc2-f6e3-4e06-830c-b1d07598f259;
	Thu, 12 Nov 2020 17:52:24 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
	(envelope-from <tim@xen.org>)
	id 1kdGlh-000BVF-1b; Thu, 12 Nov 2020 17:52:21 +0000
Date: Thu, 12 Nov 2020 17:52:21 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 5/5] x86/p2m: split write_p2m_entry() hook
Message-ID: <20201112175221.GB43943@deinos.phlegethon.org>
References: <29d30de1-2a8d-aee2-d3c3-331758766fc9@suse.com>
 <7b2b7cc9-8828-41bd-7949-764161bbe7ff@suse.com>
 <20201110135944.hbsojy6eeyw53has@Air-de-Roger>
 <d73234b0-f22e-0783-3fbe-759ccb0ecc48@suse.com>
 <20201111121730.pblsf6inot5gixfc@Air-de-Roger>
 <7f916527-9a9c-8afe-5e5c-781554d1bd73@suse.com>
 <20201112130709.r3acpkrkyck6arul@Air-de-Roger>
 <51e646d4-3e1b-3698-c649-a39840275ec9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51e646d4-3e1b-3698-c649-a39840275ec9@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 15:04 +0100 on 12 Nov (1605193496), Jan Beulich wrote:
> On 12.11.2020 14:07, Roger Pau Monné wrote:
> > On Thu, Nov 12, 2020 at 01:29:33PM +0100, Jan Beulich wrote:
> >> I agree with all this. If only it was merely about TLB flushes. In
> >> the shadow case, shadow_blow_all_tables() gets invoked, and that
> >> one - looking at the other call sites - wants the paging lock held.
[...]
> > The post hook for shadow could pick the lock again, as I don't think
> > the removal of the tables needs to be strictly done inside of the same
> > locked region?
> 
> I think it does, or else a use of the now stale tables may occur
> before they got blown away. Tim?

Is this the call to shadow_blow_tables() in the write_p2m_entry path?
I think it would be safe to drop and re-take the paging lock there as
long as the call happens before the write is considered to have
finished.

But it would not be a useful performance improvement - any update that
takes this path is going to be very slow regardless.  So unless you
have another pressing reason to split it up, I would be inclined to
leave it as it is.  That way it's easier to see that the locking is
correct.

Cheers,

Tim.

