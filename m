Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4E105818
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 18:11:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpvq-0006Dr-HB; Thu, 21 Nov 2019 17:07:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXpvp-0006Dl-Gi
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 17:07:49 +0000
X-Inumbo-ID: 7142ace4-0c81-11ea-a33e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7142ace4-0c81-11ea-a33e-12813bfff9fa;
 Thu, 21 Nov 2019 17:07:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 653F4B1B9;
 Thu, 21 Nov 2019 17:07:47 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
 <0b848790-fcdd-1267-b621-62be6098369d@xen.org>
 <7d15f8ad-27ba-52a2-7006-d94874a2f5ba@suse.com>
 <20191121114322.GA2673@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b76b22d7-55af-c94b-e6f4-cdeec9e3b788@suse.com>
Date: Thu, 21 Nov 2019 18:07:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121114322.GA2673@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 1/2] x86/cpu: maintain a parked CPU bitmap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxMjo0MywgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gVGh1LCBOb3YgMjEsIDIw
MTkgYXQgMTE6MDI6MTBBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjExLjIw
MTkgMTA6NDcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IE9uIDIwLzExLzIwMTkgMjM6MDUsIENo
YW8gR2FvIHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMKPj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vc21wYm9vdC5jCj4+Pj4gQEAgLTM5LDYgKzM5LDcgQEAKPj4+PiAgIGNw
dW1hc2tfdCBjcHVfb25saW5lX21hcDsKPj4+PiAgIGNwdW1hc2tfdCBjcHVfcHJlc2VudF9tYXA7
Cj4+Pj4gICBjcHVtYXNrX3QgY3B1X3Bvc3NpYmxlX21hcDsKPj4+PiArY3B1bWFza192YXJfdCBj
cHVfcGFya2VkX21hcDsKPj4+Cj4+PiBZb3UgZGVmaW5lIGNwdV9wYXJrZWRfbWFwIGJ1dCBBRkFJ
SyBpdCB3aWxsIG5ldmVyIGdldCBhbGxvY2F0ZWQuIFRoZSAKPj4+IHJpc2sgaGVyZSBpcyBhbnkg
YWNjZXNzIHRvIHRoYXQgdmFyaWFibGUgd2lsbCByZXN1bHQgdG8gYSBmYXVsdC4KPj4+Cj4+PiBM
b29raW5nIGF0IHRoZSBjaGFuZ2VzIGJlbG93LCBpdCBsb29rcyBsaWtlIGFjY2VzcyBpbiBjb21t
b24gY29kZSB3aWxsIAo+Pj4gYmUgcHJvdGVjdGVkIGJ5IHBhcmtfb2ZmbGluZV9jcHVzLiBUaGlz
IGlzIGFsd2F5cyBmYWxzZSBvbiBBcm0sIHNvIHRoZSAKPj4+IGNvbXBpbGVyIHNob3VsZCByZW1v
dmUgYW55IGFjY2VzcyB0byBjcHVfcGFya2VkX21hcC4KPj4+Cj4+PiBXaXRoIHRoYXQgaW4gbWlu
ZCwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIG9ubHkgcHJvdmlkZSBhIHByb3RvdHlwZSAK
Pj4+IGZvciBjcHVfcGFya2VkX21hcCBhbmQgc28gdGhlIGxpbmtlciBjYW4gd2FybiBpZiBzb21l
b25lIHVzZWQgaXQuCj4+Cj4+ICsxCj4gCj4gV2lsbCBkby4gSSBhZGRlZCB0aGlzIGJlY2F1c2Ug
SSBhbSBub3Qgc3VyZSBhbGwgY29tcGlsZXJzIHdvdWxkIG9taXQKPiBzdWNoIGFjY2Vzcy4KPiAK
Pj4KPj4gSW4gZmFjdCBJIHdvbmRlciB3aGV0aGVyIHRoZSBtYWludGVuYW5jZSBvZiB0aGUgbWFw
IHNob3VsZCBsaXZlIGluCj4+IGNvbW1vbiBjb2RlIGluIHRoZSBmaXJzdCBwbGFjZS4gV2hpbGUg
Y2xlYXJpbmcgdGhlIHJlc3BlY3RpdmUgYml0Cj4+IGluIGNwdV91cCgpIGxvb2tzIGNvcnJlY3Qg
KGFuZCBjb3VsZCBiZSBkb25lIHdpdGhvdXQgYW55IGlmKCkpLAo+IAo+IEJ1dCB3aGVuIHBhcmtf
b2ZmbGluZV9jcHVzKCkgaXMgZmFsc2UsIHRoZSBtYXAgaXNuJ3QgYWxsb2NhdGVkLiBJIGRvbid0
Cj4gdGhpbmsgaXQgaXMgc2FmZSB0byBhY2Nlc3MgdGhlIG1hcCBpbiB0aGlzIGNhc2UuCgpPaCwg
eW91J3JlIHJpZ2h0IG9mIGNvdXJzZS4gVW5sZXNzIHRoZSBtYXAgd2FzIGFsbG9jYXRlZAp1bmNv
bmRpdGlvbmFsbHkgLi4uCgo+PiBJJ20gbm90IGNvbnZpbmNlZCB0aGUgc2V0dGluZyBvZiB0aGUg
Yml0IGluIGNwdV9kb3duKCkgaXMgZ29pbmcgdG8KPj4gYmUgY29ycmVjdCBpbiBhbGwgY2FzZXMu
Cj4gCj4gRG8geW91IG1lYW4gaW4gc29tZSBjYXNlcywgY3B1X2Rvd24oKSBpcyB0byByZWFsbHkg
b2ZmbGluZSBhIENQVSBldmVuCj4gcGFya19vZmZsaW5lX2NwdXMgaXMgc2V0PyBBbmQgaW4gdGhp
cyBjYXNlLCBzZXR0aW5nIHRoZSBiaXQgaXNuJ3QKPiBjb3JyZWN0LgoKVGhlIHB1cnBvc2VzIG9m
IGNwdV9kb3duKCkgY2FsbHMgX21heV8gYmUgZGlmZmVyZW50LiBQbHVzIHdoZXRoZXIKdGhlcmUn
cyBwYXJraW5nIHdhbnRlZC9uZWNlc3NhcnkgZm9yIGFuIGFyY2hpdGVjdHVyZSBzaG91bGQgcmVt
YWluCi0gYXMgbXVjaCBhcyBwb3NzaWJsZSAtIGFuIGFyY2hpdGVjdHVyZSB0aGluZyB0byBkZWFs
IHdpdGguIEkuZS4KZGVzcGl0ZSBwYXJrX29mZmxpbmVfY3B1cyBiZWluZyB1c2VkIGluIGNvbW1v
biBjb2RlLCBJIHRoaW5rIHdlCnNob3VsZCBzdHJpdmUgdG8gYXZvaWQgYWRkaW5nIG1vcmUgdGhl
cmUgd2hlbiBpdCBjYW4gYmUgYXZvaWRlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
