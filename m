Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57712B577
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 15:58:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikr2D-00016o-MK; Fri, 27 Dec 2019 14:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F8X0=2R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ikr2C-00016i-3z
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 14:56:12 +0000
X-Inumbo-ID: 0080cb22-28b9-11ea-88e7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0080cb22-28b9-11ea-88e7-bc764e2007e4;
 Fri, 27 Dec 2019 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577458563;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aHNu9xL4Fi/VUxzhGvAFNAaR9/rxB02DoF+2fMqdyZk=;
 b=iN5iLJjZMNwCAbS367HVms6q3TSBZoMzNODsmRCtFERRcwaK6i+f62+j
 II+pKGwCm2Ztcg5jGoztOa0gEIV+IDaOu4vKvb6SdAM40XE0LGNxpjRjF
 RqHVifrDCMOrmWHSx/SHf8MOL4M0l1ny1Ij2Ke21ae15Vrev9FNI3blAh Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K9Ic9WmGyR1UQEzbKgaJg4+Is5TBU+nbfwg+9VAo6mVucpb4pAC+hy/7FUr13DNvCYHri5wYTz
 LsyDbyJmLJDq1kNGqXo/D92+NKaUujcuLoV0ScSVR+6tMvGGk2wwAcuYEPEVpyMxGxs6SLlx0s
 txa6DTIIiD7Z9zXfww7NFl7Cg8Uj97Hsx318uNAklTNe3toBJsQK83Shb2DcQTtMlpETHJ1gkf
 LcVzl96FS+ClIhR2VSxcocJ7OkvBhbIF//oXqjW0zZv+qrECcetQH/Y7FqiRxxdisTyMeSL04a
 dM8=
X-SBRS: 2.7
X-MesageID: 10782656
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10782656"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20191224132616.47441-1-roger.pau@citrix.com>
 <20191224132616.47441-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d48c1ebe-6e0d-68b0-c493-cb7b9172ea1c@citrix.com>
Date: Fri, 27 Dec 2019 14:55:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191224132616.47441-3-roger.pau@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/tlb: use Xen L0 assisted TLB flush
 when available
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQvMTIvMjAxOSAxMzoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFVzZSBYZW4ncyBM
MCBIVk1PUF9mbHVzaF90bGJzIGh5cGVyY2FsbCB3aGVuIGF2YWlsYWJsZSBpbiBvcmRlciB0bwo+
IHBlcmZvcm0gZmx1c2hlcy4gVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVyZm9ybWFuY2Ug
b2YgdGxiIGZsdXNoZXMKPiB3aGVuIHJ1bm5pbmcgd2l0aCBhIGhpZ2ggYW1vdW50IG9mIHZDUFVz
IGFzIGEgWGVuIGd1ZXN0LCBhbmQgaXMKPiBzcGVjaWFsbHkgaW1wb3J0YW50IHdoZW4gcnVubmlu
ZyBpbiBzaGltIG1vZGUuCj4KPiBUaGUgZm9sbG93aW5nIGZpZ3VyZXMgYXJlIGZyb20gYSBQViBn
dWVzdCBydW5uaW5nIGBtYWtlIC1qMzQyIHhlbmAgaW4KPiBzaGltIG1vZGUgd2l0aCAzMiB2Q1BV
cy4KPgo+IFVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNob3J0aGFuZDoKPiByZWFsCTRtMzUuOTcz
cwo+IHVzZXIJNG0zNS4xMTBzCj4gc3lzCTM2bTI0LjExN3MKPgo+IFVzaW5nIEwwIGFzc2lzdGVk
IGZsdXNoOgo+IHJlYWwJMW0xNy4zOTFzCj4gdXNlcgk0bTQyLjQxM3MKPiBzeXMJNm0yMC43NzNz
CgpOaWNlIHN0YXRzLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAg
IHwgMTEgKysrKysrKysrKysKPiAgeGVuL2FyY2gveDg2L3NtcC5jICAgICAgICAgICAgICB8ICA2
ICsrKysrKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIHwgIDcgKysrKysrKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwo+
IGluZGV4IDZkYmM1Zjk1M2YuLmU2NDkzY2FlY2YgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L2d1ZXN0L3hlbi94ZW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKPiBA
QCAtMjgxLDYgKzI4MSwxNyBAQCBpbnQgeGdfZnJlZV91bnVzZWRfcGFnZShtZm5fdCBtZm4pCj4g
ICAgICByZXR1cm4gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKG1lbSwgbWZuX3gobWZuKSwgbWZuX3go
bWZuKSk7Cj4gIH0KPiAgCj4gK2ludCB4Z19mbHVzaF90bGJzKHZvaWQpCj4gK3sKPiArICAgIGlu
dCByYzsKPiArCj4gKyAgICBkbyB7Cj4gKyAgICAgICAgcmMgPSB4ZW5faHlwZXJjYWxsX2h2bV9v
cChIVk1PUF9mbHVzaF90bGJzLCBOVUxMKTsKPiArICAgIH0gd2hpbGUgKCByYyA9PSAtRVJFU1RB
UlQgKTsKCkVSRVNUQVJUIHNob3VsZCBuZXZlciBtYW5pZmVzdCBsaWtlIHRoaXMsIGJlY2F1c2Ug
aXQgaXMgdGFrZW4gY2FyZSBvZgp3aXRoaW4gdGhlIGh5cGVyY2FsbF9wYWdlW10gc3R1Yi7CoCBB
bnl0aGluZyBlbHNlIGlzIGEgYnVnIHdoaWNoIG5lZWRzCmZpeGluZyBhdCBMMC4KCkhhdmUgeW91
IGFjdHVhbGx5IHNlZW4gb25lIGFwcGVhcmluZz8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
