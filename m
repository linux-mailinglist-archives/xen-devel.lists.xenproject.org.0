Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041D15818F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 13:29:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgSZH-0001XT-Pf; Thu, 27 Jun 2019 11:27:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bCrz=U2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgSZG-0001XN-Ih
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 11:27:54 +0000
X-Inumbo-ID: 982d1050-98ce-11e9-8a68-d74d6470d0f2
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 982d1050-98ce-11e9-8a68-d74d6470d0f2;
 Thu, 27 Jun 2019 11:27:50 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zcoSlxL0xyVPtZJzarfmQvnqHOEIoiINs7yTaScMNnlg9NRiAjJ3X7bZtyAKMMZtX66myftezm
 x2qd3J2Y0eNI/2bBA5B3aCx+EpEa+ERetAqOPb++OO8wekM91cdk9kiSIVCn4IcFjF7ICuojWU
 ATldFkP4my7XY2lkZDASKMhWVR2x1ipg3UBypmjFuN/Qomr8NFrKwRXuzhRtWlpPJwQx3yg5K0
 E8NEGF0mZp2g1fPnpdU38m179RmlNV9piagNoYkBAFnkOL47343nJk5ttLhEB/rh0FKoBe09Mv
 pvY=
X-SBRS: 2.7
X-MesageID: 2316212
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2316212"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <a258e2ad-d024-33f4-c4ba-edd777d3683f@citrix.com>
 <20190627110723.uawqqg7qd4tfyetv@MacBook-Air-de-Roger.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dd9ec129-84e9-64bc-d745-95689966b957@citrix.com>
Date: Thu, 27 Jun 2019 12:27:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190627110723.uawqqg7qd4tfyetv@MacBook-Air-de-Roger.local>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/linker: add a reloc section to
 ELF linker script
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
Cc: xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDYvMjAxOSAxMjowNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEp1
biAyNywgMjAxOSBhdCAxMTo1OTo0NkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAyNy8wNi8yMDE5IDEwOjMzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBpZiB0aGUgaHlw
ZXJ2aXNvciBoYXMgYmVlbiBidWlsdCB3aXRoIEVGSSBzdXBwb3J0IChpZTogbXVsdGlib290Miku
Cj4+PiBUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24gY29ycmVjdGx5
IGluIHRoZSBvdXRwdXQKPj4+IGJpbmFyeS4KPj4+Cj4+PiBOb3RlIHRoYXQgZm9yIHRoZSBFTEYg
b3V0cHV0IGZvcm1hdCB0aGUgLnJlbG9jIHNlY3Rpb24gaXMgbW92ZWQgYmVmb3JlCj4+PiAuYnNz
IGJlY2F1c2UgdGhlIGRhdGEgaXQgY29udGFpbnMgaXMgcmVhZC1vbmx5LCBzbyBpdCBiZWxvbmdz
IHdpdGggdGhlCj4+PiBvdGhlciBzZWN0aW9ucyBjb250YWluaW5nIHJlYWQtb25seSBkYXRhLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+PiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJJ20gc3RpbGwgY29uZnVzZWQgYXMgdG8gd2h5
IHdlIG5lZWQgdGhpcyBpbiB0aGUKPj4gZmlyc3QgcGxhY2UuCj4+Cj4+IFRoZSBFTEYgYnVpbGQg
aXMgbGlua2VkIHRvIGEgZml4ZWQgdmlydHVhbCBhZGRyZXNzLCBpcnJlc3BlY3RpdmUgb2YKPj4g
d2hldGhlciBncnViIGxvYWRzIGl0IHZpYSBNQjEgb3IgTUIyIGFuZC9vciB3aXRoIEVGSSBkZXRh
aWxzLgo+Pgo+PiBpLmUuIHRoZSBub24tRUZJIGJ1aWxkIHNob3VsZG4ndCBoYXZlIGFueSByZW1h
aW5pbmcgcmVsb2NhdGlvbnMgYnkgdGhlCj4+IHRpbWUgaXQgaXMgZnVsbHkgbGlua2VkLgo+Pgo+
PiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+IFJpZ2h0LCBidXQgdGhlcmUncyBjb2RlIHRo
YXQgZGVwZW5kcyBvbiB0aGUgc3ltYm9scyBkZWZpbmVkIGluIC5yZWxvYwo+IChfX2Jhc2VfcmVs
b2NzX3N0YXJ0L19fYmFzZV9yZWxvY3NfZW5kKSwgc28gdW5sZXNzIHRob3NlIHN5bWJvbHMgYXJl
Cj4gZGVmaW5lZCB0aGUgbGlua2VyIHdpbGwgdGhyb3cgYSBtaXNzaW5nIHN5bWJvbHMgZXJyb3Ig
b24gdGhlIGZpbmFsCj4gbGluayBzdGVwLgoKT2suwqAgSSBjYW4gY2VydGFpbmx5IGFjY2VwdCB0
aGF0IHRoaXMgaXMgaG93IHRoZSBjb2RlIGN1cnJlbnRseSBmdW5jdGlvbnMuCgo+IEkgY291bGQg
YWRkIC5yZWxvYyB0byB0aGUgZGlzY2FyZGVkIHNlY3Rpb25zIGxpc3QgYW5kIGNyZWF0ZSB0aGUK
PiBfX2Jhc2VfcmVsb2NzX3N0YXJ0IGFuZCBfX2Jhc2VfcmVsb2NzX2VuZCBzeW1ib2xzIG9uIHRo
ZSBsaW5rZXIgc2NyaXB0Cj4gbWF5YmUsIGJ1dCBJJ20gbm90IHN1cmUgdGhhdCdzIGFueSBiZXR0
ZXIgdGhhbiBqdXN0IGhhdmluZyB0aGUgZHVtbXkKPiAucmVsb2Mgc2VjdGlvbi4KPgo+IE9yIGFu
b3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGNvbXBpbGUgdGhlIHVuaXRzIHRoYXQgdXNlIHRob3Nl
IHN5bWJvbHMKPiB0d2ljZSwgb25lIGZvciB0aGUgRUxGIGJ1aWxkIGFuZCBvbmUgZm9yIHRoZSBQ
RSBidWlsZCwgYnV0IGFnYWluIHRoYXQKPiBkb2Vzbid0IHNlZW0gbXVjaCBiZXR0ZXIgSU1PLgoK
U28gdGhlIGJ1ZyBoZXJlIGlzIHRoYXQgZWZpX2FyY2hfcmVsb2NhdGVfaW1hZ2UoKSBpc24ndCBp
bnNpZGUgYW4gI2lmZGVmCkVGSSAob3IgaXMgaXQgWEVOX0JVSUxEX0VGST8pCgpBbmQgdGhlIHJl
YXNvbiAjaWZkZWYtaW5nIGl0IHdvbid0IHdvcmsgaXMgYmVjYXVzZSB3ZSBoYXZlIGEgc2luZ2xl
IHBhc3MKb2YgZXh0cmEgb2JqZWN0cyB0byBsaW5rIGludG8gdGhlIG1haW4gWGVuIHRvIGFkZCBF
Rkkgc3VwcG9ydC4KCkkgdGhpbmsgdGhlIHByb3BlciBsb25ndGVybSBmaXggaXMgdG8gaGF2ZSBD
T05GSUdfRUZJIChzdWl0YWJseSBndWFyZGVkCm9uIHRvb2xjaGFpbiBzdXBwb3J0KSwgc2VlaW5n
IGFzIGl0IGlzIGNvbW1vbiBhY3Jvc3Mgb3VyIHR3byBiaW5hcmllcywKYW5kIHRoZSBleHRyYSBi
aXRzIGZvciB0aGUgcmVhbCBFRkkgYnVpbGQgdGhlbiBiZWNvbWUgcmF0aGVyIHNtYWxsZXIuCgpI
b3dldmVyLCBpdCBpcyBkZWZpbml0ZWx5IG5vdCBmYWlyIHRvIGx1bXAgdGhpcyBmaXggb24geW91
IGZvciB0aGlzCnNlcmllcywgc28gZ2l2ZW4gYSBjb21tZW50IGV4cGxhaW5pbmcgdGhhdCB0aGlz
IGlzbid0IHVzZWQgaW4gdGhlIEVMRgpidWlsZCwgYnV0IG5lZWRzIHRvIGJlIHByZXNlbnQgZm9y
IGNvbXBhdGliaWxpdHkgd2l0aCB0aGUgRUZJIGJ1aWxkLApJJ2xsIGJlIG9rIHdpdGggdGhlIHBh
dGNoIGluIHRoaXMgZm9ybS4KCkFnYWluLCBhIGNvbW1lbnQgY2FuIGJlIGZpeGVkIHVwIG9uIGNv
bW1pdCBpZiBldmVyeW9uZSBpcyBoYXBweSB3aXRoCnRoaXMgYXBwcm9hY2guCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
