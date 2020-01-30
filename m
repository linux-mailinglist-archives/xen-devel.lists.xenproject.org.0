Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4E14DD32
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 15:49:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixB6D-0002XK-LP; Thu, 30 Jan 2020 14:47:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ixB6B-0002XE-QZ
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:47:15 +0000
X-Inumbo-ID: 67b95572-436f-11ea-8a8a-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67b95572-436f-11ea-8a8a-12813bfff9fa;
 Thu, 30 Jan 2020 14:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580395635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7fFx7u9xcRnwXikBgqk18Fq5DbX2tXJ23CRR4VM4INw=;
 b=GvyhLR1i64UbK856lXOCH9puvxMeb/GrOhQ0VeB3aP8tjsrfjxIX4IgJ
 TNKyQNHd0FKMjFJa7FRNM7JHSQ0uDOoX5dl5mGxKbq8fx7zyn2Hr905NB
 cWBUzXvdC+V84dYjRapIohpAIlZeI8gmJmDPhy9Wmn7bL4aa44UwIndlR g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gGlasD1m4WffrpHqx+gyU4H/vOrTSflu8n069E/6VfxwtPzpuBp4a2mlS1l//QWpeVykFxZPY2
 KWAycNu5GUtHSpDQKM29YAnGzRM/0jDeL/GD6IovoBC2y3exSdmBn0eDFrfGzQ3AyhI7GUtVic
 tpU57Csu+d5Axnmv1Suxv6kzZgab8SWpbsnBxeYTtm4bYNfgeKuUKXwS8CWqt2JYhQLb9deWfh
 Q46xuLUiZ6VvowIwNBTuNfx1ewIBO82hHUhFYHWWsE2fdtLRpTzQyauyeQFVXJsiVJgovR2Pdd
 Hu0=
X-SBRS: 2.7
X-MesageID: 12297521
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="12297521"
Date: Thu, 30 Jan 2020 15:47:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130144704.GP4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <20200130123226.GM4679@Air-de-Roger>
 <20200130123920.3akihbn4zvnigp7q@debian>
 <20200130142201.GO4679@Air-de-Roger>
 <20200130142526.en7vs26dsugbcq4k@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130142526.en7vs26dsugbcq4k@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDI6MjU6MjZQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMzoyMjowMVBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mzk6MjBQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MzI6MjZQTSAr
MDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIEphbiAzMCwgMjAy
MCBhdCAxMjoyODozNlBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBK
YW4gMzAsIDIwMjAgYXQgMDE6MDg6MDdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+
ID4gIC8qCj4gPiA+ID4gPiA+ID4gICAqIExvY2FsIHZhcmlhYmxlczoKPiA+ID4gPiA+ID4gPiAg
ICogbW9kZTogQwo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxk
cy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+ID4gPiA+IGluZGV4IDk3ZjljMDc4
OTEuLjhlMDJiNGM2NDggMTAwNjQ0Cj4gPiA+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L3hl
bi5sZHMuUwo+ID4gPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKPiA+ID4g
PiA+ID4gPiBAQCAtMzI5LDYgKzMyOSwxMCBAQCBTRUNUSU9OUwo+ID4gPiA+ID4gPiA+ICAgIGVm
aSA9IC47Cj4gPiA+ID4gPiA+ID4gICNlbmRpZgo+ID4gPiA+ID4gPiA+ICAKPiA+ID4gPiA+ID4g
PiArI2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPiA+ID4gPiA+ID4gPiArICBodl9oY2FsbF9w
YWdlID0gQUJTT0xVVEUoX19maXhfeF90b192aXJ0KDEpKTsKPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IEkgYXNzdW1lIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBGSVhfWF9IWVBFUlZfSENBTEwgYmVj
YXVzZSBpdCdzIGFuCj4gPiA+ID4gPiA+IGVudW0/Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBZZXMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFuZCB0aGUgdHJpY2sgdG8gZ2VuZXJh
dGUgYSBzeW1ib2wgZGlkbid0IHdvcmsgZWl0aGVyLgo+ID4gPiA+IAo+ID4gPiA+IEFuZCB5b3Ug
bXVzdCBkZWZpbmUgdGhhdCBzeW1ib2wgaW4gdGhlIGxpbmtlciBzY3JpcHQ/IEl0IGRvZXNuJ3Qg
c2VlbQo+ID4gPiA+IHRvIGJlIHVzZWQgYXQgbGluayB0aW1lLgo+ID4gPiA+IAo+ID4gPiAKPiA+
ID4gSSBkb24ndCBmb2xsb3cuIEkgd2lzaCBJIGNvdWxkIGRlZmluZSBhbmQgdXNlIGEgc3ltYm9s
IGluIHRoZSBsaW5rZXIKPiA+ID4gc2NyaXB0IGJ1dCBjb3VsZG4ndC4KPiA+IAo+ID4gSXQncyBs
aWtlbHkgbXkgZmF1bHQsIGFzIEkgaGF2ZW4ndCBiZWVuIGZvbGxvd2luZyB0aGUgcGF0Y2ggc2Vy
aWVzIGluCj4gPiB0aGF0IG11Y2ggZGV0YWlsLiBJIGFzc3VtZSB0aGlzIGlzIGRvbmUgaW4gb3Jk
ZXIgdG8gZ2VuZXJhdGUgYmV0dGVyCj4gPiBjb2RlLCByYXRoZXIgdGhhbiBkb2luZyBzb21ldGhp
bmcgbGlrZToKPiA+IAo+ID4gdm9pZCAqaHZfaGNhbGxfcGFnZSA9IGZpeF94X3RvX3ZpcnQoRklY
X1hfSFlQRVJWX0hDQUxMKTsKPiA+IAo+ID4gSW4gYSBDIGZpbGUgc29tZXdoZXJlIHdoZW4gdGhl
IGh5cGVyY2FsbCBwYWdlIGlzIHNldHVwPwo+IAo+IEFuZHJldyB3YW50ZWQgYmFkbHkgdG8gYmUg
YWJsZSB0byB1c2UgZGlyZWN0IGNhbGwgaW4gdGhlIGh5cGVyY2FsbAo+IGZ1bmN0aW9ucy4gVGhp
cyBpcyB3aGF0IHdlIG1hbmFnZWQgdG8gY29tZSB1cCB3aXRoIHNvIGZhci4KPiAKPiBJIHRoaW5r
IHdoYXQgeW91IHdyb3RlIHdpbGwgc3RpbGwgcmVzdWx0IGluIGFuIGluZGlyZWN0IGNhbGwuCj4g
Cj4gKFRoZSBtYWpvcml0eSBvZiBteSB0aW1lIHNwZW50IG9uIHRoaXMgc2VyaWVzIGhhcyBiZWVu
IGV4dGVuZGluZyBYZW4gdG8KPiBkbyBtb3JlIHRoYW4gaXQgY291bGQgYmVmb3JlLikKCkFjaywg
c29ycnkgdG8gYm90aGVyIHlvdSB3aXRoIHF1ZXN0aW9ucyB5b3UgaGF2ZSBhbHJlYWR5IGFuc3dl
cmVkLiBOb3QKc3VyZSB3aGV0aGVyIGRlZmluaW5nIGh2X2hjYWxsX3BhZ2UgYXMgYSBnbG9iYWwg
Y29uc3Qgd291bGQgbWFrZSBtdWNoCmRpZmZlcmVuY2UuIENvdWxkIHlvdSBtYXliZSB1c2Ugc29t
ZXRoaW5nIGxpa2UgYWx0ZXJuYXRpdmVfdmNhbGwKcGF0Y2hpbmcgdG8gZ2V0IHJpZCBvZiB0aGUg
aW5kaXJlY3Rpb24/CgpJIGhhdmUgdG8gYWRtaXQgSSBmaW5kIHRoaXMgYWxsIHF1aXRlIGhhcmQg
dG8gZm9sbG93IGFuZCByZWFzb24gYWJvdXQsCmxpa2VseSBiZWNhdXNlIG9mIHRoZSBtaXggb2Yg
QywgYXNzZW1ibHksIGFuZCBsaW5rZXIgc2NyaXB0IHRvIGJ1aWxkCnRoaXMgbWFjaGluZXJ5LCBi
dXQgdGhhdCBkb2Vzbid0IG1lYW4gdGhpcyBpc24ndCB0aGUgYmVzdCB3YXkuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
