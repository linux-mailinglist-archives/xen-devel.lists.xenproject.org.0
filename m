Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6A9B8EE9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 13:23:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBGyO-00075t-7K; Fri, 20 Sep 2019 11:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Fkx=XP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iBGyM-00075m-Cw
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 11:21:10 +0000
X-Inumbo-ID: bea641cc-db98-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bea641cc-db98-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568978470;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=l9ut/S1I5uUKRCUXMviQjvFZYsfEGm7joDrxeJaNwT8=;
 b=ORIk9KJuro6sQsyRGs0lHOmAHoUg1rV5xrexFkZBdZ4etaAskUJfUyUa
 6VVhsKnMEYayK4zhyi6Ug4H3LEQTR+feC/7Lm6KhTM3ox3aRtf0u0NQFR
 A8VMpOo1dL8SdYnSVd4BO3B8EJ+3SPvK1jWN0PWNraBdORjBWjBAreycP Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M0IrEIxa+VPVBL14RC/Ur1QoE6+BsaXA9W58ouj4d/O1Kb5G9JBtIz8i6LyRaxGxESTscjX6vV
 DBF9PVKB1j1xg0r9s9fO/KEp2TPzVcyxdKzoCQw6OzV3yYhFsGONFY25Sm1rjbkVecCBEGQZnc
 7hpxDxLekz/hMJSMCGmivDJ5pvWKFjNduSxZh3BbabIzkZXAbnaRs49iYi+i4yGFj7Y0RHQtCR
 Pr6T/zyjAmmuv3NE35BLwDFw3UE0PYkXjOVE0MPHcTRxwmd6IKf9nbaJ6k+9Pdh6Ed7XC8yH+r
 Ae4=
X-SBRS: 2.7
X-MesageID: 5838055
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,528,1559534400"; 
   d="scan'208";a="5838055"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23940.46625.941729.514016@mariner.uk.xensource.com>
Date: Fri, 20 Sep 2019 12:21:05 +0100
To: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
In-Reply-To: <23936.62575.654137.203162@mariner.uk.xensource.com>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
 <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
 <20190813153020.GC1289@perard.uk.xensource.com>
 <d57c0140-01dd-4a65-3e96-0885cd98230f@citrix.com>
 <20190813164215.GE1289@perard.uk.xensource.com>
 <23936.62575.654137.203162@mariner.uk.xensource.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSF0gbGlieGx1OiBIYW5kbGUgKz0gaW4gY29u
ZmlnIGZpbGVzIik6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSF0gbGlieGx1
OiBIYW5kbGUgKz0gaW4gY29uZmlnIGZpbGVzIik6Cj4gPiBJIHdvbmRlciBpZiBpbnN0ZWFkIG9m
IGRvaW5nICs9IG9uIGFsbCBzdHJpbmdzLCB3ZSBzaG91bGQgaW5zdGVhZCBoYXZlCj4gPiBgeGwn
IHdoaXRlbGlzdCB0aGUgZmV3IG9wdGlvbnMgd2hlcmUgKz0gd291bGQgbWFrZSBzZW5zZS4gKGFu
ZCBhdCB0aGF0Cj4gPiBwb2ludCwgaXQgd291bGQgYmUgZWFzeSB0byBhZGQgYSAnICcgd2hlcmUg
aXMgbWFrZSBzZW5zZSwgbGlrZQo+ID4gImNtZGxpbmUicy4gQnV0IHRoZW4sIGhvdyB0byB0ZWxs
IHVzZXJzIHRoYXQgaXQgY2FuJ3QgZG8gIm5hbWUrPSctbmV3JyI/Cj4gPiBiZWNhdXNlIHhsdSB3
b3VsZCBqdXN0IHByaW50IGEgd2FybmluZywgYW5kIHhsIHdvdWxkIGtlZXAgZ29pbmcgd2l0aAo+
ID4gbmFtZT0iIi4gIFRyeSAieGwgY3JlYXRlIG1lbW9yeSs9NDIiIDstKS4KPiAKPiBEbyB3ZSBy
ZWFsbHkgbmVlZCB0byBnb2xkLXBsYXRlIGl0IGxpa2UgdGhpcyA/ICBJZiBzb21lb25lIHRyaWVz
IHRvCj4gYXBwZW5kIHRvIGEgc3RyaW5nIHdoZW4gaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRoZSBz
b2Z0d2FyZSB3aWxsIHN0aWxsCj4gZG8gd2hhdCB0aGV5IG91Z2h0IHRvIGhhdmUgZXhwZWN0ZWQu
ICBBbmQgaXQgZG9lc24ndCBzZWVtIGxpa2UgYQo+IGxpa2VseSBraW5kIG9mIGVycm9yLgo+IAo+
IEFzIGZvciB0aGUgb3JpZ2luYWwgcGF0Y2gsCj4gCj4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSSByZXJlYWQgdGhlIHRocmVhZCBhbmQgSSB0aGlu
ayB0aGVyZSB3ZXJlIG5vIGJsb2NraW5nIG9iamVjdGlvbnMuClNvIEkgaGF2ZSBwdXNoZWQgaXQu
CgpUaGFua3MsCklhbi4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
