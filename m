Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D90B50E8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 17:01:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAEvz-0005zc-LJ; Tue, 17 Sep 2019 14:58:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAEvy-0005zJ-3X
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 14:58:26 +0000
X-Inumbo-ID: 98d47ffc-d95b-11e9-9616-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98d47ffc-d95b-11e9-9616-12813bfff9fa;
 Tue, 17 Sep 2019 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568732304;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=z9Ctb26Wgiy/ValJFOcP1dw3yjKuIhBLIHBBqjNfCKI=;
 b=AwhOy5YEXOIf1jb1ug237JaMYkcUeBfgBtAl68lYvqOYz1Vg3ZGpnIce
 5RcU0wmNfTVHdIKVX6MHiFA3cT7PYBE5y7eLKK9eM1t0d9rUbJTSX4c63
 uaW7ZyghIINo0gpqAAOiZ98cusSg7m1HDXelr9BvGXcmVfrpLioMjtSsX M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: q0+LF+UfJsH8SYWG2tP8vTb3i6QkOn6NSQDCQbWy4t6XjycvI/XallMYNtItKDRmNRA/x2eBR5
 ZwwaKKuiig7bQesS40Ig6HwamxKx4It/6EteSlBwkxtb1LhVOE3vduO3s+njXe82P20bv0oeZu
 f6n/cmPG4XKDOC68hDFLhJPCBL23X84YHhRYsADXyl1mhJNyR6UVg8wRShuD7kTGkpKdc4F/yw
 awXNaMSS43Cpq1nhK2QwsOgCdd0PWOmiK0qyJymstFavZRxpFFQEQVHBYBzym33XGcoQ/ADvMN
 EfY=
X-SBRS: 2.7
X-MesageID: 5927432
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,516,1559534400"; 
   d="scan'208";a="5927432"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23936.62575.654137.203162@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 15:57:51 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190813164215.GE1289@perard.uk.xensource.com>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
 <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
 <20190813153020.GC1289@perard.uk.xensource.com>
 <d57c0140-01dd-4a65-3e96-0885cd98230f@citrix.com>
 <20190813164215.GE1289@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxlu: Handle += in config files
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSF0gbGlieGx1OiBIYW5kbGUgKz0gaW4g
Y29uZmlnIGZpbGVzIik6Cj4gSSB3b25kZXIgaWYgaW5zdGVhZCBvZiBkb2luZyArPSBvbiBhbGwg
c3RyaW5ncywgd2Ugc2hvdWxkIGluc3RlYWQgaGF2ZQo+IGB4bCcgd2hpdGVsaXN0IHRoZSBmZXcg
b3B0aW9ucyB3aGVyZSArPSB3b3VsZCBtYWtlIHNlbnNlLiAoYW5kIGF0IHRoYXQKPiBwb2ludCwg
aXQgd291bGQgYmUgZWFzeSB0byBhZGQgYSAnICcgd2hlcmUgaXMgbWFrZSBzZW5zZSwgbGlrZQo+
ICJjbWRsaW5lInMuIEJ1dCB0aGVuLCBob3cgdG8gdGVsbCB1c2VycyB0aGF0IGl0IGNhbid0IGRv
ICJuYW1lKz0nLW5ldyciPwo+IGJlY2F1c2UgeGx1IHdvdWxkIGp1c3QgcHJpbnQgYSB3YXJuaW5n
LCBhbmQgeGwgd291bGQga2VlcCBnb2luZyB3aXRoCj4gbmFtZT0iIi4gIFRyeSAieGwgY3JlYXRl
IG1lbW9yeSs9NDIiIDstKS4KCkRvIHdlIHJlYWxseSBuZWVkIHRvIGdvbGQtcGxhdGUgaXQgbGlr
ZSB0aGlzID8gIElmIHNvbWVvbmUgdHJpZXMgdG8KYXBwZW5kIHRvIGEgc3RyaW5nIHdoZW4gaXQg
ZG9lc24ndCBtYWtlIHNlbnNlIHRoZSBzb2Z0d2FyZSB3aWxsIHN0aWxsCmRvIHdoYXQgdGhleSBv
dWdodCB0byBoYXZlIGV4cGVjdGVkLiAgQW5kIGl0IGRvZXNuJ3Qgc2VlbSBsaWtlIGEKbGlrZWx5
IGtpbmQgb2YgZXJyb3IuCgpBcyBmb3IgdGhlIG9yaWdpbmFsIHBhdGNoLAoKQWNrZWQtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
