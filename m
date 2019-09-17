Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D69B53CE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:16:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAH3u-0005Zk-OP; Tue, 17 Sep 2019 17:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAH3t-0005Zb-GA
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:14:45 +0000
X-Inumbo-ID: a4999b3e-d96e-11e9-961c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4999b3e-d96e-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740485;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=GlcllsCVnuTp+F+lri0f1SqBQ1FlFt0o7htERFutYVQ=;
 b=KeQMNwlHnGwW/bLomo4IpyOgKzNRvLfDYgArdNFtIyf98gDQ7HjPFP/j
 HaKo4M3gj2E6Gt4NyFaobCCZzKdjl2nYYRcuSqu7RUmnL4q4iSHm2BdiM
 Q+jmvXJY09gTHU7RbR/iFudFQTTPrHt74k+K9GWyAgFCyOx4yFgyAiPs0 4=;
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
IronPort-SDR: yIWzErzNXLwJkWH6znKAkmtA51WU3YeKQqoyLT3vAg33Z1vNt8CO0md1aKwHFyTcCliYQXZlYL
 oO2GqrQ5/u6pZdgs5igAA/wNCvPJoXkBNFsMX5VW/EmGo3R5OxgXBDJQlTAyCqXIoPckWzQ/fU
 f7cGBvTkSRKuXDra84rRYem9et0qKoLHOaWCZFZ4weWKgLeP5K1CLzfqQOnWLpuutKoA79gVrR
 oHc3s7DiMoQV0C/yOZyx9zvs6CXvohZUrfaDxIscsD8Qb4vi0Kw6CVidgOoCbTkM5hHRNZ5+zA
 k+g=
X-SBRS: 2.7
X-MesageID: 5683438
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5683438"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.5249.510277.670565@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:14:41 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-24-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-24-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 23/35] libxl:
 libxl__initiate_device_usbdev_remove now use ev_qmp
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDIzLzM1XSBsaWJ4bDogbGlieGxfX2luaXRp
YXRlX2RldmljZV91c2JkZXZfcmVtb3ZlIG5vdyB1c2UgZXZfcW1wIik6Cj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci4uLgo+ICAgICAg
bGlieGxfZGV2aWNlX3VzYmN0cmwgdXNiY3RybDsKPiArICAgIGJvb2wgaGFzX2NhbGxiYWNrID0g
ZmFsc2U7CgpOb3Qgc3VyZSBJIGxpa2UgdGhpcyBlbmNvZGluZyBvZiBwcm9ncmFtIGZsb3cgaW4g
YSB2YXJpYWJsZSBidXQgaXQKc2VlbXMgY29ycmVjdCwgYW5kIGl0J3MgYSBtYXR0ZXIgb2YgdGFz
dGUsIHNvOgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgoKKEFuZCBJJ20gbm90IHN1cmUgSSBoYXZlIGEgYmV0dGVyIHN1Z2dlc3Rpb24uKQoKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
