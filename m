Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B7E7835
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 19:16:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP9TG-0008AY-OT; Mon, 28 Oct 2019 18:10:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP9TF-0008AT-Hq
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 18:10:25 +0000
X-Inumbo-ID: 3647743e-f9ae-11e9-beca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3647743e-f9ae-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 18:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572286225;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=iCulieGASqzRBiPdvmyfm9EWTwAxC/aY4ND8etYlW0E=;
 b=d3/kjPGwZpKPH3Ny0iQ6M6CIVmpV2UZ+kWu/cDw5pISE1cLWVrM4j3r7
 xpvDYnfadV8L7jghl31NJWeWUVYjyVOehM4q0JsBF4JJF7YHSE9aBrmdg
 mT0X0xKeTeg9QkY5WXFIGSfZenOIf8OhNZ4Z3dBzaS2yf7aL2GXzEZkFP I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 268tYf8IinbGEw2ALw2sglLRB6F5CWd98p9VHwUP2ADY901nkcu8Q0BZOuUQWKFvVxjBifNH5+
 /gPQM5hF6WGT5e8UvXfRGjSrLx4+OYbWDaRe9vS6DaV8ma1wV41G9+khlWuwOAYjHRtfedTnqt
 09Pf0qnuRCEpx9hqt3isr6Ek4gu1SGh1FKYaLcw7scFENtH8tQFvQpGTDOn7Rq39qrw49cLFhu
 myBFuGsoN+0Dexo2Wx37Xs3juKj81XiMOvUh4UPY7omWHMTZXWZZhQGR4kOX6+JZk1Ec8eHmOV
 7mo=
X-SBRS: 2.7
X-MesageID: 7518520
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7518520"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23991.12031.220927.949181@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 18:10:07 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191028171926.GD1162@perard.uk.xensource.com>
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
 <20191028152948.11900-2-ian.jackson@eu.citrix.com>
 <20191028171926.GD1162@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 1/3] libxl:
 domain_config_setdefault: Document use of domid
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgMS8zXSBsaWJ4
bDogZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0OiBEb2N1bWVudCB1c2Ugb2YgZG9taWQiKToKPiBT
aG91bGQgbGlieGxfX2FyY2hfcGFzc3Rocm91Z2hfbW9kZV9zZXRkZWZhdWx0KCkgaGF2ZSB0aGUg
c2FtZSBjb21tZW50Pwo+IEp1c3QgaW4gY2FzZSwgc2luY2UgaXQncyBjYWxsZWQgd2l0aCB0aGF0
IHNhbWUgZG9taWQuCgpZZXMsIHlvdSBhcmUgcmlnaHQsIGl0IHNob3VsZC4gIEkganVzdCBhZGRl
ZCB0aGF0IGFsb25nIHdpdGggeW91ciBhY2sKd2hpbGUgcHVzaGluZy4KClRoYW5rcywKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
