Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76439BC65D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:13:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCig7-0003IV-2w; Tue, 24 Sep 2019 11:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCig6-0003IP-5C
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:08:18 +0000
X-Inumbo-ID: 3096bcc0-deb0-11e9-8a4f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3096bcc0-deb0-11e9-8a4f-bc764e2007e4;
 Tue, 24 Sep 2019 09:46:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98D1AAC32;
 Tue, 24 Sep 2019 09:46:31 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-33-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04d23beb-5370-a538-7cc1-785086e10491@suse.com>
Date: Tue, 24 Sep 2019 11:46:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-33-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 32/47] xen/sched: support allocating
 multiple vcpus into one sched unit
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

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMzY2LDE4ICsz
ODAsMzggQEAgc3RhdGljIHZvaWQgc2NoZWRfZnJlZV91bml0KHN0cnVjdCBzY2hlZF91bml0ICp1
bml0KQo+ICAgICAgeGZyZWUodW5pdCk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIHNjaGVkX3Vu
aXRfYWRkX3ZjcHUoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsIHN0cnVjdCB2Y3B1ICp2KQo+ICt7
Cj4gKyAgICB2LT5zY2hlZF91bml0ID0gdW5pdDsKPiArICAgIGlmICggIXVuaXQtPnZjcHVfbGlz
dCB8fCB1bml0LT52Y3B1X2xpc3QtPnZjcHVfaWQgPiB2LT52Y3B1X2lkICkKCklzIHRoZSByaWdo
dCBzaWRlIG5lZWRlZD8gQXJlbid0IHZDUFUtcyBjcmVhdGVkIGluIGluY3JlYXNpbmcgb3JkZXIK
b2YgdGhlaXIgSURzLCBhbmQgYXJlbid0IHdlIHJlbHlpbmcgb24gdGhpcyBlbHNld2hlcmUgdG9v
PwoKPiArICAgIHsKPiArICAgICAgICB1bml0LT52Y3B1X2xpc3QgPSB2Owo+ICsgICAgICAgIHVu
aXQtPnVuaXRfaWQgPSB2LT52Y3B1X2lkOwoKVGhpcyBtYWtlcyBmb3IgYSBwcmV0dHkgc3RyYW5n
ZSBzZXQgb2YgSURzIChub24tc3VjY2Vzc2l2ZSksIGFuZApleHBsYWlucyB3aHkgcGF0Y2ggMjQg
dXNlcyBhIGxvY2FsICJ1bml0X2lkeCIgaW5zdGVhZCBvZiBzd2l0Y2hpbmcKZnJvbSB2LT52Y3B1
X2lkIGFzIGFycmF5IGluZGV4IHRvIHVuaXQtPnVuaXRfaWQuIElzIHRoZXJlIGEgcmVhc29uCnlv
dSBkb24ndCBkaXZpZGUgYnkgdGhlIGdyYW51bGFyaXR5IGhlcmUsIGVsaW1pbmF0aW5nIHRoZSBk
aXZpc2lvbgpkb25lIGUuZy4gLi4uCgo+ICsgICAgfQo+ICsgICAgdW5pdC0+cnVuc3RhdGVfY250
W3YtPnJ1bnN0YXRlLnN0YXRlXSsrOwo+ICt9Cj4gKwo+ICBzdGF0aWMgc3RydWN0IHNjaGVkX3Vu
aXQgKnNjaGVkX2FsbG9jX3VuaXQoc3RydWN0IHZjcHUgKnYpCj4gIHsKPiAgICAgIHN0cnVjdCBz
Y2hlZF91bml0ICp1bml0LCAqKnByZXZfdW5pdDsKPiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2
LT5kb21haW47Cj4gIAo+ICsgICAgZm9yX2VhY2hfc2NoZWRfdW5pdCAoIGQsIHVuaXQgKQo+ICsg
ICAgICAgIGlmICggdW5pdC0+dmNwdV9saXN0LT52Y3B1X2lkIC8gc2NoZWRfZ3JhbnVsYXJpdHkg
PT0KCi4uLiBoZXJlLiAoSSBhbHNvIGRvbid0IHNlZSB3aHkgeW91IGRvbid0IHVzZSB1bml0LT51
bml0X2lkIGhlcmUuKQoKPiBAQCAtNjIyLDkgKzY1OSwxNiBAQCB2b2lkIHNjaGVkX2Rlc3Ryb3lf
dmNwdShzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIGtpbGxfdGltZXIoJnYtPnBvbGxfdGltZXIpOwo+
ICAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9ib29sKHYtPmlzX3VyZ2VudCkgKQo+ICAgICAgICAg
IGF0b21pY19kZWMoJnBlcl9jcHUoc2NoZWRfdXJnZW50X2NvdW50LCB2LT5wcm9jZXNzb3IpKTsK
PiAtICAgIHNjaGVkX3JlbW92ZV91bml0KHZjcHVfc2NoZWR1bGVyKHYpLCB1bml0KTsKPiAtICAg
IHNjaGVkX2ZyZWVfdmRhdGEodmNwdV9zY2hlZHVsZXIodiksIHVuaXQtPnByaXYpOwo+IC0gICAg
c2NoZWRfZnJlZV91bml0KHVuaXQpOwo+ICsgICAgLyoKPiArICAgICAqIFZjcHVzIGFyZSBiZWlu
ZyBkZXN0cm95ZWQgdG9wLWRvd24uIFNvIGJlaW5nIHRoZSBmaXJzdCB2Y3B1IG9mIGFuIHVuaXQK
PiArICAgICAqIGlzIHRoZSBzYW1lIGFzIGJlaW5nIHRoZSBvbmx5IG9uZS4KPiArICAgICAqLwo+
ICsgICAgaWYgKCB1bml0LT52Y3B1X2xpc3QgPT0gdiApCgpJbnRlcmVzdGluZ2x5IGhlcmUgeW91
IHJlbHkgb24gdGhlcmUgYmVpbmcgYSBjZXJ0YWluIG9yZGVyLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
