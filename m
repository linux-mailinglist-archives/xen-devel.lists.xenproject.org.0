Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9882D5BFA2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 17:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhy2x-0007JO-W5; Mon, 01 Jul 2019 15:16:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tezJ=U6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hhy2w-0007Ib-I3
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 15:16:46 +0000
X-Inumbo-ID: 3b2989b8-9c13-11e9-9749-8f13357dc36b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b2989b8-9c13-11e9-9749-8f13357dc36b;
 Mon, 01 Jul 2019 15:16:43 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cE/ZKYy6kyk20X3a0P24nHUoieYHn4/cZb+fZYcNJi8g7mGto3rDMFxYZGb/4vzEDw3bOgREoD
 cgcQvpVkeVG2EjQ81AuHd71xDK4XwQdyILC54c/oie9T9biZyagPJbiE/qrOrJcawNcQDWOuts
 b1IAOUB3d+X8CizSqJLmQkJTT3R7YEvBi8Y03h6uS1+p9pe8S4dLrlGIZCxYaig0AOSi67bb/G
 jpj9wl7XVk77ZUD63i6S+Uw0Ot8/02v3bnvV2z8z66Att+Jl0fwOZubUV6CbSjVlXuSe+iuXNJ
 nqw=
X-SBRS: 2.7
X-MesageID: 2466956
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,439,1557201600"; 
   d="scan'208";a="2466956"
Date: Mon, 1 Jul 2019 17:16:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190701151616.sk5tslyneueagmme@MacBook-Air-de-Roger.local>
References: <20190701104903.72364-1-roger.pau@citrix.com>
 <addf8b00-6c2e-56e3-d5f8-ec7e52291638@suse.com>
 <20190701140153.uy5frq2kgxijxolr@MacBook-Air-de-Roger.local>
 <3daac2b4-9373-cef5-e9d1-e5aea39c697a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3daac2b4-9373-cef5-e9d1-e5aea39c697a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xstate: make use_xsave non-init
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMDI6MjA6NTJQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDEuMDcuMjAxOSAxNjowMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBNb24sIEp1bCAwMSwgMjAxOSBhdCAxMTozOToxNkFNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwMS4wNy4yMDE5IDEyOjQ5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94c3RhdGUuYwo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYveHN0
YXRlLmMKPiA+Pj4gQEAgLTU3Nyw3ICs1NzcsNyBAQCB1bnNpZ25lZCBpbnQgeHN0YXRlX2N0eHRf
c2l6ZSh1NjQgeGNyMCkKPiA+Pj4gICAgLyogQ29sbGVjdCB0aGUgaW5mb3JtYXRpb24gb2YgcHJv
Y2Vzc29yJ3MgZXh0ZW5kZWQgc3RhdGUgKi8KPiA+Pj4gICAgdm9pZCB4c3RhdGVfaW5pdChzdHJ1
Y3QgY3B1aW5mb194ODYgKmMpCj4gPj4+ICAgIHsKPiA+Pj4gLSAgICBzdGF0aWMgYm9vbCBfX2lu
aXRkYXRhIHVzZV94c2F2ZSA9IHRydWU7Cj4gPj4+ICsgICAgc3RhdGljIGJvb2wgdXNlX3hzYXZl
ID0gdHJ1ZTsKPiA+Pgo+ID4+IFBsZWFzZSBhdHRhY2ggYXQgbGVhc3QgYSBicmllZiBjb21tZW50
IGhlcmUsIHN1Y2ggdGhhdCBwZW9wbGUKPiA+PiB3b24ndCBjb25zaWRlciB0aGUgX19pbml0ZGF0
YSBtaXNzaW5nLgo+ID4gCj4gPiBTdXJlLgo+ID4gCj4gPj4KPiA+PiBPZiBjb3Vyc2UgSSdkIGFj
dHVhbGx5IHByZWZlciB0aGUgYW5ub3RhdGlvbiB0byBzdGF5IGhlcmUgaW4KPiA+PiB0aGUgZ2Nj
IGNhc2UuIElpcmMgdGhlcmUgd2FzIG9uZSBvdGhlciBjYXNlIHdoZXJlIHRoZXJlIHdhcwo+ID4+
IHN1Y2ggYW4gaXNzdWU7IEkgZG9uJ3QgcmVjYWxsIHdoZXRoZXIgdGhlcmUgaXQgdG9vIGdvdCBk
ZWFsdAo+ID4+IHdpdGggYnkgcmVtb3ZpbmcgYW4gYW5ub3RhdGlvbi4KPiA+IAo+ID4gWWVzLCBp
biB0aGF0IG90aGVyIGNhc2UgdGhlIGFubm90YXRpb24gd2FzIGp1c3QgcmVtb3ZlZCwgaXQncyA0
M2ZhOTVhZSBbMF0KPiA+IAo+ID4+IEhvdyBhYm91dCB3ZSBpbnRyb2R1Y2UgYW4KPiA+PiBhbm5v
dGF0aW9uIHRoYXQgZXhwYW5kcyB0byBub3RoaW5nIGluIHRoZSBjbGFuZyBjYXNlLCBidXQKPiA+
PiBjb250aW51ZXMgdG8gcHJvdmlkZSB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IGZvciBnY2M/IFRo
YXQKPiA+PiB3b3VsZCB0aGVuIGFsc28gY2xhcmlmeSB0aGUgcmVhc29uIGZvciBpdCBiZWluZyBp
biBhbnkKPiA+PiBwYXJ0aWN1bGFyIHBsYWNlIChJIGd1ZXNzIHRoZXJlIGFyZSBnb2luZyB0byBi
ZSBtb3JlKSB3aXRob3V0Cj4gPj4gdGhlIG5lZWQgZm9yIGZ1cnRoZXIgY29tbWVudGFyeS4KPiA+
IAo+ID4gSU1PIHRoYXQncyBhIGxpdHRsZSBiaXQgZGFuZ2Vyb3VzLCBmcm9tIHRoZSBMTFZNIGJ1
ZyByZXBvcnQgaXQgc2VlbXMKPiA+IGxpa2UgTExWTSBiZWhhdmlvdXIgaXMgbm90IGEgYnVnLCBh
bmQgaGVuY2UgSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYKPiA+IG5ld2VyIHZlcnNpb25zIG9m
IGdjYyBhbHNvIGV4aGliaXQgdGhlIHNhbWUgaXNzdWUuCj4gCj4gT2theSwgdGhlbiBsZXQncyBn
byB0aGUgcm91dGUgeW91IHN1Z2dlc3RlZCwganVzdCB3aXRoIGEgY29tbWVudAo+IGFkZGVkIHRv
IHByZXZlbnQgcmUtYWRkaXRpb24gb2YgdGhlIGFubm90YXRpb24uIEkgd29uZGVyIHdoZXRoZXIK
PiB3ZSBvdWdodCB0byBkbyBhbiBhdWRpdCBvZiB0aGUgY29kZSB0byBmaW5kIHBvc3NpYmxlIGZ1
cnRoZXIKPiBvZmZlbmRlcnMuIEl0IGRvZXNuJ3QgbG9vayB2ZXJ5IGRlc2lyYWJsZSB0byBtZSB0
byBmaW5kIHRoZQo+IGluc3RhbmNlcyBvbmUgYnkgb25lIGJ5IHNvbWVvbmUgb2JzZXJ2aW5nIGNy
YXNoZXMuCj4gCj4gSG1tLCBoYXZpbmcgbG9va2VkIGF0IHRoZSBvbGRlciBjb21taXQgSSdtIGFn
YWluIHN0YXJ0aW5nIHRvIHdvbmRlcgo+IHdoZXRoZXIgZHJvcHBpbmcgdGhlIGFubm90YXRpb25z
IGlzIHRoZSByaWdodCBjb3Vyc2Ugb2YgYWN0aW9uLiBEaWQKPiB3ZSBjb25zaWRlciBhZGRpbmcg
dm9sYXRpbGUgdG8gdGhlIHZhcmlhYmxlIGJhY2sgdGhlbj8gVGhhdCBzaG91bGQKPiBtYWtlIHRo
ZSBjb21waWxlciBub3QgcHVsbCBhaGVhZCB0aGUgbWVtb3J5IGFjY2VzcyhlcyksIGFuZCB0aGUK
PiBkb3duc2lkZXMgb2YgdGhpcyBzaG91bGQgYmUgcHJldHR5IGxpbWl0ZWQgZm9yIGluaXQtb25s
eSBpdGVtcy4KCklJUkMgYXQgc29tZSBwb2ludCBJIHN1Z2dlc3RlZCB1c2luZyBBQ0NFU1NfT05D
RSB0byByZWFkIHRoZSBpbml0Cm9wdF9ib290c2NydWIgdmFyaWFibGUuIEFkZGluZyB0aGUgdm9s
YXRpbGUga2V5d29yZCB0byB0aGUgX19pbml0ZGF0YQptYWNybyBpcyBub3QgZ29pbmcgdG8gd29y
ayBhcy1pcywgYmVjYXVzZSB3ZSB3b3VsZCBhbHNvIG5lZWQgdG8gZml4dXAKdGhlIGV4aXN0aW5n
IGRlY2xhcmF0aW9ucyBvZiB0aGUgdmFyaWFibGVzLgoKQSBtb3JlIHNpbXBsZSAoYW5kIG1heWJl
IGVhc2llciB0byBlbmZvcmNlIHJ1bGUpIG1pZ2h0IGJlIHRvIGZvcmJpZAp0aGUgdXNhZ2Ugb2Yg
aW5pdCBkYXRhL3RleHQgaW4gbm9uLWluaXQgZnVuY3Rpb25zLCBhbmQgdGhhdCB3b3VsZApsaWtl
bHkgYmUgZWFzaWVyIHRvIGVuZm9yY2UgYXV0b21hdGljYWxseSBieSBzb21lIGFuYWx5c2lzIHRv
b2wuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
