Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C76B1046
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:47:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8POt-00085d-GC; Thu, 12 Sep 2019 13:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8POs-00085X-Bf
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:44:42 +0000
X-Inumbo-ID: 788cab12-d563-11e9-959a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 788cab12-d563-11e9-959a-12813bfff9fa;
 Thu, 12 Sep 2019 13:44:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA174AFBD;
 Thu, 12 Sep 2019 13:44:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-23-jgross@suse.com>
 <61e63336-affb-ca2b-944a-a6cb8e3c2862@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e9edfb7c-17b8-f997-2b5c-52a17e73b698@suse.com>
Date: Thu, 12 Sep 2019 15:44:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <61e63336-affb-ca2b-944a-a6cb8e3c2862@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 22/48] xen/sched: switch schedule() from
 vcpus to sched_units
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

T24gMDkuMDkuMTkgMTY6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTI0OCw2ICsyNDgsMjAgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHZjcHVfcnVuc3RhdGVfY2hhbmdlKAo+PiAgICAgICB2LT5ydW5zdGF0
ZS5zdGF0ZSA9IG5ld19zdGF0ZTsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQg
c2NoZWRfdW5pdF9ydW5zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsCj4+ICsg
ICAgYm9vbCBydW5uaW5nLCBzX3RpbWVfdCBuZXdfZW50cnlfdGltZSkKPj4gK3sKPj4gKyAgICBz
dHJ1Y3QgdmNwdSAqdiA9IHVuaXQtPnZjcHVfbGlzdDsKPj4gKwo+PiArICAgIGlmICggcnVubmlu
ZyApCj4+ICsgICAgICAgIHZjcHVfcnVuc3RhdGVfY2hhbmdlKHYsIFJVTlNUQVRFX3J1bm5pbmcs
IG5ld19lbnRyeV90aW1lKTsKPj4gKyAgICBlbHNlCj4+ICsgICAgICAgIHZjcHVfcnVuc3RhdGVf
Y2hhbmdlKHYsCj4+ICsgICAgICAgICAgICAoKHYtPnBhdXNlX2ZsYWdzICYgVlBGX2Jsb2NrZWQp
ID8gUlVOU1RBVEVfYmxvY2tlZCA6Cj4+ICsgICAgICAgICAgICAgKHZjcHVfcnVubmFibGUodikg
PyBSVU5TVEFURV9ydW5uYWJsZSA6IFJVTlNUQVRFX29mZmxpbmUpKSwKPj4gKyAgICAgICAgICAg
IG5ld19lbnRyeV90aW1lKTsKPj4gK30KPiAKPiBJIGZpbmQgaXQgcHV6emxpbmcgdGhhdCB0aGlz
IGdldHMgaW50cm9kdWNlZCwgYnV0IHdvbid0IHN1cnZpdmUgdGlsbAo+IHRoZSBlbmQgb2YgdGhl
IHNlcmllcy4gSSBjYW4gb25seSBndWVzcyB0aGF0IHlvdSBjYW4ndCBkbyB3aXRob3V0IHRoZQo+
IHNlcGFyYXRpb24gaW50ZXJtZWRpYXRlbHkuIE1ha2luZyBzdWNoIHRyYW5zaWVudCBzdGF0ZSBt
b3JlIGFwcGFyZW50Cj4gZnJvbSB0aGUgZGVzY3JpcHRpb24gd291bGQgYmUgbmljZSBpbW8uCgpU
aGUgZnVuY3Rpb25hbGl0eSB3aWxsIHN0YXksIGJ1dCBpdCB3aWxsIGJlIHN1YnN1bWVkIGluIHBh
dGNoIDM1LiBJCmRvbid0IHRoaW5rIEkgc2hvdWxkIG1lbnRpb24gdGhhdCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UsIHNvIGRvIHlvdSB3YW50Cm1lIHRvIGp1c3QgYWRkIGl0IGJlbG93IHRoZSAiLS0t
IiBtYXJrZXI/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
