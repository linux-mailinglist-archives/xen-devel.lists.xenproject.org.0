Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F7A70453
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 17:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpaTR-0001pA-8H; Mon, 22 Jul 2019 15:43:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pI0n=VT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpaTQ-0001p5-2z
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 15:43:36 +0000
X-Inumbo-ID: 76b0e066-ac97-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76b0e066-ac97-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 15:43:34 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aWRaKniOzdd6ywJ7HD3vjBXV+NnURLXWm87C00ybMA4RBeux4808ejQ+CHgjDvke74dQb/qjcB
 P0LHI32OKnFTEWZahue2FGyrDV2h94con0mFYJkoabTAO1mgWc1PDRZkgp+AEOQSAv5VXKhhoP
 x2+Gz2cX6gYK0CTnskga36vEOnnEte3i2WkReIJMplQDnE4xAibJh734xUjaHhoAA0RJZdR8Ja
 ihG+sAK02fdtys/M25dBkq0m3b7dJ90TFoN+PM9tshaNMNynT0yvTnwtrIl4+pms63efY2lRF7
 LRE=
X-SBRS: 2.7
X-MesageID: 3267887
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3267887"
To: Jan Beulich <JBeulich@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
 <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
 <9c6a7b4b-af52-c93d-480f-f34334de868a@suse.com>
 <aeb53abe-af9e-37ba-9f25-90b6b30192fc@citrix.com>
 <dc1481ff-4c18-cf0b-cff7-1f2866b6ad40@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c25f432f-5408-83ce-26f4-fe9a0edf4e46@citrix.com>
Date: Mon, 22 Jul 2019 16:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dc1481ff-4c18-cf0b-cff7-1f2866b6ad40@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
 BrianWoods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDcvMjAxOSAxNjowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjIuMDcuMjAxOSAx
NTozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjIvMDcvMjAxOSAwOTozNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxOS4wNy4yMDE5IDE5OjI3LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDE2LzA3LzIwMTkgMTc6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBAQCAt
MTQyLDcgKzE3OCwxNSBAQCBzdGF0aWMgdm9pZCBmcmVlX2ludHJlbWFwX2VudHJ5KGNvbnN0IHN0
Cj4+Pj4+ICAgICB7Cj4+Pj4+ICAgICAgICAgdW5pb24gaXJ0ZV9wdHIgZW50cnkgPSBnZXRfaW50
cmVtYXBfZW50cnkoaW9tbXUsIGJkZiwgaW5kZXgpOwo+Pj4+PiAgICAgCj4+Pj4+IC0gICAgQUND
RVNTX09OQ0UoZW50cnkucHRyMzItPnJhd1swXSkgPSAwOwo+Pj4+PiArICAgIGlmICggaW9tbXUt
PmN0cmwuZ2FfZW4gKQo+Pj4+PiArICAgIHsKPj4+Pj4gKyAgICAgICAgQUNDRVNTX09OQ0UoZW50
cnkucHRyMTI4LT5yYXdbMF0pID0gMDsKPj4+Pj4gKyAgICAgICAgLyogTG93IGhhbGYgKGNvbnRh
aW5pbmcgUmVtYXBFbikgbmVlZHMgdG8gYmUgY2xlYXJlZCBmaXJzdC4gKi8KPj4+Pj4gKyAgICAg
ICAgYmFycmllcigpOwo+Pj4+IFdoaWxlIHRoaXMgd2lsbCBmdW5jdGlvbiBvbiB4ODYsIEkgc3Rp
bGwgY29uc2lkZXIgdGhpcyBidWdneS7CoCBGcm9tIGEKPj4+PiBjb25jZXB0dWFsIHBvaW50IG9m
IHZpZXcsIGJhcnJpZXIoKSBpcyBub3QgdGhlIGNvcnJlY3QgY29uc3RydWN0aW9uIHRvCj4+Pj4g
dXNlLCB3aGVyZWFzIHNtcF93bWIoKSBpcy4KPj4+IEkgdGhpbmsgaXQncyB0aGUgM3JkIHRpbWUg
bm93IHRoYXQgSSByZXNwb25kIHNheWluZyB0aGF0IGJhcnJpZXIoKSBpcwo+Pj4gYXMgZ29vZCBv
ciBhcyBiYWQgYXMgc21wX3dtYigpLCBqdXN0IGZvciBkaWZmZXJlbnQgcmVhc29ucy4KPj4gYmFy
cmllcigpIGFuZCBzbXBfd21iKCkgYXJlIGRpZmZlcmVudCBjb25zdHJ1Y3RzLCB3aXRoIHNwZWNp
ZmljLAo+PiAqZGlmZmVyZW50KiBtZWFuaW5ncy7CoCBGcm9tIGEgcHJvZ3JhbW1lcnMgcG9pbnQg
b2YgdmlldywgdGhleSBzaG91bGQgYmUKPj4gY29uc2lkZXJlZCBibGFjayBib3hlcyBvZiBmdW5j
dGlvbmFsaXR5Lgo+Pgo+PiBiYXJyaWVyKCkgaXMgZm9yIGZvcmNpbmcgdGhlIGNvbXBpbGVyIHRv
IG5vdCByZW9yZGVyIHRoaW5ncy4KPj4KPj4gc21wX3dtYigpIGlzIGFib3V0IHRoZSBleHRlcm5h
bCB2aXNpYmlsaXR5IG9mIHdyaXRlcywgYXMgb2JzZXJ2ZWQgYnkgYQo+PiBkaWZmZXJlbnQgZW50
aXR5IG9uIGEgY29oZXJlbnQgZmFicmljLgo+IEknbSBhZnJhaWQgSSBkaXNhZ3JlZSBoZXJlOiBU
aGUgInNtcCIgaW4gaXRzIG5hbWUgbWVhbnMgIkNQVSIsIG5vdAo+ICJlbnRpdHkiIGluIHlvdXIg
c2VudGVuY2UuCgpDaXRhdGlvbiBkZWZpbml0ZWx5IG5lZWRlZC4KClRoZSB0ZXJtIFNNUCBtZWFu
cyBTeW1tZXRyaWMgTXVsdGlQcm9jZXNzaW5nLCBidXQgbm8gY29tcHV0ZXIgdGhlc2UgZGF5cwpt
YXRjaGVzIGFueSBvZiB0aGUgdHJhZGl0aW9uYWwgZGVmaW5pdGlvbnMuwqAgWW91IGNhbiB0aGFu
ayB0aGUgZmFjdCB3ZQphcmUgb25lIG9mIHRoZSBmYXN0ZXN0IGV2b2x2aW5nIGluZHVzdHJpZXMg
aW4gdGhlIHdvcmxkLCBhbmQgdGhhdCB0aGUKdGVybSB5b3UncmUgdXNpbmcgaXMgbW9yZSB0aGFu
IDIwIHllYXJzIG9sZC4KCkluIHBhcnRpY3VsYXIsIGl0IHByZWRhdGVzIGNhY2hlLWNvaGVyZW50
IHVuY29yZSBkZXZpY2VzLsKgCkNhY2hlLWNvaGVyZW50IGRldmljZXMgYnkgZGVmaW5pdGlvbiBo
YXZlIHRoZSBzYW1lIG9yZGVyaW5nIHByb3BlcnRpZXMKYW5kIGNvbnN0cmFpbnRzIGFzIGNwdXMs
IGJlY2F1c2UgdGhleSBhcmUgcGFydCBvZiBvbmUgc2hhcmVkIChvciBkYXJlIEkKc2F5LCBzeW1t
ZXRyaWMpLCBjYWNoZS1jb2hlcmVudCBkb21haW4uCgpIb3cgd291bGQgeW91ciBhcmd1bWVudCBj
aGFuZ2UgaWYgdGhlIElPTU1VIHdhcyBhIHJlYWwgQ1BVIHJ1bm5pbmcgcmVhbAp4ODYgY29kZT/C
oCBJdHMgaW50ZXJmYWNlIHRvIHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0gd291bGQgYmUgaWRlbnRp
Y2FsLAphbmQgaW4gdGhhdCBjYXNlLCBpdCB3b3VsZCBvYnZpb3VzbHkgbmVlZCBhbiBzbXBfe3Is
d31tYigpIHBhaXIgZm9yCmNvcnJlY3RuZXNzIHJlYXNvbnMuwqAgVGhpcyBpcyB3aHkgc21wX3dt
YigpIGlzIHRoZSBvbmx5IGFwcHJvcHJpYXRlCmNvbnN0cnVjdCB0byB1c2UuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
