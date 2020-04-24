Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE751B7125
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:45:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRutc-0003zP-H1; Fri, 24 Apr 2020 09:45:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Spwv=6I=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jRutb-0003yt-Gm
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:45:19 +0000
X-Inumbo-ID: 4e70c274-8610-11ea-83d8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e70c274-8610-11ea-83d8-bc764e2007e4;
 Fri, 24 Apr 2020 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587721518;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KC5N4t//BrdK/758khQBSQJypG6DLuN1uSuV+khPOdc=;
 b=S4RYbQXc32HuvLSOgvwdDiR4JaItvbC3uQlP/KxSbAU1A65nfkcZwGs+
 BHtx0vcNFG996+NWvJqno872whq1vqnQYQi313p0y34v+MMAdP4pWO1cA
 z45XfdwiNpyuHkyIaYt+ckMzE7O/DY2n3YPWTmPJqJYv1/ZFNk29QXXaW o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mln7FoVIliGeoGGILwNpKJ3MJzUgf1yttBJTr+I84JeHIDh7siYUXG4R9ialsfuXg8DSWfIfkO
 VlAQrjBQ0PSI8Ho++UZ2BP91MtYFWiRdqlBxH+RdO3pC5ZHdIfEYMI/ZSPOzmcaYHe7vwiwPZv
 XM2clDPPgmx+l1k9D+G00aZcmGfPwq72JA3oLZHKVsHSnCd1esjwqskvG0Z5xAZCDh1d48teSC
 AYqs85aJkFUpyqRKKzNplts+2mgLq6gaAau+CHF09XZmRLYI0TGA2K1KTVKBbEZSj4MnXAVbZK
 rmI=
X-SBRS: 2.7
X-MesageID: 16874873
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,311,1583211600"; d="scan'208";a="16874873"
Date: Fri, 24 Apr 2020 10:45:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v5 04/16] xen/build: have the root Makefile generates
 the CFLAGS
Message-ID: <20200424094505.GS4088@perard.uk.xensource.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-5-anthony.perard@citrix.com>
 <28aeea6d-cd52-d8bf-f114-96ec435363c6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <28aeea6d-cd52-d8bf-f114-96ec435363c6@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 06:40:33PM +0200, Jan Beulich wrote:
> On 21.04.2020 18:11, Anthony PERARD wrote:
> > Instead of generating the CFLAGS in Rules.mk everytime we enter a new
> > subdirectory, we are going to generate most of them a single time, and
> > export the result in the environment so that Rules.mk can use it.  The
> > only flags left to be generated are the ones that depend on the
> > targets, but the variable $(c_flags) takes care of that.
> > 
> > Arch specific CFLAGS are generated by a new file "arch/*/arch.mk"
> > which is included by the root Makefile.
> > 
> > We export the *FLAGS via the environment variables XEN_*FLAGS because
> > Rules.mk still includes Config.mk and would add duplicated flags to
> > CFLAGS.
> > 
> > When running Rules.mk in the root directory (xen/), the variable
> > `root-make-done' is set, so `need-config' will remain undef and so the
> > root Makefile will not generate the cflags again.
> > 
> > We can't use CFLAGS in subdirectories to add flags to particular
> > targets, instead start to use CFLAGS-y. Idem for AFLAGS.
> > So there are two different CFLAGS-y, the one in xen/Makefile (and
> > arch.mk), and the one in subdirs that Rules.mk is going to use.
> > We can't add to XEN_CFLAGS because it is exported, so making change to
> > it might be propagated to subdirectory which isn't intended.
> > 
> > Some style change are introduced in this patch:
> >     when LDFLAGS_DIRECT is included in LDFLAGS
> >     use of CFLAGS-$(CONFIG_INDIRECT_THUNK) instead of ifeq().
> > 
> > The LTO change hasn't been tested properly, as LTO is marked as
> > broken.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one further question:
> 
> > --- a/xen/arch/x86/Rules.mk
> > +++ b/xen/arch/x86/Rules.mk
[..]
> > +c_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
> > +a_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
> 
> Why are you also adding these to a_flags? It probably doesn't hurt,
> but I'd prefer if it was removed (could be done while committing if
> all acks arrive and other other need for av6 arises) if there's no
> clear need.

Those flags are already in a_flags (or previously AFLAGS). I've tried to
be careful to avoid changing the list of *flags in an already
complicated enough patch. I would like to keep this patch that way.

If the -D__OBJECT_LABEL__ and the stack-bondary flags aren't needed in
a_flags, it would be better to remove them in a separated patch, with
some explanation on why they are removed.

What is av6?

Thanks,

-- 
Anthony PERARD

