Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D811AC1E3
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:57:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP44z-0006dH-Af; Thu, 16 Apr 2020 12:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IxKm=6A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jP44x-0006dC-Ox
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:57:15 +0000
X-Inumbo-ID: cb411716-7fe1-11ea-8b89-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb411716-7fe1-11ea-8b89-12813bfff9fa;
 Thu, 16 Apr 2020 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587041834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KjAHFwFGo3xfJkkoWvq/QGOD0tYBgW5BJ5r6B2qu7GI=;
 b=gxerxzcNPJbwZqnoWCFs1YAQW8TG/kOZ+QtvDF3XdL9ErKHaLrkvo6cL
 /HpN16m1edbsAPkJ9D+fhqnCLFFBSgC5AK3+RPv9JMdKEPj3WIySWMC3X
 Y9pRW/09xhALirnf7tJyX3b8YlJy6Rvxea/SUut38xrUMFfXrMBonGv5t o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xq/EouRQn3r2pn52OH+eeEWFrtYNFerqQ5R1/qiSotgRfTdDY7UDmONykEDiB6YUdBKMMgHvq9
 TuzIatMM4Vns4i6qDjUYlGQUANDmQI2vDXMlYdIm65+MeAISs2uJwCpeQX+OR0szAJLBx59kvd
 ms0wI3VThwj68Ulx2QoBDepZKCnma+XFyEOfKu8wg3Fujp3OCLrQgEGL5XWjYXiAA2RTGPT/yk
 Uj5hEG93CeZO7P/kTnjTYH1Huub+akg8HTdLJ0ayheq+m8CeP/SWLdYkMjRnhUDckoo/ORa4i7
 LNE=
X-SBRS: 2.7
X-MesageID: 16017330
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="16017330"
Date: Thu, 16 Apr 2020 13:57:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 15/18] xen/build: use if_changed to build guest_%.o
Message-ID: <20200416125708.GH4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-16-anthony.perard@citrix.com>
 <9bf47db9-e3cf-fffd-cfb2-18dec2317c91@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9bf47db9-e3cf-fffd-cfb2-18dec2317c91@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 03:02:21PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:30, Anthony PERARD wrote:
> > Use if_changed for building all guest_%.o objects, and make use of
> > command that already exist.
> > 
> > This patch make a change to the way guest_%.o files are built, and now
> > run the same commands that enforce unique symbols. But with patch
> > "xen,symbols: rework file symbols selection", ./symbols should still
> > select the file symbols directive intended to be used for guest_%.o
> > objects.
> 
> I'm having trouble making the connection between the change to the
> symbols tool and the adjustments made here:

The change to symbol tool is to allow this change.

> > --- a/xen/arch/x86/mm/Makefile
> > +++ b/xen/arch/x86/mm/Makefile
> > @@ -11,11 +11,13 @@ obj-y += p2m.o p2m-pt.o
> >  obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o
> >  obj-y += paging.o
> >  
> > -guest_walk_%.o: guest_walk.c Makefile
> > -	$(CC) $(c_flags) -DGUEST_PAGING_LEVELS=$* -c $< -o $@
> 
> The original rules didn't do anything special to arrange for the
> resulting kallsyms names; these arrangements instead live at the
> top of the respective source files, in the form of asm()-s.

They still are. I try to consolidate the number of location which have
command that build a target. Those guest_%.o object aren't special
enough to deserve to be built in a different way than every other
object. They do need a different make rule, but they can use the same
command.

Thanks,

-- 
Anthony PERARD

