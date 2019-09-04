Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19513A8506
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:05:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5VrX-0006Tv-4e; Wed, 04 Sep 2019 14:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5VrV-0006Tq-8v
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:02:17 +0000
X-Inumbo-ID: 997ee922-cf1c-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 997ee922-cf1c-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 14:02:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E38CAE86;
 Wed,  4 Sep 2019 14:02:14 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-9-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22dc77b0-7ffa-a7ba-c3e5-14833f0b0b72@suse.com>
Date: Wed, 4 Sep 2019 16:02:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-9-jgross@suse.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMjUwLDcg
KzI1MCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgKPiAgCj4g
IHZvaWQgdmNwdV9ydW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCB2Y3B1X3J1bnN0
YXRlX2luZm8gKnJ1bnN0YXRlKQo+ICB7Cj4gLSAgICBzcGlubG9ja190ICpsb2NrID0gbGlrZWx5
KHYgPT0gY3VycmVudCkgPyBOVUxMIDogdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKPiArICAg
IHNwaW5sb2NrX3QgKmxvY2sgPSBsaWtlbHkodiA9PSBjdXJyZW50KQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgID8gTlVMTCA6IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7
Cj4gICAgICBzX3RpbWVfdCBkZWx0YTsKPiAgCj4gICAgICBtZW1jcHkocnVuc3RhdGUsICZ2LT5y
dW5zdGF0ZSwgc2l6ZW9mKCpydW5zdGF0ZSkpOwo+IEBAIC0yNTksNyArMjYwLDcgQEAgdm9pZCB2
Y3B1X3J1bnN0YXRlX2dldChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5m
byAqcnVuc3RhdGUpCj4gICAgICAgICAgcnVuc3RhdGUtPnRpbWVbcnVuc3RhdGUtPnN0YXRlXSAr
PSBkZWx0YTsKPiAgCj4gICAgICBpZiAoIHVubGlrZWx5KGxvY2sgIT0gTlVMTCkgKQo+IC0gICAg
ICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2KTsKPiArICAgICAgICB1bml0X3Nj
aGVkdWxlX3VubG9ja19pcnEobG9jaywgdi0+c2NoZWRfdW5pdCk7Cj4gIH0KCkF0IHRoZSBleGFt
cGxlIG9mIHRoaXM6IFRoZSBtb3JlIGNvYXJzZSBncmFudWxhcml0eSBvZiB0aGUgbG9jawptZWFu
cyB0aGF0IG5vIHR3byB2Q1BVLXMgd2l0aGluIGEgdW5pdCBjYW4gb2J0YWluIHRoZWlyIHJ1bnN0
YXRlCmluIHBhcmFsbGVsLiBXaGlsZSB0aGlzIG1heSBiZSBhY2NlcHRhYmxlIGZvciBjb3JlIHNj
aGVkdWxpbmcsCkknbSBhZnJhaWQgaXQncyB0b28gcmVzdHJpY3RpdmUgZm9yIHNvY2tldHMgb3Ig
bm9kZXMgYXMgdW5pdHMuClRoZXJlZm9yZSBJIHRoaW5rIHRoaXMgbG9jayBuZWVkcyB0byBlaXRo
ZXIgYmUgc3BsaXQgKEknbSBub3QKc3VyZSB0aGF0J3MgZmVhc2libGUpIG9yIGJlY29tZSBhbiBy
L3cgbG9jay4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
