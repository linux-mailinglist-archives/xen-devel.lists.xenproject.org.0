Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9771B7803
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:07:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRyzB-0002fz-8P; Fri, 24 Apr 2020 14:07:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Spwv=6I=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jRyz9-0002fu-Ni
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:07:19 +0000
X-Inumbo-ID: e87e1ec4-8634-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e87e1ec4-8634-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587737238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tdCk5NXIzJ3aa4ezT7t27R1n91s1HsX8DnS3V9B1Sco=;
 b=AB48RIToMQinoCCXRwNwIMJl2vWsPeL3O7UKrMkq5OD2nJnbftIdCuAt
 JhNkHg+551kr00Tze2QiTTXLO8ofObtGothzE7/3l29/hYJy17ca/mqe3
 C71jCakMsVJKpgYuUBkkCxeRv9PjTSTEmGh2vW9A20gje/bKW+lo7ZPEl w=;
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
IronPort-SDR: cey8LrZ7vIdQ0V6oONVijFNET9rKgbRUzpu1sMQQ2nLAWU9yw0TyLnsuJjpk0U+FIzajPLT6gz
 rlClEEsOGsFpgyqGWkUmmnr0KW1EPoN2vpruaDzPErRw33iZobrHLfLemqY1maBd3Itw9mImin
 w7l46ffMc70vfZ6q1wKrM5xI4vXUGBDPxD4wirtMsdEivthQ86UgUSzId6okGFM24zNdFIMzN4
 auVNFo5LUQpZVR1eQXFeMwyI6dnmlQaCNsxTgaKy/fbfxUvnLJoZv7qI9yD+GYWqNT1PzSFjoC
 vgI=
X-SBRS: 2.7
X-MesageID: 16889590
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,311,1583211600"; d="scan'208";a="16889590"
Date: Fri, 24 Apr 2020 15:07:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v5 04/16] xen/build: have the root Makefile generates
 the CFLAGS
Message-ID: <20200424140712.GU4088@perard.uk.xensource.com>
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-5-anthony.perard@citrix.com>
 <db4f1e4f-1ffc-522a-4b2f-9eb2315d1acc@suse.com>
 <20200424133053.GT4088@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200424133053.GT4088@perard.uk.xensource.com>
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

On Fri, Apr 24, 2020 at 02:30:56PM +0100, Anthony PERARD wrote:
> On Fri, Apr 24, 2020 at 03:01:32PM +0200, Jan Beulich wrote:
> > While committing this, in my pre-push build test I noticed that
> > presumably an earlier change of yours has caused
> > 
> > Makefile:103: include/config/auto.conf: No such file or directory
> > Makefile:106: include/config/auto.conf.cmd: No such file or directory
> > 
> > for a build in a completely fresh tree.
> 
> Are those presumably "warning" an issue? Are the files still missing
> after make has run? Didn't the build managed to build xen.gz?
> There is maybe a line saying that make will re-execute.
> 
> I've seen those error before, on older version of make. But it's just
> make complaining before even trying to update/create those files. But it
> just create those files and start over.
> 
> Also, that would be patch "build: include include/config/auto.conf in
> main Makefile" which introduce this behavior.

I'll prepare a patch to use "-include" instead of simply "include". That
will silent the warnings and nothing else should change. Linux's Kbuild
doesn't have this issue because we have to run `make menuconfig` or
equivalent which also generates the two auto.conf* files, which I didn't
notice until now.

-- 
Anthony PERARD

