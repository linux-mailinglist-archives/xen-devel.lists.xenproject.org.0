Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7F1AB4D5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 11:23:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6AQ3-0005Yz-WB; Fri, 06 Sep 2019 09:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gwiz=XB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i6AQ2-0005Yu-9h
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 09:20:38 +0000
X-Inumbo-ID: 9618faae-d087-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9618faae-d087-11e9-b76c-bc764e2007e4;
 Fri, 06 Sep 2019 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567761637;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=db169m4HoYL/ksYQKKrL+GvEwhjapCxmoxcZbgXmumI=;
 b=PiOtNFJ0JZW9jrkazEqo29LeJ48NRlWvJhQ3rmWZMzDAtYistrsKY7gB
 TU5AwaBlaGB126Nzr00iSwMvk0kZuaKl4r6SEUSXtZbU8cW1s5KHeRVSV
 jS7LMzx1PJqBdHJD5GXAmMA/KGO2SMdSi32zYeZmpZpCAReiaAx/6yRLC E=;
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
IronPort-SDR: 8GN3mEt61KOZhuuC5/u/DMneHD7TCZGfjGTypAlmsxVPoYfnVBmZPcoQ/5jq9ElQtXv8c+GuEA
 nsjltSIskqRcBGK48KGhoRtyRyniSu/JfIlAuOCrg6cK8nZmVGaG5/BXusUVbUydQnyMfbzZQ+
 1Fjd0mjMhMDp1OC1L4iyWmQfZgZr7eE0GFIqTXGNh1iJplC0pD4yr0ugseWioz77OYUMis1P1f
 oQZm2u7BEvfjGS0ozZCPgNB6WF3aCViYr8Q00Mv1p3u+Me4DWG3nUU1uBmstDVQLLAS2N/djej
 0nE=
X-SBRS: 2.7
X-MesageID: 5229452
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,472,1559534400"; 
   d="scan'208";a="5229452"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Chao Gao' <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [RFC Patch] xen/pt: Emulate FLR capability
Thread-Index: AQHVXkfuFLvvoAaowUSFuPbgsUcGX6cRyN6AgAx8SoCAACDqkA==
Date: Fri, 6 Sep 2019 09:20:33 +0000
Message-ID: <1307d03945d948fd89a6956d77c5ce28@AMSPEX02CL03.citrite.net>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
 <20190829102059.bk4l7itydj73d3ua@Air-de-Roger>
 <20190906090107.GA25703@gao-cwp>
In-Reply-To: <20190906090107.GA25703@gao-cwp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jan
 Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IENoYW8gR2FvIDxjaGFvLmdhb0Bp
bnRlbC5jb20+Cj4gU2VudDogMDYgU2VwdGVtYmVyIDIwMTkgMTA6MDEKPiBUbzogUm9nZXIgUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+OyBQYXVsIER1cnJhbnQKPiA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gU3ViamVjdDogUmU6IFtSRkMgUGF0Y2hdIHhl
bi9wdDogRW11bGF0ZSBGTFIgY2FwYWJpbGl0eQo+IAo+IE9uIFRodSwgQXVnIDI5LCAyMDE5IGF0
IDEyOjIxOjExUE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPk9uIFRodSwgQXVn
IDI5LCAyMDE5IGF0IDA1OjAyOjI3UE0gKzA4MDAsIENoYW8gR2FvIHdyb3RlOgo+ID4+IEN1cnJl
bnRseSwgZm9yIGEgSFZNIG9uIFhlbiwgbm8gcmVzZXQgbWV0aG9kIGlzIHZpcnR1YWxpemVkLiBT
byBpbiBhIFZNJ3MKPiA+PiBwZXJzcGVjdGl2ZSwgYXNzaWduZWQgZGV2aWNlcyBjYW5ub3QgYmUg
cmVzZXQuIEJ1dCBzb21lIGRldmljZXMgcmVseSBvbiBQQ0kKPiA+PiByZXNldCB0byByZWNvdmVy
IGZyb20gaGFyZHdhcmUgaGFuZ3MuIFdoZW4gYmVpbmcgYXNzaWduZWQgdG8gYSBWTSwgdGhvc2UK
PiA+PiBkZXZpY2VzIGNhbm5vdCBiZSByZXNldCBhbmQgd29uJ3Qgd29yayBhbnkgbG9uZ2VyIGlm
IGEgaGFyZHdhcmUgaGFuZyBvY2N1cnMuCj4gPj4gV2UgaGF2ZSB0byByZWJvb3QgVk0gdG8gdHJp
Z2dlciBQQ0kgcmVzZXQgb24gaG9zdCB0byByZWNvdmVyIHRoZSBkZXZpY2UuCj4gPj4KPiA+PiBU
aGlzIHBhdGNoIGV4cG9zZXMgRkxSIGNhcGFiaWxpdHkgdG8gVk1zIGlmIHRoZSBhc3NpZ25lZCBk
ZXZpY2UgY2FuIGJlIHJlc2V0IG9uCj4gPj4gaG9zdC4gV2hlbiBWTSBpbml0aWF0ZXMgYW4gRkxS
IHRvIGEgZGV2aWNlLCBxZW11IGNsZWFucyB1cCB0aGUgZGV2aWNlIHN0YXRlLAo+ID4+IChpbmNs
dWRpbmcgZGlzYWJsaW5nIG9mIGludHggYW5kL29yIE1TSSBhbmQgdW5tYXBwaW5nIEJBUnMgZnJv
bSBndWVzdCwgZGVsZXRpbmcKPiA+PiBlbXVsYXRlZCByZWdpc3RlcnMpLCB0aGVuIGluaXRpYXRl
IFBDSSByZXNldCB0aHJvdWdoICdyZXNldCcga25vYiB1bmRlciB0aGUKPiA+PiBkZXZpY2UncyBz
eXNmcywgZmluYWxseSBpbml0aWFsaXplIHRoZSBkZXZpY2UgYWdhaW4uCj4gPgo+ID5JIHRoaW5r
IHlvdSBsaWtlbHkgbmVlZCB0byBkZWFzc2lnbiB0aGUgZGV2aWNlIGZyb20gdGhlIFZNLCBwZXJm
b3JtCj4gPnRoZSByZXNldCwgYW5kIHRoZW4gYXNzaWduIHRoZSBkZXZpY2UgYWdhaW4sIHNvIHRo
YXQgdGhlcmUncyBubyBYZW4KPiA+aW50ZXJuYWwgc3RhdGUgY2FycmllZCBvdmVyIHByaW9yIHRv
IHRoZSByZXNldD8KPiAKPiBZZXMuIEl0IGlzIHRoZSBzYWZlc3Qgd2F5LiBCdXQgaGVyZSBJIHdh
bnQgdG8gcHJlc2VudCB0aGUgZmVhdHVyZSBhcyBGTFIKPiAoc3VjaCB0aGF0IHRoZSBkZXZpY2Ug
ZHJpdmVyIGluIGd1ZXN0IGNhbiBpc3N1ZSBQQ0kgcmVzZXQgd2hlbmV2ZXIKPiBuZWVkZWQgYW5k
IG5vIGNoYW5nZSBpcyBuZWVkZWQgdG8gZGV2aWNlIGRyaXZlcikuICBDdXJyZW50IGRldmljZQo+
IGRlYXNzaWdubWVudCBub3RpZmllcyBndWVzdCB0aGF0IHRoZSBkZXZpY2UgaXMgZ29pbmcgdG8g
YmUgcmVtb3ZlZAo+IEl0IGlzIG5vdCB0aGUgc3RhbmRhcmQgUENJIHJlc2V0LiBJcyBpdCBwb3Nz
aWJsZSB0byBtYWtlIGd1ZXN0IHVuYXdhcmUKPiBvZiB0aGUgZGV2aWNlIGRlYXNzaWdubWVudCB0
byBlbXVsYXRlIGEgc3RhbmRhcmQgUENJIHJlc2V0PwoKSXQgc2hvdWxkIGJlLCBJIHdvdWxkIGhh
dmUgdGhvdWdodC4gUUVNVSBlbXVsYXRlcyBhbGwgY29uZmlnIHNwYWNlIHNvIGFueSBjb25maWcg
YWNjZXNzIGJ5IHRoZSBndWVzdCB3b3VsZCBiZSB1bmFmZmVjdGVkIGJ5IGRlLWFzc2lnbm1lbnQu
IFRoZSBCQVJzIGFuZCBpbnRlcnJ1cHRzIHdvdWxkIGJlIHVubWFwcGVkLi4uIGJ1dCB0aGF0J3Mg
d2hhdCB5b3UnZCB3YW50IGFueXdheS4KCj4gSW4gbXkgbWluZCwKPiB3ZSBjYW4gZXhwb3NlIGRv
X3BjaV9yZW1vdmUvYWRkIHRvIHFlbXUgb3IgcmV3cml0ZSB0aGVtIGluIHFlbXUgKGJ1dAo+IGRv
bid0IHJlbW92ZSB0aGUgZGV2aWNlIGZyb20gZ3Vlc3QncyBQQ0kgaGllcmFyY2h5KS4gRG8geW91
IHRoaW5rIGl0IGlzCj4gdGhlIHJpZ2h0IGRpcmVjdGlvbj8KCkxvbmcgdGVybSBJIHRoaW5rIHdl
IHdhbnQgdG8gZ2V0IHBhc3MtdGhyb3VnaCBlbXVsYXRpb24gb3V0IG9mIFFFTVUgYW5kIGludG8g
WGVuLgoKICBQYXVsCgo+IAo+IFRoYW5rcwo+IENoYW8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
