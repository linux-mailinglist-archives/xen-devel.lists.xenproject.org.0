Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B85C150910
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:05:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydEq-00089a-MG; Mon, 03 Feb 2020 15:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iydEo-00089V-S3
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:02:10 +0000
X-Inumbo-ID: 2650723a-4696-11ea-8396-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2650723a-4696-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580742130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u7xHCsLyaZPwvCgnYCPDrwq1erYElmYLHZB2yfJwe60=;
 b=WQQJHnW8zaX/6qVSLp5zaPadVCBhbkZ2ITl3ZgKfPw7TM9zFqdUCdqcs
 QbcAPTiB5eGGSWSP69/P7s15oueZC1yDwCG/CYHR9PGBSTJdv2nhG6OSe
 b/YbYbg5x0caep9flTT8APYzxFfG62rQECxP7yx9NdmuEyfd2EtdEYo6o k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ucKe7PB5O4LJe+2WPAJJO1bvKh/oRXhTXCuU0Fa+4nXuQ9YLeKBJ4Fq9hxzCFYEH7im4MY6BMP
 Wv9Bo1Dq+v9vFjScei4tpI3PmBS82bNVU7e/RvgBRDdjT5WhpMZF/qFM6qRVKv/utI9aho99l5
 SojEZzG21d0Q6ohoEtrXo+dHN09fJer2Wy796gWCdvIMr3svkfTtOE/AWaGgyt8feIfYw1Dmpx
 X2o4yVprOxOUCXCJwGjklJ30RaTDkzEZYdIjhW4cnJQeysGO4LiN2S5+HIjyRKrOfHr+btcb6x
 xNA=
X-SBRS: 2.7
X-MesageID: 12218635
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12218635"
Date: Mon, 3 Feb 2020 16:01:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200203150154.GZ4679@Air-de-Roger>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200131174930.31045-6-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBIeXBlci1WIHVzZXMgYSB0ZWNobmlxdWUgY2FsbGVkIG92ZXJsYXkgcGFnZSBmb3IgaXRzIGh5
cGVyY2FsbCBwYWdlLiBJdAo+IHdpbGwgaW5zZXJ0IGEgYmFja2luZyBwYWdlIHRvIHRoZSBndWVz
dCB3aGVuIHRoZSBoeXBlcmNhbGwgZnVuY3Rpb25hbGl0eQo+IGlzIGVuYWJsZWQuIFRoYXQgbWVh
bnMgd2UgY2FuIHVzZSBhIHBhZ2UgdGhhdCBpcyBub3QgYmFja2VkIGJ5IHJlYWwKPiBtZW1vcnkg
Zm9yIGh5cGVyY2FsbCBwYWdlLgo+IAo+IFVzZSB0aGUgdG9wLW1vc3QgYWRkcmVzc2FibGUgcGFn
ZSBmb3IgdGhhdCBwdXJwb3NlLiBBZGp1c3QgZTgyMCBtYXAKPiBhY2NvcmRpbmdseS4KCkNhbiB5
b3UgYWRkIHRoaXMgaXMgZG9uZSB0byBhdm9pZCBwYWdlIHNoYXR0ZXJpbmcgYW5kIHRvIG1ha2Ug
c3VyZQpYZW4gaXNuJ3Qgb3ZlcndyaXRpbmcgYW55IE1NSU8gYXJlYSB3aGljaCBtaWdodCBiZSBw
cmVzZW50IGF0IGxvd2VyCmFkZHJlc3Nlcz8KCj4gCj4gV2UgYWxzbyBuZWVkIHRvIHJlZ2lzdGVy
IFhlbidzIGd1ZXN0IE9TIElEIHRvIEh5cGVyLVYuIFVzZSAweDMgYXMgdGhlCj4gdmVuZG9yIElE
LiBGaXggdGhlIGNvbW1lbnQgaW4gaHlwZXJ2LXRsZnMuaCB3aGlsZSBhdCBpdC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+IHY2Ogo+IDEu
IFVzZSBodl9ndWVzdF9vc19pZAo+IDIuIFVzZSBuZXcgZTgyMF9maXh1cCBob29rCj4gMy4gQWRk
IGEgQlVJTERfQlVHX09OCj4gCj4gdjU6Cj4gMS4gdXNlIGh5cGVydmlzb3JfcmVzZXJ2ZV90b3Bf
cGFnZXMKPiAyLiBhZGQgYSBtYWNybyBmb3IgaHlwZXJjYWxsIHBhZ2UgbWZuCj4gMy4gYWRkcmVz
cyBvdGhlciBtaXNjIGNvbW1lbnRzCj4gCj4gdjQ6Cj4gMS4gVXNlIGZpeG1hcAo+IDIuIEZvbGxv
dyByb3V0aW5lcyBsaXN0ZWQgaW4gVExGUwo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L2h5cGVydi5jICAgICAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCB8ICA1ICstCj4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICB8ICAzICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NzIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
aHlwZXJ2LmMKPiBpbmRleCA4ZDM4MzEzZDdhLi43YzJhOTZkNzBlIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jCj4gQEAgLTE5LDE1ICsxOSwyNyBAQAo+ICAgKiBDb3B5cmlnaHQg
KGMpIDIwMTkgTWljcm9zb2Z0Lgo+ICAgKi8KPiAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+Cj4gKyNp
bmNsdWRlIDx4ZW4vdmVyc2lvbi5oPgo+ICAKPiArI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KPiAg
I2luY2x1ZGUgPGFzbS9ndWVzdC5oPgo+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10bGZz
Lmg+Cj4gKyNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gIAo+ICBzdHJ1Y3QgbXNfaHlwZXJ2
X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0
IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsKPiAtICAgIC5uYW1lID0gIkh5cGVyLVYiLAo+IC19Owo+
ICtzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkKPiArewo+ICsgICAgdW5p
b24gaHZfZ3Vlc3Rfb3NfaWQgaWQ7Cj4gKwo+ICsgICAgaWQudmVuZG9yID0gSFZfWEVOX1ZFTkRP
Ul9JRDsKPiArICAgIGlkLm1ham9yID0geGVuX21ham9yX3ZlcnNpb24oKTsKPiArICAgIGlkLm1p
bm9yID0geGVuX21pbm9yX3ZlcnNpb24oKTsKPiArCj4gKyAgICByZXR1cm4gaWQucmF3Owo+ICt9
Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wczsKPiAgCj4gIGNv
bnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0IGh5cGVydl9wcm9iZSh2b2lkKQo+ICB7
Cj4gQEAgLTcyLDYgKzg0LDU3IEBAIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0
IGh5cGVydl9wcm9iZSh2b2lkKQo+ICAgICAgcmV0dXJuICZvcHM7Cj4gIH0KPiAgCj4gK3N0YXRp
YyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQo+ICt7Cj4gKyAgICB1bmlv
biBodl94NjRfbXNyX2h5cGVyY2FsbF9jb250ZW50cyBoeXBlcmNhbGxfbXNyOwo+ICsgICAgdW5p
b24gaHZfZ3Vlc3Rfb3NfaWQgZ3Vlc3RfaWQ7Cj4gKyAgICB1bnNpZ25lZCBsb25nIG1mbjsKPiAr
Cj4gKyAgICBCVUlMRF9CVUdfT04oSFZfSFlQX1BBR0VfU0hJRlQgIT0gUEFHRV9TSElGVCk7Cj4g
Kwo+ICsgICAgcmRtc3JsKEhWX1g2NF9NU1JfR1VFU1RfT1NfSUQsIGd1ZXN0X2lkLnJhdyk7Cj4g
KyAgICBpZiAoICFndWVzdF9pZC5yYXcgKQo+ICsgICAgewo+ICsgICAgICAgIGd1ZXN0X2lkLnJh
dyA9IGdlbmVyYXRlX2d1ZXN0X2lkKCk7Cj4gKyAgICAgICAgd3Jtc3JsKEhWX1g2NF9NU1JfR1VF
U1RfT1NfSUQsIGd1ZXN0X2lkLnJhdyk7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmRtc3JsKEhWX1g2
NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cj4gKyAgICBpZiAoICFo
eXBlcmNhbGxfbXNyLmVuYWJsZSApCj4gKyAgICB7Cj4gKyAgICAgICAgbWZuID0gSFZfSENBTExf
TUZOOwo+ICsgICAgICAgIGh5cGVyY2FsbF9tc3IuZW5hYmxlID0gMTsKPiArICAgICAgICBoeXBl
cmNhbGxfbXNyLmd1ZXN0X3BoeXNpY2FsX2FkZHJlc3MgPSBtZm47Cj4gKyAgICAgICAgd3Jtc3Js
KEhWX1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cj4gKyAgICB9
IGVsc2Ugewo+ICsgICAgICAgIG1mbiA9IGh5cGVyY2FsbF9tc3IuZ3Vlc3RfcGh5c2ljYWxfYWRk
cmVzczsKPiArICAgIH0KPiArCj4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9IWVBFUkNBTEwsIGh5
cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiArICAgIEJVR19PTighaHlwZXJjYWxsX21zci5lbmFi
bGUpOwo+ICsKPiArICAgIHNldF9maXhtYXBfeChGSVhfWF9IWVBFUlZfSENBTEwsIG1mbiA8PCBQ
QUdFX1NISUZUKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCj4g
K3sKPiArICAgIHNldHVwX2h5cGVyY2FsbF9wYWdlKCk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lk
IF9faW5pdCBlODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQo+ICt7Cj4gKyAgICB1aW50
NjRfdCBzID0gSFZfSENBTExfTUZOIDw8IFBBR0VfU0hJRlQ7Cj4gKwo+ICsgICAgaWYgKCAhZTgy
MF9hZGRfcmFuZ2UoZTgyMCwgcywgcyArIFBBR0VfU0laRSwgRTgyMF9SRVNFUlZFRCkgKQoKSSB0
aGluayBlbmQgc2hvdWxkIGJlIHMgKyBQQUdFX1NJWkUgLSAxLCBvciBlbHNlIGl0IGV4cGFuZHMg
YWNyb3NzIHR3bwpwYWdlcz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
