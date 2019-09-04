Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A2A7E56
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 10:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Qx6-0006yt-Dl; Wed, 04 Sep 2019 08:47:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5Qx4-0006ye-E1
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:47:42 +0000
X-Inumbo-ID: a74f749e-cef0-11e9-abad-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a74f749e-cef0-11e9-abad-12813bfff9fa;
 Wed, 04 Sep 2019 08:47:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17F78B65E;
 Wed,  4 Sep 2019 08:47:39 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
 <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
 <2a7b100c-2403-6bf2-7a73-3f2b0a2461a4@suse.com>
 <2ff6e052-9e29-b121-800d-6fe0a0f14ee4@suse.com>
 <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a5bbc347-a876-17d2-4fae-06b98818e565@suse.com>
Date: Wed, 4 Sep 2019 10:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <213ff1eb-1ced-5530-b46c-0e82cb8164a7@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTA6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjA5LjIwMTkgMTA6
MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAzLjA5LjE5IDE3OjA5LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDAzLjA5LjIwMTkgMTc6MDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMDMuMDkuMTkgMTY6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOS4wOC4y
MDE5IDEyOjE4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gSW4gb3JkZXIgdG8gaGF2ZSB1
bmlxdWUgbmFtZXMgd2hlbiBkb2luZyBsb2NrIHByb2ZpbGluZyBzZXZlcmFsIGxvY2FsCj4+Pj4+
PiBsb2NrcyAibG9jayIgbmVlZCB0byBiZSByZW5hbWVkLgo+Pj4+Pgo+Pj4+PiBCdXQgdGhlc2Ug
YXJlIGFsbCBuYW1lZCBzaW1wbHkgImxvY2siIGZvciBhIGdvb2QgcmVhc29uLCBpbmNsdWRpbmcK
Pj4+Pj4gYmVjYXVzZSB0aGV5J3JlIGFsbCBmdW5jdGlvbiBzY29wZSBzeW1ib2xzIChhbmQgdHlw
aWNhbGx5IHRoZQo+Pj4+PiBmdW5jdGlvbnMgYXJlIGFsbCBzdWZmaWNpZW50bHkgc2hvcnQpLiBU
aGUgaXNzdWUgc3RlbXMgZnJvbSB0aGUKPj4+Pj4gZHVhbCB1c2Ugb2YgIm5hbWUiIGluCj4+Pj4+
Cj4+Pj4+ICNkZWZpbmUgX0xPQ0tfUFJPRklMRShuYW1lKSB7IDAsICNuYW1lLCAmbmFtZSwgMCwg
MCwgMCwgMCwgMCB9Cj4+Pj4+Cj4+Pj4+IHNvIEknZCByYXRoZXIgc3VnZ2VzdCBtYWtpbmcgdGhp
cyBhIGRlcml2YXRpb24gb2YgYSBuZXcKPj4+Pj4KPj4+Pj4gI2RlZmluZSBfTE9DS19QUk9GSUxF
X05BTUUobG9jaywgbmFtZSkgeyAwLCAjbmFtZSwgJmxvY2ssIDAsIDAsIDAsIDAsIDAgfQo+Pj4+
Pgo+Pj4+PiBpZiB0aGVyZSdzIG5vIG90aGVyICh0cmFuc3BhcmVudCkgd2F5IG9mIGRpc2FtYmln
dWF0aW5nIHRoZSBuYW1lcy4KPj4+Pgo+Pj4+IFRoaXMgd2lsbCByZXF1aXJlIHRvIHVzZSBhIGRp
ZmZlcmVudCBERUZJTkVfU1BJTkxPQ0soKSB2YXJpYW50LCBzbyBlLmcuCj4+Pj4gREVGSU5FX1NQ
SU5MT0NLX0xPQ0FMKCksIHdoaWNoIHdpbGwgdGhlbiBpbmNsdWRlIHRoZSBuZWVkZWQgInN0YXRp
YyIgYW5kCj4+Pj4gYWRkICJAPGZ1bmM+IiB0byB0aGUgbG9jayBwcm9maWxpbmcgbmFtZS4gSXMg
dGhpcyBva2F5Pwo+Pj4KPj4+IFRvIGJlIGZyYW5rIC0gbm90IHJlYWxseS4gSSBkaXNsaWtlIGJv
dGgsIGFuZCB3b3VsZCBoZW5jZSBwcmVmZXIgdG8KPj4+IHN0aWNrIHRvIHdoYXQgdGhlcmUgaXMg
Y3VycmVudGx5LCB1bnRpbCBzb21lb25lIGludmVudHMgYSB0cmFuc3BhcmVudAo+Pj4gd2F5IHRv
IGRpc2FtYmlndWF0ZSB0aGVzZS4gSSdtIHNvcnJ5IGZvciBiZWluZyB1bmhlbHBmdWwgaGVyZS4K
Pj4KPj4gSSB0aGluayBJIGhhdmUgZm91bmQgYSB3YXk6IEkgY291bGQgYWRkIF9fRklMRV9fIGFu
ZCBfX0xJTkVfXyBkYXRhIHRvCj4+IHN0cnVjdCBsb2NrX3Byb2ZpbGUuIEluIGxvY2tfcHJvZl9p
bml0KCkgSSBjb3VsZCBsb29rIGZvciBub24tdW5pcXVlCj4+IGxvY2sgbmFtZXMgYW5kIG1hcmsg
dGhvc2UgdG8gYmUgcHJpbnRlZCB3aXRoIHRoZSBfX0ZJTEVfXyBhbmQgX19MSU5FX18KPj4gZGF0
YSBhZGRlZCB0byB0aGUgbmFtZXMuCj4+Cj4+IFdvdWxkIHlvdSBiZSBmaW5lIHdpdGggdGhpcyBh
cHByb2FjaD8KPiAKPiBJIHdvdWxkIGJlLCBidXQgSSdtIGFmcmFpZCBBbmRyZXcgd29uJ3QgKGFz
IHdpdGggYW55IG5ldyB1c2VzIG9mIF9fTElORV9fKS4KPiBJIHdvbmRlciBpZiBfX2Z1bmNfXyBv
ciBfX0ZVTkNUSU9OX18gY291bGQgYmUgdXNlZCAtIHRoZSBtYWluIHF1ZXN0aW9uIGlzCj4gaG93
IHRoZXkgYmVoYXZlIHdoZW4gdXNlZCBvdXRzaWRlIG9mIGEgZnVuY3Rpb24uIElmIGVpdGhlciB3
b3VsZCBiZSBOVUxMCj4gKHJhdGhlciB0aGFuIHRyaWdnZXJpbmcgYSBkaWFnbm9zdGljKSwgaXQg
bWlnaHQgYmUgdXNhYmxlIGhlcmUuIE9mIGNvdXJzZQo+IHRoaXMgd291bGQgYmUgZnJhZ2lsZSBp
ZiBqdXN0IGJhc2VkIG9uIG9ic2VydmVkIChyYXRoZXIgdGhhbiBkb2N1bWVudGVkKQo+IGJlaGF2
aW9yLgoKV2l0aCBnY2MgNy40LjEgaXQgZmFpbHM6CgovaG9tZS9ncm9zcy94ZW4veGVuL2luY2x1
ZGUveGVuL3NwaW5sb2NrLmg6ODA6NDE6IGVycm9yOiDigJhfX2Z1bmNfX+KAmSBpcyAKbm90IGRl
ZmluZWQgb3V0c2lkZSBvZiBmdW5jdGlvbiBzY29wZSBbLVdlcnJvcl0KICAjZGVmaW5lIF9MT0NL
X1BST0ZJTEUobmFtZSkgeyAwLCAjbmFtZSwgX19mdW5jX18sICZuYW1lLCAwLCAwLCAwLCAwLCAw
IH0KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
