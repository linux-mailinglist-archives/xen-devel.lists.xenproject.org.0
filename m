Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8FC6A6A6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 12:38:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnKoQ-0000Fj-Be; Tue, 16 Jul 2019 10:35:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WCCO=VN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnKoP-0000Fe-6v
 for xen-devel@lists.xen.org; Tue, 16 Jul 2019 10:35:57 +0000
X-Inumbo-ID: 7d4260ed-a7b5-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d4260ed-a7b5-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 10:35:54 +0000 (UTC)
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
IronPort-SDR: sKjVmJthiBurHjGycDscRyp+Q6JU9UG4KnO24plD982AZ6EWexwzRMOu4y5cgubEJeqTOhrbt3
 T6sFK5AUW6R4qICFgleZG5H6ki4hD+RumAFQ2CsfjkpVGoTf4TGAngZ6uq327lXyxLU4DIQNdL
 7uQeWHGnwz2RWVGyf+BSFlk3jU8HqvF+JHP0Kmi2HV1TrLX5vN03Q47H4E2bDD9LDg7e1l76GG
 hg+V1Vowb5lJsDfqhBK6hB6uFNb9OH5Q7uWq+++2941udZC6YBWM0WG1Dw3moQv44zYaaJryyS
 wbc=
X-SBRS: 2.7
X-MesageID: 3082293
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3082293"
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190716101657.23327-1-paul.durrant@citrix.com>
 <20190716101657.23327-4-paul.durrant@citrix.com>
 <ebd58c3e-d973-3c59-c37b-4cae15165025@citrix.com>
 <71ba8ba9f44a4feeb3f76fc1d9f214b3@AMSPEX02CL03.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c366fbd9-7950-e180-1e08-f45ccf0bec8c@citrix.com>
Date: Tue, 16 Jul 2019 11:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <71ba8ba9f44a4feeb3f76fc1d9f214b3@AMSPEX02CL03.citrite.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 3/4] iommu: introduce iommu_groups
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
Cc: Xen-devel List <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDcvMjAxOSAxMTozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPgo+PiBTZW50OiAxNiBKdWx5IDIwMTkgMTE6MjYKPj4gVG86IFBhdWwgRHVycmFudCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
Pj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEdlb3JnZSBEdW5sYXAgPEdl
b3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uCj4+IDxJYW4uSmFja3NvbkBjaXRy
aXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEtvbnJhZCBSemVz
enV0ZWsgV2lsawo+PiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsK
Pj4gV2VpIExpdSA8d2xAeGVuLm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAzLzRdIGlv
bW11OiBpbnRyb2R1Y2UgaW9tbXVfZ3JvdXBzCj4+Cj4+IE9uIDE2LzA3LzIwMTkgMTE6MTYsIFBh
dWwgRHVycmFudCB3cm90ZToKPj4+ICtpbnQgaW9tbXVfZ3JvdXBfYXNzaWduKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCB2b2lkICphcmcpCj4+PiArewo+Pj4gKyAgICBjb25zdCBzdHJ1Y3QgaW9tbXVf
b3BzICpvcHMgPSBpb21tdV9nZXRfb3BzKCk7Cj4+PiArICAgIGludCBpZDsKPj4+ICsgICAgc3Ry
dWN0IGlvbW11X2dyb3VwICpncnA7Cj4+PiArCj4+PiArICAgIGlmICggIW9wcy0+Z2V0X2Rldmlj
ZV9ncm91cF9pZCApCj4+PiArICAgICAgICByZXR1cm4gMDsKPj4+ICsKPj4+ICsgICAgaWQgPSBv
cHMtPmdldF9kZXZpY2VfZ3JvdXBfaWQocGRldi0+c2VnLCBwZGV2LT5idXMsIHBkZXYtPmRldmZu
KTsKPj4+ICsgICAgaWYgKCBpZCA8IDAgKQo+Pj4gKyAgICAgICAgcmV0dXJuIC1FTk9EQVRBOwo+
Pj4gKwo+Pj4gKyAgICBncnAgPSBnZXRfaW9tbXVfZ3JvdXAoaWQpOwo+Pj4gKyAgICBpZiAoICFn
cnAgKQo+Pj4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4+PiArCj4+PiArICAgIGlmICggaW9t
bXVfdmVyYm9zZSApCj4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIkFzc2lnbiAlMDR4
OiUwMng6JTAyeC4ldSAtPiBJT01NVSBncm91cCAleFxuIiwKPj4gTm8gdW5hZG9ybmVkIGhleCBu
dW1iZXJzIHBsZWFzZS7CoCBUaGlzIGlzIGEgcmVjaXBlIGZvciBjb25mdXNpb24gZHVyaW5nCj4+
IGRlYnVnZ2luZy4KPj4KPj4gRWl0aGVyICUjeCwgb3IgJXUsIGFuZCBuZWVkcyB0byBiZSBmaXhl
ZCBvbiBjb21taXQgaWYgd2UgZ28gd2l0aCB0aGF0IHJvdXRlLgo+IFBlcnNvbmFsbHkgSSBwcmVm
ZXIgdGhlIGFic3RyYWN0IGlvbW11IGdyb3VwIGluZGV4LCBtb3JlIGxpa2UgTGludXguIEknZCBi
ZSBoYXBweSB0byByZS1pbnN0YXRlIHRoYXQgYW5kIHVzZSAldS4gQXMgZm9yIHRoZSAleCBoZXJl
LCBJIHZpZXcgaXQgdGhlIHNhbWUgYXMgdGhlIHVuYWRvcm5lZCAleCBmb3Igc2VnLCBidXMsIGFu
ZCBkZXYuLi4gYnV0IEknbSBub3QgcmVhbGx5IGZ1c3N5IGlmIHlvdSB3YW50IHRvIGFkZCBhICcj
Jy4KCkkgZG9uJ3QgbWluZCBpZiBpdCBpcyByZW5kZXJlZCBpbiBoZXggb3IgZGVjLCBidXQgaXQg
bXVzdCBub3QgYmUKYW1iaWd1b3VzIHdoZW4gcHJpbnRlZC4KCk90aGVyd2lzZSB0cnlpbmcgdG8g
ZGVidWcgaXNzdWVzIHRvIGRvIHdpdGggSU9NTVUgZ3JvdXAgMTIgaXMgZ29pbmcgdG8KYmUgYSBs
ZXNzb24gaW4gcGFpbiBhbmQgbWlzZXJ5LgoKUENJIGNvb3JkaW5hdGVzIGFyZSBub3QgYW1iaWd1
b3VzLCBldmVuIHdoZW4gdGhleSBsYWNrIHRoZSAweCBwcmVmaXguwqAKUGxhaW4gbnVtYmVycyBh
cmUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
