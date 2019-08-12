Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F33BD8B048
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:56:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQhL-0002iY-0p; Tue, 13 Aug 2019 06:54:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hxQhI-0002gC-I0
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:54:20 +0000
X-Inumbo-ID: f26ad0de-bcf0-11e9-83f9-c3bd6ac33f49
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f26ad0de-bcf0-11e9-83f9-c3bd6ac33f49;
 Mon, 12 Aug 2019 11:04:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CF91AEFC;
 Mon, 12 Aug 2019 11:04:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d5224750-6d1e-2d62-f89d-5cb0a6c9f740@suse.com>
 <99f7c7d6-5ea3-ac60-a1f9-b82cb7be87f2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13dc761b-79e8-198f-094b-886c90b13bea@suse.com>
Date: Mon, 12 Aug 2019 13:04:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <99f7c7d6-5ea3-ac60-a1f9-b82cb7be87f2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDguMjAxOSAxMjoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8wOC8yMDE5
IDA4OjIzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQEAgLTc0NywxNiArNzQ3LDEwIEBAIHZvaWQg
bG9hZF9zeXN0ZW1fdGFibGVzKHZvaWQpCj4+ICDCoMKgwqDCoMKgwqDCoMKgIC5iaXRtYXAgPSBJ
T0JNUF9JTlZBTElEX09GRlNFVCwKPj4gIMKgwqDCoMKgIH07Cj4+ICAgCj4+IC3CoMKgwqAgX3Nl
dF90c3NsZHRfZGVzYygKPj4gLcKgwqDCoMKgwqDCoMKgIGdkdCArIFRTU19FTlRSWSwKPj4gLcKg
wqDCoMKgwqDCoMKgICh1bnNpZ25lZCBsb25nKXRzcywKPj4gLcKgwqDCoMKgwqDCoMKgIG9mZnNl
dG9mKHN0cnVjdCB0c3Nfc3RydWN0LCBfX2NhY2hlbGluZV9maWxsZXIpIC0gMSwKPj4gLcKgwqDC
oMKgwqDCoMKgIFNZU19ERVNDX3Rzc19hdmFpbCk7Cj4+IC3CoMKgwqAgX3NldF90c3NsZHRfZGVz
YygKPj4gLcKgwqDCoMKgwqDCoMKgIGNvbXBhdF9nZHQgKyBUU1NfRU5UUlksCj4+IC3CoMKgwqDC
oMKgwqDCoCAodW5zaWduZWQgbG9uZyl0c3MsCj4+IC3CoMKgwqDCoMKgwqDCoCBvZmZzZXRvZihz
dHJ1Y3QgdHNzX3N0cnVjdCwgX19jYWNoZWxpbmVfZmlsbGVyKSAtIDEsCj4+IC3CoMKgwqDCoMKg
wqDCoCBTWVNfREVTQ190c3NfYnVzeSk7Cj4+ICvCoMKgwqAgX3NldF90c3NsZHRfZGVzYyhnZHQg
KyBUU1NfRU5UUlksICh1bnNpZ25lZCBsb25nKXRzcywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzaXplb2YoKnRzcykgLSAxLCBTWVNfREVTQ190c3NfYXZhaWwpOwo+PiArwqDCoMKgIF9z
ZXRfdHNzbGR0X2Rlc2MoY29tcGF0X2dkdCArIFRTU19FTlRSWSwgKHVuc2lnbmVkIGxvbmcpdHNz
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVvZigqdHNzKSAtIDEsIFNZU19ERVND
X3Rzc19idXN5KTsKPiAKPiBEbyB5b3UgdGhpbmsgaXQgaXMgd29ydGggaGF2aW5nIGEgQlVJTERf
QlVHX09OKHNpemVvZigqdHNzKSA8IDB4NjcpLAo+IGp1c3QgdG8gY29uZmlybSB0aGF0IHRoZSBs
b2FkIHdvbnQgZmF1bHQ/CgpOb3Qgc3VyZSAtIGl0IGZlZWxzIGxpa2UgZ29pbmcgYSBsaXR0bGUg
b3ZlcmJvYXJkIHdpdGggY2hlY2tzLiBGZWVsCmZyZWUgdG8gYWRkIG9uZSB0aG91Z2ggaWYgeW91
J3JlIHJlYWxseSBjb252aW5jZWQgaXQgaGVscHMsIGJ1dAp0aGVuIHBsZWFzZSB3aXRoIDB4Njgg
aW4gcGxhY2Ugb2YgMHg2Ny4gKEknbSBhYm91dCB0byBsZWF2ZSBub3csCnNvIGlmIHlvdSB3YW50
IG1lIHRvIGFkZCBhbnl0aGluZyBhbmQvb3IgY29tbWl0IGl0LCBpdCB3b3VsZCBoYXZlCnRvIHdh
aXQgdHdvIHdlZWtzLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
