Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263F5317CF
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 01:18:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWqkb-0001jd-2c; Fri, 31 May 2019 23:15:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWqkZ-0001jY-BI
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 23:15:51 +0000
X-Inumbo-ID: 06ff13ab-83fa-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 06ff13ab-83fa-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 23:15:49 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: dYG9jvhVTQ7oU58DghRA/AZ+3HVFkXN4t1cE53ia9lKADlPE5mMy1gb8qe4gGcUTCM1tP/mv65
 vK31chwhmMSHKcQ3rch9kYvhRKA5N1orFTgfQ3Dk8J/w4Jx4uARSjgBNs0CDtGXRxT/9djbacC
 olNv3rLZ+IAm4SWwxYDS0cUEyswYSDrMqX8y3EcoRkVHu8Ywd1O7fBoMjlCVpkj3oen/tQiRk6
 rU84qyd0SxhjwzV6G44ZAo1ZMfcv+qdXxLOF3SqCXt/gSlimnWVSFoNHyc6MruTkXabpHG2SgG
 5FA=
X-SBRS: 2.7
X-MesageID: 1181168
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,536,1549947600"; 
   d="scan'208";a="1181168"
To: Stefano Stabellini <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>
References: <20190531230056.14506-1-sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0aafd7d6-7acc-f59c-b3d1-0e85c9435f18@citrix.com>
Date: Fri, 31 May 2019 16:15:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531230056.14506-1-sstabellini@kernel.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen: debug_registers_trap,
 perf_counters_trap, and "static_partitioning"
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDUvMjAxOSAxNjowMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEludHJvZHVj
ZSB0d28gZ2xvYmFsIHBhcmFtZXRlcnMgdG8gZGlzYWJsZSBkZWJ1ZyByZWdpc3RlcnMgdHJhcHBp
bmcgYW5kCj4gcGVyZiBjb3VudGVycyB0cmFwcGluZy4gVGhleSBhcmUgb25seSBzYWZlIHRvIHVz
ZSBpbiBzdGF0aWMgcGFydGl0aW9uZwo+IHNjZW5hcmlvcyB3aGVyZSBzY2hlZD1udWxsIGlzIHVz
ZWQgLS0gdmNwdSBjYW5ub3QgYmUgbWlncmF0ZWQgZnJvbSBvbmUKPiBwY3B1IHRvIHRoZSBuZXh0
Lgo+Cj4gSW50cm9kdWNlIGEgbmV3IHNpbXBsZSB1bWJyZWxsYSBjb21tYW5kIGxpbmUgb3B0aW9u
Cj4gInN0YXRpY19wYXJ0aXRpb25pbmciIHRoYXQgZW5hYmxlcyB2d2ZpPW5hdGl2ZSwgc2NoZWQ9
bnVsbCwgYW5kIGFsc28KPiBzZXRzIGRlYnVnX3JlZ2lzdGVyc190cmFwIGFuZCBwZXJmX2NvdW50
ZXJzX3RyYXAgdG8gZmFsc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
Q0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDQzogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgo+IENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KPiBDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRy
aXguY29tPgo+IENDOiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IC0tLQo+
IFRoaXMgaXMgbm90IGlkZWFsLiBUaGUgYmVzdCBjb3Vyc2Ugb2YgYWN0aW9uIHdvdWxkIGJlIHRv
IGltcGxlbWVudAo+IHByb3BlciBjb250ZXh0IHN3aXRjaGluZyBvZiBhbGwgdGhlIG5lY2Vzc2Fy
eSBkZWJ1ZyBhbmQgcGVyZiBjb3VudGVycwo+IHJlZ2lzdGVycy4gVGhpcyBpcyBhbiBpbXBlcmZl
Y3Qgc2hvcnRjdXQsIHdoaWNoIGNvdWxkIHJlYXNvbmFibHkgYmUgbGVmdAo+IG91dCBvZiB0aGUg
dXBzdHJlYW0gdHJlZSBidXQgSSBzaGFyZWQgaXQgd2l0aCBvdGhlcnMgZm9yIHRoZWlyCj4gY29u
dmVuaWVuY2UuCj4gLS0tCj4gIHhlbi9hcmNoL2FybS90cmFwcy5jICAgIHwgMjYgKysrKysrKysr
KysrKysrKysrKysrKysrKy0KPiAgeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgfCAgMiArLQo+ICB4
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8ICAxICsKCkkgc2VlIG5vIGh1bmsgaW4gZG9jcy8gLi4u
Cgo+ICAzIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMu
Ywo+IGluZGV4IDVjMThlOTE4YjAuLmQ2ZWFmZmRlMjMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+IEBAIC0xMTgsNiArMTE4
LDI4IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3Z3ZmkoY29uc3QgY2hhciAqcykKPiAgfQo+
ICBjdXN0b21fcGFyYW0oInZ3ZmkiLCBwYXJzZV92d2ZpKTsKPiAgCj4gK3N0YXRpYyBib29sIGRl
YnVnX3JlZ2lzdGVyc190cmFwID0gdHJ1ZTsKPiArc3RhdGljIGJvb2wgcGVyZl9jb3VudGVyc190
cmFwID0gdHJ1ZTsKPiArCj4gK3N0YXRpYyBpbnQgX19pbml0IG9wdF9zdGF0aWNfcGFydGl0aW9u
aW5nKGNvbnN0IGNoYXIgKnMpCj4gK3sKPiArICAgIGlmICggc3RyY21wKHMsICJ0cnVlIikgJiYg
Cj4gKyAgICAgICAgIHN0cmNtcChzLCAiVHJ1ZSIpICYmCj4gKyAgICAgICAgIHN0cmNtcChzLCAi
MSIpICkKPiArICAgICAgICByZXR1cm4gMDsKClBsZWFzZSBwbGVhc2UgcGxlYXNlIGRvbid0IG9w
ZW5jb2RlIGJvb2xlYW4gY2hlY2tpbmcuwqAgSSB0aGluayBJJ3ZlCnB1cmdlZCBhbGwgb2YgaXQg
KGNlcnRhaW5seSBhbGwgdGhhdCBJJ20gYXdhcmUgb2YpLCBhbmQgdGhpcyBleGFtcGxlCmlzbid0
IHJlbW90ZWx5IGNvbXBhdGlibGUgd2l0aCBleGlzdGluZyBib29sZWFuIG9wdGlvbnMuCgpGdXJ0
aGVybW9yZSwgeW91IGNhbid0IG1ha2Ugc29tZXRoaW5nIHdoaWNoIGxvb2tzIGxpa2UgYSBzaW5n
bGUgYm9vbGVhbgpvcHRpb24gd2l0aCBjdXN0b21fcGFyYW0oKSwgYmVjYXVzZSB5b3UgY2FuJ3Qg
bWFrZSB0aGUgbm8tIHByZWZpeCB3b3JrLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
