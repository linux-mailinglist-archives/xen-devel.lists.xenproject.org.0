Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147CE10B2A0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:46:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzUY-0001ho-Ef; Wed, 27 Nov 2019 15:44:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZzUW-0001he-Ng
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:44:32 +0000
X-Inumbo-ID: cd82f82e-112c-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd82f82e-112c-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 15:44:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E61FB3E6;
 Wed, 27 Nov 2019 15:44:30 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20191127120046.1246-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f847a83d-ce95-5fd4-3cdd-d74f45dcadd6@suse.com>
Date: Wed, 27 Nov 2019 16:44:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127120046.1246-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxMzowMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9jcHUvdnBtdS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKPiBAQCAtNDc5
LDYgKzQ3OSw4IEBAIHN0YXRpYyBpbnQgdnBtdV9hcmNoX2luaXRpYWxpc2Uoc3RydWN0IHZjcHUg
KnYpCj4gIAo+ICAgICAgaWYgKCByZXQgKQo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJO
SU5HICJWUE1VOiBJbml0aWFsaXphdGlvbiBmYWlsZWQgZm9yICVwdlxuIiwgdik7Cj4gKyAgICBl
bHNlCj4gKyAgICAgICAgdnBtdV9zZXQodnBtdSwgVlBNVV9DT05URVhUX0FMTE9DQVRFRCk7Cj4g
IAo+ICAgICAgcmV0dXJuIHJldDsKPiAgfQo+IEBAIC01NzYsMTEgKzU3OCwzNiBAQCBzdGF0aWMg
dm9pZCB2cG11X2FyY2hfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdikKPiAgCj4gICAgICAgICAgIHZw
bXUtPmFyY2hfdnBtdV9vcHMtPmFyY2hfdnBtdV9kZXN0cm95KHYpOwo+ICAgICAgfQo+ICsKPiAr
ICAgIHZwbXVfcmVzZXQodnBtdSwgVlBNVV9DT05URVhUX0FMTE9DQVRFRCk7Cj4gIH0KCkJvcmlz
LAoKSSdkIGxpa2UgdG8gYXNrIHRoYXQgeW91IGNvbW1lbnQgb24gdGhpcyBwYXJ0IG9mIHRoZSBj
aGFuZ2UgYXQKbGVhc3QsIGFzIEkgc2VlbSB0byB2YWd1ZWx5IHJlY2FsbCB0aGF0IHRoaW5ncyB3
ZXJlIGludGVudGlvbmFsbHkKbm90IGRvbmUgdGhpcyB3YXkgb3JpZ2luYWxseS4KClBhdWwsCgpl
dmVyeXRoaW5nIGVsc2UgbG9va3MgZ29kIHRvIG1lIG5vdy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
