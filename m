Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC1EE49E5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 13:27:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNxjK-0000Hh-OF; Fri, 25 Oct 2019 11:26:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Gvq=YS=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iNxjJ-0000HQ-2l
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 11:26:05 +0000
X-Inumbo-ID: 3ab338b4-f71a-11e9-94c5-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ab338b4-f71a-11e9-94c5-12813bfff9fa;
 Fri, 25 Oct 2019 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572002765;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qMHC3ZpC5i/WmClEuHont4rjl6NV9m4i3x42F2dFSWA=;
 b=WgQE4dKNWCsIrHYDIXD3NYpqhzCzDHj3OMM7QlPfNKgAIsOwDI384PP5
 kD6QMeIrdAcRx+peiQP9uS1thLlTnpbaN6R1iG03y+6Elnh96mp2Ui9nQ
 FtEjU8KiMJgWpGgjdKEfZrt28XEb4vZ8OMd6RhhyCCETeiHNbM1TSo9L9 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tkEjfKYwOh5193oMVHE8grgfI49KIt4+DIkpMueIJwT3dVrMc5/59/FDzf3zt2PEDRNMalORsF
 6+Jtfvgx/8VdbuWhHhjprUnBmUyLIOCEdTCF69DbsEYtKK0dZ6iilf7QWWg4B6uIUMasTRF00g
 /Mi3OnOlE+F6hqWurvzNNAuM/2V8RMDWvHhexSU9aMCz6ZKzs6ZZuOPVc9JkK+3cesjB0c47wH
 LuGfHKFVF4QxfCLbwQGC5sXDiDa8iKGBcR3JYn5Lfo4gL+7ByIxnRCqFMPHpSi+XWBIjHfslJI
 68k=
X-SBRS: 2.7
X-MesageID: 7521870
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,228,1569297600"; 
   d="scan'208";a="7521870"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Thread-Topic: [PATCH 05/24] golang/xenlight: define KeyValueList builtin type
Thread-Index: AQHVfSHEKkkkwfUR90Kshprb7s64t6dqBuqAgAAnAYCAAQQ+AA==
Date: Fri, 25 Oct 2019 11:26:00 +0000
Message-ID: <15987276-47AC-436B-9D93-C7A90A2558F2@citrix.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <1a60b855c0886c8e7147d48923f16b4d0815db81.1570456846.git.rosbrookn@ainfosec.com>
 <a27892b1-6d7f-c18b-3a6c-859cdd869e85@citrix.com>
 <CAEBZRSd82pXdL8+k9ASEkypdtF=yqfpaVO3e+4eAcf8iQi8_QA@mail.gmail.com>
In-Reply-To: <CAEBZRSd82pXdL8+k9ASEkypdtF=yqfpaVO3e+4eAcf8iQi8_QA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3594.4.19)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <CF02FDD40D0C7D45B86DF4B331DEE1CF@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 05/24] golang/xenlight: define KeyValueList
 builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "kerriganb@ainfosec.com" <kerriganb@ainfosec.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gT2N0IDI0LCAyMDE5LCBhdCA4OjU0IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+PiBTbyB3ZSAqY291bGQqIGFjdHVhbGx5IGp1c3Qg
YHR5cGUgS2V5VmFsdWVMaXN0IHN0cnVjdCB7IH1gLCBhbmQgcHVudCBvbg0KPj4gYWxsIHRoZXNl
IGluaXRpYWxpemF0aW9uIHF1ZXN0aW9ucyB1bnRpbCBzdWNoIHRpbWUgYXMgaXQgdHVybnMgb3V0
IHRoYXQNCj4+IHRoZXkncmUgbmVlZGVkLg0KPiANCj4gSWYgdGhlcmUgaXMgbm8gY2xlYXIgbmVl
ZCBmb3IgdGhpcyB0eXBlIHRvIGJlIGltcGxlbWVudGVkIGluIHRoZSBHbw0KPiBwYWNrYWdlLCB0
aGVuIEkgd291bGQgYmUgaW4gZmF2b3Igb2Ygbm90IGRvaW5nIHNvLiBJTU8sIGEgc21hbGxlciwN
Cj4gbW9yZSBmb2N1c2VkIHBhY2thZ2UgaXMgaWRlYWwuDQoNCk9rLCBpbiB0aGF0IGNhc2UgbGV0
4oCZcyBqdXN0IGxlYXZlIHRoZSBzdHJ1Y3QgZW1wdHkuDQoNCj4gDQo+PiBPbiB0aGUgb3RoZXIg
aGFuZCwgSSB0aGluayB3ZSBtYXkgbmVlZCB0byBhY3R1YWxseSB0aGluayBhYm91dA0KPj4gaW5p
dGlhbGl6aW5nIHN0cnVjdHVyZXMuICBZb3UndmUgY2FyZWZ1bGx5IGNvZGVkIERlZkJvb2wgc3Vj
aCB0aGF0IHRoZQ0KPj4gInplcm8iIHZhbHVlIGlzIHVuZGVmaW5lZDsgYnV0IGZvciBEZXZJZCwg
Zm9yIGluc3RhbmNlLCB0aGUgImluaXRpYWwiDQo+PiB2YWx1ZSBpcyBzdXBwb3NlZCB0byBiZSAt
MTsgYnV0IHRoZSB3YXkgaXQncyBjb2RlZCwgYW4gdW5pbml0aWFsaXplZCBHbw0KPj4gc3RydWN0
dXJlIHdpbGwgZW5kIHVwIGFzIDAsIHdoaWNoIG1heSBiZSBhIHZhbGlkIGRldmlkLg0KPj4gDQo+
PiBbLi4uXQ0KPj4gDQo+PiBBbnl3YXksIHBlcmhhcHMgd2UgY2FuIHRoaW5rIGFib3V0IHN0cnVj
dHVyZSBpbml0aWFsaXphdGlvbiwgYW5kDQo+PiBpbXBsZW1lbnQgaXQgYWZ0ZXIgd2UgZG8gdGhl
IGJhc2ljIHN0cnVjdHVyZSAvICBtYXJzaGFsbGluZyBpbXBsZW1lbnRhaXRvbi4NCj4gDQo+IFRo
YXQncyBwcm9iYWJseSBiZXN0LiBIb3dldmVyLCBhdCBhIHF1aWNrIGdsYW5jZSBpdCBzZWVtcyBs
aWtlIGl0DQo+IHdvdWxkIGJlIHByZXR0eSBzdHJhaWdodC1mb3J3YXJkIHRvIGdlbmVyYXRlIE5l
d1N0cnVjdFR5cGUgZnVuY3Rpb25zDQo+IGFuYWxvZ291cyB0byBsaWJ4bF9zdHJ1Y3RfdHlwZV9p
bml0LCBpZiB0aGF0J3MgdGhlIGRlc2lyZWQgYmVoYXZpb3IuDQoNCkkgdGhpbmsgd2UgYmFzaWNh
bGx5IGhhdmUgdGhyZWUgb3B0aW9uczoNCg0KMS4gVHJ5IHRvIGFycmFuZ2UgaXQgc28gdGhhdCB0
aGUg4oCcemVyb+KAnSB2YWx1ZXMgY29ycmVzcG9uZCB0byDigJxkZWZhdWx04oCdIHZhbHVlcyBp
biBsaWJ4bDsgaS5lLiwgaGF2ZSBEZXZJRCAwIC0+IGxpYnhsX2RldmlkIC0xLCBEZXZJRCAxIC0+
IGxpYnhsX2RldmlkIDAsICZjDQoNCjIuIEFkZCBOZXdTdHJ1Y3RUeXBlIGZ1bmN0aW9ucw0KDQoz
LiBBZGQgLkluaXQoKSBtZXRob2RzIHRvIHN0cnVjdHMNCg0KIzEgSSB0aGluayBpcyBwcm9iYWJs
eSB0b28gcmlza3k7IHNvIDIgb3IgMyAob3IgbWF5YmUgYm90aCkgd2lsbCBwcm9iYWJseSBiZSBu
ZWVkZWQuICBUaGUgTmV3U3RydWN0VHlwZSgpIHNlZW1zIHRvIGJlIG1vcmUgc3RhbmRhcmQuICBC
dXQgSeKAmW0gb3BlbiBzbyBzdWdnZXN0aW9ucy4gOi0pDQoNCiAtR2VvcmdlDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
