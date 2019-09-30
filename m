Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65009C2412
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExN9-0008Cu-HC; Mon, 30 Sep 2019 15:13:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YlZe=XZ=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iExN8-0008Co-Hy
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:13:58 +0000
X-Inumbo-ID: ec75f4f4-e394-11e9-b588-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id ec75f4f4-e394-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569856438;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ybh/ayb+cKeDb5YToZAipsgBrpqsr4jWk51323SsjzE=;
 b=B97yfLSz9VZ15pgRf9lNjnhGTFt30zk2c58MCIBsPbP3Ggxsto3A9Gej
 wbho/R++GT84BK4Rv2l1cqjc8Kp/o3VpNbCj4dDYjP1ao5f1Rekb9Ei4b
 Se+qaoqAsAgG5ZPz7MkvdoVXwQ58Fap4CS9A0KohvdkrkS0ECoh7OcEl6 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fJjl4fczj6Z31FfGwQbkyA3InhlQ9r2KmGnrarESyOzyPdPrGKGOOJAToSnLPV0rarZtAdAQW4
 oiZKLHbugWZGA7ENeBkRlJPpaaK0seCieqVAz08mwrS1IeeIxQZwCvgvqb5MxAYpY8M5rcSY6X
 eA7Rtowi+8r0X/i4JTldep0LePWes8cqPSoTHDMKm56gOlAXcSeueVV3jkWBTP25wZWzzF6WZN
 uWDcg3usgFcxI0Vd4Pk4tNmhPCZMgW/gOSGhemqUBuBvmntT1js24dWvA2i7xROR3B+aBMUkJv
 2dY=
X-SBRS: 2.7
X-MesageID: 6258775
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6258775"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-13-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <257215dc-4219-cae7-5d3d-af806664a5e3@citrix.com>
Date: Mon, 30 Sep 2019 16:13:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190928151305.127380-13-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 12/12] livepatch: Add python bindings for
 livepatch operations
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
Cc: wipawel@amazon.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 mpohlack@amazon.com, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yOC8xOSA0OjEzIFBNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBFeHRlbmQg
dGhlIFhDIHB5dGhvbiBiaW5kaW5ncyBsaWJyYXJ5IHRvIHN1cHBvcnQgYWxzbyBhbGwgY29tbW9u
Cj4gbGl2ZXBhdGNoIG9wZXJhdGlvbnMgYW5kIGFjdGlvbnMuCj4gCj4gQWRkIHRoZSBweXRob24g
YmluZGluZ3MgZm9yIHRoZSBmb2xsb3dpbmcgb3BlcmF0aW9uczoKPiAtIHN0YXR1cyAocHl4Y19s
aXZlcGF0Y2hfc3RhdHVzKToKPiAgICBSZXF1aXJlcyBhIHBheWxvYWQgbmFtZSBhcyBhbiBpbnB1
dC4KPiAgICBSZXR1cm5zIGEgc3RhdHVzIGRpY3QgY29udGFpbmluZyBhIHN0YXRlIHN0cmluZyBh
bmQgYSByZXR1cm4gY29kZQo+ICAgIGludGVnZXIuCj4gLSBhY3Rpb24gKHB5eGNfbGl2ZXBhdGNo
X2FjdGlvbik6Cj4gICAgUmVxdWlyZXMgYSBwYXlsb2FkIG5hbWUgYW5kIGFuIGFjdGlvbiBpZCBh
cyBhbiBpbnB1dC4gVGltZW91dCBhbmQKPiAgICBmbGFncyBhcmUgb3B0aW9uYWwgcGFyYW1ldGVy
cy4KPiAgICBSZXR1cm5zIE5vbmUgb3IgdGhyb3dzIGFuIGV4Y2VwdGlvbi4KPiAtIHVwbG9hZCAo
cHl4Y19saXZlcGF0Y2hfdXBsb2FkKToKPiAgICBSZXF1aXJlcyBhIHBheWxvYWQgbmFtZSBhbmQg
YSBtb2R1bGUncyBmaWxlbmFtZSBhcyBhbiBpbnB1dC4KPiAgICBSZXR1cm5zIE5vbmUgb3IgdGhy
b3dzIGFuIGV4Y2VwdGlvbi4KPiAtIGxpc3QgKHB5eGNfbGl2ZXBhdGNoX2xpc3QpOgo+ICAgIFRh
a2VzIG5vIHBhcmFtZXRlcnMuCj4gICAgUmV0dXJucyBhIGxpc3Qgb2YgZGljdHMgY29udGFpbmlu
ZyBlYWNoIHBheWxvYWQnczoKPiAgICAqIG5hbWUgYXMgYSBzdHJpbmcKPiAgICAqIHN0YXRlIGFz
IGEgc3RyaW5nCj4gICAgKiByZXR1cm4gY29kZSBhcyBhbiBpbnRlZ2VyCj4gICAgKiBsaXN0IG9m
IG1ldGFkYXRhIGtleT12YWx1ZSBzdHJpbmdzCj4gCj4gRWFjaCBmdW5jdGlvbnMgdGhyb3dzIGFu
IGV4Y2VwdGlvbiBlcnJvciBiYXNlZCBvbiB0aGUgZXJybm8gdmFsdWUKPiByZWNlaXZlZCBmcm9t
IGl0cyBjb3JyZXNwb25kaW5nIGxpYnhjIGZ1bmN0aW9uIGNhbGwuCj4gCnNuaXA+ICtzdGF0aWMg
UHlPYmplY3QgKnB5eGNfbGl2ZXBhdGNoX3VwbG9hZChYY09iamVjdCAqc2VsZiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUHlPYmplY3QgKmFyZ3MsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFB5T2JqZWN0ICprd2RzKQo+ICt7Cj4g
KyAgICB1bnNpZ25lZCBjaGFyICpmYnVmID0gTUFQX0ZBSUxFRDsKPiArICAgIGNoYXIgKm5hbWUs
ICpmaWxlbmFtZTsKPiArICAgIHN0cnVjdCBzdGF0IGJ1ZjsKPiArICAgIGludCBmZCA9IDAsIHJj
ID0gLTEsIHNhdmVkX2Vycm5vOwo+ICsgICAgc3NpemVfdCBsZW47Cj4gKwo+ICsgICAgc3RhdGlj
IGNoYXIgKmt3ZF9saXN0W10gPSB7ICJuYW1lIiwgImZpbGVuYW1lIiwgTlVMTCB9Owo+ICsKPiAr
ICAgIGlmICggIVB5QXJnX1BhcnNlVHVwbGVBbmRLZXl3b3JkcyhhcmdzLCBrd2RzLCAic3MiLCBr
d2RfbGlzdCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbmFtZSwg
JmZpbGVuYW1lKSkKPiArICAgICAgICBnb3RvIGVycm9yOwo+ICsKPiArICAgIGZkID0gb3Blbihm
aWxlbmFtZSwgT19SRE9OTFkpOwo+ICsgICAgaWYgKCBmZCA8IDAgKQo+ICsgICAgICAgIGdvdG8g
ZXJyb3I7Cj4gKwo+ICsgICAgaWYgKCBmc3RhdChmZCwgJmJ1ZikgIT0gMCApCj4gKyAgICAgICAg
Z290byBlcnJvcjsKPiArCj4gKyAgICBsZW4gPSBidWYuc3Rfc2l6ZTsKPiArICAgIGZidWYgPSBt
bWFwKDAsIGxlbiwgUFJPVF9SRUFELCBNQVBfUFJJVkFURSwgZmQsIDApOwo+ICsgICAgaWYgKCBm
YnVmID09IE1BUF9GQUlMRUQgKQo+ICsgICAgICAgIGdvdG8gZXJyb3I7Cj4gKwo+ICsgICAgcmMg
PSB4Y19saXZlcGF0Y2hfdXBsb2FkKHNlbGYtPnhjX2hhbmRsZSwgbmFtZSwgZmJ1ZiwgbGVuKTsK
PiArCj4gKyAgICBzYXZlZF9lcnJubyA9IGVycm5vOwo+ICsgICAgbXVubWFwKGZidWYsIGxlbik7
Cj4gKyAgICBjbG9zZShmZCk7Cj4gKyAgICBlcnJubyA9IHNhdmVkX2Vycm5vOwo+ICsKPiArZXJy
b3I6Cj4gKyAgICByZXR1cm4gcmMgPyBweXhjX2Vycm9yX3RvX2V4Y2VwdGlvbihzZWxmLT54Y19o
YW5kbGUpIDogUHlfTm9uZTsKPiArfQo+ICsKVGhlIGZzdGF0KCkgYW5kIG1tYXAoKSBlcnJvciBw
YXRocyBsZWFrIGZkIG9uIGVycm9yLgoKUmVnYXJkcywKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
