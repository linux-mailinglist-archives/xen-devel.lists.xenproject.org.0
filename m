Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C41925D2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:38:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3Ot-0003So-9D; Wed, 25 Mar 2020 10:36:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH3Or-0003SZ-F7
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 10:36:41 +0000
X-Inumbo-ID: 832dad5e-6e84-11ea-92cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 832dad5e-6e84-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585132600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+nibbYZ2RWKNxRYrcEgltZWXNHOTH+TOcD26NQ+SL+s=;
 b=VPnISo97k9mP9YsV1c/im5KFEvE6uDnS2GvJxhKl8ThUW8kzjt73Z45N
 0aiqfQomP5cYa466mIYMRdjUvwIsGUnrEGi/huv2hJewoevb6Pf3ISEKZ
 jaKUxfSEpWstTAFSADlyfFbdKdEDmWj6J4OAhKU6IdJVAmabQ8FppFH5a E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: N0nHy64mrY4suW4RIzhpJFIDZAl+ml/IKNVLYOaEDXoTTy0519us99+LZYyGyY42nFu2snJroF
 l7RofwYcp9J14rcjP0lmsZOI+9zOkCfxLwLsqhhNb4LyUtCn+wLyRb4XjRNyP8Qk+jrcIVbFl3
 mVPicFka0PyGn/z0JmdcCWp7dVEsajCVlZF+q16o+eG2vcOTs7TMKfFV2reOfJPyFCkUN2qY5F
 BeMdXbwuhcRbu58gO0YZduZpzAVH5oyiAotRjk4j/KrtYOd8jaoOXVHW3pLFAwMrzlzr+qGXrS
 XRE=
X-SBRS: 2.7
X-MesageID: 14931209
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="14931209"
Date: Wed, 25 Mar 2020 11:36:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20200325103634.GB28601@Air-de-Roger>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
 <24083.16958.769634.476071@mariner.uk.xensource.com>
 <20200106143836.GK1314@mail-itl>
 <24083.21734.512820.514082@mariner.uk.xensource.com>
 <20200106160340.GL1314@mail-itl>
 <20200323153512.GE24458@Air-de-Roger.citrite.net>
 <20200324024530.GJ2995@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324024530.GJ2995@mail-itl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for
 driver domains
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
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 03:45:30AM +0100, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 23, 2020 at 04:35:12PM +0100, Roger Pau Monné wrote:
> > On Mon, Jan 06, 2020 at 05:03:40PM +0100, Marek Marczykowski-Górecki wrote:
> > > >  * There needs to be a way to deal with a broken/unresponsive driver
> > > >    domain.  That will involve not waiting for the backend so must
> > > >    involve simply deleting the backend from xenstore.
> > > 
> > > It's already there: if driver domain fails to set .../state = 6 within
> > > a timeout, toolstack will forcibly remove the entry.
> > 
> > Would it work to change this and instead of monitor .../state = 6
> > monitor that the parent directory still exist?
> 
> That could be a good idea, to avoid introducing yet another (set of)
> callback. I'll look into it, it may require different handling of
> dom0/non-dom0 backend.

Yes, the domain handling the backend needs to watch .../state, while
the control domain (where the toolstack actually runs) would need to
watch .../ AFAICT.

As you say, I think you could maybe reuse some of the code and add a
special case for the toolstack domain when the backend runs in a
driver domain.

Thanks, Roger.

