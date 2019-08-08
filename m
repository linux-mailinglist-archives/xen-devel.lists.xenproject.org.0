Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD985F78
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 12:24:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvfXa-0000ur-IO; Thu, 08 Aug 2019 10:21:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvfXY-0000um-BN
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 10:21:00 +0000
X-Inumbo-ID: 363a4318-b9c6-11e9-9366-43534406f063
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 363a4318-b9c6-11e9-9366-43534406f063;
 Thu, 08 Aug 2019 10:20:58 +0000 (UTC)
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
IronPort-SDR: Yy3qjDCM9grUN+oP1QBvlZKJw/RJZAt3VDUWSz8RCXifOtIqwn5j0fqqBk/8vd+Oc/9zBrV9hQ
 jYalBhpKjLbnQOS1wYAsQv9whm9gC1NzmZAwig/zzhWxN3baCL4gYRt85LeGTEKghstfb9Qb5G
 YuRDdlMMNGoot0fkZxC9C9x0ObN8YfoJ1Zzj8EZIKD88866dUSuZ+D067KRM9voxf8CAL5xmc2
 cKh6kM1rK596iyXmKXh+/HEnlnQ2P4ZYn9nYWIOG4KImdlAX+3D/b2wwaU4UnjHJWM9o7eTkFv
 Bno=
X-SBRS: 2.7
X-MesageID: 4201988
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4201988"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
 <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
 <f600730d-744d-bbd4-57c2-801d6b9eb380@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c0530730-1a7b-5673-4c4d-9d6179384025@citrix.com>
Date: Thu, 8 Aug 2019 11:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f600730d-744d-bbd4-57c2-801d6b9eb380@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAxMDozNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOC4wOC4xOSAx
MDozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDgvMDgvMjAxOSAwNTo1MCwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+IE9uIDA3LjA4LjE5IDIwOjExLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+Cj4+Pj4gPHNuaXA+Cj4+Pj4gSXRzIG5vdCBleGFjdGx5IHRoZSBlYXNpZXN0IHRvIGR1
bXAgdG8gZm9sbG93Lgo+Pj4+Cj4+Pj4gRmlyc3Qgb2YgYWxsIC0gSSBkb24ndCBzZWUgd2h5IHRo
ZSBob2xkL2Jsb2NrIHRpbWUgYXJlIHByaW50ZWQgbGlrZQo+Pj4+IHRoYXQuwqAgSXQKPj4+PiBt
aWdodCBiZSBhIGhvbGRvdmVyIGZyb20gdGhlIDMyYml0IGJ1aWxkLCBwcmUgUFJJZDY0IHN1cHBv
cnQuwqAgVGhleQo+Pj4+IHNob3VsZAo+Pj4+IHByb2JhYmx5IHVzZSBQUklfc3RpbWUgYW55d2F5
Lgo+Pj4KPj4+IEZpbmUgd2l0aCBtZS4KPj4+Cj4+Pj4gVGhlIGRvbWlkIHJlbmRlcmluZyBpcyB1
bmZvcnR1bmF0ZS7CoCBJZGVhbGx5IHdlJ2QgdXNlICVwZCBidXQgdGhhdAo+Pj4+IHdvdWxkCj4+
Pj4gaW52b2x2ZSByZWFycmFuZ2luZyB0aGUgbG9naWMgdG8gZ2V0IGEgc3RydWN0IGRvbWFpbiog
aW4gaGFuZC4KPj4+PiBTZWVpbmcgYXMKPj4+PiB5b3UncmUgdGhlIGxhc3QgcGVyc29uIHRvIG1v
ZGlmeSB0aGlzIGNvZGUsIGhvdyBoYXJkIHdvdWxkIHRoYXQgYmUgdG8KPj4+PiBkbz8KPj4+Cj4+
PiBJdCB3b3VsZCBjb21wbGV0ZWx5IGJyZWFrIHRoZSBzdHJ1Y3QgdHlwZSBhZ25vc3RpYyBkZXNp
Z24uCj4+Cj4+IE9rLsKgIEFzIGFuIGFsdGVybmF0aXZlbHksIGhvdyBhYm91dCAlcGRyIHdoaWNo
IHRha2VzIGEgcmF3IGRvbWlkP8KgIEl0Cj4+IHdvdWxkIGJlIGEgdHJpdmlhbCBhZGp1c3RtZW50
IGluIHRoZSB2c25wcmludGYgY29kZSwgYW5kIGNvdWxkIHBsYXVzaWJseQo+PiBiZSB1c2VmdWwg
ZWxzZXdoZXJlIHdoZXJlIHdlIGhhdmUgYSBkb21pZCBhbmQgbm90IGEgZG9tYWluIHBvaW50ZXIu
Cj4KPiBMb2NrIHByb2ZpbGluZyBoYXMgbm8ga25vd2xlZGdlIHRoYXQgaXQgaXMgd29ya2luZyBv
biBhIHN0cnVjdCBkb21haW4uCj4gSXQgaXMganVzdCB3b3JraW5nIG9uIGEgbG9jayBpbiBhIHN0
cnVjdCBhbmQgYW4gaW5kZXggdG8gZGlmZmVyZW50aWF0ZQo+IHRoZSBzdHJ1Y3QgaW5zdGFuY2Uu
IFVzaW5nIHRoZSBkb21pZCBhcyB0aGUgaW5kZXggaXMganVzdCBmb3IgbWFraW5nIGl0Cj4gbW9y
ZSBlYXN5IHRvIHVuZGVyc3RhbmQgdGhlIHByaW50b3V0Lgo+Cj4gSSB3b3VsZG4ndCB3YW50IGUu
Zy4gYSBwZXItZXZlbnQgbG9jayB0byBiZSBuYW1lZCAiSURMRSIganVzdCBiZWNhdXNlCj4gaXQg
aGFwcGVucyB0byBiZSBpbmRleCAzMjc2Ny4KCk9rLCBidXQgY2xlYXJseSB0aGVyZSBpcyBzb21l
dGhpbmcgd2hpY2ggZGlzdGluZ3Vpc2hlcyBkb21haW4gaW5kaWNlcwpmcm9tIG90aGVyIGluZGlj
ZXM/Cgo+Cj4+Cj4+Pgo+Pj4+IFdlIGhhdmUgc2V2ZXJhbCBnbG9iYWwgbG9ja3MgY2FsbGVkIGxv
Y2s6Cj4+Pj4KPj4+PiDCoMKgwqAgKFhFTikgR2xvYmFsIGxvY2s6IGFkZHI9ZmZmZjgyZDA4MDgx
ODFlMCwgbG9ja3ZhbD0xMDAwMSwgY3B1PTQwOTUKPj4+PiDCoMKgwqAgKFhFTinCoMKgIGxvY2s6
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMSgwMDAwMDAwMDowMTMyMjE2NSksIGJsb2NrOgo+Pj4+IDAo
MDAwMDAwMDA6MDAwMDAwMDApCj4+Pj4gwqDCoMKgIChYRU4pIEdsb2JhbCBsb2NrOiBhZGRyPWZm
ZmY4MmQwODA4MTdjYzAsIGxvY2t2YWw9MTAwMDEwLCBjcHU9NDA5NQo+Pj4+IMKgwqDCoCAoWEVO
KcKgwqAgbG9jazrCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKDAwMDAwMDAwOjAwMDAwMDAwKSwgYmxv
Y2s6Cj4+Pj4gMCgwMDAwMDAwMDowMDAwMDAwMCkKPj4+PiDCoMKgwqAgKFhFTikgR2xvYmFsIGxv
Y2s6IGFkZHI9ZmZmZjgyZDA4MDgxNzgwMCwgbG9ja3ZhbD0wMDAwLCBjcHU9NDA5NQo+Pj4+IMKg
wqDCoCAoWEVOKcKgwqAgbG9jazrCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKDAwMDAwMDAwOjAwMDAw
MDAwKSwgYmxvY2s6Cj4+Pj4gMCgwMDAwMDAwMDowMDAwMDAwMCkKPj4+PiDCoMKgwqAgKFhFTikg
R2xvYmFsIGxvY2s6IGFkZHI9ZmZmZjgyZDA4MDgxNzc4MCwgbG9ja3ZhbD0wMDAwLCBjcHU9NDA5
NQo+Pj4+IMKgwqDCoCAoWEVOKcKgwqAgbG9jazrCoMKgwqDCoMKgwqDCoMKgwqDCoCAwKDAwMDAw
MDAwOjAwMDAwMDAwKSwgYmxvY2s6Cj4+Pj4gMCgwMDAwMDAwMDowMDAwMDAwMCkKPj4+PiDCoMKg
wqAgKFhFTikgR2xvYmFsIGxvY2s6IGFkZHI9ZmZmZjgyZDA4MDgxNzUxMCwgbG9ja3ZhbD0wMDAw
LCBjcHU9NDA5NQo+Pj4+IMKgwqDCoCAoWEVOKcKgwqAgbG9jazrCoMKgwqDCoMKgwqDCoMKgwqDC
oCAwKDAwMDAwMDAwOjAwMDAwMDAwKSwgYmxvY2s6Cj4+Pj4gMCgwMDAwMDAwMDowMDAwMDAwMCkK
Pj4+Pgo+Pj4+IFRoZSBzZWNvbmQgb25lIGluIHBhcnRpY3VsYXIgaGFzIGNvcnJ1cHQgZGF0YSwg
c2VlaW5nIGhhcyBpdCBoYXMgYmVlbgo+Pj4+IHRha2VuCj4+Pj4gYW5kIHJlbGVhc2VkIHNldmVy
YWwgdGltZXMgd2l0aG91dCBsb2NrX2NudCBpbmNyZWFzaW5nLgo+Pj4KPj4+IFRoZSBsb2NrIG1p
Z2h0IGhhdmUgYmVlbiB0YWtlbi9yZWxlYXNlZCBiZWZvcmUgbG9jayBwcm9maWxpbmcgaGFzIGJl
ZW4KPj4+IGluaXRpYWxpemVkLgo+Pgo+PiBXaGF0IGlzIHRoZXJlIHRvIGluaXRpYWxpc2U/wqAg
SXQgYWxsIGxvb2tzIHN0YXRpY2FsbHkgc2V0IHVwLgo+Cj4gbG9jay0+cHJvZmlsZSBpcyBzZXQg
b25seSBpbiBsb2NrX3Byb2ZfaW5pdCgpLgoKQWggLSBzbyBpdCBpcy7CoCBJIHdvbmRlciBpZiB0
aGlzIGNhbiBiZSBkb25lIGF0IGNvbXBpbGUgdGltZT/CoCBJdHMganVzdAphIGJhY2tyZWZlcmVu
Y2UgZm9yIHRoZSBmb3J3YXJkIHJlZmVyZW5jZSB3aGljaCBpcyBkb25lIGF0LgoKKFdvdyB0aGlz
IGNvZGUgaXMgY29tcGxpY2F0ZWQgdG8gZm9sbG93KS7CoCBJIHRoaW5rIGl0IGNhbiBiZSBkb25l
IHdpdGggYQpmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0YXRpYyBzdHJ1Y3QgbG9ja19wcm9maWxl
Cl9fbG9ja19wcm9maWxlX2RhdGFfIyNsIGFuZCBwYXNzaW5nIHNvbWV0aGluZyBvdGhlciB0aGFu
IE5VTEwgaW50bwpfU1BJTl9MT0NLX1VOTE9DS0VEKCksIGJ1dCB0aGF0IHdpbGwgYnJlYWsgdGhl
IGFiaWxpdHkgdG8gZG8gc3RhdGljCkRFRklORV9TUElOTE9DSygpLgoKUHJvYmFibHkgbm90IHdv
cnRoIG1lc3Npbmcgd2l0aCB0aGlzIG5vdywgYnV0IHBlcmhhcHMgc29tZXRoaW5nIHRvIHRoaW5r
Cm92ZXIuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
