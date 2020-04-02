Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929A19C8D3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 20:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK4e0-0002kn-De; Thu, 02 Apr 2020 18:32:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c8Ny=5S=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jK4dz-0002ki-6l
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 18:32:47 +0000
X-Inumbo-ID: 58f2c21c-7510-11ea-9e09-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58f2c21c-7510-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585852366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zFFgEdH0DiK/DzrRhdSUXSPM1id6Z8HEkf38aksFA0Q=;
 b=NK1TWN4AFsbljmsR4kvgOPJPK4pc77Q8Jz4T/Z+N3q5fE/rGd3CPmymk
 3cg4K7HivUSK5fgMUcbmxkC/UiBjTrd/abQDjsORZNmoaSmPXhzKlmtZ6
 YM2vrFdCYk6FdnIcrPUwIFqRnYeBFdWXOtRl7nJ+niBDlfK1nG+WUMZrZ Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WTMvIHNebKM2DvUcvwqadnBWmW/I7zUN54F1wURYfbNwwANyBqqoAas+vvdKpKyu7mXc0EAW0z
 w43c7lznylb6gruYh6eL6+qfH1ZOx6OKkDsEIkisgNaEF5v9qnZYX2y0qSYZ1ax3BH0QklGd7s
 7cc+r9dj2u5sbBD9Z3GkXYr3WR3WZMEj5q1p1JhRORjiYHw/J78ezhDaiE+2Fzk3Xc76C3aIDV
 wZ+P2vM4RfTXBRQLYElgnXzUtC7i6ghkvbH4jNk9I8wLaOeeZXDPPxths/o3byhfqaZqcxkxq6
 9EQ=
X-SBRS: 2.7
X-MesageID: 15752634
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15752634"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 2/2] xen: credit2: fix credit reset happening too few
 times
Thread-Topic: [PATCH v2 2/2] xen: credit2: fix credit reset happening too few
 times
Thread-Index: AQHV/YMFxYzbM+D1bEORIh9fvqIWfahmHaMA
Date: Thu, 2 Apr 2020 18:32:42 +0000
Message-ID: <5C3A27CD-E237-4490-8942-2F82D0C20DCC@citrix.com>
References: <158457508246.11355.6457403441669388939.stgit@Palanthas>
 <158457672023.11355.16720240521867328301.stgit@Palanthas>
In-Reply-To: <158457672023.11355.16720240521867328301.stgit@Palanthas>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3EE39656B430C40B6D7EDA24B833A44@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Glen <glenbarney@gmail.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWFyIDE5LCAyMDIwLCBhdCAxMjoxMiBBTSwgRGFyaW8gRmFnZ2lvbGkgPGRmYWdn
aW9saUBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGVyZSBpcyBhIGJ1ZyBpbiBjb21taXQgNWU0
YjQxOTk2NjdiOSAoInhlbjogY3JlZGl0Mjogb25seSByZXNldA0KPiBjcmVkaXQgb24gcmVzZXQg
Y29uZGl0aW9uIikuIEluIGZhY3QsIHRoZSBhaW0gb2YgdGhhdCBjb21taXQgd2FzIHRvDQo+IG1h
a2Ugc3VyZSB0aGF0IHdlIGRvIG5vdCBwZXJmb3JtIHRvbyBtYW55IGNyZWRpdCByZXNldCBvcGVy
YXRpb25zDQo+ICh3aGljaCBhcmUgbm90IHN1cGVyIGNoZWFwLCBhbmQgaW4gYW4gaG90LXBhdGgp
LiBCdXQgdGhlIGNoZWNrIHVzZWQNCj4gdG8gZGV0ZXJtaW5lIHdoZXRoZXIgYSByZXNldCBpcyBu
ZWNlc3Nhcnkgd2FzIHRoZSB3cm9uZyBvbmUuDQo+IA0KPiBJbiBmYWN0LCBrbm93aW5nIGp1c3Qg
dGhhdCBzb21lIHZDUFVzIGhhdmUgYmVlbiBza2lwcGVkLCB3aGlsZQ0KPiB0cmF2ZXJzaW5nIHRo
ZSBydW5xdWV1ZSAoaW4gcnVucV9jYW5kaWRhdGUoKSksIGlzIG5vdCBlbm91Z2guIFdlDQo+IG5l
ZWQgdG8gY2hlY2sgZXhwbGljaXRseSB3aGV0aGVyIHRoZSBmaXJzdCB2Q1BVIGluIHRoZSBydW5x
dWV1ZQ0KPiBoYXMgYSBuZWdhdGl2ZSBhbW91bnQgb2YgY3JlZGl0Lg0KDQpPaCwgc28gaWYgdGhl
IHRvcCBvZiB0aGUgcnVucXVldWUgaGFzIG5lZ2F0aXZlIGNyZWRpdCwgYnV0IGl04oCZcyBub3Qg
Y2hvc2VuLCB0aGVuIHRoZSBvbmUgd2UgKmRvKiBydW4gaGFzIGV2ZW4gbG93ZXIgY3JlZGl0LiAg
U3RpbGwgbm90IHF1aXRlIHN1cmUgaG93IHRoYXQgbGVhZHMgdG8gYSBzaXR1YXRpb24gd2hlcmUg
Y3JlZGl0IHJlc2V0cyBkb27igJl0IGhhcHBlbiBmb3IgbG9uZyBwZXJpb2RzIG9mIHRpbWUuICBC
dXQgYW55d2F5Li4uDQoNCj4gDQo+IFNpbmNlIGEgdHJhY2UgcmVjb3JkIGlzIGNoYW5nZWQsIHRo
aXMgcGF0Y2ggdXBkYXRlcyB4ZW50cmFjZSBmb3JtYXQgZmlsZQ0KPiBhbmQgeGVuYWx5emUgYXMg
d2VsbA0KPiANCj4gVGhpcyBzaG91bGQgYmUgYmFja3BvcnRlZC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlAc3VzZS5jb20+DQoNCkFja2VkLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQoNCg==

