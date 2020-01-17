Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB8140EBD
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:13:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUDZ-0005ZK-Kv; Fri, 17 Jan 2020 16:11:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b9RF=3G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1isUDX-0005ZF-Us
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 16:11:27 +0000
X-Inumbo-ID: fe6eb09c-3943-11ea-9fd7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe6eb09c-3943-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579277479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QNA5D3HtJGTGbqPFyzZ6SQuW+zCttrH+jP2pq+dwsCA=;
 b=Dw2bvRQnOTkFber8Zm7yMzdQIM+R6WQhDJmpvgTrCLpgm0RJAcaWvi0X
 kVdy7fDkXe1ijm+OUnWFsbH3jn2Iym7b8jFlOgKcfTCJW6JIzYcvyZj8v
 qckE79uM0aBQuB6A6jzZ93UP2Qx+hsdvRvdAVXjRflbEiRdjNjwhbILwC 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Vhry5IZJoscDrXNgVsa1J509ySr8adEdmrfJ7VucSXs5AiWBI05ogMXLtjbzZU8qC+dIlL1Taj
 O6ntNJp6LvjXaSZJ2P0zRL1rWcQ8JUpsQ+okkv0+Su8FYbRHdg8+C/3OY/VJ74Bbkr94rsxBBR
 WQ7EyHqavccgJLY0S5gntFTC4vujp3ixPl3AGed7SjiCnrOmJuqloQyy6XNuesxskkHXOnmgNI
 aBjtivfUOS9RCRptGosPKtkSMXMhlqMM7IUH97N4b5NJt/B3Ak64ZYswJ2lv1g7hvguIt9X7yB
 caI=
X-SBRS: 2.7
X-MesageID: 11094926
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11094926"
Date: Fri, 17 Jan 2020 17:11:10 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200117161110.GU11756@Air-de-Roger>
References: <20200117150948.45014-1-roger.pau@citrix.com>
 <50fb04ef-8dcb-3613-b909-f0c590d323e9@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50fb04ef-8dcb-3613-b909-f0c590d323e9@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMDM6MzA6NDRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wMS8yMDIwIDE1OjA5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBU
aGUgSW50ZWwgU0RNIHN0YXRlczoKPiA+Cj4gPiAiV2hlbiBhbiBpbGxlZ2FsIHZlY3RvciB2YWx1
ZSAoMCB0byAxNSkgaXMgd3JpdHRlbiB0byBhIExWVCBlbnRyeSBhbmQKPiA+IHRoZSBkZWxpdmVy
eSBtb2RlIGlzIEZpeGVkIChiaXRzIDgtMTEgZXF1YWwgMCksIHRoZSBBUElDIG1heSBzaWduYWwg
YW4KPiA+IGlsbGVnYWwgdmVjdG9yIGVycm9yLCB3aXRob3V0IHJlZ2FyZCB0byB3aGV0aGVyIHRo
ZSBtYXNrIGJpdCBpcyBzZXQgb3IKPiA+IHdoZXRoZXIgYW4gaW50ZXJydXB0IGlzIGFjdHVhbGx5
IHNlZW4gb24gdGhlIGlucHV0LiIKPiA+Cj4gPiBBbmQgdGhhdCdzIGV4YWN0bHkgd2hhdCdzIGN1
cnJlbnRseSBkb25lIGluIGRpc2Nvbm5lY3RfYnNwX0FQSUMgd2hlbgo+ID4gdmlydF93aXJlX3Nl
dHVwIGlzIHRydWUgYW5kIExWVCBMSU5UMCBpcyBiZWluZyBtYXNrZWQuIEJ5IHdyaXRpbmcgb25s
eQo+ID4gQVBJQ19MVlRfTUFTS0VEIFhlbiBpcyBhY3R1YWxseSBzZXR0aW5nIHRoZSB2ZWN0b3Ig
dG8gMCBhbmQgdGhlCj4gPiBkZWxpdmVyeSBtb2RlIHRvIEZpeGVkICgwKSwgYW5kIGhlbmNlIGl0
IHRyaWdnZXJzIGFuIEFQSUMgZXJyb3IgZXZlbgo+ID4gd2hlbiB0aGUgTFZUIGVudHJ5IGlzIG1h
c2tlZC4KPiA+Cj4gPiBUaGlzIHdvdWxkIHVzdWFsbHkgbWFuaWZlc3Qgd2hlbiBYZW4gaXMgYmVp
bmcgc2h1dCBkb3duLCBhcyB0aGF0J3MKPiA+IHdoZXJlIGRpc2Nvbm5lY3RfYnNwX0FQSUMgaXMg
Y2FsbGVkOgo+ID4KPiA+IChYRU4pIEFQSUMgZXJyb3Igb24gQ1BVMDogNDAoMDApCj4gPgo+ID4g
Rml4IHRoaXMgYnkgcmV1c2luZyB0aGUgY3VycmVudCBMVlQgTElOVDAgdmFsdWUgYW5kIGp1c3Qg
YWRkaW5nIHRoZQo+ID4gbWFzayBiaXQgdG8gaXQuCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9h
cmNoL3g4Ni9hcGljLmMgfCAzICsrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FwaWMu
YyBiL3hlbi9hcmNoL3g4Ni9hcGljLmMKPiA+IGluZGV4IGE2YTc3NTRkNzcuLmU0MzYzNjM5YmQg
MTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvYXBpYy5jCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvYXBpYy5jCj4gPiBAQCAtMjgxLDcgKzI4MSw4IEBAIHZvaWQgZGlzY29ubmVjdF9ic3BfQVBJ
QyhpbnQgdmlydF93aXJlX3NldHVwKQo+ID4gICAgICAgICAgfQo+ID4gICAgICAgICAgZWxzZSB7
Cj4gPiAgICAgICAgICAgICAgLyogRGlzYWJsZSBMVlQwICovCj4gPiAtICAgICAgICAgICAgYXBp
Y193cml0ZShBUElDX0xWVDAsIEFQSUNfTFZUX01BU0tFRCk7Cj4gPiArICAgICAgICAgICAgdmFs
dWUgPSBhcGljX3JlYWQoQVBJQ19MVlQwKTsKPiA+ICsgICAgICAgICAgICBhcGljX3dyaXRlKEFQ
SUNfTFZUMCwgdmFsdWUgfCBBUElDX0xWVF9NQVNLRUQpOwo+ID4gICAgICAgICAgfQo+IAo+IFRo
aXMgcmVhbGx5IGlzIHVnbHkuwqAgSXQgc2VlbXMgdGhhdCB3ZSBjYW4ndCB3cml0ZSBMVlQwIHRv
IHRoZSBzYW1lCj4gc3RhdGUgdGhhdCBpdCBoYXMgYWZ0ZXIgcmVzZXQvSU5JVC4KPiAKPiBGb3Ig
dGhlIGNvZGUgaG93ZXZlciwgYm90aCBoYWx2ZXMgb2YgdGhlIGlmKCkgY29uZGl0aW9uIGRvIGEK
PiByZWFkL21vZGlmeS93cml0ZS7CoCBJdCB3b3VsZCBiZSBuaWNlciB0byBoYXZlIHRoZSByZWFk
IGFuZCB3cml0ZSBjb21tb24sCj4gd2l0aCBtb2RpZnkgYWxvbmUgaGF2aW5nIHRoZSBpZigpLgoK
QXMgc2FpZCBvbiBteSByZXBseSB0byBKYW4sIHdlIGNvdWxkIGRvIHRoZSBzYW1lIGFzIGNsZWFy
X2xvY2FsX0FQSUMKaWYgdGhhdCBzZWVtcyBwcmVmZXJhYmxlLgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
