Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FF6E9836
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 09:36:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPjQR-0005O9-RN; Wed, 30 Oct 2019 08:33:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iUym=YX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPjQQ-0005O4-Q1
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 08:33:54 +0000
X-Inumbo-ID: 00b155e0-faf0-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00b155e0-faf0-11e9-beca-bc764e2007e4;
 Wed, 30 Oct 2019 08:33:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 984FBB123;
 Wed, 30 Oct 2019 08:33:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <79e0dc1a-3cac-7ff8-0234-6378004f5de6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26229897-30ff-8831-bfd1-5fb48ba40c93@suse.com>
Date: Wed, 30 Oct 2019 09:33:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <79e0dc1a-3cac-7ff8-0234-6378004f5de6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMjAxOSAxNzo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNS8xMC8yMDE5
IDEzOjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IGV2YWx1YXRlX25vc3BlYygpIGlzIGluY3JlZGlibHkgZnJhZ2ls
ZSwgYW5kIHRoaXMgaXMgb25lIGdpYW50IGJvZGdlLgo+Pj4KPj4+IFRvIGNvcnJlY3RseSBwcm90
ZWN0IGp1bXBzLCB0aGUgZ2VuZXJhdGVkIGNvZGUgbmVlZHMgdG8gYmUgb2YgdGhlIGZvcm06Cj4+
Pgo+Pj4gICAgIGNtcC90ZXN0IDxjb25kPgo+Pj4gICAgIGpjYyAxZgo+Pj4gICAgIGxmZW5jZQo+
Pj4gICAgIC4uLgo+Pj4gIDE6IGxmZW5jZQo+Pj4gICAgIC4uLgo+Pj4KPj4+IENyaXRpY2FsbHks
IHRoZSBsZmVuY2UgbXVzdCBiZSBhdCB0aGUgaGVhZCBvZiBib3RoIGJhc2ljIGJsb2NrcywgbGF0
ZXIgaW4gdGhlCj4+PiBpbnN0cnVjdGlvbiBzdHJlYW0gdGhhbiB0aGUgY29uZGl0aW9uYWwganVt
cCBpbiBuZWVkIG9mIHByb3RlY3Rpb24uCj4+Pgo+Pj4gV2hlbiBhIHN0YXRpYyBpbmxpbmUgaXMg
aW52b2x2ZWQsIHRoZSBvcHRpbWlzZXIgZGVjaWRlcyB0byBiZSBjbGV2ZXIgYW5kCj4+PiByZWFy
cmFuZ2VzIHRoZSBjb2RlIGFzOgo+Pj4KPj4+ICBwcmVkOgo+Pj4gICAgIGxmZW5jZQo+Pj4gICAg
IDxjYWxjdWxhdGUgY29uZD4KPj4+ICAgICByZXQKPj4+Cj4+PiAgICAgY2FsbCBwcmVkCj4+PiAg
ICAgY21wICQwLCAlZWF4Cj4+PiAgICAgamNjIDFmCj4+PiAgICAgLi4uCj4+PiAgMTogLi4uCj4+
Pgo+Pj4gd2hpY2ggYnJlYWtzIHRoZSBzcGVjdWxhdGl2ZSBzYWZldHkuCj4+IEFpdWkgInByZWQi
IGlzIGEgbm9uLWlubGluZWQgc3RhdGljIGlubGluZSBoZXJlLiBUaGVyZSdzIG5vICJvcHRpbWlz
ZXIgZGVjaWRlcwo+PiB0byBiZSBjbGV2ZXIiIGluIHRoaXMgY2FzZSBpbW8gLSBpdCBhbGwgaXMg
YSByZXN1bHQgb2Ygbm90IGlubGluaW5nLCB3aGVuIHRoZQo+PiBjb25zdHJ1Y3QgaW4gZXZhbHVh
dGVfbm9zcGVjKCkgaXMgc3BlY2lmaWNhbGx5IGFzc3VtaW5nIHRoaXMgd291bGRuJ3QgaGFwcGVu
Lgo+PiBUaGVyZWZvcmUgSSBjb250aW51ZSB0byB0aGluayB0aGF0IHRoZSBkZXNjcmlwdGlvbiBp
cyBtaXNsZWFkaW5nLgo+Pgo+Pj4gQW55IHVzZSBvZiBldmFsdWF0ZV9ub3NwZWMoKSBuZWVkcyBh
bGwgc3RhdGljIGlubGluZSBwcmVkaWNhdGVzIHdoaWNoIHVzZSBpdAo+Pj4gdG8gYmUgZGVjbGFy
ZWQgYWx3YXlzX2lubGluZSB0byBwcmV2ZW50IHRoZSBvcHRpbWlzZXIgaGF2aW5nIHRoZSBmbGV4
aWJpbGl0eQo+Pj4gdG8gZ2VuZXJhdGUgdW5zYWZlIGNvZGUuCj4+IEkgYWdyZWUgd2l0aCB0aGlz
IHBhcnQuCj4gCj4gSG93IGFib3V0Ogo+IAo+IFdoZW4gdGhlIGNvbXBpbGVyIGNob29zZXMgdG8g
b3V0LW9mLWxpbmUgdGhlIGNvbmRpdGlvbiBjYWxjdWxhdGlvbiAoZS5nLiBieQo+IG5vdCBpbmxp
bmluZyBhIHByZWRpY2F0ZSksIHRoZSBjb2RlIGxheW91dCBjYW4gZW5kIHVwIGFzOgo+IMKgwqDC
oAo+IMKgcHJlZDoKPiDCoMKgwqAgbGZlbmNlCj4gwqDCoMKgIDxjYWxjdWxhdGUgY29uZD4KPiDC
oMKgwqAgcmV0Cj4gwqDCoMKgCj4gwqDCoMKgIGNhbGwgcHJlZAo+IMKgwqDCoCBjbXAgJDAsICVl
YXgKPiDCoMKgwqAgamNjIDFmCj4gwqDCoMKgIC4uLgo+IMKgMTogLi4uCj4gwqDCoMKgCj4gd2hp
Y2ggYnJlYWtzIHRoZSBzcGVjdWxhdGl2ZSBzYWZldHksIGFzIHRoZSBsZmVuY2VzIGFyZSBlYXJs
aWVyIGluIHRoZQo+IGluc3RydWN0aW9uIHN0cmVhbSB0aGFuIHRoZSBqdW1wIGluIG5lZWQgb2Yg
cHJvdGVjdGlvbi4KPiAKPiA/CgpTb3VuZHMgZ29vZCwgdGhhbmtzLiBXaXRoIHRoaXMKQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
