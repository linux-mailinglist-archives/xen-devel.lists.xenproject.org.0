Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E3316EABE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 17:01:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ccV-0005rf-1v; Tue, 25 Feb 2020 15:59:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UvFY=4N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6ccU-0005ra-6Y
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 15:59:38 +0000
X-Inumbo-ID: d283d300-57e7-11ea-932c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d283d300-57e7-11ea-932c-12813bfff9fa;
 Tue, 25 Feb 2020 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582646377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aCEKp/R6VntFf2Ae2gPWJo73WZNZLIDAb+7scvOwtig=;
 b=Sq29HkNEQrj0ROoAB+/FEUTLozyLGKIXnOst3bGfsY1sEvtQ0da5cxHQ
 RKTyMgDSQmY7DT58RdH6kl/yZgrL6Ui0Et8YZgHDodwGA/yBMPIVAPJy6
 E+Q7kQa7YTPA0ZI+qRwr2HrUzBFkVIcg2kpzxn799cp19LvGrFSklCHPC 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZWt65lMBevlmytm2bY9LKq2UDAM2fuTsaMAuWWruot954k2ic/nOXtpn1bFic1xbe4KBcr1QAo
 DykOnkL+GsigyXVDiHg5F2voIe1sEj0oI1rJRI+2o8pjULFVu4AGN47nQZkfkWIf3c3LAtwJ1U
 c8ZDs8hhj29XuL4IPlnwH6RKCCZ+uI7L+oh2+UflvOFy17em3OQFhHLFGgCZLdg9x4Jn23KhGl
 eaqcKXvTNPxUjYnZ+KNtyrpluKN0vRyQ8s0clQb4YsfmQqiCZinHjs6kDkTJeWNVkB0LabNqhs
 NBE=
X-SBRS: 2.7
X-MesageID: 13337017
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="13337017"
Date: Tue, 25 Feb 2020 16:59:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200225155929.GB24163@Air-de-Roger.citrite.net>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-3-roger.pau@citrix.com>
 <8ed2d868-8a20-b119-2a0c-ef9a9f5e4498@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ed2d868-8a20-b119-2a0c-ef9a9f5e4498@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 2/2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMDQ6MjM6MzRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjQuMDIuMjAyMCAwOTo0NCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTIwLDIxICsyMSwzMCBAQCB0eXBlZGVmIHN0cnVjdCB7Cj4gPiAgI2RlZmluZSBERUZJTkVfUldM
T0NLKGwpIHJ3bG9ja190IGwgPSBSV19MT0NLX1VOTE9DS0VECj4gPiAgI2RlZmluZSByd2xvY2tf
aW5pdChsKSAoKihsKSA9IChyd2xvY2tfdClSV19MT0NLX1VOTE9DS0VEKQo+ID4gIAo+ID4gLS8q
Cj4gPiAtICogV3JpdGVyIHN0YXRlcyAmIHJlYWRlciBzaGlmdCBhbmQgYmlhcy4KPiA+IC0gKgo+
ID4gLSAqIFdyaXRlciBmaWVsZCBpcyA4IGJpdCB0byBhbGxvdyBmb3IgcG90ZW50aWFsIG9wdGlt
aXNhdGlvbiwgc2VlCj4gPiAtICogX3dyaXRlX3VubG9jaygpLgo+ID4gLSAqLwo+ID4gLSNkZWZp
bmUgICAgX1FXX1dBSVRJTkcgIDEgICAgICAgICAgICAgICAvKiBBIHdyaXRlciBpcyB3YWl0aW5n
ICAgICAqLwo+ID4gLSNkZWZpbmUgICAgX1FXX0xPQ0tFRCAgIDB4ZmYgICAgICAgICAgICAvKiBB
IHdyaXRlciBob2xkcyB0aGUgbG9jayAqLwo+ID4gLSNkZWZpbmUgICAgX1FXX1dNQVNLICAgIDB4
ZmYgICAgICAgICAgICAvKiBXcml0ZXIgbWFzay4qLwo+ID4gLSNkZWZpbmUgICAgX1FSX1NISUZU
ICAgIDggICAgICAgICAgICAgICAvKiBSZWFkZXIgY291bnQgc2hpZnQgICAgICAqLwo+ID4gKy8q
IFdyaXRlciBzdGF0ZXMgJiByZWFkZXIgc2hpZnQgYW5kIGJpYXMuICovCj4gPiArI2RlZmluZSAg
ICBfUVdfQ1BVTUFTSyAgMHhmZmYgICAgICAgICAgICAgICAvKiBXcml0ZXIgQ1BVIG1hc2sgKi8K
PiA+ICsjZGVmaW5lICAgIF9RV19TSElGVCAgICAxMiAgICAgICAgICAgICAgICAgIC8qIFdyaXRl
ciBmbGFncyBzaGlmdCAqLwo+ID4gKyNkZWZpbmUgICAgX1FXX1dBSVRJTkcgICgxdSA8PCBfUVdf
U0hJRlQpICAgLyogQSB3cml0ZXIgaXMgd2FpdGluZyAqLwo+ID4gKyNkZWZpbmUgICAgX1FXX0xP
Q0tFRCAgICgzdSA8PCBfUVdfU0hJRlQpICAgLyogQSB3cml0ZXIgaG9sZHMgdGhlIGxvY2sgKi8K
PiA+ICsjZGVmaW5lICAgIF9RV19XTUFTSyAgICAoM3UgPDwgX1FXX1NISUZUKSAgIC8qIFdyaXRl
ciBtYXNrICovCj4gPiArI2RlZmluZSAgICBfUVJfU0hJRlQgICAgMTQgICAgICAgICAgICAgICAg
ICAvKiBSZWFkZXIgY291bnQgc2hpZnQgKi8KPiAKPiBJbiBwYXJ0aWN1bGFyIHdpdGggdGhlIHN1
Z2dlc3RlZCBjaGFuZ2Ugb2YgYXRvbWljX2FuZCgpJ3MgZmlyc3QKPiBwYXJhbWV0ZXIncyB0eXBl
LCBwZXJoYXBzIHRoZSB1IHN1ZmZpeGVzIHdhbnQgZHJvcHBpbmcgaGVyZT8KClRoYXQgd291bGQg
YmUgZmluZS4gQnV0IHNlZWluZyBhcyB3ZSBhcmUgcGxhbm5pbmcgb24gaGFuZGxpbmcgdGhlCnJl
c3VsdCBvZiBhdG9taWNfcmVhZCBhcyBhbiB1bnNpZ25lZCBpbnQgSSdtIG5vdCBzdXJlIGlmIGl0
IHdvbGQgYmUKYmV0dGVyIHRvIGFsc28ga2VlcCB0aG9zZSBhcyB1bnNpZ25lZCBpbnRzLgoKPiA+
ICtzdGF0aWMgaW5saW5lIGJvb2wgX2lzX3dyaXRlX2xvY2tlZF9ieV9tZSh1aW50MzJfdCBjbnRz
KQo+IAo+IEJvdGggaGVyZSBhbmQgLi4uCj4gCj4gPiArewo+ID4gKyAgICBCVUlMRF9CVUdfT04o
X1FXX0NQVU1BU0sgPCBOUl9DUFVTKTsKPiA+ICsgICAgcmV0dXJuIChjbnRzICYgX1FXX1dNQVNL
KSA9PSBfUVdfTE9DS0VEICYmCj4gPiArICAgICAgICAgICAoY250cyAmIF9RV19DUFVNQVNLKSA9
PSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgYm9v
bCBfY2FuX3JlYWRfbG9jayh1aW50MzJfdCBjbnRzKQo+IAo+IC4uLiBoZXJlLCBpcyBhIGZpeGVk
IHdpZHRoIHR5cGUgcmVhbGx5IG5lZWRlZD8gSSdkIHByZWZlciBpZgo+ICJ1bnNpZ25lZCBpbnQi
IHdhcyB1c2VkLCBhbmQgaWYgZXZlbnR1YWxseSB3ZSdkIHRoZW4gYWxzbwo+IHJlcGxhY2UgLi4u
CgpUaGUgY29kZSB1bmlmb3JtbHkgdXNlcyB1aW50MzJfdCBhcyB0aGUgY250cyB0eXBlLCBJJ20g
ZmluZSB3aXRoCnN3aXRjaGluZyB0byB1bnNpZ25lZCBpbnQsIEkndmUgdXNlZCB1aW50MzJfdCB0
byBrZWVwIGl0IGNvaGVyZW50IHdpdGgKdGhlIHJlc3Qgb2YgdGhlIGNvZGUuCgo+ID4gQEAgLTQ1
LDEwICs1NSwxMCBAQCBzdGF0aWMgaW5saW5lIGludCBfcmVhZF90cnlsb2NrKHJ3bG9ja190ICps
b2NrKQo+ID4gICAgICB1MzIgY250czsKPiAKPiAuLi4gdGhpcyBhbmQgLi4uCj4gCj4gPiBAQCAt
NjQsNyArNzQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX3JlYWRfbG9jayhyd2xvY2tfdCAqbG9j
aykKPiA+ICAgICAgdTMyIGNudHM7Cj4gCj4gLi4uIHRoaXMgKGFuZCBwb3NzaWJsZSBvdGhlcnMp
Lgo+IAo+ID4gQEAgLTExNSw2ICsxMjUsMTEgQEAgc3RhdGljIGlubGluZSBpbnQgX3J3X2lzX2xv
Y2tlZChyd2xvY2tfdCAqbG9jaykKPiA+ICAgICAgcmV0dXJuIGF0b21pY19yZWFkKCZsb2NrLT5j
bnRzKTsKPiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGlubGluZSB1aW50MzJfdCBfd3JpdGVfbG9j
a192YWwodm9pZCkKPiAKPiBTYW1lIGhlcmUgdGhlbi4KPiAKPiBXaXRoIHRoZXNlIHRha2VuIGNh
cmUgb2YgKGFzIGxvbmcgYXMgeW91IGFncmVlLCBhbmQgbGlrZWx5IGRvYWJsZQo+IGFnYWluIHdo
aWxlIGNvbW1pdHRpbmcpCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KClRoYW5rcywgZmVlbCBmcmVlIHRvIGFkanVzdCBvbiBjb21taXQsIG9yIGVsc2UgSSBj
YW4gc2VuZCBhIG5ldwp2ZXJzaW9uLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
