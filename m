Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D961CF59B
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 15:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYUsW-0003rN-NC; Tue, 12 May 2020 13:23:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYUsV-0003rI-0B
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 13:23:23 +0000
X-Inumbo-ID: bfb9954a-9453-11ea-a2a3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfb9954a-9453-11ea-a2a3-12813bfff9fa;
 Tue, 12 May 2020 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589289802;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=aCYl2QzDO1ZRyNR2qCPMJ34zvSlUI4OBjX4LJIuFsYk=;
 b=IipGkX627DXkxE0G+G2qOfITXmMuWF6qZOyTXQ2W575NV8W8u7E2Gvwx
 GCiYYueXd4AIWYA4TmfcpuFm3dZ2r+kIlhgkSKEnl/fYh5TcoeVHIuaYn
 zGuETlhoFraLqIjvSeonISigErUfcKIGXnSVzYEKWgO27dxTNBWOhO0nk 4=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: aJxO6Y5oMvLWSh28PJ4mUV68jCAICCitJYcw7yacTTsmlKSc/XKWXYG3626LXMDar0FfgnuRmo
 Ud28dy0F7UmquHV6bxHttpSO5wYJnucxrJbcgSyuHyDhllJ25ID1xTq3qu37m7t01KNAK4dUJK
 1WUsAZUpu/U2eOELRZQ5NrmkOgQPGBgtCroPX5CCLdw5MnwwKASmsblmVYkU/AGaky7GbZN+sl
 cJQCMBJCt0LvU6FHoHpFNjpc/YS3brejpY27pQp/BUCXqudWrwscytO1HkPuxQxtYn+Gjfo3Qg
 Pls=
X-SBRS: 2.7
X-MesageID: 17307178
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,383,1583211600"; d="go'?scan'208";a="17307178"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH v2 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Topic: [PATCH v2 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Index: AQHWGeTLlIhJvo8WaUufFBMrVdiAt6iM0gqAgABiaYCAFzc7AA==
Date: Tue, 12 May 2020 13:23:18 +0000
Message-ID: <47D89BFE-68EE-4E2F-80C0-6E6444CBDB04@citrix.com>
References: <cover.1587682041.git.rosbrookn@ainfosec.com>
 <73e709cf0a87f3728de438e4a3b849462fd098ac.1587682041.git.rosbrookn@ainfosec.com>
 <59C12770-F12A-45B7-AB62-8BB3A0DC96D8@citrix.com>
 <CAEBZRSdtmyuKP4+yv8-2FjAkmBAc8L9MNr9r5cT4yUcyNM_v=g@mail.gmail.com>
In-Reply-To: <CAEBZRSdtmyuKP4+yv8-2FjAkmBAc8L9MNr9r5cT4yUcyNM_v=g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: multipart/mixed;
 boundary="_002_47D89BFE68EE4E2F80C06E6444CBDB04citrixcom_"
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--_002_47D89BFE68EE4E2F80C06E6444CBDB04citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E57966DCBB0F64DAD62B0E218DFCBC3@citrix.com>
Content-Transfer-Encoding: base64

DQoNCj4gT24gQXByIDI3LCAyMDIwLCBhdCA3OjUxIFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgQXByIDI3LCAyMDIwIGF0IDg6NTkg
QU0gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4+IA0K
Pj4gDQo+PiANCj4+PiBPbiBBcHIgMjQsIDIwMjAsIGF0IDQ6MDIgQU0sIE5pY2sgUm9zYnJvb2sg
PHJvc2Jyb29rbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE1hbnkgZXhwb3J0ZWQgZnVu
Y3Rpb25zIGluIHhlbmxpZ2h0IHJlcXVpcmUgYSBkb21pZCBhcyBhbiBhcmd1bWVudC4gTWFrZQ0K
Pj4+IGl0IGVhc2llciBmb3IgcGFja2FnZSB1c2VycyB0byB1c2UgdGhlc2UgZnVuY3Rpb25zIGJ5
IGFkZGluZyB3cmFwcGVycw0KPj4+IGZvciB0aGUgbGlieGwgdXRpbGl0eSBmdW5jdGlvbnMgbGli
eGxfbmFtZV90b19kb21pZCBhbmQNCj4+PiBsaWJ4bF9kb21pZF90b19uYW1lLg0KPj4+IA0KPj4+
IFNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+
Pj4gLS0tDQo+Pj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgMzggKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4+IDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFu
Zy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5n
bw0KPj4+IGluZGV4IDZiNGY0OTI1NTAuLmQxZDMwYjYzZTEgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvDQo+Pj4gKysrIGIvdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L3hlbmxpZ2h0LmdvDQo+Pj4gQEAgLTIxLDEzICsyMSwxMyBAQCBwYWNrYWdlIHhlbmxp
Z2h0DQo+Pj4gI2NnbyBMREZMQUdTOiAtbHhlbmxpZ2h0IC1seWFqbCAtbHhlbnRvb2xsb2cNCj4+
PiAjaW5jbHVkZSA8c3RkbGliLmg+DQo+Pj4gI2luY2x1ZGUgPGxpYnhsLmg+DQo+Pj4gKyNpbmNs
dWRlIDxsaWJ4bF91dGlscy5oPg0KPj4+IA0KPj4+IHN0YXRpYyBjb25zdCBsaWJ4bF9jaGlsZHBy
b2NfaG9va3MgY2hpbGRwcm9jX2hvb2tzID0geyAuY2hsZG93bmVyID0gbGlieGxfc2lnY2hsZF9v
d25lcl9tYWlubG9vcCB9Ow0KPj4+IA0KPj4+IHZvaWQgeGVubGlnaHRfc2V0X2NobGRwcm9jKGxp
YnhsX2N0eCAqY3R4KSB7DQo+Pj4gICAgICBsaWJ4bF9jaGlsZHByb2Nfc2V0bW9kZShjdHgsICZj
aGlsZHByb2NfaG9va3MsIE5VTEwpOw0KPj4+IH0NCj4+PiAtDQo+Pj4gKi8NCj4+PiBpbXBvcnQg
IkMiDQo+Pj4gDQo+Pj4gQEAgLTc1LDYgKzc1LDEwIEBAIHZhciBsaWJ4bEVycm9ycyA9IG1hcFtF
cnJvcl1zdHJpbmd7DQo+Pj4gICAgICBFcnJvckZlYXR1cmVSZW1vdmVkOiAgICAgICAgICAgICAg
ICJGZWF0dXJlIHJlbW92ZWQiLA0KPj4+IH0NCj4+PiANCj4+PiArY29uc3QgKA0KPj4+ICsgICAg
IERvbWlkSW52YWxpZCBEb21pZCA9IF5Eb21pZCgwKQ0KPj4gDQo+PiBOb3QgdG8gYmUgYSBzdGlj
a2xlciwgYnV0IGFyZSB3ZSBwb3NpdGl2ZSB0aGF0IHRoaXMgd2lsbCBhbHdheXMgcmVzdWx0IGlu
IHRoZSBzYW1lIHZhbHVlIGFzIEMuSU5WQUxJRF9ET01JRD8NCj4+IA0KPj4gVGhlcmUgYXJlIHNv
bWUgZnVuY3Rpb25zIHRoYXQgd2lsbCByZXR1cm4gSU5WQUxJRF9ET01JRCwgb3IgYWNjZXB0IElO
VkFMSURfRE9NSUQgYXMgYW4gYXJndW1lbnQuICBVc2VycyBvZiB0aGUgYHhlbmxpZ2h0YCBwYWNr
YWdlIHdpbGwgcHJlc3VtYWJseSBuZWVkIHRvIGNvbXBhcmUgYWdhaW5zdCB0aGlzIHZhbHVlIGFu
ZC9vciBwYXNzIGl0IGluLg0KPj4gDQo+PiBJdCBzZWVtcyBsaWtlIHdlIGNvdWxkOg0KPj4gDQo+
PiAxLiBSZWx5IG9uIGxhbmd1YWdlIGxhd3llcmluZyB0byBqdXN0aWZ5IG91ciBhc3N1bXB0aW9u
IHRoYXQgXkRvbWlkKDApIHdpbGwgYWx3YXlzIGJlIHRoZSBzYW1lIGFzIEMg4oCcfjDigJ0NCj4+
IA0KPj4gMi4gT24gbWFyc2hhbGxpbmcgaW50byAvIG91dCBvZiBDLCBjb252ZXJ0IEMuSU5WQUxJ
RF9ET01JRCB0byBEb21pZEludmFsaWQNCj4+IA0KPj4gMy4gU2V0IERvbWlkID0gQy5JTlZBTElE
X0RPTUlEDQo+IA0KPiBJIGp1c3QgdGVzdGVkIHRoaXMgd2F5LCBhbmQgaXQgZG9lcyBub3Qgd29y
ayBhcyBleHBlY3RlZC4gU2luY2UNCj4gQy5JTlZBTElEX0RPTUlEIGlzICNkZWZpbmUnZCwgY2dv
IGRvZXMgbm90IGtub3cgaXQgaXMgaW50ZW5kZWQgdG8gYmUNCj4gdXNlZCBhcyB1aW50MzJfdCwg
YW5kIGRlY2lkZXMgdG8gZGVjbGFyZSBDLklOVkFMSURfRE9NSUQgYXMgaW50LiBTbywNCj4gQy5J
TlZBTElEX0RPTUlEID0gXmludCgwKSA9IC0xLCB3aGljaCBvdmVyZmxvd3MgRG9taWQuDQo+IA0K
PiBJIHRyaWVkIGEgZmV3IHRoaW5ncyBpbiB0aGUgY2dvIHByZWFtYmxlIHdpdGhvdXQgYW55IGx1
Y2suDQo+IEVzc2VudGlhbGx5LCBvbmUgY2Fubm90IGRlZmluZSBhIGNvbnN0IHVpbnQzMl90IGlu
IEMgc3BhY2UsIGFuZCB1c2UNCj4gdGhhdCB0byBkZWZpbmUgYSBjb25zdCBpbiBHbyBzcGFjZS4N
Cj4gDQo+IEFueSBpZGVhcz8NCg0KVGhlIGZvbGxvd2luZyBzZWVtcyB0byB3b3JrIGZvciBtZS4g
IEluIHRoZSBDIHNlY3Rpb246DQoNCi8vICNkZWZpbmUgSU5WQUxJRF9ET01JRF9UWVBFRCAoKHVp
bnQzMl90KUlOVkFMSURfRE9NSUQpDQoNClRoZW46DQoNCiAgICBEb21pZEludmFsaWQgRG9taWQg
PSBDLklOVkFMSURfRE9NSURfVFlQRUQNCg0KQXR0YWNoZWQgaXMgYSBQb0MuICBXaGF0IGRvIHlv
dSB0aGluaz8NCg0KIC1HZW9yZ2UNCg0K

--_002_47D89BFE68EE4E2F80C06E6444CBDB04citrixcom_
Content-Type: application/octet-stream; name="invalid-domid-test.go"
Content-Description: invalid-domid-test.go
Content-Disposition: attachment; filename="invalid-domid-test.go"; size=315;
	creation-date="Tue, 12 May 2020 13:23:18 GMT";
	modification-date="Tue, 12 May 2020 13:23:18 GMT"
Content-ID: <B88E1AB4B3F5A44CB78B48815091B9F8@citrix.com>
Content-Transfer-Encoding: base64

cGFja2FnZSBtYWluDQoNCmltcG9ydCAoDQoJImZtdCINCikNCg0KLy8gI2luY2x1ZGUgPHN0ZGlu
dC5oPg0KLy8gI2RlZmluZSBJTlZBTElEX0RPTUlEIH4wDQovLw0KLy8gI2RlZmluZSBJTlZBTElE
X0RPTUlEX1ZBTFVFICgodWludDMyX3QpSU5WQUxJRF9ET01JRCkNCmltcG9ydCAiQyINCg0KdHlw
ZSBEb21pZCB1aW50MzINCg0KY29uc3QgRG9taWRJbnZhbGlkIERvbWlkID0gQy5JTlZBTElEX0RP
TUlEX1ZBTFVFDQoNCmZ1bmMgbWFpbigpIHsNCglmbXQuUHJpbnRmKCJJTlZBTElEX0RPTUlEIHZh
bHVlOiAldlxuIiwgRG9taWRJbnZhbGlkKQ0KfQ0K

--_002_47D89BFE68EE4E2F80C06E6444CBDB04citrixcom_--

