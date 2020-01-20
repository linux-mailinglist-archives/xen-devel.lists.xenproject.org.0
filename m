Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEFF142EF8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 16:41:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itZ82-0001Q4-GY; Mon, 20 Jan 2020 15:38:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itZ80-0001Pz-Vq
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 15:38:13 +0000
X-Inumbo-ID: d89c8764-3b9a-11ea-8e9a-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d89c8764-3b9a-11ea-8e9a-bc764e2007e4;
 Mon, 20 Jan 2020 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579534683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3I7w+AMdVDrplbSqyspgP1pCWcLvlhnU8Zd173Iv5o8=;
 b=OJ1KFeMsLMg70EfMahITWVgdAXV8ipYAsINvLn6R+XqTo9tbnvODylfb
 X4kWs+ASJLoBwnbCowUYYyLYch2AwUDhoez2+nEUwvsHDHnGdqkGc3bRA
 0UpUzF8s/khoCFVCxe0QUp0vvV06TJhxZXX1H1fLWQ/NPQCDD+f1BHQQ5 E=;
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
IronPort-SDR: E95GITWz6R+wg+ts9hSAQ8aPdxMZPCa+KfHTOZPGjuu5bvg09pQYPk5ojJMngLDtzQc53SzT39
 uatsBgkOvQTpuLeub9kxd8jrNRVCxo87aHTr8kICRik4j64fl9Hx3GhIfJOG+Wku42u7FuTm0c
 OwLu5/Rh7YK00PdU8pVlRW2jawWO72dlGN+HwphGD6iEKy+K+arWKkRzpE2TtUPIAmWKo5cavw
 sBfsKl1aot/x3LILQIN7XD4BWz9pDEqXArXAWInf6DqOgnF+IztpbekwQxVO50+PPigQjDRjpt
 6+Y=
X-SBRS: 2.7
X-MesageID: 11759021
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,342,1574139600"; d="scan'208";a="11759021"
Date: Mon, 20 Jan 2020 15:37:53 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120153753.GB11756@Air-de-Roger>
References: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
 <20200120140750.GZ11756@Air-de-Roger>
 <9b000f97-2dbc-0b0c-cb27-1e8f85791576@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b000f97-2dbc-0b0c-cb27-1e8f85791576@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/sm{e,
 a}p: do not enable SMEP/SMAP in PV shim by default on AMD
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, sstabellini@kernel.org,
 julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDM6Mzg6MDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDEuMjAyMCAxNTowNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIEphbiAxNiwgMjAyMCBhdCAwNDowMDowM1BNICswMDAwLCBJZ29yIERydXpoaW5pbiB3
cm90ZToKPiA+PiBEdWUgdG8gQU1EIGFuZCBIeWdvbiBiZWluZyB1bmFibGUgdG8gc2VsZWN0aXZl
bHkgdHJhcCBDUjQgYml0IG1vZGlmaWNhdGlvbnMKPiA+PiBydW5uaW5nIDMyLWJpdCBQViBndWVz
dCBpbnNpZGUgUFYgc2hpbSBjb21lcyB3aXRoIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlCj4gPj4g
aGl0LiBNb3Jlb3ZlciwgZm9yIFNNRVAgaW4gcGFydGljdWxhciBldmVyeSB0aW1lIENSNC5TTUVQ
IGNoYW5nZXMgb24gY29udGV4dAo+ID4+IHN3aXRjaCB0by9mcm9tIDMyLWJpdCBQViBndWVzdCwg
aXQgZ2V0cyB0cmFwcGVkIGJ5IEwwIFhlbiB3aGljaCB0aGVuCj4gPj4gdHJpZXMgdG8gcGVyZm9y
bSBnbG9iYWwgVExCIGludmFsaWRhdGlvbiBmb3IgUFYgc2hpbSBkb21haW4uIFRoaXMgdXN1YWxs
eQo+ID4+IHJlc3VsdHMgaW4gZXZlbnR1YWwgaGFuZyBvZiBhIFBWIHNoaW0gd2l0aCBhdCBsZWFz
dCBzZXZlcmFsIHZDUFVzLgo+ID4+Cj4gPj4gU2luY2UgdGhlIG92ZXJhbGwgc2VjdXJpdHkgcmlz
ayBpcyBnZW5lcmFsbHkgbG93ZXIgZm9yIHNoaW0gWGVuIGFzIGl0IGJlaW5nCj4gPj4gdGhlcmUg
bW9yZSBvZiBhIGRlZmVuc2UtaW4tZGVwdGggbWVjaGFuaXNtLCBjaG9vc2UgdG8gZGlzYWJsZSBT
TUVQL1NNQVAgaW4KPiA+PiBpdCBieSBkZWZhdWx0IG9uIEFNRCBhbmQgSHlnb24gdW5sZXNzIGEg
dXNlciBjaG9zZSBvdGhlcndpc2UuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpo
aW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPiA+PiAtLS0KPiA+PiBJJ20gYSBsaXR0
bGUgYml0IG9uIHRoZSBmZW5jZSB3aXRoIHRoaXMgb25lLiBXZSdyZSBoYXZpbmcgdGhlIHNhbWUg
aXNzdWUgd2l0aAo+ID4+IGdlbmVyYWwgbmVzdGVkIHZpcnQgYnV0IEknbSBub3QgaW5jbGluZWQg
dG8gdHJhZGUgc2VjdXJpdHkgZm9yIGEgdXNlciBpbgo+ID4+IGdlbmVyYWwgY2FzZS4gRGlzYWJs
aW5nIGl0IGJ5IGRlZmF1bHQgZm9yIFBWIHNoaW0gb25seSBzZWVtcyByYXRoZXIgaW5vY3VvdXMK
PiA+PiBkdWUgdG8gdGhlIHVzZSBjYXNlIHJlc3RyaWNpb24uIEknZCBsaWtlIHRvIGhlYXIgbW9y
ZSBvcGluaW9ucy4KPiA+PiAtLS0KPiA+PiAgZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFu
ZG9jIHwgMTAgKysrKysrKystLQo+ID4+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAg
ICAgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUu
cGFuZG9jCj4gPj4gaW5kZXggOTgxYTVlMi4uMDViMmRkZSAxMDA2NDQKPiA+PiAtLS0gYS9kb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiA+PiArKysgYi9kb2NzL21pc2MveGVuLWNv
bW1hbmQtbGluZS5wYW5kb2MKPiA+PiBAQCAtMTkzNiwxOSArMTkzNiwyNSBAQCBpcyAxTUIuCj4g
Pj4gICMjIyBzbWFwICh4ODYpCj4gPj4gID4gYD0gPGJvb2xlYW4+IHwgaHZtYAo+ID4+ICAKPiA+
PiAtPiBEZWZhdWx0OiBgdHJ1ZWAKPiA+PiArPiBEZWZhdWx0OiBgdHJ1ZWAgdW5sZXNzIHJ1bm5p
bmcgaW4gcHYtc2hpbSBtb2RlIG9uIEFNRCBvciBIeWdvbiBoYXJkd2FyZQo+ID4+ICAKPiA+PiAg
RmxhZyB0byBlbmFibGUgU3VwZXJ2aXNvciBNb2RlIEFjY2VzcyBQcmV2ZW50aW9uCj4gPj4gIFVz
ZSBgc21hcD1odm1gIHRvIGFsbG93IFNNQVAgdXNlIGJ5IEhWTSBndWVzdHMgb25seS4KPiA+PiAg
Cj4gPj4gK0luIFBWIHNoaW0gbW9kZSBvbiBBTUQgb3IgSHlnb24gaGFyZHdhcmUgZHVlIHRvIHNp
Z25pZmljYW50IHBlcmZvbWFuY2UgaW1wYWN0Cj4gPj4gK2luIHNvbWUgY2FzZXMgYW5kIGdlbmVy
YWxseSBsb3dlciBzZWN1cml0eSByaXNrIHRoZSBvcHRpb24gZGVmYXVsdHMgdG8gZmFsc2UuCj4g
Pj4gKwo+ID4+ICAjIyMgc21lcCAoeDg2KQo+ID4+ICA+IGA9IDxib29sZWFuPiB8IGh2bWAKPiA+
PiAgCj4gPj4gLT4gRGVmYXVsdDogYHRydWVgCj4gPj4gKz4gRGVmYXVsdDogYHRydWVgIHVubGVz
cyBydW5uaW5nIGluIHB2LXNoaW0gbW9kZSBvbiBBTUQgb3IgSHlnb24gaGFyZHdhcmUKPiA+PiAg
Cj4gPj4gIEZsYWcgdG8gZW5hYmxlIFN1cGVydmlzb3IgTW9kZSBFeGVjdXRpb24gUHJvdGVjdGlv
bgo+ID4+ICBVc2UgYHNtZXA9aHZtYCB0byBhbGxvdyBTTUVQIHVzZSBieSBIVk0gZ3Vlc3RzIG9u
bHkuCj4gPj4gIAo+ID4+ICtJbiBQViBzaGltIG1vZGUgb24gQU1EIG9yIEh5Z29uIGhhcmR3YXJl
IGR1ZSB0byBzaWduaWZpY2FudCBwZXJmb21hbmNlIGltcGFjdAo+ID4+ICtpbiBzb21lIGNhc2Vz
IGFuZCBnZW5lcmFsbHkgbG93ZXIgc2VjdXJpdHkgcmlzayB0aGUgb3B0aW9uIGRlZmF1bHRzIHRv
IGZhbHNlLgo+ID4+ICsKPiA+PiAgIyMjIHNtdCAoeDg2KQo+ID4+ICA+IGA9IDxib29sZWFuPmAK
PiA+PiAgCj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gv
eDg2L3NldHVwLmMKPiA+PiBpbmRleCA1YmRjMjI5Li44NDMyYjc3IDEwMDY0NAo+ID4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPiA+
PiBAQCAtMTA1LDkgKzEwNSw5IEBAIHN0cnVjdCBjcHVpbmZvX3g4NiBfX3JlYWRfbW9zdGx5IGJv
b3RfY3B1X2RhdGEgPSB7IDAsIDAsIDAsIDAsIC0xIH07Cj4gPj4gIAo+ID4+ICB1bnNpZ25lZCBs
b25nIF9fcmVhZF9tb3N0bHkgbW11X2NyNF9mZWF0dXJlcyA9IFhFTl9NSU5JTUFMX0NSNDsKPiA+
PiAgCj4gPj4gLS8qIHNtZXA6IEVuYWJsZS9kaXNhYmxlIFN1cGVydmlzb3IgTW9kZSBFeGVjdXRp
b24gUHJvdGVjdGlvbiAoZGVmYXVsdCBvbikuICovCj4gPj4gLSNkZWZpbmUgU01FUF9IVk1fT05M
WSAoLTEpCj4gPj4gLXN0YXRpYyBzOCBfX2luaXRkYXRhIG9wdF9zbWVwID0gMTsKPiA+PiArLyog
c21lcDogRW5hYmxlL2Rpc2FibGUgU3VwZXJ2aXNvciBNb2RlIEV4ZWN1dGlvbiBQcm90ZWN0aW9u
ICovCj4gPj4gKyNkZWZpbmUgU01FUF9IVk1fT05MWSAoLTIpCj4gPj4gK3N0YXRpYyBzOCBfX2lu
aXRkYXRhIG9wdF9zbWVwID0gLTE7Cj4gPiAKPiA+IENvdWxkIHlvdSBjaGFuZ2UgdGhlIHR5cGUg
dG8gaW50OF90IGluc3RlYWQgb2Ygczg/IChoZXJlIGFuZCBiZWxvdywKPiA+IGNhbiBiZSBkb25l
IG9uIGNvbW1pdCB3aXRoIHRoZSBjaGFuZ2VzIHJlcXVlc3RlZCBieSBKYW4pLgo+IAo+IFRvbyBs
YXRlLCBzb3JyeSwgdGhpcyB3YXMgY29tbWl0dGVkIGJlZm9yZSB0aGUgd2Vla2VuZCBhbHJlYWR5
Lgo+IChJIGd1ZXNzIEkgc2hvdWxkIGhhdmUgbm90aWNlZCB0aGlzIG15c2VsZiwgdGhvdWdoLikK
Ck9oLCBzb3JyeSwgZGlkbid0IHJlYWxpemUgdGhpcyB3YXMgYWxyZWFkeSBjb21taXR0ZWQsIG5l
dmVyIG1pbmQgdGhlbi4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
