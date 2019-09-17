Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA1B4EC8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 15:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAD8U-0006Lj-T8; Tue, 17 Sep 2019 13:03:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAD8T-0006LD-GZ
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 13:03:13 +0000
X-Inumbo-ID: 80b3bf92-d94b-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80b3bf92-d94b-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 13:03:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E7E5EAE36;
 Tue, 17 Sep 2019 13:03:10 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <8e2aae32-917c-8035-1aef-8b47c321e42b@suse.com>
 <d337fda7232b4b099e16de5615c68558@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7092f79-d858-d2c7-a44d-de722358247c@suse.com>
Date: Tue, 17 Sep 2019 15:03:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d337fda7232b4b099e16de5615c68558@AMSPEX02CL03.citrite.net>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 BorisOstrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxNDo0NSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2Yg
SmFuIEJldWxpY2gKPj4gU2VudDogMTcgU2VwdGVtYmVyIDIwMTkgMDc6MTUKPj4KPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVs
YXRlLmMKPj4gQEAgLTIwODAsNiArMjA4MCw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0ZV9j
cigKPj4gICAgICBIVk1UUkFDRV9MT05HXzJEKENSX1dSSVRFLCByZWcsIFRSQ19QQVJfTE9ORyh2
YWwpKTsKPj4gICAgICBzd2l0Y2ggKCByZWcgKQo+PiAgICAgIHsKPj4gKyAgICAgICAgYm9vbCBu
b2ZsdXNoOwo+PiArCj4gCj4gSSBzYWlkIHRoaXMgYmVmb3JlLi4uIEkgdGhpbmsgdGhlIHRpZ2h0
ZXIgY2FzZS1zY29wZSBpcyBiZXR0ZXIuCgpJIHJlY2FsbCB5b3Ugc2F5aW5nIHNvLCBidXQgSSBk
b24ndCByZWNhbGwgeW91IGFjdHVhbGx5IG1ha2luZyB0aGlzIGEKcmVxdWlyZW1lbnQgdG8gZ2V0
IHlvdXIgYWNrLgoKPiBDb3NtZXRpY2FsbHkgaXQgbWF5IGxvb2sgYSBsaXR0bGUgb2RkLCBidXQg
c3VyZWx5IGl0IGdpdmVzIHRoZQo+IGNvbXBpbGVyIGEgYmV0dGVyIGNoYW5jZSB0byBvcHRpbWl6
ZT8KCkkgZG9uJ3QgdGhpbmsgc28gLSB0aGV5J3JlIHByZXR0eSBnb29kIHRvIGxpbWl0IHRoZSBs
aWZlIHJhbmdlIG9mCnZhcmlhYmxlcyAoYXQgbGVhc3QgaW4gbm90IG92ZXJseSBoYWlyeSBmdW5j
dGlvbnMpIHRoZXNlIGRheXMuIFRoZQptb3JlIG5hcnJvdyBzY29wZXMgd2Ugb2Z0ZW4gYXNrIGZv
ciBhcmUgbW9yZSBmb3IgdGhlIHJlYWRlciB0bwplYXNpbHkga25vdyB3aGF0IHRoZSBpbnRlbmRl
ZCB1c2FnZSByYW5nZSBvZiBhIHZhcmlhYmxlIGlzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
