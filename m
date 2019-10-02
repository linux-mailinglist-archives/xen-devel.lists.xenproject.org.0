Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD0C9476
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFnPt-0003zq-Tk; Wed, 02 Oct 2019 22:48:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFnPr-0003zZ-Nu
 for xen-devel@lists.xen.org; Wed, 02 Oct 2019 22:48:15 +0000
X-Inumbo-ID: b7f1a4e8-e566-11e9-971d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id b7f1a4e8-e566-11e9-971d-12813bfff9fa;
 Wed, 02 Oct 2019 22:48:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D814B20659;
 Wed,  2 Oct 2019 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570056494;
 bh=ICJyIsm1BmPaOR9HfqR+wOGkM59tyrr/Lj8Etm9+kS0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nYPaeLl21dSISRHcQPtGcapoit+xVhdiW4cKBSJ6knP3raefDFqg8zkngzWBOq49i
 rmFqTgy3Ph1SODO1B88x3HVdj5cUhQ4fIKws+XJ/pqtpYkLNZn3fe/HDswQpOHCn/I
 RTEx72EmLkviVqkHR5wKHoKOF2DqKOeIjj7g3XdI=
Date: Wed, 2 Oct 2019 15:48:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1910021512400.2691@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1910021547140.2691@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
 <20190930233032.2120-5-sstabellini@kernel.org>
 <b3424309-d315-7ff8-7bd7-66782db279cd@arm.com>
 <alpine.DEB.2.21.1910021512400.2691@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7b 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Julien Grall <julien.grall@arm.com>, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2VkLCAy
IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBIaSBTdGVmYW5vLAo+ID4gCj4gPiBP
biAxMC8xLzE5IDEyOjMwIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+IFNjYW4g
dGhlIHVzZXIgcHJvdmlkZWQgZHRiIGZyYWdtZW50IGF0IGJvb3QuIEZvciBlYWNoIGRldmljZSBu
b2RlLCBtYXAKPiA+ID4gbWVtb3J5IHRvIGd1ZXN0cywgYW5kIHJvdXRlIGludGVycnVwdHMgYW5k
IHNldHVwIHRoZSBpb21tdS4KPiA+ID4gCj4gPiA+IFRoZSBtZW1vcnkgcmVnaW9uIHRvIHJlbWFw
IGlzIHNwZWNpZmllZCBieSB0aGUgInhlbixyZWciIHByb3BlcnR5Lgo+ID4gPiAKPiA+ID4gVGhl
IGlvbW11IGlzIHNldHVwIGJ5IHBhc3NpbmcgdGhlIG5vZGUgb2YgdGhlIGRldmljZSB0byBhc3Np
Z24gb24gdGhlCj4gPiA+IGhvc3QgZGV2aWNlIHRyZWUuIFRoZSBwYXRoIGlzIHNwZWNpZmllZCBp
biB0aGUgZGV2aWNlIHRyZWUgZnJhZ21lbnQgYXMKPiA+ID4gdGhlICJ4ZW4scGF0aCIgc3RyaW5n
IHByb3BlcnR5Lgo+ID4gPiAKPiA+ID4gVGhlIGludGVycnVwdHMgYXJlIHJlbWFwcGVkIGJhc2Vk
IG9uIHRoZSBpbmZvcm1hdGlvbiBmcm9tIHRoZQo+ID4gPiBjb3JyZXNwb25kaW5nIG5vZGUgb24g
dGhlIGhvc3QgZGV2aWNlIHRyZWUuIENhbGwKPiA+ID4gaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRz
IHRvIHJlbWFwIGludGVycnVwdHMuIEludGVycnVwdHMgcmVsYXRlZCBkZXZpY2UKPiA+ID4gdHJl
ZSBwcm9wZXJ0aWVzIGFyZSBjb3BpZWQgZnJvbSB0aGUgZGV2aWNlIHRyZWUgZnJhZ21lbnQsIHNh
bWUgYXMgYWxsCj4gPiA+IHRoZSBvdGhlciBwcm9wZXJ0aWVzLgo+ID4gPiAKPiA+ID4gUmVxdWly
ZSBib3RoIHhlbixyZWcgYW5kIHhlbixwYXRoIHRvIGJlIHByZXNlbnQsIHVubGVzcwo+ID4gPiB4
ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9tbXUgaXMgYWxzbyBzZXQuIEluIHRoYXQgY2FzZSwg
dG9sZXJhdGUgYQo+ID4gPiBtaXNzaW5nIHhlbixwYXRoLCBhbHNvIHRvbGVyYXRlIGlvbW11IHNl
dHVwIGZhaWx1cmUgZm9yIHRoZSBwYXNzdGhyb3VnaAo+ID4gPiBkZXZpY2UuCj4gPiA+IAo+ID4g
PiBBbHNvIHNldCBhZGQgdGhlIG5ldyBmbGFnIFhFTl9ET01DVExfQ0RGX2lvbW11IHNvIHRoYXQg
ZG9tMGxlc3MgZG9tVQo+ID4gPiBjYW4gdXNlIHRoZSBJT01NVSBpZiBhIHBhcnRpYWwgZHRiIGlz
IHNwZWNpZmllZC4KPiA+IAo+ID4gVGhlIHBhdGNoIGxvb2tzIGdvb2QgYSBmZXcgY29tbWVudHMg
YmVsb3cuCj4gCj4gVGhhbmtzCj4gCj4gCj4gPiBbLi4uXQo+ID4gCj4gPiA+ICAgeGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jIHwgMTMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+ID4gaW5kZXggODRiNjViOGYyNS4u
NDdmOWJiMzFkZiAxMDA2NDQKPiA+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gPiBAQCAtMTcxNCw2
ICsxNzE0LDg4IEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdnBsMDExX3VhcnRfbm9kZShzdHJ1
Y3QKPiA+ID4ga2VybmVsX2luZm8gKmtpbmZvKQo+ID4gPiAgIH0KPiA+ID4gICAjZW5kaWYKPiA+
ID4gICArLyoKPiA+ID4gKyAqIFNjYW4gZGV2aWNlIHRyZWUgcHJvcGVydGllcyBmb3IgcGFzc3Ro
cm91Z2ggc3BlY2lmaWMgaW5mb3JtYXRpb24uCj4gPiA+ICsgKiBSZXR1cm5zIDwgMCBvbiBlcnJv
cgo+ID4gPiArICogICAgICAgICAwIG9uIHN1Y2Nlc3MKPiA+ID4gKyAqLwo+ID4gPiArc3RhdGlj
IGludCBfX2luaXQgaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3Aoc3RydWN0IGtlcm5lbF9pbmZvICpr
aW5mbywKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBmZHRfcHJvcGVydHkKPiA+ID4gKnhlbl9yZWcsCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5
Cj4gPiA+ICp4ZW5fcGF0aCwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgeGVuX2ZvcmNlLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgYWRkcmVzc19jZWxscywgdWludDMyX3QKPiA+ID4g
c2l6ZV9jZWxscykKPiA+ID4gK3sKPiA+ID4gKyAgICBjb25zdCBfX2JlMzIgKmNlbGw7Cj4gPiA+
ICsgICAgdW5zaWduZWQgaW50IGksIGxlbjsKPiA+ID4gKyAgICBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKm5vZGU7Cj4gPiA+ICsgICAgaW50IHJlczsKPiA+ID4gKyAgICBwYWRkcl90IG1zdGFydCwg
c2l6ZSwgZ3N0YXJ0Owo+ID4gPiArCj4gPiA+ICsgICAgLyogeGVuLHJlZyBzcGVjaWZpZXMgd2hl
cmUgdG8gbWFwIHRoZSBNTUlPIHJlZ2lvbiAqLwo+ID4gPiArICAgIGNlbGwgPSAoY29uc3QgX19i
ZTMyICopeGVuX3JlZy0+ZGF0YTsKPiA+ID4gKyAgICBsZW4gPSBmZHQzMl90b19jcHUoeGVuX3Jl
Zy0+bGVuKSAvCj4gPiA+ICsgICAgICAgICAgKChhZGRyZXNzX2NlbGxzICogMiArIHNpemVfY2Vs
bHMpICogc2l6ZW9mKHVpbnQzMl90KSk7Cj4gPiAKPiA+IENvZGluZyBzdHlsZSBhZ2Fpbi4gSSB3
YXMga2luZCBvZiBleHBlY3RpbmcgeW91IGNvbmZpZ3VyZWQgeW91ciBlZGl0b3IKPiA+IHByb3Bl
cmx5IGFmdGVyIHRoZSBsYXN0IGRpc2N1c3Npb24uLi4KPiAKPiBBY3R1YWxseSBJIGZhaWwgdG8g
c2VlIHRoZSBjb2Rpbmcgc3R5bGUgaXNzdWUgb24gdGhpcyBvbmUuIElzIGl0IHN0aWxsCj4gYW4g
YWxpZ25tZW50IGlzc3VlIHlvdSBhcmUgdGFsa2luZyBhYm91dD8KCklzIGl0IGJlY2F1c2UgeW91
IHdvdWxkIGxpa2UgaXQgdG8gbG9vayBsaWtlIHRoaXM/CgogICAgbGVuID0gZmR0MzJfdG9fY3B1
KHhlbl9yZWctPmxlbikgLyAoKGFkZHJlc3NfY2VsbHMgKiAyICsgc2l6ZV9jZWxscykgKgogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHVpbnQzMl90KSk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
