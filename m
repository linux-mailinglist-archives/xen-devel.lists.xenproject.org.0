Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC3165FDA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 15:41:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4myZ-0004QI-CN; Thu, 20 Feb 2020 14:38:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4myY-0004QD-0O
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 14:38:50 +0000
X-Inumbo-ID: b493140c-53ee-11ea-bc8e-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b493140c-53ee-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582209529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bk/9x659C7mvgjaYROaZyP/sQLYe2vnoC3IcBI+xwjo=;
 b=NGLczG+5mx6jHkL7OFbG0JFhOi+sforZFkdz2AvL1mZpiALXB3Z9J3nV
 5hojfVZdoeE7WlOwsfnbGl5D7vw+mqUTvLdxq5YCrMOFHfDqpfZtYaFeT
 idFzp/aHKhMcFik2Hvl5ycrc4odxg6urCHP0vyfuZpf40QNP8aBvs5YyA U=;
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
IronPort-SDR: lPLpM4gWqURhL+oS0Lfh6L08oydqoeWvBtNCXG8kKoaOrPDJMvJbQI1IFU4fcgvP640hz4lXxq
 2oRqiuhIFw7vOh2QMKyYHloOAIjeS21HcAEIrl/Hj0X4NWiIUaPBqY/W3g6nTmZ3razlmxwe2N
 ytLG9T65CoOVfj6ICsMOGwexUNsGz7DFhO8PbEyN6XMqq9Ot8VVXmNxJmEPwugh/CtRUPJtN3D
 eym76lM5/54Ca/rh0HVFtteOtNjdiB5kJmd0mjIvA8vF+uyCM1CeebS5huq4xuwOpgrQixUeZl
 F5s=
X-SBRS: 2.7
X-MesageID: 13377949
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="13377949"
Date: Thu, 20 Feb 2020 15:38:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200220143841.GL4679@Air-de-Roger>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <ac515c56-e391-3636-244d-4b660c615dee@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac515c56-e391-3636-244d-4b660c615dee@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDM6MjM6MzhQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyMC4wMi4yMCAxNToxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDIwLCAyMDIwIGF0IDAxOjQ4OjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4gPiBPbiAyMC4wMi4yMDIwIDEzOjAyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiA+
ID4gSSd2ZSBkb25lIHNvbWUgdGVzdGluZyBhbmQgYXQgbGVhc3QgdGhlIENQVSBkb3duIGNhc2Ug
aXMgZml4ZWQgbm93Lgo+ID4gPiA+IFBvc3RpbmcgZWFybHkgaW4gb3JkZXIgdG8gZ2V0IGZlZWRi
YWNrIG9uIHRoZSBhcHByb2FjaCB0YWtlbi4KPiA+ID4gCj4gPiA+IExvb2tzIGdvb2QsIHRoYW5r
cywganVzdCBhIHF1ZXN0aW9uIGFuZCB0d28gY29tbWVudHM6Cj4gPiA+IAo+ID4gPiA+IC0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9yd2xvY2suaAo+ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9y
d2xvY2suaAo+ID4gPiA+IEBAIC0yMCwyMSArMjAsMzAgQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+ID4g
PiA+ICAgI2RlZmluZSBERUZJTkVfUldMT0NLKGwpIHJ3bG9ja190IGwgPSBSV19MT0NLX1VOTE9D
S0VECj4gPiA+ID4gICAjZGVmaW5lIHJ3bG9ja19pbml0KGwpICgqKGwpID0gKHJ3bG9ja190KVJX
X0xPQ0tfVU5MT0NLRUQpCj4gPiA+ID4gLS8qCj4gPiA+ID4gLSAqIFdyaXRlciBzdGF0ZXMgJiBy
ZWFkZXIgc2hpZnQgYW5kIGJpYXMuCj4gPiA+ID4gLSAqCj4gPiA+ID4gLSAqIFdyaXRlciBmaWVs
ZCBpcyA4IGJpdCB0byBhbGxvdyBmb3IgcG90ZW50aWFsIG9wdGltaXNhdGlvbiwgc2VlCj4gPiA+
ID4gLSAqIF93cml0ZV91bmxvY2soKS4KPiA+ID4gPiAtICovCj4gPiA+ID4gLSNkZWZpbmUgICAg
X1FXX1dBSVRJTkcgIDEgICAgICAgICAgICAgICAvKiBBIHdyaXRlciBpcyB3YWl0aW5nICAgICAq
Lwo+ID4gPiA+IC0jZGVmaW5lICAgIF9RV19MT0NLRUQgICAweGZmICAgICAgICAgICAgLyogQSB3
cml0ZXIgaG9sZHMgdGhlIGxvY2sgKi8KPiA+ID4gPiAtI2RlZmluZSAgICBfUVdfV01BU0sgICAg
MHhmZiAgICAgICAgICAgIC8qIFdyaXRlciBtYXNrLiovCj4gPiA+ID4gLSNkZWZpbmUgICAgX1FS
X1NISUZUICAgIDggICAgICAgICAgICAgICAvKiBSZWFkZXIgY291bnQgc2hpZnQgICAgICAqLwo+
ID4gPiA+ICsvKiBXcml0ZXIgc3RhdGVzICYgcmVhZGVyIHNoaWZ0IGFuZCBiaWFzLiAqLwo+ID4g
PiA+ICsjZGVmaW5lICAgIF9RV19XQUlUSU5HICAxICAgICAgICAgICAgICAgICAgICAgICAvKiBB
IHdyaXRlciBpcyB3YWl0aW5nICovCj4gPiA+ID4gKyNkZWZpbmUgICAgX1FXX0xPQ0tFRCAgIDMg
ICAgICAgICAgICAgICAgICAgICAgIC8qIEEgd3JpdGVyIGhvbGRzIHRoZSBsb2NrICovCj4gPiA+
IAo+ID4gPiBBaXVpIHRoaW5ncyB3b3VsZCB3b3JrIGVxdWFsbHkgd2VsbCBpZiAyIHdhcyB1c2Vk
IGhlcmU/Cj4gPiAKPiA+IEkgdGhpbmsgc28sIEkgbGVmdCBpdCBhcyAzIGJlY2F1c2UgcHJldmlv
dXNseSBMT0NLRUQgd291bGQgYWxzbwo+ID4gaW5jbHVkZSBXQUlUSU5HLCBhbmQgSSBkaWRuJ3Qg
d2FudCB0byBjaGFuZ2UgaXQgaW4gY2FzZSBJJ3ZlIG1pc3NlZAo+ID4gc29tZSBjb2RlIHBhdGgg
dGhhdCB3YXMgcmVseWluZyBvbiB0aGF0Lgo+ID4gCj4gPiA+IAo+ID4gPiA+ICsjZGVmaW5lICAg
IF9RV19XTUFTSyAgICAzICAgICAgICAgICAgICAgICAgICAgICAvKiBXcml0ZXIgbWFzayAqLwo+
ID4gPiA+ICsjZGVmaW5lICAgIF9RV19DUFVTSElGVCAyICAgICAgICAgICAgICAgICAgICAgICAv
KiBXcml0ZXIgQ1BVIHNoaWZ0ICovCj4gPiA+ID4gKyNkZWZpbmUgICAgX1FXX0NQVU1BU0sgIDB4
M2ZmYyAgICAgICAgICAgICAgICAgIC8qIFdyaXRlciBDUFUgbWFzayAqLwo+ID4gPiAKPiA+ID4g
QXQgbGVhc3Qgb24geDg2LCB0aGUgc2hpZnQgaW52b2x2ZWQgaGVyZSBpcyBxdWl0ZSBjZXJ0YWlu
bHkKPiA+ID4gbW9yZSBleHBlbnNpdmUgdGhhbiB1c2luZyB3aWRlciBpbW1lZGlhdGVzIG9uIEFO
RCBhbmQgQ01QCj4gPiA+IHJlc3VsdGluZyBmcm9tIHRoZSBfUVdfTUFTSy1iYXNlZCBjb21wYXJp
c29ucy4gSSdkIHRoZXJlZm9yZQo+ID4gPiBsaWtlIHRvIHN1Z2dlc3QgdG8gcHV0IHRoZSBDUFUg
aW4gdGhlIGxvdyAxMiBiaXRzLgo+ID4gCj4gPiBIbSByaWdodC4gVGhlIExPQ0tFRCBhbmQgV0FJ
VElORyBiaXRzIGRvbid0IG5lZWQgc2hpZnRpbmcgYW55d2F5Lgo+ID4gCj4gPiA+IAo+ID4gPiBB
bm90aGVyIG9wdGlvbiBpcyB0byB1c2UgdGhlIHJlY3Vyc2VfY3B1IGZpZWxkIG9mIHRoZQo+ID4g
PiBhc3NvY2lhdGVkIHNwaW4gbG9jazogVGhlIGZpZWxkIGlzIHVzZWQgZm9yIHJlY3Vyc2l2ZSBs
b2Nrcwo+ID4gPiBvbmx5LCBhbmQgaGVuY2UgdGhlIG9ubHkgY29uZmxpY3Qgd291bGQgYmUgd2l0
aAo+ID4gPiBfc3Bpbl9pc19sb2NrZWQoKSwgd2hpY2ggd2UgZG9uJ3QgKGFuZCBpbiB0aGUgZnV0
dXJlIHRoZW4KPiA+ID4gYWxzbyBzaG91bGRuJ3QpIHVzZSBvbiB0aGlzIGxvY2suCj4gPiAKPiA+
IEkgbG9va2VkIGludG8gdGhhdCBhbHNvLCBidXQgdGhpbmdzIGdldCBtb3JlIGNvbXBsaWNhdGVk
IEFGQUlDVCwgYXMgaXQncwo+ID4gbm90IHBvc3NpYmxlIHRvIGF0b21pY2FsbHkgZmV0Y2ggdGhl
IHN0YXRlIG9mIHRoZSBsb2NrIGFuZCB0aGUgb3duZXIKPiA+IENQVSBhdCB0aGUgc2FtZSB0aW1l
LiBOZWl0aGVyIHlvdSBjb3VsZCBzZXQgdGhlIExPQ0tFRCBiaXQgYW5kIHRoZSBDUFUKPiA+IGF0
IHRoZSBzYW1lIHRpbWUuCj4gPiAKPiA+ID4gCj4gPiA+ID4gQEAgLTE2Niw3ICsxODAsOCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgX3dyaXRlX3VubG9jayhyd2xvY2tfdCAqbG9jaykKPiA+ID4gPiAg
ICAgICAgKiBJZiB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNsZWFyZWQg
ZGlyZWN0bHkuCj4gPiA+ID4gICAgICAgICogT3RoZXJ3aXNlLCBhbiBhdG9taWMgc3VidHJhY3Rp
b24gd2lsbCBiZSB1c2VkIHRvIGNsZWFyIGl0Lgo+ID4gPiA+ICAgICAgICAqLwo+ID4gPiA+IC0g
ICAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9jay0+Y250cyk7Cj4gPiA+ID4gKyAgICBBU1NF
UlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPiA+
ID4gPiArICAgIGF0b21pY19zdWIoX3dyaXRlX2xvY2tfdmFsKCksICZsb2NrLT5jbnRzKTsKPiA+
ID4gCj4gPiA+IEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBtb3JlIGVmZmljaWVudCB3aXRoIGF0b21p
Y19hbmQoKSwgbm90Cj4gPiA+IHRoZSBsZWFzdCBiZWNhdXNlIG9mIHRoZSB0aGVuIGF2b2lkZWQg
c21wX3Byb2Nlc3Nvcl9pZCgpLgo+ID4gPiBXaGV0aGVyIHRvIG1hc2sgb2ZmIGp1c3QgX1FXX1dN
QVNLIG9yIGFsc28gdGhlIENQVSBudW1iZXIgb2YKPiA+ID4gdGhlIGxhc3Qgd3JpdGUgb3duZXIg
d291bGQgbmVlZCB0byBiZSBkZXRlcm1pbmVkLiBCdXQgd2l0aAo+ID4gPiB1c2luZyBzdWJ0cmFj
dGlvbiwgaW4gY2FzZSBvZiBwcm9ibGVtcyBpdCdsbCBsaWtlbHkgYmUKPiA+ID4gaGFyZGVyIHRv
IHVuZGVyc3RhbmQgd2hhdCBhY3R1YWxseSB3ZW50IG9uLCBmcm9tIGxvb2tpbmcgYXQKPiA+ID4g
dGhlIHJlc3VsdGluZyBzdGF0ZSBvZiB0aGUgbG9jayAodGhpcyBpcyBpbiBwYXJ0IGEgcHJlLQo+
ID4gPiBleGlzdGluZyBwcm9ibGVtLCBidXQgZ2V0cyB3b3JzZSB3aXRoIHN1YnRyYWN0aW9uIG9m
IENQVQo+ID4gPiBudW1iZXJzKS4KPiA+IAo+ID4gUmlnaHQsIGEgbWFzayB3b3VsZCBiZSBiZXR0
ZXIuIFJpZ2h0IG5vdyBib3RoIG5lZWQgdG8gYmUgY2xlYXJlZCAodGhlCj4gPiBMT0NLRUQgYW5k
IHRoZSBDUFUgZmllbGRzKSBhcyB0aGVyZSdzIGNvZGUgdGhhdCByZWxpZXMgb24gIWxvY2stPmNu
dHMKPiA+IGFzIGEgd2F5IHRvIGRldGVybWluZSB0aGF0IHRoZSBsb2NrIGlzIG5vdCByZWFkIG9y
IHdyaXRlIGxvY2tlZC4gSWYgd2UKPiA+IGxlZnQgdGhlIENQVSBseWluZyBhcm91bmQgdGhvc2Ug
Y2hlY2tzIHdvdWxkIG5lZWQgdG8gYmUgYWRqdXN0ZWQuCj4gCj4gSW4gY2FzZSB5b3UgbWFrZSBf
UVJfU0hJRlQgMTYgaXQgaXMgcG9zc2libGUgdG8ganVzdCB3cml0ZSBhIDItYnl0ZSB6ZXJvCj4g
dmFsdWUgZm9yIHdyaXRlX3VubG9jaygpIChsaWtlIGl0cyBwb3NzaWJsZSB0byBkbyBzbyB0b2Rh
eSB1c2luZyBhCj4gc2luZ2xlIGJ5dGUgd3JpdGUpLgoKVGhhdCB3b3VsZCBsaW1pdCB0aGUgcmVh
ZGVycyBjb3VudCB0byA2NTUzNiwgd2hhdCBkbyB5b3UgdGhpbmsgSmFuPwoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
