Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77A19B40E
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 18:55:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJgcQ-0001XC-P0; Wed, 01 Apr 2020 16:53:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eFaW=5R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jJgcP-0001X7-G5
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 16:53:33 +0000
X-Inumbo-ID: 5150f36c-7439-11ea-bb07-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5150f36c-7439-11ea-bb07-12813bfff9fa;
 Wed, 01 Apr 2020 16:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585760012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zX123BAEzGmB/JY6u3KHOvBHHk5VxaoX0VwJa0EQwZ8=;
 b=MdDXRy5zrC97YANRVZfY0JgIhNvVach0IkVk+YOcrpjfQY0OlRGw9x2+
 y6p69UQ0IZFH7ZP6akp1LgpI9GW7sbT73QwqCp9z51rvmt8q3qA+qRb7L
 A060Bb9qn4hqO/ssnXUpSTvv9fIRgpZ/wAc/AMji06sfvoJBe9hAXCsEw I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VIq4ZR+3leZ7SXaWn/vSHYaaKM6WWJl3MvHDMnYbCG082glRnGUh4YNqtuaAi2IJ/B/6qSvpq/
 1ucx5EVh4EZLXax6/DYcfeXYW138EzFNFL+6UNCKaficfWtVYqN7OstWuyL0lVCDaYLsO4WiEZ
 aZP0QYg73vd7LJl2v7R1uOcrVhngab34JKh9x/GFyXzLhQtWAaG6BVtQ0JosHyNsnj3tEkj2O+
 W0IUr1S+lMRuGjMyZw1Tfuc35mXdaNZn9Rh8XDpC0nb9hr7KSYpBF4JZq5BZ9Azb6u7rwauCjq
 RG8=
X-SBRS: 2.7
X-MesageID: 15027000
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,332,1580792400"; d="scan'208";a="15027000"
Date: Wed, 1 Apr 2020 18:53:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] timeout: adjust timeout when running nested tests
Message-ID: <20200401165323.GW28601@Air-de-Roger>
References: <20200401133740.64685-1-roger.pau@citrix.com>
 <24196.50465.468849.680260@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <24196.50465.468849.680260@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 01, 2020 at 05:45:21PM +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH] timeout: adjust timeout when running nested tests"):
> >  sub target_adjust_timeout ($$) {
> >      my ($ho,$timeoutref) = @_; # $ho might be a $gho
> > +    my $nestinglvl = $ho->{NestingLevel} || $ho->{Host}{NestingLevel};
> 
> I think this wannts to be // not ||.  If you agree I will fix this up
> and commit.

Yes, I agree.

> Since what this does otherwise is to take all baremetal hosts and give
> them an empty Host hash due to autovivification.
> 
> > +    if ($nestinglvl) {
> > +        $adjust->(1 << $nestinglvl, "nesting level");
> > +    }
> 
> I still think the use of << is very odd and I can't resist moaning
> about it.  But you're the patch author so I will let you choose the
> style here.

Feel free to change to 2 ** $nestinglvl at commit, you are the
maintainer so it's important that you can read the code easily.

Thanks, Roger.

