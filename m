Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713151519D2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:26:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywIP-0003RN-1i; Tue, 04 Feb 2020 11:23:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iywIN-0003RI-Gj
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:23:07 +0000
X-Inumbo-ID: b7304988-4740-11ea-b211-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7304988-4740-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 11:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580815386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QG7Sbey4Vmee9jomxYtl7ujCRQ18Kfybu8LzldwNnLs=;
 b=NdQw1dI7BHG/b85RYjFgpTcita5wQ9pMxeh8Ypk8PEs+b8U+YJk/3hO/
 jK1kl7L/VW8IRwuYFBSG6e6/1zn6SjJ8Ehqx7J/my9TovL0yoyhEEZs1N
 CKTVuNRLfGakpnXxVxpjFiBK5GoMhp7gdqmrYC+Y2BB2unBhbVlr1jRdP o=;
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
IronPort-SDR: GrAHm/ZCjmzeGUXU2v1H/qCwcjMi3d4nnlqihW2yyipyj1sPMaQTHoabHucLzEfl0iW3NuyO9p
 FlQVzZbEHmuuOeWQR2kPylKm0YZkoa0nda2LTtgesSv4xBM6U2MpeCdhWJ0yQgNo44CfJI6kyC
 ctu5yrYUfUTCDulNtewjPtBxaV8yV+jCpkU69b/ML2yqSYYHayirbGgpjQJwoWfJ6GyCa8qwR1
 sv0vNyInWjgoqj/PQEfzn0bKEykDtHVxU7OXsS1HUH7yAzYILP8YyB+LRX3puFqug4TcaeOIFo
 dgc=
X-SBRS: 2.7
X-MesageID: 12521951
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12521951"
Date: Tue, 4 Feb 2020 12:23:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200204112300.GJ4679@Air-de-Roger>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-3-liuwe@microsoft.com>
 <20200204112038.ad5xvu3zxffokj5w@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204112038.ad5xvu3zxffokj5w@debian>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 02/11] x86/smp: don't online cpu if
 hypervisor_ap_setup fails
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMTE6MjA6MzhBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIEphbiAzMSwgMjAyMCBhdCAwNTo0OToyMVBNICswMDAwLCBXZWkgTGl1IHdyb3Rl
Ogo+ID4gUHVzaCBoeXBlcnZpc29yX2FwX3NldHVwIGRvd24gdG8gc21wX2NhbGxpbi4KPiA+IAo+
ID4gVGFrZSB0aGUgY2hhbmNlIHRvIHJlcGxhY2UgeGVuX2d1ZXN0IHdpdGggY3B1X2hhc19oeXBl
cnZpc29yLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+
IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9zbXBib290LmMgfCAxMCArKysrKysrLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5j
Cj4gPiBpbmRleCBjOWQxYWI0NDIzLi45M2I4NmEwOWU5IDEwMDY0NAo+ID4gLS0tIGEveGVuL2Fy
Y2gveDg2L3NtcGJvb3QuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ID4gQEAg
LTE5OSw2ICsxOTksMTMgQEAgc3RhdGljIHZvaWQgc21wX2NhbGxpbih2b2lkKQo+ID4gICAgICAg
ICAgZ290byBoYWx0Owo+ID4gICAgICB9Cj4gPiAgCj4gPiArICAgIGlmICggY3B1X2hhc19oeXBl
cnZpc29yICYmIChyYyA9IGh5cGVydmlzb3JfYXBfc2V0dXAoKSkgIT0gMCApCj4gCj4gSW4gbGln
aHQgb2YgYSBjb21tZW50IG1hZGUgYnkgUm9nZXIgeWVzdGVyZGF5LCB3aXRoIHRoaXMgY2hhbmdl
IHRoZQo+IEFTU0VSVF9VTlJFQUNIQUJMRSBpbiBoeXBlcnZpc29yX2FwX3NldHVwKCkgc3R1YiBz
aG91bGQgYmUgZHJvcHBlZCwgdG8KPiBkZWFsIHdpdGggWGVuIHJ1bm5pbmcgb24gYSBoeXBlcnZp
c29yIHdpdGggIUNPTkZJR19HVUVTVC4KPiAKPiBJIGhhdmUgZm9sZGVkIGluIHRoZSBmb2xsb3dp
bmcgZGlmZjoKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnZpc29yLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAo+IGluZGV4
IGI1MDM4NTRjNWIuLjY0MzgzZjBjM2QgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnZpc29yLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydmlzb3IuaAo+IEBAIC00NCw3ICs0NCw3IEBAIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9p
ZCk7Cj4gCj4gIHN0YXRpYyBpbmxpbmUgY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9wcm9iZSh2b2lk
KSB7IHJldHVybiBOVUxMOyB9Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX3NldHVw
KHZvaWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0KPiAtc3RhdGljIGlubGluZSBpbnQgaHlw
ZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7IEFTU0VSVF9VTlJFQUNIQUJMRSgpOyByZXR1cm4gMDsg
fQo+ICtzdGF0aWMgaW5saW5lIGludCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpIHsgcmV0dXJu
IDA7IH0KPiAgc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpIHsgQVNT
RVJUX1VOUkVBQ0hBQkxFKCk7IH0KCk9oLCBJIGRpZG4ndCBub3RpY2UgdGhpcyBvbmUgaW5kZWVk
LiBQbGVhc2Uga2VlcCBteSBSLWIuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
