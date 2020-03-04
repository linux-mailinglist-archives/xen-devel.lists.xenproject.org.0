Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B9178DDF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 10:56:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Qiw-00032m-KG; Wed, 04 Mar 2020 09:53:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Mvz=4V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9Qiu-00032c-CC
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 09:53:52 +0000
X-Inumbo-ID: 0cf299ec-5dfe-11ea-a374-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cf299ec-5dfe-11ea-a374-12813bfff9fa;
 Wed, 04 Mar 2020 09:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583315631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bOHkblSAmvWisWq/CfybcOP2CBUBeeBh1q5XUe2uGhQ=;
 b=Tn/TXnnzKC/YNZTx41jUN2IukTzXiDLkl2us2R182lpX1XYQCg3Xepi7
 Ta+wBZcaCNKn3CUvnYjrYvII38AvcS5BADtFJhX/JEFdTC/XGkXWTJeAb
 PbThTSEheYEyzE7Ya2VViY6NP5KBzghUyyKRhw781dVvyfIPYrKufqs2s M=;
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
IronPort-SDR: P2kgYFBnMZMPWE5z87eifmYLlJ0Uj0glOZ7evbP17/s1c/AwwZpBfzQ/YNIedHtvQBjc2I5fa+
 0U7d1hz/ZYvIMfUAIl+dxPVMhKHJQztDSTos4zo+HhmgUX+bjrTfLCE+Bd0ye1+op4UsL6acmj
 V2KkIr9vgeuLZT6H4T9vRqoPC7zrN9JJJjxAK4HBY6oWqV5UAbJWhxGJsU9CS0ALmC1Oii+P04
 UbpoufEJnCcJEiKYCNwIGIqn/Y/uev23gESoMWIj0XHgHDuDQ11YmmGETAJFw29RwwcVi/cpBx
 jm8=
X-SBRS: 2.7
X-MesageID: 13813418
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,513,1574139600"; d="scan'208";a="13813418"
Date: Wed, 4 Mar 2020 10:53:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200304095341.GQ24458@Air-de-Roger.citrite.net>
References: <20200303115253.47449-1-roger.pau@citrix.com>
 <9cc580b5-f7e1-16d1-02f8-f847d10f70dc@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cc580b5-f7e1-16d1-02f8-f847d10f70dc@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/dom0: improve PVH initrd and
 metadata placement
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMDMsIDIwMjAgYXQgMDQ6NDA6MzZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDMuMjAyMCAxMjo1MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vZG9tMF9idWlsZC5jCj4gPiBAQCAtNDkwLDYgKzQ5MCw0NSBAQCBzdGF0aWMgaW50IF9faW5p
dCBwdmhfcG9wdWxhdGVfcDJtKHN0cnVjdCBkb21haW4gKmQpCj4gPiAgI3VuZGVmIE1CMV9QQUdF
Uwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgcGFkZHJfdCBmaW5kX21lbW9yeShjb25zdCBzdHJ1
Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgZWxmX2JpbmFyeSAqZWxmLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemVfdCBzaXplKQo+ID4gK3sKPiA+ICsgICAgcGFkZHJfdCBr
ZXJuZWxfc3RhcnQgPSAocGFkZHJfdCllbGYtPmRlc3RfYmFzZTsKPiA+ICsgICAgcGFkZHJfdCBr
ZXJuZWxfZW5kID0gKHBhZGRyX3QpKGVsZi0+ZGVzdF9iYXNlICsgZWxmLT5kZXN0X3NpemUpOwo+
ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICsKPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBk
LT5hcmNoLm5yX2U4MjA7IGkrKyApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIHBhZGRyX3Qgc3Rh
cnQsIGVuZCA9IGQtPmFyY2guZTgyMFtpXS5hZGRyICsgZC0+YXJjaC5lODIwW2ldLnNpemU7Cj4g
PiArCj4gPiArICAgICAgICAvKiBEb24ndCB1c2UgbWVtb3J5IGJlbG93IDFNQiwgYXMgaXQgY291
bGQgb3ZlcndyaXRlIHRoZSBCREEvRUJEQS4gKi8KPiA+ICsgICAgICAgIGlmICggZW5kIDw9IE1C
KDEpIHx8IGQtPmFyY2guZTgyMFtpXS50eXBlICE9IEU4MjBfUkFNICkKPiA+ICsgICAgICAgICAg
ICBjb250aW51ZTsKPiA+ICsKPiA+ICsgICAgICAgIHN0YXJ0ID0gTUFYKFJPVU5EVVAoZC0+YXJj
aC5lODIwW2ldLmFkZHIsIFBBR0VfU0laRSksIE1CKDEpKTsKPiA+ICsKPiA+ICsgICAgICAgIGlm
ICggZW5kIDw9IGtlcm5lbF9zdGFydCB8fCBzdGFydCA+PSBrZXJuZWxfZW5kICkKPiA+ICsgICAg
ICAgICAgICA7IC8qIE5vIG92ZXJsYXAsIG5vdGhpbmcgdG8gZG8uICovCj4gPiArICAgICAgICAv
KiBEZWFsIHdpdGggdGhlIGtlcm5lbCBhbHJlYWR5IGJlaW5nIGxvYWRlZCBpbiB0aGUgcmVnaW9u
LiAqLwo+ID4gKyAgICAgICAgZWxzZSBpZiAoIGtlcm5lbF9zdGFydCA8PSBzdGFydCAmJiBrZXJu
ZWxfZW5kID4gc3RhcnQgKQo+IAo+IFNpbmNlLCBhY2NvcmRpbmcgdG8geW91ciByZXBseSBvbiB2
MSwgW2tlcm5lbF9zdGFydCxrZXJuZWxfZW5kKSBpcwo+IGEgc3Vic2V0IG9mIFtzdGFydCxlbmQp
LCBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgPD0gY291bGQgZXF1YWxseQo+IHdlbGwgYmUgPT0gLSBk
byB5b3UgYWdyZWU/IEZyb20gdGhpcyB0aGVuIC4uLgo+IAo+ID4gKyAgICAgICAgICAgIC8qIFRy
dW5jYXRlIHRoZSBzdGFydCBvZiB0aGUgcmVnaW9uLiAqLwo+ID4gKyAgICAgICAgICAgIHN0YXJ0
ID0gUk9VTkRVUChrZXJuZWxfZW5kLCBQQUdFX1NJWkUpOwo+ID4gKyAgICAgICAgZWxzZSBpZiAo
IGtlcm5lbF9zdGFydCA8PSBlbmQgJiYga2VybmVsX2VuZCA+IGVuZCApCj4gCj4gLi4uIGl0IGZv
bGxvd3MgdGhhdCB5b3Ugbm93IGhhdmUgdHdvIG9mZi1ieS0xcyBoZXJlLCBhcyB5b3UgY2hhbmdl
ZAo+IHRoZSByaWdodCBzaWRlIG9mIHRoZSAmJiBpbnN0ZWFkIG9mIHRoZSBsZWZ0IG9uZSAodGhl
IHJpZ2h0IHNpZGUKPiBjb3VsZCwgYXMgcGVyIGFib3ZlLCB1c2UgPT0gYWdhaW4pLiBVc2luZyA9
PSBpbiBib3RoIHBsYWNlcyB3b3VsZCwKPiBpbiBsaWV1IG9mIGEgY29tbWVudCwgaW1vIG1ha2Ug
bW9yZSB2aXNpYmxlIHRvIHRoZSByZWFkZXIgdGhhdAo+IHRoZXJlIGlzIHRoaXMgc3ViLXJhbmdl
IHJlbGF0aW9uc2hpcCBiZXR3ZWVuIGJvdGggcmFuZ2VzLgoKUmlnaHQsIEkgYWdyZWUgdG8gYm90
aCB0aGUgYWJvdmUgYW5kIGhhdmUgYWRqdXN0ZWQgdGhlIGNvbmRpdGlvbnMuCgo+ID4gKyAgICAg
ICAgICAgIC8qIFRydW5jYXRlIHRoZSBlbmQgb2YgdGhlIHJlZ2lvbi4gKi8KPiA+ICsgICAgICAg
ICAgICBlbmQgPSBrZXJuZWxfc3RhcnQ7Cj4gPiArICAgICAgICAvKiBQaWNrIHRoZSBiaWdnZXN0
IG9mIHRoZSBzcGxpdCByZWdpb25zLiAqLwo+IAo+IFRoZW4gYWdhaW4gLSB3b3VsZG4ndCB0aGlz
IHBhcnQgc3VmZmljZT8gaWYgc3RhcnQgPT0ga2VybmVsX3N0YXJ0Cj4gb3IgZW5kID09IGtlcm5l
bF9lbmQsIG9uZSBzaWRlIG9mIHRoZSAic3BsaXQiIHJlZ2lvbiB3b3VsZCBzaW1wbHkKPiBiZSBl
bXB0eS4KClRoYXQncyB3aHkgaXQncyB1c2luZyBhbiBlbHNlIGlmIGNvbnN0cnVjdCwgc28gdGhh
dCB3ZSBvbmx5IGdldApoZXJlIGlmIHRoZSBrZXJuZWwgaXMgbG9hZGVkIGluIHRoZSBtaWRkbGUg
b2YgdGhlIHJlZ2lvbiwgYW5kIHRoZXJlCmFyZSB0d28gcmVnaW9ucyBsZWZ0IGFzIHBhcnQgb2Yg
dGhlIHNwbGl0LgoKPiAKPiA+ICsgICAgICAgIGVsc2UgaWYgKCBrZXJuZWxfc3RhcnQgLSBzdGFy
dCA+IGVuZCAtIGtlcm5lbF9lbmQgKQo+ID4gKyAgICAgICAgICAgIGVuZCA9IGtlcm5lbF9zdGFy
dDsKPiA+ICsgICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICBzdGFydCA9IFJPVU5EVVAoa2Vy
bmVsX2VuZCwgUEFHRV9TSVpFKTsKPiA+ICsKPiA+ICsgICAgICAgIGlmICggZW5kIC0gc3RhcnQg
Pj0gc2l6ZSApCj4gPiArICAgICAgICAgICAgcmV0dXJuIHN0YXJ0Owo+ID4gKyAgICB9Cj4gPiAr
Cj4gPiArICAgIHJldHVybiBJTlZBTElEX1BBRERSOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMg
aW50IF9faW5pdCBwdmhfbG9hZF9rZXJuZWwoc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgbW9kdWxl
X3QgKmltYWdlLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIGltYWdlX2hlYWRyb29tLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtb2R1bGVfdCAqaW5pdHJkLCB2b2lkICppbWFnZV9iYXNlLAo+ID4gQEAgLTU0Niw3ICs1
ODUsMjQgQEAgc3RhdGljIGludCBfX2luaXQgcHZoX2xvYWRfa2VybmVsKHN0cnVjdCBkb21haW4g
KmQsIGNvbnN0IG1vZHVsZV90ICppbWFnZSwKPiA+ICAgICAgICAgIHJldHVybiByYzsKPiA+ICAg
ICAgfQo+ID4gIAo+ID4gLSAgICBsYXN0X2FkZHIgPSBST1VORFVQKHBhcm1zLnZpcnRfa2VuZCAt
IHBhcm1zLnZpcnRfYmFzZSwgUEFHRV9TSVpFKTsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogRmlu
ZCBhIFJBTSByZWdpb24gYmlnIGVub3VnaCAoYW5kIHRoYXQgZG9lc24ndCBvdmVybGFwIHdpdGgg
dGhlIGxvYWRlZAo+ID4gKyAgICAgKiBrZXJuZWwpIGluIG9yZGVyIHRvIGxvYWQgdGhlIGluaXRy
ZCBhbmQgdGhlIG1ldGFkYXRhLiBOb3RlIGl0IGNvdWxkIGJlCj4gPiArICAgICAqIHNwbGl0IGlu
dG8gc21hbGxlciBhbGxvY2F0aW9ucywgZG9uZSBpdCBhcyBhIHNpbmdsZSByZWdpb24gaW4gb3Jk
ZXIgdG8KPiA+ICsgICAgICogc2ltcGxpZnkgaXQuCj4gCj4gSSBndWVzcyBlaXRoZXIgImRvbmUi
IHdpdGhvdXQgIml0IiBvciAiZG9pbmcgaXQiPwoKRml4ZWQsIHRoYW5rcy4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
