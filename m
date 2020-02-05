Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27C15291A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 11:26:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izHqo-00059T-UO; Wed, 05 Feb 2020 10:24:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwEA=3Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izHqn-00059K-BE
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 10:24:05 +0000
X-Inumbo-ID: a1ddd692-4801-11ea-90bc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1ddd692-4801-11ea-90bc-12813bfff9fa;
 Wed, 05 Feb 2020 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580898243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N2U84DJLA/PaR+CwIjLUHddhAA8u/AE8ZHCEu0dhP8E=;
 b=CZeIg9iJ3tr4E5xp9jck9AJAtIUiTM4C63KDcHi6Sv8M6QkH+U//bNZ6
 WYhKhPFRXt8ioznd+k+5k9PvtF0691YwgBHoWpMybo2N8hExLbafhgMWL
 0m4EOGFjfSBNWsynrqiOHQsaDBVxCBilgzIYRpJDHip1Jo31mo84+MHNy U=;
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
IronPort-SDR: p243lPSTLUY0oYiYMdRPTsPt9Z1B+8UgCYJ7vntySGOuoZp6o35P+YA5EQmn8pS72jmgRNB9V8
 Rzd12pC0SWrws3zJp5i1v7pS4isEua0sGi/kB2YZNnbeGyGF0rzu6OcgWQ6sQisbSG+6iS6rNq
 j7qRtxmGE8rzfw2Z98q0suGOGqc9vQIE2TwIWf0+9COwO6om+IlwUsTBe+EO/ts2oruCF7Kunz
 z1JawX7MYzr89V/iM8RyYKqc6baKOTjjVkUsGc6mY7nXJTbH970beujluOcg74tQ2skqGdTMUh
 mKQ=
X-SBRS: 2.7
X-MesageID: 12342784
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="12342784"
Date: Wed, 5 Feb 2020 11:23:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200205102356.GQ4679@Air-de-Roger>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
 <20200203124127.GV4679@Air-de-Roger>
 <fe191f7a-b902-19a3-e4c8-ace8c02319c6@eikelenboom.it>
 <20200203132108.GW4679@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203132108.GW4679@Air-de-Roger>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8KCk9uIE1vbiwgRmViIDAzLCAyMDIwIGF0IDAyOjIxOjA4UE0gKzAxMDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6NDQ6MDZQTSArMDEw
MCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+ID4gT24gMDMvMDIvMjAyMCAxMzo0MSwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6MzA6
NTVQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+ID4gPj4gT24gMDMvMDIvMjAy
MCAxMzoyMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4+PiBPbiBNb24sIEZlYiAwMywg
MjAyMCBhdCAwOTozMzo1MUFNICswMTAwLCBTYW5kZXIgRWlrZWxlbmJvb20gd3JvdGU6Cj4gPiA+
Pj4+IEhpIFJvZ2VyLAo+ID4gPj4+Pgo+ID4gPj4+PiBMYXN0IHdlZWsgSSBlbmNvdW50ZXJlZCBh
biBpc3N1ZSB3aXRoIHRoZSBQQ0ktcGFzc3Rocm91Z2ggb2YgYSBVU0IgY29udHJvbGxlci4gCj4g
PiA+Pj4+IEluIHRoZSBndWVzdCBJIGdldDoKPiA+ID4+Pj4gICAgIFsgMTE0My4zMTM3NTZdIHho
Y2lfaGNkIDAwMDA6MDA6MDUuMDogeEhDSSBob3N0IG5vdCByZXNwb25kaW5nIHRvIHN0b3AgZW5k
cG9pbnQgY29tbWFuZC4KPiA+ID4+Pj4gICAgIFsgMTE0My4zMzQ4MjVdIHhoY2lfaGNkIDAwMDA6
MDA6MDUuMDogeEhDSSBob3N0IGNvbnRyb2xsZXIgbm90IHJlc3BvbmRpbmcsIGFzc3VtZSBkZWFk
Cj4gPiA+Pj4+ICAgICBbIDExNDMuMzQ3MzY0XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6IEhDIGRp
ZWQ7IGNsZWFuaW5nIHVwCj4gPiA+Pj4+ICAgICBbIDExNDMuMzU2NDA3XSB1c2IgMS0yOiBVU0Ig
ZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAyCj4gPiA+Pj4+Cj4gPiA+Pj4+IEJpc2VjdGlvbiB0
dXJuZWQgdXAgYXMgdGhlIGN1bHByaXQ6IAo+ID4gPj4+PiAgICBjb21taXQgNTUwMGQyNjVhMmE4
ZmE2M2Q2MGMwOGJlYjU0OWRlOGVjODJmZjdhNQo+ID4gPj4+PiAgICB4ODYvc21wOiB1c2UgQVBJ
QyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4gcG9zc2libGUKPiA+ID4+Pgo+ID4g
Pj4+IFNvcnJ5IHRvIGhlYXIgdGhhdCwgbGV0IHNlZSBpZiB3ZSBjYW4gZmlndXJlIG91dCB3aGF0
J3Mgd3JvbmcuCj4gPiA+Pgo+ID4gPj4gTm8gcHJvYmxlbSwgdGhhdCBpcyB3aHkgSSB0ZXN0IHN0
dWZmIDopCj4gPiA+Pgo+ID4gPj4+PiBJIHZlcmlmaWVkIGJ5IHJldmVydGluZyB0aGF0IGNvbW1p
dCBhbmQgbm93IGl0IHdvcmtzIGZpbmUgYWdhaW4uCj4gPiA+Pj4KPiA+ID4+PiBEb2VzIHRoZSBz
YW1lIGNvbnRyb2xsZXIgd29yayBmaW5lIHdoZW4gdXNlZCBpbiBkb20wPwo+ID4gPj4KPiA+ID4+
IFdpbGwgdGVzdCB0aGF0LCBidXQgYXMgYWxsIG90aGVyIHBjaSBkZXZpY2VzIGluIGRvbTAgd29y
ayBmaW5lLAo+ID4gPj4gSSBhc3N1bWUgdGhpcyBjb250cm9sbGVyIHdvdWxkIGFsc28gd29yayBm
aW5lIGluIGRvbTAgKGFzIGl0IGhhcyBhbHNvCj4gPiA+PiB3b3JrZWQgZmluZSBmb3IgYWdlcyB3
aXRoIFBDSS1wYXNzdGhyb3VnaCB0byB0aGF0IGd1ZXN0IGFuZCBzdGlsbCB3b3Jrcwo+ID4gPj4g
ZmluZSB3aGVuIHJldmVydGluZyB0aGUgcmVmZXJlbmNlZCBjb21taXQpLgo+ID4gPiAKPiA+ID4g
SXMgdGhpcyB0aGUgb25seSBkZXZpY2UgdGhhdCBmYWlscyB0byB3b3JrIHdoZW4gZG9pbmcgcGNp
LXBhc3N0aHJvdWdoLAo+ID4gPiBvciBvdGhlciBkZXZpY2VzIGFsc28gZG9uJ3Qgd29yayB3aXRo
IHRoZSBtZW50aW9uZWQgY2hhbmdlIGFwcGxpZWQ/Cj4gPiA+IAo+ID4gPiBIYXZlIHlvdSB0ZXN0
ZWQgb24gb3RoZXIgYm94ZXM/Cj4gPiA+IAo+ID4gPj4gSSBkb24ndCBrbm93IGlmIHlvdXIgY2hh
bmdlIGNhbiBzb21laG93IGhhdmUgYSBzaWRlIGVmZmVjdAo+ID4gPj4gb24gbGF0ZW5jeSBhcm91
bmQgdGhlIHByb2Nlc3Npbmcgb2YgcGNpLXBhc3N0aHJvdWdoID8KPiA+ID4gCj4gPiA+IEhtLCB0
aGUgbWVudGlvbmVkIGNvbW1pdCBzaG91bGQgc3BlZWQgdXAgYnJvYWRjYXN0IElQSXMsIGJ1dCBJ
IGRvbid0Cj4gPiA+IHNlZSBob3cgaXQgY291bGQgc2xvdyBkb3duIG90aGVyIGludGVycnVwdHMu
IEFsc28gSSB3b3VsZCB0aGluayB0aGUKPiA+ID4gZG9tYWluIGlzIG5vdCByZWNlaXZpbmcgaW50
ZXJydXB0cyBmcm9tIHRoZSBkZXZpY2UsIHJhdGhlciB0aGFuCj4gPiA+IGludGVycnVwdHMgYmVp
bmcgc2xvdy4KPiA+ID4gCj4gPiA+IENhbiB5b3UgYWxzbyBwYXN0ZSB0aGUgb3V0cHV0IG9mIGxz
cGNpIC12IGZvciB0aGF0IHhIQ0kgZGV2aWNlIGZyb20KPiA+ID4gZG9tMD8KPiA+ID4gCj4gPiA+
IFRoYW5rcywgUm9nZXIuCj4gPiAKPiA+IFdpbGwgZG8gdGhpcyBldmVuaW5nIGluY2x1ZGluZyB0
aGUgdGVzdGluZyBpbiBkb20wIGV0Yy4KPiA+IFdpbGwgYWxzbyBzZWUgaWYgdGhlcmUgaXMgYW55
IHBhdHRlcm4gd2hlbiBvYnNlcnZpbmcgL3Byb2MvaW50ZXJydXB0cyBpbgo+ID4gdGhlIGd1ZXN0
Lgo+IAo+IFRoYW5rcyEgSSBhbHNvIGhhdmUgc29tZSB0cml2aWFsIHBhdGNoIHRoYXQgSSB3b3Vs
ZCBsaWtlIHlvdSB0byB0cnksCj4ganVzdCB0byBkaXNjYXJkIHNlbmRfSVBJX21hc2sgY2xlYXJp
bmcgdGhlIHNjcmF0Y2hfY3B1bWFzayB1bmRlcgo+IGFub3RoZXIgZnVuY3Rpb24gZmVldC4KPiAK
PiBSb2dlci4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcC5jIGIveGVuL2Fy
Y2gveDg2L3NtcC5jCj4gaW5kZXggNjVlYjdjYmRhOC4uYWVlYjUwNjE1NSAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvc21wLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc21wLmMKPiBAQCAtNjYs
NyArNjYsOCBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hv
cnRjdXQsIGludCB2ZWN0b3IsCj4gIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3Qg
Km1hc2ssIGludCB2ZWN0b3IpCj4gIHsKPiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBmYWxzZTsK
PiAtICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7Cj4g
KyAgICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY3B1bWFza190LCBzZW5kX2lwaV9jcHVtYXNrKTsK
PiArICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9ICZ0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsK
PiAgCj4gICAgICAvKgo+ICAgICAgICogVGhpcyBjYW4gb25seSBiZSBzYWZlbHkgdXNlZCB3aGVu
IG5vIENQVSBob3RwbHVnIG9yIHVucGx1ZyBvcGVyYXRpb25zCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
