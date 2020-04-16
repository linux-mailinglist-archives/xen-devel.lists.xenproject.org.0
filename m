Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77D41AC1FF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 15:03:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP4AS-0007aC-BZ; Thu, 16 Apr 2020 13:02:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IxKm=6A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jP4AQ-0007a7-QC
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 13:02:54 +0000
X-Inumbo-ID: 957c1580-7fe2-11ea-b4f4-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 957c1580-7fe2-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587042174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=78aAS1DK5EK3sN71rJ8l+oNrB/KTy52SFf9RuDGv1D4=;
 b=ck17y7RFg2RDbRwlbrSuMy7uanu8N7oHyhZ3V++TRmlqOjxSBsyf4nVI
 G+iv6vMEobE2wmCr0coN3NpzC5cNVxYNQQj/Dg6lcqA7pd8k4Vemchm7E
 WpG0zq5QoI5WRMQivdTIO8ewZyUW+K+nT7LFJslbpaPdjmX4e1wzNGoaQ g=;
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
IronPort-SDR: BzDhvdJnMfoe/lrzX0RnpY4nQ2XmaDAFz9YGibL2yuHsjM8AGb9dyzRa95VR/vuBlkrs0zrwmr
 7kBhTSCw50Vs60AHc2Z0GtjTayXPOEF88HKap/jpvfo6uuifdGd5eD42/1D3hnwg9ZotTAyOWu
 zIiw/fFaHPXRuvG2GB3UxiA04jzHdrvcZJzW0M6sYUNe/CeVuA45o/JwXLmGtTaR4O3OqNvWUe
 0uqABbkXh5KX2StTwGF+4prktFVqyWKMD5mqgUKc1uiHqDscCU9dFfgNeXkxc8lSgrqLLjMlZr
 ycM=
X-SBRS: 2.7
X-MesageID: 16178422
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="16178422"
Date: Thu, 16 Apr 2020 14:02:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 16/18] build,xsm: Fix multiple call
Message-ID: <20200416130250.GI4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-17-anthony.perard@citrix.com>
 <809cba94-cebf-29c6-39d5-31ec41bdbdc4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <809cba94-cebf-29c6-39d5-31ec41bdbdc4@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 03:28:06PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:31, Anthony PERARD wrote:
> > Both script mkflask.sh and mkaccess_vector.sh generates multiple
> > files. Exploits the 'multi-target pattern rule' trick to call each
> > scripts only once.
> 
> Isn't this a general fix, which may even want backporting? If so,
> this would better be at or near the beginning of the series.

It is mostly a performance improvement, avoiding doing the same thing
several time. I don't think anything bad happens from concurrent calls,
or we would already have bug report I think. But I can try to move the
patch up.

> > --- a/xen/xsm/flask/Makefile
> > +++ b/xen/xsm/flask/Makefile
> > @@ -26,14 +26,14 @@ mkflask := policy/mkflask.sh
> >  quiet_cmd_mkflask = MKFLASK $@
> >  cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
> >  
> > -$(FLASK_H_FILES): $(FLASK_H_DEPEND) $(mkflask) FORCE
> > +$(patsubst include/%,\%/%,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
> 
> Since what $(FLASK_H_FILES) contains is well under our control,
> how about the simpler
> 
> $(subst include/,%/,$(FLASK_H_FILES)): ...
> 
> ? Preferably with this and preferably with it moved ahead
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'll do that, thanks,

-- 
Anthony PERARD

