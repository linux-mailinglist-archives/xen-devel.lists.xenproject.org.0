Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98C7C560
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 16:52:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hspub-0002Nt-S2; Wed, 31 Jul 2019 14:49:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWEJ=V4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hspua-0002No-1p
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 14:49:04 +0000
X-Inumbo-ID: 534cb8b6-b3a2-11e9-96cd-8f4173fe3beb
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 534cb8b6-b3a2-11e9-96cd-8f4173fe3beb;
 Wed, 31 Jul 2019 14:48:58 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aEvRUJ1b34LfsJRaU1ri9FCdkswsAEmZAJi3UZPx2mJlZrxbWBpGZTKwm4vM5pA+pNH3MAvZKt
 /mLta8WzD99O5nYxpmqcivlZ+3RoYyvD3v5CEluYoZ5Rx/luJ3Buel2frYBgoZGTy5JznbSfMd
 JN3ySBZVq58zGe6jAl1vqV4yroRsdpyNPIcBSWbfgf+4YAFQNohJ+JHMyw3H5qvAxH3nD73tNe
 M2zKK9zUte9MfIDGyKZChrT8kWrUGOw4eHZnKlqVcfwTIvdLWp2DIh6xGTpA2IfxFPk9tjgyfc
 0To=
X-SBRS: 2.7
X-MesageID: 3806895
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,330,1559534400"; 
   d="scan'208";a="3806895"
To: <xen-devel@lists.xenproject.org>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-6-julien.grall@arm.com>
 <alpine.DEB.2.21.1907291500210.1237@sstabellini-ThinkPad-T480s>
 <d4f7330a-ad8d-032f-2020-efcf649c4312@arm.com>
 <alpine.DEB.2.21.1907300959470.28600@sstabellini-ThinkPad-T480s>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a613bab7-8e88-8a4f-6298-42d8baef6517@citrix.com>
Date: Wed, 31 Jul 2019 15:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907300959470.28600@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/7] xen/arm: traps: Avoid BUG_ON() in
 do_trap_brk()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDcvMjAxOSAxODowMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MzAgSnVsIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgU3RlZmFubywKPj4KPj4gT24g
Ny8yOS8xOSAxMTowMiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gVHVlLCAy
MyBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEF0IHRoZSBtb21lbnQsIGRvX3Ry
YXBfYnJrKCkgaXMgdXNpbmcgYSBCVUdfT04oKSB0byBjaGVjayB0aGUgaGFyZHdhcmUKPj4+PiBo
YXMgYmVlbiBjb3JyZWN0bHkgY29uZmlndXJlZCBkdXJpbmcgYm9vdC4KPj4+Pgo+Pj4+IEFueSBl
cnJvciB3aGVuIGNvbmZpZ3VyaW5nIHRoZSBoYXJkd2FyZSBjb3VsZCByZXN1bHQgdG8gYSBndWVz
dCAnYnJrJwo+Pj4+IHRyYXBwaW5nIGluIHRoZSBoeXBlcnZpc29yIGFuZCBjcmFzaCBpdC4KPj4+
Pgo+Pj4+IFRoaXMgaXMgcHJldHR5IGhhcnNoIHRvIGtpbGwgWGVuIHdoZW4gYWN0dWFsbHkga2ls
bGluZyB0aGUgZ3Vlc3Qgd291bGQKPj4+PiBiZSBlbm91Z2ggYXMgbWlzY29uZmlndXJpbmcgdGhp
cyB0cmFwIHdvdWxkIG5vdCBsZWFkIHRvIGV4cG9zaW5nCj4+Pj4gc2Vuc2l0aXZlIGRhdGEuIFJl
cGxhY2UgdGhlIEJVR19PTigpIHdpdGggY3Jhc2hpbmcgdGhlIGd1ZXN0Lgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+PiAtLS0K
Pj4+PiAgIHhlbi9hcmNoL2FybS90cmFwcy5jIHwgMTEgKysrKysrKystLS0KPj4+PiAgIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+Pj4+
IGluZGV4IDEzMjY4NmVlMGYuLmVmMzdjYTZiZGUgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMKPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+Pj4+IEBAIC0xMzA0
LDEwICsxMzA0LDE1IEBAIGludCBkb19idWdfZnJhbWUoY29uc3Qgc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MsCj4+Pj4gdmFkZHJfdCBwYykKPj4+PiAgICNpZmRlZiBDT05GSUdfQVJNXzY0Cj4+
Pj4gICBzdGF0aWMgdm9pZCBkb190cmFwX2JyayhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywg
Y29uc3QgdW5pb24gaHNyIGhzcikKPj4+PiAgIHsKPj4+PiAtICAgIC8qIEhDUl9FTDIuVEdFIGFu
ZCBNRENSX0VMMi5UREUgYXJlIG5vdCBzZXQgc28gd2UgbmV2ZXIgcmVjZWl2ZQo+Pj4+IC0gICAg
ICogc29mdHdhcmUgYnJlYWtwb2ludCBleGNlcHRpb24gZm9yIEVMMSBhbmQgRUwwIGhlcmUuCj4+
Pj4gKyAgICAvKgo+Pj4+ICsgICAgICogSENSX0VMMi5UR0UgYW5kIE1EQ1JfRUwyLlREUiBhcmUg
Y3VycmVudGx5IG5vdCBzZXQuIFNvIHdlIHNob3VsZAo+Pj4+ICsgICAgICogbmV2ZXIgcmVjZWl2
ZSBzb2Z0d2FyZSBicmVha3BvaW5nIGV4Y2VwdGlvbiBmb3IgRUwxIGFuZCBFTDAgaGVyZS4KPj4+
PiAgICAgICAgKi8KPj4+PiAtICAgIEJVR19PTighaHlwX21vZGUocmVncykpOwo+Pj4+ICsgICAg
aWYgKCAhaHlwX21vZGUocmVncykgKQo+Pj4+ICsgICAgewo+Pj4+ICsgICAgICAgIGRvbWFpbl9j
cmFzaChjdXJyZW50LT5kb21haW4pOwo+Pj4+ICsgICAgICAgIHJldHVybjsKPj4+PiArICAgIH0K
Pj4+IFRoaXMgaXMgYSBnb29kIGNoYW5nZSB0byBoYXZlLiBJIGFtIHdvbmRlcmluZyBpZiBpdCB3
b3VsZCBtYWtlIHNlbnNlIHRvCj4+PiBhbHNvIHByaW50ayBzb21lIGRlYnVnIG1lc3NhZ2VzLCBt
YXliZSBldmVuIHNob3dfZXhlY3V0aW9uX3N0YXRlLiBJZiBzbywKPj4+IHdlIG5lZWQgdG8gYmUg
Y2FyZWZ1bCB0aGF0IGl0J3Mgb25seSBkb25lIGluIGRlYnVnIGJ1aWxkcywgb3IgaXQgaXMgcmF0
ZQo+Pj4gbGltaXRlZC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+IE1lc3NhZ2VzIGFyZSBhbHJlYWR5
IHByaW50ZWQgYnkgZG9tYWluX2NyYXNoKC4uLikuIEJ1dCBJIGRvbid0IHNlZSB0aGUgY29uY2Vy
bgo+PiBhYm91dCBub24tZGVidWcgYnVpbGQgb3IgZXZlbiBub3QgcmF0ZSBsaW1pdGluZy4uLiBJ
ZiB0aGUgZG9tYWluIGNyYXNoLCB0aGVuCj4+IGl0IHdpbGwgbm90IGNhdXNlIGFueW1vcmUgcHJp
bnQgYW5kIHRoZXJlZm9yZSB5b3UgY2FuJ3Qgc3BhbSB0aGUgY29uc29sZSBoZXJlLgo+IEFoIHll
cywgeW91IGFyZSBxdWl0ZSByaWdodAoKSSBzdGlsbCBoYXZlIGEgc2VyaWVzIHBlbmRpbmcgdG8g
Zm9yY2UgcGVvcGxlIHRvIHB1dCBhIHVzZWZ1bCBwcmludGsoKQppbiwgYmVjYXVzZSB0aGVyZSBp
cyBub3RoaW5nIG1vcmUgaW5mdXJpYXRpbmcgdGhhbiB0byBmaW5kIGEKZG9tYWluX2NyYXNoKCkg
d2l0aCBubyBjbGFyaWZ5aW5nIGNvbnRleHQuCgpJdCBzaG91bGQgYmUgYSBncHJpbnRrKFhFTkxP
R19FUlIsIGFuZCB3aWxsIGV2ZW50dWFsbHkgYmUgZm9sZGVkIGludG8KZG9tYWluX2NyYXNoKCkn
cyBwcm90b3R5cGUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
