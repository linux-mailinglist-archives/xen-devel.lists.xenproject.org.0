Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4332E8325A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:10:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzCe-0003Rd-Hh; Tue, 06 Aug 2019 13:08:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huzCc-0003RP-Nk
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:08:34 +0000
X-Inumbo-ID: 4ad8cf75-b84b-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ad8cf75-b84b-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 13:08:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9BD71B11B;
 Tue,  6 Aug 2019 13:08:32 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Message-ID: <e8869ce1-afad-c5d1-9f44-2f00384bdb57@suse.com>
Date: Tue, 6 Aug 2019 15:08:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v5 03/10] AMD/IOMMU: don't free shared IRT
 multiple times
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2FsbGluZyBhbWRfaW9tbXVfZnJlZV9pbnRyZW1hcF90YWJsZSgpIGZvciBldmVyeSBJVlJTIGVu
dHJ5IGlzIGNvcnJlY3QKb25seSBpbiBwZXItZGV2aWNlLUlSVCBtb2RlLiBVc2UgYSBOVUxMIDJu
ZCBhcmd1bWVudCB0byBpbmRpY2F0ZSB0aGF0CnRoZSBzaGFyZWQgdGFibGUgc2hvdWxkIGJlIGZy
ZWVkLCBhbmQgY2FsbCB0aGUgZnVuY3Rpb24gZXhhY3RseSBvbmNlIGluCnNoYXJlZCBtb2RlLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjU6IE5l
dy4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwpAQCAtMTEwNiw2ICsxMTA2
LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBhbWRfaW9tbXVfaW5pdF9jbGVhbnUKICB7CiAgICAg
IHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCAqbmV4dDsKICAKKyAgICAvKiBmcmVlIGludGVycnVw
dCByZW1hcHBpbmcgdGFibGUgKi8KKyAgICBpZiAoIGFtZF9pb21tdV9wZXJkZXZfaW50cmVtYXAg
KQorICAgICAgICBpdGVyYXRlX2l2cnNfZW50cmllcyhhbWRfaW9tbXVfZnJlZV9pbnRyZW1hcF90
YWJsZSk7CisgICAgZWxzZSBpZiAoIHNoYXJlZF9pbnRyZW1hcF90YWJsZSApCisgICAgICAgIGFt
ZF9pb21tdV9mcmVlX2ludHJlbWFwX3RhYmxlKGxpc3RfZmlyc3RfZW50cnkoJmFtZF9pb21tdV9o
ZWFkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBhbWRfaW9tbXUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGlzdCksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5VTEwpOworCiAgICAgIC8qIGZyZWUgYW1kIGlvbW11IGxpc3QgKi8KICAgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlICggaW9tbXUsIG5leHQsICZhbWRfaW9tbXVfaGVhZCwg
bGlzdCApCiAgICAgIHsKQEAgLTExMjgsOSArMTEzNyw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBh
bWRfaW9tbXVfaW5pdF9jbGVhbnUKICAgICAgICAgIHhmcmVlKGlvbW11KTsKICAgICAgfQogIAot
ICAgIC8qIGZyZWUgaW50ZXJydXB0IHJlbWFwcGluZyB0YWJsZSAqLwotICAgIGl0ZXJhdGVfaXZy
c19lbnRyaWVzKGFtZF9pb21tdV9mcmVlX2ludHJlbWFwX3RhYmxlKTsKLQogICAgICAvKiBmcmVl
IGRldmljZSB0YWJsZSAqLwogICAgICBkZWFsbG9jYXRlX2RldmljZV90YWJsZSgmZGV2aWNlX3Rh
YmxlKTsKICAKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwor
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCkBAIC03OTIsMTQg
Kzc5MiwyMyBAQCB2b2lkIGFtZF9pb21tdV9yZWFkX21zaV9mcm9tX2lyZSgKICBpbnQgX19pbml0
IGFtZF9pb21tdV9mcmVlX2ludHJlbWFwX3RhYmxlKAogICAgICBjb25zdCBzdHJ1Y3QgYW1kX2lv
bW11ICppb21tdSwgc3RydWN0IGl2cnNfbWFwcGluZ3MgKml2cnNfbWFwcGluZykKICB7Ci0gICAg
dm9pZCAqdGIgPSBpdnJzX21hcHBpbmctPmludHJlbWFwX3RhYmxlOworICAgIHZvaWQgKip0Ymxw
OwogIAotICAgIFhGUkVFKGl2cnNfbWFwcGluZy0+aW50cmVtYXBfaW51c2UpOworICAgIGlmICgg
aXZyc19tYXBwaW5nICkKKyAgICB7CisgICAgICAgIFhGUkVFKGl2cnNfbWFwcGluZy0+aW50cmVt
YXBfaW51c2UpOworICAgICAgICB0YmxwID0gJml2cnNfbWFwcGluZy0+aW50cmVtYXBfdGFibGU7
CisgICAgfQorICAgIGVsc2UKKyAgICB7CisgICAgICAgIFhGUkVFKHNoYXJlZF9pbnRyZW1hcF9p
bnVzZSk7CisgICAgICAgIHRibHAgPSAmc2hhcmVkX2ludHJlbWFwX3RhYmxlOworICAgIH0KICAK
LSAgICBpZiAoIHRiICkKKyAgICBpZiAoICp0YmxwICkKICAgICAgewotICAgICAgICBfX2ZyZWVf
YW1kX2lvbW11X3RhYmxlcyh0YiwgaW50cmVtYXBfdGFibGVfb3JkZXIoaW9tbXUpKTsKLSAgICAg
ICAgaXZyc19tYXBwaW5nLT5pbnRyZW1hcF90YWJsZSA9IE5VTEw7CisgICAgICAgIF9fZnJlZV9h
bWRfaW9tbXVfdGFibGVzKCp0YmxwLCBpbnRyZW1hcF90YWJsZV9vcmRlcihpb21tdSkpOworICAg
ICAgICAqdGJscCA9IE5VTEw7CiAgICAgIH0KICAKICAgICAgcmV0dXJuIDA7CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
