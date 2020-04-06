Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CB19F3D5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:48:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPIS-0007NZ-9q; Mon, 06 Apr 2020 10:48:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=67tO=5W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jLPIQ-0007NR-4Q
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:48:02 +0000
X-Inumbo-ID: 15c70958-77f4-11ea-b58d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15c70958-77f4-11ea-b58d-bc764e2007e4;
 Mon, 06 Apr 2020 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170081;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+FxSjw+m9HFUsArNeL5T/ZDFIv0ZrDYMqf3vIQVGFBw=;
 b=iAPUvDn+/obqzUc2fXwnFm0nKVUiTbkiaoNbKA0T1T3VMZEFK7m6YfEF
 OnQH9NJrP4Aq1UuYbazAjzpQde82c391HMBEBL5q9X862qTsEr9OL3idw
 IW0uV7XJsldluwrn3lOrOxpPDxUHG+SleHSWT7se7C9nS0dmIPalJ83w+ I=;
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
IronPort-SDR: myNmmaxtbnPF+Ruyhvh4lPC6S5Yrn1cFbnTB0F47izTu/3YWBOf8XRRKRrsgX0elzKLp5LbuYb
 mWS9xzjMUpmv4Hd8UtlRlZmCZgI+X4hpOomcvNI92mTyP+JcvUJasA9MelY0+1DGwsoE+Ptwxf
 WP/+M/cL2yCobWjwaBWtAMWHOHlOWQurKHoKOIcdCqu0355+8Y0IGNc0kkX4AuJ8SRKCPL6wsS
 UgKw2xdr0mJcEAR8wgVLq1OiPyoWr161LVgCgeDUsBnDfy0XgywT3u7q4Nh1kQhDRfRi4bPq1w
 SZU=
X-SBRS: 2.7
X-MesageID: 15630710
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15630710"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24203.2251.628483.557280@mariner.uk.xensource.com>
Date: Mon, 6 Apr 2020 11:47:39 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus
In-Reply-To: <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jürgen Groß writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
> On 06.04.20 11:24, Julien Grall wrote:
> > Large guests on which arch? Which type of guests?
> 
> I'm pretty sure this applies to x86 only. I'm not aware of event
> channels being used on ARM for IPIs.

Should this be arch-dependent then ?  It seems like the figure is just
a heuristic anyway, and ...

> The resulting number would be larger than today only for guests with
> more than 96 vcpus. So I don't think the additional amount of memory
> is really that problematic.

Julien, are there likely to be any ARM guests now which have anywhere
near that number of vcpus ?  If not do we know now what such guests
are likely to be like ?

If this is all hypothetical on ARM it would seem silly to make this
arch-specific for the benefit of ARM given that the ARM implementation
would be entirely guesswork.  Maybe we should postpone that
specialisation until we know better what the ARM function should be
like for these large numbers of vcpus.

If ARM folks want to have a different formula for the default then
that is of course fine but I wonder whether this might do ARMk more
harm than good in this case.

Ian.

