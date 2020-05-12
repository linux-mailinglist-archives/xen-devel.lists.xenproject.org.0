Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B611CFC32
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 19:31:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYYk1-0001yT-Id; Tue, 12 May 2020 17:30:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYYjz-0001yO-LS
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 17:30:51 +0000
X-Inumbo-ID: 52ceba82-9476-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52ceba82-9476-11ea-ae69-bc764e2007e4;
 Tue, 12 May 2020 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589304650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jeEIi6O9DfW5vd4wbQe4U3bA76B9Sp2NDnFWHd3O+WU=;
 b=XmjDJv1er7sNIU1DA8Ftza6Pxw49ENwYwM35yxuXIYVCqRZfSoa0SNti
 o3XdByvUjBRn24M+fE4BtfO5OiiAKSg+enSLmokEbHK0vSU/s2iFBsMf6
 z2yBFUUCRhyMUpmpGiScCVRa0akghsU+xZl4iEfL09y5qpfhSNlFpMvPw w=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: aO5QLcyCmQjQNXIF5GPVKYjW+RDf+QaENEIIZGUxy32tXnmKkc/FvsPB7eHKF5/Qnh6zdU9Etc
 y+nEtLtu2dCIh3W5qMFZU0ZkD3K0wTOknJV0e4JWiMWTT8EAkU5eSP8I+dq6JGX/OWJ1zAD4dd
 8CnlwoiCVrOUiYateEwNsjGE1858SEp04bLA8RSas04pNXOBoVriyJgQLTGaQb93oaP/3+2/yF
 g2GUbwYi26SGFmjS6zVs4Tue/1DZwtlquckmTNXPlu528LRZF2uMAw1hPjGVARRussn9xGGcew
 UvM=
X-SBRS: 2.7
X-MesageID: 17618266
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17618266"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Topic: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Index: AQHWHzfMuMNvM1D6EUuQ5HJvPIpidKikdZCAgAAILACAAChygA==
Date: Tue, 12 May 2020 17:30:47 +0000
Message-ID: <294923FB-07D4-4CEB-9B29-3450DB454000@citrix.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
 <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
 <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
In-Reply-To: <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F7213EFDCE91645BAFE4403BE39DC72@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIE1heSAxMiwgMjAyMCwgYXQgNDowNiBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBbQ0FVVElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBO
T1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2
ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0K
PiBPbiBUdWUsIE1heSAxMiwgMjAyMCBhdCAxMDozNiBBTSBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4+IE9uIEFwciAzMCwg
MjAyMCwgYXQgMTA6MzkgUE0sIE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBnbWFpbC5jb20+IHdy
b3RlOg0KPj4+IA0KPj4+IEluaXRpYWxpemUgdGhlIHhlbmxpZ2h0IEdvIG1vZHVsZSB1c2luZyB0
aGUgeGVuYml0cyBnaXQtaHR0cCBVUkwsDQo+Pj4geGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3hl
bi5naXQvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0LCBhbmQgdXBkYXRlIHRoZQ0KPj4+IFhFTl9HT0NP
REVfVVJMIHZhcmlhYmxlIGluIHRvb2xzL1J1bGVzLm1rIGFjY29yZGluZ2x5Lg0KPj4+IA0KPj4+
IFNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+
Pj4gLS0tDQo+Pj4gdG9vbHMvUnVsZXMubWsgICAgICAgICAgICAgICB8IDIgKy0NCj4+PiB0b29s
cy9nb2xhbmcveGVubGlnaHQvZ28ubW9kIHwgMSArDQo+Pj4gMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L2dvLm1vZA0KPj4+IA0KPj4+IGRpZmYgLS1naXQgYS90b29scy9SdWxl
cy5tayBiL3Rvb2xzL1J1bGVzLm1rDQo+Pj4gaW5kZXggNWI4Y2Y3NDhhZC4uY2EzM2NjN2IzMSAx
MDA2NDQNCj4+PiAtLS0gYS90b29scy9SdWxlcy5taw0KPj4+ICsrKyBiL3Rvb2xzL1J1bGVzLm1r
DQo+Pj4gQEAgLTM2LDcgKzM2LDcgQEAgZGVidWcgPz0geQ0KPj4+IGRlYnVnX3N5bWJvbHMgPz0g
JChkZWJ1ZykNCj4+PiANCj4+PiBYRU5fR09QQVRIICAgICAgICA9ICQoWEVOX1JPT1QpL3Rvb2xz
L2dvbGFuZw0KPj4+IC1YRU5fR09DT0RFX1VSTCAgICA9IGdvbGFuZy54ZW5wcm9qZWN0Lm9yZw0K
Pj4+ICtYRU5fR09DT0RFX1VSTCAgICA9IHhlbmJpdHMueGVuLm9yZy9naXQtaHR0cC94ZW4uZ2l0
L3Rvb2xzL2dvbGFuZw0KPj4gDQo+PiBUaGUgcHJpbWFyeSBlZmZlY3Qgb2YgdGhpcyB3aWxsIGJl
IHRvIGluc3RhbGwgdGhlIGNvZGUgaW4gJFBSRUZJWC9zaGFyZS9nb2NvZGUveGVuYml0cy54ZW4u
b3JnL2dpdC1odHRwL3hlbi5naXQvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0IHdoZW4gbWFraW5nIGRl
YmJhbGxzIG9yIGRvaW5nIGBtYWtlIGluc3RhbGxgLg0KPj4gDQo+PiBJIGRvbuKAmXQgaW1tZWRp
YXRlbHkgc2VlIHRoZSBhZHZhbnRhZ2Ugb2YgdGhhdCwgcGFydGljdWxhcmx5IGlmIHdl4oCZcmUg
c3RpbGwgdGhpbmtpbmcgYWJvdXQgaGF2aW5nIGEg4oCccHJldHRpZXLigJ0gcGF0aCBhdCBzb21l
IHBvaW50IGluIHRoZSBmdXR1cmUuICBXaGF0IHdhcyB5b3VyIHRoaW5raW5nIGhlcmU/DQo+IA0K
PiBXaXRoIHRoZSBtb2R1bGUgYmVpbmcgZGVmaW5lZCBhcyBgeGVuYml0cy54ZW4ub3JnLy4uLmAs
IHRoZSBgYnVpbGRgDQo+IE1ha2UgdGFyZ2V0IHdpbGwgZmFpbCBhcy1pcyBmb3IgYSBtb2R1bGUt
YXdhcmUgdmVyc2lvbiBvZiBnbyAoYmVjYXVzZQ0KPiBpdCBjYW5ub3QgZmluZCBhIG1vZHVsZSBu
YW1lZCBgZ29sYW5nLnhlbnByb2plY3Qub3JnL3hlbmxpZ2h0YCkuIFNvLA0KPiB0aGUgcmVhc29u
IGZvciB0aGlzIGNoYW5nZSBpcyB0byBwcmVzZXJ2ZSB0aGUgZXhpc3RpbmcgZnVuY3Rpb25hbGl0
eQ0KPiBvZiB0aGF0IE1ha2UgdGFyZ2V0LiBDaGFuZ2luZyBYRU5fR09DT0RFX1VSTCBzZWVtZWQg
bGlrZSB0aGUgY29ycmVjdA0KPiBjaGFuZ2UsIGJ1dCBJJ20gb3BlbiB0byBzdWdnZXN0aW9ucy4N
Cg0KT2guICBCdXQgbm8sIHRoYXTigJlzIG5vdCBhdCBhbGwgd2hhdCB3ZSB3YW50Lg0KDQpUaGUg
d2hvbGUgcG9pbnQgb2YgcnVubmluZyDigJhnbyBidWlsZOKAmSBpcyB0byBtYWtlIHN1cmUgdGhh
dCAqdGhlIGNvZGUgd2UganVzdCBjb3BpZWQqIOKAlCB0aGUgY29kZSByaWdodCBub3cgaW4gb3Vy
IG93biBsb2NhbCB0cmVlLCBwZXJoYXBzIHdoaWNoIHdhcyBqdXN0IGdlbmVyYXRlZCDigJQgYWN0
dWFsbHkgY29tcGlsZXMuDQoNCkl0IGxvb2tzIGxpa2Ugd2hlbiB3ZSBhZGQgdGhlIGBnby5tb2Rg
IGZ1cnRoZXIgdXAgdGhlIHRyZWUsIGl0IG1ha2VzIGBnbyBidWlsZGAgaWdub3JlIHRoZSBHT1BB
VEggZW52aXJvbm1lbnQgdmFyaWFibGUgd2XigJlyZSBnaXZpbmcgaXQsIHdoaWNoIGNhdXNlcyB0
aGUgYnVpbGQgZmFpbHVyZS4gIEJ1dCB5b3VyIOKAnGZpeOKAnSBkb2VzbuKAmXQgbWFrZSBpdCB1
c2UgdGhlIGluLXRyZWUgZ28gY29kZSBhZ2FpbjsgaW5zdGVhZCBpdCBsb29rcyBsaWtlIGl0IGNh
dXNlcyBgZ28gYnVpbGRgIGNvbW1hbmQgdG8gZ28gYW5kIGZldGNoIHRoZSBtb3N0IHJlY2VudCBg
bWFzdGVyYCB2ZXJzaW9uIGZyb20geGVuYml0cywgaWdub3JpbmcgdGhlIGdvIGNvZGUgaW4gdGhl
IHRyZWUgY29tcGxldGVseS4gOi0pDQoNCiAtR2Vvcmdl

