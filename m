Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FC4C0353
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:20:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnJX-0006Fl-0W; Fri, 27 Sep 2019 10:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t+55=XW=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iDnJW-0006Ff-3Y
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:17:26 +0000
X-Inumbo-ID: ff120b02-e10f-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id ff120b02-e10f-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569579443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JhICq+a6rY7gUgwkAu2+RBq+zq27VzyAVX6UjNOOgss=;
 b=Aeu3ojPLHGDMPdJ11+iI9lmNPHpL/kdRhpNuNsWYFUqKz2W+wV0M/KY/
 itBv604IPazhpdwjMctwuOC1RicVat1TJ8xfGlnIUeBFAdsX+tbRcQaIg
 qb9cO+nYrqOCY3uRVl4rfWhOwQH5eEQQIE9IUCJkrQml8GW4uVjnnhnEN 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4hDsgImO4z/Cn13tixrof/9k0jUrRtCddwR1l6TX/xof+7zkh3c8TFt69oBI36pTWo166B1PB/
 9wmwY3Ug8bVEoDsfia4GB5zvR5nXv9IcA0aHxRTEaIatTX1FrJL7/+7IJtfzJJwpxAfC7u2Vtm
 PGMjlApiGy3Rhw2YBnLF8cYOSnujLIbU2BDb0gg29XoPSqqZm6qC0DwOjrCo39ibdEyTkh7ZOs
 QKBHA2+FGn01w/4k0NuRvvW7JPjFM+8T99VmspRoQZZGgsESsVypyiB2b6KAoanFiXz77S1dSs
 qAk=
X-SBRS: 2.7
X-MesageID: 6505884
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6505884"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Lars Kurth <lars.kurth@xenproject.org>
Thread-Topic: [PATCH v2 5/6] Add guide on Communication Best Practice
Thread-Index: AQHVdKIoBNlHjnrbLUK7o4oIKuieK6c/HQoAgAAiaoA=
Date: Fri, 27 Sep 2019 10:17:19 +0000
Message-ID: <FB6109D7-6FDC-41AF-95F8-3CC65FAA1215@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
In-Reply-To: <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F67218B68914C84BB65931461A988674@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 5/6] Add guide on Communication Best
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI3LzA5LzIwMTksIDEwOjE0LCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAyNi4wOS4yMDE5IDIxOjM5LCBMYXJzIEt1cnRoIHdyb3Rl
Og0KICAgID4gKyMjIyBWZXJib3NlIHZzLiB0ZXJzZQ0KICAgID4gK0R1ZSB0byB0aGUgdGltZSBp
dCB0YWtlcyB0byByZXZpZXcgYW5kIGNvbXBvc2UgY29kZSByZXZpZXdlciwgcmV2aWV3ZXJzIG9m
dGVuIGFkb3B0IGENCiAgICA+ICt0ZXJzZSBzdHlsZS4gSXQgaXMgbm90IHVudXN1YWwgdG8gc2Vl
IHJldmlldyBjb21tZW50cyBzdWNoIGFzDQogICAgPiArPiB0eXBvDQogICAgPiArPiBzL3Jlc2lv
bnMvcmVnaW9ucy8NCiAgICA+ICs+IGNvZGluZyBzdHlsZQ0KICAgID4gKz4gY29kaW5nIHN0eWxl
OiBicmFja2V0cyBub3QgbmVlZGVkDQogICAgPiArZXRjLg0KICAgID4gKw0KICAgID4gK1RlcnNl
IGNvZGUgcmV2aWV3IHN0eWxlIGhhcyBpdHMgcGxhY2UgYW5kIGNhbiBiZSBwcm9kdWN0aXZlIGZv
ciBib3RoIHRoZSByZXZpZXdlciBhbmQNCiAgICA+ICt0aGUgYXV0aG9yLiBIb3dldmVyLCBvdmVy
dXNlIGNhbiBjb21lIGFjcm9zcyBhcyB1bmZyaWVuZGx5LCBsYWNraW5nIGVtcGF0aHkgYW5kDQog
ICAgPiArY2FuIHRodXMgY3JlYXRlIGEgbmVnYXRpdmUgaW1wcmVzc2lvbiB3aXRoIHRoZSBhdXRo
b3Igb2YgYSBwYXRjaC4gVGhpcyBpcyBpbiBwYXJ0aWN1bGFyDQogICAgPiArdHJ1ZSwgd2hlbiB5
b3UgZG8gbm90IGtub3cgdGhlIGF1dGhvciBvciB0aGUgYXV0aG9yIGlzIGEgbmV3Y29tZXIuIFRl
cnNlDQogICAgPiArY29tbXVuaWNhdGlvbiBzdHlsZXMgY2FuIGFsc28gYmUgcGVyY2VpdmVkIGFz
IHJ1ZGUgaW4gc29tZSBjdWx0dXJlcy4NCiAgICANCiAgICBBbmQgYW5vdGhlciByZW1hcmsgaGVy
ZTogTm90IGJlaW5nIHRlcnNlIGluIHNpdHVhdGlvbnMgbGlrZSB0aGUgb25lcw0KICAgIGVudW1l
cmF0ZWQgYXMgZXhhbXBsZXMgYWJvdmUgaXMgYSBkb3VibGUgd2FzdGUgb2YgdGhlIHJldmlld2Vy
J3MgdGltZToNCiAgICBUaGV5IHNob3VsZG4ndCBldmVuIG5lZWQgdG8gbWFrZSBzdWNoIGNvbW1l
bnRzLCBlc3BlY2lhbGx5IG5vdCBtYW55DQogICAgdGltZXMgZm9yIGEgc2luZ2xlIHBhdGNoIChz
ZWUgeW91ciBtZW50aW9uIG9mICJvdmVydXNlIikuIEkgcmVhbGl6ZQ0KICAgIHdlIHN0aWxsIGhh
dmUgbm8gYXV0b21hdGVkIG1lY2hhbmlzbSB0byBjaGVjayBzdHlsZSBhc3BlY3RzLCBidXQNCiAg
ICBhbnlib2R5IGNhbiBlYXNpbHkgbG9vayBvdmVyIHRoZWlyIHBhdGNoZXMgYmVmb3JlIHN1Ym1p
dHRpbmcgdGhlbS4NCiAgICBBbmQgZm9yIGFuIG9jY2FzaW9uYWwgaXNzdWUgSSB0aGluayBhIHRl
cnNlIHJlcGx5IGlzIHF1aXRlIHJlYXNvbmFibGUNCiAgICB0byBoYXZlLg0KDQpBdCB0aGUgZW5k
IG9mIHRoZSBkYXksIG5vbmUgaWYgdGhpcyBpcyBtYW5kYXRvcnkuIFRoZSBkb2N1bWVudCBhbHNv
DQpoYXMgdHdvIGF1ZGllbmNlcw0KKiBBdXRob3JzIHdoaWNoIGdldCByZXZpZXcgZmVlZGJhY2sg
OiBmb3IgZXhhbXBsZSBieSBqdXN0IGhhdmluZw0KdGhpcyBzZWN0aW9uIGluIHRoZXJlIGl0IGhl
bHBzIA0KDQpJIGFkZGVkIHRoaXMgc2VjdGlvbiBwcmltYXJpbHkgYmVjYXVzZSB3ZSBkbyBzZWUg
dGhlIG9jY2FzaW9uYWwNCnZlcnkgdGVyc2UgcmV2aWV3IHN0eWxlIGFuZCBldmVuIEkgdGhpbmsg
c29tZXRpbWVzOiB3b3csIHRoYXQgY29tZXMNCmFjcm9zcyBhcyBoYXJzaC4gQnV0IEkgYWxzbyBr
bm93LCB0aGF0IGl0IGlzbid0IGludGVudGlvbmFsIGFuZCB0aGF0DQpJIGhhdmUgYSBmYWlybHkg
dGhpY2sgc2tpbi4gQW5kIGl0IGlzIG5vdCBleGNsdXNpdmUgdG8gdHlwb3MgYW5kIG1pbm9yIGlz
c3Vlcy4NCg0KV2hhdCBJIHdhcyB0cnlpbmcgdG8gZG8gaW4gdGhpcyBkb2N1bWVudCBpcyB0byBw
cm92aWRlDQphIGd1aWRlIHdoaWNoIHNob3dzIHRoZSBkaWZmZXJlbnQgcGF0dGVybnMgZnJvbSBi
b3RoIHBlcnNwZWN0aXZlcy4NCkkgaG9wZSBJIHN1Y2NlZWRlZCBpbiB0aGlzLCBidXQgSSBiZWxp
ZXZlIHRoYXQgeW91IHByaW1hcmlseQ0KcmV2aWV3ZWQgdGhlIGRvY3VtZW50IGZyb20gdGhlIHZp
ZXcgcG9pbnQgb2YgYSBjb2RlIHJldmlld2VyLg0KICAgIA0KICAgIE92ZXJhbGwgSSdtIHNlZWlu
ZyB0aGUgZ29vZCBpbnRlbnRpb25zIG9mIHRoaXMgZG9jdW1lbnQsIHlldCBJJ2Qgc3RpbGwNCiAg
ICB2b3RlIGF0IGxlYXN0IC0xIG9uIGl0IGlmIGl0IGNhbWUgdG8gYSB2b3RlLiBGb2xsb3dpbmcg
ZXZlbiBqdXN0IGENCiAgICBmYWlyIHBhcnQgb2YgaXQgaXMgYSBjb25zaWRlcmFibGUgZXh0cmEg
YW1vdW50IG9mIHRpbWUgdG8gaW52ZXN0IGluDQogICAgcmV2aWV3cywgd2hlbiB3ZSBhbHJlYWR5
IGhhdmUgYSBzZXZlcmUgcmV2aWV3aW5nIGJvdHRsZW5lY2suIElmIEkgaGF2ZQ0KICAgIHRvIGp1
ZGdlIGJldHdlZW4gZG9pbmcgYSBiYWQgKHN0eWxpc3RpY2FsbHkgYWNjb3JkaW5nIHRvIHRoaXMg
ZG9jLCBub3QNCiAgICB0ZWNobmljYWxseSkgcmV2aWV3IG9yIG5vbmUgYXQgYWxsIChiZWNhdXNl
IG9mIHRpbWUgY29uc3RyYWludHMpLCBJJ2QNCiAgICBmYXZvciB0aGUgZm9ybWVyLiBVbmxlc3Mg
b2YgY291cnNlIEknbSBhc2tlZCB0byBzdG9wIGRvaW5nIHNvLCBpbg0KICAgIHdoaWNoIGNhc2Ug
SSdkIGV4cGVjdCB3aG9ldmVyIGFza3MgdG8gYXJyYW5nZSBmb3IgdGhlIHJldmlld3MgdG8gYmUN
CiAgICBkb25lIGJ5IHNvbWVvbmUgZWxzZSBpbiBkdWUgY291cnNlLg0KDQpGaXJzdCBvZiBhbGw6
IHRoaXMgd291bGQgYmUgb3VyIGdvbGQgc3RhbmRhcmQgYW5kIGFzIHBvaW50ZWQgb3V0IGVhcmxp
ZXINClNvIGl0IGlzIGludGVuZGVkIHRvIHByb3ZpZGUgdGhlIHRvb2xzIHRvIGRvIGJldHRlcjog
Zm9yIGV4YW1wbGUsIGZyb20gDQpteSBwb2ludCBvZiB2aWV3IGlmIHlvdSBmb2xsb3dlZCBzb21l
IG9mIGl0IGZvciBleGFtcGxlIGZvciBuZXdjb21lcnMNCmFuZCBzcGFyaW5nbHkgd2hlbiB5b3Ug
ZmVlbCBpdCBpcyByaWdodCwgdGhhdCB3b3VsZCBhbHJlYWR5IGJlIGEgDQp3aW4td2luLiBBbHNv
LCBjb25zaWRlciB0aGF0IGEgbW9yZSBwb3NpdGl2ZSB0b25lIHNob3VsZCBhbHNvIGhhdmUgdGhl
DQplZmZlY3QgdGhhdCB0aGVyZSBtYXkgYmUgbGVzcyB1bm5lY2Vzc2FyeSBkaXNjdXNzaW9uLiBJ
IHRoaW5rIHRoaXMNCmlzIHBhcnRpY3VsYXJseSB0cnVlIHdoZW4gaXQgY29tZXMgdG8gdGhlIHNl
Y3Rpb25zIG9uIGZhY3QtYmFzZWQgDQpyZXNwb25zZXMgdnMuIHNvbWUgd2hpY2ggYXJlIHVuY2xl
YXIuIFVuZm9ydHVuYXRlbHksIEkgZG9uJ3QgaGF2ZSBkYXRhDQpvbiB0aGlzIHRvIHByb3ZlIGl0
Lg0KICAgIA0KQ2FuIEkgbWF5YmUgZ2V0IHlvdSB0byByZWNvbnNpZGVyIGFuZCByZS1yZXZpZXcg
dGhlIG5leHQgdmVyc2lvbiBmcm9tIHRoZQ0KdmlldyBwb2ludCBvZiBhbiBhdXRob3IgYW5kIG1h
eWJlIG1ha2Ugc3VnZ2VzdGlvbnMgb24gaG93IHRvIGNyZWF0ZSBtb3JlDQpiYWxhbmNlDQoNCiAg
ICBJJ20gc29ycnkgZm9yIChsaWtlbHkpIHNvdW5kaW5nIGRlc3RydWN0aXZlIGhlcmUuDQoNCkkg
ZG9uJ3Qgc2VlIHRoaXMgeW91ciBmZWVkYmFjayBhcyBkZXN0cnVjdGl2ZSBhbmQgZG8gaG9wZSB0
aGF0IEkNCmNhbiBjb252aW5jZSB5b3UgdGhhdCBkb2N1bWVudGluZyBzb21lIG9mIHRoZSBwYXR0
ZXJucyB3aGljaA0KaGFwcGVuIG9uIHRoZSBsaXN0IGFyZSBpbiBmYWN0IGEgbmV0LXBvc2l0aXZl
DQoNClJlZ2FyZHMNCkxhcnMgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
