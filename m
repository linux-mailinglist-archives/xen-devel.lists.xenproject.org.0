Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D443FEC146
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 11:29:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQU9I-0000Fm-2J; Fri, 01 Nov 2019 10:27:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7qU=YZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iQU9G-0000Fh-2d
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 10:27:18 +0000
X-Inumbo-ID: 2d678cdc-fc92-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d678cdc-fc92-11e9-beca-bc764e2007e4;
 Fri, 01 Nov 2019 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572604037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Up2tt/6lpz0qy3XFU585Qp0rYlGXxJbnHkrV/2Q2RoA=;
 b=ZHy375CyIXgYpkEbmmbrPVJ+HHMuA2ai6b76EzDavU0simh7FqntwgYR
 gK3K/2it+sgXQ8x56AvzfasftHyrzq6CFDcvw//DxvChBtroOFGmusKdv
 Wf/T9af9RjDG3Jhk/HicfSFiWXOTk1KnWS+pUcQYd675ulI2SDxSAVeGr 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LoVwj8UU1SkeuPChp/hPkzo8AHuryMHOOI5+4QGzNl3vxLqA+yBD4yJFGe6PEx9XA2q/0ZhSqO
 vZ3nLRV18Ba0H85/VJUYwaHBshZ6wg2gpwyQrubo14dPM4Nol76jW6tW0mm5S9WCi+/y+Jggvl
 6pD5OW3TXUY/tX494E840eJQ3jYo7YXbXDta9CBvBirMc3rFWgWkJVt+qJ1aSqOI8OPeszkRj8
 NqulXmBFUDmRmGAInpS3d3hX5Xwp4KeMbgmJUhrern1tMN9+HcgYXtNlHfnibXZcRGuVIlNX1q
 xR0=
X-SBRS: 2.7
X-MesageID: 8054264
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,254,1569297600"; 
   d="scan'208";a="8054264"
Date: Fri, 1 Nov 2019 10:27:14 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191101102714.GF2381@perard.uk.xensource.com>
References: <20191031193808.15401-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031193808.15401-1-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH] x86/pv: Fix !CONFIG_PV build following
 XSA-296
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RG9lcyB0aGUgc3ViamVjdCBzaG91bGQgc2F5IDI5OSBpbnN0ZWFkIG9mIDI5Nj8KCkNoZWVycywK
Ci0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
