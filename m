Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFA87ADB
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:10:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4bx-0006Hz-TH; Fri, 09 Aug 2019 13:07:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cgI=WF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hw4bv-0006Hu-U4
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:07:11 +0000
X-Inumbo-ID: 98431072-baa6-11e9-990e-f3a6d54a213a
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98431072-baa6-11e9-990e-f3a6d54a213a;
 Fri, 09 Aug 2019 13:07:09 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1B4W7t1X841xsXc+vmFiYe98IIs9hcIUkQxcYerf8Nq3X5k+u59hsYmCEKjp1VGplfWbxnaysX
 a97VoBSqkb6JVup42LzBci2uA5tpfSp02KhO5SAXjIyHdEImLYBsIN45Kb5BPyxz9wMOPhnv0S
 zEda650+LdcFyknPVz6F3kelrY+feHGxSUFxdrEXIaiJWb1dq3+3wyvASAMugpXeFupBl3QMsy
 l20g8YI+6uueo72yvCGBgBUtPbNHOfQCuAC4k90SXK2kQG+/P1O1v2NCkENStrjR6iVAd5KtDg
 tIo=
X-SBRS: 2.7
X-MesageID: 4088666
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4088666"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
 <7a920e20-c6f9-4276-ef30-679b77c074ac@citrix.com>
 <f7bbe866-aee9-fed5-0789-4e6018e6c83b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <070c7421-04b6-23e5-88a8-7d05bb26568c@citrix.com>
Date: Fri, 9 Aug 2019 14:07:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f7bbe866-aee9-fed5-0789-4e6018e6c83b@suse.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDgvMjAxOSAxMzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDkuMDguMjAxOSAx
NDoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDkvMDgvMjAxOSAxMTo0MCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+Pj4KPj4+IEludHJvZHVjZSBTRUwyR0RUKCkuIENvcnJlY3QgR0RU
IGluZGljZXMgaW4gcHVibGljIGhlYWRlci4KPj4KPj4gIkNvcnJlY3QiIGhlcmUgaXMgYW1iaWd1
b3VzIGJlY2F1c2UgaXQgaW1wbGllcyB0aGVyZSBpcyBhIGJyZWFrYWdlLgo+Pgo+PiBZb3UgYXBw
ZWFyIHRvIGhhdmUgcmV2ZXJzZWQgRkxBVF9SSU5HM19DUzY0IGFuZCBEUzMyIChyZXRhaW5pbmcg
dGhlCj4+IG9yaWdpbmFsIGNvbW1lbnRzKSBhbmQgY2hhbmdlZCB0aGUgY29tbWVudHMgZm9yIEZM
QVRfUklORzNfU1N7MzIsNjR9Lgo+Cj4gV2VsbCAtIHRoZSBjb21tZW50cyB3ZXJlIHdoYXQgd2Fz
IHdyb25nIGFmdGVyIGFsbC4KPgo+PiBFeGNlcHQgdGhhdCBub3cgdGhleSBhcmUgb3V0IG9mIHRo
ZWlyIGxvZ2ljYWwgb3JkZXIgKENTIDMyIHRoZW4gNjQsIERTCj4+IDMyIHRoZW4gNjQsIFNTIDMy
IHRoZW4gNjQpLgo+Pgo+PiBXaGF0IGlzIHRoZSByZWFzb25pbmcgZm9yIHRoZSBuZXcgb3JkZXI/
wqAgSXQgaXNuJ3Qgc29ydGVkIGJ5IGluZGV4Lgo+Cj4gSXQgaXMsIGFzIG11Y2ggYXMgaXQgbG9v
a3MgdG8gaGF2ZSBiZWVuIHRoZSBvcmlnaW5hbCBhdXRob3Incwo+IGludGVudC4gSS5lLiBJIGRp
ZG4ndCByZS1vcmRlciB0aGluZ3MgYWNyb3NzIHRoZSBudWwgc2VsZWN0b3IKPiBiZXR3ZWVuIHRo
ZSB0d28gZ3JvdXBzLkkgY2FuIHB1bGwgRkxBVF9SSU5HM19TUyogdXAgaWYgdGhhdCdzCj4gd2hh
dCB5b3Ugd2FudC4gSSdtIGFsc28gaGFwcHkgd2l0aCBhbnkgb3RoZXIgb3JkZXIgdGhhdCB5b3UK
PiBtYXkgcHJlZmVyIC0ganVzdCBsZXQgbWUga25vdyB3aGljaCBvbmUuIEFsbCBJIGNhcmUgYWJv
dXQgaXMKPiBmb3IgdGhlIGNvbW1lbnRzIHRvIGJlIGluIHN5bmMgd2l0aCB0aGUgYWN0dWFsIHZh
bHVlcy4KCkkgdGhpbmsgaXQgd291bGQgYmUgY2xlYXJlc3QgdG8gbGVhdmUgdGhlIG9yZGVyIGFz
IGlzLCBhbmQganVzdCBmaXggdGhlCmNvbW1lbnRzLgoKPgo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2Rlc2MuYwo+Pj4gQEAgLTAsMCArMSwxMDkgQEAKPj4+ICsKPj4+
ICsjZGVmaW5lIFNFTDJHRFQoc2VsKSAoKChzZWwpID4+IDMpIC0gRklSU1RfUkVTRVJWRURfR0RU
X0VOVFJZKQo+Pj4gKwo+Pj4gK19fc2VjdGlvbigiLmRhdGEucGFnZV9hbGlnbmVkIikgX19hbGln
bmVkKFBBR0VfU0laRSkKPj4+ICtzZWdfZGVzY190IGJvb3RfZ2R0W1BBR0VfU0laRSAvIHNpemVv
ZihzZWdfZGVzY190KV0gPQo+Pj4gK3sKPj4+ICvCoMKgwqAgLyogMHhlMDA4IC0gUmluZyAwIGNv
ZGUsIDY0Yml0IG1vZGUgKi8KPj4+ICvCoMKgwqAgW1NFTDJHRFQoX19IWVBFUlZJU09SX0NTNjQp
XSA9IHsgMHgwMGFmOWIwMDAwMDBmZmZmIH0sCj4+PiArCj4+PiArwqDCoMKgIC8qIDB4ZTAxMCAt
IFJpbmcgMCBkYXRhICovCj4+PiArwqDCoMKgIFtTRUwyR0RUKF9fSFlQRVJWSVNPUl9EUzMyKV0g
PSB7IDB4MDBjZjkzMDAwMDAwZmZmZiB9LAo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiAweGUwMTggLSBy
ZXNlcnZlZCAqLwo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiAweGUwMjMgLSBSaW5nIDMgY29kZSwgY29t
cGF0aWJpbGl0eSAqLwo+Pj4gK8KgwqDCoCBbU0VMMkdEVChGTEFUX1JJTkczX0NTMzIpXSA9IHsg
MHgwMGNmZmIwMDAwMDBmZmZmIH0sCj4+PiArCj4+PiArwqDCoMKgIC8qIDB4ZTAyYiAtIFJpbmcg
MyBkYXRhICovCj4+PiArwqDCoMKgIFtTRUwyR0RUKEZMQVRfUklORzNfRFMzMildID0geyAweDAw
Y2ZmMzAwMDAwMGZmZmYgfSwKPj4+ICsKPj4+ICvCoMKgwqAgLyogMHhlMDMzIC0gUmluZyAzIGNv
ZGUsIDY0LWJpdCBtb2RlICovCj4+PiArwqDCoMKgIFtTRUwyR0RUKEZMQVRfUklORzNfQ1M2NCld
ID0geyAweDAwYWZmYjAwMDAwMGZmZmYgfSwKPj4+ICsKPj4+ICvCoMKgwqAgLyogMHhlMDM4IC0g
UmluZyAwIGNvZGUsIGNvbXBhdGliaWxpdHkgKi8KPj4+ICvCoMKgwqAgW1NFTDJHRFQoX19IWVBF
UlZJU09SX0NTMzIpXSA9IHsgMHgwMGNmOWIwMDAwMDBmZmZmIH0sCj4+PiArCj4+PiArwqDCoMKg
IC8qIDB4ZTA0MCAtIFRTUyAqLwo+Pj4gK8KgwqDCoCAvKiAweGUwNTAgLSBMRFQgKi8KPj4+ICsK
Pj4+ICvCoMKgwqAgLyogMHhlMDYwIC0gcGVyLUNQVSBlbnRyeSAobGltaXQgPT0gY3B1KSAqLwo+
Pj4gK8KgwqDCoCBbU0VMMkdEVChQRVJfQ1BVX0dEVF9TRUxFQ1RPUildID0geyAweDAwMDA5MTAw
MDAwMDAwMDAgfSwKPj4KPj4gSXQgd291bGQgYmUgYmV0dGVyIGlmIHRoZSA9IHsgfSB3ZXJlIHZl
cnRpY2FsbHkgYWxpZ25lZC7CoCBJdCBtYWtlcwo+PiByZWFkaW5nIHRoZW0gZWFzaWVyLgo+Pgo+
PiBBbHNvLCBub3cgdGhhdCBTRUwyR0RUKCkgaXMgcHJlc2VudCwgd2UgbmVlZCBhIEJVSUxEX0JV
R19PTigpIHRvIGNoZWNrCj4+IHRoYXQgdGhlIHNpemUgZG9lc24ndCB2YXJ5IGZyb20gb25lIHBh
Z2UuwqAgQXQgdGhlIG1vbWVudCwgY2hhbmdpbmcgYQo+PiBzZWxlY3RvciB0byB1c2UgMHhmeHh4
IHdpbGwgY2F1c2UgdGhpcyB0byBncm93IGJleW9uZCAxIHBhZ2Ugd2l0aG91dCBhbnkKPj4gY29t
cGlsZXIgZGlhZ25vc3RpYy7CoCBJJ2QgZ28gd2l0aAo+Pgo+PiBzdGF0aWMgdm9pZCBfX2luaXQg
X19tYXliZV91bnVzZWQKPj4gYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQo+Pgo+PiB7Cj4+IMKgwqDC
oMKgIEJVSUxEX0JVR19PTihzaXplb2YoYm9vdF9nZHQpICE9IFBBR0VfU0laRSk7Cj4+IMKgwqDC
oMKgIEJVSUxEX0JVR19PTihzaXplb2YoYm9vdF9jb21wYXRfZ2R0KSAhPSBQQUdFX1NJWkUpOwo+
PiB9Cj4KPiBXaWxsIGRvLCBhbGJlaXQgZm9yIHRoZSBidWlsZCBhc3NlcnRpb25zIHRoaXMgaXNu
J3QgcmVhbGx5IHRoZQo+IHJpZ2h0IHBsYWNlIGltbywgYmVjYXVzZSB0aGlzIGlzbid0IHRoZSBw
bGFjZSB3aGVyZSB3ZSBkZXBlbmQKPiBvbiB0aGVtIGJlaW5nIGp1c3Qgc2luZ2xlIHBhZ2VzLiBJ
J2xsIHB1dCBpdCB0aGVyZSBuZXZlcnRoZWxlc3MsCj4gYnV0IEknbGwgYWRkIGEgY29tbWVudCBm
b3Igd2h5IHRoZXkncmUgdGhlcmUuCgpJTU8gdGhpcyBpcyB0aGUgcmlnaHQgcGxhY2UsIGJlY2F1
c2UgaXQgaXMgcmlnaHQgYmVzaWRlIHdoZXJlIHRoZSBhcnJheQppcyBzcGVjaWZpY2FsbHkgZGVm
aW5lZCB0byBiZSBbUEFHRV9TSVpFIC8gc2l6ZW9mKCldLgoKV2hhdCBpdCBpcyBkb2luZyBpcyB3
b3JraW5nIGFyb3VuZCB3aGF0IGlzIGFyZ3VhYmx5IGEgY29tcGlsZXIgYnVnIGJ5CmFsbG93aW5n
IGZvb1t4XSA9IHsgW3ggKyAxXSA9IC4uLiB9IHRvIHdvcmsuCgpBbnl3YXksIHdpdGggdGhlc2Ug
YXNzZXJ0aW9ucyBhbmQgdGhlIHR3ZWFrZWQgY29uc3RhbnQgY2xlbmF1cCwKUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
