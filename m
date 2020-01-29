Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3914CD0E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:16:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwp2J-0002P0-Le; Wed, 29 Jan 2020 15:13:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwp2H-0002Ov-L8
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 15:13:45 +0000
X-Inumbo-ID: f0118aa1-42a9-11ea-88f6-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0118aa1-42a9-11ea-88f6-12813bfff9fa;
 Wed, 29 Jan 2020 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580310825; x=1611846825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AgAXIiGYXFkg0dHWFfnbztrxnOuWnbNwTmJL5EcN+/A=;
 b=wC9zJjUAIPQneLx6xKeHVyVyIi5YaoJTuIPeIcFfaGmboO1LDdHyuQdV
 qfHBEn2YHoAyFHqrm/RyHOLUi7II+Ck2RCkbJDZl2GauSBKcAr8kqluZu
 9RMyxQ/86v2RfyuVEQXPoVG8YC2AYXLkjhTce5fF3xuC4KGRYIOBNltJc E=;
IronPort-SDR: SvaR0LJAIWH3dd2vqUDCZE5Gz4QNf1SD2k0IvK3gK6jxROrzooS7jdoTsnQ0DaBwn8BmeZc4Xn
 XRJWj6RhnD4g==
X-IronPort-AV: E=Sophos;i="5.70,378,1574121600"; d="scan'208";a="14695782"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 29 Jan 2020 15:13:44 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 128A9A2477; Wed, 29 Jan 2020 15:13:40 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 15:13:39 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 15:13:39 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 29 Jan 2020 15:13:38 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v6 2/4] mm: modify domain_adjust_tot_pages() to better
 handle a zero adjustment
Thread-Index: AQHV1rHOrRKlfJ/diEqq5Viq3GAB16gBvk2AgAABCbA=
Date: Wed, 29 Jan 2020 15:13:38 +0000
Message-ID: <a78df3d0dc224be68ef90fc52fa086d7@EX13D32EUC003.ant.amazon.com>
References: <20200129143831.1369-1-pdurrant@amazon.com>
 <20200129143831.1369-3-pdurrant@amazon.com>
 <a7342d93-84c3-d844-433e-c3d845c336c2@suse.com>
In-Reply-To: <a7342d93-84c3-d844-433e-c3d845c336c2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 2/4] mm: modify domain_adjust_tot_pages()
 to better handle a zero adjustment
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEphbnVhcnkgMjAyMCAxNTowOA0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsNCj4gSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsNCj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAyLzRdIG1tOiBtb2RpZnkg
ZG9tYWluX2FkanVzdF90b3RfcGFnZXMoKSB0byBiZXR0ZXINCj4gaGFuZGxlIGEgemVybyBhZGp1
c3RtZW50DQo+IA0KPiBPbiAyOS4wMS4yMDIwIDE1OjM4LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gLS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vbWVtb3J5
LmMNCj4gPiBAQCAtNzI3LDggKzcyNyw3IEBAIHN0YXRpYyBsb25nDQo+IG1lbW9yeV9leGNoYW5n
ZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9tZW1vcnlfZXhjaGFuZ2VfdCkgYXJnKQ0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChqICogKDFVTCA8PCBleGNoLm91dC5leHRl
bnRfb3JkZXIpKSk7DQo+ID4NCj4gPiAgICAgICAgICAgICAgICAgIHNwaW5fbG9jaygmZC0+cGFn
ZV9hbGxvY19sb2NrKTsNCj4gPiAtICAgICAgICAgICAgICAgIGRyb3BfZG9tX3JlZiA9IChkZWNf
Y291bnQgJiYNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhZG9tYWluX2Fk
anVzdF90b3RfcGFnZXMoZCwgLQ0KPiBkZWNfY291bnQpKTsNCj4gPiArICAgICAgICAgICAgICAg
IGRyb3BfZG9tX3JlZiA9ICFkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAtZGVjX2NvdW50KTsN
Cj4gDQo+IEFuZCBpdCdzIG9ubHkgbm93IHRoYXQgSSBzZWUgaXQgaW4gdGhpcyBzaGFwZSB0aGF0
IGl0IGJlY29tZXMNCj4gY2xlYXIgdG8gbWUgd2h5IHRoZSBjaGFuZ2UgYWJvdmUgc2hvdWxkbid0
IGJlIGRvbmUsIGFuZCB3aHkgaW4NCj4geW91ciBvdGhlciBwYXRjaCBjb2RlIHNob3VsZCBiZSB3
cml0dGVuIHNpbWlsYXIgdG8gdGhlIGFib3ZlOg0KPiBUaGUgYWJzdHJhY3QgbW9kZWwgcmVxdWly
ZXMgdGhhdCB0aGUgZG9tYWluIHJlZmVyZW5jZSBiZQ0KPiBkcm9wcGVkIG9ubHkgd2hlbiAtPnRv
dF9wYWdlcyBfdHJhbnNpdGlvbnNfIHRvIHplcm8uIE5vIGRyb3ANCj4gc2hvdWxkIG9jY3VyIGlm
IHRoZSBjb3VudCB3YXMgYWxyZWFkeSB6ZXJvLiBHcmFudGVkIHRoaXMgbWF5DQo+IGJlIHRlY2hu
aWNhbGx5IGltcG9zc2libGUgaW4gdGhlIHNwZWNpZmljIGNhc2UgaGVyZSwgYnV0IHRoZQ0KPiBj
b2RlIHdvdWxkIHN0aWxsIGJldHRlciByZWZsZWN0IHRoaXMgZ2VuZXJhbCBtb2RlbCwgdG8gcHJl
dmVudA0KPiBpdCBnZXR0aW5nIChtaXMtKWNsb25lZCBpbnRvIG90aGVyIHBsYWNlcy4NCj4gDQoN
Ck9rLCBJIGd1ZXNzIEknbGwgZHJvcCB0aGlzIGFuZCB0aGVuIG1ha2Ugc3VyZSB0aGF0IGZyZWVf
ZG9taGVhcF9wYWdlcygpIGF2b2lkcyBhbiBlcnJvbmVvdXMgcmVmIGRyb3AuDQoNCiAgUGF1bA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
