Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E82189B82
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 13:02:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEXMA-0001lT-2U; Wed, 18 Mar 2020 11:59:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lnqk=5D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jEXM8-0001lO-Kg
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 11:59:28 +0000
X-Inumbo-ID: eaaae20a-690f-11ea-a6c1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaaae20a-690f-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584532767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WfH8eE7UM0yDM9CpMRhpBT3fcjxrJSYRNTrje+OIB8Q=;
 b=eW9llVgZXOIFHX5ouFHh8lfhKCE7JlnPNgrXNOZqw8ynWH+sRzofPF1Q
 KArB60SMdOHIG8c2kQhAAPbug39yV1WY2u1OvOTFd4w354dbahfuaFhpK
 89mZb34dhd747FfVF3Szx7NKF709tszIZeV1N3KrAQ1Fdrvxxq3N9ZccV g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QxCjZUDu0GWBVpzNsQtqxGGnLAsg54/gt1nzS/DI9PhistVUC8kLkTCNGCUcinfDnnudw8jIP8
 xG3VvC7cvhdCTvv4dHZ/WKfOon/YbdN6dyRStThEA71Ng96qHxEJkGzu5DHZGgAJyb2fQCt4lB
 JI7+UdwIsMXD2M/52FDa4fbEqgzki9JCj1NIjs3Z35leIJpEPGJ7nlSnC5munq/wG5zFLyzUSn
 cUdXAyots8W8ToOuXGakMqNJuuQIXTap4+r9G0w9jqJuw1baMfxEf4hZllfLfvLPQz+o8e88mT
 kp4=
X-SBRS: 2.7
X-MesageID: 14388175
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,567,1574139600"; d="scan'208";a="14388175"
Date: Wed, 18 Mar 2020 11:59:21 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200318115921.GG4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-21-anthony.perard@citrix.com>
 <6bbd8242-d79d-6e94-76f1-5fc6944a9978@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bbd8242-d79d-6e94-76f1-5fc6944a9978@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 20/23] xen/build: factorise
 generation of the linker scripts
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMTI6MDU6MDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vUnVsZXMubWsKPiA+ICsrKyBiL3hlbi9SdWxlcy5tawo+ID4gQEAgLTIzMCw2ICsyMzAs
MTQgQEAgY21kX3NfUyA9ICQoQ1BQKSAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoYV9mbGFn
cykpICQ8IC1vICRACj4gPiAgJS5zOiAlLlMgRk9SQ0UKPiA+ICAJJChjYWxsIGlmX2NoYW5nZWQs
Y3BwX3NfUykKPiA+ICAKPiA+ICsjIExpbmtlciBzY3JpcHRzLCAubGRzLlMgLT4gLmxkcwo+ID4g
K3F1aWV0X2NtZF9jY19sZHNfUyA9IExEUyAgICAgJEAKPiA+ICtkZWZpbmUgY21kX2NjX2xkc19T
Cj4gPiArICAgICQoQ0MpIC1QIC1FIC1VaTM4NiAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQo
YV9mbGFncykpIC1vICRAICQ8OyBcCj4gCj4gJChDUFApPyBBbmQgdGhlbiBhbHNvIG5hbWUgdGhl
IHRoaW5nIGNtZF9jcHBfbGRzX1M/CgpXaWxsIGRvLgoKPiA+ICsgICAgc2VkIC1lICdzLy4qXC5s
ZHNcLm86LyQoQEYpOi9nJyA8JChkb3QtdGFyZ2V0KS5kID4kKGRvdC10YXJnZXQpLmQubmV3OyBc
Cj4gPiArICAgIG12IC1mICQoZG90LXRhcmdldCkuZC5uZXcgJChkb3QtdGFyZ2V0KS5kCj4gCj4g
VGhpcyB3b3VsZCBiZW5lZml0IGZyb20gYWxzbyBzd2l0Y2hpbmcgdG8gbW92ZS1pZi1jaGFuZ2Vk
IGF0Cj4gdGhpcyBvY2Nhc2lvbi4KCkkgZG9uJ3QgdGhpbmsgdXNpbmcgbW92ZS1pZi1jaGFuZ2Vk
IGhlcmUgaXMgYSBnb29kIGlkZWEuIFRoZSAqLmxkcyBmaWxlCnNob3VsZCBiZSBnZW5lcmF0ZWQg
aWYgaXQncyBkZXBlbmRlbmN5ICoubGRzLlMgY2hhbmdlZC4KCm1vdmUtaWYtY2hhbmdlZCBtaWdo
dCBwcmV2ZW50IHNvbWUgcmVidWlsZCwgYnV0IHRoZSAqLmxkcyBmaWxlIHdpbGwgYmUKcmVidWls
ZCBvdmVyIGFuZCBvdmVyIGFnYWluLiBJIHRoaW5rIG1vdmUtaWYtY2hhbmdlZCBpcyBvbmx5IHVz
ZWZ1bCBpZiBhCmZpbGUgbmVlZHMgdG8gYmUgZ2VuZXJhdGVkIGF0IGV2ZXJ5IG1ha2UgaW52b2Nh
dGlvbi4KCj4gV2l0aCB5b3UgdXNpbmcgImRlZmluZSIgLSBpcyB0aGVyZSByZWFsbHkgYSBuZWVk
IGZvciBhZGRpbmcgdGhlCj4gdHJhaWxpbmcgIjsgXCIgc2VxdWVuY2UgdG8gdGhlIGZpcnN0IHR3
byBsaW5lcyBvZiB0aGUgbWFjcm8/CgpJIHRoaW5rIGl0IGlzLCBidXQgSSdsbCBjaGVjayBhZ2Fp
biBpZiBpdCdzIG5lY2Vzc2FyeS4gTWF5YmUganVzdCAnOycgaXMKZW5vdWdoLgoKPiA+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ID4gKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4g
PiBAQCAtNzUsNiArNzUsNyBAQCBvYmoteSArPSBocGV0Lm8KPiA+ICBvYmoteSArPSB2bV9ldmVu
dC5vCj4gPiAgb2JqLXkgKz0geHN0YXRlLm8KPiA+ICBleHRyYS15ICs9IGFzbS1tYWNyb3MuaQo+
ID4gK2V4dHJhLXkgKz0geGVuLmxkcwo+ID4gIAo+ID4gIHg4Nl9lbXVsYXRlLm86IHg4Nl9lbXVs
YXRlL3g4Nl9lbXVsYXRlLmMgeDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuaAo+ID4gIAo+ID4gQEAg
LTE5Nyw2ICsxOTgsNyBAQCBlbmRpZgo+ID4gIG5vdGVfZmlsZV9vcHRpb24gPz0gJChub3RlX2Zp
bGUpCj4gPiAgCj4gPiAgaWZlcSAoJChYRU5fQlVJTERfUEUpLHkpCj4gPiArZXh0cmEteSArPSBl
ZmkubGRzCj4gCj4gV291bGQgYmUgbmljZSBpZiB0aGlzIHdhcyBtb3ZlZCB1cCB1c2luZwo+IAo+
IGV4dHJhLSQoWEVOX0JVSUxEX1BFKSArPSBlZmkubGRzCgpJIGNhbiB0cnksIGJ1dCBYRU5fQlVJ
TERfUEUgaXMgZGVmaW5lZCBpbiB0aGUgbWlkZGxlIG9mIHRoZSBNYWtlZmlsZSwgc28KSSB3b3Vs
ZG4ndCBiZSBhYmxlIHRvIG1vdmUgdGhhdCB3aXRoIHRoZSBvdGhlciBvYmoteSBhbmQgZXh0cmEt
eQpkZWZpbml0aW9ucy4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
