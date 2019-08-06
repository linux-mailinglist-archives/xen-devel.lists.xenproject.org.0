Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFA083266
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:11:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzDR-0003c3-7D; Tue, 06 Aug 2019 13:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huzDQ-0003bf-6x
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:09:24 +0000
X-Inumbo-ID: 67bf5ab2-b84b-11e9-a701-8fff05ca96a2
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67bf5ab2-b84b-11e9-a701-8fff05ca96a2;
 Tue, 06 Aug 2019 13:09:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E054B638;
 Tue,  6 Aug 2019 13:09:21 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Message-ID: <f4a915dc-5f8b-86b7-732a-b4db9139c7a2@suse.com>
Date: Tue, 6 Aug 2019 15:09:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v5 05/10] AMD/IOMMU: let callers of
 amd_iommu_alloc_intremap_table() handle errors
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

QWRkaXRpb25hbCB1c2VycyBvZiB0aGUgZnVuY3Rpb24gd2lsbCB3YW50IHRvIGhhbmRsZSBlcnJv
cnMgbW9yZQpncmFjZWZ1bGx5LiBSZW1vdmUgdGhlIEJVR19PTigpcyBhbmQgbWFrZSB0aGUgY3Vy
cmVudCBjYWxsZXIgcGFuaWMoKQppbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjU6IE5ldy4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FtZC9pb21tdV9hY3BpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11X2FjcGkuYwpAQCAtODYsNiArODYsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IGFkZF9p
dnJzX21hcHBpbmdfZW50cgogICAgICAgICAgICAgICBpdnJzX21hcHBpbmdzW2FsaWFzX2lkXS5p
bnRyZW1hcF90YWJsZSA9IHNoYXJlZF9pbnRyZW1hcF90YWJsZTsKICAgICAgICAgICAgICAgaXZy
c19tYXBwaW5nc1thbGlhc19pZF0uaW50cmVtYXBfaW51c2UgPSBzaGFyZWRfaW50cmVtYXBfaW51
c2U7CiAgICAgICAgICAgfQorCisgICAgICAgICBpZiAoICFpdnJzX21hcHBpbmdzW2FsaWFzX2lk
XS5pbnRyZW1hcF90YWJsZSApCisgICAgICAgICAgICAgcGFuaWMoIk5vIG1lbW9yeSBmb3IgJTA0
eDolMDJ4OiUwMnguJXUncyBJUlRcbiIsIGlvbW11LT5zZWcsCisgICAgICAgICAgICAgICAgICAg
UENJX0JVUyhhbGlhc19pZCksIFBDSV9TTE9UKGFsaWFzX2lkKSwgUENJX0ZVTkMoYWxpYXNfaWQp
KTsKICAgICAgfQogIAogICAgICBpdnJzX21hcHBpbmdzW2FsaWFzX2lkXS52YWxpZCA9IHRydWU7
Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMKKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwpAQCAtODE3LDEyICs4MTcsMjIg
QEAgaW50IF9faW5pdCBhbWRfaW9tbXVfZnJlZV9pbnRyZW1hcF90YWJsZQogIHZvaWQgKl9faW5p
dCBhbWRfaW9tbXVfYWxsb2NfaW50cmVtYXBfdGFibGUoCiAgICAgIGNvbnN0IHN0cnVjdCBhbWRf
aW9tbXUgKmlvbW11LCB1bnNpZ25lZCBsb25nICoqaW51c2VfbWFwKQogIHsKLSAgICB2b2lkICp0
YiA9IF9fYWxsb2NfYW1kX2lvbW11X3RhYmxlcyhpbnRyZW1hcF90YWJsZV9vcmRlcihpb21tdSkp
OworICAgIHVuc2lnbmVkIGludCBvcmRlciA9IGludHJlbWFwX3RhYmxlX29yZGVyKGlvbW11KTsK
KyAgICB2b2lkICp0YiA9IF9fYWxsb2NfYW1kX2lvbW11X3RhYmxlcyhvcmRlcik7CisKKyAgICBp
ZiAoIHRiICkKKyAgICB7CisgICAgICAgICppbnVzZV9tYXAgPSB4emFsbG9jX2FycmF5KHVuc2ln
bmVkIGxvbmcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVFNfVE9fTE9O
R1MoSU5UUkVNQVBfRU5UUklFUykpOworICAgICAgICBpZiAoICppbnVzZV9tYXAgKQorICAgICAg
ICAgICAgbWVtc2V0KHRiLCAwLCBQQUdFX1NJWkUgPDwgb3JkZXIpOworICAgICAgICBlbHNlCisg
ICAgICAgIHsKKyAgICAgICAgICAgIF9fZnJlZV9hbWRfaW9tbXVfdGFibGVzKHRiLCBvcmRlcik7
CisgICAgICAgICAgICB0YiA9IE5VTEw7CisgICAgICAgIH0KKyAgICB9CiAgCi0gICAgQlVHX09O
KHRiID09IE5VTEwpOwotICAgIG1lbXNldCh0YiwgMCwgUEFHRV9TSVpFIDw8IGludHJlbWFwX3Rh
YmxlX29yZGVyKGlvbW11KSk7Ci0gICAgKmludXNlX21hcCA9IHh6YWxsb2NfYXJyYXkodW5zaWdu
ZWQgbG9uZywgQklUU19UT19MT05HUyhJTlRSRU1BUF9FTlRSSUVTKSk7Ci0gICAgQlVHX09OKCpp
bnVzZV9tYXAgPT0gTlVMTCk7CiAgICAgIHJldHVybiB0YjsKICB9CiAgCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
