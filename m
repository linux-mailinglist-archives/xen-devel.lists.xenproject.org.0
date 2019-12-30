Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D512D06C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 14:44:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilvJI-0006sg-4g; Mon, 30 Dec 2019 13:42:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NUW5=2U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ilvJG-0006sb-HC
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 13:42:14 +0000
X-Inumbo-ID: 2a9ef6ce-2b0a-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a9ef6ce-2b0a-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577713325;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=lCZhsXSulDpmvYjYQSb6rreN5AzS9GevDwStN8bd954=;
 b=KIRZKMd/KIUBGRHtA/E+v2cDQm84HX4UdtZK3+9OarJBoxLFiV8K2u4v
 alIhgoxIfIEuN7Sa0LGPaCwZoxcjWyxXGooap1dOcsNI4pLTm6haGXuYn
 VsZexsOfUbc/fEqORl0he5v57uW4f3QGDG0mQvVw3zDmhbd8guIClbuF9 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Azl7KL9TZD6hbEUAN25d1aEB+vVfRwKmk1hP7/9cq2LxNi5BGESH3aSppl2bx++TZ4suBMGg04
 nJgiC8F4VtLRb9Le2JlM+YFNv+Q72Xdv+itWis00Xn34i2XW43aVcm8Sue7btuv/BpYi3YygaD
 xp64QMuY8ePZXESROS4d0RAOh6VJlwtUzwjjyD9enkUz0IiqtwsDRR2554K9mT3u8EGrKdjT/Y
 gC5MwBkOt+LEPqL7a5VADE4FnFKJHXj1nuUqkooTgGfjIPvh++r+n6RDdedbZpbbKsHZJjKQfs
 c6s=
X-SBRS: 2.7
X-MesageID: 10868960
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,375,1571716800"; d="scan'208";a="10868960"
To: Wei Liu <wl@xen.org>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-5-liuwe@microsoft.com>
 <7b0392eb-34f0-79fe-8999-7bc7008666d2@citrix.com>
 <20191230133328.lbme6htooxmy6mxd@debian>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <e0462baf-22d9-d7e8-b2e4-6a26101203bf@citrix.com>
Date: Mon, 30 Dec 2019 13:42:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191230133328.lbme6htooxmy6mxd@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/8] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMTIvMjAxOSAxMzozMywgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIERlYyAzMCwgMjAx
OSBhdCAxMjo1NToyMlBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyOS8xMi8y
MDE5IDE4OjMzLCBXZWkgTGl1IHdyb3RlOgo+Pj4gQEAgLTcxLDYgKzcyLDQwIEBAIGNvbnN0IHN0
cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0IGh5cGVydl9wcm9iZSh2b2lkKQo+Pj4gICAgICBy
ZXR1cm4gJm9wczsKPj4+ICB9Cj4+PiAgCj4+PiArc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5
cGVyY2FsbF9wYWdlKHZvaWQpCj4+PiArewo+Pj4gKyAgICB1bmlvbiBodl94NjRfbXNyX2h5cGVy
Y2FsbF9jb250ZW50cyBoeXBlcmNhbGxfbXNyOwo+Pj4gKwo+Pj4gKyAgICAvKiBVbmZvcnR1bmF0
ZWx5IHRoZXJlIGlzbid0IGEgcmVhbGx5IGdvb2Qgd2F5IHRvIHVud2luZCBYZW4gdG8KPj4+ICsg
ICAgICogbm90IHVzZSBIeXBlci1WIGhvb2tzLCBzbyBwYW5pYyBpZiBhbnl0aGluZyBnb2VzIHdy
b25nLgo+Pj4gKyAgICAgKgo+Pj4gKyAgICAgKiBJbiBwcmFjdGljZSBpZiBwYWdlIGFsbG9jYXRp
b24gZmFpbHMgdGhpcyBlYXJseSBvbiBpdCBpcwo+Pj4gKyAgICAgKiB1bmxpa2VseSB3ZSBjYW4g
Z2V0IGEgd29ya2luZyBzeXN0ZW0gbGF0ZXIuCj4+PiArICAgICAqLwo+Pj4gKyAgICBodl9oeXBl
cmNhbGxfcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAwKTsKPj4+ICsgICAgaWYgKCAh
aHZfaHlwZXJjYWxsX3BhZ2UgKQo+Pj4gKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBhbGxvY2F0
ZSBIeXBlci1WIGh5cGVyY2FsbCBwYWdlXG4iKTsKPj4+ICsKPj4+ICsgICAgaHZfaHlwZXJjYWxs
ID0gX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKGh2X2h5cGVyY2FsbF9wYWdlKTsKPj4+ICsgICAg
aWYgKCAhaHZfaHlwZXJjYWxsICkKPj4+ICsgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gbWFwIEh5
cGVyLVYgaHlwZXJjYWxsIHBhZ2VcbiIpOwo+PiBJIHJlYWxseSBob3BlIHRoaXMgZG9lc24ndCBh
Y3R1YWxseSBmdW5jdGlvbiBjb3JyZWN0bHkuwqAgVGhpcyBzaG91bGQKPj4gcmVzdWx0IGluIGFu
IE5YIG1hcHBpbmcuCj4+Cj4gQWgsIHN0dXBpZCBtZS4gSSBoYWQgYWN0dWFsbHkgbG9va2VkIGF0
IFhlbidzIGltcGxlbWVudGF0aW9uIGFuZCB0aG91Z2h0Cj4gIndvdWxkbid0IGl0IGJlIG5pY2Ug
dG8gc2F2ZSBvbmUgcGFnZSBpbiB0aGUgaW1hZ2UiLgoKSXRzIDRrLCBhbmQgdGhlcmUgaXMgYSBs
b3QgdG8gYmUgc2FpZCBmb3Igbm90IGhhdmluZyByYW5kb20gdGlueQpjcml0aWNhbCBiaXRzIG9m
IGluZnJhc3RydWN0dXJlIHNwcmVhZCBkeW5hbWljYWxseSBhcm91bmQgR0ZOIHNwYWNlLgoKPiBJ
IGNsZWFybHkgbWlzc2VkIHRoYXQgX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsIG1ha2VzIHRoZSBw
YWdlIE5YLgoKSXQgaXMgaGlkZGVuIGluIHRoZSBkZXB0aHMgb2YgUEFHRV9IWVBFUlZJU09SLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
