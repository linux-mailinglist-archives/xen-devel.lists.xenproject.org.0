Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDFD8B04F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:57:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQit-0003xl-WA; Tue, 13 Aug 2019 06:56:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hgkg=WJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hxQis-0003x4-C7
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:55:58 +0000
X-Inumbo-ID: f11af68a-bd10-11e9-804c-c3be0ef22c09
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f11af68a-bd10-11e9-804c-c3be0ef22c09;
 Mon, 12 Aug 2019 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565621607;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pd3oqg1K4CYumN6rfhXTKLjB3t2d73ZpeGVwokMVJiU=;
 b=QpH9qS+viUEDEfgdbOVdIvUM3mFqvSFmZPRigdfDsXSrmy0VTh52I1Fm
 dcQ0J4VKRlBn0WeV+jEbW45HfY/HqzQVgfd2Ex66FyMYeDJHd82FOMifj
 XuEPmQMfqcTxjUTSfJi4k9r9WpfIxsJhoyHF77/F85N9onwsLaz/aqXYb w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tt9LerGVY69psNcE1r0XlUZahnS0ZucI/cFG28Is/maimPLIHY871ZOqTcoxMWUcTHgDUx1pB1
 0Ld7Z+KjweNhBNSpCinNfITphM1fRmzsMXG/YNvtNZ3eLOalZoBplzsoyL5q0AXqM/JUHpr0E3
 t5/GhK4vFGzPk6hPSG9maCGW60CUCotkQaFpaTsRnzIPty2PETEIcGQwuSIB3okLvcISQgPhrh
 9xJKVlZ8xxLxSThTr3/O6Pz606VvDzojbgR+H+2Z4m+eggRCD9C7R4IQd53GoZgQx+fc9Xe50X
 8to=
X-SBRS: 2.7
X-MesageID: 4331115
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4331115"
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <92e29dd6-0de2-09a4-86e9-e9f76341fe6f@citrix.com>
Date: Mon, 12 Aug 2019 15:53:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC84LzE5IDEwOjEzIEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmFuLAo+IAo+IE9u
IDA4LzA4LzIwMTkgMTA6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOC4wOC4yMDE5IDEw
OjQzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMDgvMDgvMjAxOSAwNzoyMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDcuMDguMjAxOSAyMTo0MSwgQW5kcmV3IENvb3BlciB3cm90
ZToKPj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+PiArKysgYi9kb2NzL2dsb3NzYXJ5LnJzdAo+Pj4+
PiBAQCAtMCwwICsxLDM3IEBACj4+Pj4+ICtHbG9zc2FyeQo+Pj4+PiArPT09PT09PT0KPj4+Pj4g
Kwo+Pj4+PiArLi4gVGVybXMgc2hvdWxkIGFwcGVhciBpbiBhbHBoYWJldGljYWwgb3JkZXIKPj4+
Pj4gKwo+Pj4+PiArLi4gZ2xvc3Nhcnk6Ogo+Pj4+PiArCj4+Pj4+ICvCoMKgIGNvbnRyb2wgZG9t
YWluCj4+Pj4+ICvCoMKgwqDCoCBBIDp0ZXJtOmBkb21haW5gLCBjb21tb25seSBkb20wLCB3aXRo
IHRoZSBwZXJtaXNzaW9uIGFuZAo+Pj4+PiByZXNwb25zaWJpbGl0eQo+Pj4+PiArwqDCoMKgwqAg
dG8gY3JlYXRlIGFuZCBtYW5hZ2Ugb3RoZXIgZG9tYWlucyBvbiB0aGUgc3lzdGVtLgo+Pj4+PiAr
Cj4+Pj4+ICvCoMKgIGRvbWFpbgo+Pj4+PiArwqDCoMKgwqAgQSBkb21haW4gaXMgWGVuJ3MgdW5p
dCBvZiByZXNvdXJjZSBvd25lcnNoaXAsIGFuZCBnZW5lcmFsbHkgaGFzCj4+Pj4+IGF0IHRoZQo+
Pj4+PiArwqDCoMKgwqAgbWluaW11bSBzb21lIFJBTSBhbmQgdmlydHVhbCBDUFVzLgo+Pj4+PiAr
Cj4+Pj4+ICvCoMKgwqDCoCBUaGUgdGVybXMgOnRlcm06YGRvbWFpbmAgYW5kIDp0ZXJtOmBndWVz
dGAgYXJlIGNvbW1vbmx5IHVzZWQKPj4+Pj4gK8KgwqDCoMKgIGludGVyY2hhbmdlYWJseSwgYnV0
IHRoZXkgbWVhbiBzdWJ0bHkgZGlmZmVyZW50IHRoaW5ncy4KPj4+Pj4gKwo+Pj4+PiArwqDCoMKg
wqAgQSBndWVzdCBpcyBhIHNpbmdsZSB2aXJ0dWFsIG1hY2hpbmUuCj4+Pj4+ICsKPj4+Pj4gK8Kg
wqDCoMKgIENvbnNpZGVyIHRoZSBjYXNlIG9mIGxpdmUgbWlncmF0aW9uIHdoZXJlLCBmb3IgYSBw
ZXJpb2Qgb2YKPj4+Pj4gdGltZSwgb25lCj4+Pj4+ICvCoMKgwqDCoCBndWVzdCB3aWxsIGJlIGNv
bXByaXNlZCBvZiB0d28gZG9tYWlucywgd2hpbGUgaXQgaXMgaW4gdHJhbnNpdC4KPj4+Pj4gKwo+
Pj4+PiArwqDCoCBkb21pZAo+Pj4+PiArwqDCoMKgwqAgVGhlIG51bWVyaWMgaWRlbnRpZmllciBv
ZiBhIHJ1bm5pbmcgOnRlcm06YGRvbWFpbmAuwqAgSXQgaXMKPj4+Pj4gdW5pcXVlIHRvIGEKPj4+
Pj4gK8KgwqDCoMKgIHNpbmdsZSBpbnN0YW5jZSBvZiBYZW4sIHVzZWQgYXMgdGhlIGlkZW50aWZp
ZXIgaW4gdmFyaW91cyBBUElzLAo+Pj4+PiBhbmQgaXMKPj4+Pj4gK8KgwqDCoMKgIHR5cGljYWxs
eSBhbGxvY2F0ZWQgc2VxdWVudGlhbGx5IGZyb20gMC4KPj4+Pj4gKwo+Pj4+PiArwqDCoCBndWVz
dAo+Pj4+PiArwqDCoMKgwqAgU2VlIDp0ZXJtOmBkb21haW5gCj4+Pj4KPj4+PiBJIHRoaW5rIHlv
dSB3YW50IHRvIG1lbnRpb24gdGhlIHVzdWFsIGRpc3RpbmN0aW9uIGhlcmU6IERvbTAgaXMsCj4+
Pj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5IG5vdCBjb25zaWRlcmVkIGEgZ3Vlc3QuCj4+Pgo+
Pj4gVG8gYmUgaG9uZXN0LCBJIGhhZCB0b3RhbGx5IGZvcmdvdHRlbiBhYm91dCB0aGF0LsKgIEkg
Z3Vlc3Mgbm93IGlzIHRoZQo+Pj4gcHJvcGVyIHRpbWUgdG8gcmVoYXNoIGl0IGluIHB1YmxpYy4K
Pj4+Cj4+PiBJIGRvbid0IHRoaW5rIHRoZSB3YXkgaXQgY3VycmVudGx5IGdldHMgdXNlZCBoYXMg
YSBjbGVhciBvciBjb2hlcmVudCBzZXQKPj4+IG9mIHJ1bGVzLCBiZWNhdXNlIEkgY2FuJ3QgdGhp
bmsgb2YgYW55IHRvIGRlc2NyaWJlIGhvdyBpdCBkb2VzIGdldCB1c2VkLgo+Pj4KPj4+IEVpdGhl
ciB0aGVyZSBhcmUgYSBjbGVhciBhbmQgY29oZXJlbnQgKGFuZCBzaW1wbGUhKSBzZXQgb2YgcnVs
ZXMgZm9yCj4+PiB3aGF0IHdlIG1lYW4gYnkgImd1ZXN0IiwgYXQgd2hpY2ggcG9pbnQgdGhleSBj
YW4gbGl2ZSBoZXJlIGluIHRoZQo+Pj4gZ2xvc3NhcnksIG9yIHRoZSBmdXp6eSB3YXkgaXQgaXMg
Y3VycmVudCB1c2VkIHNob3VsZCBjZWFzZS4KPj4KPj4gV2hhdCdzIGZ1enp5IGFib3V0IERvbTAg
bm90IGJlaW5nIGEgZ3Vlc3QgKGR1ZSB0byBiZWluZyBhIHBhcnQgb2YgdGhlCj4+IGhvc3QgaW5z
dGVhZCk/Cj4gRG9tMCBpcyBub3QgcGFydCBvZiB0aGUgaG9zdCBpZiB5b3UgYXJlIHVzaW5nIGFu
IGhhcmR3YXJlIGRvbWFpbi4gSQo+IGFjdHVhbGx5IHRob3VnaHQgd2UgcmVuYW1lZCBldmVyeXRo
aW5nIGluIFhlbiBmcm9tIERvbTAgdG8gaHdkb20gdG8KPiBhdm9pZCB0aGUgY29uZnVzaW9uLgo+
IAo+IEkgYWxzbyB3b3VsZCByYXRoZXIgYXZvaWQgdG8gdHJlYXQgImRvbTAiIGFzIG5vdCBhIGd1
ZXN0LiBJbiBub3JtYWwKPiBzZXR1cCB0aGlzIGlzIGEgbW9yZSBwcml2aWxlZ2UgZ3Vlc3QsIGlu
IG90aGVyIHNldHVwIHRoaXMgbWF5IGp1c3QgYmUgYQo+IG5vcm1hbCBndWVzdCAodGhpbmsgYWJv
dXQgcGFydGl0aW9uaW5nKS4KCkEgbGl0ZXJhbCBndWVzdCBpcyBzb21lb25lIHdobyBkb2Vzbid0
IGxpdmUgaW4gdGhlIGJ1aWxkaW5nIChvciB3b3JrIGluCnRoZSBidWxpZGluZywgaWYgeW91J3Jl
IGluIGEgaG90ZWwpLiAgVGhlIGZhY3QgdGhhdCB0aGUgc3RhZmYgY2xlYW5pbmcKcm9vbXMgYXJl
IHJlc3RyaWN0ZWQgaW4gdGhlaXIgcHJpdmlsZWdlcyBkb2Vzbid0IG1ha2UgdGhlbSBndWVzdHMg
b2YgdGhlCmhvdGVsLgoKVGhlIHRvb2xzdGFjayBkb21haW4sIHRoZSBoYXJkd2FyZSBkb21haW4s
IHRoZSBkcml2ZXIgZG9tYWluLCB0aGUKeGVuc3RvcmUgZG9tYWluLCBhbmQgc28gb24gYXJlIGFs
bCBwYXJ0IG9mIHRoZSBob3N0IHN5c3RlbSwgZGVzaWduZWQgdG8KYWxsb3cgeW91IHRvIHVzZSBY
ZW4gdG8gZG8gdGhlIHRoaW5nIHlvdSBhY3R1YWxseSB3YW50IHRvIGRvOiBSdW4gZ3Vlc3RzLgoK
QW5kIGl0J3MgaW1wb3J0YW50IHRoYXQgd2UgaGF2ZSBhIHdvcmQgdGhhdCBkaXN0aW5ndWlzaGVz
ICJkb21haW5zIHRoYXQKd2Ugb25seSBjYXJlIGFib3V0IGJlY2F1c2UgdGhleSBtYWtlIGl0IHBv
c3NpYmxlIHRvIHJ1biBvdGhlciBkb21haW5zIiwKYW5kICJkb21haW5zIHRoYXQgd2UgYWN0dWFs
bHkgd2FudCB0byBydW4iLiAgImd1ZXN0IC8gaG9zdCIgaXMgYSBuYXR1cmFsCnRlcm1pbm9sb2d5
IGZvciB0aGVzZS4KCldlIGFscmVhZHkgaGF2ZSB0aGUgd29yZCAiZG9tYWluIiwgd2hpY2ggaW5j
bHVkZXMgZG9tMCwgZHJpdmVyIGRvbWFpbnMsCnRvb2xzdGFjayBkb21haW5zLCBoYXJkd2FyZSBk
b21haW5zLCBhcyB3ZWxsIGFzIGd1ZXN0IGRvbWFpbnMuICBXZSBkb24ndApuZWVkICJndWVzdCIg
dG8gYmUgYSBzeW5vbnltIGZvciAiZG9tYWluIi4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
