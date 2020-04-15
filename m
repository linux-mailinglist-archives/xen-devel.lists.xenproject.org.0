Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E581AA96A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOikf-0000GI-IS; Wed, 15 Apr 2020 14:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NCA0=57=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jOike-0000G9-Qa
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:10:52 +0000
X-Inumbo-ID: e9d1e788-7f22-11ea-b58d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9d1e788-7f22-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586959852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U+ELunXxu2T17jTs1dYsbxn04Pb6u8YpFuruJyTrt8U=;
 b=JGaPWqvCB648CzIYtGOXSMDHr7WBGA+CrqNQvml5SXuVcYERG8MDDcHx
 x9RxhsTyUX/aq1/bjGT8t3UnsG9Nyg/DvxKrXqONKbB4SUzYQkmtIkI6j
 Ht3yMHlteYdj5TmGNCKPIkUwA6JYY3qa6R6+HUoMEO+Svm/dpLJewfos0 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +gOrhGCOHPGIv4rjaKsHQgMaEN5V5joxLzSa9KUZiEzcX0qM94671z/LagFOQfEeSKhypNY3bx
 VGckw5+yAZIKCyxDcqiu5EZsxmNapT/F/+knpRkGTO6cOxUgjSl7JTRaThFOM0wuG0GbONurf9
 9qjBEo/COqI4ua545lzUR6SKYP1INGgXDtvr0xs/cMW0IqiP3DLjZ87X5mECvoOoMmE4Xa5ED2
 pdKTdiTGl1HBgrjH7QRyH/Ka3kq7D5ALJK+M9O4Wx6L1P8F6so6xqg6A65EVihYt/BEUI3fO6m
 mkI=
X-SBRS: 2.7
X-MesageID: 16120068
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="16120068"
Date: Wed, 15 Apr 2020 15:10:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 06/18] xen/build: have the root Makefile generates
 the CFLAGS
Message-ID: <20200415141045.GB4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-7-anthony.perard@citrix.com>
 <a2b16a74-4eed-eeae-d791-fa9fd4e63d08@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a2b16a74-4eed-eeae-d791-fa9fd4e63d08@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 01:50:33PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:30, Anthony PERARD wrote:
> >  # Always build obj-bin files as binary even if they come from C source. 
> > -$(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))
> > +# FIXME LTO broken, but we would need a different way to filter -flto out
> > +# $(obj-bin-y): CFLAGS := $(filter-out -flto,$(CFLAGS))
> 
> While you mention this in the description, I'm still not overly
> happy with it getting commented out. What's wrong with making the
> construct simply act on c_flags?

It doesn't work.

I tried
    $(obj-bin-y): c_flags := $(filter-out -flto,$(c_flags))
but the $@ expansion was empty.

I guess we could do:
    $(obj-bin-y): XEN_CFLAGS := $(filter-out -flto,$(XEN_CFLAGS))
that's probably enough for now. Even if we can't test it properly.

-- 
Anthony PERARD

