Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971791231BC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:17:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFTw-0007YU-WA; Tue, 17 Dec 2019 16:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q1hL=2H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihFTv-0007YM-Am
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:13:55 +0000
X-Inumbo-ID: 33a0e1fa-20e8-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33a0e1fa-20e8-11ea-a914-bc764e2007e4;
 Tue, 17 Dec 2019 16:13:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DB33AB7F;
 Tue, 17 Dec 2019 16:13:45 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>, axboe@kernel.dk,
 konrad.wilk@oracle.com, roger.pau@citrix.com
References: <20191217160748.693-1-sjpark@amazon.com>
 <20191217160748.693-3-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <44327bf3-45ed-3e5a-3984-36ea40f53fc5@suse.com>
Date: Tue, 17 Dec 2019 17:13:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217160748.693-3-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 2/6] xenbus/backend: Protect xenbus
 callback with lock
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
Cc: linux-block@vger.kernel.org, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMTkgMTc6MDcsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gRnJvbTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiAKPiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGNh
biByYWNlIHdpdGggYSBkcml2ZXIgY29kZSBhcyB0aGlzIGNhbGxiYWNrCj4gd2lsbCBiZSBjYWxs
ZWQgZnJvbSBhbnkgbWVtb3J5IHByZXNzdXJlIGRldGVjdGVkIGNvbnRleHQuICBUbyBkZWFsIHdp
dGgKPiB0aGUgY2FzZSwgdGhpcyBjb21taXQgYWRkcyBhIHNwaW5sb2NrIGluIHRoZSAneGVuYnVz
X2RldmljZScuICBXaGVuZXZlcgo+ICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgaXMgY2FsbGVk
LCB0aGUgbG9jayBvZiB0aGUgZGV2aWNlIHdoaWNoIHBhc3NlZAo+IHRvIHRoZSBjYWxsYmFjayBh
cyBpdHMgYXJndW1lbnQgaXMgbG9ja2VkLiAgVGh1cywgZHJpdmVycyByZWdpc3RlcmluZwo+IHRo
ZWlyICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgc2hvdWxkIHByb3RlY3QgdGhlIGRhdGEgdGhh
dCBtaWdodCByYWNlCj4gd2l0aCB0aGUgY2FsbGJhY2sgd2l0aCB0aGUgbG9jayBieSB0aGVtc2Vs
dmVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+
Cj4gLS0tCj4gICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgICAgICAgICB8ICAx
ICsKPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jIHwgMTAgKysr
KysrKystLQo+ICAgaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAg
MiArKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgYi9k
cml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPiBpbmRleCA1YjQ3MTg4OWQ3MjMuLmI4
NjM5M2YxNzJlNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2Jl
LmMKPiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPiBAQCAtNDcyLDYg
KzQ3Miw3IEBAIGludCB4ZW5idXNfcHJvYmVfbm9kZShzdHJ1Y3QgeGVuX2J1c190eXBlICpidXMs
Cj4gICAJCWdvdG8gZmFpbDsKPiAgIAo+ICAgCWRldl9zZXRfbmFtZSgmeGVuZGV2LT5kZXYsICIl
cyIsIGRldm5hbWUpOwo+ICsJc3Bpbl9sb2NrX2luaXQoJnhlbmRldi0+cmVjbGFpbV9sb2NrKTsK
PiAgIAo+ICAgCS8qIFJlZ2lzdGVyIHdpdGggZ2VuZXJpYyBkZXZpY2UgZnJhbWV3b3JrLiAqLwo+
ICAgCWVyciA9IGRldmljZV9yZWdpc3RlcigmeGVuZGV2LT5kZXYpOwo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCj4gaW5kZXggN2U3OGViZWY3YzU0Li41MTZhYTY0
Yjk5NjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNr
ZW5kLmMKPiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwo+
IEBAIC0yNTEsMTIgKzI1MSwxOCBAQCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNo
KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCj4gICBzdGF0aWMgaW50IGJhY2tlbmRf
cmVjbGFpbV9tZW1vcnkoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQo+ICAgewo+ICAg
CWNvbnN0IHN0cnVjdCB4ZW5idXNfZHJpdmVyICpkcnY7Cj4gKwlzdHJ1Y3QgeGVuYnVzX2Rldmlj
ZSAqeGRldjsKPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gICAKPiAgIAlpZiAoIWRldi0+ZHJp
dmVyKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAlkcnYgPSB0b194ZW5idXNfZHJpdmVyKGRldi0+ZHJp
dmVyKTsKPiAtCWlmIChkcnYgJiYgZHJ2LT5yZWNsYWltX21lbW9yeSkKPiAtCQlkcnYtPnJlY2xh
aW1fbWVtb3J5KHRvX3hlbmJ1c19kZXZpY2UoZGV2KSk7Cj4gKwlpZiAoZHJ2ICYmIGRydi0+cmVj
bGFpbV9tZW1vcnkpIHsKPiArCQl4ZGV2ID0gdG9feGVuYnVzX2RldmljZShkZXYpOwo+ICsJCXNw
aW5fdHJ5bG9ja19pcnFzYXZlKCZ4ZGV2LT5yZWNsYWltX2xvY2ssIGZsYWdzKTsKCllvdSBuZWVk
IHNwaW5fbG9ja19pcnFzYXZlKCkgaGVyZS4gT3IgbWF5YmUgc3Bpbl9sb2NrKCkgd291bGQgYmUg
ZmluZSwKdG9vPyBJIGNhbid0IHNlZSBhIHJlYXNvbiB3aHkgeW91J2Qgd2FudCB0byBkaXNhYmxl
IGlycXMgaGVyZS4KCj4gKwkJZHJ2LT5yZWNsYWltX21lbW9yeSh4ZGV2KTsKPiArCQlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZ4ZGV2LT5yZWNsYWltX2xvY2ssIGZsYWdzKTsKPiArCX0KPiAgIAly
ZXR1cm4gMDsKPiAgIH0KPiAgIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBi
L2luY2x1ZGUveGVuL3hlbmJ1cy5oCj4gaW5kZXggYzg2MWNmYjZmNzIwLi5kOTQ2ODMxMzA2MWQg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVzLmgKPiArKysgYi9pbmNsdWRlL3hlbi94
ZW5idXMuaAo+IEBAIC03Niw2ICs3Niw4IEBAIHN0cnVjdCB4ZW5idXNfZGV2aWNlIHsKPiAgIAll
bnVtIHhlbmJ1c19zdGF0ZSBzdGF0ZTsKPiAgIAlzdHJ1Y3QgY29tcGxldGlvbiBkb3duOwo+ICAg
CXN0cnVjdCB3b3JrX3N0cnVjdCB3b3JrOwo+ICsJLyogJ3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFj
ayBpcyBjYWxsZWQgd2hpbGUgdGhpcyBsb2NrIGlzIGFjcXVpcmVkICovCj4gKwlzcGlubG9ja190
IHJlY2xhaW1fbG9jazsKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IHhlbmJ1
c19kZXZpY2UgKnRvX3hlbmJ1c19kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQo+IAoKCkp1ZXJn
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
