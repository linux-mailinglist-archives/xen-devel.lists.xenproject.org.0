Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774D46E5DE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 14:45:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoSCy-00063C-N0; Fri, 19 Jul 2019 12:41:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoSCw-000637-Kc
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 12:41:54 +0000
X-Inumbo-ID: 95a6f331-aa22-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95a6f331-aa22-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 12:41:53 +0000 (UTC)
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
IronPort-SDR: uvB1FBVMa89yFPWwG/Wy/7PRj7a3mqO1IvKa8MRc38tEqzrmRh/tAZc1jXol929UMJRPJzXrOx
 K2Sj/MdN0FT+vp3hLiy+WTt2GPZoLT0Aac1UP3Mwy41tqc5gSZfx7SJOU78Fv4FFLqu6vXI6hU
 DF1Ct0yREj0Bk1ma2AqGBwmJ/3o0byn7+1gi69dsPe29brJ60cRakYbk9Tye26JldJrPozDik0
 bqS++NcIDMoZYnL6+9uXQb5SNVeO6/6ty6I8RpEdQlaPMCJeRaTDtfjWUrOGuWyPvTsAjXyx6Y
 WLE=
X-SBRS: 2.7
X-MesageID: 3289132
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3289132"
To: Paul Durrant <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20190719122545.3486-1-paul.durrant@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bb3a29a3-5e76-8914-a88b-759220f22e5a@citrix.com>
Date: Fri, 19 Jul 2019 13:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719122545.3486-1-paul.durrant@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] include/public/memory.h: remove the
 XENMEM_rsrc_acq_caller_owned flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDcvMjAxOSAxMzoyNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFdoZW4gY29tbWl0IDNm
OGYxMjI4ICJ4ODYvbW06IGFkZCBIWVBFUlZJU09SX21lbW9yeV9vcCB0byBhY3F1aXJlIGd1ZXN0
Cj4gcmVzb3VyY2VzIiBpbnRyb2R1Y2VkIHRoZSBjb25jZXB0IG9mIGRpcmVjdGx5IG1hcHBpbmcg
c29tZSBndWVzdCByZXNvdXJjZXMsCj4gaXQgd2FzIGVudmlzYWdlZCB0aGF0IHRoZSBtZW1vcnkg
Zm9yIHNvbWUgcmVzb3VyY2VzIGFzc29jaWF0ZWQgd2l0aCBhIGd1ZXN0Cj4gbWF5IG5vdCBhY3R1
YWxseSBiZSBhc3NpZ25lZCB0byB0aGF0IGd1ZXN0LCBzcGVjaWZpY2FsbHkgdGhlIElPUkVRIHNl
cnZlcgo+IHJlc291cmNlIGludHJvZHVjZXMgaW4gY29tbWl0IDZlMzg3NDYxICJ4ODYvaHZtL2lv
cmVxOiBhZGQgYSBuZXcgbWFwcGFibGUKPiByZXNvdXJjZSB0eXBlLi4uIi4gU3VjaCByZXNvdXJj
ZXMgd2VyZSBkdWJiZWQgImNhbGxlciBvd25lZCIgYW5kIHJlc3VsdGVkCj4gaW4gdGhlIG93bmVk
IHJlc291cmNlcyIgYW5kIGFjcXVpcmluZyB0aGVtIHJlc3VsdGVkIGluIHRoZQo+IFhFTk1FTV9y
c3JjX2FjcV9jYWxsZXJfb3duZWQgZmxhZyBiZWluZyBwYXNzZWQgYmFjayB0byB0aGUgY2FsbGVy
IG9mIHRoZQo+IG1lbW9yeSBvcC4KPgo+IFVuZm9ydHVuYXRlbHkgdGhlIGltcGxlbWVudGF0aW9u
IGxlZCB0byBYU0EtMjc2LCB3aGljaCB3YXMgbWl0aWdhdGVkCj4gYnkgY29tbWl0IGY2YjZhZTc4
ICJ4ODYvaHZtL2lvcmVxOiBmaXggcGFnZSByZWZlcmVuY2luZyIgYW5kIHRoZW4gYSByZWxhdGVk
Cj4gbWVtb3J5IGFjY291bnRpbmcgcHJvYmxlbSB3YXMgd29ya2VkIGFyb3VuZCBieSBjb21taXQg
ZTg2MmU2Y2UKPiAieDg2L2h2bS9pb3JlcTogdXNlIHJlZi1jb3VudGVkIHRhcmdldC1hc3NpZ25l
ZCBzaGFyZWQgcGFnZXMiLiBUaGlzIGxhdHRlcgo+IGNvbW1pdCByZW1vdmVkIHRoZSBvbmx5IGlu
c3RhbmNlIG9mIGEgImNhbGxlciBvd25lZCIgcmVzb3VyY2UsIGJ1dCB0aGUKPiBmbGFnIHdhcyBs
ZWZ0IGluIGhlYWRlciBhbmQgY2hlY2tlZCBpbiBvbmUgcGxhY2UgaW4gdGhlIGNvcmUgY29kZS4K
PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhhdCBub3cgcmVkdW5kYW50IGNoZWNrIGFuZCByZW1vdmVz
IHRoZSBkZWZpbml0aW9uIG9mCj4gWEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZCBmcm9tIHRo
ZSBwdWJsaWMgaGVhZGVyLiBBbHNvLCBzaW5jZSB0aGlzIHdhcwo+IHRoZSBvbmx5IGZsYWcgZGVm
aW5lZCBmb3IgdGhlIFhFTk1FTV9hY3F1aXJlX3Jlc291cmNlIG1lbW9yeSBvcCwgaXQgcmVtb3Zl
cwo+IHRoZSAnZmxhZ3MnIGZpZWxkIG9mIHN0cnVjdCB4ZW5fbWVtX2FjcXVpcmVfcmVzb3VyY2Ug
YW5kIHJlcGxhY2VzIGl0IHdpdGgKPiBhbiBlcXVpdmFsZW50bHkgc2l6ZWQgJ3BhZCcgZmllbGQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
PgoKVGhpcyBpcyBhIG1vZGlmaWNhdGlvbiB0byBhIHB1YmxpYyBoZWFkZXIsIGJ1dCBpbiB0aGlz
IHNwZWNpZmljIGNhc2UsIEkKdGhpbmsgaXQgaXMgdGhlIGNvcnJlY3QgdGhpbmcgdG8gZG8uCgpY
RU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkIGlzIHRvdGFsbHkgdW5zYWZlIHRvIHVzZS7CoCBU
aGUgb25seSBwZW9wbGUKd2hvIGFyZSBnb2luZyB0byBiZSBpbXBhY3RlZCBieSB0aGlzIGNoYW5n
ZSBhcmUgdGhvc2Ugd2hvIGhhdmVuJ3QgeWV0CmZpeGVkIFhTQS0yNzYgYW5kIGhhdmUgYW4gdW5z
dGFibGUgc3lzdGVtIGFueXdheSwgYXQgd2hpY2ggcG9pbnQsIHRoZQpidWlsZCBicmVha2FnZSBp
cyBhcmd1YWJseSBkb2luZyB0aGVtIGEgZmF2b3VyLgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
