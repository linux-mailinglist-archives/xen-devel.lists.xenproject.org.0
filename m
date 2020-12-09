Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A458C2D481C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 18:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48602.85956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn3Rn-0006Gx-8G; Wed, 09 Dec 2020 17:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48602.85956; Wed, 09 Dec 2020 17:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn3Rn-0006GY-4a; Wed, 09 Dec 2020 17:40:15 +0000
Received: by outflank-mailman (input) for mailman id 48602;
 Wed, 09 Dec 2020 17:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atyx=FN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kn3Rl-0006GT-Te
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 17:40:13 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c569f61-6e31-4f57-9192-45b3fe65b19d;
 Wed, 09 Dec 2020 17:40:12 +0000 (UTC)
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
X-Inumbo-ID: 5c569f61-6e31-4f57-9192-45b3fe65b19d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607535612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oqB04BnwV8YKEAA5lwVIHzO7kV7aixxFQohMpXRA2wM=;
  b=Bn/Ev2gpq5BssnRDoRi1q/ZloewFlx5Ye4dnH0rihX80YPLclLPPjRRq
   b9i2olpmjATeeVEjHZQ8NIb/gizCJziMjMS5M6QTCnMC1l/O05HFnsXII
   OrxtxeSj5mkmRnXxH+9n/znBBIJRho6IYsl2GkVPn62jfrbmno7CEABJ0
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GdC42mKzGq431WnKJvGb0mIJlS1Ea7JCAdUR8TFSGJ6TnlKlbkhAb2h5kDZXboXXYKZ3Be8gND
 Ey2va32GN39YapDsbctRl4zEvLkD6iGpNylkDhV6m6tbjvhgkJpmGUFewcmqaYHo3IMfrSqM3f
 pLL49Wel5OqCU/PFmjXLWmsRHfPnGX/uYbb9VvFLzl9Io05QJWFfok8wRpq+0zG4KXvfcuB8OW
 bJf5OrkMCBZXFUK96hGysaEYB8O5QMhwpjsSSeKRhYke89WiANTgqR1rN5OC/Wmg7aM2pKQMAE
 1qs=
X-SBRS: 5.2
X-MesageID: 32880971
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,405,1599537600"; 
   d="scan'208";a="32880971"
Date: Wed, 9 Dec 2020 17:40:07 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 1/8] xen: fix build when $(obj-y) consists of just
 blanks
Message-ID: <X9EL90SMyqrs9GaL@perard.uk.xensource.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <511be84d-9a13-17ae-f3d9-d6daf9c02711@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <511be84d-9a13-17ae-f3d9-d6daf9c02711@suse.com>

On Mon, Nov 23, 2020 at 04:20:52PM +0100, Jan Beulich wrote:
> This case can occur when combining empty lists
> 
> obj-y :=
> ...
> obj-y += $(empty)
> 
> or
> 
> obj-y := $(empty) $(empty)
> 
> where (only) blanks would accumulate. This was only a latent issue until
> now, but would become an active issue for Arm once lib/ gets populated
> with all respective objects going into the to be introduced lib.a.
> 
> Also address a related issue at this occasion: When an empty built_in.o
> gets created, .built_in.o.d will have its dependencies recorded. If, on
> a subsequent incremental build, an actual constituent of built_in.o
> appeared, the $(filter-out ) would leave these recorded dependencies in
> place. But of course the linker won't know what to do with C header
> files. (The apparent alternative of avoiding to pass $(c_flags) or
> $(a_flags) would not be reliable afaict, as among these flags there may
> be some affecting information conveyed via the object file to the
> linker. The linker, finding inconsistent flags across object files, may

How about using $(XEN_CFLAGS) instead of $(c_flags)? That should prevent
CC from generating the .*.o.d files while keeping the relevant flags. I
was planing to do that to avoid the issue, see:
https://lore.kernel.org/xen-devel/20200421161208.2429539-10-anthony.perard@citrix.com

> then error out.) Using just $(obj-y) won't work either: It breaks when
> the same object file is listed more than once.

Do we need to worry about having a object file been listed twice?
Wouldn't that be a mistake?

-- 
Anthony PERARD

