Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3237EA1F18
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 17:28:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3MId-0006n3-8Z; Thu, 29 Aug 2019 15:25:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3MIb-0006mW-V0
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:25:22 +0000
X-Inumbo-ID: 3655c6e0-ca71-11e9-951b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3655c6e0-ca71-11e9-951b-bc764e2007e4;
 Thu, 29 Aug 2019 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567092320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=thbzMJYFqv2uUXuI1GDK51thF5UeRV+bXrpxJloV8ow=;
 b=DXS6nb54jsGYjPquMrNiDvknQ7gxp6qN+uOzE4qiTmdiEYTteWSFblDQ
 V0k1QlXLKWc/h4erYdotx9KvoBRShpvp26ZLlt7NMjTfNG9YwIKmOh6qd
 g/9JDn9LyGEBCLwoVg/tMjx8oQxbKdxkH3Xwhy+nLCnJXUkheQfgnUAew w=;
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
IronPort-SDR: FgOAitwu/no5SFIqr14ebtxZU/eKbE3T9QJjBnK8sAsYhaZDxEARS+Qtm7am5bzg6+J5pnCsgo
 UDqrR/vsboDheytU1m64OUtV594gd+TNkzFLiJCdECgLmaf8pOZUgXG6K7kRWegvS3vJ8s2ouH
 jlzDs3kcejhbvnF3/JfEt3WSRuFEIUDZmNPv37c3LT0xTdqvnb+306O7oYV/OTqp3TeIlUoO0R
 Lra0C6nboAS34yJHOASMjxxozbwbFhAD0113EF7smDIeUv1TmKJdBYf0PixT2oFRU1/hRVqA8g
 x4k=
X-SBRS: 2.7
X-MesageID: 5112121
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,443,1559534400"; 
   d="scan'208";a="5112121"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v6 10/10] introduce a 'passthrough' configuration option
 to xl.cfg...
Thread-Index: AQHVVFfs4jrxlwbLt0anSv+8EgHRu6cIsIcAgAmhnsA=
Date: Thu, 29 Aug 2019 15:25:15 +0000
Message-ID: <50fb220e8d444b468d79f4aeea719a62@AMSPEX02CL03.citrite.net>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-11-paul.durrant@citrix.com>
 <20190823141636.cqxfewqwybfz2afm@Air-de-Roger>
In-Reply-To: <20190823141636.cqxfewqwybfz2afm@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 10/10] introduce a 'passthrough'
 configuration option to xl.cfg...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjMgQXVndXN0IDIwMTkgMTU6MTcKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcKPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKYW4gQmV1
bGljaAo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsKPiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT47IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY2IDEwLzEwXSBpbnRyb2R1Y2UgYSAncGFzc3Rocm91Z2gnIGNv
bmZpZ3VyYXRpb24gb3B0aW9uIHRvIHhsLmNmZy4uLgo+IAo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5
IGF0IDA2OjIwOjAxUE0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IC4uLmFuZCBoZW5j
ZSB0aGUgYWJpbGl0eSB0byBkaXNhYmxlIElPTU1VIG1hcHBpbmdzLCBhbmQgY29udHJvbCBFUFQK
PiA+IHNoYXJpbmcuCj4gPgo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3ICdsaWJ4bF9w
YXNzdGhyb3VnaCcgZW51bWVyYXRpb24gaW50bwo+ID4gbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZv
LiBUaGUgdmFsdWUgd2lsbCBiZSBzZXQgYnkgeGwgZWl0aGVyIHdoZW4gaXQgcGFyc2VzCj4gPiBh
IG5ldyAncGFzc3Rocm91Z2gnIG9wdGlvbiBpbiB4bC5jZmcsIG9yIGltcGxpY2l0bHkgaWYgdGhl
cmUgaXMgcGFzc3Rocm91Z2gKPiA+IGhhcmR3YXJlIHNwZWNpZmllZCBmb3IgdGhlIGRvbWFpbi4K
PiA+Cj4gPiBJZiB0aGUgdmFsdWUgb2YgdGhlIHBhc3N0aHJvdWdoIGNvbmZpZ3VyYXRpb24gb3B0
aW9uIGlzICdkaXNhYmxlZCcgdGhlbgo+ID4gdGhlIFhFTl9ET01DVExfQ0RGX2lvbW11IGZsYWcg
d2lsbCBiZSBjbGVhciBpbiB0aGUgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4KPiA+IGZsYWdzLCB0
aHVzIGFsbG93aW5nIHRoZSB0b29sc3RhY2sgdG8gY29udHJvbCB3aGV0aGVyIHRoZSBkb21haW4g
Z2V0cwo+ID4gSU9NTVUgbWFwcGluZ3Mgb3Igbm90ICh3aGVyZSBwcmV2aW91c2x5IHRoZXkgd2Vy
ZSBnbG9iYWxseSBzZXQpLgo+ID4KPiA+IElmIHRoZSB2YWx1ZSBvZiB0aGUgcGFzc3Rocm91Z2gg
Y29uZmlndXJhdGlvbiBvcHRpb24gaXMgJ3N5bmNfcHQnIHRoZW4KPiA+IGEgbmV3ICdpb21tdV9v
cHRzJyBmaWVsZCBpbiB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiB3aWxsIGJlIHNldCB3aXRoIHRo
ZQo+ID4gdmFsdWUgWEVOX0RPTUNUTF9JT01NVV9ub19zaGFyZXB0LiBUaGlzIHdpbGwgb3ZlcnJp
ZGUgdGhlIGdsb2JhbCBkZWZhdWx0Cj4gPiBzZXQgaW4gaW9tbXVfaGFwX3B0X3NoYXJlLCB0aHVz
IGFsbG93aW5nIHRoZSB0b29sc3RhY2sgdG8gY29udHJvbCB3aGV0aGVyCj4gPiBFUFQgc2hhcmlu
ZyBpcyB1c2VkIGZvciB0aGUgZG9tYWluLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+IENjOiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBD
YzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+ID4gQ2M6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgo+ID4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KPiA+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gPiBDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gPiBDYzogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiBDYzogVm9sb2R5bXlyIEJh
YmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPgo+ID4gQ2M6ICJSb2dlciBQYXUgTW9u
bsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPgo+ID4gUHJldmlvdXNseSBwYXJ0IG9mIHNl
cmllcyBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTktMDcvbXNnMDIyNjcuaHRtbAo+ID4KPiA+IHY2Ogo+ID4gIC0gUmVtb3ZlIHRoZSBsaWJ4
bF9waHlzaW5mbygpIGNhbGwgc2luY2UgaXQncyB1c2VmdWxuZXNzIGlzIGxpbWl0ZWQgdG8geDg2
Cj4gPgo+ID4gdjU6Cj4gPiAgLSBFeHBhbmQgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gZmxhZ3Mg
ZmllbGQgYW5kIGhlbmNlIGJ1bXAgaW50ZXJmYWNlCj4gPiAgICB2ZXJzaW9uCj4gPiAgLSBGaXgg
c3BlbGxpbmcgbWlzdGFrZXMgaW4gY29udGV4dCBsaW5lCj4gPiAtLS0KPiA+ICBkb2NzL21hbi94
bC5jZmcuNS5wb2QuaW4gICAgICAgIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICB8ICA1ICsrKysKPiA+ICB0
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgICAgIHwgIDkgKysrKysrCj4gPiAgdG9vbHMvbGli
eGwvbGlieGxfdHlwZXMuaWRsICAgICB8ICA3ICsrKysrCj4gPiAgdG9vbHMveGwveGxfcGFyc2Uu
YyAgICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHhlbi9hcmNo
L2FybS9kb21haW4uYyAgICAgICAgICAgfCAxMCArKysrKystCj4gPiAgeGVuL2FyY2gveDg2L2Rv
bWFpbi5jICAgICAgICAgICB8ICAyICstCj4gPiAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAg
ICAgICB8ICA3ICsrKysrCj4gPiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyB8IDEz
ICsrKysrKysrLQo+ID4gIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCAgICAgfCAgNiArKyst
Cj4gPiAgeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICB8IDE5ICsrKysrKysrLS0tLQo+
ID4gIDExIGZpbGVzIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluIGIvZG9jcy9tYW4v
eGwuY2ZnLjUucG9kLmluCj4gPiBpbmRleCBjOTlkNDAzMDdlLi5mZDM1Njg1ZTllIDEwMDY0NAo+
ID4gLS0tIGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCj4gPiArKysgYi9kb2NzL21hbi94bC5j
ZmcuNS5wb2QuaW4KPiA+IEBAIC02MDUsNiArNjA1LDU4IEBAIG9wdGlvbiBzaG91bGQgb25seSBi
ZSB1c2VkIHdpdGggYSB0cnVzdGVkIGRldmljZSB0cmVlLgo+ID4gIE5vdGUgdGhhdCB0aGUgcGFy
dGlhbCBkZXZpY2UgdHJlZSBzaG91bGQgYXZvaWQgdXNpbmcgdGhlIHBoYW5kbGUgNjUwMDAKPiA+
ICB3aGljaCBpcyByZXNlcnZlZCBieSB0aGUgdG9vbHN0YWNrLgo+ID4KPiA+ICs9aXRlbSBCPHBh
c3N0aHJvdWdoPSJTVFJJTkciPgo+ID4gKwo+ID4gK1NwZWNpZnkgd2hldGhlciBJT01NVSBtYXBw
aW5ncyBhcmUgZW5hYmxlZCBmb3IgdGhlIGRvbWFpbiBhbmQgaGVuY2Ugd2hldGhlcgo+ID4gK2l0
IHdpbGwgYmUgZW5hYmxlZCBmb3IgcGFzc3Rocm91Z2ggaGFyZHdhcmUuIFZhbGlkIHZhbHVlcyBm
b3IgdGhpcyBvcHRpb24KPiA+ICthcmU6Cj4gPiArCj4gPiArPW92ZXIgNAo+ID4gKwo+ID4gKz1p
dGVtIEI8ZGlzYWJsZWQ+Cj4gPiArCj4gPiArSU9NTVUgbWFwcGluZ3MgYXJlIGRpc2FibGVkIGZv
ciB0aGUgZG9tYWluIGFuZCBzbyBoYXJkd2FyZSBtYXkgbm90IGJlCj4gPiArcGFzc2VkIHRocm91
Z2guCj4gPiArCj4gPiArVGhpcyBvcHRpb24gaXMgdGhlIGRlZmF1bHQgaWYgbm8gcGFzc3Rocm91
Z2ggaGFyZHdhcmUgaXMgc3BlY2lmaWVkCj4gPiAraW4gdGhlIGRvbWFpbidzIGNvbmZpZ3VyYXRp
b24uCj4gPiArCj4gPiArPWl0ZW0gQjxzeW5jX3B0Pgo+IAo+IEkgd291bGQgbWF5YmUgbmFtZSB0
aGlzIGV4Y2x1c2l2ZV9wdCwgYnV0IGhpc3RvcmljYWxseSBpdCdzIGJlZW4gbmFtZWQKPiBzeW5j
X3B0Lgo+IAoKWWVzLCBJIHByZWZlciB0byBzdGljayB3aXRoIHRoZSBpbmN1bWJlbnQgbmFtZS4K
CltzbmlwXQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMgYi90b29scy94bC94
bF9wYXJzZS5jCj4gPiBpbmRleCBlMTA1YmRhMmJiLi5jOTA0NjA0MDA4IDEwMDY0NAo+ID4gLS0t
IGEvdG9vbHMveGwveGxfcGFyc2UuYwo+ID4gKysrIGIvdG9vbHMveGwveGxfcGFyc2UuYwo+ID4g
QEAgLTIzMjYsNiArMjMyNiw0NCBAQCBza2lwX3ZmYjoKPiA+ICAgICAgICAgIH0KPiA+ICAgICAg
fQo+ID4KPiA+ICsgICAgaWYgKCF4bHVfY2ZnX2dldF9zdHJpbmcoY29uZmlnLCAicGFzc3Rocm91
Z2giLCAmYnVmLCAwKSkgewo+ID4gKyAgICAgICAgbGlieGxfcGFzc3Rocm91Z2ggbzsKPiA+ICsK
PiA+ICsgICAgICAgIGUgPSBsaWJ4bF9wYXNzdGhyb3VnaF9mcm9tX3N0cmluZyhidWYsICZvKTsK
PiA+ICsgICAgICAgIGlmIChlKSB7Cj4gPiArICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsCj4g
PiArICAgICAgICAgICAgICAgICAgICAiRVJST1I6IHVua25vd24gcGFzc3Rocm91Z2ggb3B0aW9u
ICclcydcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICBidWYpOwo+ID4gKyAgICAgICAgICAg
IGV4aXQoLUVSUk9SX0ZBSUwpOwo+ID4gKyAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgc3dp
dGNoIChvKSB7Cj4gPiArICAgICAgICBjYXNlIExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVEOgo+
ID4gKyAgICAgICAgICAgIGlmIChkX2NvbmZpZy0+bnVtX3BjaWRldnMgfHwgZF9jb25maWctPm51
bV9kdGRldnMpIHsKPiA+ICsgICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgIkVSUk9SOiBwYXNzdGhyb3VnaCBkaXNhYmxlZCBidXQgZGV2
aWNlcyBhcmUgc3BlY2lmaWVkXG4iKTsKPiA+ICsgICAgICAgICAgICAgICAgZXhpdCgtRVJST1Jf
RkFJTCk7Cj4gPiArICAgICAgICAgICAgfQo+IAo+IERvbid0IHlvdSBuZWVkIGEgYnJlYWsgaGVy
ZT8KPiAKPiA+ICsgICAgICAgIGNhc2UgTElCWExfUEFTU1RIUk9VR0hfU0hBUkVfUFQ6Cj4gPiAr
ICAgICAgICAgICAgaWYgKGNfaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9QVikgewo+
ID4gKyAgICAgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAiRVJST1I6IHBhc3N0aHJvdWdoPVwic2hhcmVfcHRcIiBub3QgdmFsaWQgZm9yIFBW
IGRvbWFpblxuIik7Cj4gPiArICAgICAgICAgICAgICAgIGV4aXQoLUVSUk9SX0ZBSUwpOwo+ID4g
KyAgICAgICAgICAgIH0KPiAKPiBBbmQgaGVyZSBsaWtlbHkgKG9yIGEgLyogZmFsbHRocm91Z2gg
Ki8gY29tbWVudCkKPiAKCk5vcGUuIE1pc3NpbmcgYnJlYWtzIGluIGJvdGggY2FzZXMuIEdvb2Qg
c3BvdC4KCj4gPiArICAgICAgICBkZWZhdWx0Ogo+ID4gKyAgICAgICAgICAgIGJyZWFrOwo+ID4g
KyAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgY19pbmZvLT5wYXNzdGhyb3VnaCA9IG87Cj4g
PiArICAgIH0gZWxzZSBpZiAoZF9jb25maWctPm51bV9wY2lkZXZzIHx8IGRfY29uZmlnLT5udW1f
ZHRkZXZzKSB7Cj4gPiArICAgICAgICAvKgo+ID4gKyAgICAgICAgICogUGFzc3Rocm91Z2ggZGV2
aWNlcyBhcmUgc3BlY2lmaWVkIHNvIHNldCBhbiBhcHByb3ByaWF0ZQo+ID4gKyAgICAgICAgICog
ZGVmYXVsdCB2YWx1ZS4KPiA+ICsgICAgICAgICAqLwo+ID4gKyAgICAgICAgY19pbmZvLT5wYXNz
dGhyb3VnaCA9IChjX2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfUFYpID8KPiA+ICsg
ICAgICAgICAgICBMSUJYTF9QQVNTVEhST1VHSF9TWU5DX1BUIDogTElCWExfUEFTU1RIUk9VR0hf
U0hBUkVfUFQ7Cj4gPiArICAgIH0KPiA+ICsKPiA+ICAgICAgaWYgKCF4bHVfY2ZnX2dldF9saXN0
KGNvbmZpZywgInVzYmN0cmwiLCAmdXNiY3RybHMsIDAsIDApKSB7Cj4gPiAgICAgICAgICBkX2Nv
bmZpZy0+bnVtX3VzYmN0cmxzID0gMDsKPiA+ICAgICAgICAgIGRfY29uZmlnLT51c2JjdHJscyA9
IE5VTEw7Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gv
YXJtL2RvbWFpbi5jCj4gPiBpbmRleCA5NDFiYmZmNGZlLi5iMTJkZTZmZjNkIDEwMDY0NAo+ID4g
LS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
LmMKPiA+IEBAIC02MTQsNiArNjE0LDE0IEBAIGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25m
aWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpCj4gPiAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPiA+ICAgICAgfQo+ID4KPiA+ICsgICAgLyogQWx3YXlzIHNoYXJlIFAy
TSBUYWJsZSBiZXR3ZWVuIHRoZSBDUFUgYW5kIHRoZSBJT01NVSAqLwo+ID4gKyAgICBpZiAoIGNv
bmZpZy0+aW9tbXVfb3B0cyAmIFhFTl9ET01DVExfSU9NTVVfbm9fc2hhcmVwdCApCj4gPiArICAg
IHsKPiA+ICsgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sCj4gPiArICAgICAgICAgICAgICAg
ICJVbnN1cHBvcnRlZCBpb21tdSBvcHRpb246IFhFTl9ET01DVExfSU9NTVVfbm9fc2hhcmVwdFxu
Iik7Cj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgfQo+ID4gKwo+ID4gICAg
ICAvKiBGaWxsIGluIHRoZSBuYXRpdmUgR0lDIHZlcnNpb24sIHBhc3NlZCBiYWNrIHRvIHRoZSB0
b29sc3RhY2suICovCj4gPiAgICAgIGlmICggY29uZmlnLT5hcmNoLmdpY192ZXJzaW9uID09IFhF
Tl9ET01DVExfQ09ORklHX0dJQ19OQVRJVkUgKQo+ID4gICAgICB7Cj4gPiBAQCAtNjc0LDcgKzY4
Miw3IEBAIGludCBhcmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwKPiA+ICAgICAg
QVNTRVJUKGNvbmZpZyAhPSBOVUxMKTsKPiA+Cj4gPiAgICAgIC8qIHAybV9pbml0IHJlbGllcyBv
biBzb21lIHZhbHVlIGluaXRpYWxpemVkIGJ5IHRoZSBJT01NVSBzdWJzeXN0ZW0gKi8KPiA+IC0g
ICAgaWYgKCAocmMgPSBpb21tdV9kb21haW5faW5pdChkKSkgIT0gMCApCj4gPiArICAgIGlmICgg
KHJjID0gaW9tbXVfZG9tYWluX2luaXQoZCwgY29uZmlnLT5pb21tdV9vcHRzKSkgIT0gMCApCj4g
PiAgICAgICAgICBnb3RvIGZhaWw7Cj4gPgo+ID4gICAgICBpZiAoIChyYyA9IHAybV9pbml0KGQp
KSAhPSAwICkKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJj
aC94ODYvZG9tYWluLmMKPiA+IGluZGV4IGYxNDRkOGZlOWEuLjRmN2RhZDQ5YzUgMTAwNjQ0Cj4g
PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21h
aW4uYwo+ID4gQEAgLTYwNCw3ICs2MDQsNyBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVj
dCBkb21haW4gKmQsCj4gPiAgICAgIGlmICggKHJjID0gaW5pdF9kb21haW5faXJxX21hcHBpbmco
ZCkpICE9IDAgKQo+ID4gICAgICAgICAgZ290byBmYWlsOwo+ID4KPiA+IC0gICAgaWYgKCAocmMg
PSBpb21tdV9kb21haW5faW5pdChkKSkgIT0gMCApCj4gPiArICAgIGlmICggKHJjID0gaW9tbXVf
ZG9tYWluX2luaXQoZCwgY29uZmlnLT5pb21tdV9vcHRzKSkgIT0gMCApCj4gPiAgICAgICAgICBn
b3RvIGZhaWw7Cj4gPgo+ID4gICAgICBwc3JfZG9tYWluX2luaXQoZCk7Cj4gPiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiA+IGluZGV4IGU4
MzJhNWM0YWEuLjE0MmIwODE3NGIgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5j
Cj4gPiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gPiBAQCAtMzA4LDYgKzMwOCwxMyBAQCBz
dGF0aWMgaW50IHNhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRl
ZG9tYWluICpjb25maWcpCj4gPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICAgICAgfQo+
ID4KPiA+ICsgICAgaWYgKCAhKGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9pb21tdSkg
JiYgY29uZmlnLT5pb21tdV9vcHRzICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgZHByaW50ayhY
RU5MT0dfSU5GTywKPiA+ICsgICAgICAgICAgICAgICAgIklPTU1VIG9wdGlvbnMgc3BlY2lmaWVk
IGJ1dCBJT01NVSBub3QgZW5hYmxlZFxuIik7Cj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiA+ICsgICAgfQo+ID4gKwo+ID4gICAgICBpZiAoIGNvbmZpZy0+bWF4X3ZjcHVzIDwgMSApCj4g
PiAgICAgIHsKPiA+ICAgICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJObyB2Q1BVU1xuIik7
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiA+IGluZGV4IGIyNGJlNWZmYTYuLmE1MjZhYTZj
MDkgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gPiAr
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gPiBAQCAtMTU5LDcgKzE1OSw3
IEBAIHN0YXRpYyB2b2lkIF9faHdkb21faW5pdCBjaGVja19od2RvbV9yZXFzKHN0cnVjdCBkb21h
aW4gKmQpCj4gPiAgICAgIGlvbW11X2h3ZG9tX3N0cmljdCA9IHRydWU7Cj4gPiAgfQo+ID4KPiA+
IC1pbnQgaW9tbXVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPiA+ICtpbnQgaW9tbXVf
ZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG9wdHMpCj4gPiAgewo+
ID4gICAgICBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkKTsKPiA+ICAgICAg
aW50IHJldCA9IDA7Cj4gPiBAQCAtMTc2LDYgKzE3NiwxNSBAQCBpbnQgaW9tbXVfZG9tYWluX2lu
aXQoc3RydWN0IGRvbWFpbiAqZCkKPiA+ICAgICAgaWYgKCByZXQgKQo+ID4gICAgICAgICAgcmV0
dXJuIHJldDsKPiA+Cj4gPiArICAgIC8qCj4gPiArICAgICAqIFVzZSBzaGFyZWQgcGFnZSB0YWJs
ZXMgZm9yIEhBUCBhbmQgSU9NTVUgaWYgdGhlIGdsb2JhbCBvcHRpb24KPiA+ICsgICAgICogaXMg
ZW5hYmxlZCAoZnJvbSB3aGljaCB3ZSBjYW4gaW5mZXIgdGhlIGgvdyBpcyBjYXBhYmxlKSBhbmQK
PiA+ICsgICAgICogdGhlIGRvbWFpbiBvcHRpb25zIGRvIG5vdCBkaXNhbGxvdyBpdC4gSEFQIG11
c3QsIG9mIGNvdXJzZSwgYWxzbwo+ID4gKyAgICAgKiBiZSBlbmFibGVkLgo+ID4gKyAgICAgKi8K
PiA+ICsgICAgaGQtPmhhcF9wdF9zaGFyZSA9IGhhcF9lbmFibGVkKGQpICYmIGlvbW11X2hhcF9w
dF9zaGFyZSAmJgo+ID4gKyAgICAgICAgIShvcHRzICYgWEVOX0RPTUNUTF9JT01NVV9ub19zaGFy
ZXB0KTsKPiA+ICsKPiA+ICAgICAgLyoKPiA+ICAgICAgICogTkI6ICdyZWxheGVkJyBoL3cgZG9t
YWlucyBkb24ndCBuZWVkIHRoZSBJT01NVSBtYXBwaW5ncyB0byBiZSBrZXB0Cj4gPiAgICAgICAq
ICAgICBpbi1zeW5jIHdpdGggdGhlaXIgYXNzaWduZWQgcGFnZXMgYmVjYXVzZSBhbGwgaG9zdCBS
QU0gd2lsbCBiZQo+ID4gQEAgLTE4Nyw2ICsxOTYsOCBAQCBpbnQgaW9tbXVfZG9tYWluX2luaXQo
c3RydWN0IGRvbWFpbiAqZCkKPiA+ICAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGQpIHx8
IGlvbW11X2h3ZG9tX3N0cmljdCApCj4gPiAgICAgICAgICBoZC0+bmVlZF9zeW5jID0gIWlvbW11
X3VzZV9oYXBfcHQoZCk7Cj4gPgo+ID4gKyAgICBBU1NFUlQoIShoZC0+bmVlZF9zeW5jICYmIGhk
LT5oYXBfcHRfc2hhcmUpKTsKPiA+ICsKPiA+ICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggYi94ZW4vaW5jbHVkZS9w
dWJsaWMvZG9tY3RsLmgKPiA+IGluZGV4IDNmODJjNzg4NzAuLjkyMmVkNTBhMTEgMTAwNjQ0Cj4g
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaAo+ID4gQEAgLTM4LDcgKzM4LDcgQEAKPiA+ICAjaW5jbHVkZSAiaHZt
L3NhdmUuaCIKPiA+ICAjaW5jbHVkZSAibWVtb3J5LmgiCj4gPgo+ID4gLSNkZWZpbmUgWEVOX0RP
TUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDExCj4gPiArI2RlZmluZSBYRU5fRE9NQ1RM
X0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMTIKPiA+Cj4gPiAgLyoKPiA+ICAgKiBOQi4geGVu
X2RvbWN0bC5kb21haW4gaXMgYW4gSU4vT1VUIHBhcmFtZXRlciBmb3IgdGhpcyBvcGVyYXRpb24u
Cj4gPiBAQCAtNzAsNiArNzAsMTAgQEAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluIHsK
PiA+Cj4gPiAgICAgIHVpbnQzMl90IGZsYWdzOwo+ID4KPiA+ICsjZGVmaW5lIF9YRU5fRE9NQ1RM
X0lPTU1VX25vX3NoYXJlcHQgIDAKPiA+ICsjZGVmaW5lIFhFTl9ET01DVExfSU9NTVVfbm9fc2hh
cmVwdCAgICgxVTw8X1hFTl9ET01DVExfSU9NTVVfbm9fc2hhcmVwdCkKPiA+ICsgICAgdWludDMy
X3QgaW9tbXVfb3B0czsKPiA+ICsKPiA+ICAgICAgLyoKPiA+ICAgICAgICogVmFyaW91cyBkb21h
aW4gbGltaXRzLCB3aGljaCBpbXBhY3QgdGhlIHF1YW50aXR5IG9mIHJlc291cmNlcyAoZ2xvYmFs
Cj4gPiAgICAgICAqIG1hcHBpbmcgc3BhY2UsIHhlbmhlYXAsIGV0YykgYSBndWVzdCBtYXkgY29u
c3VtZS4KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNs
dWRlL3hlbi9pb21tdS5oCj4gPiBpbmRleCA1ZTdjYTk4MTcwLi4wMTAyNWUzNzJiIDEwMDY0NAo+
ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9pb21tdS5oCj4gPiBAQCAtNjcsNyArNjcsNyBAQCBleHRlcm4gdW5zaWduZWQgaW50IGlvbW11
X2Rldl9pb3RsYl90aW1lb3V0Owo+ID4gIGludCBpb21tdV9zZXR1cCh2b2lkKTsKPiA+ICBpbnQg
aW9tbXVfaGFyZHdhcmVfc2V0dXAodm9pZCk7Cj4gPgo+ID4gLWludCBpb21tdV9kb21haW5faW5p
dChzdHJ1Y3QgZG9tYWluICpkKTsKPiA+ICtpbnQgaW9tbXVfZG9tYWluX2luaXQoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IG9wdHMpOwo+ID4gIHZvaWQgaW9tbXVfaHdkb21faW5pdChz
dHJ1Y3QgZG9tYWluICpkKTsKPiA+ICB2b2lkIGlvbW11X2RvbWFpbl9kZXN0cm95KHN0cnVjdCBk
b21haW4gKmQpOwo+ID4KPiA+IEBAIC0yNTcsOSArMjU3LDE3IEBAIHN0cnVjdCBkb21haW5faW9t
bXUgewo+ID4gICAgICBERUNMQVJFX0JJVE1BUChmZWF0dXJlcywgSU9NTVVfRkVBVF9jb3VudCk7
Cj4gPgo+ID4gICAgICAvKgo+ID4gLSAgICAgKiBEb2VzIHRoZSBndWVzdCByZXFpcmUgbWFwcGlu
Z3MgdG8gYmUgc3luY2hvbml6ZWQsIHRvIG1haW50YWluCj4gPiAtICAgICAqIHRoZSBkZWZhdWx0
IGRmbiA9PSBwZm4gbWFwLiAoU2VlIGNvbW1lbnQgb24gZGZuIGF0IHRoZSB0b3Agb2YKPiA+IC0g
ICAgICogaW5jbHVkZS94ZW4vbW0uaCkuCj4gPiArICAgICAqIERvZXMgdGhlIGd1ZXN0IHNoYXJl
IEhBUCBtYXBwaW5nIHdpdGggdGhlIElPTU1VPyBUaGlzIGlzIGFsd2F5cwo+ID4gKyAgICAgKiB0
cnVlIGZvciBBUk0gc3lzdGVtcyBhbmQgbWF5IGJlIHRydWUgZm9yIHg4NiBzeXN0ZW1zIHdoZXJl
IHRoZQo+ID4gKyAgICAgKiB0aGUgaGFyZHdhcmUgaXMgY2FwYWJsZS4KPiA+ICsgICAgICovCj4g
PiArICAgIGJvb2wgaGFwX3B0X3NoYXJlOwo+ID4gKwo+ID4gKyAgICAvKgo+ID4gKyAgICAgKiBE
b2VzIHRoZSBndWVzdCByZXF1aXJlIG1hcHBpbmdzIHRvIGJlIHN5bmNocm9uaXplZCwgdG8gbWFp
bnRhaW4KPiA+ICsgICAgICogdGhlIGRlZmF1bHQgZGZuID09IHBmbiBtYXA/IChTZWUgY29tbWVu
dCBvbiBkZm4gYXQgdGhlIHRvcCBvZgo+ID4gKyAgICAgKiBpbmNsdWRlL3hlbi9tbS5oKS4gTm90
ZSB0aGF0IGhhcF9wdF9zaGFyZSA9PSBmYWxzZSBkb2VzIG5vdAo+ID4gKyAgICAgKiBuZWNlc3Nh
cmlseSBpbXBseSB0aGlzIGlzIHRydWUuCj4gPiAgICAgICAqLwo+ID4gICAgICBib29sIG5lZWRf
c3luYzsKPiAKPiBJJ20gbG9zdCBoZXJlLCBkb2Vzbid0IGhhcF9wdF9zaGFyZSA9ICFuZWVkX3N5
bmM/Cj4gCj4gaWU6IHN5bmMgaXMgcmVxdWlyZWQgYmVjYXVzZSB0aGUgcGFnZS10YWJsZXMgYXJl
IG5vdCBzaGFyZWQ/Cj4gCgpJIHRob3VnaHQgdGhlIGNvbW1lbnQgd2FzIGNsZWFyLCBidXQgbWF5
YmUgbm90Li4uIENvbnNpZGVyIHRoZSAnaW5jbHVzaXZlJyBQViBoL3cgZG9tYWluIG1hcHBpbmdz
LiBObyBzaGFyaW5nIChiZWNhdXNlIGl0J3MgYSBQViBkb21haW4pIGFuZCBubyBzeW5jLCBiZWNh
dXNlIGFsbCBSQU0gaXMgbWFwcGVkIGFueXdheS4gQ2FuIEkgcGhyYXNlIGl0IGJldHRlcj8KCiAg
UGF1bAoKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
