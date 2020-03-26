Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C0194039
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 14:47:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHSmZ-0004vg-Uo; Thu, 26 Mar 2020 13:42:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKeT=5L=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jHSmY-0004vb-OW
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 13:42:50 +0000
X-Inumbo-ID: ae429700-6f67-11ea-a6c1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae429700-6f67-11ea-a6c1-bc764e2007e4;
 Thu, 26 Mar 2020 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585230170;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hDagpFSYC9QYo9/6TyXfw+loCeWTni0J0+KRQtQW4Ig=;
 b=hIsk3sTE+oBTVQjc/gJfBlm9DvSKwR0lsw92wSSud0AX1Fa2D6sRbOsb
 LmFvDlMzYcc4CBj4KaW3zpTdV4NdcBVwg7ElSCbgXzeyyPXHiz7iu+qcy
 WbAwiDDODcxwwdNa1fMteEDMSRA3ci+MvDxmyTfwB9jlAHp/6NWwk8SlR k=;
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
IronPort-SDR: xTxMNpWeE+uwX3nr45wlL6onOYWvhyyUIBy74LO65hFfqLkO05w4EVLkR8W5Jw4DDKQPDLYkDZ
 uXdz8RO9MyCFE8XlPLeVEgW6vu7OxpO4J+2TOnXQup4/+P90NyzrjZWvvesn61l1/it0Itp/0P
 jrOg8xzgOYDS7k0w83MWS/nWsXu/zW0vmqxImDSy/8CIk9G17Egu7nqRynuqTISt9CFXidJJkz
 ybDhUSqW+l4lPFAd8yOtvSahFyH1wTlBi+Jfq75o4yemKInHVuprr6FJjNgx1lOy1yBlBBgxsu
 +9I=
X-SBRS: 2.7
X-MesageID: 14895952
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="14895952"
Date: Thu, 26 Mar 2020 13:42:41 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200326134241.GP4088@perard.uk.xensource.com>
References: <6fa81b4d-528d-5c33-50c5-a18396b4383a@suse.com>
 <2c83b876-6fd8-1315-3b28-b45e877187aa@suse.com>
 <7147e3a1-b237-7a2b-d623-b364704d0096@citrix.com>
 <bdeb57d1-71b4-6908-096f-d536b4bacbba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bdeb57d1-71b4-6908-096f-d536b4bacbba@suse.com>
Subject: Re: [Xen-devel] [PATCH v5 03/10] x86: determine HAVE_AS_* just once
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau
 Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 10:50:48AM +0100, Jan Beulich wrote:
> On 25.03.2020 22:12, Andrew Cooper wrote:
> > All the requisite infrastructure looks to be already present.
> 
> ... there's the one open prereq question of what happens upon
> tool chain updates. It's not clear to me if/how kconfig would
> get invoked despite none of the recorded dependencies having
> changed in such a case. (I'm sure you realize there's no issue
> with this when the determination occurs out of a makefile.)

We might need one small change for this to happen, it is to add a
comment in .config which display the output of `$(CC) --version | head
-1`. Simple :-).
If the output of `$(CC) --version` changes, kconfig will run again. That
would be enough to detect tool chain updates, right?

Have a look at "include/config/auto.conf.cmd" to find out how kconfig is
forced to run again.

I'll prepare a patch.

-- 
Anthony PERARD

