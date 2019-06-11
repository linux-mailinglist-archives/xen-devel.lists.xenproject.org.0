Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB23C8F3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:30:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadzz-0004FU-Vf; Tue, 11 Jun 2019 10:27:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LgYn=UK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hadzx-0004Dm-UR
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:27:25 +0000
X-Inumbo-ID: 7fa57f74-8c33-11e9-a884-af6f7c27ad63
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fa57f74-8c33-11e9-a884-af6f7c27ad63;
 Tue, 11 Jun 2019 10:27:22 +0000 (UTC)
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
IronPort-SDR: pIEyuZLl2Sj7VZ21TEzlWkvqgg32stG68OnJSiEgvSynLFfnH2TDfL/WnTBQy672AiVfKOtk5P
 hLfkgyx7UUQjp6asfWHcnVLhItMZaxqerCljqH/zd8QYnD3DLwb4qNtR6orapW0chefvvY3bQg
 bbxlb7WECFxMC2jMXWpuMT2I9BfzidfL3xP6btv/0jUoPyrOSDQuCqimgln+y2xlbItePpeBQ2
 L1BnLUvC7MzGohNlFwS6/YS3eOL2n2hpCYFos+8iSTYPSG7ntZiv33kTjiHftidHAopMe05rai
 +W8=
X-SBRS: 2.7
X-MesageID: 1568193
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,578,1557201600"; 
   d="scan'208";a="1568193"
To: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, 
 Baodong Chen <chenbaodong@mxnavi.com>, <xen-devel@lists.xenproject.org>
References: <1560244837-31477-1-git-send-email-chenbaodong@mxnavi.com>
 <76828671-6c65-bc1f-d7a1-8324491d2200@citrix.com>
 <bb5ed3ee-94ac-e06c-6edc-ce07cce00e21@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <14948bfa-1203-97f2-f595-abc0c2c78a6a@citrix.com>
Date: Tue, 11 Jun 2019 11:27:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bb5ed3ee-94ac-e06c-6edc-ce07cce00e21@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen: superficial clean-ups
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDYvMjAxOSAxMToyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wNi4xOSAx
MjoxOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gNi8xMS8xOSAxMDoyMCBBTSwgQmFvZG9u
ZyBDaGVuIHdyb3RlOgo+Pj4gKiBSZW1vdmUgcmVkdW5kYW50IHNldCAnRE9NRFlJTkdfZGVhZCcK
Pj4+IGRvbWFpbl9jcmVhdGUoKSB3aWxsIHNldCB0aGlzIHdoZW4gZmFpbCwgdGh1cyBubyBuZWVk
Cj4+PiBzZXQgaW4gYXJjaF9kb21haW5fY3JlYXRlKCkuCj4+Pgo+Pj4gKiBTZXQgZXJyb3Igd2hl
biByZWFsbHkgaGFwcGVuZWQKPj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+IGluZGV4IDg2MzQxYmMuLmQ2Y2RjZjggMTAw
NjQ0Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hlbi9jb21tb24v
c2NoZWR1bGUuYwo+Pj4gQEAgLTE4OTQsOSArMTg5NCwxMSBAQCBzdHJ1Y3Qgc2NoZWR1bGVyICpz
Y2hlZHVsZXJfYWxsb2ModW5zaWduZWQKPj4+IGludCBzY2hlZF9pZCwgaW50ICpwZXJyKQo+Pj4g
wqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4+IMKgIMKgwqAgZm91bmQ6Cj4+PiAtwqDCoMKgICpw
ZXJyID0gLUVOT01FTTsKPj4+IMKgwqDCoMKgwqAgaWYgKCAoc2NoZWQgPSB4bWFsbG9jKHN0cnVj
dCBzY2hlZHVsZXIpKSA9PSBOVUxMICkKPj4+ICvCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoMKg
ICpwZXJyID0gLUVOT01FTTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsKPj4+
ICvCoMKgwqAgfQo+Pj4gwqDCoMKgwqDCoCBtZW1jcHkoc2NoZWQsIHNjaGVkdWxlcnNbaV0sIHNp
emVvZigqc2NoZWQpKTsKPj4+IMKgwqDCoMKgwqAgaWYgKCAoKnBlcnIgPSBTQ0hFRF9PUChzY2hl
ZCwgaW5pdCkpICE9IDAgKQo+Pgo+PiBJIHdhcyBnb2luZyB0byBzYXksIHRoaXMgaXMgYSBjb21t
b24gaWRpb20gaW4gdGhlIFhlbiBjb2RlLCBhbmQgdGhlCj4+IGNvbXBpbGVyIHdpbGwgZW5kIHVw
IHJlLW9yZ2FuaXppbmcgdGhpbmdzIHN1Y2ggdGhhdCB0aGUgd3JpdGUgZG9lc24ndAo+PiBoYXBw
ZW4gYW55d2F5LsKgIEJ1dCBpbiB0aGlzIGNhc2UsIGl0cycgYWN0dWFsbHkgd3JpdGluZyB0aHJv
dWdoIGEKPj4gcG9pbnRlciBiZWZvcmUgYW5kIGFmdGVyIGEgZnVuY3Rpb24gY2FsbDsgSSBkb24n
dCB0aGluayB0aGUgY29tcGlsZXIKPj4gd291bGQgYWN0dWFsbHkgYmUgYWxsb3dlZCB0byBvcHRp
bWl6ZSB0aGlzIHdyaXRlIGF3YXkuCj4+Cj4+IFNvLCBJIGd1ZXNzIEknZCBiZSBPSyB3aXRoIHRo
aXMgcGFydGljdWxhciBodW5rLsKgIERhcmlvLCBhbnkgb3BpbmlvbnM/Cj4KPiBJJ2QgcmF0aGVy
IHN3aXRjaCB0byBQVFJfRVJSKCkgaGVyZSBkcm9wcGluZyB0aGUgcGVyciBwYXJhbWV0ZXIuCgor
MiBmb3IgdGhpcywgYnV0IEkgd2FzIGdvaW5nIHRvIHdhaXQgdW50aWwgY29yZSBzY2hlZHVsaW5n
IGhhZCBnb3R0ZW4gYQpiaXQgZnVydGhlciBiZWZvcmUgc3VnZ2VzdGluZyBjbGVhbnVwIHdoaWNo
IGlzIGd1YXJhbnRlZWQgdG8gY29sbGlkZS4KClNhZGx5LCBpdCdzIGZhaXJseSBpbnRydXNpdmUg
aW4gdGhlIGNwdXBvb2wgY29kZSBhcyB3ZWxsLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
