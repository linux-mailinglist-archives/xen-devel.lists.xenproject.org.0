Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83BDC0365
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:26:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnOm-0007Ox-GB; Fri, 27 Sep 2019 10:22:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t+55=XW=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iDnOk-0007Og-U1
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:22:50 +0000
X-Inumbo-ID: ae3c6384-e110-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id ae3c6384-e110-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569579737;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wIbFe2iuvmvCXJIhc1Jmux7uJ5bvAEpc3Mbf87dxNEk=;
 b=D+k7CCLwUoiHTYL/b0OFfcr9zicOrPwG3Q04nAcY2Yv6N7TaGF+3woVE
 H2J3JGtJzeD4RmwX8+JOSBNH/eEG5BTyWLcaLrS5zSWvuXJBD6BlZv2Wr
 MYbNU02yQ9D5BKA4g3kq+OmSc/wd4Hwyl9PHij2IrrWIPatF8UfF3GUCo 0=;
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
IronPort-SDR: 1SdL+PXP5eajKMbK771A0fFEoTGn8Oytfxe/N6sJh0FNzzTpt78/7I1fPizdWf8LE25qiqznaB
 KdJA445XFDY6dU2q3eCaK/XDptlD5MGgmyEszR5z2e8pAWpxtEh9Y4GU6uKVrs0FnKU60uqLcQ
 iH++v0YzvimxGfXZhQWkDeGyJrsrnVEZdo5hHCNDzDcLYUGA4ykRRSOGFHaBoOG6HmiVbwDmOR
 XjbvRLi0g2XW95HReqCkKB3g+Slg0cO+Flq9PCJugvKPaNcgJ6kMnsMNC6sRhJHhdKSEGj/Kzt
 pWM=
X-SBRS: 2.7
X-MesageID: 6506075
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6506075"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Lars Kurth <lars.kurth@xenproject.org>
Thread-Topic: [PATCH v2 5/6] Add guide on Communication Best Practice
Thread-Index: AQHVdKIoBNlHjnrbLUK7o4oIKuieK6c/HQoAgAAiaoCAAAFfgA==
Date: Fri, 27 Sep 2019 10:22:13 +0000
Message-ID: <DBFDB335-D9DB-4AE3-AD5B-20C8E92AFD60@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
 <FB6109D7-6FDC-41AF-95F8-3CC65FAA1215@citrix.com>
In-Reply-To: <FB6109D7-6FDC-41AF-95F8-3CC65FAA1215@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <4D744ACF4FBD494BA66FA47DD34A2A51@citrix.com>
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

DQoNCu+7v09uIDI3LzA5LzIwMTksIDExOjE3LCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGhAY2l0
cml4LmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICBPbiAyNy8wOS8yMDE5LCAxMDoxNCwg
IkphbiBCZXVsaWNoIiA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KICAgIA0KICAgICAgICBP
biAyNi4wOS4yMDE5IDIxOjM5LCBMYXJzIEt1cnRoIHdyb3RlOg0KICAgICAgICA+ICsjIyMgVmVy
Ym9zZSB2cy4gdGVyc2UNCiAgICAgICAgPiArRHVlIHRvIHRoZSB0aW1lIGl0IHRha2VzIHRvIHJl
dmlldyBhbmQgY29tcG9zZSBjb2RlIHJldmlld2VyLCByZXZpZXdlcnMgb2Z0ZW4gYWRvcHQgYQ0K
ICAgICAgICA+ICt0ZXJzZSBzdHlsZS4gSXQgaXMgbm90IHVudXN1YWwgdG8gc2VlIHJldmlldyBj
b21tZW50cyBzdWNoIGFzDQogICAgICAgID4gKz4gdHlwbw0KICAgICAgICA+ICs+IHMvcmVzaW9u
cy9yZWdpb25zLw0KICAgICAgICA+ICs+IGNvZGluZyBzdHlsZQ0KICAgICAgICA+ICs+IGNvZGlu
ZyBzdHlsZTogYnJhY2tldHMgbm90IG5lZWRlZA0KICAgICAgICA+ICtldGMuDQogICAgICAgID4g
Kw0KICAgICAgICA+ICtUZXJzZSBjb2RlIHJldmlldyBzdHlsZSBoYXMgaXRzIHBsYWNlIGFuZCBj
YW4gYmUgcHJvZHVjdGl2ZSBmb3IgYm90aCB0aGUgcmV2aWV3ZXIgYW5kDQogICAgICAgID4gK3Ro
ZSBhdXRob3IuIEhvd2V2ZXIsIG92ZXJ1c2UgY2FuIGNvbWUgYWNyb3NzIGFzIHVuZnJpZW5kbHks
IGxhY2tpbmcgZW1wYXRoeSBhbmQNCiAgICAgICAgPiArY2FuIHRodXMgY3JlYXRlIGEgbmVnYXRp
dmUgaW1wcmVzc2lvbiB3aXRoIHRoZSBhdXRob3Igb2YgYSBwYXRjaC4gVGhpcyBpcyBpbiBwYXJ0
aWN1bGFyDQogICAgICAgID4gK3RydWUsIHdoZW4geW91IGRvIG5vdCBrbm93IHRoZSBhdXRob3Ig
b3IgdGhlIGF1dGhvciBpcyBhIG5ld2NvbWVyLiBUZXJzZQ0KICAgICAgICA+ICtjb21tdW5pY2F0
aW9uIHN0eWxlcyBjYW4gYWxzbyBiZSBwZXJjZWl2ZWQgYXMgcnVkZSBpbiBzb21lIGN1bHR1cmVz
Lg0KICAgICAgICANCiAgICAgICAgQW5kIGFub3RoZXIgcmVtYXJrIGhlcmU6IE5vdCBiZWluZyB0
ZXJzZSBpbiBzaXR1YXRpb25zIGxpa2UgdGhlIG9uZXMNCiAgICAgICAgZW51bWVyYXRlZCBhcyBl
eGFtcGxlcyBhYm92ZSBpcyBhIGRvdWJsZSB3YXN0ZSBvZiB0aGUgcmV2aWV3ZXIncyB0aW1lOg0K
ICAgICAgICBUaGV5IHNob3VsZG4ndCBldmVuIG5lZWQgdG8gbWFrZSBzdWNoIGNvbW1lbnRzLCBl
c3BlY2lhbGx5IG5vdCBtYW55DQogICAgICAgIHRpbWVzIGZvciBhIHNpbmdsZSBwYXRjaCAoc2Vl
IHlvdXIgbWVudGlvbiBvZiAib3ZlcnVzZSIpLiBJIHJlYWxpemUNCiAgICAgICAgd2Ugc3RpbGwg
aGF2ZSBubyBhdXRvbWF0ZWQgbWVjaGFuaXNtIHRvIGNoZWNrIHN0eWxlIGFzcGVjdHMsIGJ1dA0K
ICAgICAgICBhbnlib2R5IGNhbiBlYXNpbHkgbG9vayBvdmVyIHRoZWlyIHBhdGNoZXMgYmVmb3Jl
IHN1Ym1pdHRpbmcgdGhlbS4NCiAgICAgICAgQW5kIGZvciBhbiBvY2Nhc2lvbmFsIGlzc3VlIEkg
dGhpbmsgYSB0ZXJzZSByZXBseSBpcyBxdWl0ZSByZWFzb25hYmxlDQogICAgICAgIHRvIGhhdmUu
DQogICAgDQogICAgQXQgdGhlIGVuZCBvZiB0aGUgZGF5LCBub25lIGlmIHRoaXMgaXMgbWFuZGF0
b3J5LiBUaGUgZG9jdW1lbnQgYWxzbw0KICAgIGhhcyB0d28gYXVkaWVuY2VzDQogICAgKiBBdXRo
b3JzIHdoaWNoIGdldCByZXZpZXcgZmVlZGJhY2sgOiBmb3IgZXhhbXBsZSBieSBqdXN0IGhhdmlu
Zw0KICAgIHRoaXMgc2VjdGlvbiBpbiB0aGVyZSBpdCBoZWxwcyANCg0KVGhpcyB3YXMgbWVhbnQg
dG8gcmVhZDogaXQgaGVscHMgc2V0IGV4cGVjdGF0aW9ucyBhbmQgcHJvbW90ZXMgDQp1bmRlcnN0
YW5kaW5nIGZvciBzb21lIG9mIHRoZSBwYXR0ZXJucyB1c2VkDQogICAgDQogICAgSSBhZGRlZCB0
aGlzIHNlY3Rpb24gcHJpbWFyaWx5IGJlY2F1c2Ugd2UgZG8gc2VlIHRoZSBvY2Nhc2lvbmFsDQog
ICAgdmVyeSB0ZXJzZSByZXZpZXcgc3R5bGUgYW5kIGV2ZW4gSSB0aGluayBzb21ldGltZXM6IHdv
dywgdGhhdCBjb21lcw0KICAgIGFjcm9zcyBhcyBoYXJzaC4gQnV0IEkgYWxzbyBrbm93LCB0aGF0
IGl0IGlzbid0IGludGVudGlvbmFsIGFuZCB0aGF0DQogICAgSSBoYXZlIGEgZmFpcmx5IHRoaWNr
IHNraW4uIEFuZCBpdCBpcyBub3QgZXhjbHVzaXZlIHRvIHR5cG9zIGFuZCBtaW5vciBpc3N1ZXMu
DQogICAgDQogTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
