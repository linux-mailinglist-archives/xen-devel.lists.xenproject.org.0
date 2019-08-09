Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C587DFE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:28:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6lf-00067p-Ed; Fri, 09 Aug 2019 15:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cgI=WF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hw6ld-00067f-FT
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 15:25:21 +0000
X-Inumbo-ID: e4e2455c-bab9-11e9-8639-7f653b6ade48
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4e2455c-bab9-11e9-8639-7f653b6ade48;
 Fri, 09 Aug 2019 15:25:18 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UkxSsB8HjnsmY9O6YgsZXNA4pMug4W18yMj1ukShSJGCQwcchv90X8gioKZx/kHM3qpU+GJ1sy
 ljWEZILxJZvqs1OuX4fq8vhuLuVrMn2wG0kmkJ5fZAbJIiYAZsazOMqKhMnD/QP3L/7K5tZpV9
 TmCuS71XIQy6tYof/FXtiUHcFBIEVrgv+q2yZKrnvl7kT+bz9bd00/IGyG/fWoLPaiXLjOpRuM
 T4hTJhLHod6NMmhLNNjkla4eX+0J5ERqRoNYcGK8H0tYDQtgrK95VhwSPBOEMKtSjQr7hLsEsq
 i7I=
X-SBRS: 2.7
X-MesageID: 4276612
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4276612"
To: Jan Beulich <jbeulich@suse.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
 <7a920e20-c6f9-4276-ef30-679b77c074ac@citrix.com>
 <f7bbe866-aee9-fed5-0789-4e6018e6c83b@suse.com>
 <070c7421-04b6-23e5-88a8-7d05bb26568c@citrix.com>
 <ef79ee24-af84-aabd-95f5-a4363ec2a78d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <749b514a-822b-c86f-8628-422376683267@citrix.com>
Date: Fri, 9 Aug 2019 16:25:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ef79ee24-af84-aabd-95f5-a4363ec2a78d@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/desc: Build boot_{,
 compat_}gdt[] in C
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDgvMjAxOSAxNDoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMDguMjAxOSAx
NTowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDkvMDgvMjAxOSAxMzo0MywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwOS4wOC4yMDE5IDE0OjE5LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDA5LzA4LzIwMTkgMTE6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiAtLS0g
L2Rldi9udWxsCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kZXNjLmMKPj4+Pj4gQEAgLTAsMCAr
MSwxMDkgQEAKPj4+Pj4gKwo+Pj4+PiArI2RlZmluZSBTRUwyR0RUKHNlbCkgKCgoc2VsKSA+PiAz
KSAtIEZJUlNUX1JFU0VSVkVEX0dEVF9FTlRSWSkKPj4+Pj4gKwo+Pj4+PiArX19zZWN0aW9uKCIu
ZGF0YS5wYWdlX2FsaWduZWQiKSBfX2FsaWduZWQoUEFHRV9TSVpFKQo+Pj4+PiArc2VnX2Rlc2Nf
dCBib290X2dkdFtQQUdFX1NJWkUgLyBzaXplb2Yoc2VnX2Rlc2NfdCldID0KPj4+Pj4gK3sKPj4+
Pj4gK8KgwqDCoCAvKiAweGUwMDggLSBSaW5nIDAgY29kZSwgNjRiaXQgbW9kZSAqLwo+Pj4+PiAr
wqDCoMKgIFtTRUwyR0RUKF9fSFlQRVJWSVNPUl9DUzY0KV0gPSB7IDB4MDBhZjliMDAwMDAwZmZm
ZiB9LAo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgLyogMHhlMDEwIC0gUmluZyAwIGRhdGEgKi8KPj4+
Pj4gK8KgwqDCoCBbU0VMMkdEVChfX0hZUEVSVklTT1JfRFMzMildID0geyAweDAwY2Y5MzAwMDAw
MGZmZmYgfSwKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIC8qIDB4ZTAxOCAtIHJlc2VydmVkICovCj4+
Pj4+ICsKPj4+Pj4gK8KgwqDCoCAvKiAweGUwMjMgLSBSaW5nIDMgY29kZSwgY29tcGF0aWJpbGl0
eSAqLwo+Pj4+PiArwqDCoMKgIFtTRUwyR0RUKEZMQVRfUklORzNfQ1MzMildID0geyAweDAwY2Zm
YjAwMDAwMGZmZmYgfSwKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIC8qIDB4ZTAyYiAtIFJpbmcgMyBk
YXRhICovCj4+Pj4+ICvCoMKgwqAgW1NFTDJHRFQoRkxBVF9SSU5HM19EUzMyKV0gPSB7IDB4MDBj
ZmYzMDAwMDAwZmZmZiB9LAo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgLyogMHhlMDMzIC0gUmluZyAz
IGNvZGUsIDY0LWJpdCBtb2RlICovCj4+Pj4+ICvCoMKgwqAgW1NFTDJHRFQoRkxBVF9SSU5HM19D
UzY0KV0gPSB7IDB4MDBhZmZiMDAwMDAwZmZmZiB9LAo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgLyog
MHhlMDM4IC0gUmluZyAwIGNvZGUsIGNvbXBhdGliaWxpdHkgKi8KPj4+Pj4gK8KgwqDCoCBbU0VM
MkdEVChfX0hZUEVSVklTT1JfQ1MzMildID0geyAweDAwY2Y5YjAwMDAwMGZmZmYgfSwKPj4+Pj4g
Kwo+Pj4+PiArwqDCoMKgIC8qIDB4ZTA0MCAtIFRTUyAqLwo+Pj4+PiArwqDCoMKgIC8qIDB4ZTA1
MCAtIExEVCAqLwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgLyogMHhlMDYwIC0gcGVyLUNQVSBlbnRy
eSAobGltaXQgPT0gY3B1KSAqLwo+Pj4+PiArwqDCoMKgIFtTRUwyR0RUKFBFUl9DUFVfR0RUX1NF
TEVDVE9SKV0gPSB7IDB4MDAwMDkxMDAwMDAwMDAwMCB9LAo+Pj4+Cj4+Pj4gSXQgd291bGQgYmUg
YmV0dGVyIGlmIHRoZSA9IHsgfSB3ZXJlIHZlcnRpY2FsbHkgYWxpZ25lZC7CoCBJdCBtYWtlcwo+
Pj4+IHJlYWRpbmcgdGhlbSBlYXNpZXIuCj4+Pj4KPj4+PiBBbHNvLCBub3cgdGhhdCBTRUwyR0RU
KCkgaXMgcHJlc2VudCwgd2UgbmVlZCBhIEJVSUxEX0JVR19PTigpIHRvIGNoZWNrCj4+Pj4gdGhh
dCB0aGUgc2l6ZSBkb2Vzbid0IHZhcnkgZnJvbSBvbmUgcGFnZS7CoCBBdCB0aGUgbW9tZW50LCBj
aGFuZ2luZyBhCj4+Pj4gc2VsZWN0b3IgdG8gdXNlIDB4Znh4eCB3aWxsIGNhdXNlIHRoaXMgdG8g
Z3JvdyBiZXlvbmQgMSBwYWdlCj4+Pj4gd2l0aG91dCBhbnkKPj4+PiBjb21waWxlciBkaWFnbm9z
dGljLsKgIEknZCBnbyB3aXRoCj4+Pj4KPj4+PiBzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91
bnVzZWQKPj4+PiBidWlsZF9hc3NlcnRpb25zKHZvaWQpCj4+Pj4KPj4+PiB7Cj4+Pj4gwqDCoMKg
wqDCoCBCVUlMRF9CVUdfT04oc2l6ZW9mKGJvb3RfZ2R0KSAhPSBQQUdFX1NJWkUpOwo+Pj4+IMKg
wqDCoMKgwqAgQlVJTERfQlVHX09OKHNpemVvZihib290X2NvbXBhdF9nZHQpICE9IFBBR0VfU0la
RSk7Cj4+Pj4gfQo+Pj4KPj4+IFdpbGwgZG8sIGFsYmVpdCBmb3IgdGhlIGJ1aWxkIGFzc2VydGlv
bnMgdGhpcyBpc24ndCByZWFsbHkgdGhlCj4+PiByaWdodCBwbGFjZSBpbW8sIGJlY2F1c2UgdGhp
cyBpc24ndCB0aGUgcGxhY2Ugd2hlcmUgd2UgZGVwZW5kCj4+PiBvbiB0aGVtIGJlaW5nIGp1c3Qg
c2luZ2xlIHBhZ2VzLiBJJ2xsIHB1dCBpdCB0aGVyZSBuZXZlcnRoZWxlc3MsCj4+PiBidXQgSSds
bCBhZGQgYSBjb21tZW50IGZvciB3aHkgdGhleSdyZSB0aGVyZS4KPj4KPj4gSU1PIHRoaXMgaXMg
dGhlIHJpZ2h0IHBsYWNlLCBiZWNhdXNlIGl0IGlzIHJpZ2h0IGJlc2lkZSB3aGVyZSB0aGUgYXJy
YXkKPj4gaXMgc3BlY2lmaWNhbGx5IGRlZmluZWQgdG8gYmUgW1BBR0VfU0laRSAvIHNpemVvZigp
XS4KPgo+IEkgd2FzIGFib3V0IHRvIGFzayB3aHkgd2UgdGhlbiBuZWVkIGJ1aWxkX2Fzc2VydGlv
bnMoKSBhdCBhbGwsCj4gdW50aWwgSSBhbHNvIHNhdyAuLi4KPgo+PiBXaGF0IGl0IGlzIGRvaW5n
IGlzIHdvcmtpbmcgYXJvdW5kIHdoYXQgaXMgYXJndWFibHkgYSBjb21waWxlciBidWcgYnkKPj4g
YWxsb3dpbmcgZm9vW3hdID0geyBbeCArIDFdID0gLi4uIH0gdG8gd29yay4KPgo+IC4uLiB0aGlz
LiBXaGljaCBtYWRlIG1lIGdvIGNoZWNrLCBhbmQgYm90aCBnY2MgNC4zIGFuZCBnY2MgOS4xCj4g
Y29ycmVjdGx5IGNvbXBsYWluICJhcnJheSBpbmRleCBpbiBpbml0aWFsaXplciBleGNlZWRzIGFy
cmF5Cj4gYm91bmRzIi4KPgo+PiBBbnl3YXksIHdpdGggdGhlc2UgYXNzZXJ0aW9ucyBhbmQgdGhl
IHR3ZWFrZWQgY29uc3RhbnQgY2xlbmF1cCwKPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4KPiBUaGFua3MsIGJ1dCBhcyBwZXIgYWJvdmUg
SSdtIG5vdyBpcnJpdGF0ZWQ6IFdpdGggdGhlIGV4cGxpY2l0Cj4gc3BlY2lmaWNhdGlvbiBvZiB0
aGUgYXJyYXkgc2l6ZSwgYnVpbGRfYXNzZXJ0aW9ucygpIHNob3VsZCBlaXRoZXIKPiBiZSBkcm9w
cGVkIGFnYWluLCBvciBpdHMgY29tbWVudCBiZSBleHRlbmRlZCB0byBjb3ZlciB3aHkgaXQncwo+
IG5lZWRlZCBfZGVzcGl0ZV8gdGhlIHNwZWNpZmllZCBhcnJheSBzaXplIChpLmUuIGluIHdoaWNo
IGNhc2UKPiB5b3VyIGV4YW1wbGUgYWJvdmUgd291bGQgbm90IGNhdXNlIGEgYnVpbGQgZmFpbHVy
ZSkuCgpUaGlzIGNvbWVzIGRvd24gdG8gYSBidWcgSSBlbmNvdW50ZXJlZCB3aGlsZSBkb2luZyB0
aGUgQ1BVSUQgd29yaywgd2hpY2gKaXMgc3BlY2lmaWNhbGx5IHdoeSB3ZSBoYXZlIGNwdWlkLmMn
cyBidWlsZCBhc3NlcnRpb25zLgoKR2l2ZW4gdGhhdCB3ZSBnZXQgZmFpbHVyZXMgZnJvbSBhdCBs
ZWFzdCBvbmUgY29tcGlsZXIgaW4gQ0ksIHdlIGNhbiBkcm9wCnRoZSBleHRyYSBidWlsZCBhc3Nl
cnRpb25zLgoKQXQgc29tZSBwb2ludCB3aGljaCBpc24ndCBub3csIEknbGwgdHJ5IHRvIHdvcmsg
b3V0IGV4YWN0bHkgd2hhdCB3ZW50Cndyb25nIGluIHRoZSBDUFVJRCBjYXNlLCBidXQgSSBjYW4n
dCByZXByb2R1Y2UgaXQgZnJvbSBtZW1vcnkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
