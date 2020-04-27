Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9D1BA6F4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 16:53:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT589-0002VR-0x; Mon, 27 Apr 2020 14:53:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTJa=6L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jT587-0002VM-QG
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 14:53:07 +0000
X-Inumbo-ID: cd7dec12-8896-11ea-979f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd7dec12-8896-11ea-979f-12813bfff9fa;
 Mon, 27 Apr 2020 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587999186;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9DYxkeewgV9HN51YorpsBNq7toaYubW4PXRlkINECSA=;
 b=iejMp5HjrohXaeuaPVTNJb9h3euUdztR+hhRFhtF1kyDxCqT2xQ0WO00
 u9e8Jc3EHuGf5zK8yY9vrhNa97FXkiEoVfmtBqM7JM1VAy0IBZ8V4BCoe
 JyA2O8+XA4dd9l18/2l8z4Tqd/+oAsU/KFSL6/XQRxM70EASHEIx2xpSb o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CuaWtyIHlDESKnT8b+f9JHscWtBGC8v7OKdfh4p5xheYxazfMu2QiVNZieZoELJXz3fMnUF8Mn
 //PVB0TZ/AUCxv6vHrVJoM+0vfkyHmpE2NcCflOmJC54njzVPnMu17f51ArZx8JAWogLb/9Ha4
 8wHZbYJF5FADjUa8RraysxOGB/CaOLBt8YcC58ELhEZcYljBXAMdVL0zK8NMbYKTxEz6HWb/WK
 qe7n1599Sz49fgjZX/Xu0RGpa1Yx37IaMu4cdgG/M6IIPzkBTHIePxAwdIqhvUrj82HSGwozN1
 mFA=
X-SBRS: 2.7
X-MesageID: 16708959
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16708959"
From: George Dunlap <George.Dunlap@citrix.com>
To: Juergen Gross <JGross@suse.com>
Subject: Re: [PATCH v7 05/12] libs: add libxenhypfs
Thread-Topic: [PATCH v7 05/12] libs: add libxenhypfs
Thread-Index: AQHWCQXg1A1EagdjCU+LQG90+ev/tKiNE4YA
Date: Mon, 27 Apr 2020 14:53:03 +0000
Message-ID: <936102D2-0655-43EA-B52A-DED46E9E07D0@citrix.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-6-jgross@suse.com>
In-Reply-To: <20200402154616.16927-6-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <40B40089106A524BB53839123E594002@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDIsIDIwMjAsIGF0IDQ6NDYgUE0sIEp1ZXJnZW4gR3Jvc3MgPEpHcm9zc0Bz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBBZGQgdGhlIG5ldyBsaWJyYXJ5IGxpYnhlbmh5cGZzIGZv
ciBhY2Nlc3MgdG8gdGhlIGh5cGVydmlzb3IgZmlsZXN5c3RlbS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gQWNrZWQtYnk6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+DQoNCkp1c3QgYSBmZXcgcXVlc3Rpb25zLi4uDQoNCj4gKy8qIFJldHVybmVk
IGJ1ZmZlciBhbmQgZGlyZW50IHNob3VsZCBiZSBmcmVlZCB2aWEgZnJlZSgpLiAqLw0KPiArdm9p
ZCAqeGVuaHlwZnNfcmVhZF9yYXcoeGVuaHlwZnNfaGFuZGxlICpmc2hkbCwgY29uc3QgY2hhciAq
cGF0aCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5oeXBmc19kaXJlbnQg
KipkaXJlbnQpOw0KPiArDQo+ICsvKiBSZXR1cm5lZCBidWZmZXIgc2hvdWxkIGJlIGZyZWVkIHZp
YSBmcmVlKCkuICovDQo+ICtjaGFyICp4ZW5oeXBmc19yZWFkKHhlbmh5cGZzX2hhbmRsZSAqZnNo
ZGwsIGNvbnN0IGNoYXIgKnBhdGgpOw0KDQpXaGF04oCZcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZXNlIHR3bz8gIEFuZCB3aGF04oCZcyB0aGUgYGRpcmVudGAgYXJndW1lbnQgdG8geGVuaHlw
ZnNfcmVhZF9yYXcoKSBmb3I/DQoNCiAtR2VvcmdlDQoNCg==

