Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA013DE2B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 15:57:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is6X4-000100-1k; Thu, 16 Jan 2020 14:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is6X2-0000zs-Vy
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 14:54:01 +0000
X-Inumbo-ID: 01f5ccd4-3870-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01f5ccd4-3870-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 14:53:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E962B26E;
 Thu, 16 Jan 2020 14:53:50 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <199ba3c6fbe8f3de3b1513f70c5ea77f67aa2b42.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <845a06c6-478d-fe76-1954-2ddb7333bd89@suse.com>
Date: Thu, 16 Jan 2020 15:53:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <199ba3c6fbe8f3de3b1513f70c5ea77f67aa2b42.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 05/18] x86/mem_sharing: don't try to
 unshare twice during page fault
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEBAIC0xNzAyLDEx
ICsxNzAzLDE0IEBAIGludCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1
bnNpZ25lZCBsb25nIGdsYSwKPiAgICAgIHN0cnVjdCBkb21haW4gKmN1cnJkID0gY3Vyci0+ZG9t
YWluOwo+ICAgICAgc3RydWN0IHAybV9kb21haW4gKnAybSwgKmhvc3RwMm07Cj4gICAgICBpbnQg
cmMsIGZhbGxfdGhyb3VnaCA9IDAsIHBhZ2VkID0gMDsKPiAtICAgIGludCBzaGFyaW5nX2Vub21l
bSA9IDA7Cj4gICAgICB2bV9ldmVudF9yZXF1ZXN0X3QgKnJlcV9wdHIgPSBOVUxMOwo+ICAgICAg
Ym9vbCBzeW5jID0gZmFsc2U7Cj4gICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlcjsKPiAgCj4g
KyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKPiArICAgIGJvb2wgc2hhcmluZ19lbm9tZW0gPSBm
YWxzZTsKPiArI2VuZGlmCgpUbyByZWR1Y2UgI2lmZGVmLWFyeSwgY291bGQgeW91IGxlYXZlIHRo
aXMgYWxvbmUgKG9yIGNvbnZlcnQgdG8KYm9vbCBpbiBwbGFjZSwgd2l0aG91dCAjaWZkZWYpIGFu
ZCAuLi4KCj4gQEAgLTE5NTUsMTkgKzE5NjEsMjEgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2Vf
ZmF1bHQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAo+ICAgICAgICovCj4gICAgICBp
ZiAoIHBhZ2VkICkKPiAgICAgICAgICBwMm1fbWVtX3BhZ2luZ19wb3B1bGF0ZShjdXJyZCwgZ2Zu
KTsKPiArCj4gKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKPiAgICAgIGlmICggc2hhcmluZ19l
bm9tZW0gKQo+ICAgICAgewo+IC0gICAgICAgIGludCBydjsKPiAtCj4gLSAgICAgICAgaWYgKCAo
cnYgPSBtZW1fc2hhcmluZ19ub3RpZnlfZW5vbWVtKGN1cnJkLCBnZm4sIHRydWUpKSA8IDAgKQo+
ICsgICAgICAgIGlmICggIXZtX2V2ZW50X2NoZWNrX3JpbmcoY3VycmQtPnZtX2V2ZW50X3NoYXJl
KSApCj4gICAgICAgICAgewo+IC0gICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAiRG9t
YWluICVodSBhdHRlbXB0IHRvIHVuc2hhcmUgIgo+IC0gICAgICAgICAgICAgICAgICAgICAiZ2Zu
ICVseCwgRU5PTUVNIGFuZCBubyBoZWxwZXIgKHJjICVkKVxuIiwKPiAtICAgICAgICAgICAgICAg
ICAgICAgY3VycmQtPmRvbWFpbl9pZCwgZ2ZuLCBydik7Cj4gKyAgICAgICAgICAgIGdwcmludGso
WEVOTE9HX0VSUiwgIkRvbWFpbiAlcGQgYXR0ZW1wdCB0byB1bnNoYXJlICIKPiArICAgICAgICAg
ICAgICAgICAgICAiZ2ZuICVseCwgRU5PTUVNIGFuZCBubyBoZWxwZXJcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgY3VycmQsIGdmbik7Cj4gICAgICAgICAgICAgIC8qIENyYXNoIHRoZSBkb21h
aW4gKi8KPiAgICAgICAgICAgICAgcmMgPSAwOwo+ICAgICAgICAgIH0KPiAgICAgIH0KPiArI2Vu
ZGlmCgouLi4gbW92ZSB0aGUgI2lmZGVmIGluc2lkZSB0aGUgYnJhY2VzIGhlcmU/IFdpdGggdGhp
cwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
