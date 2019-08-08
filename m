Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F985CDE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 10:29:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvdkt-00084w-Qi; Thu, 08 Aug 2019 08:26:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvdks-00084k-AN
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 08:26:38 +0000
X-Inumbo-ID: 3be0d1a2-b9b6-11e9-9fa0-3f565c29f710
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3be0d1a2-b9b6-11e9-9fa0-3f565c29f710;
 Thu, 08 Aug 2019 08:26:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC423AE49;
 Thu,  8 Aug 2019 08:26:32 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-4-jgross@suse.com>
 <2ac0f92e-8416-7095-5150-edc3acff5364@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6eed5d66-3255-c5ba-ed96-8276ada5cbb3@suse.com>
Date: Thu, 8 Aug 2019 10:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2ac0f92e-8416-7095-5150-edc3acff5364@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 3/4] xen: print lock profile info in panic()
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMDk6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA3LjA4LjIwMTkgMTY6
MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCj4+ICsr
KyBiL3hlbi9LY29uZmlnLmRlYnVnCj4+IEBAIC01Myw2ICs1Myw3IEBAIGNvbmZpZyBTUElOTE9D
S19ERUJVRwo+PiAgICAKPj4gICAgY29uZmlnIExPQ0tfUFJPRklMRQo+PiAgICAJYm9vbCAiTG9j
ayBQcm9maWxpbmciCj4+ICsJc2VsZWN0IFNQSU5MT0NLX0RFQlVHCj4+ICAgIAktLS1oZWxwLS0t
Cj4+ICAgIAkgIExvY2sgcHJvZmlsaW5nIGFsbG93cyB5b3UgdG8gc2VlIGhvdyBvZnRlbiBsb2Nr
cyBhcmUgdGFrZW4gYW5kIGJsb2NrZWQuCj4+ICAgIAkgIFlvdSBjYW4gdXNlIHNlcmlhbCBjb25z
b2xlIHRvIHByaW50IChhbmQgcmVzZXQpIHVzaW5nICdsJyBhbmQgJ0wnCj4gCj4gSW4gd2hpY2gg
Y2FzZSwgZm9yIHNlbnNpYmxlIHVzZXIgZXhwZXJpZW5jZSwgdGhlIHNlbGVjdGVkCj4gb3B0aW9u
IHNob3VsZCBjb21lIGFmdGVyIHRoaXMgb25lLiBUaGUgd2F5IGl0IGlzIG5vdyBhZmFpY3QKPiB0
aGVyZSdsbCBiZSBhIHByb21wdCBmb3IgU1BJTkxPQ0tfREVCVUcsIHRoZSB1c2VyIG1heSBzYXkK
PiAibm8iLCBqdXN0IHRvIGZpbmQgdGhhdCBiZWNhdXNlIG9mIHNheWluZyAieWVzIiBoZXJlIGl0
J2xsCj4gYmUgdHVybmVkIG9uIGFueXdheS4gV2hlcmVhcyB3aXRoIHN3aXRjaGVkIG9yZGVyaW5n
IHRoZXJlJ2xsCj4gYmUgbm8gcHJvbXB0IGZvciB0aGUgZGVidWcgb3B0aW9uIGF0IGFsbCAoYWdh
aW4gYWZhaWN0KSBpZgo+IHRoZSBwcm9maWxpbmcgb3B0aW9uIHdhcyBzZXQgdG8gInllcyIuCgpS
ZW9yZGVyaW5nIGlzIGZpbmUgd2l0aCBtZS4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
