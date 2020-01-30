Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5314DAA5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:34:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8zr-0006jm-RA; Thu, 30 Jan 2020 12:32:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix8zq-0006jh-GC
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:32:34 +0000
X-Inumbo-ID: 96d1f2d2-435c-11ea-8a46-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96d1f2d2-435c-11ea-8a46-12813bfff9fa;
 Thu, 30 Jan 2020 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580387553;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NpPT7LNAvtXGOqI5bWKS0thOY00A0klXDto1hWdEp4Y=;
 b=beM9muzqFf57mXnB6Ss9hEYUDWYcSNBuqJ0NiajnuEYue6k3pc02H+C/
 Aul6yp5vo0XxWqtR+gaeL5xgyT3YkmkbqPTFylAHdRUKcV2CO2vbmLDo1
 KB3uoBQywBwmXSQpv2VvrJIRV3YKXWj8wNtc6gzHsYFPOPZPkH1kedBVG E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7m4TaK+bKlCcQ5goBvfWEv0DqYyKWXCK0SS+AF6FZ6lbOeg2HG2uNH3G/D1jzLyHxRvVM2Sq6r
 BcixD/Vx01CAcEgOcS/1EOM7R594F08CYD5eKZRiqcrwsXsS/x/peSHbGDsTCJU3pzSfEBDYv8
 FW1u+wUUDzHSNaI/HruoL9jAvaJB6DGkrsVABf0rNlx65qvLVKNMYsyHOOsz5S+jJ4wZs0wGvp
 acOOhL9dXU8xDecXuWrB5SFB2Y+xQWF0ctka5jknjvuXCC2GcsDUHCcwLgdzDzh/zhmolug5L6
 NyY=
X-SBRS: 2.7
X-MesageID: 12110980
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="12110980"
Date: Thu, 30 Jan 2020 13:32:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130123226.GM4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130122836.ccexm2c2j5i7umas@debian>
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mjg6MzZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMTowODowN1BNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gCj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gIC8qCj4gPiA+ICAgKiBMb2Nh
bCB2YXJpYWJsZXM6Cj4gPiA+ICAgKiBtb2RlOiBDCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiBpbmRleCA5N2Y5
YzA3ODkxLi44ZTAyYjRjNjQ4IDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYveGVuLmxk
cy5TCj4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+ID4gQEAgLTMyOSw2ICsz
MjksMTAgQEAgU0VDVElPTlMKPiA+ID4gICAgZWZpID0gLjsKPiA+ID4gICNlbmRpZgo+ID4gPiAg
Cj4gPiA+ICsjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAo+ID4gPiArICBodl9oY2FsbF9wYWdl
ID0gQUJTT0xVVEUoX19maXhfeF90b192aXJ0KDEpKTsKPiA+IAo+ID4gSSBhc3N1bWUgdGhlcmUn
cyBubyB3YXkgdG8gdXNlIEZJWF9YX0hZUEVSVl9IQ0FMTCBiZWNhdXNlIGl0J3MgYW4KPiA+IGVu
dW0/Cj4gPiAKPiAKPiBZZXMuCj4gCj4gQW5kIHRoZSB0cmljayB0byBnZW5lcmF0ZSBhIHN5bWJv
bCBkaWRuJ3Qgd29yayBlaXRoZXIuCgpBbmQgeW91IG11c3QgZGVmaW5lIHRoYXQgc3ltYm9sIGlu
IHRoZSBsaW5rZXIgc2NyaXB0PyBJdCBkb2Vzbid0IHNlZW0KdG8gYmUgdXNlZCBhdCBsaW5rIHRp
bWUuCgo+ID4gPiArI2VuZGlmCj4gPiA+ICsKPiA+ID4gICAgLyogU2VjdGlvbnMgdG8gYmUgZGlz
Y2FyZGVkICovCj4gPiA+ICAgIC9ESVNDQVJELyA6IHsKPiA+ID4gICAgICAgICAqKC5leGl0LnRl
eHQpCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1hcC5oIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9maXhtYXAuaAo+ID4gPiBpbmRleCA4MDk0NTQ2Yjc1Li5hOWJjYjA2
OGNiIDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1hcC5oCj4gPiA+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgKPiA+ID4gQEAgLTE2LDYgKzE2LDcg
QEAKPiA+ID4gIAo+ID4gPiAgI2RlZmluZSBGSVhBRERSX1RPUCAoVk1BUF9WSVJUX0VORCAtIFBB
R0VfU0laRSkKPiA+ID4gICNkZWZpbmUgRklYQUREUl9YX1RPUCAoWEVOX1ZJUlRfRU5EIC0gUEFH
RV9TSVpFKQo+ID4gPiArI2RlZmluZSBfX2ZpeF94X3RvX3ZpcnQoeCkgKEZJWEFERFJfWF9UT1Ag
LSAoKHgpIDw8IFBBR0VfU0hJRlQpKQo+ID4gPiAgCj4gPiA+ICAjaWZuZGVmIF9fQVNTRU1CTFlf
Xwo+ID4gPiAgCj4gPiA+IEBAIC0xMTAsOCArMTExLDYgQEAgZXh0ZXJuIHZvaWQgX19zZXRfZml4
bWFwX3goCj4gPiA+ICAKPiA+ID4gICNkZWZpbmUgY2xlYXJfZml4bWFwX3goaWR4KSBfX3NldF9m
aXhtYXBfeChpZHgsIDAsIDApCj4gPiA+ICAKPiA+ID4gLSNkZWZpbmUgX19maXhfeF90b192aXJ0
KHgpIChGSVhBRERSX1hfVE9QIC0gKCh4KSA8PCBQQUdFX1NISUZUKSkKPiA+ID4gLQo+ID4gPiAg
I2RlZmluZSBmaXhfeF90b192aXJ0KHgpICAgKCh2b2lkICopX19maXhfeF90b192aXJ0KHgpKQo+
ID4gCj4gPiBUaGlzIHNlZW1zIGxpa2Ugc29tZSB1bnJlbGF0ZWQgY29kZSBtb3ZlbWVudD8KPiA+
IAo+IAo+IEl0IGlzIHJlcXVpcmVkLiBUaGlzIHNlY3Rpb24gaXMgbm90IHN1cHBvc2VkIHRvIGJl
IHVzZWQgaW4gbGlua2VyCj4gc2NyaXB0LiBJIGhhdmUgdG8gbW92ZSB0aGF0IG1hY3JvIGFoZWFk
LgoKT2gsIGJ1dCB5b3UgaW50cm9kdWNlIHRoYXQgbWFjcm8gaW4gcGF0Y2ggIzUsIGNhbiB5b3Ug
cGxhY2UgaXQgYXQgdGhlCnJpZ2h0IHBvc2l0aW9uIHdoZW4gaW50cm9kdWNlZD8KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
