Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC3B1133
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 16:33:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Q7E-0004F7-9h; Thu, 12 Sep 2019 14:30:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8Q7C-0004F1-Gu
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 14:30:30 +0000
X-Inumbo-ID: ddaa2b9c-d569-11e9-959b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddaa2b9c-d569-11e9-959b-12813bfff9fa;
 Thu, 12 Sep 2019 14:30:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17997B012;
 Thu, 12 Sep 2019 14:30:28 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190912132813.6509-1-jgross@suse.com>
 <20190912132813.6509-2-jgross@suse.com>
 <1b9eb9cc-38b2-7454-c97b-fec01d796102@suse.com>
 <4b0daee9-b9cb-b853-9af7-691bd42537a1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <917fd218-5c3e-2299-c19d-e6310c83805c@suse.com>
Date: Thu, 12 Sep 2019 16:30:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4b0daee9-b9cb-b853-9af7-691bd42537a1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/5] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNTo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMi4wOS4xOSAx
NTozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEyLjA5LjIwMTkgMTU6MjgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMjY3LDYgKzI4OCw3IEBAIGludCBfc3Bpbl90cnlsb2NrX3Jl
Y3Vyc2l2ZShzcGlubG9ja190ICpsb2NrKQo+Pj4gICAKPj4+ICAgICAgIC8qIERvbid0IGFsbG93
IG92ZXJmbG93IG9mIHJlY3Vyc2VfY3B1IGZpZWxkLiAqLwo+Pj4gICAgICAgQlVJTERfQlVHX09O
KE5SX0NQVVMgPiBTUElOTE9DS19OT19DUFUpOwo+Pj4gKyAgICBCVUlMRF9CVUdfT04oU1BJTkxP
Q0tfUkVDVVJTRV9CSVRTIDw9IDApOwo+Pgo+PiBUaGlzIGlzIHRvbyB3ZWFrOiBXaGlsZSBJIGRv
bid0IHRoaW5rIHdlIHN0cmljdGx5IG5lZWQgMTUgbGV2ZWxzIG9mCj4+IHJlY3Vyc2lvbiwgSSBh
bHNvIGRvbid0IHRoaW5rIHdlJ2xsIGdldCBhd2F5IHdpdGgganVzdCAxLiBJIHRoaW5rCj4+IHRo
aXMgbWluaW1hbGx5IG5lZWRzIHRvIGJlICI8PSAxIiwgcGVyaGFwcyBiZXR0ZXIgIjw9IDIiLiBP
dGhlcgo+PiB0aG91Z2h0cyAoYWxzbyBieSBvdGhlcnMpIG9uIHRoZSBwcmVjaXNlIHZhbHVlIHRv
IHVzZSBoZXJlCj4+IGFwcHJlY2lhdGVkLiBXaXRoIHRoaXMgc3VpdGFibHkgdGFrZW4gY2FyZSBv
ZiAod2hpY2ggY2FuIGhhcHBlbgo+PiB3aGlsZSBjb21taXR0aW5nLCBidXQgbXVzdCBub3QgYmUg
Zm9yZ290dGVuKQo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IAo+ICIyIiBzaG91bGQgYmUgbm8gcHJvYmxlbSwgYXMgdGhlIG90aGVyIGFkZGVkCj4gCj4g
QlVJTERfQlVHX09OKExPQ0tfREVCVUdfUEFEX0JJVFPCtzw9wrcwKTsKPiAKPiBpcyBpbXBseWlu
ZyB0aGF0IGFscmVhZHkuCgpUaGF0J3Mgbm90IHRoZSBwb2ludCB0aG91Z2ggLSBhZnRlciB5b3Vy
IGNoYW5nZSBoYXMgZ29uZSBpbiwKdGhlIHR3byBiaXRmaWVsZHMgbWF5IGNoYW5nZSBpbmRlcGVu
ZGVudGx5LiBUaGUgcXVlc3Rpb24gaXMgd2hhdApyZWN1cnNpb24gZGVwdGggd2UgdGhpbmsgd2Ug
bWluaW1hbGx5IG5lZWQgdG8gcnVuIHRoZSBjb2RlIGFzIGl0CmlzIHJpZ2h0IG5vdy4gRm9yIGV4
YW1wbGUsIEknbSBub3Qgc3VyZSBob3cgbXVjaCBuZXN0aW5nIHdlIG5lZWQKZm9yIHRoZSBQQ0kg
ZGV2aWNlcyBsb2NrIHJpZ2h0IG5vdy4gKEZvciBvdGhlcnMgSSB0aGluayB0aGVyZSdzCm5vdCBn
b2luZyB0byBiZSBkZWVwZXIgdGhhbiB0d28gb3IgdGhyZWUgbGV2ZWxzIG9mIG5lc3RpbmcuKQoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
