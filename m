Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD3D21823
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 14:26:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRbu2-0006Zo-EK; Fri, 17 May 2019 12:23:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRbu1-0006Zj-FO
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:23:57 +0000
X-Inumbo-ID: a21dd27a-789e-11e9-83f2-3ba84b2acd88
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a21dd27a-789e-11e9-83f2-3ba84b2acd88;
 Fri, 17 May 2019 12:23:53 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Andrew.Cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Andrew.Cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: LtSkMK8Mh0InpNoDAek+TMyGEGDJYdAp8XCLYZ+I0WJQNDxZ60AqbcXC15r52pj+ux3FkIhMHL
 xZ5xetARrt5bDyJGsZ33l9MjXxdvM72DbBUeYQBb/kheKkGwqGlKZ4IYnu8Nzo6XEllU30eqdU
 gQ0lE+tJ2ZB4AuLHmPJWGF4KH2ZQWFc8D25Ii5SpksqM7ITS4/PHa0GEMSg4kMyZ4xEPi5oa6/
 YXW4yc1j6xMyKxR4bDVkKrKpde/EXs4ZYvVi4gk/c70UkDmPqHJumijiK+H7jR05uD0UvqFVJJ
 MR4=
X-SBRS: 2.7
X-MesageID: 566613
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="566613"
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>, Ian Campbell
 <Ian.Campbell@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: libxc: memory leak in handle_hvm_context
Thread-Index: AQHVDKan33sGjEqd9kqv2IASSutjsaZvFF0AgAAoYbI=
Date: Fri, 17 May 2019 12:23:49 +0000
Message-ID: <1558095829281.70695@citrix.com>
References: <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>,
 <CAOcoXZbz6Yfjc=U+MEAPWL0g+wc44FpipM+AmrKJGMYeQPteJw@mail.gmail.com>
In-Reply-To: <CAOcoXZbz6Yfjc=U+MEAPWL0g+wc44FpipM+AmrKJGMYeQPteJw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] libxc: memory leak in handle_hvm_context
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KEFwb2xvZ2llcyBmb3IgdXNlIG9mIG91dGxvb2sgLSBJJ20gaGF2aW5nIGVtYWlsIHByb2JsZW1z
IGF0bSkuCgpUaGVyZSBpcyBubyBtZW1vcnkgbGVhayBhdCBhbGwuCgp4ID0gbWVtY3B5KHksIC4u
Lik7CgppcyBhbiAieCA9IHk7IiBhc3NpZ25tZW50IGluIGRpc2d1aXNlLiAgUmVjYWxsIHRoYXQg
bWVtY3B5KCkgcmV0dXJucyB5LCBhbmQgaXNuJ3QgYSB2b2lkIGZ1bmN0aW9uLgoKfkFuZHJldwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IFZpa3RvciBNaXRp
biA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4KU2VudDogMTcgTWF5IDIwMTkgMTI6NTYKVG86
IEFuZHJldyBDb29wZXI7IElhbiBDYW1wYmVsbDsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCkNjOiBWb2xvZHlteXIgQmFiY2h1awpTdWJqZWN0OiBSZTogbGlieGM6IG1lbW9yeSBsZWFr
IGluIGhhbmRsZV9odm1fY29udGV4dAoKVGhlcmUgaXMgbm8gbWVtb3J5IGxlYWsgaW4gY2FzZSB3
aGVuIGhhbmRsZV9odm1fY29udGV4dCBmdW5jdGlvbiBpcwpjYWxsZWQgbmV4dCB0aW1lLgpTbyB0
aGUgY29kZSBzZWVtcyBvaywgcGxlYXNlIGlnbm9yZSB0aGUgbWFpbCwgc29ycnkgZm9yIGNvbmZ1
c2lvbi4KClRoYW5rcwoKT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMjo0OSBQTSBWaWt0b3IgTWl0
aW4gPHZpa3Rvci5taXRpbi4xOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQWxsLAo+Cj4gSXQg
c2VlbXMgdGhlcmUgaXMgYSBtZW1vcnkgbGVhayBpbiBsaWJ4YyBmdW5jdGlvbiBoYW5kbGVfaHZt
X2NvbnRleHQKPiAoaW4gZmlsZSB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYy4p
LiBUaGVyZSBpcyBhIG1hbGxvYyBvZgo+IHZhcmlhYmxlIHAgd2l0aG91dCBmcmVlLgo+IFBsZWFz
ZSB0YWtlIGEgbG9vay4KPgo+ICsvKgo+ICsgKiBQcm9jZXNzIGFuIEhWTV9DT05URVhUIHJlY29y
ZCBmcm9tIHRoZSBzdHJlYW0uCj4gKyAqLwo+ICtzdGF0aWMgaW50IGhhbmRsZV9odm1fY29udGV4
dChzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpCj4gK3sKPiArICAgIHhjX2ludGVyZmFjZSAq
eGNoID0gY3R4LT54Y2g7Cj4gKyAgICB2b2lkICpwOwo+ICsKPiArICAgIHAgPSBtYWxsb2MocmVj
LT5sZW5ndGgpOwo+ICsgICAgaWYgKCAhcCApCj4gKyAgICB7Cj4gKyAgICAgICAgRVJST1IoIlVu
YWJsZSB0byBhbGxvY2F0ZSAldSBieXRlcyBmb3IgaHZtIGNvbnRleHQiLCByZWMtPmxlbmd0aCk7
Cj4gKyAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgfQo+ICsKPiArICAgIGZyZWUoY3R4LT54ODZf
aHZtLnJlc3RvcmUuY29udGV4dCk7Cj4gKwo+ICsgICAgY3R4LT54ODZfaHZtLnJlc3RvcmUuY29u
dGV4dCA9IG1lbWNweShwLCByZWMtPmRhdGEsIHJlYy0+bGVuZ3RoKTsKPiArICAgIGN0eC0+eDg2
X2h2bS5yZXN0b3JlLmNvbnRleHRzeiA9IHJlYy0+bGVuZ3RoOwo+ICsKPiArICAgIHJldHVybiAw
Owo+ICt9Cj4KPiBUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
