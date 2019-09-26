Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4C5BEB6B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 06:53:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDLic-000185-23; Thu, 26 Sep 2019 04:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t6lf=XV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDLia-000180-H8
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 04:49:28 +0000
X-Inumbo-ID: 04646624-e019-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 04646624-e019-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 04:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE16CACFE;
 Thu, 26 Sep 2019 04:49:25 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-20-jgross@suse.com>
 <3ccca9314d883f656b88e63a2ef9cb226c6d0f58.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8f2ae546-b3b5-8844-a378-f6cb0051a57e@suse.com>
Date: Thu, 26 Sep 2019 06:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3ccca9314d883f656b88e63a2ef9cb226c6d0f58.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 19/47] xen: add sched_unit_pause_nosync()
 and sched_unit_unpause()
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

T24gMjUuMDkuMTkgMTc6MjAsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFNhdCwgMjAxOS0w
OS0xNCBhdCAxMDo1MiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlIGNyZWRpdCBz
Y2hlZHVsZXIgY2FsbHMgdmNwdV9wYXVzZV9ub3N5bmMoKSBhbmQgdmNwdV91bnBhdXNlKCkKPj4g
dG9kYXkuCj4+Cj4gSXQgZG9lcy4gQW5kLCBGV0lXLCBJIGhhdGUgaXQgd2l0aCBhbGwgbXkgaGVh
cnQgYmVjYXVzZSBvZiB0aGF0IChhbW9uZwo+IG90aGVyIHRoaW5ncyEgOi1EKS4KPiAKPj4gQWRk
IHNjaGVkX3VuaXRfcGF1c2Vfbm9zeW5jKCkgYW5kIHNjaGVkX3VuaXRfdW5wYXVzZSgpIHRvCj4+
IHBlcmZvcm0gdGhlIHNhbWUgb3BlcmF0aW9ucyBvbiBzY2hlZHVsZXIgdW5pdHMgaW5zdGVhZC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+
PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggYi94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQtaWYuaAo+PiBpbmRleCBkNjI0YjgxZTUzLi5iNTk2N2QyNmFmIDEwMDY0NAo+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
c2NoZWQtaWYuaAo+PiBAQCAtNDMyLDYgKzQzMiwxNiBAQCBzdGF0aWMgaW5saW5lIGludCBzY2hl
ZF9hZGp1c3RfY3B1cG9vbChjb25zdAo+PiBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAo+PiAgICAgICBy
ZXR1cm4gcy0+YWRqdXN0X2dsb2JhbCA/IHMtPmFkanVzdF9nbG9iYWwocywgb3ApIDogMDsKPj4g
ICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfdW5pdF9wYXVzZV9ub3N5bmMo
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCj4+ICt7Cj4+ICsgICAgdmNwdV9wYXVzZV9ub3N5bmMo
dW5pdC0+dmNwdV9saXN0KTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSB2b2lkIHNjaGVk
X3VuaXRfdW5wYXVzZShzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPj4gK3sKPj4gKyAgICB2Y3B1
X3VucGF1c2UodW5pdC0+dmNwdV9saXN0KTsKPj4gK30KPj4gKwo+IFNvLCBpc24ndCB0aGlzIGFu
b3RoZXIgb25lIG9mIHRob3NlIHBsYWNlcyB3aGVyZSB3ZSBjb3VsZCBoYXZlIHRoZQo+IGZvcl9l
YWNoX3VuaXRfdmNwdSgpIGxvb3AgYWxyZWFkeT8KClllcy4KCgpKdWVyZ2VuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
