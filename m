Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2E5161E85
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 02:26:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3raQ-00068y-GB; Tue, 18 Feb 2020 01:22:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j3raP-00068t-Ci
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 01:22:05 +0000
X-Inumbo-ID: 117e70ca-51ed-11ea-80bd-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 117e70ca-51ed-11ea-80bd-12813bfff9fa;
 Tue, 18 Feb 2020 01:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581988923;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=LoqR9zr0ttNL5fFdy2TiNOlOf2DNNxifnLx8UfBbXLw=;
 b=EYOS3Lj/1m3Cy1Xj5f/ETmt2ZWe6U2ELCU6WZjqO/2Cpel0JuE5JsKjG
 BeMTloIDSUeeaU2OmF1lPJtSM2keGWBElHCzAv1S5nbwGVo8o1cDvNw1B
 ZXqgfK6KNhAtjDb5PEzJ2ZBWPMf+Jhj05v8a9CaagAiWJjf3AWc5LX60v k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ne6pbezVcTTDPfOTkq5iWMe2bv1NuXlpxtOwVfjzKFf0QOktRbLSkmTpiiLhC/uYPZEsa/2Bdx
 +Hv1trE6U/ajm8utghGazbA2lM76KfmIklm7okIdmFSy3CrP8R4YCVjo1gleXe1lV+vN0+hK4c
 sGXckc0sLfbHPifXox5ixxFhR1/ovUdYaoIq95yoRSezH6629hF+rKHIK0AgjeB5QZzvI0WQu1
 ZbHtJpwbe8idqYWBMpFWVs9uNFnHVOjT5nVwq0yv+eUG95rAMU8+ESpcZjMYHOquYIus67TYzu
 +EA=
X-SBRS: 2.7
X-MesageID: 13214470
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,454,1574139600"; d="scan'208";a="13214470"
To: Jason Andryuk <jandryuk@gmail.com>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
Date: Tue, 18 Feb 2020 01:21:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Aaron Janse <aaron@ajanse.me>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAyMDo0MSwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiBNb24sIEZlYiAx
NywgMjAyMCBhdCAyOjQ2IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiBPbiAxNy8wMi8yMDIwIDE5OjE5LCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+
Pj4gZW5hYmxpbmcgdmVjT24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgNTo0MyBBTSBBYXJvbiBKYW5z
ZSA8YWFyb25AYWphbnNlLm1lPiB3cm90ZToKPj4+PiBPbiBUdWUsIERlYyAzMSwgMjAxOSwgYXQg
MTI6MjcgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IElzIHRoZXJlIGFueSBmdWxsIGJv
b3QgbG9nIGluIHRoZSBiYWQgY2FzZT8gIERlYnVnZ2luZyB2aWEgZGl2aW5hdGlvbgo+Pj4+PiBp
c24ndCBhbiBlZmZlY3RpdmUgd2F5IHRvIGdldCB0aGluZ3MgZG9uZS4KPj4+PiBBZ3JlZWQuIEkg
aW5jbHVkZWQgc29tZSBtb3JlIHZlcmJvc2UgbG9ncyB0b3dhcmRzIHRoZSBlbmQgb2YgdGhlIGVt
YWlsICh0eXBlZCB1cCBieSBoYW5kKS4KPj4+Pgo+Pj4+IEF0dGFjaGVkIGFyZSBwaWN0dXJlcyBm
cm9tIGEgc2xvdy1tb3Rpb24gdmlkZW8gb2YgbXkgbGFwdG9wIGJvb3RpbmcuIE5vdGUgdGhhdCBJ
IGFsc28gaW5jbHVkZWQgYSBwaWN0dXJlIG9mIGEgc3RhY2sgdHJhY2UgdGhhdCBoYXBwZW5zIGlt
bWVkaWF0ZWx5IGJlZm9yZSByZWJvb3QuIEl0IGRvZXNuJ3QgbG9vayByZWxhdGVkLCBidXQgSSB3
YW50ZWQgdG8gaW5jbHVkZSBpdCBhbnl3YXkuCj4+Pj4KPj4+PiBJIHRoaW5rIHRoZSBvcmlnaW5h
bCBlbWFpbCBzaG91bGQgaGF2ZSBzYWlkICI0LjguNSIgaW5zdGVhZCBvZiAiNC4wLjUuIiBSZWdh
cmRsZXNzLCBldmVyeW9uZSBvbiB0aGlzIG1haWxpbmcgbGlzdCBjYW4gbm93IHNlZSBhbGwgdGhl
IGJvb3QgbG9ncyB0aGF0IEkndmUgc2Vlbi4KPj4+Pgo+Pj4+IEF0dGFjaGluZyBhIHNlcmlhbCBj
b25zb2xlIHNlZW1zIGxpa2UgaXQgd291bGQgYmUgZGlmZmljdWx0IHRvIGRvIG9uIHRoaXMgbGFw
dG9wLCBvdGhlcndpc2UgSSB3b3VsZCBoYXZlIHNlbnQgdGhlIGxvZ3MgYXMgYSB0eHQgZmlsZS4K
Pj4+IEknbSBzZWVpbmcgWGVuIHBhbmljOiAiSU8tQVBJQyArIHRpbWVyIGRvZXNuJ3Qgd29yayIg
b24gYSBEZWxsCj4+PiBMYXRpdHVkZSA3MjAwIDItaW4tMS4gIEZlZG9yYSAzMSBMaXZlIFVTQiBp
bWFnZSBib290cyBzdWNjZXNzZnVsbHkuCj4+PiBObyB3YXkgdG8gZ2V0IHNlcmlhbCBvdXRwdXQu
ICBJIG1hbnVhbGx5IHJlY3JlYXRlZCB0aGUgb3V0cHV0IGJlZm9yZQo+Pj4gZnJvbSB0aGUgdmdh
IGRpc3BsYXkuCj4+IFdlIGhhdmUgbXVsdGlwbGUgYnVncy4KPj4KPj4gRmlyc3QgYW5kIGZvcmVt
b3N0LCBYZW4gc2VlbXMgdG90YWxseSBicm9rZW4gd2hlbiBydW5uaW5nIGluIEV4dElOVAo+PiBt
b2RlLiAgVGhpcyBuZWVkcyBhZGRyZXNzaW5nLCBhbmQgb3VnaHQgdG8gYmUgc3VmZmljaWVudCB0
byBsZXQgWGVuCj4+IGJvb3QsIGF0IHdoaWNoIHBvaW50IHdlIGNhbiB0cnkgdG8gZmlndXJlIG91
dCB3aHkgaXQgaXMgdHJ5aW5nIHRvIGZhbGwKPj4gYmFjayBpbnRvIDQ4Nihpc2gpIGNvbXBhdGli
aWxpdHkgbW9kZS4KPj4KPj4+IEkgdGVzdGVkIExpbnV4IHdpdGggaW50ZWxfaW9tbXU9b24gYW5k
IHRoYXQgYm9vdGVkIHN1Y2Nlc3NmdWxseS4KPj4+IFVuZGVyIFhlbiwgdGhpcyBzeXN0ZW0gc2V0
cyBpb21tdV94MmFwaWNfZW5hYmxlZCA9IHRydWUsIHNvCj4+PiBmb3JjZV9pb21tdSBpcyBzZXQg
YW5kIGlvbW11PTAgY2Fubm90IGRpc2FibGUgdGhlIGlvbW11Lgo+Pj4gZmFpbHMuICBPaCwgSSBj
YW4gZGlzYWJsZSB4MmFwaWMgYW5kIHRoZW4gZGlzYWJsZSBpb21tdQo+Pj4KPj4+IHgyYXBpYz0x
IC0+IGZhaWx1cmUgYWJvdmUKPj4+IHgyYXBpYz0wIGlvbW11PTAgLT4gZmFpbHVyZSBhYm92ZQo+
Pj4gY2xvY2tzb3VyY2U9YWNwaSAtPiBkb2Vzbid0IGhlbHAKPj4+IGNsb2Nrc291cmNlPXBpdCAt
PiBoYW5ncyBhZnRlciAibG9hZCB0cmFja2luZyB3aW5kb3cgbGVuZ3RoIDEwNzM3NDE4MjQgbnMi
Cj4+IE5vbmUgb2YgdGhlc2UgYXJlIHN1cnByaXNpbmcsIGdpdmVuIHRoYXQgWGVuIGNhbid0IG1h
a2UgYW55IGludGVycnVwdHMKPj4gd29yayBhdCBhbGwuCj4+Cj4+PiBub2FwaWMgLT4gQlVHIGlu
IGluaXRfYnNwX0FQSUMKPj4gVGhpcyBpcyBhIHN1cnByaXNlLiAgSXRzIGNsZWFybHkgYSBidWcg
aW4gWGVuLiAgKE9UT0gsIEkndmUgYmVlbgo+PiB0aHJlYXRlbmluZyB0byByaXAgYWxsIG9mIHRo
YXQgbG9naWMgb3V0LCBiZWNhdXNlIHRoZXJlIGlzIG5vIHN1Y2ggdGhpbmcKPj4gYXMgYSA2NGJp
dCBjYXBhYmxlIHN5c3RlbSB3aXRob3V0IGFuIGludGVncmF0ZWQgQVBJQy4pCj4gSXQncyBhIEdQ
RiBbZXJyb3JfY29kZT0wMDAwXSBhdCBpbml0X2JzcF9BUElDKzB4NTMgd2hpY2ggaXMKPiAgICAg
MHhmZmZmODJkMDgwNDI4Zjg2IDwrNjQ+OiAgICBqZSAgICAgMHhmZmZmODJkMDgwNDI4ZmM5IDxp
bml0X2JzcF9BUElDKzEzMT4KPiAgICAgMHhmZmZmODJkMDgwNDI4Zjg4IDwrNjY+OiAgICBvciAg
ICAgJDB4ZmYsJWFsCj4gICAgIDB4ZmZmZjgyZDA4MDQyOGY4YSA8KzY4PjogICAgdGVzdCAgICVz
aWwsJXNpbAo+ICAgICAweGZmZmY4MmQwODA0MjhmOGQgPCs3MT46ICAgIGplICAgICAweGZmZmY4
MmQwODA0MjhmZDggPGluaXRfYnNwX0FQSUMrMTQ2Pgo+ICAgICAweGZmZmY4MmQwODA0MjhmOGYg
PCs3Mz46ICAgIG1vdiAgICAkMHg4MGYsJWVjeAo+ICAgICAweGZmZmY4MmQwODA0MjhmOTQgPCs3
OD46ICAgIG1vdiAgICAkMHgwLCVlZHgKPiAgICAgMHhmZmZmODJkMDgwNDI4Zjk5IDwrODM+OiAg
ICB3cm1zcgo+Cj4gUkFYIGlzIDB4M2ZmCj4KPiBUaGlzIGlzIGltbWVkaWF0ZWx5IGFmdGVyIFhl
biBwcmludHMgIlN3aXRjaGVkIHRvIEFQSUMgZHJpdmVyIHgyYXBpY19jbHVzdGVyIgoKSG1tLCBp
biB3aGljaCBjYXNlIGl0IGlzbid0IGEgQlVHIHNwZWNpZmljYWxseSwgYnV0IG1lcmVseSBhIGNy
YXNoLiAKMHgzZmYgdG8gU1BJViBpcyB0cnlpbmcgdG8gc2V0IHJlc2VydmVkIGJpdHMsIHNvIGl0
IGlzIG5vIHN1cnByaXNlIHRoYXQgCnRoZXJlIGlzIGEgI0dQLgoKSW4gd2hpY2ggY2FzZSB0aGlz
IGNhbiBzYWZlbHkgYmUgZmlsZWQgdW5kZXIgImV2ZW4gbW9yZSBjb2xsYXRlcmFsIApkYW1hZ2Ug
ZnJvbSBmYWlsaW5nIHRvIHNldCB1cCBhbnkga2luZCBvZiBpbnRlcnJ1cHQgaGFuZGxpbmciLgoK
Pj4+IE9uZSBvdGhlciB0aGluZyB0aGF0IG1pZ2h0IGJlIG5vdGV3b3J0aHkuICBMaW51eCBvbmx5
IHByaW50cyBBQ1BJIElSUTAKPj4+IGFuZCBJUlE5IHVzZWQgYnkgb3ZlcnJpZGUgd2hlcmUgWGVu
IGxpc3RzIElSUSAwLCAyICYgOS4KPj4gSHVoIC0gdGhpcyBpcyBzdXBwb3NlZCB0byBjb21lIGRp
cmVjdGx5IGZyb20gdGhlIEFDUEkgdGFibGVzLCBzbyBMaW51eAo+PiBhbmQgWGVuIHNob3VsZCBi
ZSB1c2luZyB0aGUgc2FtZSBzb3VyY2Ugb2YgaW5mb3JtYXRpb24uCj4+Cj4+PiBCZWxvdyBpcyB0
aGUgcmUtY29uc3RydWN0ZWQgWGVuIGNvbnNvbGUgb3V0cHV0LiAgVGhlIFNNQklPUyBsaW5lIGlz
Cj4+PiB0aGUgZmlyc3QgdGhpbmcgZGlzcGxheWVkIG9uIHRoZSBWR0Egb3V0cHV0Lgo+PiBZZXMg
LSBpdCBpcyB0aGUgZmlyc3QgdGhpbmcgcHJpbnRlZCBhZnRlciB2ZXNhX2luaXQoKSB3aGljaCBJ
IHRoaW5rIGlzIGEKPj4gbWFuaWZlc3RhdGlvbiBvZiBhIHByZXZpb3VzIEVGSSBidWcgSSd2ZSBy
ZXBvcnRlZC4gIERvZXMgYm9vdGluZyB3aXRoCj4+IC1iYXNldmlkZW8gaGVscD8gIChObyBuZWVk
IHRvIHRyYW5zY3JpYmUgdGhlIG91dHB1dCwgbWFudWFsbHkuICBKdXN0Cj4+IG5lZWQgdG8ga25v
dyBpZiBpdCBsZXRzIHlvdSBzZWUgdGhlIGZ1bGwgbG9nLikKPiBJJ20gYm9vdGluZyBncnViLT54
ZW4uZ3ogc28gLWJhc2V2aWRlbyBpc24ndCBkaXJlY3RseSBhcHBsaWNhYmxlLiAgTXkKPiBhdHRl
bXB0IGF0IHNldHRpbmcgYSBib290IGVudHJ5IGZhaWxlZCwgc28gSSdsbCBoYXZlIHRvIHRyeSB0
aGF0Cj4gYWdhaW4uCgpBaCBvay7CoCBPbmUgdGhpbmcgd2hpY2ggWGVuKC5neikgbmVlZHMgdG8g
ZG8gaXMgdG8gdGFrZSB2aWRlbyBkZXRhaWxzIApmcm9tIHRoZSBib290bG9hZGVyIHJhdGhlciB0
aGFuIHRyeWluZyB0byBmaWd1cmUgdGhlbSBvdXQgaXRzZWxmLgoKQnkgZGVmYXVsdCwgWGVuLmd6
IHdpbGwgdHJ5IGFuZCB3cml0ZSBpbnRvIHRoZSBsZWdhY3kgdmdhIHJhbmdlIHdoaWNoIAptb3N0
IGxpa2VseSBpc24ndCB3b3JraW5nIGluIGFuIEVGSSBzeXN0ZW0uCgooQXMgYSBzbGlnaHQgdGFu
Z2VudCwgSXQgaXMgcG9zc2libGUgdG8gdGVzdCB4ZW4uZWZpIHZpYSBncnViIHdpdGggYSAKc3Vp
dGFibGUgY2hhaW5sb2FkZXIgc3RhbnphLCBidXQgeGVuLmVmaSBpcyBkZWZpY2llbnQgaW4gZW5v
dWdoIAppbXBvcnRhbnQgd2F5cyB0aGF0IEknZCBhdm9pZCBpdCB1bmxlc3MgYWJzb2x1dGVseSBu
ZWNlc3NhcnkuKQoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
