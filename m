Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70BBC7EB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 14:34:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjyu-0005Mt-4x; Tue, 24 Sep 2019 12:31:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCjys-0005Mo-9O
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 12:31:46 +0000
X-Inumbo-ID: 44f5d446-dec7-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 44f5d446-dec7-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 12:31:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50859AFB2;
 Tue, 24 Sep 2019 12:31:44 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-25-jgross@suse.com>
 <73c41851-cba3-c8aa-b031-dcfb3dcff6a4@suse.com>
 <f91d4df5-5b35-1030-ea13-c99d3ec16157@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0ae0c50-a8cb-ffc6-06df-e4c20261aa36@suse.com>
Date: Tue, 24 Sep 2019 14:31:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f91d4df5-5b35-1030-ea13-c99d3ec16157@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 24/47] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxNDoxMywgSsO8cmdlbiBHcm/DnyAgd3JvdGU6Cj4gT24gMjAuMDkuMTkg
MTc6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNC4wOS4yMDE5IDEwOjUyLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+Pj4gQEAgLTg5NiwxOCArOTI5LDIyIEBAIHZvaWQgcmVzdG9yZV92Y3B1
X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgY3B1
cG9vbF9kb21haW5fY3B1bWFzayhkKSk7Cj4+PiAgICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5
KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSkgKQo+Pj4gICAgICAgICAgIHsKPj4+IC0gICAgICAg
ICAgICBpZiAoIHYtPmFmZmluaXR5X2Jyb2tlbiApCj4+PiArICAgICAgICAgICAgaWYgKCBzY2hl
ZF9jaGVja19hZmZpbml0eV9icm9rZW4odW5pdCkgKQo+Pj4gICAgICAgICAgICAgICB7Cj4+PiAt
ICAgICAgICAgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh2LCB1bml0LT5jcHVfaGFyZF9hZmZp
bml0eV9zYXZlZCwgTlVMTCk7Cj4+PiAtICAgICAgICAgICAgICAgIHYtPmFmZmluaXR5X2Jyb2tl
biA9IDA7Cj4+PiArICAgICAgICAgICAgICAgIC8qIEFmZmluaXR5IHNldHRpbmdzIG9mIG9uZSB2
Y3B1IGFyZSBmb3IgdGhlIGNvbXBsZXRlIHVuaXQuICovCj4+PiArICAgICAgICAgICAgICAgIHNj
aGVkX3NldF9hZmZpbml0eSh1bml0LT52Y3B1X2xpc3QsCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bml0LT5jcHVfaGFyZF9hZmZpbml0eV9zYXZlZCwgTlVMTCk7Cj4+
Cj4+IFlldCBkZXNwaXRlIHRoZSBjb21tZW50IHRoZSBmdW5jdGlvbiBnZXRzIHBhc3NlZCBhIHN0
cnVjdCB2Y3B1ICosCj4+IGFuZCB0aGlzIGRvZXNuJ3QgbG9vayB0byBjaGFuZ2UgYnkgdGhlIGVu
ZCBvZiB0aGUgc2VyaWVzLiBJcyB0aGVyZQo+PiBhIHJlYXNvbiBmb3IgdGhpcz8KPiAKPiBZZXMu
IHNjaGVkX3NldF9hZmZpbml0eSgpIGlzIHVzZWQgZnJvbSBvdXRzaWRlIG9mIHNjaGVkdWxlLmMg
KGJ5Cj4gZG9tMF9idWlsZC5jKS4KCkhvdyBhYm91dCBjaGFuZ2luZyB0aGUgY2FsbCB0aGVyZSB0
aGVuLCByYXRoZXIgdGhhbiBoYXZpbmcgY29uZnVzaW5nCmNvZGUgaGVyZT8KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
