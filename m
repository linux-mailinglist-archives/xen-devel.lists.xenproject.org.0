Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AD716EA9B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 16:54:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6cTS-0005cA-2j; Tue, 25 Feb 2020 15:50:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UvFY=4N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6cTQ-0005c5-Br
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 15:50:16 +0000
X-Inumbo-ID: 839a1f2a-57e6-11ea-aba8-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 839a1f2a-57e6-11ea-aba8-bc764e2007e4;
 Tue, 25 Feb 2020 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582645815;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rEkh8SIKPqCte173SI5BmIBD675y7jldsxGgTkUVrwc=;
 b=JdtY7BwIfXu4COKIG6xXTqz+qwxT/Ucsap91iEr1mrVF/ATr1tR6oNKT
 jwYQ+TQl6W4Qt07nXF8nXUI4khS/Da1lJDoIM2R6klu+9x138m9AjekWL
 tQgGQpgydTUBAdGZvLb9PHT7QdDwV1nu133I+GKdzmEfoh1hrvwH0ft8X E=;
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
IronPort-SDR: t+V/ccv9d304fVjgxOp3wTX03Ghfg+rrJZ6UI2H8pkWoRBE5y9dd4fwaJcSWxiv4IG7WV9R/ZH
 ZBuecNRCg3bsYWk3bNOKdm6Rs2ahQz4w92+x7pdBdm7+pyVnGPAJ0pHrm6DH1YnIi8oHd54eIG
 hURBNEYf07CGkYnUYyMlwCfSZ8+2yaz9npQl1ZTfl96H9/InxSAZx8j9eTFpi3iUHYPKhlHEfJ
 tBJQybBZwxXq/lMQH00JDSe4KpRws14I80hbWtVeUbImT9OYjDQFdRbC7VnBViaI4y5J6O0KY6
 S+g=
X-SBRS: 2.7
X-MesageID: 13606303
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,484,1574139600"; d="scan'208";a="13606303"
Date: Tue, 25 Feb 2020 16:50:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200225155006.GA24163@Air-de-Roger.citrite.net>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <f412712d-6181-6efd-f6be-ed2bdcf243ed@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f412712d-6181-6efd-f6be-ed2bdcf243ed@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMDQ6MTI6NTZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjQuMDIuMjAyMCAwOTo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOj4gLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9hdG9taWMuaAo+ID4gQEAgLTIyNCw2ICsyMjQsMTQgQEAgc3RhdGljIGlubGluZSBpbnQgYXRv
bWljX2FkZF91bmxlc3MoYXRvbWljX3QgKnYsIGludCBhLCBpbnQgdSkKPiA+ICAgICAgcmV0dXJu
IGM7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhdG9taWNfYW5kKHVuc2ln
bmVkIGludCBtLCBhdG9taWNfdCAqdikKPiA+ICt7Cj4gPiArICAgIGFzbSB2b2xhdGlsZSAoCj4g
PiArICAgICAgICAibG9jazsgYW5kbCAlMSwlMCIKPiAKPiBJIHJlYWxpemUgdGhpcyBpcyBpbiBz
eW5jIHdpdGggb3RoZXIgYXRvbWljXyooKSwgYnV0IEknZCBwcmVmZXIgaWYKPiB0aGUgc3RyYXkg
c2VtaWNvbG9uIGFmdGVyICJsb2NrIiB3YXMgZHJvcHBlZC4gV2l0aG91dCBpdCB0aGUKPiBhc3Nl
bWJsZXIgY2FuIGFjdHVhbGx5IGRpYWdub3NlIGEgYmFkIHVzZSAodGhlIGRlc3RpbmF0aW9uIG5v
dAo+IGJlaW5nIGEgbWVtb3J5IG9wZXJhbmQpLiBJJ20gdW5hd2FyZSBvZiByZWFzb25zIHdoeSB0
aGUgc2VtaWNvbG9ucwo+IHdvdWxkIGhhdmUgYmVlbiBwdXQgdGhlcmUuCj4gCj4gPiArICAgICAg
ICA6ICI9bSIgKCoodm9sYXRpbGUgaW50ICopJnYtPmNvdW50ZXIpCj4gPiArICAgICAgICA6ICJp
ciIgKG0pLCAibSIgKCoodm9sYXRpbGUgaW50ICopJnYtPmNvdW50ZXIpICk7Cj4gCj4gU2ltaWxh
cmx5IGRlc3BpdGUgaXRzIHVzZSBlbHNld2hlcmUgSSdtIGFmcmFpZCAiaSIgaXMgbm90IHRoZSBi
ZXN0Cj4gY2hvaWNlIGhlcmUgZm9yIHRoZSBjb25zdHJhaW50LiBUb2dldGhlciB3aXRoIHN3aXRj
aGluZyB0byBwbGFpbgo+IGludCBhcyB0aGUgZnVuY3Rpb24ncyBmaXJzdCBwYXJhbWV0ZXIgdHlw
ZSwgImUiIHdvdWxkIHNlZW0gYmV0dGVyCj4gZXZlbiBpZiB0aGUgZGlmZmVyZW5jZSB3b3VsZCBv
bmx5IG1hbmlmZXN0IGZvciBhdG9taWM2NF90LgoKV2VsbCwgImUiIGlzIGluZGVlZCBzcGVjaWZp
YyB0byB4ODYgMzJiaXQgaW50ZWdlcnMsIGJ1dCBzaW5jZSB3ZSBhcmUKYWxyZWFkeSB1c2luZyAi
YW5kbCIgSSBndWVzcyB1c2luZyAiaSIgaXMgZXF1YWxseSBmaW5lPwoKSSBkb24ndCBoYXZlIGEg
cHJlZmVyZW5jZSByZWFsbHksIHNvIGlmIHlvdSBwcmVmZXIgImUiIEknbSBmaW5lIHRvCmhhdmUg
aXQgY2hhbmdlZC4KCj4gQXMgdG8KPiB0aGUgY2hvaWNlIG9mIHBhcmFtZXRlciB0eXBlLCBMaW51
eCB0b28gdXNlcyBwbGFpbiBpbnQsIHNvIHdoaWxlCj4gSSBhZ3JlZSB3aXRoIHlvdXIgcmVhc29u
aW5nIEkgdGhpbmsgSSBhbHNvIGFncmVlIHdpdGggSnVsaWVuIHRvCj4gdXNlIHBsYWluIGludCBo
ZXJlIGZvciBjb25zaXN0ZW5jeS4KCkFjay4KCj4gRmluYWxseSwgeWV0IGFub3RoZXIgaW1wcm92
ZW1lbnQgb3ZlciBleGlzdGluZyBjb2RlIHdvdWxkIGJlIHRvCj4gdXNlIGp1c3QgYSBzaW5nbGUg
b3V0cHV0ICIrbSIsIHdpdGggbm8gcGFyYWxsZWxpbmcgaW5wdXQgIm0iLgoKT2gsIHN1cmUuCgo+
IFdpdGggdGhlIGZpcnN0IGFuZCBsYXN0LCBidXQgbm90IG5lY2Vzc2FyaWx5IHRoZSBtaWRkbGUg
b25lIHRha2VuCj4gY2FyZSBvZiAoYW5kIEknZCBiZSBoYXBweSB0byB0YWtlIGNhcmUgb2YgdGhl
bSB3aGlsZSBjb21taXR0aW5nKQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gSWYsIG90b2gsIHlvdSBkaXNhZ3JlZSBvbiBzb21lLCB0aGVuIGxldCdzIHNl
ZSB3aGVyZSB3ZSBjYW4KPiBmaW5kIGNvbW1vbiBncm91bmRzLgoKVGhhbmtzLCB0aGF0J3MgZmlu
ZSwgcGxlYXNlIHRha2UgY2FyZSB3aGlsZSBjb21taXR0aW5nIGlmIHlvdSBkb24ndAptaW5kLgoK
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
