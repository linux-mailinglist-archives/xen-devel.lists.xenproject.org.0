Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3634A150719
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:23:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybfD-0006CY-6L; Mon, 03 Feb 2020 13:21:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iybfB-0006CJ-2p
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:21:17 +0000
X-Inumbo-ID: 0e17a0a2-4688-11ea-8396-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e17a0a2-4688-11ea-8396-bc764e2007e4;
 Mon, 03 Feb 2020 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580736076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VmHA0vTPQ+iq4xmSnGgHFswiCXOo9PfhZujI6+L1K5M=;
 b=HoWY/7gtoB+yJQLLrv+HUSDvu2zARzfE0M30z1kX6IA04vjHXHeMdeXi
 n5SPYJNBXAnqs8W1ZAqqTGYkvjCzH7gK8eV4vWot4Zplqj7+Ncbs9UYQ2
 zTQluXeY07qc2Ad+0xLB0tk5R44zMIRYdRdycR4dcYBKXdJW9ZzhxleHF w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C9AmXW5P69hW9u+sbL+OO3uesvj4VH7A1S3Wgi8J9nAwT8AcNzyzZm5dt1HeHKwbhU94pbKRCY
 duRB2FNjgJ9vkEXWCclAh5h/iE+/7hhgHvBXKgjnv/3G1NcnJo8xCnC+hNWnxGMTVdaQb8QhaZ
 1ralpdgMmOrzmcaTjBaCp/rCNTN7Zd4NBisgzMH8w//r6k+B07Z1fPs4svcOG22UlT8jfWHWla
 kzPX6eAS90UP7dcdcZIGz/RyP+itSiwuywCJA9w1M0ICrjpXiH5+kuOMk9ABXG0MC2VyaGp6f/
 RTs=
X-SBRS: 2.7
X-MesageID: 12017009
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12017009"
Date: Mon, 3 Feb 2020 14:21:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200203132108.GW4679@Air-de-Roger>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
 <20200203124127.GV4679@Air-de-Roger>
 <fe191f7a-b902-19a3-e4c8-ace8c02319c6@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe191f7a-b902-19a3-e4c8-ace8c02319c6@eikelenboom.it>
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

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6NDQ6MDZQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IE9uIDAzLzAyLzIwMjAgMTM6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBPbiBNb24sIEZlYiAwMywgMjAyMCBhdCAwMTozMDo1NVBNICswMTAwLCBTYW5kZXIgRWlr
ZWxlbmJvb20gd3JvdGU6Cj4gPj4gT24gMDMvMDIvMjAyMCAxMzoyMywgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+Pj4gT24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDk6MzM6NTFBTSArMDEwMCwg
U2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+ID4+Pj4gSGkgUm9nZXIsCj4gPj4+Pgo+ID4+Pj4g
TGFzdCB3ZWVrIEkgZW5jb3VudGVyZWQgYW4gaXNzdWUgd2l0aCB0aGUgUENJLXBhc3N0aHJvdWdo
IG9mIGEgVVNCIGNvbnRyb2xsZXIuIAo+ID4+Pj4gSW4gdGhlIGd1ZXN0IEkgZ2V0Ogo+ID4+Pj4g
ICAgIFsgMTE0My4zMTM3NTZdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogeEhDSSBob3N0IG5vdCBy
ZXNwb25kaW5nIHRvIHN0b3AgZW5kcG9pbnQgY29tbWFuZC4KPiA+Pj4+ICAgICBbIDExNDMuMzM0
ODI1XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6IHhIQ0kgaG9zdCBjb250cm9sbGVyIG5vdCByZXNw
b25kaW5nLCBhc3N1bWUgZGVhZAo+ID4+Pj4gICAgIFsgMTE0My4zNDczNjRdIHhoY2lfaGNkIDAw
MDA6MDA6MDUuMDogSEMgZGllZDsgY2xlYW5pbmcgdXAKPiA+Pj4+ICAgICBbIDExNDMuMzU2NDA3
XSB1c2IgMS0yOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAyCj4gPj4+Pgo+ID4+Pj4g
QmlzZWN0aW9uIHR1cm5lZCB1cCBhcyB0aGUgY3VscHJpdDogCj4gPj4+PiAgICBjb21taXQgNTUw
MGQyNjVhMmE4ZmE2M2Q2MGMwOGJlYjU0OWRlOGVjODJmZjdhNQo+ID4+Pj4gICAgeDg2L3NtcDog
dXNlIEFQSUMgQUxMQlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlCj4gPj4+
Cj4gPj4+IFNvcnJ5IHRvIGhlYXIgdGhhdCwgbGV0IHNlZSBpZiB3ZSBjYW4gZmlndXJlIG91dCB3
aGF0J3Mgd3JvbmcuCj4gPj4KPiA+PiBObyBwcm9ibGVtLCB0aGF0IGlzIHdoeSBJIHRlc3Qgc3R1
ZmYgOikKPiA+Pgo+ID4+Pj4gSSB2ZXJpZmllZCBieSByZXZlcnRpbmcgdGhhdCBjb21taXQgYW5k
IG5vdyBpdCB3b3JrcyBmaW5lIGFnYWluLgo+ID4+Pgo+ID4+PiBEb2VzIHRoZSBzYW1lIGNvbnRy
b2xsZXIgd29yayBmaW5lIHdoZW4gdXNlZCBpbiBkb20wPwo+ID4+Cj4gPj4gV2lsbCB0ZXN0IHRo
YXQsIGJ1dCBhcyBhbGwgb3RoZXIgcGNpIGRldmljZXMgaW4gZG9tMCB3b3JrIGZpbmUsCj4gPj4g
SSBhc3N1bWUgdGhpcyBjb250cm9sbGVyIHdvdWxkIGFsc28gd29yayBmaW5lIGluIGRvbTAgKGFz
IGl0IGhhcyBhbHNvCj4gPj4gd29ya2VkIGZpbmUgZm9yIGFnZXMgd2l0aCBQQ0ktcGFzc3Rocm91
Z2ggdG8gdGhhdCBndWVzdCBhbmQgc3RpbGwgd29ya3MKPiA+PiBmaW5lIHdoZW4gcmV2ZXJ0aW5n
IHRoZSByZWZlcmVuY2VkIGNvbW1pdCkuCj4gPiAKPiA+IElzIHRoaXMgdGhlIG9ubHkgZGV2aWNl
IHRoYXQgZmFpbHMgdG8gd29yayB3aGVuIGRvaW5nIHBjaS1wYXNzdGhyb3VnaCwKPiA+IG9yIG90
aGVyIGRldmljZXMgYWxzbyBkb24ndCB3b3JrIHdpdGggdGhlIG1lbnRpb25lZCBjaGFuZ2UgYXBw
bGllZD8KPiA+IAo+ID4gSGF2ZSB5b3UgdGVzdGVkIG9uIG90aGVyIGJveGVzPwo+ID4gCj4gPj4g
SSBkb24ndCBrbm93IGlmIHlvdXIgY2hhbmdlIGNhbiBzb21laG93IGhhdmUgYSBzaWRlIGVmZmVj
dAo+ID4+IG9uIGxhdGVuY3kgYXJvdW5kIHRoZSBwcm9jZXNzaW5nIG9mIHBjaS1wYXNzdGhyb3Vn
aCA/Cj4gPiAKPiA+IEhtLCB0aGUgbWVudGlvbmVkIGNvbW1pdCBzaG91bGQgc3BlZWQgdXAgYnJv
YWRjYXN0IElQSXMsIGJ1dCBJIGRvbid0Cj4gPiBzZWUgaG93IGl0IGNvdWxkIHNsb3cgZG93biBv
dGhlciBpbnRlcnJ1cHRzLiBBbHNvIEkgd291bGQgdGhpbmsgdGhlCj4gPiBkb21haW4gaXMgbm90
IHJlY2VpdmluZyBpbnRlcnJ1cHRzIGZyb20gdGhlIGRldmljZSwgcmF0aGVyIHRoYW4KPiA+IGlu
dGVycnVwdHMgYmVpbmcgc2xvdy4KPiA+IAo+ID4gQ2FuIHlvdSBhbHNvIHBhc3RlIHRoZSBvdXRw
dXQgb2YgbHNwY2kgLXYgZm9yIHRoYXQgeEhDSSBkZXZpY2UgZnJvbQo+ID4gZG9tMD8KPiA+IAo+
ID4gVGhhbmtzLCBSb2dlci4KPiAKPiBXaWxsIGRvIHRoaXMgZXZlbmluZyBpbmNsdWRpbmcgdGhl
IHRlc3RpbmcgaW4gZG9tMCBldGMuCj4gV2lsbCBhbHNvIHNlZSBpZiB0aGVyZSBpcyBhbnkgcGF0
dGVybiB3aGVuIG9ic2VydmluZyAvcHJvYy9pbnRlcnJ1cHRzIGluCj4gdGhlIGd1ZXN0LgoKVGhh
bmtzISBJIGFsc28gaGF2ZSBzb21lIHRyaXZpYWwgcGF0Y2ggdGhhdCBJIHdvdWxkIGxpa2UgeW91
IHRvIHRyeSwKanVzdCB0byBkaXNjYXJkIHNlbmRfSVBJX21hc2sgY2xlYXJpbmcgdGhlIHNjcmF0
Y2hfY3B1bWFzayB1bmRlcgphbm90aGVyIGZ1bmN0aW9uIGZlZXQuCgpSb2dlci4KLS0tCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvc21wLmMgYi94ZW4vYXJjaC94ODYvc21wLmMKaW5kZXggNjVl
YjdjYmRhOC4uYWVlYjUwNjE1NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9zbXAuYwpAQCAtNjYsNyArNjYsOCBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQ
SV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCiB2b2lkIHNlbmRf
SVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQogewogICAgIGJvb2wg
Y3B1c19sb2NrZWQgPSBmYWxzZTsKLSAgICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShz
Y3JhdGNoX2NwdW1hc2spOworICAgIHN0YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3QsIHNl
bmRfaXBpX2NwdW1hc2spOworICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9ICZ0aGlzX2NwdShzZW5k
X2lwaV9jcHVtYXNrKTsKIAogICAgIC8qCiAgICAgICogVGhpcyBjYW4gb25seSBiZSBzYWZlbHkg
dXNlZCB3aGVuIG5vIENQVSBob3RwbHVnIG9yIHVucGx1ZyBvcGVyYXRpb25zCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
