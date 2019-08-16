Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9C900E7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 13:44:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyabZ-0005sU-W2; Fri, 16 Aug 2019 11:41:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4MO=WM=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hyabZ-0005sP-7g
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 11:41:13 +0000
X-Inumbo-ID: be8451c8-c01a-11e9-8bb4-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be8451c8-c01a-11e9-8bb4-12813bfff9fa;
 Fri, 16 Aug 2019 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565955672;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8IppRQFjeYMtZp42MoZs1pY5Sw/ikdg4IsAmeK6UMWY=;
 b=Emwf9XKsib5Km8edx459P0jHRUe4N5GlcF7RLlqJv32z/Ao/4GGS6XdQ
 7cKpHOU8Ay18VUA6e4ENzjjgjBgaYl7fKXFkflau/E3Y0XRYzK5Qg95iJ
 n6MLIAk8zf5OTXZi+vJIScksotlGPTluPn/BND2Stff+Rxh7FvXq6BOlt 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: szzWrMMxNmyXkIgBNdDRq+bAKBlr+4S1GN04Awg3LmNdYeljprCoWw4/Fbr1KaLi0BUVPcke+x
 upETdJb6WN34s9Le1ds1yXIWL/P1fAbSw/GnSN3M4441qwoLc6nGzL9dspYpBWzso3V0SETgAW
 yDKUHmikALqfrd3nj3Gi2lS/KJkZg2L7j3nPTg39mBHcWbsT2JDBbNf46TsDjavxDIhG4yWZeO
 Nixo8+IJ0V7QSCb6mJW3pPCPVpDPGmT2J1vPTbZlW2h0uz5Zjpwhw10ttTjUfOSzK2kaOxgS6C
 lck=
X-SBRS: 2.7
X-MesageID: 4363374
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4363374"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] get_maintainers.pl: Enable running the script on
 unikraft repos
Thread-Index: AQHVVB9hME1wKi+b/kmlNBfEOZeOsKb9eGYAgAAdkgA=
Date: Fri, 16 Aug 2019 11:41:06 +0000
Message-ID: <65A5E02B-8141-4047-BEA0-946F344D8E44@citrix.com>
References: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
 <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
In-Reply-To: <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <DB9241F3BA0B1549AB72BCF5E835A146@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
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
Cc: Felipe Huici <felipe.huici@neclab.eu>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Florian Schmidt <florian.schmidt@neclab.eu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLA0KDQrvu79PbiAxNi8wOC8yMDE5LCAxMTo1NSwgIkp1bGllbiBHcmFsbCIgPGp1
bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToNCg0KICAgIEhpIExhcnMsDQogICAgDQogICAgT24g
MTYvMDgvMjAxOSAxMTo0MiwgTGFycyBLdXJ0aCB3cm90ZToNCiAgICA+IFVuaWtyYWZ0IHJlcG9z
IGZvbGxvdyB0aGUgc2FtZSBzeW50YXggYXMgeGVuLmdpdCB3aXRoIHRoZQ0KICAgID4gZm9sbG93
aW5nIGV4Y2VwdGlvbnM6DQogICAgPiAqIE1BSU5UQUlORVJTIGZpbGVzIGFyZSBjYWxsZWQgTUFJ
TlRBSU5FUlMubWQNCiAgICA+ICogTTogLi4uIGV0YyBibG9ja3MgYXJlIHByZWNlZGVkIGJ5IHdo
aXRlc3BhY2VzIGZvciByZW5kZXJpbmcgYXMNCiAgICA+ICAgIG1hcmt1cCBmaWxlcw0KICAgIA0K
ICAgIFRoZXJlIGlzIGFuIG90aGVyIGRpZmZlcmVuY2UuIFRoZSAiZmFsbGJhY2siIGNhdGVnb3J5
IGlzICJVTklLUkFGVCBHRU5FUkFMIiBhbmQgDQogICAgbm90ICJUSEUgUkVTVCIuDQoNClRoYXQg
aXMgcmlnaHQuIEJ1dCBjdXJyZW50bHkgZ2V0X21haW50YWluZXJzLnBsOiB0b3RhbGx5IGlnbm9y
ZXMgdGhlIGhlYWRsaW5lcy4gDQpJdCBqdXN0IHJlYWRzDQpNOiAuLi4NClI6IC4uLg0KRXRjLg0K
DQpXaGF0IGlzIGRpZmZlcmVudCBpcyB0aGF0ICJVTklLUkFGVCBHRU5FUkFMIiBkb2VzIG5vdCBj
b250YWluDQpGOiBlbnRyaWVzLCB3aGljaCBoYXZlIHRvIGJlIGFkZGVkLCBvdGhlcndpc2Ugbm8g
ZS1tYWlsIGFkZHJlc3Nlcw0KZnJvbSB0aGUgc2VjdGlvbiBhcmUgYWRkZWQuIFNvIEkgd2FzIGdv
aW5nIHRvIHNlbmQgYSBwYXRjaCB0byBmaXggdGhpcy4NCiAgICANCiAgICA+IFRoaXMgY2hhbmdl
IHdpbGwNCiAgICA+IC0gbG9hZCBNQUlOVEFJTkVSUy5tZCBpZiBNQUlOVEFJTkVSUyBpcyBub3Qg
cHJlc2VudA0KICAgID4gLSBkZWFsIHdpdGggaW5kZW50ZWQgTTogLi4uIGJsb2Nrcw0KICAgIA0K
ICAgIE9uZSBwcm9jZXNzIHF1ZXN0aW9uLiBEb2VzIGl0IG1lYW4gVW5pa3JhZnQgZm9sa3Mgd2ls
bCBoYXZlIHRvIGNoZWNrb3V0IFhlbiBpbiANCiAgICBvcmRlciB0byB1c2Uge2FkZCwgZ2V0fV9t
YWludGFpbmVycy5wbD8gSWYgc28sIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSANCiAgICBh
ZGRfbWFpbnRhaW5lcnMucGwgYW5kIHNjcmlwdF9tYWludGFpbmVycy5wbCBpbiBhIHNlcGFyYXRl
IHJlcG8gdGhhdCBjYW4gYmUgDQogICAgYWRkZWQgYXMgc3VibW9kdWxlPw0KDQpUaGUgd2F5IGhv
dyB0aGUgY29kZSBpcyB3cml0dGVuIHRoZXkgd291bGQgZWl0aGVyIGhhdmUgdG8gY2hlY2sgb3V0
IHRoZSANCnJlcG8gb3IganVzdCBnZXQgdGhlIHR3byBzY3JpcHRzIGFuZCBwdXQgdGhlbSBpbiB0
aGUgc2FtZSBkaXJlY3Rvcnkgc29tZXdoZXJlDQpvbiB0aGUgcGF0aC4NCg0KRm9yIHRoaW5ncyBs
aWtlIG1pbmktb3MsIHh0Ziwgb3NzdGVzdCwgLi4uIHlvdSB3b3VsZCBhbHdheXMgaGF2ZSBhIHhl
bi5naXQgc29tZXdoZXJlDQpJbiB0aGUgdW5pa3JhZnQgY2FzZSB0aGF0IGlzIGRpZmZlcmVudC4g
V2UgY291bGQgYnJlYWsgaXQgb3V0LCBidXQgbWF5YmUgd2UgY2FuIGRvIHRoaXMNCmF0IGEgbGF0
ZXIgcG9pbnQgaW4gdGltZS4NCg0KICAgID4gU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFy
cy5rdXJ0aEBjaXRyaXguY29tPg0KICAgID4gLS0tDQogICAgPiBDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCiAgICA+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGV1LmNpdHJpeC5jb20+DQogICAgPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+DQogICAgPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPg0KICAgID4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQogICAg
PiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KICAg
ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCiAgICA+
IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4NCiAgICA+IENjOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPg0KICAgID4gDQogICAgPiBDQzogU2ltb24gS3VlbnplciA8c2ltb24ua3VlbnplckBuZWNs
YWIuZXU+DQogICAgPiBDQzogRmxvcmlhbiBTY2htaWR0IDxmbG9yaWFuLnNjaG1pZHRAbmVjbGFi
LmV1Pg0KICAgID4gQ0M6IEZlbGlwZSBIdWljaSA8ZmVsaXBlLmh1aWNpQG5lY2xhYi5ldT4NCiAg
ICA+IC0tLQ0KICAgID4gICBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIHwgMTQgKysrKysrKysr
Ky0tLS0NCiAgICA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQogICAgPiANCiAgICA+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2dldF9tYWludGFpbmVy
LnBsIGIvc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbA0KICAgID4gaW5kZXggZjFlOWM5MDRlZS4u
YmRiMDlmOGY2NSAxMDA3NTUNCiAgICA+IC0tLSBhL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwN
CiAgICA+ICsrKyBiL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwNCiAgICA+IEBAIC0yODQsMTIg
KzI4NCwxOCBAQCBpZiAoIXRvcF9vZl90cmVlKCR4ZW5fcGF0aCkpIHsNCiAgICA+ICAgbXkgQHR5
cGV2YWx1ZSA9ICgpOw0KICAgID4gICBteSAla2V5d29yZF9oYXNoOw0KICAgID4gICANCiAgICA+
IC1vcGVuIChteSAkbWFpbnQsICc8JywgIiR7eGVuX3BhdGh9TUFJTlRBSU5FUlMiKQ0KICAgID4g
LSAgICBvciBkaWUgIiRQOiBDYW4ndCBvcGVuIE1BSU5UQUlORVJTOiAkIVxuIjsNCiAgICA+ICtt
eSAkbWFpbnQ7DQogICAgPiArbXkgJG1haW50YWluZXJzX2ZpbGUgPSAiTUFJTlRBSU5FUlMiOw0K
ICAgID4gK2lmICghIG9wZW4gKCRtYWludCwgJzwnLCAke3hlbl9wYXRofS4kbWFpbnRhaW5lcnNf
ZmlsZSkpIHsNCiAgICA+ICsgICAgJG1haW50YWluZXJzX2ZpbGUgPSAiTUFJTlRBSU5FUlMubWQi
Ow0KICAgID4gKyAgICBvcGVuICgkbWFpbnQsICc8JywgJHt4ZW5fcGF0aH0uJG1haW50YWluZXJz
X2ZpbGUpDQogICAgPiArICAgICAgICBvciBkaWUgIiRQOiBDYW4ndCBvcGVuIE1BSU5UQUlORVJT
IG9yIE1BSU5UQUlORVJTLm1kOiAkIVxuIjsNCiAgICA+ICt9DQogICAgPiArDQogICAgPiAgIHdo
aWxlICg8JG1haW50Pikgew0KICAgID4gICAgICAgbXkgJGxpbmUgPSAkXzsNCiAgICA+ICAgDQog
ICAgPiAtICAgIGlmICgkbGluZSA9fiBtL14oW0EtWl0pOlxzKiguKikvKSB7DQogICAgPiArICAg
IGlmICgkbGluZSA9fiBtL15ccyooW0EtWl0pOlxzKiguKikvKSB7DQogICAgDQogICAgQXMgeW91
IGFsbG93IHNwYWNlIGJlZm9yZSB0aGUgYmxvY2tzIE06LCB3b3VsZCBub3QgdGhpcyBjYXRjaCB0
aGUgZXhhbXBsZSBhdCB0aGUgDQogICAgYmVnaW5uaW5nIG9mIHRoZSBmaWxlPw0KICAgIA0KICAg
IAlNOiBNYWlsIHBhdGNoZXMgdG86IEZ1bGxOYW1lIDxhZGRyZXNzQGRvbWFpbj4NCiAgICAJUjog
RGVzaWduYXRlZCByZXZpZXdlcjogRnVsbE5hbWUgPGFkZHJlc3NAZG9tYWluPg0KDQpHb29kIHBv
aW50LiBXaGVuIEkgdGVzdGVkIGl0IChJIHNlbnQgdGhlIGxhc3QgZmV3IHBhdGNoZXMgd2l0aCB0
aGUgY2hhbmdlIGluIGl0KSwgDQppdCBkaWRuJ3QgcGljayB1cCB0aGUgZS1tYWlsIGFkZHJlc3Nl
cy4gSG93ZXZlciwgd2hlbiBJIGNoZWNrIHdpdGggcmVnZXgxMDEuY29tDQppdCBpcyBwaWNrZWQg
dXAuDQoNCldoaWNoIG1lYW5zIHRoYXQgdGhlIHZhbHVlcyBhcmUgcHVzaGVkIHRvIEB0eXBldmFs
dWUsIGFrYQ0KeyAiUiIsICAiRGVzaWduYXRlZCByZXZpZXdlcjogRnVsbE5hbWUgPGFkZHJlc3NA
ZG9tYWluPiIgfQ0KRXRjLg0KDQpAdHlwZXZhbHVlIHNlZW0gdG8gYmUgcHJvY2Vzc2VkIGJ5IGZp
bmRfZmlyc3Rfc2VjdGlvbigpLCANCmZpbmRfc3RhcnRpbmdfaW5kZXgoKSwgZmluZF9lbmRpbmdf
aW5kZXgoKSANCg0KQW5kIHRoZW4gYmFzaWNhbGx5IHRoZSBlbnRyaWVzIGFyZSBub3QgcHJvY2Vz
c2VkIGJlY2F1c2UgdGhlDQpibG9jayBpbiB0aGUgZXhhbXBsZSBpcyBub3QgY29uc2lzdGVudCBh
bmQgZmFpbHMgdGhlIHZhbGlkYXRpb24NCmZ1cnRoZXIgZG93biB0aGUgbGluZQ0KDQpGb3IgZXhh
bXBsZToNCi4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtLWVtYWlsIC0tZ2l0IC1mIC4NCkV0
Yy4NCg0KRG9uJ3QgbGlzdCB0aGUgZS1tYWlsIGFkZHJlc3NlcyBpbiB0aGUgZXhhbXBsZXMNCiAg
ICANClNvLCB3aGF0IEkgcHJvcG9zZWQgaXMgcHJvYmFibHkgZmFyIHRvbyBmcmFnaWxlIHRvIG1h
a2Ugc2Vuc2UuDQpBbmQgZG9pbmcgc29tZXRoaW5nIHdoaWNoIGlzIG1vcmUgYWNjdXJhdGUgd2ls
bCBwcm9iYWJseSANCnJlcXVpcmUgbWFqb3Igc3VyZ2VyeSB0byB0aGUgc2NyaXB0cy4NCg0KSSBj
YW4gbG9vayBhdCB0aGlzIGluIGEgYml0IG1vcmUgZGV0YWlsIGFuZCBzZWUgd2hldGhlciB0aGVy
ZQ0KaXMgYSB3YXkgdG8gaGFuZGxlIHRoaXMuDQoNCkJ1dCBJIGRvbid0IHdhbnQgdG8gaW52ZXN0
IHRoZSB0aW1lIHRvIGRvIHRoaXMgcmVhbGx5IGFzIHRoaXMNCmlzIHByb2JhYmx5IHJhdGhlciBj
b21wbGV4Lg0KDQpAU2ltb24sIEBGbG9yaWFuLCBARmVsaXBlOiB3b3VsZCB5b3UgYmUgd2lsbGlu
ZyB0bw0KY2hhbmdlIHRoZSBNQUlOVEFJTkVSUyBmaWxlcyBpbiB5b3VyIHJlcG9zIHN1Y2ggdGhh
dA0Kd2UgZG9uJ3QgaGF2ZSB0byBpbXBsZW1lbnQgbG90cyBvZiBtYWdpYyB0byBtYWtlIHRoZQ0K
cGF0Y2ggc2VuZGluZyBoZWxwZXIgc2NyaXB0cyB3b3JrIGZvciB5b3U/DQoNClJlZ2FyZHMNCkxh
cnMNCg0KICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
