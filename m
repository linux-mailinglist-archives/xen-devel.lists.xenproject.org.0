Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219383267
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:11:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzD3-0003X6-Tx; Tue, 06 Aug 2019 13:09:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huzD2-0003Wq-G0
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:09:00 +0000
X-Inumbo-ID: 5a1afd12-b84b-11e9-8433-c7ba757adeb9
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a1afd12-b84b-11e9-8433-c7ba757adeb9;
 Tue, 06 Aug 2019 13:08:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4A2D4B637;
 Tue,  6 Aug 2019 13:08:58 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Message-ID: <d42b5c29-852b-7e46-c64f-750bc03275eb@suse.com>
Date: Tue, 6 Aug 2019 15:08:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v5 04/10] AMD/IOMMU: introduce a "valid" flag
 for IVRS mappings
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

Rm9yIHVzIHRvIG5vIGxvbmdlciBibGluZGx5IGFsbG9jYXRlIGludGVycnVwdCByZW1hcHBpbmcg
dGFibGVzIGZvcgpldmVyeXRoaW5nIHRoZSBBQ1BJIHRhYmxlcyBuYW1lLCB3ZSBjYW4ndCB1c2Ug
c3RydWN0IGl2cnNfbWFwcGluZ3MnCmludHJlbWFwX3RhYmxlIGZpZWxkIGFueW1vcmUgdG8gYWxz
byBoYXZlIHRoZSBtZWFuaW5nIG9mICJ0aGlzIGVudHJ5CmlzIHZhbGlkIi4gQWRkIGEgc2VwYXJh
dGUgYm9vbGVhbiBmaWVsZCBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgotLS0KdjU6IE5ldy4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FtZC9pb21tdV9hY3BpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lv
bW11X2FjcGkuYwpAQCAtODgsNiArODgsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYWRkX2l2cnNf
bWFwcGluZ19lbnRyCiAgICAgICAgICAgfQogICAgICB9CiAgCisgICAgaXZyc19tYXBwaW5nc1th
bGlhc19pZF0udmFsaWQgPSB0cnVlOworCiAgICAgIC8qIEFzc2lnbiBJT01NVSBoYXJkd2FyZS4g
Ki8KICAgICAgaXZyc19tYXBwaW5nc1tiZGZdLmlvbW11ID0gaW9tbXU7CiAgfQotLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKQEAgLTEyNDQsNyArMTI0NCw2IEBAIHN0YXRpYyBp
bnQgX19pbml0IGFtZF9pb21tdV9zZXR1cF9kZXZpY2UKICAgICAgdTE2IHNlZywgc3RydWN0IGl2
cnNfbWFwcGluZ3MgKml2cnNfbWFwcGluZ3MpCiAgewogICAgICB1bnNpZ25lZCBpbnQgYmRmOwot
ICAgIHZvaWQgKmludHJfdGIsICpkdGU7CiAgCiAgICAgIEJVR19PTiggKGl2cnNfYmRmX2VudHJp
ZXMgPT0gMCkgKTsKICAKQEAgLTEyNjQsMTYgKzEyNjMsMTcgQEAgc3RhdGljIGludCBfX2luaXQg
YW1kX2lvbW11X3NldHVwX2RldmljZQogICAgICAvKiBBZGQgZGV2aWNlIHRhYmxlIGVudHJpZXMg
Ki8KICAgICAgZm9yICggYmRmID0gMDsgYmRmIDwgaXZyc19iZGZfZW50cmllczsgYmRmKysgKQog
ICAgICB7Ci0gICAgICAgIGludHJfdGIgPSBpdnJzX21hcHBpbmdzW2JkZl0uaW50cmVtYXBfdGFi
bGU7Ci0KLSAgICAgICAgaWYgKCBpbnRyX3RiICkKKyAgICAgICAgaWYgKCBpdnJzX21hcHBpbmdz
W2JkZl0udmFsaWQgKQogICAgICAgICAgeworICAgICAgICAgICAgdm9pZCAqZHRlOworCiAgICAg
ICAgICAgICAgLyogYWRkIGRldmljZSB0YWJsZSBlbnRyeSAqLwogICAgICAgICAgICAgIGR0ZSA9
IGRldmljZV90YWJsZS5idWZmZXIgKyAoYmRmICogSU9NTVVfREVWX1RBQkxFX0VOVFJZX1NJWkUp
OwogICAgICAgICAgICAgIGlvbW11X2R0ZV9hZGRfZGV2aWNlX2VudHJ5KGR0ZSwgJml2cnNfbWFw
cGluZ3NbYmRmXSk7CiAgCiAgICAgICAgICAgICAgYW1kX2lvbW11X3NldF9pbnRyZW1hcF90YWJs
ZSgKLSAgICAgICAgICAgICAgICBkdGUsICh1NjQpdmlydF90b19tYWRkcihpbnRyX3RiKSwgaW9t
bXVfaW50cmVtYXApOworICAgICAgICAgICAgICAgIGR0ZSwgdmlydF90b19tYWRkcihpdnJzX21h
cHBpbmdzW2JkZl0uaW50cmVtYXBfdGFibGUpLAorICAgICAgICAgICAgICAgIGlvbW11X2ludHJl
bWFwKTsKICAgICAgICAgIH0KICAgICAgfQogIAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvcGNpX2FtZF9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9w
Y2lfYW1kX2lvbW11LmMKQEAgLTY5LDggKzY5LDggQEAgc3RydWN0IGFtZF9pb21tdSAqZmluZF9p
b21tdV9mb3JfZGV2aWNlKAogICAqIHRhYmxlIGFuZCBJL08gcGFnZSB0YWJsZSByZXNwZWN0aXZl
bHkuIFN1Y2ggZGV2aWNlcyB3aWxsIGhhdmUKICAgKiBib3RoIGFsaWFzIGVudHJ5IGFuZCBzZWxl
Y3QgZW50cnkgaW4gSVZSUyBzdHJ1Y3R1cmUuCiAgICoKLSAqIFJldHVybiBvcmlnaW5hbCBkZXZp
Y2UgaWQsIGlmIGRldmljZSBoYXMgdmFsaWQgaW50ZXJydXB0IHJlbWFwcGluZwotICogdGFibGUg
c2V0dXAgZm9yIGJvdGggc2VsZWN0IGVudHJ5IGFuZCBhbGlhcyBlbnRyeS4KKyAqIFJldHVybiBv
cmlnaW5hbCBkZXZpY2UgaWQgaWYgYm90aCB0aGUgc3BlY2lmaWMgZW50cnkgYW5kIHRoZSBhbGlh
cyBlbnRyeQorICogaGF2ZSBiZWVuIG1hcmtlZCB2YWxpZC4KICAgKi8KICBpbnQgZ2V0X2RtYV9y
ZXF1ZXN0b3JfaWQodWludDE2X3Qgc2VnLCB1aW50MTZfdCBiZGYpCiAgewpAQCAtNzksOCArNzks
NyBAQCBpbnQgZ2V0X2RtYV9yZXF1ZXN0b3JfaWQodWludDE2X3Qgc2VnLCB1CiAgCiAgICAgIEJV
R19PTiAoIGJkZiA+PSBpdnJzX2JkZl9lbnRyaWVzICk7CiAgICAgIHJlcV9pZCA9IGl2cnNfbWFw
cGluZ3NbYmRmXS5kdGVfcmVxdWVzdG9yX2lkOwotICAgIGlmICggKGl2cnNfbWFwcGluZ3NbYmRm
XS5pbnRyZW1hcF90YWJsZSAhPSBOVUxMKSAmJgotICAgICAgICAgKGl2cnNfbWFwcGluZ3NbcmVx
X2lkXS5pbnRyZW1hcF90YWJsZSAhPSBOVUxMKSApCisgICAgaWYgKCBpdnJzX21hcHBpbmdzW2Jk
Zl0udmFsaWQgJiYgaXZyc19tYXBwaW5nc1tyZXFfaWRdLnZhbGlkICkKICAgICAgICAgIHJlcV9p
ZCA9IGJkZjsKICAKICAgICAgcmV0dXJuIHJlcV9pZDsKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9hbWQtaW9tbXUuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2FtZC1pb21tdS5oCkBAIC0x
MTEsNiArMTExLDcgQEAgc3RydWN0IGl2cnNfbWFwcGluZ3MgewogICAgICB1OCB1bml0eV9tYXBf
ZW5hYmxlOwogICAgICB1OCB3cml0ZV9wZXJtaXNzaW9uOwogICAgICB1OCByZWFkX3Blcm1pc3Np
b247CisgICAgYm9vbCB2YWxpZDsKICAgICAgdW5zaWduZWQgbG9uZyBhZGRyX3JhbmdlX3N0YXJ0
OwogICAgICB1bnNpZ25lZCBsb25nIGFkZHJfcmFuZ2VfbGVuZ3RoOwogICAgICBzdHJ1Y3QgYW1k
X2lvbW11ICppb21tdTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
