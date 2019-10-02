Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59548C4892
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 09:33:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZ6l-0003ur-MS; Wed, 02 Oct 2019 07:31:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFZ6k-0003ul-66
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:31:34 +0000
X-Inumbo-ID: a8603740-e4e6-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a8603740-e4e6-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 07:31:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BA0DCAE79;
 Wed,  2 Oct 2019 07:31:32 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1569957357-20803-1-git-send-email-igor.druzhinin@citrix.com>
 <63495f52-d696-e3bb-d82b-a5f3663ce3ba@citrix.com>
 <86a72e5d-1785-6d00-0891-97634d79c9cf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <136b9552-63cf-c726-ed1c-9dd1b312acb3@suse.com>
Date: Wed, 2 Oct 2019 09:31:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <86a72e5d-1785-6d00-0891-97634d79c9cf@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/crash: force unlock console
 before printing on kexec crash
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAyMTo1MSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMDEvMTAvMjAx
OSAyMDo0OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMTAvMjAxOSAyMDoxNSwgSWdv
ciBEcnV6aGluaW4gd3JvdGU6Cj4+PiBUaGVyZSBpcyBhIHNtYWxsIHdpbmRvdyB3aGVyZSBzaG9v
dGRvd24gTk1JIG1pZ2h0IGNvbWUgdG8gYSBDUFUKPj4+IChlLmcuIGluIHNlcmlhbCBpbnRlcnJ1
cHQgaGFuZGxlcikgd2hlcmUgY29uc29sZSBsb2NrIGlzIHRha2VuLiBJbiBvcmRlcgo+Pj4gbm90
IHRvIGxlYXZlIGZvbGxvd2luZyBjb25zb2xlIHByaW50cyB3YWl0aW5nIGluZmluaXRlbHkgZm9y
IHNob3QgZG93bgo+Pj4gQ1BVcyB0byBmcmVlIHRoZSBsb2NrIC0gZm9yY2UgdW5sb2NrIHRoZSBj
b25zb2xlLgo+Pj4KPj4+IFRoZSByYWNlIGhhcyBiZWVuIGZyZXF1ZW50bHkgb2JzZXJ2ZWQgd2hp
bGUgY3Jhc2hpbmcgbmVzdGVkIFhlbiBpbgo+Pj4gYW4gSFZNIGRvbWFpbi4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPj4+
IC0tLQo+Pj4gIHhlbi9hcmNoL3g4Ni9jcmFzaC5jIHwgMiArKwo+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NyYXNo
LmMgYi94ZW4vYXJjaC94ODYvY3Jhc2guYwo+Pj4gaW5kZXggNmUxZDNkMy4uYTIwZWM4YSAxMDA2
NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcmFzaC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYv
Y3Jhc2guYwo+Pj4gQEAgLTI5LDYgKzI5LDcgQEAKPj4+ICAjaW5jbHVkZSA8YXNtL2lvX2FwaWMu
aD4KPj4+ICAjaW5jbHVkZSA8eGVuL2lvbW11Lmg+Cj4+PiAgI2luY2x1ZGUgPGFzbS9ocGV0Lmg+
Cj4+PiArI2luY2x1ZGUgPHhlbi9jb25zb2xlLmg+Cj4+PiAgCj4+PiAgc3RhdGljIGNwdW1hc2tf
dCB3YWl0aW5nX3RvX2NyYXNoOwo+Pj4gIHN0YXRpYyB1bnNpZ25lZCBpbnQgY3Jhc2hpbmdfY3B1
Owo+Pj4gQEAgLTE1NSw2ICsxNTYsNyBAQCBzdGF0aWMgdm9pZCBubWlfc2hvb3Rkb3duX2NwdXMo
dm9pZCkKPj4+ICAgICAgfQo+Pj4gIAo+Pj4gICAgICAvKiBMZWF2ZSBhIGhpbnQgb2YgaG93IHdl
bGwgd2UgZGlkIHRyeWluZyB0byBzaG9vdCBkb3duIHRoZSBvdGhlciBjcHVzICovCj4+PiArICAg
IGNvbnNvbGVfZm9yY2VfdW5sb2NrKCk7Cj4+PiAgICAgIGlmICggY3B1bWFza19lbXB0eSgmd2Fp
dGluZ190b19jcmFzaCkgKQo+Pj4gICAgICAgICAgcHJpbnRrKCJTaG90IGRvd24gYWxsIENQVXNc
biIpOwo+Pj4gICAgICBlbHNlCj4+Cj4+IFRoZSBvdmVyYWxsIGNoYW5nZSwgUi1ieSBtZSwgYnV0
IEknZCBwcmVmZXIgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZjoKPj4KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9jcmFzaC5jIGIveGVuL2FyY2gveDg2L2NyYXNoLmMKPj4gaW5kZXgg
NmUxZDNkM2E4NC4uNDE2ODc0NjVhYyAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L2NyYXNo
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NyYXNoLmMKPj4gQEAgLTE1NCw2ICsxNTQsMTIgQEAg
c3RhdGljIHZvaWQgbm1pX3Nob290ZG93bl9jcHVzKHZvaWQpCj4+IMKgwqDCoMKgwqDCoMKgwqAg
bXNlY3MtLTsKPj4gwqDCoMKgwqAgfQo+PiDCoAo+PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAq
IFdlIG1heSBoYXZlIE5NSSdkIGFub3RoZXIgQ1BVIHdoaWxlIGl0IHdhcyBob2xkaW5nIHRoZSBj
b25zb2xlIGxvY2suCj4+ICvCoMKgwqDCoCAqIEl0IHdvbid0IGJlIGluIGEgcG9zaXRpb24gdG8g
cmVsZWFzZSB0aGUgbG9jay4uLgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBjb25zb2xlX2Zv
cmNlX3VubG9jaygpOwo+PiArCj4+IMKgwqDCoMKgIC8qIExlYXZlIGEgaGludCBvZiBob3cgd2Vs
bCB3ZSBkaWQgdHJ5aW5nIHRvIHNob290IGRvd24gdGhlIG90aGVyCj4+IGNwdXMgKi8KPj4gwqDC
oMKgwqAgaWYgKCBjcHVtYXNrX2VtcHR5KCZ3YWl0aW5nX3RvX2NyYXNoKSApCj4+IMKgwqDCoMKg
wqDCoMKgwqAgcHJpbnRrKCJTaG90IGRvd24gYWxsIENQVXNcbiIpOwo+Pgo+Pgo+PiBJZiB5b3Un
cmUgaGFwcHksIEkgY2FuIGZvbGQgdGhpcyBpbiBvbiBjb21taXQuCj4gCj4gSGF2ZSBubyBvYmpl
Y3Rpb25zIGJ1dCB0aGVyZSBhcmUgb3RoZXIgcGxhY2VzIHdlIGNhbGwKPiBjb25zb2xlX2ZvcmNl
X3VubG9jaygpIGZvciBzaW1pbGFyIHB1cnBvc2VzIGFuZCB0aG9zZSBkb24ndCBoYXZlCj4gZXhw
bGFuYXRvcnkgY29tbWVudHMgbGlrZSB0aGF0LiBGcm9tIG15IHBvaW50IG9mIHZpZXcgdGhlIHJl
YXNvbiBoZXJlIGlzCj4ga2luZCBvZiBvYnZpb3VzIGJ1dCBpZiB5b3UgcHJlZmVyLi4uCgorMSBm
b3IgdGhlIHZhcmlhbnQgd2l0aCBjb21tZW50LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
