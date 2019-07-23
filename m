Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472471A1C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 16:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpvZ4-0000F2-GL; Tue, 23 Jul 2019 14:14:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpvZ3-0000Ex-E2
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 14:14:49 +0000
X-Inumbo-ID: 39ff075d-ad54-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 39ff075d-ad54-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 14:14:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5457AEA7;
 Tue, 23 Jul 2019 14:14:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <dfc90ddc-5d6e-6da7-f820-97c7823ec540@citrix.com>
 <73a52696-39ef-14f6-04cc-e2dc9a8c5ee8@suse.com>
 <cc078685-aae5-5382-1422-13cafeee7129@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c80e9174-c153-f6f3-af51-1e8ea3fb940a@suse.com>
Date: Tue, 23 Jul 2019 16:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <cc078685-aae5-5382-1422-13cafeee7129@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMTU6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjMvMDcvMjAxOSAx
NDoyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjMuMDcuMTkgMTQ6MjYsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAyMy8wNy8yMDE5IDEwOjIwLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4KPj4+PiAgwqDCoMKgwqDCoCB9Cj4+Pj4gIMKgIMKgwqDCoMKgwqAgLyoKPj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aAo+Pj4+IGluZGV4IGI0MGM4ZmQxMzguLjcyMWM0Mjk0NTQgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NjaGVkLmgKPj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+
Pj4+IEBAIC0yMDAsNyArMjAwLDEwIEBAIHN0cnVjdCB2Y3B1Cj4+Pj4gIMKgwqDCoMKgwqAgLyog
VkNQVSBpcyBwYXVzZWQgZm9sbG93aW5nIHNodXRkb3duIHJlcXVlc3QKPj4+PiAoZC0+aXNfc2h1
dHRpbmdfZG93bik/ICovCj4+Pj4gIMKgwqDCoMKgwqAgYm9vbMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwYXVzZWRfZm9yX3NodXRkb3duOwo+Pj4+ICDCoMKgwqDCoMKgIC8qIFZDUFUgbmVlZCBh
ZmZpbml0eSByZXN0b3JlZCAqLwo+Pj4+IC3CoMKgwqAgYm9vbMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhZmZpbml0eV9icm9rZW47Cj4+Pj4gK8KgwqDCoCB1aW50OF90wqDCoMKgwqDCoMKgwqDC
oMKgIGFmZmluaXR5X2Jyb2tlbjsKPj4+PiArI2RlZmluZSBWQ1BVX0FGRklOSVRZX09WRVJSSURF
wqDCoMKgIDB4MDEKPj4+PiArI2RlZmluZSBWQ1BVX0FGRklOSVRZX05NScKgwqDCoMKgwqDCoMKg
wqAgMHgwMgo+Pj4KPj4+IFZDUFVfQUZGSU5JVFlfTk1JX01DRSA/wqAgSXQgaXMgdXNlZCBmb3Ig
bW9yZSB0aGFuIGp1c3QgTk1Jcy4KPj4KPj4gT2theS4KPj4KPj4gQlRXOiBUaGUgTUNFIGNhc2Ug
aXMgbmV2ZXIgdHJpZ2dlcmVkICh0aGVyZSBpcyBubyBjYWxsZXIgb2YKPj4gcHZfcmFpc2VfaW50
ZXJydXB0KCkgd2l0aCBUUkFQX21hY2hpbmVfY2hlY2spLiBJcyB0aGlzIGNvZGUgbGVmdCBpbgo+
PiBwbGFjZSBvbiBwdXJwb3NlIG9yIGNvdWxkIGl0IGJlIHJlbW92ZWQ/Cj4gCj4gSXQgY29tZSBm
cm9tIHRoZSByZXN0b3JlX2FsbF9ndWVzdCBwYXRoIGluIGFzc2VtYmx5LCB2aWEgcHJvY2Vzc19t
Y2UuCgpBcmUgeW91IHN1cmU/IEkgY2FuIHNlZSB0aGF0IGl0IHdvdWxkIGNhbGwKc2V0X2d1ZXN0
X21hY2hpbmVjaGVja190cmFwYm91bmNlKCksIGJ1dCBJIGRvbid0IHNlZSBob3cgTk1JX01DRV9T
T0ZUSVJRCndvdWxkIGJlIHRyaWdnZXJlZCBvbiB0aGlzIHBhdGgsIHdoaWNoIHdvdWxkIGJlIHJl
cXVpcmVkIGZvciBoaXR0aW5nCm5taV9tY2Vfc29mdGlycSgpLgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
