Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489D190CFB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 13:03:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGiEw-0003L6-My; Tue, 24 Mar 2020 12:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGiEv-0003Kx-Aq
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 12:01:01 +0000
X-Inumbo-ID: 209356de-6dc7-11ea-a6c1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 209356de-6dc7-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585051261;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P25KtgLleCWjdUiEs0KU2hJCXfC5tUsTLpfQuYgiL9E=;
 b=HgXKzMWcFECnRcwhGL0teFC9PnA4vppfdslBS7EDMw5awjfiQWv0M3kE
 vcjTgqApJxUe7Y++i7JfHNwuDQlBRcgu574BtkbMcqCpvO8WBcWr4T7S+
 yWh2Dk0V9AM+v1XjCQ3gwChklxF+ht37o/ZkOC2uxNBeFR5ogif63SEg4 s=;
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
IronPort-SDR: +Vmmq+LxuRvKOgqWcEkQg4r7oSqrMjujF9pmMGwNP63T7j7MAllgfiiZocPpsRuaWOfXtsLFBZ
 XD/mHDvQL5nFFx3+u4NAzLswSY8RCuirzyl9Z64SQAZ4wbPxLZC4S3gXfvoNqCXH/WFZJuVTKF
 H/doQpZT0dwN9Q6fc+6TKhOncW7C/jsNDOpHerrZSS60V9doYNUUEYI5j0Hzeo97Q8mSmGsUbO
 YAIOYWhqThMjBUWuBz1fNP1FhHObm5x1NQyfA+6b5QeZYWYjV3+cj29VI4klGKRvZHd0csXDGG
 1UE=
X-SBRS: 2.7
X-MesageID: 14534785
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14534785"
Date: Tue, 24 Mar 2020 13:00:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>
Message-ID: <20200324120050.GK24458@Air-de-Roger.citrite.net>
References: <20200323143835.46117-1-roger.pau@citrix.com>
 <24185.62757.192771.632832@mariner.uk.xensource.com>
 <24185.62908.869446.447190@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24185.62908.869446.447190@mariner.uk.xensource.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH OSSTEST] kernel-build: enable
 XEN_BALLOON_MEMORY_HOTPLUG
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Adding Juergen and Boris for feedback.

On Tue, Mar 24, 2020 at 11:57:48AM +0000, Ian Jackson wrote:
> Ian Jackson writes ("Re: [PATCH OSSTEST] kernel-build: enable XEN_BALLOON_MEMORY_HOTPLUG"):
> > Roger Pau Monne writes ("[PATCH OSSTEST] kernel-build: enable XEN_BALLOON_MEMORY_HOTPLUG"):
> > > This allows a PVH/HVM domain to use unpopulated memory ranges to map
> > > foreign memory or grants, and is required for a PVH dom0 to function
> > > properly.
> > > 
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > 
> > I will push this to pretest immediately.
> 
> Now done.  Would you consider whether the default should be changed
> in Linux and prepare a patch to do so if appropriate ?

DYK if there's any reason why this is not on by default?

Thanks, Roger.

