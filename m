Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF2BC7CA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 14:21:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjk8-0003jg-2z; Tue, 24 Sep 2019 12:16:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCjk6-0003jb-Av
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 12:16:30 +0000
X-Inumbo-ID: 228f236e-dec5-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 228f236e-dec5-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 12:16:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A8D4B97E;
 Tue, 24 Sep 2019 12:16:27 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-38-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1184754b-fbc3-dfb6-6476-e9305e8e1421@suse.com>
Date: Tue, 24 Sep 2019 14:16:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-38-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 37/47] xen/sched: move per-cpu variable
 scheduler to struct sched_resource
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkX2NyZWRpdC5jCj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwo+IEBA
IC0zNTIsOSArMzUyLDEwIEBAIERFRklORV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgbGFzdF90aWNr
bGVfY3B1KTsKPiAgc3RhdGljIGlubGluZSB2b2lkIF9fcnVucV90aWNrbGUoc3RydWN0IGNzY2hl
ZF91bml0ICpuZXcpCj4gIHsKPiAgICAgIHVuc2lnbmVkIGludCBjcHUgPSBzY2hlZF91bml0X2Nw
dShuZXctPnVuaXQpOwo+ICsgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzZCA9IGdldF9zY2hl
ZF9yZXMoY3B1KTsKPiAgICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0ID0gbmV3LT51bml0Owo+
ICAgICAgc3RydWN0IGNzY2hlZF91bml0ICogY29uc3QgY3VyID0gQ1NDSEVEX1VOSVQoY3Vycl9v
bl9jcHUoY3B1KSk7Cj4gLSAgICBzdHJ1Y3QgY3NjaGVkX3ByaXZhdGUgKnBydiA9IENTQ0hFRF9Q
UklWKHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpKTsKPiArICAgIHN0cnVjdCBjc2NoZWRfcHJpdmF0
ZSAqcHJ2ID0gQ1NDSEVEX1BSSVYoc2QtPnNjaGVkdWxlcik7CgpJcyB0aGUgc2luZ2xlIHVzZSAi
c2QiIChhbmQsIGFzIG1lbnRpb25lZCBlbHNld2hlcmUsIG1pcy1uYW1lZCkKcmVhbGx5IHdvcnRo
IGl0PyAoQXBwbGljYWJsZSBmdXJ0aGVyIGRvd24gYXMgd2VsbC4pCgo+IEBAIC05MzEsNyArOTMy
LDggQEAgY3NjaGVkX3VuaXRfYWNjdChzdHJ1Y3QgY3NjaGVkX3ByaXZhdGUgKnBydiwgdW5zaWdu
ZWQgaW50IGNwdSkKPiAgewo+ICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKmN1cnJ1bml0ID0gY3Vy
cmVudC0+c2NoZWRfdW5pdDsKPiAgICAgIHN0cnVjdCBjc2NoZWRfdW5pdCAqIGNvbnN0IHN2YyA9
IENTQ0hFRF9VTklUKGN1cnJ1bml0KTsKPiAtICAgIGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9w
cyA9IHBlcl9jcHUoc2NoZWR1bGVyLCBjcHUpOwo+ICsgICAgc3RydWN0IHNjaGVkX3Jlc291cmNl
ICpzZCA9IGdldF9zY2hlZF9yZXMoY3B1KTsKPiArICAgIGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIg
Km9wcyA9IHNkLT5zY2hlZHVsZXI7Cj4gIAo+ICAgICAgQVNTRVJUKCBzY2hlZF91bml0X2NwdShj
dXJydW5pdCkgPT0gY3B1ICk7Cj4gICAgICBBU1NFUlQoIHN2Yy0+c2RvbSAhPSBOVUxMICk7Cj4g
QEAgLTk4Nyw4ICs5ODksNyBAQCBjc2NoZWRfdW5pdF9hY2N0KHN0cnVjdCBjc2NoZWRfcHJpdmF0
ZSAqcHJ2LCB1bnNpZ25lZCBpbnQgY3B1KQo+ICAgICAgICAgICAgICAgKiBpZGxlcnMuIEJ1dCwg
aWYgd2UgYXJlIGhlcmUsIGl0IG1lYW5zIHRoZXJlIGlzIHNvbWVvbmUgcnVubmluZwo+ICAgICAg
ICAgICAgICAgKiBvbiBpdCwgYW5kIGhlbmNlIHRoZSBiaXQgbXVzdCBiZSB6ZXJvIGFscmVhZHku
Cj4gICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICBBU1NFUlQoIWNwdW1hc2tfdGVzdF9j
cHUoY3B1LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1NDSEVEX1BS
SVYocGVyX2NwdShzY2hlZHVsZXIsIGNwdSkpLT5pZGxlcnMpKTsKPiArICAgICAgICAgICAgQVNT
RVJUKCFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgQ1NDSEVEX1BSSVYoc2QtPnNjaGVkdWxlciktPmlk
bGVycykpOwoKV2hpbGUgYXQgdGhlIGZpcnN0IGdsYW5jZSAic2QiIGlzIHVzZWQgdHdpY2UgaGVy
ZSwgdGhpcyAybmQgdXNlIGlzCmFjdHVhbGx5IHVubmVjZXNzYXJ5IC0gImNwdSIgaGFzbid0IGNo
YW5nZWQgZnJvbSB0aGUgYmVnaW5uaW5nIG9mCnRoZSBmdW5jdGlvbiBhZmFpY3MsIGFuZCBoZW5j
ZSAib3BzIiBjb3VsZCBiZSB1c2VkIGhlcmUuCgpQcmVmZXJhYmx5IHdpdGggdGhlIHN1Z2dlc3Rl
ZCBhZGp1c3RtZW50cyAoYnV0IGZpbmFsIGp1ZGdlbWVudCBpcwp3aXRoIHRoZSBzY2hlZHVsZXIg
bWFpbnRhaW5lcnMgYW55d2F5KQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
