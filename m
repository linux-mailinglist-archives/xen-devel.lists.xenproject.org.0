Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B93BC934
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 15:53:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClCq-0003bi-HF; Tue, 24 Sep 2019 13:50:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iClCp-0003bX-BY
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 13:50:15 +0000
X-Inumbo-ID: 3b874830-ded2-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3b874830-ded2-11e9-b588-bc764e2007e4;
 Tue, 24 Sep 2019 13:50:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2B8B2AD20;
 Tue, 24 Sep 2019 13:50:13 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-26-jgross@suse.com>
 <0b50ab7e-f617-d187-01af-a6a22950833e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6c99fd3f-4e00-7e20-8a1b-03cbacfec465@suse.com>
Date: Tue, 24 Sep 2019 15:50:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0b50ab7e-f617-d187-01af-a6a22950833e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 25/47] xen/sched: add runstate counters
 to struct sched_unit
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMTkgMTc6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0zNjgsNyArMzcyLDcgQEAgc3RhdGljIHN0
cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191bml0KHN0cnVjdCB2Y3B1ICp2KQo+PiAgICAg
ICB1bml0LT52Y3B1X2xpc3QgPSB2Owo+PiAgICAgICB1bml0LT51bml0X2lkID0gdi0+dmNwdV9p
ZDsKPj4gICAgICAgdW5pdC0+ZG9tYWluID0gZDsKPj4gLSAgICB2LT5zY2hlZF91bml0ID0gdW5p
dDsKPj4gKyAgICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3RhdGVdKys7Cj4+ICAg
Cj4+ICAgICAgIGZvciAoIHByZXZfdW5pdCA9ICZkLT5zY2hlZF91bml0X2xpc3Q7ICpwcmV2X3Vu
aXQ7Cj4+ICAgICAgICAgICAgIHByZXZfdW5pdCA9ICYoKnByZXZfdW5pdCktPm5leHRfaW5fbGlz
dCApCj4+IEBAIC0zODQsNiArMzg4LDggQEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hl
ZF9hbGxvY191bml0KHN0cnVjdCB2Y3B1ICp2KQo+PiAgICAgICAgICAgICF6YWxsb2NfY3B1bWFz
a192YXIoJnVuaXQtPmNwdV9zb2Z0X2FmZmluaXR5KSApCj4+ICAgICAgICAgICBnb3RvIGZhaWw7
Cj4+ICAgCj4+ICsgICAgdi0+c2NoZWRfdW5pdCA9IHVuaXQ7Cj4+ICsKPj4gICAgICAgcmV0dXJu
IHVuaXQ7Cj4+ICAgCj4+ICAgIGZhaWw6Cj4gCj4gSXMgdGhpcyBtb3ZlbWVudCBvZiB0aGUgYXNz
aWdubWVudCBzb21ldGhpbmcgd2hpY2ggcmVhbGx5IGJlbG9uZ3MKPiBoZXJlLCByYXRoZXIgdGhh
biBpbiBzb21lIGVhcmxpZXIgcGF0Y2ggKHBlcmhhcHMgdGhlIG9uZSBhY3R1YWxseQo+IGludHJv
ZHVjaW5nIGl0KT8KCkl0IGNlcnRhaW5seSBzaG91bGQgYmUgcGFydCBvZiBhbiBlYXJsaWVyIHBh
dGNoLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
