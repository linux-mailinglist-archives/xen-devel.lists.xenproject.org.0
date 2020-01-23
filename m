Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F926146D0B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 16:37:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iueV4-0000i7-8X; Thu, 23 Jan 2020 15:34:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v8qs=3M=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iueV2-0000i0-QY
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 15:34:28 +0000
X-Inumbo-ID: d732faf4-3df5-11ea-be65-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d732faf4-3df5-11ea-be65-12813bfff9fa;
 Thu, 23 Jan 2020 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579793667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9orI4IWOc1IF9ASgREv5T/f7p3UAsxqqu1K3daWTXY4=;
 b=AOC+Zs667klTSh3EnU3cFtv9/0vSI/fcatS+iANai/P6OUCXyvB9GB3a
 YhMT/sq/xJ2oJmDehOZ/8HFMTr2E/R47vf/vNb7fAS9BLb8y0vCR+9K8m
 hOtHvq5ST6kdP5Tew1mXrOdZRi+vcj3fSMo4nD/yE6hdFleqBmvAck6ze k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XhoXXnBXTnhYOCaGYGfj+9qsOfA1UiwlAzOWBQutUQQWbr4VMYz9T0x2c8N27H1lXGeFaYM9a8
 udq3YB2sppgC7ryah3i8t4xux10ArBuWu2CCJ9uNsX5bbGHVg2rJjLQ3T5J5d2d9pNLaLukcKe
 77kQdQUv9so60xDEGADf9dRYGU6PSIM37XPUomshd9wRVwb30nKZXlAnKt60awvpZzje1zmiIy
 beSm6IiI4du5npRt8u9QxiG9KmXIG6ht3kFD2i3bLGTxzUBBxyxMSaxEBF/dHXRN+Ybn5QZSQU
 WBE=
X-SBRS: 2.7
X-MesageID: 11704540
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,354,1574139600"; d="scan'208";a="11704540"
Date: Thu, 23 Jan 2020 15:34:25 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200123153425.GJ1288@perard.uk.xensource.com>
References: <E1it15N-0001Ge-Go@osstest.test-lab.xenproject.org>
 <20200121102109.GG11756@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121102109.GG11756@Air-de-Roger>
Subject: Re: [Xen-devel] [xen-unstable bisection] complete
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTA6MjE6MDlBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBUaGUgaXNzdWUgaXMgdGhhdCB0aGlzIGNoYW5nZSBpcyBwYXNzaW5nIHRoZSBn
dWVzdCBkb21haW5fY3JlYXRlX3N0YXRlCj4gdG8gbGlieGxfX2RvbWFpbl9idWlsZCBpbiBsaWJ4
bF9fc3Bhd25fc3R1Yl9kbSwgYW5kIGhlbmNlIHRoZQo+IHN0dWJkb21haW4gZG9lc24ndCBnZXQg
Y3JlYXRlZC4gSSBoYXZlIHRoZSBmb2xsb3dpbmcgcGF0Y2ggdGhhdCBmaXhlcwo+IGl0LCBidXQg
aXQncyBraW5kIG9mIGRpcnR5Lgo+IAo+IC0tLTg8LS0tCj4gRnJvbSA2ODhmZGU5NTk5MmQwN2Ji
MTEyM2QzMjRhNjgwMDZkZDA4YmM2NTEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206
IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gRGF0ZTogVHVlLCAyMSBK
YW4gMjAyMCAxMDoxNDowOSArMDAwMAo+IFN1YmplY3Q6IFtQQVRDSF0gbGlieGw6IGZpeCBzdHVi
ZG9tYWluIGNyZWF0aW9uIGFmdGVyIGFhY2MxNDMwMDY0MjlkZQo+IE1JTUUtVmVyc2lvbjogMS4w
Cj4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cgo6LSgsIHRoaXMgaXMg
YSBsaWUuIFRoZSBlbWFpbCBJJ3ZlIHJlY2VpdmVkIGhhcyBhIGRpZmZlcmVudCBjaGFyc2V0LiBn
aXQKY29tcGxhaW5lZCBhYm91dCBpdC4gTWF5YmUgbmV4dCB0aW1lIHRoZSBwYXRjaCBjb3VsZCBi
ZSBhdHRhY2hlZCwgb3IgaXQKY291bGQgYmUgYSBwcm9wZXIgcGF0Y2ggd2l0aCBzb21lIG5vdGUg
KGFmdGVyIC0tLSkgKGdpdCBzZW5kLWVtYWlsIGNhbgpkbyAtLWluLXJlcGx5LXRvKSwgb3IgaXQg
Y291bGQgYmUgdHdvIHNlcGFyYXRlZCBlbWFpbHMgd2l0aCB0aGUgZmlyc3QKb25lIHJlcGx5aW5n
IHRvIHRoZSByZXBvcnQgYW5kIHRoZSBzZWNvbmQgdGhlIHBhdGNoIChhbGwgaW4gdGhlIHNhbWUK
dGhyZWFkKS4KCj4gQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+IAo+IGFhY2MxNDMw
MDY0MjlkZSBicm9rZSBzdHViZG9tYWluIGNyZWF0aW9uIGJ5IHBhc3NpbmcgdGhlIGd1ZXN0Cj4g
ZG9tYWluX2NyZWF0ZV9zdGF0ZSB0byBsaWJ4bF9fZG9tYWluX2J1aWxkIGluIGxpYnhsX19zcGF3
bl9zdHViX2RtLAo+IHdoZW4gaXQgc2hvdWxkIGluc3RlYWQgYmUgY3JhZnRpbmcgYSBuZXcgZG9t
YWluX2NyZWF0ZV9zdGF0ZSBmb3IgdGhlCj4gc3R1YmRvbWFpbi4KPiAKPiBGaXhlczogYWFjYzE0
MzAwNjQyOWRlICgndG9vbHMvbGlieGw6IFBsdW1iIGRvbWFpbl9jcmVhdGVfc3RhdGUgZG93biBp
bnRvIGxpYnhsX19idWlsZF9wcmUoKScpCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMg
ICAgICAgfCAyMiArKysrKysrKysrKysrLS0tLS0tLS0tCj4gIHRvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmggfCAgMyArLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAx
MSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiBpbmRleCAzZjA4Y2NhZDFiLi5iMWRkZGU3N2U4IDEw
MDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiArKysgYi90b29scy9saWJ4bC9s
aWJ4bF9kbS5jCj4gQEAgLTIxMTAsMTcgKzIxMTAsMjEgQEAgdm9pZCBsaWJ4bF9fc3Bhd25fc3R1
Yl9kbShsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19kb21haW5fY3JlYXRlX3N0YXRlICpkY3MpCj4g
ICAgICB4c190cmFuc2FjdGlvbl90IHQ7Cj4gIAo+ICAgICAgLyogY29udmVuaWVuY2UgYWxpYXNl
cyAqLwo+IC0gICAgbGlieGxfZG9tYWluX2NvbmZpZyAqY29uc3QgZG1fY29uZmlnID0gJnNkc3Mt
PmRtX2NvbmZpZzsKPiAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmNvbnN0IGd1ZXN0X2NvbmZp
ZyA9IHNkc3MtPmRtLmd1ZXN0X2NvbmZpZzsKPiAgICAgIGNvbnN0IGludCBndWVzdF9kb21pZCA9
IHNkc3MtPmRtLmd1ZXN0X2RvbWlkOwo+ICAgICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZSAq
Y29uc3QgZF9zdGF0ZSA9IHNkc3MtPmRtLmJ1aWxkX3N0YXRlOwo+IC0gICAgbGlieGxfX2RvbWFp
bl9idWlsZF9zdGF0ZSAqY29uc3Qgc3R1YmRvbV9zdGF0ZSA9ICZzZHNzLT5kbV9zdGF0ZTsKPiAr
ICAgIGxpYnhsX19kb21haW5fYnVpbGRfc3RhdGUgKnN0dWJkb21fc3RhdGU7Cj4gKyAgICBsaWJ4
bF9kb21haW5fY29uZmlnICpkbV9jb25maWc7Cj4gIAo+ICAgICAgLyogSW5pdGlhbGlzZSBwcml2
YXRlIHBhcnQgb2Ygc2RzcyAqLwo+IC0gICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZV9pbml0
KHN0dWJkb21fc3RhdGUpOwo+ICAgICAgZG1zc19pbml0KCZzZHNzLT5kbSk7Cj4gICAgICBkbXNz
X2luaXQoJnNkc3MtPnB2cWVtdSk7Cj4gICAgICBsaWJ4bF9feHN3YWl0X2luaXQoJnNkc3MtPnhz
d2FpdCk7Cj4gKyAgICBHQ05FVyhzZHNzLT5kY3MpOwo+ICsgICAgc3R1YmRvbV9zdGF0ZSA9ICZz
ZHNzLT5kY3MtPmJ1aWxkX3N0YXRlOwo+ICsgICAgbGlieGxfX2RvbWFpbl9idWlsZF9zdGF0ZV9p
bml0KHN0dWJkb21fc3RhdGUpOwo+ICsgICAgR0NORVcoc2Rzcy0+ZGNzLT5ndWVzdF9jb25maWcp
Owo+ICsgICAgZG1fY29uZmlnID0gc2Rzcy0+ZGNzLT5ndWVzdF9jb25maWc7CgpJIGRvbid0IHRo
aW5rIHRoYXQncyBlbm91Z2gsIHdlIG5lZWQgdG8gaW5pdGlhbGl6ZSB0aGUgZGNzIHByb3Blcmx5
LgpPdGhlcndpc2UsIGxpYnhsX19kb21haW5fYnVpbGQoKSBtaWdodCBzdGFydCB1c2luZyB0aGlu
ZyB0aGF0IGFyZW4ndCBzZXQKcHJvcGVybHkuIE1heWJlIHdlIHdvdWxkIG5lZWQgYSBuZXcgc3Ry
dWN0IHdoaWNoIGNvdWxkIGJlIHBhc3MgdG8KbGlieGxfX2RvbWFpbl9idWlsZCosIG9yIHRoYXQg
bWlnaHQgYmUgbW9yZSBjb21wbGljYXRlZCB0aGFuIG5lZWRlZC4KCj4gIAo+ICAgICAgaWYgKGd1
ZXN0X2NvbmZpZy0+Yl9pbmZvLmRldmljZV9tb2RlbF92ZXJzaW9uICE9Cj4gICAgICAgICAgTElC
WExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU5fVFJBRElUSU9OQUwpIHsKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2lu
dGVybmFsLmgKPiBpbmRleCBkOTE5ZjkxODgyLi5hYmY4OGRmZDc2IDEwMDY0NAo+IC0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oCj4gQEAgLTQxMDIsOCArNDEwMiw3IEBAIHR5cGVkZWYgc3RydWN0IHsKPiAgICAgIC8q
IGZpbGxlZCBpbiBieSB1c2VyLCBtdXN0IHJlbWFpbiB2YWxpZDogKi8KPiAgICAgIGxpYnhsX19k
bV9zcGF3bl9jYiAqY2FsbGJhY2s7IC8qIGNhbGxlZCBhcyBjYWxsYmFjaygsJnNkc3MtPmRtLCkg
Ki8KPiAgICAgIC8qIHByaXZhdGUgdG8gbGlieGxfX3NwYXduX3N0dWJfZG06ICovCj4gLSAgICBs
aWJ4bF9kb21haW5fY29uZmlnIGRtX2NvbmZpZzsKPiAtICAgIGxpYnhsX19kb21haW5fYnVpbGRf
c3RhdGUgZG1fc3RhdGU7Cj4gKyAgICBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9zdGF0ZSAqZGNzOwoK
VGhpcyBzaG91bGQgYmUgbmFtZWQgZG1fZGNzLCBJIHRoaW5rLCB0byBmb2xsb3cgdGhlIHNhbWUg
cGF0dGVybiBhcwpiZWZvcmUuCgoKVGhhbmtzIGZvciB0cmFja2luZyB0aGlzIGRvd24uCgotLSAK
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
