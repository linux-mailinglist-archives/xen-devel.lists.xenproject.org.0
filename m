Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AB59019B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:32:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybLm-0001wY-RE; Fri, 16 Aug 2019 12:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hd7z=WM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hybLl-0001wP-Db
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:28:57 +0000
X-Inumbo-ID: 6a07337a-c021-11e9-b90c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a07337a-c021-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565958536;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xNZ7iLioHSZ8yLh5HhVB2SRwc1TNh76WDlrHD/lT8Zk=;
 b=IFPkYfh1QxYhYs9Z64sP6+HzADarD+EJK/OThmxNYI61l3EdVcEOWR/v
 7mPxuIUT5UgVbTWv4XrjaFF/C89sJrTja60tACs33FKN6RMITa62ot9fR
 SZoptB64Lou4CXPfJ6/LYIpEWpBf6tpzq3SyKTejXC0WdgFLP5hrdM1D5 c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V9r7FoRhF7RXi4vPLqA7Fiqo1fp+cPGi+XiIHYXMjxdHm0WL/GEc1sg3YfZEq+WjUu8ZpWwZAY
 SXPvuznbLqVx3Y07onwzMkza/1JyiQr7j/jLB7IvneMPvyhczot2BoEGPOepHskv+JeQrTDMPm
 o2nayNGfkL33R/WkQcehcWb8WyeiMGa8HQzqS4b3g774Ruoa2UFGnN5JjICK/98ctTJUjYtiTn
 Rjd/v89aOlhB4ciOqsVy4MuY0J5UQfO0T4/i6cMiCCKoGAkeEX7eSmTkYngcQaYlAb5yTR68rC
 hAo=
X-SBRS: 2.7
X-MesageID: 4549953
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4549953"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>, Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH] get_maintainers.pl: Enable running the
 script on unikraft repos
Thread-Index: AQHVVB+OkCutqGzFZEax3jYHn7xs06b9eGYAgAAGSoCAAA01gIAAIl1g///h7wCAACH5AA==
Date: Fri, 16 Aug 2019 12:28:51 +0000
Message-ID: <fa7028f3e28241b7b234c0313ccada9d@AMSPEX02CL03.citrite.net>
References: <4b535bb616f62ad685fef0f06d3b5138b1539688.1565951950.git.lars.kurth@citrix.com>
 <200d8505-6822-3d9f-98fe-e8d7e09d00b8@arm.com>
 <20190816111747.GB25409@perard.uk.xensource.com>
 <BE4FC00F-77B6-492C-8BBA-C3105FAA44F4@citrix.com>
 <3044b1da5b3442aea10d46f5d232cf0d@AMSPEX02CL03.citrite.net>
 <6DD1365F-7869-484E-B746-23EF8DA89270@citrix.com>
In-Reply-To: <6DD1365F-7869-484E-B746-23EF8DA89270@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
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
Cc: Felipe
 Huici <felipe.huici@neclab.eu>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, Florian Schmidt <florian.schmidt@neclab.eu>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXJzIEt1cnRoIDxsYXJzLmt1
cnRoQGNpdHJpeC5jb20+DQo+IFNlbnQ6IDE2IEF1Z3VzdCAyMDE5IDEzOjIwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgQW50aG9ueSBQZXJhcmQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbi5ncmFsbEBhcm0u
Y29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBGZWxpcGUgSHVpY2kg
PGZlbGlwZS5odWljaUBuZWNsYWIuZXU+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlDQo+IER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNv
bT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgVGltIChYZW4ub3Jn
KSA8dGltQHhlbi5vcmc+OyBGbG9yaWFuIFNjaG1pZHQgPGZsb3JpYW4uc2NobWlkdEBuZWNsYWIu
ZXU+Ow0KPiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBTaW1vbiBLdWVuemVyIDxz
aW1vbi5rdWVuemVyQG5lY2xhYi5ldT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SF0gZ2V0X21haW50YWluZXJzLnBsOiBFbmFibGUgcnVubmluZyB0aGUgc2NyaXB0IG9uIHVuaWty
YWZ0IHJlcG9zDQo+IA0KPiANCj4gDQo+IO+7v09uIDE2LzA4LzIwMTksIDEzOjA5LCAiUGF1bCBE
dXJyYW50IiA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gICAgID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gICAgID4gRnJvbTogTGFycyBLdXJ0aCA8bGFycy5r
dXJ0aEBjaXRyaXguY29tPg0KPiAgICAgPiBTZW50OiAxNiBBdWd1c3QgMjAxOSAxMzowNQ0KPiAg
ICAgPiBUbzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiAgICAgPiBDYzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBGZWxpcGUgSHVpY2kgPGZlbGlwZS5odWljaUBuZWNsYWIuZXU+
OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gICAgID4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsNCj4gR2VvcmdlDQo+ICAgICA+IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRy
aXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBK
YWNrc29uDQo+ICAgICA+IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgVGltIChYZW4ub3JnKSA8
dGltQHhlbi5vcmc+OyBGbG9yaWFuIFNjaG1pZHQNCj4gPGZsb3JpYW4uc2NobWlkdEBuZWNsYWIu
ZXU+Ow0KPiAgICAgPiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBTaW1vbiBLdWVu
emVyIDxzaW1vbi5rdWVuemVyQG5lY2xhYi5ldT47IFBhdWwgRHVycmFudA0KPiAgICAgPiA8UGF1
bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ICAgICA+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBb
UEFUQ0hdIGdldF9tYWludGFpbmVycy5wbDogRW5hYmxlIHJ1bm5pbmcgdGhlIHNjcmlwdCBvbiB1
bmlrcmFmdCByZXBvcw0KPiAgICAgPg0KPiAgICAgPiBBZGRlZCBQYXVsIER1cnJhbnQNCj4gICAg
ID4NCj4gICAgID4gT24gMTYvMDgvMjAxOSwgMTI6MTcsICJBbnRob255IFBFUkFSRCIgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+IHdyb3RlOg0KPiAgICAgPg0KPiAgICAgPiAgICAgT24gRnJp
LCBBdWcgMTYsIDIwMTkgYXQgMTE6NTU6MTZBTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0K
PiAgICAgPiAgICAgPiBIaSBMYXJzLA0KPiAgICAgPiAgICAgPg0KPiAgICAgPiAgICAgPiBPbiAx
Ni8wOC8yMDE5IDExOjQyLCBMYXJzIEt1cnRoIHdyb3RlOg0KPiAgICAgPiAgICAgPiA+IFVuaWty
YWZ0IHJlcG9zIGZvbGxvdyB0aGUgc2FtZSBzeW50YXggYXMgeGVuLmdpdCB3aXRoIHRoZQ0KPiAg
ICAgPiAgICAgPiA+IGZvbGxvd2luZyBleGNlcHRpb25zOg0KPiAgICAgPiAgICAgPiA+ICogTUFJ
TlRBSU5FUlMgZmlsZXMgYXJlIGNhbGxlZCBNQUlOVEFJTkVSUy5tZA0KPiAgICAgPiAgICAgPiA+
ICogTTogLi4uIGV0YyBibG9ja3MgYXJlIHByZWNlZGVkIGJ5IHdoaXRlc3BhY2VzIGZvciByZW5k
ZXJpbmcgYXMNCj4gICAgID4gICAgID4gPiAgICBtYXJrdXAgZmlsZXMNCj4gICAgID4gICAgID4N
Cj4gICAgID4gICAgID4gVGhlcmUgaXMgYW4gb3RoZXIgZGlmZmVyZW5jZS4gVGhlICJmYWxsYmFj
ayIgY2F0ZWdvcnkgaXMgIlVOSUtSQUZUIEdFTkVSQUwiDQo+ICAgICA+ICAgICA+IGFuZCBub3Qg
IlRIRSBSRVNUIi4NCj4gICAgID4gICAgID4NCj4gICAgID4gICAgID4gPg0KPiAgICAgPiAgICAg
PiA+IFRoaXMgY2hhbmdlIHdpbGwNCj4gICAgID4gICAgID4gPiAtIGxvYWQgTUFJTlRBSU5FUlMu
bWQgaWYgTUFJTlRBSU5FUlMgaXMgbm90IHByZXNlbnQNCj4gICAgID4gICAgID4gPiAtIGRlYWwg
d2l0aCBpbmRlbnRlZCBNOiAuLi4gYmxvY2tzDQo+ICAgICA+ICAgICA+DQo+ICAgICA+ICAgICA+
IE9uZSBwcm9jZXNzIHF1ZXN0aW9uLiBEb2VzIGl0IG1lYW4gVW5pa3JhZnQgZm9sa3Mgd2lsbCBo
YXZlIHRvIGNoZWNrb3V0IFhlbg0KPiAgICAgPiAgICAgPiBpbiBvcmRlciB0byB1c2Uge2FkZCwg
Z2V0fV9tYWludGFpbmVycy5wbD8gSWYgc28sIHdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8NCj4gICAg
ID4gICAgID4gaGF2ZSBhZGRfbWFpbnRhaW5lcnMucGwgYW5kIHNjcmlwdF9tYWludGFpbmVycy5w
bCBpbiBhIHNlcGFyYXRlIHJlcG8gdGhhdA0KPiAgICAgPiAgICAgPiBjYW4gYmUgYWRkZWQgYXMg
c3VibW9kdWxlPw0KPiAgICAgPg0KPiAgICAgPiAgICAgU2hvdWxkbid0IGluc3RlYWQgdGhlIFVu
aWtyYWZ0IHJlcG8gaGF2ZSBpdCdzIG9uZSBnZXRfbWFpbnRhaW5lcnMNCj4gICAgID4gICAgIHNj
cmlwdD8geGVuLmdpdCdzIHNjcmlwdCBkb2Vzbid0IG5lZWRzIHRvIGhhdmUgc3VwcG9ydCBmb3Ig
ZXZlcnkgc2luZ2xlDQo+ICAgICA+ICAgICByZXBvIGF2YWlsYWJsZSBvbiBlYXJ0aCBhbmQgVW5p
a3JhZnQgaXMgYSBkaWZmZXJlbnQgcHJvamVjdCBhbnl3YXkuDQo+ICAgICA+DQo+ICAgICA+ICAg
ICBVc3VhbGx5LCBwcm9qZWN0cyB3aXRoIGEgTUFJTlRBSU5FUlMgZmlsZSBoYXZlIHRoZXJlIG93
biBnZXRfbWFpbnRhaW5lcnMNCj4gICAgID4gICAgIHNjcmlwdC4NCj4gICAgID4NCj4gICAgID4g
V2VsbDogVW5pa3JhZnQgaXMgcGFydCBvZiB0aGUgWGVuIFByb2plY3QuDQo+ICAgICA+DQo+ICAg
ICA+IFdoZW4gSSBzdGFydGVkIHRvIGNsZWFuIHVwIHRoZSBjb250cmlidXRpb24gZG9jcyBpdCBi
ZWNhbWUgYXBwYXJlbnQgdGhhdA0KPiAgICAgPiB0aGVyZSBpcyBhIGxvdCBvZiBpbmNvbnNpc3Rl
bmN5LiBJZGVhbGx5IG91ciBjb250cmlidXRpb24gZ3VpZGUgWzBdIHdvdWxkIGFwcGx5DQo+ICAg
ICA+IHRvIHByZXR0eSBtdWNoICphbGwqIHN1YiBwcm9qZWN0cyB3aGljaCB1c2UgYSBtYWlsaW5n
IGxpc3QgYmFzZWQgd29ya2Zsb3dzDQo+ICAgICA+DQo+ICAgICA+IENvbnNpc3RlbmN5IG1ha2Vz
IGxpZmUgZm9yIGRldmVsb3BlcnMgYW5kIGFsc28gbmV3Y29tZXJzIG11Y2ggZWFzaWVyLiBBbmQg
dGhlDQo+ICAgICA+IG51bWJlciBvZiBuZXcgZGV2cyB3aG8gc2VlbSB0byB0cmlwIG92ZXIgaW5j
b25zaXN0ZW5jaWVzIGJldHdlZW4gcHJvamVjdHMgYXJlDQo+ICAgICA+IHF1aXRlIGxhcmdlICh3
ZSBoYWQgMyAgY2FzZXMgaW4gMyB3ZWVrcyB3aGljaCBJIG5vdGljZWQpLg0KPiAgICAgPg0KPiAg
ICAgPiBJZiB3ZSBzdGFydCBpbXByb3Zpbmcgb3VyIENJIGluZnJhc3RydWN0dXJlICh3aGljaCB3
ZSBhcmUpLCBpdCB3b3VsZCBiZSBuaWNlIGlmIG90aGVyDQo+ICAgICA+IHN1YiBwcm9qZWN0cyBo
YWQgdGhlIHBvc3NpYmlsaXR5IHRvIGVhc2lseSBob29rIGludG8gaXQgb3IgcmVwbGljYXRlIGl0
LiBCdXQgdGhhdCBkb2VzIHJlcXVpcmUNCj4gICAgID4gc29tZSBjb25zaXN0ZW5jeS4NCj4gICAg
ID4NCj4gICAgID4gVGhhdCdzIHdoeSBJIHN1Ym1pdHRlZCBbMV0gYW5kIFsyXQ0KPiAgICAgPg0K
PiAgICAgPiBTdWItcHJvamVjdHMgd2l0aCBtYWlsIGJhc2VkIHdvcmtmbG93cw0KPiAgICAgPiAx
OiBIeXBlcnZpc29yDQo+ICAgICA+IDI6IEh5cGVydmlzb3IgcmVsYXRlZCByZXBvcyAobGl2ZXBh
dGNoLWJ1aWxkLXRvb2xzLCBtaW5pLW9zLCB4dGYsIC4uLikNCj4gICAgID4gMzogV2luZG93cyBQ
ViBEcml2ZXJzIC0gd2hpY2ggd2lsbCByZXF1aXJlIGNoYW5nZXMgdG8gdGhlaXIgTUFJTlRBSU5F
UlMgZmlsZQ0KPiAgICAgPiA0OiBVbmlrcmFmdA0KPiAgICAgPg0KPiAgICAgPiBTdXBwb3J0aW5n
IDEgLSAzIHNob3VsZCBiZSBzdHJhaWdodGZvcndhcmQgYmVjYXVzZSB5b3Ugd291bGQgYWxtb3N0
IGFsd2F5cw0KPiAgICAgPiBoYXZlIHhlbi5naXQgY2hlY2tlZCBvdXQuIDQgaXMgbW9yZSBkaWZm
ZXJlbnQuDQo+IA0KPiAgICAgSSdkIHNheSB0aGF0IGZvbGtzIGJ1aWxkaW5nIDMgYXJlIHVubGlr
ZWx5IHRvIGhhdmUgeGVuLmdpdCBjaGVja2VkIG91dC4NCj4gDQo+IEdvb2QgdG8ga25vdw0KPiAN
Cj4gSWYgdGhlcmUgd2FzIHRvb2xpbmcgYXZhaWxhYmxlIHRoYXQgc2ltcGxpZmllcyB5b3VyIHdv
cmtmbG93LCB3b3VsZA0KPiBtZW1iZXJzIG9mIHRoZSBXaW5kb3dzIFBWIERyaXZlcnMgc3ViLXBy
b2plY3QgYmUgd2lsbGluZyB0byB1c2UgdGhlbT8NCj4gDQoNClN1cmUsIGJ1dCBvdXIgTUFJTlRB
SU5FUlMgZmlsZXMgYXJlIHRyaXZpYWwsIGFuZCBtb3N0IGNvZGUgY2hhbmdlcyBhcmUgbWFkZSBi
eSBPd2VuIGFuZCBteXNlbGYgYW55d2F5LiBOb3Qgc3VyZSB0aGVyZSdzIHJlYWxseSBhIG5lZWQg
Zm9yIGFueSBleHRyYSB0b29saW5nLg0KDQo+IEl0IG1heWJlIHRoYXQgZm9yIFdpbmRvd3MgUFYg
RHJpdmVycyB0aGUgd29ya2Zsb3cgaXMgbm90IGF0IGFsbCBjb21tYW5kDQo+IGxpbmUgYmFzZWQg
YW5kIHBlb3BsZSB0ZW5kIHRvIHVzZSBhbiBJREUgaW5zdGVhZC4NCj4gDQoNClNvbWUgZm9sa3Mg
bWF5IHVzZSB0aGUgVmlzdWFsIFN0dWRpbyBJREUuIEkgZG9uJ3QsIGFuZCB0aGUgSmVua2lucyBi
dWlsZCB3b3JrZXJzIGRvIHJlbHkgb24gdGhlIHB5dGhvbiAocHJlLTkuMCkgb3IgcG93ZXJzaGVs
bCAoOS4wIG9ud2FyZHMpIHNjcmlwdHMgc28gYnVpbGRpbmcgdmlhIGNvbW1hbmQgbGluZSBkb2Vz
IG5lZWQgdG8gYmUgdGVzdGVkIGJ5IGNvbnRyaWJ1dG9ycy4NCg0KICBQYXVsDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
