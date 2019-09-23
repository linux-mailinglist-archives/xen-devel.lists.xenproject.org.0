Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CCCBB59E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:42:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOYr-0001dZ-4z; Mon, 23 Sep 2019 13:39:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCOYp-0001dR-Cz
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:39:27 +0000
X-Inumbo-ID: 8f2c4fc4-de07-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f2c4fc4-de07-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569245967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JSsf5Hw/cAWTQWAwVl+3jDWmLPCMiji9cREyoYspzXM=;
 b=PuT31nK6ZYq9PHESRLBvwfzWoX5o7Ms/VxcVxjNtwkVLM1U0h+p3neGz
 S/A3RXYqdnpzBdDknpsGhfsnl+DhwOjFoAB7GfVpnm8Kq3fvs436fenJ0
 ABdWPHejNuM68iaGa2UzHKaOhid0TgHQBvbKeTpYhBPtFZ/7VRDT5bhhu U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XUKHA3lE8oTWpJEHHKrGcltOrt3bhosVxIHoeZNfZflErJzrn1VQsfzYJl4r6cdeeHoyZqrjIo
 FuWU81FmfoB3eorFSJXBXvbb+MB5EiQ7Tx8sbRWvlIumC46pAjM6cp3898FZ2/T9ji1LCe8Cq/
 rRgpFWAp+r/2jBykxzdBETkEc0iTVJSeYdu+l2dCIcNbdA+aLiQ53lUcqDDhG527v/SPtf/roU
 pUuFyR81R5HNFU7t4Z1M07+WGy7RT04aqHaw94omhwXy9GCnT98CI7N8nrGjBNZym9P1IqZCIM
 69M=
X-SBRS: 2.7
X-MesageID: 5928200
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="5928200"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Christian Lindig
 <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Thread-Topic: [PATCH REPOST v13 3/4] tools/ocaml: abi check: Cope with
 consecutive relevant enums
Thread-Index: AQHVbg54K7mlr99950iBLZatbO3sMKc5TEIA
Date: Mon, 23 Sep 2019 13:39:22 +0000
Message-ID: <62d6130b1a4c41f28ddf95bb73f3af1a@AMSPEX02CL03.citrite.net>
References: <20190918104718.3695-1-paul.durrant@citrix.com>
In-Reply-To: <20190918104718.3695-1-paul.durrant@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH REPOST v13 3/4] tools/ocaml: abi check: Cope
 with consecutive relevant enums
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8gSSB0aGluayB0aGlzIGlzIHRoZSBvbmx5IHJlbWFpbmluZyBwYXRjaCBpbiB0aGlzIHNl
cmllcyB0aGF0IHN0aWxsIG5lZWRzIGFuIGFjay4KCiAgUGF1bAoKPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQo+IEZyb206IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
Cj4gU2VudDogMTggU2VwdGVtYmVyIDIwMTkgMTE6NDcKPiBUbzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4gQ2M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsg
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IENocmlzdGlhbiBMaW5kaWcK
PiA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2ls
Lm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0ggUkVQT1NUIHYxMyAzLzRdIHRvb2xzL29jYW1sOiBhYmkg
Y2hlY2s6IENvcGUgd2l0aCBjb25zZWN1dGl2ZSByZWxldmFudCBlbnVtcwo+IAo+IEZyb206IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IAo+IElmIHRoZSBlbmQgb2Yg
b25lIGVudW0gaXMgdGhlIGB0eXBlJyBsaW5lIGZvciB0aGUgbmV4dCBlbnVtLCB3ZSB3b3VsZAo+
IG5vdCBub3RpY2UgaXQuCj4gCj4gRml4IHRoaXMgYnkgcmVvcmRlcmluZyB0aGUgY29kZSwgYW5k
IGdldHRpbmcgcmlkIG9mIHRoZSBlbHNlOiBub3cgaWYKPiB0aGUgIndlIGFyZSB3aXRoaW4gYW4g
ZW51bSIgYnJhbmNoIGRlY2lkZXMgdGhhdCBpdCdzIHRoZSBlbmQgb2YgdGhlCj4gZW51bSwgaXQg
dW5zZXRzICRlaSBhbmQgd2UgdGhlbiBpbW1lZGlhdGVseSBwcm9jZXNzIHRoZSBsaW5lIGFzIGEg
Im5vdAo+IHdpdGhpbiBhbiBlbnVtIiBsaW5lIC0gaWUgYXMgdGhlIHN0YXJ0IG9mIHRoZSBuZXh0
IG9uZS4KPiAKPiBSZXBvcnRlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXgu
Y29tPgo+IENjOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+
Cj4gQ2M6IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+Cj4gCj4gdjEzOgo+ICAtIE5ldyBp
biB0aGlzIHZlcnNpb24KPiAtLS0KPiAgdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sgfCAx
NyArKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL2FiaS1j
aGVjayBiL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCj4gaW5kZXggZDUzMmYzNzI3MS4u
M2NiZGVjNTgyZiAxMDA3NTUKPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjawo+
ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCj4gQEAgLTcwLDE0ICs3MCw3IEBA
IG15ICRjdmFsOwo+ICAkZWkgPSB1bmRlZjsKPiAgbXkgJGJpdG51bSA9IDA7Cj4gIHdoaWxlICg8
T0NBTUxfRklMRT4pIHsKPiAtICAgIGlmICghJGVpKSB7Cj4gLSAgICAgICAgaWYgKG17XnR5cGUg
XHMrIChcdyspIFxzKiBcPSBccyogJH14ICYmICRlbnVtc3skMX0pIHsKPiAtICAgICAgICAgICAg
cHJpbnQgIi8vIGZvdW5kIG9jYW1sIHR5cGUgJDEgYXQgJG86JC5cbiIgb3IgZGllICQhOwo+IC0g
ICAgICAgICAgICAkZWkgPSAkZW51bXN7JDF9Owo+IC0gICAgICAgICAgICAkY3ZhbCA9ICcnOwo+
IC0gICAgICAgICAgICAkYml0bnVtID0gMDsKPiAtICAgICAgICB9Cj4gLSAgICB9IGVsc2Ugewo+
ICsgICAgaWYgKCRlaSkgewo+ICAgICAgICAgIGlmIChte15ccysgXHwgXHMqICRlaS0+e09QcmVm
aXh9IChcdyspIFxzKiR9eCkgewo+ICAgICAgICAgICAgICAkY3ZhbCA9ICQxOwo+ICAgICAgICAg
ICAgICBpZiAoJGVpLT57TWFuZ2xlfSBlcSAnbGMnKSB7Cj4gQEAgLTEwNCw2ICs5NywxNCBAQCB3
aGlsZSAoPE9DQU1MX0ZJTEU+KSB7Cj4gICAgICAgICAgICAgIGRpZSAiJF8gPyI7Cj4gICAgICAg
ICAgfQo+ICAgICAgfQo+ICsgICAgaWYgKCEkZWkpIHsKPiArICAgICAgICBpZiAobXtedHlwZSBc
cysgKFx3KykgXHMqIFw9IFxzKiAkfXggJiYgJGVudW1zeyQxfSkgewo+ICsgICAgICAgICAgICBw
cmludCAiLy8gZm91bmQgb2NhbWwgdHlwZSAkMSBhdCAkbzokLlxuIiBvciBkaWUgJCE7Cj4gKyAg
ICAgICAgICAgICRlaSA9ICRlbnVtc3skMX07Cj4gKyAgICAgICAgICAgICRjdmFsID0gJyc7Cj4g
KyAgICAgICAgICAgICRiaXRudW0gPSAwOwo+ICsgICAgICAgIH0KPiArICAgIH0KPiAgfQo+IAo+
ICBmb3JlYWNoICRlaSAodmFsdWVzICVlbnVtcykgewo+IC0tCj4gMi4yMC4xLjIuZ2IyMWViYjY3
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
