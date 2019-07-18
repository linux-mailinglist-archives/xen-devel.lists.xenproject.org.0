Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01C46CE1A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 14:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho5XL-0003kj-53; Thu, 18 Jul 2019 12:29:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho5XJ-0003ke-VB
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 12:29:26 +0000
X-Inumbo-ID: ad0ee149-a957-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ad0ee149-a957-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 12:29:24 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +IwI45quGcBzVOXvY68vPDgITMPuCO5rd+CAloh3BWF6fgFO/2VHtPxi4HtCjQYCuD6RokWTCQ
 YcxCBeMhg3m+yVycUnf4q/0CuM+Ip92eoCte2h31e27veN/QFXrUDexIJk0ZAN90or79pC2XT8
 Y1bcIViJTUZeYfDqtlp3XC3bB41PZWz1oOT4odcPp71K7VgQdNHBZbqqqNx2zNpeeyNEc/qqRX
 L56FAfSPng/GS6u35BQ7+5PxyKu2uHsij2acAnBx3OpU7RuK/wVhFD5YsRp379fPe6x19NrOxf
 vH8=
X-SBRS: 2.7
X-MesageID: 3120836
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3120836"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
 <d982278f-daf9-67e5-f9b2-775105ef3233@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d755fb66-5c75-a927-805f-66b3acf2ee4d@citrix.com>
Date: Thu, 18 Jul 2019 13:29:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d982278f-daf9-67e5-f9b2-775105ef3233@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/mtrr: Skip cache flushes on CPUs
 with cache self-snooping
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDcvMjAxOSAxMzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRnJvbTogUmljYXJkbyBO
ZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVyb25AbGludXguaW50ZWwuY29tPgo+Cj4gUHJvZ3JhbW1p
bmcgTVRSUiByZWdpc3RlcnMgaW4gbXVsdGktcHJvY2Vzc29yIHN5c3RlbXMgaXMgYSByYXRoZXIg
bGVuZ3RoeQo+IHByb2Nlc3MuIEZ1cnRoZXJtb3JlLCBhbGwgcHJvY2Vzc29ycyBtdXN0IHByb2dy
YW0gdGhlc2UgcmVnaXN0ZXJzIGluIGxvY2sKPiBzdGVwIGFuZCB3aXRoIGludGVycnVwdHMgZGlz
YWJsZWQ7IHRoZSBwcm9jZXNzIGFsc28gaW52b2x2ZXMgZmx1c2hpbmcKPiBjYWNoZXMgYW5kIFRM
QnMgdHdpY2UuIEFzIGEgcmVzdWx0LCB0aGUgcHJvY2VzcyBtYXkgdGFrZSBhIGNvbnNpZGVyYWJs
ZQo+IGFtb3VudCBvZiB0aW1lLgo+Cj4gT24gc29tZSBwbGF0Zm9ybXMsIHRoaXMgY2FuIGxlYWQg
dG8gYSBsYXJnZSBza2V3IG9mIHRoZSByZWZpbmVkLWppZmZpZXMKPiBjbG9jayBzb3VyY2UuIEVh
cmx5IHdoZW4gYm9vdGluZywgaWYgbm8gb3RoZXIgY2xvY2sgaXMgYXZhaWxhYmxlIChlLmcuLAo+
IGJvb3Rpbmcgd2l0aCBocGV0PWRpc2FibGVkKSwgdGhlIHJlZmluZWQtamlmZmllcyBjbG9jayBz
b3VyY2UgaXMgdXNlZCB0bwo+IG1vbml0b3IgdGhlIFRTQyBjbG9jayBzb3VyY2UuIElmIHRoZSBz
a2V3IG9mIHJlZmluZWQtamlmZmllcyBpcyB0b28gbGFyZ2UsCj4gTGludXggd3JvbmdseSBhc3N1
bWVzIHRoYXQgdGhlIFRTQyBpcyB1bnN0YWJsZToKPgo+ICAgIGNsb2Nrc291cmNlOiB0aW1la2Vl
cGluZyB3YXRjaGRvZyBvbiBDUFUxOiBNYXJraW5nIGNsb2Nrc291cmNlCj4gICAgICAgICAgICAg
ICAgICd0c2MtZWFybHknIGFzIHVuc3RhYmxlIGJlY2F1c2UgdGhlIHNrZXcgaXMgdG9vIGxhcmdl
Ogo+ICAgIGNsb2Nrc291cmNlOiAncmVmaW5lZC1qaWZmaWVzJyB3ZF9ub3c6IGZmZmVkYzEwIHdk
X2xhc3Q6Cj4gICAgICAgICAgICAgICAgIGZmZmVkYjkwIG1hc2s6IGZmZmZmZmZmCj4gICAgY2xv
Y2tzb3VyY2U6ICd0c2MtZWFybHknIGNzX25vdzogNWVjY2ZkZGViYyBjc19sYXN0OiA1ZTdlMzMw
M2Q0Cj4gICAgICAgICAgICAgICAgIG1hc2s6IGZmZmZmZmZmZmZmZmZmZmYKPiAgICB0c2M6IE1h
cmtpbmcgVFNDIHVuc3RhYmxlIGR1ZSB0byBjbG9ja3NvdXJjZSB3YXRjaGRvZwo+Cj4gQXMgcGVy
IG1lYXN1cmVtZW50cywgYXJvdW5kIDk4JSBvZiB0aGUgdGltZSBuZWVkZWQgYnkgdGhlIHByb2Nl
ZHVyZSB0bwo+IHByb2dyYW0gTVRSUnMgaW4gbXVsdGktcHJvY2Vzc29yIHN5c3RlbXMgaXMgc3Bl
bnQgZmx1c2hpbmcgY2FjaGVzIHdpdGgKPiB3YmludmQoKS4gQXMgcGVyIHRoZSBTZWN0aW9uIDEx
LjExLjggb2YgdGhlIEludGVsIDY0IGFuZCBJQSAzMgo+IEFyY2hpdGVjdHVyZXMgU29mdHdhcmUg
RGV2ZWxvcGVyJ3MgTWFudWFsLCBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGZsdXNoCj4gY2FjaGVz
IGlmIHRoZSBDUFUgc3VwcG9ydHMgY2FjaGUgc2VsZi1zbm9vcGluZy4gVGh1cywgc2tpcHBpbmcg
dGhlIGNhY2hlCj4gZmx1c2hlcyBjYW4gcmVkdWNlIGJ5IHNldmVyYWwgdGVucyBvZiBtaWxsaXNl
Y29uZHMgdGhlIHRpbWUgbmVlZGVkIHRvCj4gY29tcGxldGUgdGhlIHByb2dyYW1taW5nIG9mIHRo
ZSBNVFJSIHJlZ2lzdGVyczoKPgo+IFBsYXRmb3JtICAgICAgICAgICAgICAgICAgICAgIAlCZWZv
cmUJICAgQWZ0ZXIKPiAxMDQtY29yZSAoMjA4IFRocmVhZHMpIFNreWxha2UgIDE0MzdtcyAgICAg
IDI4bXMKPiAgICAyLWNvcmUgKCAgNCBUaHJlYWRzKSBIYXN3ZWxsICAgMTE0bXMgICAgICAgMm1z
Cj4KPiBSZXBvcnRlZC1ieTogTW9oYW1tYWQgRXRlbWFkaSA8bW9oYW1tYWQuZXRlbWFkaUBpbnRl
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmljYXJkbyBOZXJpIDxyaWNhcmRvLm5lcmktY2FsZGVy
b25AbGludXguaW50ZWwuY29tPgo+IFtMaW51eCBjb21taXQgZmQzMjlmMjc2ZWNhYWQ3YTM3MWQ2
ZjkxYjliYmVhMDMxZDBjMzQ0MF0KPgo+IFVzZSBhbHRlcm5hdGl2ZXMgcGF0Y2hpbmcgaW5zdGVh
ZCBvZiBzdGF0aWNfY3B1X2hhcygpICh3aGljaCB3ZSBkb24ndAo+IGhhdmUgW3lldF0pLgo+IElu
dGVyZXN0aW5nbHkgd2UndmUgYmVlbiBsYWNraW5nIHRoZSAybmQgd2JpbnZkKCksIHdoaWNoIEkn
bSB0YWtpbmcgdGhlCj4gbGliZXJ0eSBoZXJlLgo+Cj4gUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
