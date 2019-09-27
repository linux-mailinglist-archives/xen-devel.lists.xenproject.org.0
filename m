Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C438C01B9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:04:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDm8L-0005nQ-E3; Fri, 27 Sep 2019 09:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDm8K-0005nE-JQ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:01:48 +0000
X-Inumbo-ID: 6fa5727e-e105-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6fa5727e-e105-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 09:01:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4700FAFCC;
 Fri, 27 Sep 2019 09:01:47 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-11-jgross@suse.com>
 <e202c297e139a4082af81da1c25e88426a3fc76e.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dde98abe-a674-fc30-530e-7302115934e2@suse.com>
Date: Fri, 27 Sep 2019 11:01:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e202c297e139a4082af81da1c25e88426a3fc76e.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 10/46] xen/sched: add scheduler helpers
 hiding vcpu
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTA6NTIsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OS0yNyBhdCAwOTowMCArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQWRkIHRoZSBmb2xs
b3dpbmcgaGVscGVycyB1c2luZyBhIHNjaGVkX3VuaXQgYXMgaW5wdXQgaW5zdGVhZCBvZiBhCj4+
IHZjcHU6Cj4+Cj4+IC0gaXNfaWRsZV91bml0KCkgc2ltaWxhciB0byBpc19pZGxlX3ZjcHUoKQo+
PiAtIGlzX3VuaXRfb25saW5lKCkgc2ltaWxhciB0byBpc192Y3B1X29ubGluZSgpIChyZXR1cm5z
IHRydWUgd2hlbiBhbnkKPj4gICAgb2YgaXRzIHZjcHVzIGlzIG9ubGluZSkKPj4gLSB1bml0X3J1
bm5hYmxlKCkgbGlrZSB2Y3B1X3J1bm5hYmxlKCkgKHJldHVybnMgdHJ1ZSBpZiBhbnkgb2YgaXRz
Cj4+ICAgIHZjcHVzIGlzIHJ1bm5hYmxlKQo+PiAtIHNjaGVkX3NldF9yZXMoKSB0byBzZXQgdGhl
IGN1cnJlbnQgc2NoZWR1bGluZyByZXNvdXJjZSBvZiBhIHVuaXQKPj4gLSBzY2hlZF91bml0X2Nw
dSgpIHRvIGdldCB0aGUgY3VycmVudCBwcm9jZXNzb3Igb2YgYSB1bml0IChyZXR1cm5zCj4+Cj4g
ICAgICBec2NoZWRfdW5pdF9tYXN0ZXIoKSA/CgpZZXMsIGhhZCBzZWVuIHRoYXQgYWxyZWFkeS4K
Cj4gCj4+ICAgIHRoZSBtYXN0ZXJfY3B1IG9mIHRoZSBzY2hlZHVsaW5nIHJlc291cmNlIG9mIGEg
dW5pdCkKPj4gLSBzY2hlZF97c2V0fGNsZWFyfV9wYXVzZV9mbGFnc1tfYXRvbWljXSgpIHRvIG1v
ZGlmeSBwYXVzZV9mbGFncyBvZgo+PiB0aGUKPj4gICAgYXNzb2NpYXRlZCB2Y3B1KHMpIChtb2Rp
ZmllcyB0aGUgcGF1c2VfZmxhZ3Mgb2YgYWxsIHZjcHVzIG9mIHRoZQo+PiAgICB1bml0KQo+PiAt
IHNjaGVkX2lkbGVfdW5pdCgpIHRvIGdldCB0aGUgc2NoZWRfdW5pdCBwb2ludGVyIG9mIHRoZSBp
ZGxlIHZjcHUgb2YKPj4gYQo+PiAgICBzcGVjaWZpYyBwaHlzaWNhbCBjcHUKPj4KPj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+IFdpdGggdGhhdCBm
aXhlZDoKPiAKPiBSZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNv
bT4KClRoYW5rcywKCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
