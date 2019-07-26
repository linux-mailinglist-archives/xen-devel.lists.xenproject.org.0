Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01A76C85
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr20g-0000vv-R4; Fri, 26 Jul 2019 15:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hr20f-0000vq-KO
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 15:19:53 +0000
X-Inumbo-ID: d004a06e-afb8-11e9-8b6f-2b4a7825ec7c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d004a06e-afb8-11e9-8b6f-2b4a7825ec7c;
 Fri, 26 Jul 2019 15:19:51 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Za9qUWvkqHQvuXxoocv3a1qeJFKyEvk4x6dRGqJ9eh4Jrjn/COeVKO9czX9IOs+tnnnPJ36Pcj
 enwMDEiJoXzylwHFCUiX0cennD630QRdXzyK2MPcl+rhqrJ/iHAv92/jmQGf4ZNvVwNHA/NyDr
 Le5ScADF7r5IdNpYKfDnumxq83XaRkfArxiE1qwqyiaKLyXsqZYvEPOA2f6wF/SKrOmHOQlgN2
 Mlh82+EHnp3JEJ40xjcSVyAbT2MmZ8MAVhfSfpg/83Ju1BzSCy6MNzRwLSco2mBqkgze77qwlA
 JHY=
X-SBRS: 2.7
X-MesageID: 3617327
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3617327"
Date: Fri, 26 Jul 2019 17:19:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190726151942.jtwgl7ea5npdh3v7@Air-de-Roger>
References: <20190726135240.21745-1-andrew.cooper3@citrix.com>
 <20190726135240.21745-3-andrew.cooper3@citrix.com>
 <20190726143829.umusp5ox7urpvkrm@Air-de-Roger>
 <19fcb905-ef99-d691-a711-9c9e04896daa@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19fcb905-ef99-d691-a711-9c9e04896daa@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/xpti: Don't leak TSS-adjacent
 percpu data via Meltdown
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDM6NDU6MjJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNi8wNy8yMDE5IDE1OjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6NTI6NDBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBUaGUgWFBUSSB3b3JrIHJlc3RyaWN0ZWQgdGhlIHZpc2liaWxpdHkgb2YgbW9z
dCBvZiBtZW1vcnksIGJ1dCBtaXNzZWQgYSBmZXcKPiA+PiBhc3BlY3RzIHdoZW4gaXQgY2FtZSB0
byB0aGUgVFNTLgo+ID4+Cj4gPj4gR2l2ZW4gdGhhdCB0aGUgVFNTIGlzIGp1c3QgYW4gb2JqZWN0
IGluIHBlcmNwdSBkYXRhLCB0aGUgNGsgbWFwcGluZyBmb3IgaXQKPiA+PiBjcmVhdGVkIGluIHNl
dHVwX2NwdV9yb290X3BndCgpIG1hcHMgYWRqYWNlbnQgcGVyY3B1IGRhdGEsIG1ha2luZyBpdCBh
bGwKPiA+PiBsZWFrYWJsZSB2aWEgTWVsdGRvd24sIGV2ZW4gd2hlbiBYUFRJIGlzIGluIHVzZS4K
PiA+Pgo+ID4+IEZ1cnRoZXJtb3JlLCBubyBjYXJlIGlzIHRha2VuIHRvIGNoZWNrIHRoYXQgdGhl
IFRTUyBkb2Vzbid0IGNyb3NzIGEgcGFnZQo+ID4+IGJvdW5kYXJ5LiAgQXMgaXQgdHVybnMgb3V0
LCBzdHJ1Y3QgdHNzX3N0cnVjdCBpcyBhbGlnbmVkIG9uIGl0cyBzaXplIHdoaWNoCj4gPj4gZG9l
cyBwcmV2ZW50IGl0IHN0cmFkZGxpbmcgYSBwYWdlIGJvdW5kYXJ5LCBidXQgdGhpcyB3aWxsIGNl
YXNlIHRvIGJlIHRydWUKPiA+PiBvbmNlIENFVCBhbmQgU2hhZG93IFN0YWNrIHN1cHBvcnQgaXMg
YWRkZWQgdG8gWGVuLgo+ID4+Cj4gPj4gTW92ZSB0aGUgVFNTIGludG8gdGhlIHBhZ2UgYWxpZ25l
ZCBwZXJjcHUgYXJlYSwgc28gbm8gYWRqYWNlbnQgZGF0YSBjYW4gYmUKPiA+PiBsZWFrZWQuICBN
b3ZlIHRoZSBkZWZpbml0aW9uIGZyb20gc2V0dXAuYyB0byB0cmFwcy5jLCB3aGljaCBpcyBhIG1v
cmUKPiA+PiBhcHByb3ByaWF0ZSBwbGFjZSBmb3IgaXQgdG8gbGl2ZS4KPiA+Pgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPj4g
LS0tCj4gPj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiA+PiBDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KPiA+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gPj4gLS0tCj4gPj4gIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAg
fCAyIC0tCj4gPj4gIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgfCA2ICsrKysrKwo+
ID4+ICB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgIHwgMiArKwo+ID4+ICB4ZW4vaW5j
bHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oIHwgNCArKy0tCj4gPj4gIDQgZmlsZXMgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gPj4gaW5kZXggZDIw
MTE5MTBmYS4uMWEyZmZjNGRjMSAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAu
Ywo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gPj4gQEAgLTEwMCw4ICsxMDAsNiBA
QCB1bnNpZ25lZCBsb25nIF9fcmVhZF9tb3N0bHkgeGVuX3BoeXNfc3RhcnQ7Cj4gPj4gIAo+ID4+
ICB1bnNpZ25lZCBsb25nIF9fcmVhZF9tb3N0bHkgeGVuX3ZpcnRfZW5kOwo+ID4+ICAKPiA+PiAt
REVGSU5FX1BFUl9DUFUoc3RydWN0IHRzc19zdHJ1Y3QsIGluaXRfdHNzKTsKPiA+PiAtCj4gPj4g
IGNoYXIgX19zZWN0aW9uKCIuYnNzLnN0YWNrX2FsaWduZWQiKSBfX2FsaWduZWQoU1RBQ0tfU0la
RSkKPiA+PiAgICAgIGNwdTBfc3RhY2tbU1RBQ0tfU0laRV07Cj4gPj4gIAo+ID4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvdHJhcHMuYyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCj4gPj4gaW5k
ZXggMzhkMTIwMTNkYi4uZTRiNDU4Nzk1NiAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYv
dHJhcHMuYwo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90cmFwcy5jCj4gPj4gQEAgLTEwOCw2ICsx
MDgsMTIgQEAgaWR0X2VudHJ5X3QgX19zZWN0aW9uKCIuYnNzLnBhZ2VfYWxpZ25lZCIpIF9fYWxp
Z25lZChQQUdFX1NJWkUpCj4gPj4gIC8qIFBvaW50ZXIgdG8gdGhlIElEVCBvZiBldmVyeSBDUFUu
ICovCj4gPj4gIGlkdF9lbnRyeV90ICppZHRfdGFibGVzW05SX0NQVVNdIF9fcmVhZF9tb3N0bHk7
Cj4gPj4gIAo+ID4+ICsvKgo+ID4+ICsgKiBUaGUgVFNTIGlzIHNtYWxsZXIgdGhhbiBhIHBhZ2Us
IGJ1dCB3ZSBnaXZlIGl0IGEgZnVsbCBwYWdlIHRvIGF2b2lkCj4gPj4gKyAqIGFkamFjZW50IHBl
ci1jcHUgZGF0YSBsZWFraW5nIHZpYSBNZWx0ZG93biB3aGVuIFhQVEkgaXMgaW4gdXNlLgo+ID4+
ICsgKi8KPiA+PiArREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKHN0cnVjdCBfX2FsaWduZWQo
UEFHRV9TSVpFKSB0c3Nfc3RydWN0LCBpbml0X3Rzcyk7Cj4gPiBDYW4ndCB5b3UgYnVuZGxlIHRo
ZSBfX2FsaWduZWQgYXR0cmlidXRlIGluCj4gPiBERUZJTkVfUEVSX0NQVV9QQUdFX0FMSUdORUQg
aXRzZWxmPwo+ID4KPiA+ICNkZWZpbmUgREVGSU5FX1BFUl9DUFVfUEFHRV9BTElHTkVEKHR5cGUs
IG5hbWUpIFwKPiA+ICAgICBfX0RFRklORV9QRVJfQ1BVKHR5cGUgX19hbGlnbmVkKFBBR0VfU0la
RSksIF8jI25hbWUsIC5wYWdlX2FsaWduZWQpCj4gPgo+ID4gSSBoYXZlbid0IHRlc3RlZCB0aGlz
IFRCSC4KPiAKPiBJIGRpZC7CoCBJdCBkb2Vzbid0IGNvbXBpbGUsIGJlY2F1c2UgdGhlIGF0dHJp
YnV0ZSBmb2xsb3dzIHRoZSBkZWNsYXJhdGlvbi4KPiAKPiBPYnNlcnZlIHRoYXQgdGhlIHBhdGNo
IHB1dHMgX19hbGlnbmVkKCkgYmV0d2VlbiBzdHJ1Y3QgYW5kIHRzc19zdHJ1Y3QuCj4gCj4gVGhl
cmUgaXMgbm8gd2F5IHRvIGRvIHRoaXMgaW5zaWRlIERFRklORV9QRVJfQ1BVX1BBR0VfQUxJR05F
RCgpLCBiZWNhdXNlCj4gd2UgY2FuJ3QgYnJlYWsgdGhlIHR5cGUgYXBhcnQgdG8gaW5zZXJ0IF9f
YWxpZ25lZCgpIGluIHRoZSBtaWRkbGUuCgpBbmQgZG9pbmcgc29tZXRoaW5nIGxpa2U6CgojZGVm
aW5lIERFRklORV9QRVJfQ1BVX1BBR0VfQUxJR05FRCh0eXBlLCBuYW1lKSBcCiAgICBfX0RFRklO
RV9QRVJfQ1BVKHR5cGUsIF8jI25hbWUsIC5wYWdlX2FsaWduZWQpIF9fYWxpZ25lZChQQUdFX1NJ
WkUpCgpXb24ndCB3b3JrIGVpdGhlciBJIGd1ZXNzPwoKSSBqdXN0IGZpbmQgaXQgdW5jb25mb3Jt
YWJsZSB0byBoYXZlIHRvIHNwZWNpZnkgdGhlIGFsaWduZWQKYXR0cmlidXRlIGluIGV2ZXJ5IHVz
YWdlIG9mIERFRklORV9QRVJfQ1BVX1BBR0VfQUxJR05FRC4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
