Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E7B8D37
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 10:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBEai-0005O0-Pz; Fri, 20 Sep 2019 08:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBEag-0005Nu-FW
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 08:48:34 +0000
X-Inumbo-ID: 6cdf0b54-db83-11e9-9686-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cdf0b54-db83-11e9-9686-12813bfff9fa;
 Fri, 20 Sep 2019 08:48:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34DCFB60E;
 Fri, 20 Sep 2019 08:48:32 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <20190917132125.13033-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1909191542330.19418@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d91648c-5039-a93d-e694-453c8c51b93d@suse.com>
Date: Fri, 20 Sep 2019 10:48:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909191542330.19418@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm32: setup: Give a xenheap page to
 the boot allocator
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAwMDo0OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MTcgU2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQEAgLTY2NSw2ICs2NjYsMTEgQEAg
c3RhdGljIHZvaWQgX19pbml0IHNldHVwX21tKHZvaWQpCj4+ICAKPj4gICAgICBzZXR1cF94ZW5o
ZWFwX21hcHBpbmdzKChlID4+IFBBR0VfU0hJRlQpIC0geGVuaGVhcF9wYWdlcywgeGVuaGVhcF9w
YWdlcyk7Cj4+ICAKPj4gKyAgICAvKiBXZSBuZWVkIGEgc2luZ2xlIG1hcHBlZCBwYWdlIGZvciBw
b3B1bGF0aW5nIGJvb3RtZW1fcmVnaW9uX2xpc3QuICovCj4+ICsgICAgYm9vdF9tZm5fc3RhcnQg
PSBtZm5fYWRkKHhlbmhlYXBfbWZuX2VuZCwgLTEpOwo+PiArICAgIGJvb3RfbWZuX2VuZCA9IHhl
bmhlYXBfbWZuX2VuZDsKPj4gKyAgICBpbml0X2Jvb3RfcGFnZXMobWZuX3RvX21hZGRyKGJvb3Rf
bWZuX3N0YXJ0KSwgbWZuX3RvX21hZGRyKGJvb3RfbWZuX2VuZCkpOwo+PiArCj4+ICAgICAgLyog
QWRkIG5vbi14ZW5oZWFwIG1lbW9yeSAqLwo+PiAgICAgIGZvciAoIGkgPSAwOyBpIDwgYm9vdGlu
Zm8ubWVtLm5yX2JhbmtzOyBpKysgKQo+PiAgICAgIHsKPj4gQEAgLTcxMCw3ICs3MTYsNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKPj4gIAo+PiAgICAgIC8qIEFkZCB4ZW5o
ZWFwIG1lbW9yeSB0aGF0IHdhcyBub3QgYWxyZWFkeSBhZGRlZCB0byB0aGUgYm9vdCBhbGxvY2F0
b3IuICovCj4+ICAgICAgaW5pdF94ZW5oZWFwX3BhZ2VzKG1mbl90b19tYWRkcih4ZW5oZWFwX21m
bl9zdGFydCksCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIG1mbl90b19tYWRkcih4ZW5oZWFw
X21mbl9lbmQpKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX21hZGRyKGJvb3Rf
bWZuX2VuZCkpOwo+IAo+IEkgY2FuIHNlZSB3aGF0IHlvdSBhcmUgdHJ5aW5nIHRvIGRvIHdpdGgg
dGhpcyBwYXRjaCBhbmQgaXQgbG9va3MgbGlrZQo+IHRoZSByaWdodCBmaXggYXQgdGhlIG1vbWVu
dC4gSG93ZXZlciwgc2hvdWxkbid0IHRoaXMgbGFzdCBjaGFuZ2U6Cj4gCj4gICBtZm5fdG9fbWFk
ZHIoYm9vdF9tZm5fc3RhcnQpCgpPaCwgaW5kZWVkIC0gd2hlbiBkb2luZyB0aGUgcmV2aWV3IHll
c3RlcmRheSBJIHRob3VnaHQgSSBoYWQKY2FyZWZ1bGx5IGNvbXBhcmVkIHdpdGggaG93IHRoaW5n
cyBsb29rZWQgcHJpb3IgdG8gdGhlIGNoYW5nZQpuZWVkaW5nIGZpeGluZyB1cCBub3csIHlldCBJ
IGRpZG4ndCBzcG90IHRoaXMgKG90aGVyd2lzZQpvYnZpb3VzKSBkaWZmZXJlbmNlIHRvIHRoZSBv
cmlnaW5hbCBjb2RlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
