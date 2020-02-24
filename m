Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F916AAA0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 17:02:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6G8q-0000OS-FD; Mon, 24 Feb 2020 15:59:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6G8o-0000ON-UB
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 15:59:30 +0000
X-Inumbo-ID: a39d6c3c-571e-11ea-9212-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a39d6c3c-571e-11ea-9212-12813bfff9fa;
 Mon, 24 Feb 2020 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582559970;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J7VvQJjVT41zWpe2Iewu65xT12BCGJsjQuSoYhoy+ic=;
 b=CORhfZaFmZ2gj1jePykIJksjzwUYNN4Fid7kT5+Ab5liQDC5CVXESS1T
 7qHWMxTCSOa7/1DmTHV2pcYSucxZ8LwHdVI7mqfe6UsEzGIT3S+86mM7a
 LUdHpJTSP9jnTcVa1avF/MuaBWtfjaz6kOrsAlgCOuJxdyML3Qpd0LFi1 A=;
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
IronPort-SDR: GuGykOPl65cg2zwuPY8+FDANAkrJDs/b+g1ucWItLnARrv+1m/4vHSCJQ8m7qxo3NtPshH/MAm
 +XgpWp0BEv79seka2Q5Ui2NiCMTW7MOKS6CPrrN3W5tnzLZRp/nGYra/txEYHwAXj6sbeaktMp
 SeL8U5zUTWhE38JY/gcPpCSZfF3wLT4JocOFf1Gu7ppFWyhXASOiq/OUlGZdMAj+pdTAoN4msq
 zUgP8BGuqH4dfe1/h8/yOXAITJ9e79i9zkH+fZDm/Ti0yjeJ9ermaG/Px4y53ZvOoLbLmkr6cS
 8HY=
X-SBRS: 2.7
X-MesageID: 12897642
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12897642"
Date: Mon, 24 Feb 2020 16:59:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200224155921.GV4679@Air-de-Roger>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
 <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDg6NDU6MDVBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0IDU6MzkgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgRmViIDIxLCAy
MDIwIGF0IDEwOjQ5OjIxQU0gLTA4MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gKyAg
ICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAvKgo+ID4gPiArICAgICAqIElmIGl0J3MgYSB3cml0ZSBh
Y2Nlc3MgKGllLiB1bnNoYXJpbmcpIG9yIGlmIGFkZGluZyBhIHNoYXJlZCBlbnRyeSB0bwo+ID4g
PiArICAgICAqIHRoZSBwaHlzbWFwIGZhaWxlZCB3ZSdsbCBmb3JrIHRoZSBwYWdlIGRpcmVjdGx5
Lgo+ID4gPiArICAgICAqLwo+ID4gPiArICAgIHAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPiA+
ID4gKyAgICBwYXJlbnQgPSBkLT5wYXJlbnQ7Cj4gPiA+ICsKPiA+ID4gKyAgICB3aGlsZSAoIHBh
cmVudCApCj4gPiA+ICsgICAgewo+ID4gPiArICAgICAgICBtZm4gPSBnZXRfZ2ZuX3F1ZXJ5KHBh
cmVudCwgZ2ZuX2wsICZwMm10KTsKPiA+ID4gKwo+ID4gPiArICAgICAgICBpZiAoIG1mbl92YWxp
ZChtZm4pICYmIHAybV9pc19hbnlfcmFtKHAybXQpICkKPiA+Cj4gPiBUaGlzIHdvdWxkIGFsc28g
Y292ZXIgZ3JhbnRzLCBidXQgSSdtIG5vdCBzdXJlIGhvdyB0aG9zZSBhcmUgaGFuZGxlZAo+ID4g
YnkgZm9ya2luZywgYXMgYWNjZXNzIHRvIHRob3NlIGlzIGdyYW50ZWQgb24gYSBwZXItZG9tYWlu
IGJhc2lzLiBJZToKPiA+IHRoZSBwYXJlbnQgd2lsbCBoYXZlIGFjY2VzcyB0byB0aGUgZ3JhbnQs
IGJ1dCBub3QgdGhlIGNoaWxkLgo+IAo+IEdvb2QgcXVlc3Rpb24uIEdyYW50cyBhcmUgbm90IHNo
YXJhYmxlIGJlY2F1c2UgdGhlaXIgcmVmZXJlbmNlIGNvdW50Cj4gd2lsbCBwcmV2ZW50IHNoYXJp
bmcsIHNvIGhlcmUgdGhlIHBhZ2UgY29udGVudCB3b3VsZCBqdXN0IGdldCBjb3BpZWQKPiBhcyBh
IHJlZ3VsYXIgcGFnZSBpbnRvIHRoZSBmb3JrLiBJIGNhbiBjaGVjayB0aGF0IGlmIGluIHRoZSB1
c2VjYXNlIHdlCj4gaGF2ZSBhbnl0aGluZyBicmVha3MgaWYgd2UganVzdCBza2lwIGdyYW50cyBj
b21wbGV0ZWx5LCBJIGRvbid0IHRoaW5rCj4gYSByZWd1bGFyIGRvbWFpbiBoYXMgYW55IGdyYW50
cyBieSBkZWZhdWx0LgoKSG0sIEkgZG9uJ3QgaGF2ZSBhIGdvb2Qgc3VnZ2VzdGlvbiBmb3IgdGhp
cy4gU2luY2UgdGhlIGRvbWFpbiBpcyBub3QKYXdhcmUgb2YgdGhlIGZvcmsgdGhlcmUncyBubyB3
YXkgZm9yIGl0IHRvIG5vdGljZSBncmFudCBtYXBzIGhhdmUKYmVjb21lIHN0YWxlLgoKQ2FuIHlv
dSBhZGQgYSBub3RlIGluIHRoaXMgcmVnYXJkPyBBbmQgbWF5YmUgY3Jhc2hpbmcgdGhlIGZvcmsg
d2hlbiBhCmdyYW50IGlzIGZvdW5kIHdvdWxkIGJlIGZpbmUsIHVudGlsIHdlIGZpZ3VyZSBvdXQg
aG93IHRvIGhhbmRsZSB0aGVtCnByb3Blcmx5LgoKPiA+Cj4gPiA+ICsgICAgICAgICAgICBicmVh
azsKPiA+ID4gKwo+ID4gPiArICAgICAgICBwdXRfZ2ZuKHBhcmVudCwgZ2ZuX2wpOwo+ID4gPiAr
ICAgICAgICBwYXJlbnQgPSBwYXJlbnQtPnBhcmVudDsKPiA+ID4gKyAgICB9Cj4gPiA+ICsKPiA+
ID4gKyAgICBpZiAoICFwYXJlbnQgKQo+ID4gPiArICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiA+
ID4gKwo+ID4gPiArICAgIGlmICggIShwYWdlID0gYWxsb2NfZG9taGVhcF9wYWdlKGQsIDApKSAp
Cj4gPiA+ICsgICAgewo+ID4gPiArICAgICAgICBwdXRfZ2ZuKHBhcmVudCwgZ2ZuX2wpOwo+ID4g
PiArICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ID4gKyAgICB9Cj4gPiA+ICsKPiA+ID4gKyAg
ICBuZXdfbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4gPiA+ICsgICAgY29weV9kb21haW5fcGFn
ZShuZXdfbWZuLCBtZm4pOwo+ID4gPiArICAgIHNldF9ncGZuX2Zyb21fbWZuKG1mbl94KG5ld19t
Zm4pLCBnZm5fbCk7Cj4gPiA+ICsKPiA+ID4gKyAgICBwdXRfZ2ZuKHBhcmVudCwgZ2ZuX2wpOwo+
ID4gPiArCj4gPiA+ICsgICAgcmV0dXJuIHAybS0+c2V0X2VudHJ5KHAybSwgZ2ZuLCBuZXdfbWZu
LCBQQUdFX09SREVSXzRLLCBwMm1fcmFtX3J3LAo+ID4KPiA+IFNvIHRoZSBjaGlsZCBwMm0gaXMg
Z29pbmcgdG8gYmUgcG9wdWxhdGVkIHVzaW5nIDRLIHBhZ2VzIGV4Y2x1c2l2ZWx5Pwo+ID4gTWF5
YmUgaXQgd291bGQgbWFrZSBzZW5zZSB0byB0cnkgdG8gdXNlIDJNIGlmIHRoZSBwYXJlbnQgZG9t
YWluIHBhZ2UKPiA+IGlzIGFsc28gYSAyTSBwYWdlIG9yIGxhcmdlcj8KPiAKPiBObywgbWVtb3J5
IHNoYXJpbmcgb25seSB3b3JrcyBvbiBhIDRrIGdyYW51bGFyaXR5IHNvIHRoYXQncyB3aGF0IHdl
Cj4gYXJlIGdvaW5nIHdpdGguIE5vIHJlYXNvbiB0byBjb3B5IDJNIHBhZ2VzIHdoZW4gbW9zdCBv
ZiBpdCBjYW4ganVzdCBiZQo+IHNoYXJlZCB3aGVuIGJyb2tlbiB1cC4KCk9oLCBPSy4gRm9yIHlv
dXIgdXNlLWNhc2UgaXQgbGlrZWx5IGRvZXNuJ3QgbWF0dGVyIHRoYXQgbXVjaCwgYnV0Cmxvbmct
cnVubmluZyBmb3JrcyB3b3VsZCBnZXQgYmV0dGVyIHBlcmZvcm1hbmNlIGlmIHVzaW5nIGxhcmdl
IHBhZ2VzLgoKPiA+ID4gQEAgLTUwOSw2ICs1MDksMTQgQEAgbWZuX3QgX19nZXRfZ2ZuX3R5cGVf
YWNjZXNzKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIHVuc2lnbmVkIGxvbmcgZ2ZuX2wsCj4gPiA+
Cj4gPiA+ICAgICAgbWZuID0gcDJtLT5nZXRfZW50cnkocDJtLCBnZm4sIHQsIGEsIHEsIHBhZ2Vf
b3JkZXIsIE5VTEwpOwo+ID4gPgo+ID4gPiArICAgIC8qIENoZWNrIGlmIHdlIG5lZWQgdG8gZm9y
ayB0aGUgcGFnZSAqLwo+ID4gPiArICAgIGlmICggKHEgJiBQMk1fQUxMT0MpICYmIHAybV9pc19o
b2xlKCp0KSAmJgo+ID4gPiArICAgICAgICAgIW1lbV9zaGFyaW5nX2ZvcmtfcGFnZShwMm0tPmRv
bWFpbiwgZ2ZuLCAhIShxICYgUDJNX1VOU0hBUkUpKSApCj4gPiA+ICsgICAgewo+ID4gPiArICAg
ICAgICBtZm4gPSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbiwgdCwgYSwgcSwgcGFnZV9vcmRlciwg
TlVMTCk7Cj4gPiA+ICsgICAgfQo+ID4KPiA+IE5vIG5lZWQgZm9yIHRoZSBicmFjZXMuCj4gCj4g
SSB3b3VsZCBrZWVwIHRoZW0sIGl0IGhlbHBzIHdpdGggcmVhZGFiaWxpdHkgaW4gdGhpcyBjYXNl
LgoKQ09ESU5HX1NUWUxFIG1lbnRpb25zIHRoYXQgYnJhY2VzIHNob3VsZCBiZSBvbWl0dGVkIGZv
ciBibG9ja3Mgd2l0aCBhCnNpbmdsZSBzdGF0ZW1lbnQsIGJ1dCBJJ20gbm90IHN1cmUgaG93IHN0
cmljdGx5IHdlIGVuZm9yY2UgdGhpcy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
