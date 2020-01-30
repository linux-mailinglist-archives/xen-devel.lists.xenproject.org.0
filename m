Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BA014DCC0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 15:24:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixAhw-00005j-KA; Thu, 30 Jan 2020 14:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ixAhu-00005e-MA
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:22:10 +0000
X-Inumbo-ID: e5b9e6f2-436b-11ea-8a7f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5b9e6f2-436b-11ea-8a7f-12813bfff9fa;
 Thu, 30 Jan 2020 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580394129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1VBKZAJJaX05u4OZ8wWrEVJVdodecyd2WJCi8uBYaWM=;
 b=YQESIyOk2kcEK53vf/grCBx2O8hXkGaUDJ8ar/XiYcM6rl9MD0HZD6PJ
 V/9ymSxZgoa9ktub5hGZ7e+VGrkCDUzkMr0zMzbKqP4Zwz2wlwHzKKY4X
 eKFGGWxIUJBoLiAgFSVx8X3bytsL75QmRiNw/wL71qRPciKRB+TM8tE8/ c=;
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
IronPort-SDR: 4vnIdPKJ/Q/IyeE7GcRNn2SB35f3Jlpp+JBMJxxI2YQbhdvoxO39Sd/qee2OaYrUMJLxaZi8kZ
 hdbdCtN//xyY1tgpev4eNmBUHAloNAGSrqPUh3n1qHXiSYQVun7cS+RU8birecUAu39B50b9xp
 c8PKQzwVNFmfG8rb2tcFnTAV7HpNb826XeNBckmZLzJhl00ejlqwwpNYtzS3EylRgfKGzPsDHM
 qHeicFBwF9cN8tRajeqiyk4mzH78vSYaok++9L9Zisoausl0dEK1oB978tujgShdmxXrloy/Ej
 Lak=
X-SBRS: 2.7
X-MesageID: 11696204
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11696204"
Date: Thu, 30 Jan 2020 15:22:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130142201.GO4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <20200130120807.GJ4679@Air-de-Roger>
 <20200130122836.ccexm2c2j5i7umas@debian>
 <20200130123226.GM4679@Air-de-Roger>
 <20200130123920.3akihbn4zvnigp7q@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200130123920.3akihbn4zvnigp7q@debian>
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mzk6MjBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEphbiAzMCwgMjAyMCBhdCAwMTozMjoyNlBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mjg6MzZQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDE6MDg6MDdQTSAr
MDEwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiA+ICt9Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiAgLyoKPiA+ID4gPiA+ICAgKiBMb2NhbCB2YXJpYWJsZXM6Cj4gPiA+
ID4gPiAgICogbW9kZTogQwo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCj4gPiA+ID4gPiBpbmRleCA5N2Y5YzA3ODkx
Li44ZTAyYjRjNjQ4IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMu
Uwo+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ID4gPiA+ID4gQEAgLTMy
OSw2ICszMjksMTAgQEAgU0VDVElPTlMKPiA+ID4gPiA+ICAgIGVmaSA9IC47Cj4gPiA+ID4gPiAg
I2VuZGlmCj4gPiA+ID4gPiAgCj4gPiA+ID4gPiArI2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QK
PiA+ID4gPiA+ICsgIGh2X2hjYWxsX3BhZ2UgPSBBQlNPTFVURShfX2ZpeF94X3RvX3ZpcnQoMSkp
Owo+ID4gPiA+IAo+ID4gPiA+IEkgYXNzdW1lIHRoZXJlJ3Mgbm8gd2F5IHRvIHVzZSBGSVhfWF9I
WVBFUlZfSENBTEwgYmVjYXVzZSBpdCdzIGFuCj4gPiA+ID4gZW51bT8KPiA+ID4gPiAKPiA+ID4g
Cj4gPiA+IFllcy4KPiA+ID4gCj4gPiA+IEFuZCB0aGUgdHJpY2sgdG8gZ2VuZXJhdGUgYSBzeW1i
b2wgZGlkbid0IHdvcmsgZWl0aGVyLgo+ID4gCj4gPiBBbmQgeW91IG11c3QgZGVmaW5lIHRoYXQg
c3ltYm9sIGluIHRoZSBsaW5rZXIgc2NyaXB0PyBJdCBkb2Vzbid0IHNlZW0KPiA+IHRvIGJlIHVz
ZWQgYXQgbGluayB0aW1lLgo+ID4gCj4gCj4gSSBkb24ndCBmb2xsb3cuIEkgd2lzaCBJIGNvdWxk
IGRlZmluZSBhbmQgdXNlIGEgc3ltYm9sIGluIHRoZSBsaW5rZXIKPiBzY3JpcHQgYnV0IGNvdWxk
bid0LgoKSXQncyBsaWtlbHkgbXkgZmF1bHQsIGFzIEkgaGF2ZW4ndCBiZWVuIGZvbGxvd2luZyB0
aGUgcGF0Y2ggc2VyaWVzIGluCnRoYXQgbXVjaCBkZXRhaWwuIEkgYXNzdW1lIHRoaXMgaXMgZG9u
ZSBpbiBvcmRlciB0byBnZW5lcmF0ZSBiZXR0ZXIKY29kZSwgcmF0aGVyIHRoYW4gZG9pbmcgc29t
ZXRoaW5nIGxpa2U6Cgp2b2lkICpodl9oY2FsbF9wYWdlID0gZml4X3hfdG9fdmlydChGSVhfWF9I
WVBFUlZfSENBTEwpOwoKSW4gYSBDIGZpbGUgc29tZXdoZXJlIHdoZW4gdGhlIGh5cGVyY2FsbCBw
YWdlIGlzIHNldHVwPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
