Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEAAD333
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 08:44:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7DL6-0008SS-5N; Mon, 09 Sep 2019 06:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7DL4-0008SN-RJ
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 06:39:50 +0000
X-Inumbo-ID: 9e27b540-d2cc-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e27b540-d2cc-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 06:39:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5A99CB655;
 Mon,  9 Sep 2019 06:39:47 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-10-jgross@suse.com>
 <3c6b8789-fa9a-8590-dc74-100c275e08eb@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e8216a93-ec8d-6e91-a21a-96d3b1d33151@suse.com>
Date: Mon, 9 Sep 2019 08:39:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3c6b8789-fa9a-8590-dc74-100c275e08eb@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 09/48] xen/sched: move some per-vcpu
 items to struct sched_unit
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTY6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFYyOgo+PiAtIG1vdmUgYWZmaW5pdHlfYnJva2Vu
IGJhY2sgdG8gc3RydWN0IHZjcHUgKEphbiBCZXVsaWNoKQo+IAo+IEJ1dCB0aGlzIGFsb25lIHdv
bid0IHdvcms6IE5vdyBhIDJuZCB2Q1BVIGluIGEgdW5pdCB3aWxsIGNsb2JiZXIKPiB3aGF0IGEg
MXN0IG9uZSBtYXkgaGF2ZSBzZXQgYXMgYW4gYWZmaW5pdHkgb3ZlcnJpZGUuIEkgZG9uJ3QKPiB0
aGluayB5b3UgY2FuIGdldCBhd2F5IHdpdGhvdXQgYSBwZXItdkNQVSBDUFUgbWFzaywgb3IgYQo+
IGNvbWJpbmF0aW9uIG9mIHBlci12Q1BVIGFuZCBwZXItdW5pdCBzdGF0ZSBmbGFncy4KClNlZSBw
YXRjaCAyNDogdGhpcyBvbmUgYWRkcyBhIGhlbHBlciBzY2hlZF9jaGVja19hZmZpbml0eV9icm9r
ZW4oKSBmb3IKdGhhdCBwdXJwb3NlIGl0ZXJhdGluZyBvdmVyIHRoZSB2Y3B1cyBjaGVja2luZyB0
aGUgYWZmaW5pdHlfYnJva2VuIGZsYWdzCmFuZCByZXR1cm5pbmcgdHJ1ZSBpZiBhbnkgb2YgdGhl
IHZjcHVzIGhhcyBpdHMgZmxhZyBzZXQuCgo+IAo+PiBAQCAtOTcxLDI2ICs5ODYsMjkgQEAgc3Rh
dGljIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXJfY2hlY2sodW5zaWduZWQgaW50IGNwdSkKPj4g
ICB2b2lkIHNjaGVkX3NldF9hZmZpbml0eSgKPj4gICAgICAgc3RydWN0IHZjcHUgKnYsIGNvbnN0
IGNwdW1hc2tfdCAqaGFyZCwgY29uc3QgY3B1bWFza190ICpzb2Z0KQo+PiAgIHsKPj4gLSAgICBz
Y2hlZF9hZGp1c3RfYWZmaW5pdHkoZG9tX3NjaGVkdWxlcih2LT5kb21haW4pLCB2LT5zY2hlZF91
bml0LCBoYXJkLCBzb2Z0KTsKPj4gKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCA9IHYtPnNj
aGVkX3VuaXQ7Cj4+ICsKPj4gKyAgICBzY2hlZF9hZGp1c3RfYWZmaW5pdHkoZG9tX3NjaGVkdWxl
cih1bml0LT5kb21haW4pLCB1bml0LCBoYXJkLCBzb2Z0KTsKPiAKPiBJbiBhIHNpdHVhdGlvbiBs
aWtlIHRoaXMgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlCj4gdi0+ZG9tYWluIChJ
IGRvbid0IHRoaW5rIHlvdSBtZWFuIHRvIHJlbW92ZSBzdHJ1Y3QgdmNwdSdzIGZpZWxkKS4KPiB2
IGhhcyBqdXN0IGJlZW4gZGUtcmVmZXJlbmNlZCwgc28gdi0+ZG9tYWluIGJlaW5nIGluIGNhY2hl
IGlzCj4gbW9yZSBsaWtlbHkgdGhhbiB1bml0LT5kb21haW4sIGFuZCB0aGVyZSdzIHRoZW4gYWxz
byBubyBkYXRhCj4gZGVwZW5kZW5jeSBvZiB0aGUgc2Vjb25kIGxvYWQgb24gdGhlIGZpcnN0IG9u
ZS4KCk9rYXkuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
