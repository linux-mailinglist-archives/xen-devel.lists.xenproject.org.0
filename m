Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186911292A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 11:21:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icRkF-0007Pm-6u; Wed, 04 Dec 2019 10:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icRkD-0007Ph-QY
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:18:53 +0000
X-Inumbo-ID: 7632e11c-167f-11ea-81ff-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7632e11c-167f-11ea-81ff-12813bfff9fa;
 Wed, 04 Dec 2019 10:18:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 377ECAFF3;
 Wed,  4 Dec 2019 10:18:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f193cc9d-be1e-aaf3-87e6-dd7a3b9fc7b7@suse.com>
Date: Wed, 4 Dec 2019 11:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204094335.24603-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] x86/svm: Clean up intinfo_t variables
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxMDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3N2bS9pbnRyLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9pbnRyLmMK
PiBAQCAtNDMsMTUgKzQzLDEzIEBAIHN0YXRpYyB2b2lkIHN2bV9pbmplY3Rfbm1pKHN0cnVjdCB2
Y3B1ICp2KQo+ICB7Cj4gICAgICBzdHJ1Y3Qgdm1jYl9zdHJ1Y3QgKnZtY2IgPSB2LT5hcmNoLmh2
bS5zdm0udm1jYjsKPiAgICAgIHUzMiBnZW5lcmFsMV9pbnRlcmNlcHRzID0gdm1jYl9nZXRfZ2Vu
ZXJhbDFfaW50ZXJjZXB0cyh2bWNiKTsKPiAtICAgIGV2ZW50aW5qX3QgZXZlbnQ7Cj4gIAo+IC0g
ICAgZXZlbnQuYnl0ZXMgPSAwOwo+IC0gICAgZXZlbnQuZmllbGRzLnYgPSAxOwo+IC0gICAgZXZl
bnQuZmllbGRzLnR5cGUgPSBYODZfRVZFTlRUWVBFX05NSTsKPiAtICAgIGV2ZW50LmZpZWxkcy52
ZWN0b3IgPSAyOwo+IC0KPiAtICAgIEFTU0VSVCh2bWNiLT5ldmVudGluai5maWVsZHMudiA9PSAw
KTsKPiAtICAgIHZtY2ItPmV2ZW50aW5qID0gZXZlbnQ7Cj4gKyAgICBBU1NFUlQoIXZtY2ItPmV2
ZW50aW5qLnYpOwo+ICsgICAgdm1jYi0+ZXZlbnRpbmogPSAoaW50aW5mb190KXsKPiArICAgICAg
ICAudmVjdG9yID0gMiwKClBlcmhhcHMgVFJBUF9ubWkgaGVyZSwgc2VlaW5nIHRoYXQgVFJBUF8q
IGFyZSB1c2VkIGVsc2V3aGVyZSBhcyB3ZWxsPwpJbiBhbnkgZXZlbnQKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
