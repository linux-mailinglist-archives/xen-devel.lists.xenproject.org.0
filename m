Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09EBC758
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:58:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjPT-0001UV-RU; Tue, 24 Sep 2019 11:55:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCjPS-0001UQ-Tr
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:55:10 +0000
X-Inumbo-ID: 27e9d2d0-dec2-11e9-9617-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 27e9d2d0-dec2-11e9-9617-12813bfff9fa;
 Tue, 24 Sep 2019 11:55:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0683DAECA;
 Tue, 24 Sep 2019 11:55:07 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-24-jgross@suse.com>
 <d8c0c521-abc7-89ba-a293-4aac5d8740db@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9e67b7c2-cda4-84f2-ba7e-81775f52c59c@suse.com>
Date: Tue, 24 Sep 2019 13:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d8c0c521-abc7-89ba-a293-4aac5d8740db@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 23/47] xen/sched: switch
 sched_move_irqs() to take sched_unit as parameter
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMTkgMTY6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTQ3NCwxMiArNDc0LDIwIEBAIGlu
dCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYpCj4+ICAgICAgIHJldHVybiAwOwo+PiAg
IH0KPj4gICAKPj4gLXN0YXRpYyB2b2lkIHNjaGVkX21vdmVfaXJxcyhzdHJ1Y3QgdmNwdSAqdikK
Pj4gK3N0YXRpYyB2b2lkIHZjcHVfbW92ZV9pcnFzKHN0cnVjdCB2Y3B1ICp2KQo+PiAgIHsKPj4g
ICAgICAgYXJjaF9tb3ZlX2lycXModik7Cj4+ICAgICAgIGV2dGNobl9tb3ZlX3BpcnFzKHYpOwo+
PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB2b2lkIHNjaGVkX21vdmVfaXJxcyhzdHJ1Y3Qgc2NoZWRf
dW5pdCAqdW5pdCkKPiAKPiBJIHRoaW5rIHRoZSBwYXJhbWV0ZXIgY291bGQgYmUgY29uc3RpZmll
ZC4KClllcy4KCj4gCj4+IEBAIC0xNzM2LDcgKzE3NDQsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZHVs
ZSh2b2lkKQo+PiAgICAgICBzdG9wX3RpbWVyKCZwcmV2LT52Y3B1X2xpc3QtPnBlcmlvZGljX3Rp
bWVyKTsKPj4gICAKPj4gICAgICAgaWYgKCBuZXh0X3NsaWNlLm1pZ3JhdGVkICkKPj4gLSAgICAg
ICAgc2NoZWRfbW92ZV9pcnFzKG5leHQtPnZjcHVfbGlzdCk7Cj4+ICsgICAgICAgIHZjcHVfbW92
ZV9pcnFzKG5leHQtPnZjcHVfbGlzdCk7Cj4gCj4gV2h5IGlzIHRoaXMgbm90IGFsc28gc2NoZWRf
bW92ZV9pcnFzKCksIGF0IHdoaWNoIHBvaW50IHRoZXJlIHdvdWxkbid0Cj4gYmUgYSBuZWVkIGZv
ciBhIHNlcGFyYXRlIHZjcHVfbW92ZV9pcnFzKCkgYWZhaWN0PwoKVGhpcyBpcyB0aGUgcGxhY2Ug
d2hlcmUgYSBzaW5nbGUgdmNwdSBpcyBzY2hlZHVsZWQgb24gYSBuZXcgY3B1LgpUaGUgcGxhY2Vz
IHdoZXJlIHNjaGVkX21vdmVfaXJxcygpIGlzIGJlaW5nIHVzZWQgaXMgd2hlcmUgYSB1bml0IGhh
cwpiZWVuIGZvcmNlZCB0byBvdGhlciBjcHUocykuCgpBdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMg
dGhpcyBpcyBtdWNoIG1vcmUgY2xlYXIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
