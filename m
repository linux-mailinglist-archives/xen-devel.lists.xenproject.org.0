Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36DF9CB04
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 09:54:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i29me-0001h0-Ll; Mon, 26 Aug 2019 07:51:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i29md-0001gv-Am
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 07:51:23 +0000
X-Inumbo-ID: 4b3de0bc-c7d6-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b3de0bc-c7d6-11e9-8980-bc764e2007e4;
 Mon, 26 Aug 2019 07:51:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77D43AF11;
 Mon, 26 Aug 2019 07:51:20 +0000 (UTC)
To: Nadav Amit <namit@vmware.com>, Andy Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20190823225248.15597-1-namit@vmware.com>
 <20190823225248.15597-2-namit@vmware.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <edb3a7e8-8fc6-7a55-37c1-3384a8413427@suse.com>
Date: Mon, 26 Aug 2019 09:51:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823225248.15597-2-namit@vmware.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH v2 1/3] x86/mm/tlb: Change
 __flush_tlb_one_user interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDguMTkgMDA6NTIsIE5hZGF2IEFtaXQgd3JvdGU6Cj4gX19mbHVzaF90bGJfb25lX3Vz
ZXIoKSBjdXJyZW50bHkgZmx1c2hlcyBhIHNpbmdsZSBlbnRyeSwgYW5kIGZsdXNoZXMgaXQKPiBi
b3RoIGluIHRoZSBrZXJuZWwgYW5kIHVzZXIgcGFnZS10YWJsZXMsIHdoZW4gUFRJIGlzIGVuYWJs
ZWQuCj4gCj4gQ2hhbmdlIF9fZmx1c2hfdGxiX29uZV91c2VyKCkgYW5kIHJlbGF0ZWQgaW50ZXJm
YWNlcyBpbnRvCj4gX19mbHVzaF90bGJfcmFuZ2UoKSB0aGF0IGZsdXNoZXMgYSByYW5nZSBhbmQg
ZG9lcyBub3QgZmx1c2ggdGhlIHVzZXIKPiBwYWdlLXRhYmxlLgo+IAo+IFRoaXMgcmVmYWN0b3Jp
bmcgaXMgbmVlZGVkIGZvciB0aGUgbmV4dCBwYXRjaCwgYnV0IHJlZ2FyZGxlc3MgbWFrZXMKPiBz
ZW5zZSBhbmQgaGFzIHNldmVyYWwgYWR2YW50YWdlcy4gRmlyc3QsIG9ubHkgWGVuLVBWLCB3aGlj
aCBkb2VzIG5vdAo+IHVzZSBQVEksIGltcGxlbWVudHMgdGhlIHBhcmF2aXJ0dWFsIGludGVyZmFj
ZSBvZiBmbHVzaF90bGJfb25lX3VzZXIoKSBzbwo+IG5vdGhpbmcgaXMgYnJva2VuIGJ5IHNlcGFy
YXRpbmcgdGhlIHVzZXIgYW5kIGtlcm5lbCBwYWdlLXRhYmxlIGZsdXNoZXMsCj4gYW5kIHRoZSBp
bnRlcmZhY2UgaXMgbW9yZSBpbnR1aXRpdmUuCj4gCj4gU2Vjb25kLCBJTlZMUEcgY2FuIGZsdXNo
IHVucmVsYXRlZCBtYXBwaW5ncywgYW5kIGl0IGlzIGFsc28gYQo+IHNlcmlhbGl6aW5nIGluc3Ry
dWN0aW9uLiBJdCBpcyBiZXR0ZXIgdG8gaGF2ZSBhIHRpZ2h0IGxvb3AgdGhhdCBmbHVzaGVzCj4g
dGhlIGVudHJpZXMuCj4gCj4gVGhpcmQsIGN1cnJlbnRseSBfX2ZsdXNoX3RsYl9vbmVfa2VybmVs
KCkgYWxzbyBmbHVzaGVzIHRoZSB1c2VyCj4gcGFnZS10YWJsZXMsIHdoaWNoIGlzIG5vdCBuZWVk
ZWQuIFRoaXMgYWxsb3dzIHRvIGF2b2lkIHRoaXMgcmVkdW5kYW50Cj4gZmx1c2guCj4gCj4gQ2M6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ2M6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
PiBTaWduZWQtb2ZmLWJ5OiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPgo+IC0tLQo+ICAg
YXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaCAgICAgICB8ICA1ICsrLS0KPiAgIGFyY2gv
eDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmggfCAgMyArKy0KPiAgIGFyY2gveDg2L2lu
Y2x1ZGUvYXNtL3RsYmZsdXNoLmggICAgICAgfCAyNCArKysrKy0tLS0tLS0tLS0tLQo+ICAgYXJj
aC94ODYva2VybmVsL3BhcmF2aXJ0LmMgICAgICAgICAgICB8ICA3ICsrLS0tCj4gICBhcmNoL3g4
Ni9tbS90bGIuYyAgICAgICAgICAgICAgICAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tCj4gICBhcmNoL3g4Ni94ZW4vbW11X3B2LmMgICAgICAgICAgICAgICAgIHwgMjEgKysr
KysrKysrLS0tLS0tCj4gICA2IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDM3IGRl
bGV0aW9ucygtKQoKLi4uCgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMgYi9h
cmNoL3g4Ni94ZW4vbW11X3B2LmMKPiBpbmRleCA0OGY3YzdlYjRkYmMuLmVkNjg2NTdmNWU3NyAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4vbW11X3B2LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4v
bW11X3B2LmMKPiBAQCAtMTMyNSwyMiArMTMyNSwyNyBAQCBzdGF0aWMgbm9pbmxpbmUgdm9pZCB4
ZW5fZmx1c2hfdGxiKHZvaWQpCj4gICAJcHJlZW1wdF9lbmFibGUoKTsKPiAgIH0KPiAgIAo+IC1z
dGF0aWMgdm9pZCB4ZW5fZmx1c2hfdGxiX29uZV91c2VyKHVuc2lnbmVkIGxvbmcgYWRkcikKPiAr
c3RhdGljIHZvaWQgeGVuX2ZsdXNoX3RsYl9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNp
Z25lZCBsb25nIGVuZCwKPiArCQkJCXU4IHN0cmlkZV9zaGlmdCkKPiAgIHsKPiAgIAlzdHJ1Y3Qg
bW11ZXh0X29wICpvcDsKPiAgIAlzdHJ1Y3QgbXVsdGljYWxsX3NwYWNlIG1jczsKPiAtCj4gLQl0
cmFjZV94ZW5fbW11X2ZsdXNoX3RsYl9vbmVfdXNlcihhZGRyKTsKPiArCXVuc2lnbmVkIGxvbmcg
YWRkcjsKPiAgIAo+ICAgCXByZWVtcHRfZGlzYWJsZSgpOwo+ICAgCj4gICAJbWNzID0geGVuX21j
X2VudHJ5KHNpemVvZigqb3ApKTsKPiAgIAlvcCA9IG1jcy5hcmdzOwo+IC0Jb3AtPmNtZCA9IE1N
VUVYVF9JTlZMUEdfTE9DQUw7Cj4gLQlvcC0+YXJnMS5saW5lYXJfYWRkciA9IGFkZHIgJiBQQUdF
X01BU0s7Cj4gLQlNVUxUSV9tbXVleHRfb3AobWNzLm1jLCBvcCwgMSwgTlVMTCwgRE9NSURfU0VM
Rik7Cj4gICAKPiAtCXhlbl9tY19pc3N1ZShQQVJBVklSVF9MQVpZX01NVSk7Cj4gKwlmb3IgKGFk
ZHIgPSBzdGFydDsgYWRkciA8IGVuZDsgYWRkciArPSAxdWwgPDwgc3RyaWRlX3NoaWZ0KSB7Cj4g
KwkJdHJhY2VfeGVuX21tdV9mbHVzaF90bGJfb25lX3VzZXIoYWRkcik7Cj4gKwo+ICsJCW9wLT5j
bWQgPSBNTVVFWFRfSU5WTFBHX0xPQ0FMOwo+ICsJCW9wLT5hcmcxLmxpbmVhcl9hZGRyID0gYWRk
ciAmIFBBR0VfTUFTSzsKPiArCQlNVUxUSV9tbXVleHRfb3AobWNzLm1jLCBvcCwgMSwgTlVMTCwg
RE9NSURfU0VMRik7Cj4gKwo+ICsJCXhlbl9tY19pc3N1ZShQQVJBVklSVF9MQVpZX01NVSk7Cj4g
Kwl9CgpGb3IgdGhpcyBraW5kIG9mIHVzYWdlIChhIGxvb3ApIHlvdSBzaG91bGQ6CgotIHJlcGxh
Y2UgdGhlIGNhbGwgb2YgeGVuX21jX2VudHJ5KCkgd2l0aCB4ZW5fbWNfYmF0Y2goKQotIHVzZSB4
ZW5fZXh0ZW5kX21tdWV4dF9vcCgpIGZvciBlYWNoIGxvb3AgaXRlcmF0aW9uCi0gY2FsbCB4ZW5f
bWNfaXNzdWUoKSBhZnRlciB0aGUgbG9vcAoKQWRkaXRpb25hbGx5IEknZCBsaWtlIHlvdSB0byBy
ZXBsYWNlIHRyYWNlX3hlbl9tbXVfZmx1c2hfdGxiX29uZV91c2VyKCkKd2l0aCB0cmFjZV94ZW5f
bW11X2ZsdXNoX3RsYl9yYW5nZSgpIHRha2luZyBhbGwgdGhyZWUgcGFyYW1ldGVycyBhbmQKa2Vl
cCBpdCB3aGVyZSBpdCB3YXMgKG91dCBvZiB0aGUgbG9vcCkuCgpUaGUgcGFyYXZpcnQgcGFydHMg
c2VlbSB0byBiZSBva2F5LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
