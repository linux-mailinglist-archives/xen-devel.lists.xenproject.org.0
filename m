Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C31F178DDE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 10:56:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Qiw-00032s-SU; Wed, 04 Mar 2020 09:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9Qiv-00032h-Tc
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 09:53:53 +0000
X-Inumbo-ID: 0d9bae7e-5dfe-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d9bae7e-5dfe-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 09:53:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2BD4ACD9;
 Wed,  4 Mar 2020 09:53:50 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200303173904.23492-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2696b52-b838-bd59-48b4-dc46bbeb501c@suse.com>
Date: Wed, 4 Mar 2020 10:53:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303173904.23492-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/sched: fix cpu offlining with core
 scheduling
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxODozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYwo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jCj4gQEAgLTIy
OTksNiArMjI5OSwxMCBAQCB2b2lkIHNjaGVkX2NvbnRleHRfc3dpdGNoZWQoc3RydWN0IHZjcHUg
KnZwcmV2LCBzdHJ1Y3QgdmNwdSAqdm5leHQpCj4gICAgICByY3VfcmVhZF91bmxvY2soJnNjaGVk
X3Jlc19yY3Vsb2NrKTsKPiAgfQo+ICAKPiArLyoKPiArICogU3dpdGNoIHRvIGEgbmV3IGNvbnRl
eHQgb3Iga2VlcCB0aGUgY3VycmVudCBvbmUgcnVubmluZy4KPiArICogT24geDg2IGl0IHdvbid0
IHJldHVybiwgc28gaXQgd2lsbCBkcm9wIHRoZSBzdGlsbCBoZWxkIHNjaGVkX3Jlc19yY3Vsb2Nr
Lgo+ICsgKi8KPiAgc3RhdGljIHZvaWQgc2NoZWRfY29udGV4dF9zd2l0Y2goc3RydWN0IHZjcHUg
KnZwcmV2LCBzdHJ1Y3QgdmNwdSAqdm5leHQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgcmVzZXRfaWRsZV91bml0LCBzX3RpbWVfdCBub3cpCj4gIHsKCkkgZG9uJ3Qg
Zm9sbG93IHRoZSBjb21tZW50OiBUaGVyZSdzCgogICAgICAgIHJldHVybiBjb250aW51ZV9ydW5u
aW5nKHZwcmV2KTsKCmluIHRoZSBmdW5jdGlvbiB3aGljaCBhZmFpY3QgY2FuIGhhcHBlbiBvbiBh
bGwgYXJjaGl0ZWN0dXJlcy4KVGhlIGxvY2sgZ2V0cyBkcm9wcGVkIHRoZXJlIHRvby4gSSBzZWUg
bm8gcGF0aCB0aHJvdWdoIHRoaXMKZnVuY3Rpb24gd2hlcmUgdGhlIGxvY2sgd291bGQgbm90IGdl
dCBkcm9wcGVkLgoKPiBAQCAtMjQwOCw2ICsyNDEyLDkgQEAgc3RhdGljIHN0cnVjdCB2Y3B1ICpz
Y2hlZF9mb3JjZV9jb250ZXh0X3N3aXRjaChzdHJ1Y3QgdmNwdSAqdnByZXYsCj4gICAqIHplcm8g
ZG9fc2NoZWR1bGUoKSBpcyBjYWxsZWQgYW5kIHRoZSByZW5kZXp2b3VzIGNvdW50ZXIgZm9yIGxl
YXZpbmcKPiAgICogY29udGV4dF9zd2l0Y2goKSBpcyBzZXQuIEFsbCBvdGhlciBtZW1iZXJzIHdp
bGwgd2FpdCB1bnRpbCB0aGUgY291bnRlciBpcwo+ICAgKiBiZWNvbWluZyB6ZXJvLCBkcm9wcGlu
ZyB0aGUgc2NoZWR1bGUgbG9jayBpbiBiZXR3ZWVuLgo+ICsgKiBFaXRoZXIgcmV0dXJucyB0aGUg
bmV3IHVuaXQgdG8gcnVuLCBvciBOVUxMIGlmIG5vIGNvbnRleHQgc3dpdGNoIGlzCj4gKyAqIHJl
cXVpcmVkIG9yIChvbiBBUk0pIGhhcyBhbHJlYWR5IGJlZW4gcGVyZm9ybWVkLiBJZiBOVUxMIGlz
IHJldHVybmVkCj4gKyAqIHNjaGVkX3Jlc19yY3Vsb2NrIGhhcyBiZWVuIGRyb3BwZWQuCgpJIGd1
ZXNzIG9mZmljaWFsIEFybSBmb2xrcyB3b3VsZCBsaWtlIEFybSB0byBub3QgYmUgc3BlbGxlZCBh
bGwKdXBwZXIgY2FzZSBhbnltb3JlLgoKPiBAQCAtMjQ4Miw2ICsyNDkwLDIxIEBAIHN0YXRpYyBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKHN0cnVjdCBzY2hlZF91
bml0ICpwcmV2LAo+ICAgICAgICAgICAgICBhdG9taWNfc2V0KCZwcmV2LT5uZXh0X3Rhc2stPnJl
bmRlenZvdXNfb3V0X2NudCwgMCk7Cj4gICAgICAgICAgICAgIHByZXYtPnJlbmRlenZvdXNfaW5f
Y250ID0gMDsKPiAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogQ2hl
Y2sgZm9yIHNjaGVkdWxpbmcgcmVzb3VyY2VkIHN3aXRjaGVkLiBUaGlzIGhhcHBlbnMgd2hlbiB3
ZSBhcmUKPiArICAgICAgICAgKiBtb3ZlZCBhd2F5IGZyb20gb3VyIGNwdXBvb2wgYW5kIGNwdXMg
YXJlIHN1YmplY3Qgb2YgdGhlIGlkbGUKPiArICAgICAgICAgKiBzY2hlZHVsZXIgbm93Lgo+ICsg
ICAgICAgICAqLwoKVGhlICdkJyBvbiBib3RoICJyZXNvdXJjZWQiIGFuZCAic3dpdGNoZWQiIGFy
ZSBvZGQgdG8gcmVhZCBhdApsZWFzdCB0byBtZSwgYW5kIGhlbmNlIG1ha2UgbWUgdW5jZXJ0YWlu
IHdoZXRoZXIgSSBhY3R1YWxseQpjb3JyZWN0bHkgdW5kZXJzdGFuZCB3aGF0IGlzIG1lYW50IGhl
cmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
