Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEEC15299B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:05:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izISZ-0000th-5l; Wed, 05 Feb 2020 11:03:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QE2s=3Z=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1izISX-0000tY-ML
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:03:05 +0000
X-Inumbo-ID: 14211c5a-4807-11ea-90ca-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14211c5a-4807-11ea-90ca-12813bfff9fa;
 Wed, 05 Feb 2020 11:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qjWuJ792mXWzlQ8QKzHO7Mx02oH3Mm1zmA2N6TezKPY=; b=ELccjn0qRgB7xUowKTi8ERaMHg
 pxz5NkvZJX5hjyemEfV07uDU6sguNzD1iGUMbk+WdHBVJbd5Ar5AO2Vt0lUQmxkI99U0A1YnvG4lw
 c8myy0KPLFImjGtgiDfwkBvEbrPBBueDsL6CdwM/f2UdTpnIJobtR7htdA9ksD/1u0bY=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:3696
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1izIU6-0006TE-Md; Wed, 05 Feb 2020 12:04:42 +0100
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
 <20200203124127.GV4679@Air-de-Roger>
 <fe191f7a-b902-19a3-e4c8-ace8c02319c6@eikelenboom.it>
 <20200203132108.GW4679@Air-de-Roger> <20200205102356.GQ4679@Air-de-Roger>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <0952d329-f5f3-9215-5bab-76f45d21a482@eikelenboom.it>
Date: Wed, 5 Feb 2020 12:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200205102356.GQ4679@Air-de-Roger>
Content-Language: en-US
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

SGkgUm9nZXIsCgpTb3JyeSwgSSAgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZm9sbG93IHVwIG9uIHRl
c3RpbmcgeWV0LgooSSBoYXZlIHNvbWUgbG9uZ2VyIHJ1bm5pbmcgdGFzayBmb3Igd2hpY2ggSSBu
ZWVkIHNvbWUgc2VydmljZXMgb24gdGhlIGJveCwgCnNvIHRlc3RpbmcgYW5kIHJlYm9vdGluZyBp
cyBuZWVkZWQuKQpDb3VsZCBiZSB0b21vcnJvdywgYnV0IGNvdWxkIGFsc28gYmUgdGhpcyB3ZWVr
ZW5kIGJlZm9yZSBJIHdpbGwgY29tZSBhcm91bmQgdG8KdGhlIHRlc3RpbmcgYW5kIHJlcG9ydGlu
ZyBiYWNrLgoKLS0KU2FuZGVyCgoKT24gMDUvMDIvMjAyMCAxMToyMywgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBQaW5nPwo+IAo+IE9uIE1vbiwgRmViIDAzLCAyMDIwIGF0IDAyOjIxOjA4UE0g
KzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDAzLCAyMDIwIGF0
IDAxOjQ0OjA2UE0gKzAxMDAsIFNhbmRlciBFaWtlbGVuYm9vbSB3cm90ZToKPj4+IE9uIDAzLzAy
LzIwMjAgMTM6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gT24gTW9uLCBGZWIgMDMs
IDIwMjAgYXQgMDE6MzA6NTVQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+Pj4+
PiBPbiAwMy8wMi8yMDIwIDEzOjIzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+Pj4gT24g
TW9uLCBGZWIgMDMsIDIwMjAgYXQgMDk6MzM6NTFBTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5ib29t
IHdyb3RlOgo+Pj4+Pj4+IEhpIFJvZ2VyLAo+Pj4+Pj4+Cj4+Pj4+Pj4gTGFzdCB3ZWVrIEkgZW5j
b3VudGVyZWQgYW4gaXNzdWUgd2l0aCB0aGUgUENJLXBhc3N0aHJvdWdoIG9mIGEgVVNCIGNvbnRy
b2xsZXIuIAo+Pj4+Pj4+IEluIHRoZSBndWVzdCBJIGdldDoKPj4+Pj4+PiAgICAgWyAxMTQzLjMx
Mzc1Nl0geGhjaV9oY2QgMDAwMDowMDowNS4wOiB4SENJIGhvc3Qgbm90IHJlc3BvbmRpbmcgdG8g
c3RvcCBlbmRwb2ludCBjb21tYW5kLgo+Pj4+Pj4+ICAgICBbIDExNDMuMzM0ODI1XSB4aGNpX2hj
ZCAwMDAwOjAwOjA1LjA6IHhIQ0kgaG9zdCBjb250cm9sbGVyIG5vdCByZXNwb25kaW5nLCBhc3N1
bWUgZGVhZAo+Pj4+Pj4+ICAgICBbIDExNDMuMzQ3MzY0XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6
IEhDIGRpZWQ7IGNsZWFuaW5nIHVwCj4+Pj4+Pj4gICAgIFsgMTE0My4zNTY0MDddIHVzYiAxLTI6
IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDIKPj4+Pj4+Pgo+Pj4+Pj4+IEJpc2VjdGlv
biB0dXJuZWQgdXAgYXMgdGhlIGN1bHByaXQ6IAo+Pj4+Pj4+ICAgIGNvbW1pdCA1NTAwZDI2NWEy
YThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1Cj4+Pj4+Pj4gICAgeDg2L3NtcDogdXNlIEFQ
SUMgQUxMQlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlCj4+Pj4+Pgo+Pj4+
Pj4gU29ycnkgdG8gaGVhciB0aGF0LCBsZXQgc2VlIGlmIHdlIGNhbiBmaWd1cmUgb3V0IHdoYXQn
cyB3cm9uZy4KPj4+Pj4KPj4+Pj4gTm8gcHJvYmxlbSwgdGhhdCBpcyB3aHkgSSB0ZXN0IHN0dWZm
IDopCj4+Pj4+Cj4+Pj4+Pj4gSSB2ZXJpZmllZCBieSByZXZlcnRpbmcgdGhhdCBjb21taXQgYW5k
IG5vdyBpdCB3b3JrcyBmaW5lIGFnYWluLgo+Pj4+Pj4KPj4+Pj4+IERvZXMgdGhlIHNhbWUgY29u
dHJvbGxlciB3b3JrIGZpbmUgd2hlbiB1c2VkIGluIGRvbTA/Cj4+Pj4+Cj4+Pj4+IFdpbGwgdGVz
dCB0aGF0LCBidXQgYXMgYWxsIG90aGVyIHBjaSBkZXZpY2VzIGluIGRvbTAgd29yayBmaW5lLAo+
Pj4+PiBJIGFzc3VtZSB0aGlzIGNvbnRyb2xsZXIgd291bGQgYWxzbyB3b3JrIGZpbmUgaW4gZG9t
MCAoYXMgaXQgaGFzIGFsc28KPj4+Pj4gd29ya2VkIGZpbmUgZm9yIGFnZXMgd2l0aCBQQ0ktcGFz
c3Rocm91Z2ggdG8gdGhhdCBndWVzdCBhbmQgc3RpbGwgd29ya3MKPj4+Pj4gZmluZSB3aGVuIHJl
dmVydGluZyB0aGUgcmVmZXJlbmNlZCBjb21taXQpLgo+Pj4+Cj4+Pj4gSXMgdGhpcyB0aGUgb25s
eSBkZXZpY2UgdGhhdCBmYWlscyB0byB3b3JrIHdoZW4gZG9pbmcgcGNpLXBhc3N0aHJvdWdoLAo+
Pj4+IG9yIG90aGVyIGRldmljZXMgYWxzbyBkb24ndCB3b3JrIHdpdGggdGhlIG1lbnRpb25lZCBj
aGFuZ2UgYXBwbGllZD8KPj4+Pgo+Pj4+IEhhdmUgeW91IHRlc3RlZCBvbiBvdGhlciBib3hlcz8K
Pj4+Pgo+Pj4+PiBJIGRvbid0IGtub3cgaWYgeW91ciBjaGFuZ2UgY2FuIHNvbWVob3cgaGF2ZSBh
IHNpZGUgZWZmZWN0Cj4+Pj4+IG9uIGxhdGVuY3kgYXJvdW5kIHRoZSBwcm9jZXNzaW5nIG9mIHBj
aS1wYXNzdGhyb3VnaCA/Cj4+Pj4KPj4+PiBIbSwgdGhlIG1lbnRpb25lZCBjb21taXQgc2hvdWxk
IHNwZWVkIHVwIGJyb2FkY2FzdCBJUElzLCBidXQgSSBkb24ndAo+Pj4+IHNlZSBob3cgaXQgY291
bGQgc2xvdyBkb3duIG90aGVyIGludGVycnVwdHMuIEFsc28gSSB3b3VsZCB0aGluayB0aGUKPj4+
PiBkb21haW4gaXMgbm90IHJlY2VpdmluZyBpbnRlcnJ1cHRzIGZyb20gdGhlIGRldmljZSwgcmF0
aGVyIHRoYW4KPj4+PiBpbnRlcnJ1cHRzIGJlaW5nIHNsb3cuCj4+Pj4KPj4+PiBDYW4geW91IGFs
c28gcGFzdGUgdGhlIG91dHB1dCBvZiBsc3BjaSAtdiBmb3IgdGhhdCB4SENJIGRldmljZSBmcm9t
Cj4+Pj4gZG9tMD8KPj4+Pgo+Pj4+IFRoYW5rcywgUm9nZXIuCj4+Pgo+Pj4gV2lsbCBkbyB0aGlz
IGV2ZW5pbmcgaW5jbHVkaW5nIHRoZSB0ZXN0aW5nIGluIGRvbTAgZXRjLgo+Pj4gV2lsbCBhbHNv
IHNlZSBpZiB0aGVyZSBpcyBhbnkgcGF0dGVybiB3aGVuIG9ic2VydmluZyAvcHJvYy9pbnRlcnJ1
cHRzIGluCj4+PiB0aGUgZ3Vlc3QuCj4+Cj4+IFRoYW5rcyEgSSBhbHNvIGhhdmUgc29tZSB0cml2
aWFsIHBhdGNoIHRoYXQgSSB3b3VsZCBsaWtlIHlvdSB0byB0cnksCj4+IGp1c3QgdG8gZGlzY2Fy
ZCBzZW5kX0lQSV9tYXNrIGNsZWFyaW5nIHRoZSBzY3JhdGNoX2NwdW1hc2sgdW5kZXIKPj4gYW5v
dGhlciBmdW5jdGlvbiBmZWV0Lgo+Pgo+PiBSb2dlci4KPj4gLS0tCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvc21wLmMgYi94ZW4vYXJjaC94ODYvc21wLmMKPj4gaW5kZXggNjVlYjdjYmRh
OC4uYWVlYjUwNjE1NSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9zbXAuYwo+PiBAQCAtNjYsNyArNjYsOCBAQCBzdGF0aWMgdm9pZCBzZW5k
X0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRjdXQsIGludCB2ZWN0b3IsCj4+ICB2b2lk
IHNlbmRfSVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQo+PiAgewo+
PiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBmYWxzZTsKPj4gLSAgICBjcHVtYXNrX3QgKnNjcmF0
Y2ggPSB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spOwo+PiArICAgIHN0YXRpYyBERUZJTkVfUEVS
X0NQVShjcHVtYXNrX3QsIHNlbmRfaXBpX2NwdW1hc2spOwo+PiArICAgIGNwdW1hc2tfdCAqc2Ny
YXRjaCA9ICZ0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKPj4gIAo+PiAgICAgIC8qCj4+ICAg
ICAgICogVGhpcyBjYW4gb25seSBiZSBzYWZlbHkgdXNlZCB3aGVuIG5vIENQVSBob3RwbHVnIG9y
IHVucGx1ZyBvcGVyYXRpb25zCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
