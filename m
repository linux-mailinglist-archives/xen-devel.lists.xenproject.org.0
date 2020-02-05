Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA431530FE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 13:45:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izK18-0002IN-KD; Wed, 05 Feb 2020 12:42:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izK16-0002II-RI
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 12:42:52 +0000
X-Inumbo-ID: 0559eb8a-4815-11ea-90e9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0559eb8a-4815-11ea-90e9-12813bfff9fa;
 Wed, 05 Feb 2020 12:42:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 76C91AF84;
 Wed,  5 Feb 2020 12:42:50 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-2-liuwe@microsoft.com>
 <a44595da-5039-49bc-4d5e-83c4442456be@suse.com>
 <20200205120900.3eafvayolnbe7arb@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <faab2cb8-061a-3a8c-777b-449e7cbf7c63@suse.com>
Date: Wed, 5 Feb 2020 13:42:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205120900.3eafvayolnbe7arb@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 01/10] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxMzowOSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEZlYiAwNSwgMjAy
MCBhdCAxMjoxMjozMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDQuMDIuMjAy
MCAxNjozNiwgV2VpIExpdSB3cm90ZToKPj4+IEBAIC0yNTQsMTQgKzI2MCwyMCBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPj4+ICAgICAgICAgICAgICAgICBYRU5fTEVHQUNZX01B
WF9WQ1BVUyk7Cj4+PiAgICAgIH0KPj4+ICAKPj4+IC0gICAgaW5pdF9ldnRjaG4oKTsKPj4+ICsg
ICAgQlVHX09OKGluaXRfZXZ0Y2huKCkpOwo+Pj4gIH0KPj4+ICAKPj4+IC1zdGF0aWMgdm9pZCBh
cF9zZXR1cCh2b2lkKQo+Pj4gK3N0YXRpYyBpbnQgYXBfc2V0dXAodm9pZCkKPj4+ICB7Cj4+PiAr
ICAgIGludCByYzsKPj4+ICsKPj4+ICAgICAgc2V0X3ZjcHVfaWQoKTsKPj4+IC0gICAgbWFwX3Zj
cHVpbmZvKCk7Cj4+PiAtICAgIGluaXRfZXZ0Y2huKCk7Cj4+PiArCj4+PiArICAgIHJjID0gbWFw
X3ZjcHVpbmZvKCk7Cj4+PiArICAgIGlmICggcmMgKQo+Pj4gKyAgICAgICAgcmV0dXJuIHJjOwo+
Pj4gKwo+Pj4gKyAgICByZXR1cm4gaW5pdF9ldnRjaG4oKTsKPj4+ICB9Cj4+Cj4+IFRvIGF2b2lk
IGEgbG9jYWwgdmFyaWFibGUsIGhvdyBhYm91dAo+Pgo+PiAgICAgcmV0dXJuIG1hcF92Y3B1aW5m
bygpID86IGluaXRfZXZ0Y2huKCk7Cj4+Cj4+ID8KPiAKPiBJU1RSIHRoaXMgaXMgYSBHTlUgZXh0
ZW5zaW9uLCBidXQgc2VlaW5nIHRoYXQgdGhlcmUgaXMgYWxyZWFkeSBxdWl0ZSBhCj4gbG90IG9m
IGl0IGluIGh5cGVyY2lzb3IgY29kZSwgSSB3aWxsIG1ha2UgdGhlIGNoYW5nZS4KCkluIG91ciBv
d24gY29kZSB1c2luZyBleHRlbnNpb25zIGlzIGdlbmVyYWxseSBmaW5lIChhcyBmYXIgYXMKdGhl
eSdyZSBzdWZmaWNpZW50bHkgYmFja3dhcmRzIGNvbXBhdGlibGUpLiBJdCdzIHRoZSBwdWJsaWMK
aGVhZGVycyB3aGVyZSB3ZSB3YW50IHRvIGJlIG1vcmUgY2FyZWZ1bC4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
