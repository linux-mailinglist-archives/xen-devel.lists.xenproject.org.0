Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E34A85C1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:44:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5WT9-0002l0-EK; Wed, 04 Sep 2019 14:41:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5WT7-0002kv-Ef
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:41:09 +0000
X-Inumbo-ID: 07e61764-cf22-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07e61764-cf22-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 14:41:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF127B6AB;
 Wed,  4 Sep 2019 14:41:06 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-9-jgross@suse.com>
 <22dc77b0-7ffa-a7ba-c3e5-14833f0b0b72@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <dfec18bc-e323-bb28-7333-2e5a459d0ec7@suse.com>
Date: Wed, 4 Sep 2019 16:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <22dc77b0-7ffa-a7ba-c3e5-14833f0b0b72@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 08/48] xen/sched: switch
 vcpu_schedule_lock to unit_schedule_lock
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTY6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTI1MCw3ICsyNTAsOCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UoCj4+ICAgCj4+ICAgdm9pZCB2Y3B1
X3J1bnN0YXRlX2dldChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAq
cnVuc3RhdGUpCj4+ICAgewo+PiAtICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBsaWtlbHkodiA9PSBj
dXJyZW50KSA/IE5VTEwgOiB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHYpOwo+PiArICAgIHNwaW5s
b2NrX3QgKmxvY2sgPSBsaWtlbHkodiA9PSBjdXJyZW50KQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICA/IE5VTEwgOiB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQpOwo+PiAg
ICAgICBzX3RpbWVfdCBkZWx0YTsKPj4gICAKPj4gICAgICAgbWVtY3B5KHJ1bnN0YXRlLCAmdi0+
cnVuc3RhdGUsIHNpemVvZigqcnVuc3RhdGUpKTsKPj4gQEAgLTI1OSw3ICsyNjAsNyBAQCB2b2lk
IHZjcHVfcnVuc3RhdGVfZ2V0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9p
bmZvICpydW5zdGF0ZSkKPj4gICAgICAgICAgIHJ1bnN0YXRlLT50aW1lW3J1bnN0YXRlLT5zdGF0
ZV0gKz0gZGVsdGE7Cj4+ICAgCj4+ICAgICAgIGlmICggdW5saWtlbHkobG9jayAhPSBOVUxMKSAp
Cj4+IC0gICAgICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2KTsKPj4gKyAgICAg
ICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwo+PiAgIH0K
PiAKPiBBdCB0aGUgZXhhbXBsZSBvZiB0aGlzOiBUaGUgbW9yZSBjb2Fyc2UgZ3JhbnVsYXJpdHkg
b2YgdGhlIGxvY2sKPiBtZWFucyB0aGF0IG5vIHR3byB2Q1BVLXMgd2l0aGluIGEgdW5pdCBjYW4g
b2J0YWluIHRoZWlyIHJ1bnN0YXRlCj4gaW4gcGFyYWxsZWwuIFdoaWxlIHRoaXMgbWF5IGJlIGFj
Y2VwdGFibGUgZm9yIGNvcmUgc2NoZWR1bGluZywKPiBJJ20gYWZyYWlkIGl0J3MgdG9vIHJlc3Ry
aWN0aXZlIGZvciBzb2NrZXRzIG9yIG5vZGVzIGFzIHVuaXRzLgo+IFRoZXJlZm9yZSBJIHRoaW5r
IHRoaXMgbG9jayBuZWVkcyB0byBlaXRoZXIgYmUgc3BsaXQgKEknbSBub3QKPiBzdXJlIHRoYXQn
cyBmZWFzaWJsZSkgb3IgYmVjb21lIGFuIHIvdyBsb2NrLgoKWW91IGFyZSBhd2FyZSB0aGF0IGV2
ZW4gdG9kYXkgd2l0aCBjcmVkaXQyIGFsbCBjcHVzIG9mIGEgc29ja2V0IHNoYXJlCnRoZSBzYW1l
IGxvY2sgKGlmIG5vdCBtb2RpZmllZCB2aWEgYm9vdCBwYXJhbWV0ZXIpPwoKCkp1ZXJnZW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
