Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA3139A6B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 20:58:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir5o3-0006XQ-Km; Mon, 13 Jan 2020 19:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rz2b=3C=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ir5o2-0006XI-PL
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 19:55:22 +0000
X-Inumbo-ID: 82b8bfd6-363e-11ea-b89f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82b8bfd6-363e-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 19:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578945270;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xB6xj/jl4E3VcJUzJk5zHIupVIdFZx40l2jszUAe/b8=;
 b=c8RJKpVyXFsUqJp0LwidCVUzGIvNz9Cx29JRS9ObRIfzfPFRAQlhkjx0
 70Q7Vhm3ejYBZ5NopkLthTrVlI84JuACvHv3v+5AKTizXYdxjWEGOsw58
 ITW61LFGknIPCK2rx1BcOhwEPsaOXG0XDyagkLX40vatkwq72BQHaV3av 8=;
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
IronPort-SDR: 4wslqlZfBGdI5na4qzELFLGU0ENdWjLGmwa6mPvm7S2rqKFWMBDl/yn3qGbaTFIF6HgbWDDlmd
 aEF+9eGYqN4ETG/qkbLEDk1/h/R05s2yreAAUtdlY16rU+7C+9uw3eEZbE7Tuo+NAkZMEL1b6L
 3IxNGoEAPl/4y+ECUKbpC4FrE4hpu2alGdf7nfJYPEkBIKTlDk/Rh+fIxLGd1K6Mga6fePPv6X
 zKJ8iknz2GZtrGgp5MHjRiZGDoGjS68Ng9dFybbp/LchVV82ovuyXgVYiqXgBdmt0cdDT6mL2V
 iu4=
X-SBRS: 2.7
X-MesageID: 11283356
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,430,1571716800"; d="scan'208";a="11283356"
From: George Dunlap <George.Dunlap@citrix.com>
To: Lars Kurth <lars.kurth@xenproject.org>
Thread-Topic: [PATCH v4 6/7] Add guide on Communication Best Practice
Thread-Index: AQHVv0foEQZZlI2FCUmFwb8jhXSR+afpBzEA
Date: Mon, 13 Jan 2020 19:54:26 +0000
Message-ID: <B1A02147-899C-4A5E-BAF8-193A05F7B60C@citrix.com>
References: <cover.1577733361.git.lars.kurth@citrix.com>
 <2d005116379febe0e6cfe0ea32792eb90bc74f9d.1577733361.git.lars.kurth@citrix.com>
In-Reply-To: <2d005116379febe0e6cfe0ea32792eb90bc74f9d.1577733361.git.lars.kurth@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.40.2.2.4)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <2B67D456C8D8EF41ABF91BA5568DB580@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 6/7] Add guide on Communication Best
 Practice
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIERlYyAzMCwgMjAxOSwgYXQgNzozMiBQTSwgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEB4
ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+DQo+IA0KPiBUaGlzIGd1aWRlIGNvdmVycyB0aGUgYnVsayBvbiBCZXN0IFBy
YWN0aWNlIHJlbGF0ZWQgdG8gY29kZSByZXZpZXcNCj4gSXQgcHJpbWFyaWx5IGZvY3Vzc2VzIG9u
IGNvZGUgcmV2aWV3IGludGVyYWN0aW9ucw0KPiBJdCBhbHNvIGNvdmVycyBob3cgdG8gZGVhbCB3
aXRoIE1pc3VuZGVyc3RhbmRpbmdzIGFuZCBDdWx0dXJhbA0KPiBEaWZmZXJlbmNlcw0KPiANCj4g
KyMjIyBBdm9pZCBvcGluaW9uOiBzdGljayB0byB0aGUgZmFjdHMNCg0KSW4gbXkgdGFsayBvbiB0
aGlzIHN1YmplY3QgSSBzYWlkIOKAnEF2b2lkICppbmZsYW1tYXRvcnkgbGFuZ3VhZ2Uq4oCdLiAg
QXQgc29tZSBsZXZlbCBpdOKAmXMgZ29vZCB0byBoYXZlIHN0cm9uZyBvcGluaW9ucyBvbiB3aGF0
IGNvZGUgc2hvdWxkIGxvb2sgbGlrZS4gIEl04oCZcyBub3Qgb3BpbmlvbnMgdGhhdCBhcmUgYSBw
cm9ibGVtLCBvciBldmVuIGV4cHJlc3Npbmcgb3BpbmlvbnMsIGJ1dCBleHByZXNzaW5nIHRoZW0g
aW4gYSBwcm92b2NhdGl2ZSBvciBpbmZsYW1tYXRvcnkgd2F5Lg0KDQo+IA0KPiArPiBGb290IGJp
bmRpbmcgd2FzIHRoZSBjdXN0b20gb2YgYXBwbHlpbmcgdGlnaHQgYmluZGluZyB0byB0aGUgZmVl
dCBvZiB5b3VuZw0KPiArPiBnaXJscyB0byBtb2RpZnkgdGhlIHNoYXBlIGFuZCBzaXplIG9mIHRo
ZWlyIGZlZXQuIC4uLiBmb290IGJpbmRpbmcgd2FzIGENCj4gKz4gcGFpbmZ1bCBwcmFjdGljZSBh
bmQgc2lnbmlmaWNhbnRseSBsaW1pdGVkIHRoZSBtb2JpbGl0eSBvZiB3b21lbiwgcmVzdWx0aW5n
DQo+ICs+IGluIGxpZmVsb25nIGRpc2FiaWxpdGllcyBmb3IgbW9zdCBvZiBpdHMgc3ViamVjdHMu
IC4uLiBCaW5kaW5nIHVzdWFsbHkNCj4gKz4gc3RhcnRlZCBkdXJpbmcgdGhlIHdpbnRlciBtb250
aHMgc2luY2UgdGhlIGZlZXQgd2VyZSBtb3JlIGxpa2VseSB0byBiZSBudW1iLA0KPiArPiBhbmQg
dGhlcmVmb3JlIHRoZSBwYWluIHdvdWxkIG5vdCBiZSBhcyBleHRyZW1lLiDigKZUaGUgdG9lcyBv
biBlYWNoIGZvb3QNCj4gKz4gd2VyZSBjdXJsZWQgdW5kZXIsIHRoZW4gcHJlc3NlZCB3aXRoIGdy
ZWF0IGZvcmNlIGRvd253YXJkcyBhbmQgc3F1ZWV6ZWQNCj4gKz4gaW50byB0aGUgc29sZSBvZiB0
aGUgZm9vdCB1bnRpbCB0aGUgdG9lcyBicm9rZeKApg0KDQpJbiBteSB0YWxrIEkgY292ZXJlZCB0
aGUgbGFzdCB0aHJlZSB3b3JkcyBiZWhpbmQgYSBibHVlIHNxdWFyZSwgc2luY2UgdGhpcyBpbWFn
ZSBpcyBwcmV0dHkgdmlvbGVudCDigJQgYW5kIGlzIGdlbmRlcmVkIHZpb2xlbmNlIGF0IHRoYXQu
ICBTb21lIHBlb3BsZSBqb2tlIGFib3V0IOKAnHRyaWdnZXJpbmfigJ0sIGJ1dCB0aGVyZSBhcmUg
Y2VydGFpbmx5IHBlb3BsZSB3aG8gIGhhdmUgZXhwZXJpZW5jZWQgdmlvbGVuY2UsIHdobyB3aGVu
IHRoZXkgY29tZSBhY3Jvc3MgZGVzY3JpcHRpb25zIG9mIGl0IHVuZXhwZWN0ZWRseSBzdWRkZW5s
eSBoYXZlIGxvYWRzIG9mIHVud2VsY29tZSBlbW90aW9ucyB0byBkZWFsIHdpdGg7IGFuZCBJIHZl
bnR1cmUgdG8gZ3Vlc3MgdGhhdCBtb3N0IHBlb3BsZSBza2ltbWluZyB0aHJvdWdoIHN1Y2ggYSBn
dWlkZSB3b3VsZG7igJl0IGJlIGV4cGVjdGluZyB0byBjb21lIGFjcm9zcyBzb21ldGhpbmcgbGlr
ZSB0aGlzLg0KDQpQZXJzb25hbGx5IEkgd291bGQgcmVwbGFjZSB0aGUgbGFzdCB0aHJlZSB3b3Jk
cyB3aXRoIFtyZWRhY3RlZF0uICBUaGUgcG9pbnQgY2FuIGJlIG1hZGUgd2l0aG91dCBiZWluZyBz
byBleHBsaWNpdC4gIEFueW9uZSB3aG8gd2FudHMgdG8ga25vdyB3aGF0IGhhcHBlbnMgY2FuIGdv
IGxvb2sgdXAgdGhlIGVudHJ5IHRoZW1zZWx2ZXMuDQoNCkV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBn
b29kIQ0KDQogLUdlb3JnZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
