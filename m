Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AEC82D22
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 09:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huu9t-0005bz-PY; Tue, 06 Aug 2019 07:45:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=idZU=WC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1huu9s-0005bu-CP
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 07:45:24 +0000
X-Inumbo-ID: 24d1750b-b81e-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 24d1750b-b81e-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 07:45:22 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xaHMzmK9s7F69NGGKi6HieNc6UWjdnaV0VRS2RgxMOvsgLq/24vR7W3rAh/hIRoQ39Ftz/gtOL
 8Nz5OIVG7XFrWzGSTHFmZbPPwi+cpPeYvZzPeMNsO1aJ34qhy20SWohKGLhYuTneBT+/TEKkVb
 cJ0YOXKWLNA7zIvBebOQFALphd2FEKZIz75nZkelNxj9zRKqqqpT9WeL8qLD46HYrNEBgavWYm
 BzQyhB3aBsk4SbbwaPMTfmuWSgXKlG1wA6CsHJQ5wYf9jQeptoL/ql7eu1XVYf3updf1WnQVoe
 VNM=
X-SBRS: 2.7
X-MesageID: 4030675
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,352,1559534400"; 
   d="scan'208";a="4030675"
From: George Dunlap <George.Dunlap@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/4] xen: sched: refector code around
 vcpu_deassign() in null scheduler
Thread-Index: AQHVQ3r7l7jEiRa2CU6PQPK00ehLoqbspLkAgAASh4CAAAcmAIAA7uUA
Date: Tue, 6 Aug 2019 07:45:18 +0000
Message-ID: <18B2FF28-BD84-4AAE-A634-786C6802C5AB@citrix.com>
References: <156412188377.2385.12588508835559819141.stgit@Palanthas>
 <156412235104.2385.3911161728130674771.stgit@Palanthas>
 <13f139f6-c39d-f30f-11ae-3338d044a7fe@suse.com>
 <1b6be92e-6acd-0fd8-fa63-f34c5e0ccc97@citrix.com>
 <1e165c9cff8827288097eec56f538f4e63771757.camel@suse.com>
In-Reply-To: <1e165c9cff8827288097eec56f538f4e63771757.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5DEFA58CD9CC764BA6E431E4F712FAFB@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen: sched: refector code around
 vcpu_deassign() in null scheduler
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDUsIDIwMTksIGF0IDY6MzAgUE0sIERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lv
bGlAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCAyMDE5LTA4LTA1IGF0IDE3OjA0ICsw
MTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gT24gOC81LzE5IDQ6NTggUE0sIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+IE9uIDI2LjA3LjIwMTkgMDg6MjUsIERhcmlvIEZhZ2dpb2xpIHdyb3Rl
Og0KPj4+PiANCj4+PiAxKSBUaGUgY29tbWl0IGlzIGVtcHR5LCBwcmVzdW1hYmx5IGJlY2F1c2Ug
SSBkaWQgYXBwbHkgdGhlIHBhdGNoIGENCj4+PiBmZXcNCj4+PiBkYXlzIGFnbyBhbHJlYWR5Lg0K
Pj4+IA0KPj4+IDIpIFRoZSBjb21taXR0ZXIgaXMgcmVjb3JkZWQgYXMgIlBhdGNoZXcgSW1wb3J0
ZXIgPA0KPj4+IGltcG9ydGVyQHBhdGNoZXcub3JnPiIuDQo+Pj4gRG8gd2UgcmVhbGx5IHdhbnQg
dG8gaGlkZSB0aGUgZmFjdCB3aG8gaGFzIGJlZW4gY29tbWl0dGluZyBhIHBhdGNoPw0KPj4+IFdo
aWxlIGl0J3MgbW9zdGx5IG1lY2hhbmljYWwsIHRoZXJlJ3Mgc3RpbGwgdGhlIGh1bWFuIGRlY2lz
aW9uIG9mDQo+Pj4gInRoaXMNCj4+PiBpcyByZWFkeSB0byBnbyBpbiIgaW52b2x2ZWQsIHdoaWNo
IEkgZG9uJ3QgdGhpbmsgYSBib3QgY2FuIHJlbGlhYmx5DQo+Pj4gdGFrZQ0KPj4+IGluIGFsbCBj
YXNlcy4NCj4+IA0KPj4gQm90aCBvZiB0aGVzZSBhcmUgbWlzdGFrZXMsIGFuZCBkdWUgdG8gdGhl
IGZhY3QgdGhhdCBJIGBnaXQgZmV0Y2hgZWQNCj4+IHBhdGNoZXcncyBjb21taXQgcmF0aGVyIHRo
YW4gZG9pbmcgYGdpdCBhbWAgb2YgdGhlIG1ib3ggcHJvdmlkZWQgYnkNCj4+IHBhdGNoZXcuICAo
QW5kIEkgdXNlZCBwYXRjaGV3J3MgY29tbWl0IGJlY2F1c2Ugc29tZWhvdyA0LzQgZGlkbid0DQo+
PiByZWFjaA0KPj4gbXkgaW5ib3guKQ0KPj4gDQo+IEFuZCB0aGlzIGxhc3QgcGFydCBpcyBhcHBh
cmVudGx5IG15IGZhdWx0LCBhcyB5b3VyIGVtYWlsIGFkZHJlc3MgaXMNCj4gYWN0dWFsbHkgd3Jv
bmcsIGluIHRoZSBDYyBsaW5lIG9mIHRoYXQgcGF0Y2guDQoNClRoYXQgd291bGQgZXhwbGFpbiBp
dC4gOi0pICBCdXQgdGhhdOKAmXMgYnkgbm8gbWVhbnMgeW91ciDigJxmYXVsdOKAnTogSXTigJlz
IHZlcnkgY29tbW9uIGZvciBtZSB0byBvbmx5IGJlIEND4oCZZCBvbiBhIHN1YnNldCBvZiBwYXRj
aGVzIGluIGEgc2VyaWVzIChlLmcuLCBiZWNhdXNlIEnigJltIHRoZSBtYWludGFpbmVyIGZvciBz
b21lIHBhdGNoZXMgYnV0IG5vdCBvdGhlcnMpLCBzbyDigJxyZWNlaXZpbmcgYSBvbmx5IGEgc3Vi
c2V0IG9mIHBhdGNoZXPigJ0gaXMgc29tZXRoaW5nIG15IHdvcmtmbG93IHNob3VsZCBoYW5kbGUg
ZWZmZWN0aXZlbHkgYnV0IGRpZG7igJl0Lg0KDQogLUdlb3JnZQ0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
