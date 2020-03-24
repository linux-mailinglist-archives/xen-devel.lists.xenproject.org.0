Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0519141F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 16:22:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGlKa-0004nv-Km; Tue, 24 Mar 2020 15:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGlKa-0004np-0X
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:19:04 +0000
X-Inumbo-ID: cb55e530-6de2-11ea-92cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb55e530-6de2-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585063143;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6LOjiTIVe0ip8RBIwrOdFf2Q/ZkDUMV510H16AjP3w0=;
 b=T2DsEFHedBpEGJu6j2/G5yHXtG2cUfWcvmhXHzshQrg/+kZxMK1vUvlG
 iCDle/m4EX2iUL0ZrczpmOSUDL7EXVFaNxCmNbZw8IMRJVTzTGxg8kFuC
 vxaPm2iNheDf24DskW4U4NugMmWruQrwrHr+WPtNJ0HH3CvJZI4P0vBn0 w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5QemCl6wBFURva8W8zngtn0vw7DZLMoApUhs2KNokvO6J7wrheWdq0sBNQtQuAVqe/HwcBjg24
 fuoo7Jlj9xunwMlUvnVdgHmnNGMLZ2291cAV0fLzmF6bX8VllYrOE97NcW0Wt/w285qq1X67ls
 C8qtHaqDGmUp6rXBws+UVv0LuzkTT3QQRNVrPcBTcyGKTjMKKWoaoJoBpIZX42B4S69ICO9gyt
 UCvBVaXHNRrsJpypyPIQcSmmZp8JnSz05tzmFCE6spv5QiUdapOlo3Aq4tvHYPvA3v2k0Hrl3t
 z2A=
X-SBRS: 2.7
X-MesageID: 15195379
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="15195379"
Date: Tue, 24 Mar 2020 16:18:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200324151855.GN24458@Air-de-Roger.citrite.net>
References: <20200324150015.50496-1-roger.pau@citrix.com>
 <42a7b408-1ea1-04fa-e70b-cbdaba54c558@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42a7b408-1ea1-04fa-e70b-cbdaba54c558@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] xen: expand BALLOON_MEMORY_HOTPLUG
 description
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 04:13:48PM +0100, Jürgen Groß wrote:
> On 24.03.20 16:00, Roger Pau Monne wrote:
> > To mention it's also useful for PVH or HVM domains that require
> > mapping foreign memory or grants.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: xen-devel@lists.xenproject.org
> > ---
> >   drivers/xen/Kconfig | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> > index 61212fc7f0c7..57ddd6f4b729 100644
> > --- a/drivers/xen/Kconfig
> > +++ b/drivers/xen/Kconfig
> > @@ -19,6 +19,10 @@ config XEN_BALLOON_MEMORY_HOTPLUG
> >   	  It is very useful on critical systems which require long
> >   	  run without rebooting.
> > +	  It's also very useful for translated domains (PVH or HVM) to obtain
> 
> I'd rather say "(non PV)" or "(PVH, HVM or Arm)".

I'm fine with any of the variants. Would you mind adjusting when
picking it up or would you like me to resend?

> > +	  unpopulated physical memory ranges to use in order to map foreign
> > +	  memory or grants.
> > +
> >   	  Memory could be hotplugged in following steps:
> >   	    1) target domain: ensure that memory auto online policy is in
> > 
> 
> With that:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks!

