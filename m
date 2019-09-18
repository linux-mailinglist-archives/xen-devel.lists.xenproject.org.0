Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288E1B606A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 11:32:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAWHI-0007Hc-39; Wed, 18 Sep 2019 09:29:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAWHG-0007HX-NK
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:29:34 +0000
X-Inumbo-ID: d2b2a79e-d9f6-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2b2a79e-d9f6-11e9-b76c-bc764e2007e4;
 Wed, 18 Sep 2019 09:29:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 926C4AE2F;
 Wed, 18 Sep 2019 09:29:32 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <8e2aae32-917c-8035-1aef-8b47c321e42b@suse.com>
 <9259c3e4-22e4-0e28-d89d-7e9c259411c5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c15fa172-0cfc-7e51-c061-c452a91270b8@suse.com>
Date: Wed, 18 Sep 2019 11:29:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9259c3e4-22e4-0e28-d89d-7e9c259411c5@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/9] x86/HVM: move NOFLUSH handling out
 of hvm_set_cr3()
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAyMTozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8wOS8yMDE5
IDA3OjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0u
Ywo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4+IEBAIC0yMjgyLDEyICsyMjg3LDEx
IEBAIGludCBodm1fc2V0X2NyMCh1bnNpZ25lZCBsb25nIHZhbHVlLCBib28KPj4gICAgICByZXR1
cm4gWDg2RU1VTF9PS0FZOwo+PiAgfQo+PiAgCj4+IC1pbnQgaHZtX3NldF9jcjModW5zaWduZWQg
bG9uZyB2YWx1ZSwgYm9vbCBtYXlfZGVmZXIpCj4+ICtpbnQgaHZtX3NldF9jcjModW5zaWduZWQg
bG9uZyB2YWx1ZSwgYm9vbCBub2ZsdXNoLCBib29sIG1heV9kZWZlcikKPj4gIHsKPj4gICAgICBz
dHJ1Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7Cj4+ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsK
Pj4gICAgICB1bnNpZ25lZCBsb25nIG9sZCA9IHYtPmFyY2guaHZtLmd1ZXN0X2NyWzNdOwo+PiAt
ICAgIGJvb2wgbm9mbHVzaCA9IGZhbHNlOwo+PiAgCj4+ICAgICAgaWYgKCBtYXlfZGVmZXIgJiYg
dW5saWtlbHkodi0+ZG9tYWluLT5hcmNoLm1vbml0b3Iud3JpdGVfY3RybHJlZ19lbmFibGVkICYK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb25pdG9yX2N0cmxyZWdfYml0bWFz
ayhWTV9FVkVOVF9YODZfQ1IzKSkgKQo+PiBAQCAtMjI5OSwxNyArMjMwMywxMiBAQCBpbnQgaHZt
X3NldF9jcjModW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCj4+ICAgICAgICAgICAgICAvKiBUaGUg
YWN0dWFsIHdyaXRlIHdpbGwgb2NjdXIgaW4gaHZtX2RvX3Jlc3VtZSgpLCBpZiBwZXJtaXR0ZWQu
ICovCj4+ICAgICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT53cml0ZV9kYXRhLmRvX3dyaXRl
LmNyMyA9IDE7Cj4+ICAgICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT53cml0ZV9kYXRhLmNy
MyA9IHZhbHVlOwo+PiArICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+d3JpdGVfZGF0YS5j
cjNfbm9mbHVzaCA9IG5vZmx1c2g7Cj4gCj4gLi4uIHRoaXMsIHdoaWNoIEknbSBwcmV0dHkgc3Vy
ZSBicmVha3MgdGhlIHJlcG9ydGluZyBvZiBub2ZsdXNoIG1vdiB0bwo+IGNyMydzLsKgIFRoZSBz
ZW1hbnRpY3Mgb2YgdGhlIFZNSSBob29rIGlzICJ0aGUgZ3Vlc3QgdHJpZWQgdG8gd3JpdGUgdGhp
cwo+IHZhbHVlIHRvIGNyMyIsIHdoaWNoIHNob3VsZCBpbmNsdWRlIHRoZSBub2ZsdXNoIGJpdCBp
biBpdHMgYXJjaGl0ZWN0dXJhbAo+IHBvc2l0aW9uLsKgIEkgc3VzcGVjdCBpdCBhbHNvIGJyZWFr
cyBhIHJlcGx5IHdpdGggdGhlIG5vZmx1c2ggYml0IHNldCwKPiBiZWNhdXNlIEkgZG9uJ3Qgc2Vl
IGFueSB3YXkgdGhhdCBpcyBmZWQgYmFjayBmcm9tIHRoZSBpbnRyb3NwZWN0aW5nIGFnZW50LgoK
aHZtX21vbml0b3JfY3IoKSB6YXBzIHRoZSBiaXQgb2ZmIHRoZSByZXBvcnRlZCB2YWx1ZS4gSSB3
b25kZXIKd2hldGhlciB0aGUgcGF0Y2ggaGVyZSBzaG91bGQgaW5jbHVkZSByZW1vdmluZyB0aGlz
IHphcHBpbmcsIGFzCmJlaW5nIHJlZHVuZGFudCBub3cuIEkgZG9uJ3QgdGhpbmsgdGhvdWdoIHRo
YXQgdGhlIHBhdGNoIGFsdGVycwpiZWhhdmlvciBpbiB0aGlzIHJlZ2FyZC4KCj4gQ0MnaW5nIHRo
ZSBJbnRyb3NwZWN0aW9uIG1haW50YWluZXJzIGZvciB0aGVpciB2aWV3LgoKSSdsbCB3YWl0IGZv
ciB0aGVpciBmZWVkYmFjayBhbnl3YXksIGJlZm9yZSBtYWtpbmcgYW55IHBvc3NpYmxlCmNoYW5n
ZSB0byB0aGUgcGF0Y2guCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
