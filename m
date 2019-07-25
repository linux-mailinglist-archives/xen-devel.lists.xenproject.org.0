Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8574B42
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:12:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqafo-0007bW-Qu; Thu, 25 Jul 2019 10:08:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqafn-0007bM-NT
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:08:31 +0000
X-Inumbo-ID: 26e9dfd5-aec4-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26e9dfd5-aec4-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:08:30 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4ZwR5bsnb8NmqJ5nVNRD4pR0xw3pa2C9WFk32rajHlwbicW4Xx0a5kzWdVFUexaClsHJZedXrj
 46O1pXAf32eDD35eg37HR8926LslnB5ntq3krbjQU0Uol31HllzySiClT2YsabUR1uq/fJXT0N
 RYdEfzw8nG+JpHSMHjPF6OHjzEjbQTF0pbBtP4+a6dSoAbnGECRYKNQXbNTydMXNlWr+lI+Zxi
 1z9KORTm0ozDExYD43LRuhufU7jlof2fE+QXFoQGYPFwdYPk+n9vznYFUFxkQc851R37SV30K0
 v/I=
X-SBRS: 2.7
X-MesageID: 3507428
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3507428"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 5/6] domain: remove the 'is_xenstore' flag
Thread-Index: AQHVQXCP5Avqq3CZb0ye1W1A3p70iaba954AgAAnMAA=
Date: Thu, 25 Jul 2019 10:08:26 +0000
Message-ID: <06df33cd872a4effbd8df2d9a534bae2@AMSPEX02CL03.citrite.net>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-6-paul.durrant@citrix.com>
 <20190725094746.5wlsyc4h4m573qza@Air-de-Roger>
In-Reply-To: <20190725094746.5wlsyc4h4m573qza@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 5/6] domain: remove the 'is_xenstore' flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjUgSnVseSAyMDE5IDEwOjQ4Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47Cj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29t
PjsgQW5kcmV3Cj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tz
b24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47
Cj4gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT47IERhbmllbCBEZSBHcmFhZgo+IDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+
Cj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCA1LzZdIGRvbWFpbjogcmVtb3ZlIHRo
ZSAnaXNfeGVuc3RvcmUnIGZsYWcKPiAKPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCAwNTowNjow
OFBNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMg
YSBjb252ZW5pZW5jZSBtYWNybywgaXNfeGVuc3RvcmVfZG9tYWluKCksIHdoaWNoCj4gPiB0ZXN0
cyB0aGUgZG9tYWluICdjcmVhdGVmbGFncycgZGlyZWN0bHkgYW5kIHRoZW4gdXNlcyB0aGF0IGlu
IHBsYWNlIG9mCj4gPiB0aGUgJ2lzX3hlbnN0b3JlJyBmbGFnLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAoKVGhhbmtzLgoK
PiBKdXN0IG9uZSByZXF1ZXN0IGJlbG93ICh3aGljaCBpcyBub3QgcmVsYXRlZCB0byB5b3VyIGNv
ZGUgYWN0dWFsbHkpLgo+IAo+ID4gLS0tCj4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiA+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20+Cj4gPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+Cj4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gQ2M6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+ID4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4K
PiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gQ2M6IERhbmllbCBEZSBHcmFhZiA8ZGdk
ZWdyYUB0eWNoby5uc2EuZ292Pgo+ID4gLS0tCj4gPiAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAg
fCA1ICstLS0tCj4gPiAgeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgfCAyICstCj4gPiAgeGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmggfCA3ICsrKysrLS0KPiA+ICB4ZW4vaW5jbHVkZS94c20vZHVtbXku
aCB8IDIgKy0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21t
b24vZG9tYWluLmMKPiA+IGluZGV4IDZmNDA1ZDI1NDEuLjU3MDNkYTM1N2YgMTAwNjQ0Cj4gPiAt
LS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4g
PiBAQCAtNDI5LDExICs0MjksOCBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlk
X3QgZG9taWQsCj4gPiAgICAgICAgICB3YXRjaGRvZ19kb21haW5faW5pdChkKTsKPiA+ICAgICAg
ICAgIGluaXRfc3RhdHVzIHw9IElOSVRfd2F0Y2hkb2c7Cj4gPgo+ID4gLSAgICAgICAgaWYgKCBk
LT5jcmVhdGVmbGFncyAmIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbiApCj4gPiAtICAgICAgICB7
Cj4gPiAtICAgICAgICAgICAgZC0+aXNfeGVuc3RvcmUgPSAxOwo+ID4gKyAgICAgICAgaWYgKCBp
c194ZW5zdG9yZV9kb21haW4oZCkgKQo+ID4gICAgICAgICAgICAgIGQtPmRpc2FibGVfbWlncmF0
ZSA9IDE7Cj4gCj4gV2hpbGUgaGVyZSBjYW4geW91IGFsc28gZml4IHRoaXMgbGluZSB0byB1c2Ug
dHJ1ZSBpbnN0ZWFkIG9mIDE/Cj4gCgpTdXJlLgoKICBQYXVsCgo+IFRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
