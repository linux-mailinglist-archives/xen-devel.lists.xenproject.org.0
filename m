Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB9B35F4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 09:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9lkB-00015w-9V; Mon, 16 Sep 2019 07:48:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aiU4=XL=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i9lk9-00015g-6H
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 07:48:17 +0000
X-Inumbo-ID: 570b7b3a-d856-11e9-95d9-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 570b7b3a-d856-11e9-95d9-12813bfff9fa;
 Mon, 16 Sep 2019 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568620096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0aTwoOVlSLDBJtAjCGjvLMVvhNIJoWqJee/PFZyPkV8=;
 b=ZLUDDk2y4eq3pgY5A3QTBu53KPfupTO0/C3fACGwt+GWNae9Bn9EV/uN
 nStquKfYhkSF5cuibAh2lOX7sLMFCMnfM9N4iQ8z1aoDbhNpSYv5OpDjc
 KFCMN9j84GOouUMY/QHEjG0UKwaS2fldc2Zz/xRUlZ73uJ1Ff63J/x9lk 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +FOIZ7OmJWHDCZJQKFrTSr+OEtdLk/WzAgwi9Q9tWdmlObrqEs1VLUqXGWfsFwIA63iZOVMCKn
 +l1nUyrtB+aoiRXBgM0vqDNU5tx/Q7LcqL4ZBqvdLoub+6sHmWF02a9pQba2ysOnq685yNc2oi
 XILr4sAgNmDUzM5cB0UppsRZ0Ai5YwbHbgz8Uhrl1XQczKjGb4vH9ScsBZ6CiCfREmrQ6s0hcj
 /92yvqzf1YeN/ncJpMmMYSDDAxIkjdTYNwrLd65e/unsvw9B8nke8W/rJiH+4GjJriF+zja4aQ
 glg=
X-SBRS: 2.7
X-MesageID: 5599710
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,510,1559534400"; 
   d="scan'208";a="5599710"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH v11 6/6] introduce a 'passthrough' configuration option
 to xl.cfg...
Thread-Index: AQHVaiIuTrYEj6m+XkajsPJmvmLsaacpqsaAgARGiRA=
Date: Mon, 16 Sep 2019 07:48:10 +0000
Message-ID: <a773566e93d24f0290fe420d1b373328@AMSPEX02CL03.citrite.net>
References: <20190913105826.2704-1-paul.durrant@citrix.com>
 <20190913105826.2704-7-paul.durrant@citrix.com>
 <20190913162833.GG1308@perard.uk.xensource.com>
In-Reply-To: <20190913162833.GG1308@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v11 6/6] introduce a 'passthrough'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDEzIFNlcHRlbWJlciAyMDE5IDE3OjI5Cj4g
VG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
Q2hyaXN0aWFuIExpbmRpZwo+IDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+OyBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRy
ZXcKPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwKPiA8anVsaWVuLmdyYWxsQGFy
bS5jb20+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBT
dGVmYW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVuLm9y
ZykgPHRpbUB4ZW4ub3JnPjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IFZvbG9keW15
cgo+IEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSA2LzZdIGlu
dHJvZHVjZSBhICdwYXNzdGhyb3VnaCcgY29uZmlndXJhdGlvbiBvcHRpb24gdG8geGwuY2ZnLi4u
Cj4gCj4gT24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6NTg6MjZBTSArMDEwMCwgUGF1bCBEdXJy
YW50IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9s
aWJ4bC9saWJ4bC5oCj4gPiBpbmRleCAxMjU0NTEzMGRmLi5lNGI5YzUzOWI2IDEwMDY0NAo+ID4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGwuaAo+
ID4gQEAgLTQxNSw2ICs0MTUsMTUgQEAKPiA+ICAgKi8KPiA+ICAjZGVmaW5lIExJQlhMX0hBVkVf
QlVJTERJTkZPX0lPTU1VX01FTUtCIDEKPiA+Cj4gPiArLyoKPiA+ICsgKiBMSUJYTF9IQVZFX0NS
RUFURUlORk9fUEFTU1RIUk9VR0ggaW5kaWNhdGVzIHRoYXQKPiA+ICsgKiBsaWJ4bF9kb21haW5f
Y3JlYXRlX2luZm8gaGFzIGEgcGFzc3Rocm91Z2ggZmllbGQgKHdoaWNoIGlzIGEKPiA+ICsgKiBs
aWJ4bF9wYXNzdGhyb3VnaCBlbnVtZXJhdGlvbikgdGhhdCBpbmRpY2F0ZXMgd2hldGhlciBkZXZp
Y2UgcGFzcy0KPiA+ICsgKiB0aHJvdWdoIGlzIGVuYWJsZWQgZm9yIHRoZSBkb21haW4gYW5kLCBp
ZiBzbywgd2hldGhlciB0aGUgSU9NTVUgYW5kCj4gPiArICogSEFQIHBhZ2UgdGFibGVzIG1heSBi
ZSBzaGFyZWQgb3Igbm90Lgo+ID4gKyAqLwo+ID4gKyNkZWZpbmUgTElCWExfSEFWRV9DUkVBVEVJ
TkZPX1BBU1NUSFJPVUdIIDEKPiA+ICsKPiA+ICAvKgo+ID4gICAqIGxpYnhsIEFCSSBjb21wYXRp
YmlsaXR5Cj4gPiAgICoKPiA+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUu
YyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4gPiBpbmRleCA1OWRiY2I1MGEwLi42Yjc3
MDJkYjE3IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiA+ICsr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4gPiBAQCAtNTc4LDYgKzU3OCwxNSBAQCBp
bnQgbGlieGxfX2RvbWFpbl9tYWtlKGxpYnhsX19nYyAqZ2MsIGxpYnhsX2RvbWFpbl9jb25maWcg
KmRfY29uZmlnLAo+ID4gICAgICAgICAgICAgICAgICBsaWJ4bF9kZWZib29sX3ZhbChpbmZvLT5v
b3MpID8gMCA6IFhFTl9ET01DVExfQ0RGX29vc19vZmY7Cj4gPiAgICAgICAgICB9Cj4gPgo+ID4g
KyAgICAgICAgTE9HKERFVEFJTCwgInBhc3N0aHJvdWdoOiAlcyIsCj4gPiArICAgICAgICAgICAg
bGlieGxfcGFzc3Rocm91Z2hfdG9fc3RyaW5nKGluZm8tPnBhc3N0aHJvdWdoKSk7Cj4gPiArCj4g
PiArICAgICAgICBpZiAoaW5mby0+cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfRElT
QUJMRUQpCj4gPiArICAgICAgICAgICAgY3JlYXRlLmZsYWdzIHw9IFhFTl9ET01DVExfQ0RGX2lv
bW11Owo+ID4gKwo+ID4gKyAgICAgICAgaWYgKGluZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BB
U1NUSFJPVUdIX1NZTkNfUFQpCj4gPiArICAgICAgICAgICAgY3JlYXRlLmlvbW11X29wdHMgfD0g
WEVOX0RPTUNUTF9JT01NVV9ub19zaGFyZXB0Owo+ID4gKwo+ID4gICAgICAgICAgLyogVWx0aW1h
dGVseSwgaGFuZGxlIGlzIGFuIGFycmF5IG9mIDE2IHVpbnQ4X3QsIHNhbWUgYXMgdXVpZCAqLwo+
ID4gICAgICAgICAgbGlieGxfdXVpZF9jb3B5KGN0eCwgKGxpYnhsX3V1aWQgKikmY3JlYXRlLmhh
bmRsZSwgJmluZm8tPnV1aWQpOwo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF90eXBlcy5pZGwgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiA+IGluZGV4IGQ1MmM2
M2I2YjAuLjIyZjA1NzExZTMgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9saWJ4bC9saWJ4bF90eXBl
cy5pZGwKPiA+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4gQEAgLTI2Myw2
ICsyNjMsMTIgQEAgbGlieGxfdmtiX2JhY2tlbmQgPSBFbnVtZXJhdGlvbigidmtiX2JhY2tlbmQi
LCBbCj4gPiAgICAgICgyLCAiTElOVVgiKQo+ID4gICAgICBdKQo+ID4KPiA+ICtsaWJ4bF9wYXNz
dGhyb3VnaCA9IEVudW1lcmF0aW9uKCJwYXNzdGhyb3VnaCIsIFsKPiA+ICsgICAgKDAsICJkaXNh
YmxlZCIpLAo+ID4gKyAgICAoMSwgInN5bmNfcHQiKSwKPiA+ICsgICAgKDIsICJzaGFyZV9wdCIp
LAo+ID4gKyAgICBdKQo+ID4gKwo+ID4gICMKPiA+ICAjIENvbXBsZXggbGlieGwgdHlwZXMKPiA+
ICAjCj4gCj4gU28sIHdpdGggdGhpcyBjaGFuZ2VzLCB3aGVuIGxpYnZpcnQgaXMgcmVidWlsdCBh
Z2FpbnN0IGEgbmV3ZXIgbGlieGwsCj4gZ3Vlc3Qgd2l0aCBwYXNzLXRocm91Z2ggZGV2aWNlcyB3
b24ndCB3b3JrIGFueW1vcmU/Cj4gKFRoYXQgaXMsIHdpdGhvdXQgbW9kaWZpY2F0aW9uIG9mIGxp
YnZpcnQuKQoKWWVzLCB0aGF0J3MgYSBnb29kIHBvaW50LiBJJ2xsIGFkZCBhbiBleHRyYSBodW5r
IHRvIGRlZmF1bHQgcGFzc3Rocm91Z2ggdG8gZW5hYmxlZCB1bmxlc3MgaXQgaXMgb3RoZXJ3aXNl
IHNldCBieSB0aGUgdG9vbHN0YWNrLgoKICBQYXVsCgo+IAo+IC0tCj4gQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
