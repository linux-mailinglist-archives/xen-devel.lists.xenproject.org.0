Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99321B932E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 16:38:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBJzR-0003hU-VP; Fri, 20 Sep 2019 14:34:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBJzQ-0003hK-IG
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 14:34:28 +0000
X-Inumbo-ID: be9542db-dbb3-11e9-9591-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be9542db-dbb3-11e9-9591-12813bfff9fa;
 Fri, 20 Sep 2019 14:34:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6742AAFBE;
 Fri, 20 Sep 2019 14:34:26 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-24-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8c0c521-abc7-89ba-a293-4aac5d8740db@suse.com>
Date: Fri, 20 Sep 2019 16:34:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-24-jgross@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtNDc0LDEy
ICs0NzQsMjAgQEAgaW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIHJl
dHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCBzY2hlZF9tb3ZlX2lycXMoc3RydWN0IHZj
cHUgKnYpCj4gK3N0YXRpYyB2b2lkIHZjcHVfbW92ZV9pcnFzKHN0cnVjdCB2Y3B1ICp2KQo+ICB7
Cj4gICAgICBhcmNoX21vdmVfaXJxcyh2KTsKPiAgICAgIGV2dGNobl9tb3ZlX3BpcnFzKHYpOwo+
ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBzY2hlZF9tb3ZlX2lycXMoc3RydWN0IHNjaGVkX3VuaXQg
KnVuaXQpCgpJIHRoaW5rIHRoZSBwYXJhbWV0ZXIgY291bGQgYmUgY29uc3RpZmllZC4KCj4gQEAg
LTE3MzYsNyArMTc0NCw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCj4gICAgICBzdG9w
X3RpbWVyKCZwcmV2LT52Y3B1X2xpc3QtPnBlcmlvZGljX3RpbWVyKTsKPiAgCj4gICAgICBpZiAo
IG5leHRfc2xpY2UubWlncmF0ZWQgKQo+IC0gICAgICAgIHNjaGVkX21vdmVfaXJxcyhuZXh0LT52
Y3B1X2xpc3QpOwo+ICsgICAgICAgIHZjcHVfbW92ZV9pcnFzKG5leHQtPnZjcHVfbGlzdCk7CgpX
aHkgaXMgdGhpcyBub3QgYWxzbyBzY2hlZF9tb3ZlX2lycXMoKSwgYXQgd2hpY2ggcG9pbnQgdGhl
cmUgd291bGRuJ3QKYmUgYSBuZWVkIGZvciBhIHNlcGFyYXRlIHZjcHVfbW92ZV9pcnFzKCkgYWZh
aWN0PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
