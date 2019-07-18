Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537136CEC6
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:21:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6Ij-00083Z-5F; Thu, 18 Jul 2019 13:18:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho6Ih-00083Q-4O
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:18:23 +0000
X-Inumbo-ID: 831f09f2-a95e-11e9-998c-d7a264f7199a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 831f09f2-a95e-11e9-998c-d7a264f7199a;
 Thu, 18 Jul 2019 13:18:20 +0000 (UTC)
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
IronPort-SDR: ZrudmJXzuBCbIab7yHB2iWhCtaCPKt8lVOOyDbPzPGxlmMwLqexLLbUTxBC6j+pouyQV0KvHhV
 nefeBLNwMCuMbZQwWSWoqTQrwky7rTKNjD/fqK+y3uIerf4wEKY03IEw0BsOKAfpZl8e2X064V
 RhHBJjl8VmINR8TP/tvo3HB4vJwpgEkaQILkjYUQu71WdkbFfdXTbxAgjMOLk6bV8p8i0/jrVk
 SK3GymSmrG7iwIV9xSrWVGMiUefNrHcIfZzsZmPw/rK1Ud7ZixEWHZbPys8Z8TEwScEaiHQjg9
 v6U=
X-SBRS: 2.7
X-MesageID: 3230655
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3230655"
To: Jan Beulich <JBeulich@suse.com>
References: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
 <05257008-13e3-0d49-cd1d-6a8c9eee2ce5@suse.com>
 <d643e3c0-fd02-3427-b241-a707eaaf5d52@citrix.com>
 <dadc1871-02eb-3312-9e5f-bb4cebc1308c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <75bd7e06-92cd-18cb-6606-fa20828f4253@citrix.com>
Date: Thu, 18 Jul 2019 14:18:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <dadc1871-02eb-3312-9e5f-bb4cebc1308c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/cpu/intel: Clear cache self-snoop
 capability in CPUs with known errata
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

T24gMTgvMDcvMjAxOSAxNDowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMDcuMjAxOSAx
NDoyMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTgvMDcvMjAxOSAxMzowOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMKPj4+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYwo+Pj4gQEAgLTE1LDYgKzE1LDMyIEBACj4+PiAgICAj
aW5jbHVkZSAiY3B1LmgiCj4+PiAgICAKPj4+ICAgIC8qCj4+PiArICogUHJvY2Vzc29ycyB3aGlj
aCBoYXZlIHNlbGYtc25vb3BpbmcgY2FwYWJpbGl0eSBjYW4gaGFuZGxlIGNvbmZsaWN0aW5nCj4+
PiArICogbWVtb3J5IHR5cGUgYWNyb3NzIENQVXMgYnkgc25vb3BpbmcgaXRzIG93biBjYWNoZS4g
SG93ZXZlciwgdGhlcmUgZXhpc3RzCj4+PiArICogQ1BVIG1vZGVscyBpbiB3aGljaCBoYXZpbmcg
Y29uZmxpY3RpbmcgbWVtb3J5IHR5cGVzIHN0aWxsIGxlYWRzIHRvCj4+PiArICogdW5wcmVkaWN0
YWJsZSBiZWhhdmlvciwgbWFjaGluZSBjaGVjayBlcnJvcnMsIG9yIGhhbmdzLiBDbGVhciB0aGlz
Cj4+PiArICogZmVhdHVyZSB0byBwcmV2ZW50IGl0cyB1c2Ugb24gbWFjaGluZXMgd2l0aCBrbm93
biBlcnJhdGFzLgo+Pj4gKyAqLwo+Pj4gK3N0YXRpYyB2b2lkIF9faW5pdCBjaGVja19tZW1vcnlf
dHlwZV9zZWxmX3Nub29wX2VycmF0YSh2b2lkKQo+Pj4gK3sKPj4+ICsJc3dpdGNoIChib290X2Nw
dV9kYXRhLng4Nl9tb2RlbCkgewo+Pj4gKwljYXNlIDB4MGY6IC8qIE1lcm9tICovCj4+PiArCWNh
c2UgMHgxNjogLyogTWVyb20gTCAqLwo+Pj4gKwljYXNlIDB4MTc6IC8qIFBlbnJ5biAqLwo+Pj4g
KwljYXNlIDB4MWQ6IC8qIER1bm5pbmd0b24gKi8KPj4+ICsJY2FzZSAweDFlOiAvKiBOZWhhbGVt
ICovCj4+PiArCWNhc2UgMHgxZjogLyogQXVidXJuZGFsZSAvIEhhdmVuZGFsZSAqLwo+Pj4gKwlj
YXNlIDB4MWE6IC8qIE5laGFsZW0gRVAgKi8KPj4+ICsJY2FzZSAweDJlOiAvKiBOZWhhbGVtIEVY
ICovCj4+PiArCWNhc2UgMHgyNTogLyogV2VzdG1lcmUgKi8KPj4+ICsJY2FzZSAweDJjOiAvKiBX
ZXN0bWVyZSBFUCAqLwo+Pj4gKwljYXNlIDB4MmE6IC8qIFNhbmR5QnJpZGdlICovCj4+IEl0IHdv
dWxkIGhhdmUgYmVlbiBuaWNlIGlmIHRoZSBlcnJhdGEgaGFkIGFjdHVhbGx5IGJlZW4gaWRlbnRp
ZmllZC4uLgo+IEluZGVlZDsgSSBob3BlIHlvdSBkb24ndCBleHBlY3QgbWUgdG8gZ28gaHVudCB0
aGVtIGRvd24uIEknbQo+IGNsb25pbmcgYSBMaW51eCBjb21taXQgaGVyZSBvbmx5LCBhZnRlciBh
bGwuCgpObyAtIEkgZG9uJ3QgZXhwZWN0IHlvdSB0byBodW50IHRoZW0gZG93bi4KCkknbGwgdHJ5
IHRvIGtlZXAgYW4gZXllIG91dCBuZXh0IHRpbWUgSSdtIGluIHRoZSByZWxldmFudCBkb2N1bWVu
dHMuCgo+Cj4+PiArCQlzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9GRUFUVVJFX1NTKTsKPj4gSSdt
IHJlZ3JldHRpbmcgZXhwb3NpbmcgU1MgdG8gZ3Vlc3RzIGF0IHRoaXMgcG9pbnQuCj4+Cj4+IEFz
IHRoaXMgc3RhbmRzLCBpdCB3aWxsIHJlc3VsdCBpbiBhIG1pZ3JhdGlvbiBjb21wYXRpYmlsaXR5
IGlzc3VlLAo+PiBiZWNhdXNlIHVwZGF0aW5nIFhlbiB3aWxsIGNhdXNlIGEgZmVhdHVyZSB0byBk
aXNhcHBlYXIuwqAgSWYgd2UgaGFkIGEKPj4gZGVmYXVsdCB2cyBmdWxsIHBvbGljeSBzcGxpdCwg
dGhpcyB3b3VsZCBiZSBlYXN5IGVub3VnaCB0byB3b3JrIGFyb3VuZAo+PiBpbiBhIGNvbXBhdGli
bGUgd2F5LsKgIEkgd29uZGVyIGlmIHRoZXJlIGlzIGFueXRoaW5nIGNsZXZlciB3ZSBjYW4gZG8g
aW4KPj4gdGhlIG1lYW50aW1lIGFzIGEgc3RvcGdhcCB3b3JrYXJvdW5kLgo+IFNob3VsZCB3ZSBw
ZXJoYXBzIGludHJvZHVjZSBYODZfRkVBVFVSRV9YRU5fU0VMRlNOT09QLCBqdXN0IGxpa2UKPiB3
ZSBkbyBmb3IgU01FUCBhbmQgU01BUCwgc3VjaCB0aGF0IHdlIGNhbiBsZWF2ZSB0aGUgcmVhbCBv
bmUgYWxvbmU/CgpBaCB5ZXMgLSB0aGF0IHdpbGwgZG8ganVzdCBmaW5lLgoKV2hlbiB3ZSBnZXQg
YSBkZWZhdWx0L21heCBzcGxpdCwgSSdsbCB0cnkgdG8gcmVtZW1iZXIgdG8gdGFrZSBpdCBiYWNr
IG91dC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
