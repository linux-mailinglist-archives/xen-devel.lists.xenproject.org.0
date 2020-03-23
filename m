Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDF618F85B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 16:16:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGOkG-0001g4-S3; Mon, 23 Mar 2020 15:12:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jqku=5I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGOkF-0001fz-Oo
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 15:12:03 +0000
X-Inumbo-ID: a6356d86-6d18-11ea-b34e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6356d86-6d18-11ea-b34e-bc764e2007e4;
 Mon, 23 Mar 2020 15:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584976323;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nI+tA/Ao5jCVIwg+pkiNkHdYRRrGR5fFqbun+08s8Ho=;
 b=Cp6ZFWXByXB17J87V5lNEbKwQiwwHRIlujRUwlBip28cc2x3rfVJHLt/
 oK5ZSps5newcXMK1QnnoszqbPKOqH6jPmwPHoZwK9AB0D532oSFX21Wy/
 KE3y3txWR9HI+sl1vE+Y2ZSawr0Nbi9Qh0Tk0wzD2L1tTPtjNDxN02AKk U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3u7IKaosBhYvQljNKygxCYGayFRPpgRtgF0IiekYpXzZnXFbcWd/wnUDvIWPpAHgrTm1TcGz3z
 s0agmgS4jKd49aWpTDRd00AduNrOYrazHtIH2gT61yBMk609VPEzw4TuDNF+u65nS2s4C4glNe
 FVqExYCONZQ8HTs/WQXTOjocT4fptM+gqHbLMLHGorMc+8hk4OuX+smuBVH9vKouTv5Sv0B52K
 GeJSzvc2pwOoUzgQf4/MVXp1yeK1I7D0ioYhD6/TCFQbtsm/gUlAeK/A+zTbqRp95UJTNJEjPR
 QRU=
X-SBRS: 2.7
X-MesageID: 14681739
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="14681739"
Date: Mon, 23 Mar 2020 16:11:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v3 15/23] xen/build: have the root Makefile generates
 the CFLAGS
Message-ID: <20200323151153.GD24458@Air-de-Roger.citrite.net>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-16-anthony.perard@citrix.com>
 <20200227110504.GN24458@Air-de-Roger.citrite.net>
 <20200317180524.GA4088@perard.uk.xensource.com>
 <20200319162412.GH4088@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200319162412.GH4088@perard.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 19, 2020 at 04:24:12PM +0000, Anthony PERARD wrote:
> On Tue, Mar 17, 2020 at 06:05:24PM +0000, Anthony PERARD wrote:
> > On Thu, Feb 27, 2020 at 12:05:04PM +0100, Roger Pau Monné wrote:
> > > On Wed, Feb 26, 2020 at 11:33:47AM +0000, Anthony PERARD wrote:
> > > > +ifneq ($(CONFIG_CC_IS_CLANG),y)
> > > > +# Clang doesn't understand this command line argument, and doesn't appear to
> > > > +# have an suitable alternative.  The resulting compiled binary does function,
> > > > +# but has an excessively large symbol table.
> > > > +CFLAGS += -Wa,--strip-local-absolute
> > > 
> > > This is not really related to clang, but to the assembler. If clang is
> > > used with -no-integrated-as it's quite likely that the GNU assembler
> > > will be used, and hence this option would be available.
> > > 
> > > Can we use cc-option-add here in order to detect whether the build
> > > toolchain support the option?
> > 
> > That can be done, but I think I'll do that as a follow up of this patch,
> > to avoid too many changes when moving the cflags around.
> > 
> > > Ideally this should be done after the integrated assembler tests
> > > performed in x86/Rules.mk.
> 
> So, testing for the -Wa,--strip-local-absolute flags turns out to be
> more complicated than I though it would be.
>  - cc-option-add doesn't work because it doesn't test with the current list
>    of CFLAGS. And if I add the CFLAGS, clang says the option is unused,
>    it doesn't matter if -no-integrated-as is present or not.

Oh, that seems like completely bogus clang behavior. It's my
understanding (from reading the manual) that whatever gets appended to
-Wa,<arg> is just passed to the assembler, in which case the compiler
has no idea whether it's used by it or not.

Which version of clang did you use to test it?

Isn't it fine to just attempt to test if it works, and if the compiler
complains just don't append it? (regardless of whether
-no-integrated-as is used or not)

>  - I tried to use as-option macro from Linux but that comes with issues
>    as well. I don't think that enough work as been done to make it work
>    well with clang. (I probably need to filter -Wall out of the CFLAGS
>    when testing, and they are probably other issues.)
> 
> So I think I leave the enhancement for later. Having the flag depends
> on GCC is good enough for now.

Right, until clang adds support for it there's no pressure.

Thanks, Roger.

