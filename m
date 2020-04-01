Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F66419B47E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 19:05:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJgl5-0002QO-St; Wed, 01 Apr 2020 17:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FQpd=5R=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jJgl4-0002QH-1z
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 17:02:30 +0000
X-Inumbo-ID: 914d6ed6-743a-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 914d6ed6-743a-11ea-b4f4-bc764e2007e4;
 Wed, 01 Apr 2020 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585760548;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=7azaohadNzDlSs+VA/4tbV5wnDOXgrMFCe3JNGE/aVQ=;
 b=H0duFxXrWcsbLTPYf27AV6J/j0ZaXurr+e8nQvg3yKmKwywCqyx8/yD5
 G3ijhV87iwFdomsxsyMtWc01/u7ImHQqETM6BaCBovTCLT76mN2b92nj/
 8YIeHoQGEfvh0N735Iz/5csVoxxc/nMFrSUEceZttGiu9SXRrtk6Aj+7b s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q0opW24jxZWcBJBwQEzqmXXZkC//7cvxYhdoWEd+An7hij7Upyz215mweG/FJ9YVvDr0nqbiMf
 doGZjlW1ogaISq5VVziRMXnzBxvOM8+/lLeuG4l6eLAR5vWHxIL4PqzQ2IdTJHCVzOV+8ceCC+
 AKmNJmSpa+o26IAdfc9hANvBWlOyHjw3jFLYjaIiN2XDa/7lhnXZ/mu5heWh/hNp8KBXG29QFn
 EfIqZDnUwZCagx28Q6L8bIOnyro3isBN+VvrnnSX7d+RURz38/FLgcHCDF+LOKddeArbwJL/BP
 eQ0=
X-SBRS: 2.7
X-MesageID: 15423654
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,332,1580792400"; d="scan'208";a="15423654"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24196.51487.713023.72745@mariner.uk.xensource.com>
Date: Wed, 1 Apr 2020 18:02:23 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] timeout: adjust timeout when running nested tests
In-Reply-To: <20200401165323.GW28601@Air-de-Roger>
References: <20200401133740.64685-1-roger.pau@citrix.com>
 <24196.50465.468849.680260@mariner.uk.xensource.com>
 <20200401165323.GW28601@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("Re: [PATCH] timeout: adjust timeout when running nested tests"):
> On Wed, Apr 01, 2020 at 05:45:21PM +0100, Ian Jackson wrote:
> > I think this wannts to be // not ||.  If you agree I will fix this up
> > and commit.
> 
> Yes, I agree.

Thanks, done and pushed.

> > Since what this does otherwise is to take all baremetal hosts and give
> > them an empty Host hash due to autovivification.
> > 
> > > +    if ($nestinglvl) {
> > > +        $adjust->(1 << $nestinglvl, "nesting level");
> > > +    }
> > 
> > I still think the use of << is very odd and I can't resist moaning
> > about it.  But you're the patch author so I will let you choose the
> > style here.
> 
> Feel free to change to 2 ** $nestinglvl at commit, you are the
> maintainer so it's important that you can read the code easily.

I'll keep the version you tested rather than messing about with it...

Ian.

