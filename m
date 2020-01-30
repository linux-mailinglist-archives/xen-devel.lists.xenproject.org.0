Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC8314DA72
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:11:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8cM-00049P-RT; Thu, 30 Jan 2020 12:08:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix8cK-00049K-LI
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:08:16 +0000
X-Inumbo-ID: 31ae8c9c-4359-11ea-8396-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31ae8c9c-4359-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580386096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ICrjb9FJf46jz8dXPSDmGPvYXR6SoL65CL1zPduK3mE=;
 b=UZsV6VLkL57zfRD+T72/9cipsj1EkLAo0Vmjsypd82qvO5Ebe5WwXJk9
 Zb4TJwr6kciXYuLDbSfiNwcRPjcm106uJBrjxCm6h5Q17PF3j7s7YJ84R
 IBXosDlr82fj8Fej3+bgFvdejOOoPQkQ04BuaEXrpbCIXv9Uk+XnITj6f 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gf6j2wUMJpKQGeNGvMJHx8pgxx0oWM0cfFqLiMzGrveuUUcOpXVdf6Do2uPljKNtTbD9O2y09B
 hRuTXToQcX8v3OJzSqTD/Q2mLAQF+D4LQ46v12/ymLRQ8D0oGoq5j9ebP7dkEMbULGmxrDYm+Z
 KDb0dy1ehc8iNdpScRq0TNnuY8e4N2xyKXw894l1Nds0blmUYYDMXg6rFUAKJtf9wDieB3g5xC
 IsaSDMgeep8webYe+xumikpEA8+CGT8egiLNq8rk6p7YbOrjT0D1dODpD01YmTgK6kyKuAquJg
 gs8=
X-SBRS: 2.7
X-MesageID: 11672273
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11672273"
Date: Thu, 30 Jan 2020 13:08:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130120807.GJ4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-9-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <liuwe@microsoft.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MzBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGVzZSBmdW5jdGlvbnMgd2lsbCBiZSB1c2VkIGxhdGVyIHRvIG1ha2UgaHlwZXJjYWxscyB0
byBIeXBlci1WLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5j
b20+Cj4gLS0tCj4gdjU6Cj4gMS4gU3dpdGNoIGJhY2sgdG8gZGlyZWN0IGNhbGwKPiAyLiBGaXgg
c29tZSBpc3N1ZXMgcG9pbnRlZCBvdXQgYnkgSmFuCj4gCj4gSSB0cmllZCB1c2luZyB0aGUgYXNt
KCIuZXF1IC4uIikgdHJpY2sgYnV0IGhpdCBhIHByb2JsZW0gd2l0aCAlYyBhZ2Fpbi4KPiAKPiBt
bS5jOjU3MzY6NTogZXJyb3I6IGludmFsaWQgJ2FzbSc6IG9wZXJhbmQgaXMgbm90IGEgY29uZGl0
aW9uIGNvZGUsIGludmFsaWQgb3BlcmFuZCBjb2RlICdjJwo+ICAgICAgICAgICAgICAgIGFzbSAo
ICIuZXF1IEhWX0hDQUxMX1BBR0UsICVjMDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgo+IC0tLQo+
ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICB4ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgIHwgIDYgKysKPiAgeGVuL2FyY2gv
eDg2L3hlbi5sZHMuUyAgICAgICAgICAgICAgICAgICB8ICA0ICsKPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9maXhtYXAuaCAgICAgICAgICAgICB8ICAzICstCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3QvaHlwZXJ2LWhjYWxsLmggfCA5NiArKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBm
aWxlcyBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmgKPiAK
PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDA0ZDkxNDgy
Y2QuLmQwYTVlZDYzNWIgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJ
TkVSUwo+IEBAIC01MTksNiArNTE5LDcgQEAgUzoJU3VwcG9ydGVkCj4gIEY6CXhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvCj4gIEY6CXhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vCj4gIEY6CXhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKPiArRjoJeGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnYtaGNhbGwuaAo+ICBGOgl4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydi10bGZzLmgKPiAgRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaAo+ICAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBpbmRleCAyYmVkY2M0MzhjLi45MzJhNjQ4
ZmY3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiAr
KysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gQEAgLTEyMyw2ICsxMjMs
MTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7Cj4gICAgICAu
c2V0dXAgPSBzZXR1cCwKPiAgfTsKPiAgCj4gK3N0YXRpYyB2b2lkIF9fbWF5YmVfdW51c2VkIGJ1
aWxkX2Fzc2VydGlvbnModm9pZCkKPiArewo+ICsgICAgLyogV2UgdXNlIDEgaW4gbGlua2VyIHNj
cmlwdCAqLwo+ICsgICAgQlVJTERfQlVHX09OKEZJWF9YX0hZUEVSVl9IQ0FMTCAhPSAxKTsKCkkg
d291bGRuJ3QgbWluZCBpZiB0aGlzIHdhcyBwbGFjZWQgdG9nZXRoZXIgd2l0aCB0aGUgaHlwZXJj
YWxsIHBhZ2UKc2V0dXAgaW5zdGVhZCBvZiBjcmVhdGluZyBhIGR1bW15IGZ1bmN0aW9uIGZvciBp
dC4KCj4gK30KPiArCj4gIC8qCj4gICAqIExvY2FsIHZhcmlhYmxlczoKPiAgICogbW9kZTogQwo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5s
ZHMuUwo+IGluZGV4IDk3ZjljMDc4OTEuLjhlMDJiNGM2NDggMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiBAQCAtMzI5
LDYgKzMyOSwxMCBAQCBTRUNUSU9OUwo+ICAgIGVmaSA9IC47Cj4gICNlbmRpZgo+ICAKPiArI2lm
ZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPiArICBodl9oY2FsbF9wYWdlID0gQUJTT0xVVEUoX19m
aXhfeF90b192aXJ0KDEpKTsKCkkgYXNzdW1lIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBGSVhfWF9I
WVBFUlZfSENBTEwgYmVjYXVzZSBpdCdzIGFuCmVudW0/Cgo+ICsjZW5kaWYKPiArCj4gICAgLyog
U2VjdGlvbnMgdG8gYmUgZGlzY2FyZGVkICovCj4gICAgL0RJU0NBUkQvIDogewo+ICAgICAgICAg
KiguZXhpdC50ZXh0KQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1hcC5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9maXhtYXAuaAo+IGluZGV4IDgwOTQ1NDZiNzUuLmE5YmNi
MDY4Y2IgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9maXhtYXAuaAo+ICsrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgKPiBAQCAtMTYsNiArMTYsNyBAQAo+ICAKPiAg
I2RlZmluZSBGSVhBRERSX1RPUCAoVk1BUF9WSVJUX0VORCAtIFBBR0VfU0laRSkKPiAgI2RlZmlu
ZSBGSVhBRERSX1hfVE9QIChYRU5fVklSVF9FTkQgLSBQQUdFX1NJWkUpCj4gKyNkZWZpbmUgX19m
aXhfeF90b192aXJ0KHgpIChGSVhBRERSX1hfVE9QIC0gKCh4KSA8PCBQQUdFX1NISUZUKSkKPiAg
Cj4gICNpZm5kZWYgX19BU1NFTUJMWV9fCj4gIAo+IEBAIC0xMTAsOCArMTExLDYgQEAgZXh0ZXJu
IHZvaWQgX19zZXRfZml4bWFwX3goCj4gIAo+ICAjZGVmaW5lIGNsZWFyX2ZpeG1hcF94KGlkeCkg
X19zZXRfZml4bWFwX3goaWR4LCAwLCAwKQo+ICAKPiAtI2RlZmluZSBfX2ZpeF94X3RvX3ZpcnQo
eCkgKEZJWEFERFJfWF9UT1AgLSAoKHgpIDw8IFBBR0VfU0hJRlQpKQo+IC0KPiAgI2RlZmluZSBm
aXhfeF90b192aXJ0KHgpICAgKCh2b2lkICopX19maXhfeF90b192aXJ0KHgpKQoKVGhpcyBzZWVt
cyBsaWtlIHNvbWUgdW5yZWxhdGVkIGNvZGUgbW92ZW1lbnQ/CgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
