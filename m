Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD77A8584
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5W5h-0007ym-VL; Wed, 04 Sep 2019 14:16:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5W5f-0007yL-VV
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:16:56 +0000
X-Inumbo-ID: a5752d98-cf1e-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5752d98-cf1e-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 14:16:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D3DFB65F;
 Wed,  4 Sep 2019 14:16:53 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-10-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c6b8789-fa9a-8590-dc74-100c275e08eb@suse.com>
Date: Wed, 4 Sep 2019 16:16:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-10-jgross@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBWMjoKPiAtIG1vdmUg
YWZmaW5pdHlfYnJva2VuIGJhY2sgdG8gc3RydWN0IHZjcHUgKEphbiBCZXVsaWNoKQoKQnV0IHRo
aXMgYWxvbmUgd29uJ3Qgd29yazogTm93IGEgMm5kIHZDUFUgaW4gYSB1bml0IHdpbGwgY2xvYmJl
cgp3aGF0IGEgMXN0IG9uZSBtYXkgaGF2ZSBzZXQgYXMgYW4gYWZmaW5pdHkgb3ZlcnJpZGUuIEkg
ZG9uJ3QKdGhpbmsgeW91IGNhbiBnZXQgYXdheSB3aXRob3V0IGEgcGVyLXZDUFUgQ1BVIG1hc2ss
IG9yIGEKY29tYmluYXRpb24gb2YgcGVyLXZDUFUgYW5kIHBlci11bml0IHN0YXRlIGZsYWdzLgoK
PiBAQCAtOTcxLDI2ICs5ODYsMjkgQEAgc3RhdGljIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXJf
Y2hlY2sodW5zaWduZWQgaW50IGNwdSkKPiAgdm9pZCBzY2hlZF9zZXRfYWZmaW5pdHkoCj4gICAg
ICBzdHJ1Y3QgdmNwdSAqdiwgY29uc3QgY3B1bWFza190ICpoYXJkLCBjb25zdCBjcHVtYXNrX3Qg
KnNvZnQpCj4gIHsKPiAtICAgIHNjaGVkX2FkanVzdF9hZmZpbml0eShkb21fc2NoZWR1bGVyKHYt
PmRvbWFpbiksIHYtPnNjaGVkX3VuaXQsIGhhcmQsIHNvZnQpOwo+ICsgICAgc3RydWN0IHNjaGVk
X3VuaXQgKnVuaXQgPSB2LT5zY2hlZF91bml0Owo+ICsKPiArICAgIHNjaGVkX2FkanVzdF9hZmZp
bml0eShkb21fc2NoZWR1bGVyKHVuaXQtPmRvbWFpbiksIHVuaXQsIGhhcmQsIHNvZnQpOwoKSW4g
YSBzaXR1YXRpb24gbGlrZSB0aGlzIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHVzZQp2
LT5kb21haW4gKEkgZG9uJ3QgdGhpbmsgeW91IG1lYW4gdG8gcmVtb3ZlIHN0cnVjdCB2Y3B1J3Mg
ZmllbGQpLgp2IGhhcyBqdXN0IGJlZW4gZGUtcmVmZXJlbmNlZCwgc28gdi0+ZG9tYWluIGJlaW5n
IGluIGNhY2hlIGlzCm1vcmUgbGlrZWx5IHRoYW4gdW5pdC0+ZG9tYWluLCBhbmQgdGhlcmUncyB0
aGVuIGFsc28gbm8gZGF0YQpkZXBlbmRlbmN5IG9mIHRoZSBzZWNvbmQgbG9hZCBvbiB0aGUgZmly
c3Qgb25lLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
