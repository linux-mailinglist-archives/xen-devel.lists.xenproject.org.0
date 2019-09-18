Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B034CB688F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 18:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAdGA-0002qu-Fb; Wed, 18 Sep 2019 16:56:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAdG8-0002qV-9y
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 16:56:52 +0000
X-Inumbo-ID: 4f3dbb44-da35-11e9-963d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f3dbb44-da35-11e9-963d-12813bfff9fa;
 Wed, 18 Sep 2019 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568825811;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=UdQvYBEsqOhyYqVrstaud4agV5s7d7mr9DjF1f1ux48=;
 b=c+K+xX2WXghtC+aGU1yyoBDoUj9scpIr3Srv0r3oB6t0b1lzy4RX7QUe
 SbwIWtbOzeFKHeX3QQk5BvKHr3gF6hx/Ks5BhXnrppohTSbyctFfRf4DG
 oHENpbmChINEiAamRSVjSKgm+oxDLpAx+j4h6pJJOMlteBsmqALs6221n w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 24aBQry3zKfSiyGB1pxfubnaNfAE9yW8ZtVUdPCxFqJpQaO4cqwdcos7CAMbM7A9rSoiIvth9B
 B9hyi4QyCtqanTxOl2ReaFG4Zl8mCrz7F2EL/Ob9d8LIorkK43d1LVNX9h4b8TNu+7RlasQgUE
 d3qTKqhg3gpO5tf9oQCN1pCarIQh1+1OacNVPP2ZvY1cR186arqG178VspPmtmmiBqHBImW5Vn
 mBWqh8zqg1dMVKLi3VwF1fkZB7bUOkwneizEGliZz67HpsjQzJYjb8yUbeSRJ4JalRR8GUQegj
 Leg=
X-SBRS: 2.7
X-MesageID: 5945255
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="5945255"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23938.25040.211413.771860@mariner.uk.xensource.com>
Date: Wed, 18 Sep 2019 17:56:48 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190918164904.GP1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-9-anthony.perard@citrix.com>
 <23937.4506.366843.383849@mariner.uk.xensource.com>
 <20190918164904.GP1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 08/35] libxl: Replace
 libxl__qmp_initializations by ev_qmp calls
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAwOC8zNV0gbGlieGw6IFJlcGxhY2Ug
bGlieGxfX3FtcF9pbml0aWFsaXphdGlvbnMgYnkgZXZfcW1wIGNhbGxzIik6Cj4gT24gVHVlLCBT
ZXAgMTcsIDIwMTkgYXQgMDY6MDI6MThQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBI
b3cgaGFyZCB3b3VsZCBpdCBiZSB0byBtYWtlIGEgcHJlLXBhdGNoIHRvIHNodWZmbGUgdGhlIGNv
ZGUgdG8gdGhlCj4gPiBzYW1lIHBsYWNlIGFzIGl0J3MgZ29pbmcsIGFuZCBjaGFuZ2UgdGhlIHZh
cmlhYmxlIG5hbWVzIGV0Yy4gPwo+IAo+IEl0IGlzIGFjdHVhbGx5IG5vdCB0aGF0IGVhc3kgdG8g
cHJlLW1vdmUgdGhlIGZ1bmN0aW9ucyB0byB0aGUgbmV3IHBsYWNlLAo+IHRob3NlIGZ1bmN0aW9u
cyBhY2Nlc3MgdGhlIHN0cnVjdCBgcW1wJywgYnV0IHRoZSBkZXRhaWwgb2YgdGhlIHN0cnVjdCBp
cwo+IG9ubHkgYXZhaWxhYmxlIGluIGxpYnhsX3FtcC5jLiBUaG9zZSBmdW5jdGlvbnMgYWxzbyBj
YWxscwo+IHFtcF9zeW5jaHJvbm91c19zZW5kKCksIGJ1dCB0aGF0IGNhbiBlYXN5IGJlZW4gd29y
a2VkIGFyb3VuZC4KPiAKPiBXb3VsZCBhIHNlcmllcyBvZiBwYXRjaCB3aGljaCB3b3VsZCBuZWVk
cyB0byBiZSBzcXVhc2hlZCB0b2dldGhlciBhZnRlcgo+IHJldmlldyB3b3VsZCBiZSBlbm91Z2g/
IE90aGVyd2lzZSwgSSBkb24ndCBzZWUgaG93IEkgY2FuIGRvIGl0IHdpdGhvdXQKPiBicmVha2lu
ZyBiaXNlY3RhYmlsaXR5LgoKVGhhdCBzb3VuZHMgbGlrZSBhIGxvdCBvZiB3b3JrLiAgSSB3aWxs
IHJldmlldyB0aGlzIHBhdGNoIGFzLWlzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
