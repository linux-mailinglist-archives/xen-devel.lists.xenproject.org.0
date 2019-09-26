Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF9BF519
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:32:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUlm-0008QX-KX; Thu, 26 Sep 2019 14:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDUll-0008QN-Bh
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:29:21 +0000
X-Inumbo-ID: 06e219c2-e06a-11e9-9657-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 06e219c2-e06a-11e9-9657-12813bfff9fa;
 Thu, 26 Sep 2019 14:29:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F5F7B087;
 Thu, 26 Sep 2019 14:29:19 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
Message-ID: <b143bc0c-3d13-2127-be5d-b459d7b53c1e@suse.com>
Date: Thu, 26 Sep 2019 16:29:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ba0fd598-9102-e765-e7f5-61e91d47b124@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v7 2/3] AMD/IOMMU: allow callers to request
 allocate_buffer() to skip its memset()
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbW1hbmQgcmluZyBidWZmZXIgZG9lc24ndCBuZWVkIGNsZWFyaW5nIHVwIGZyb250IGlu
IGFueSBldmVudC4KU3Vic2VxdWVudGx5IHdlJ2xsIGFsc28gd2FudCB0byBhdm9pZCBjbGVhcmlu
ZyB0aGUgZGV2aWNlIHRhYmxlcy4KCldoaWxlIHBsYXlpbmcgd2l0aCBmdW5jdGlvbnMgc2lnbmF0
dXJlcyByZXBsYWNlIHVuZHVlIHVzZSBvZiBmaXhlZCB3aWR0aAp0eXBlcyBhdCB0aGUgc2FtZSB0
aW1lLCBhbmQgZXh0ZW5kIHRoaXMgdG8gZGVhbGxvY2F0ZV9idWZmZXIoKSBhcyB3ZWxsLgoKU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0Kdjc6IE5ldy4K
Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwpAQCAtOTk0LDEyICs5OTQsMTIg
QEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXQgZHRfYWxsb2Nfc2l6ZQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfREVWX1RBQkxFX0VOVFJZX1NJ
WkUpOwogfQogCi1zdGF0aWMgdm9pZCBfX2luaXQgZGVhbGxvY2F0ZV9idWZmZXIodm9pZCAqYnVm
LCB1aW50MzJfdCBzeikKK3N0YXRpYyB2b2lkIF9faW5pdCBkZWFsbG9jYXRlX2J1ZmZlcih2b2lk
ICpidWYsIHVuc2lnbmVkIGxvbmcgc3opCiB7Ci0gICAgaW50IG9yZGVyID0gMDsKICAgICBpZiAo
IGJ1ZiApCiAgICAgewotICAgICAgICBvcmRlciA9IGdldF9vcmRlcl9mcm9tX2J5dGVzKHN6KTsK
KyAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyID0gZ2V0X29yZGVyX2Zyb21fYnl0ZXMoc3opOwor
CiAgICAgICAgIF9fZnJlZV9hbWRfaW9tbXVfdGFibGVzKGJ1Ziwgb3JkZXIpOwogICAgIH0KIH0K
QEAgLTEwMTIsMTAgKzEwMTIsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGRlYWxsb2NhdGVfcmlu
Z19idWZmZQogICAgIHJpbmdfYnVmLT50YWlsID0gMDsKIH0KIAotc3RhdGljIHZvaWQgKiBfX2lu
aXQgYWxsb2NhdGVfYnVmZmVyKHVpbnQzMl90IGFsbG9jX3NpemUsIGNvbnN0IGNoYXIgKm5hbWUp
CitzdGF0aWMgdm9pZCAqX19pbml0IGFsbG9jYXRlX2J1ZmZlcih1bnNpZ25lZCBsb25nIGFsbG9j
X3NpemUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpu
YW1lLCBib29sIGNsZWFyKQogewotICAgIHZvaWQgKiBidWZmZXI7Ci0gICAgaW50IG9yZGVyID0g
Z2V0X29yZGVyX2Zyb21fYnl0ZXMoYWxsb2Nfc2l6ZSk7CisgICAgdm9pZCAqYnVmZmVyOworICAg
IHVuc2lnbmVkIGludCBvcmRlciA9IGdldF9vcmRlcl9mcm9tX2J5dGVzKGFsbG9jX3NpemUpOwog
CiAgICAgYnVmZmVyID0gX19hbGxvY19hbWRfaW9tbXVfdGFibGVzKG9yZGVyKTsKIApAQCAtMTAy
NSwxMyArMTAyNiwxNiBAQCBzdGF0aWMgdm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9idWZmZXIodWlu
CiAgICAgICAgIHJldHVybiBOVUxMOwogICAgIH0KIAotICAgIG1lbXNldChidWZmZXIsIDAsIFBB
R0VfU0laRSAqICgxVUwgPDwgb3JkZXIpKTsKKyAgICBpZiAoIGNsZWFyICkKKyAgICAgICAgbWVt
c2V0KGJ1ZmZlciwgMCwgUEFHRV9TSVpFIDw8IG9yZGVyKTsKKwogICAgIHJldHVybiBidWZmZXI7
CiB9CiAKLXN0YXRpYyB2b2lkICogX19pbml0IGFsbG9jYXRlX3JpbmdfYnVmZmVyKHN0cnVjdCBy
aW5nX2J1ZmZlciAqcmluZ19idWYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1aW50MzJfdCBlbnRyeV9zaXplLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDY0X3QgZW50cmllcywgY29uc3QgY2hhciAqbmFtZSkKK3N0YXRp
YyB2b2lkICpfX2luaXQgYWxsb2NhdGVfcmluZ19idWZmZXIoc3RydWN0IHJpbmdfYnVmZmVyICpy
aW5nX2J1ZiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGVudHJ5X3NpemUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZW50cmllcywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSwgYm9vbCBjbGVhcikKIHsKICAgICByaW5nX2J1
Zi0+aGVhZCA9IDA7CiAgICAgcmluZ19idWYtPnRhaWwgPSAwOwpAQCAtMTA0MSw3ICsxMDQ1LDgg
QEAgc3RhdGljIHZvaWQgKiBfX2luaXQgYWxsb2NhdGVfcmluZ19idWZmZQogICAgIHJpbmdfYnVm
LT5hbGxvY19zaXplID0gUEFHRV9TSVpFIDw8IGdldF9vcmRlcl9mcm9tX2J5dGVzKGVudHJpZXMg
KgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVudHJ5X3NpemUpOwogICAgIHJpbmdfYnVmLT5lbnRyaWVzID0gcmluZ19idWYtPmFs
bG9jX3NpemUgLyBlbnRyeV9zaXplOwotICAgIHJpbmdfYnVmLT5idWZmZXIgPSBhbGxvY2F0ZV9i
dWZmZXIocmluZ19idWYtPmFsbG9jX3NpemUsIG5hbWUpOworICAgIHJpbmdfYnVmLT5idWZmZXIg
PSBhbGxvY2F0ZV9idWZmZXIocmluZ19idWYtPmFsbG9jX3NpemUsIG5hbWUsIGNsZWFyKTsKKwog
ICAgIHJldHVybiByaW5nX2J1Zi0+YnVmZmVyOwogfQogCkBAIC0xMDUwLDIxICsxMDU1LDIzIEBA
IHN0YXRpYyB2b2lkICogX19pbml0IGFsbG9jYXRlX2NtZF9idWZmZXIKICAgICAvKiBhbGxvY2F0
ZSAnY29tbWFuZCBidWZmZXInIGluIHBvd2VyIG9mIDIgaW5jcmVtZW50cyBvZiA0SyAqLwogICAg
IHJldHVybiBhbGxvY2F0ZV9yaW5nX2J1ZmZlcigmaW9tbXUtPmNtZF9idWZmZXIsIHNpemVvZihj
bWRfZW50cnlfdCksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0NNRF9C
VUZGRVJfREVGQVVMVF9FTlRSSUVTLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
Q29tbWFuZCBCdWZmZXIiKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkNvbW1h
bmQgQnVmZmVyIiwgZmFsc2UpOwogfQogCiBzdGF0aWMgdm9pZCAqIF9faW5pdCBhbGxvY2F0ZV9l
dmVudF9sb2coc3RydWN0IGFtZF9pb21tdSAqaW9tbXUpCiB7CiAgICAgLyogYWxsb2NhdGUgJ2V2
ZW50IGxvZycgaW4gcG93ZXIgb2YgMiBpbmNyZW1lbnRzIG9mIDRLICovCiAgICAgcmV0dXJuIGFs
bG9jYXRlX3JpbmdfYnVmZmVyKCZpb21tdS0+ZXZlbnRfbG9nLCBzaXplb2YoZXZlbnRfZW50cnlf
dCksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0VWRU5UX0xPR19ERUZB
VUxUX0VOVFJJRVMsICJFdmVudCBMb2ciKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSU9NTVVfRVZFTlRfTE9HX0RFRkFVTFRfRU5UUklFUywgIkV2ZW50IExvZyIsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUpOwogfQogCiBzdGF0aWMgdm9pZCAqIF9faW5p
dCBhbGxvY2F0ZV9wcHJfbG9nKHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11KQogewogICAgIC8qIGFs
bG9jYXRlICdwcHIgbG9nJyBpbiBwb3dlciBvZiAyIGluY3JlbWVudHMgb2YgNEsgKi8KICAgICBy
ZXR1cm4gYWxsb2NhdGVfcmluZ19idWZmZXIoJmlvbW11LT5wcHJfbG9nLCBzaXplb2YocHByX2Vu
dHJ5X3QpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9QUFJfTE9HX0RF
RkFVTFRfRU5UUklFUywgIlBQUiBMb2ciKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSU9NTVVfUFBSX0xPR19ERUZBVUxUX0VOVFJJRVMsICJQUFIgTG9nIiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdHJ1ZSk7CiB9CiAKIC8qCkBAIC0xMjU3LDcgKzEyNjQsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBhbWRfaW9tbXVfc2V0dXBfZGV2aWNlCiAgICAgewogICAgICAg
ICAvKiBhbGxvY2F0ZSAnZGV2aWNlIHRhYmxlJyBvbiBhIDRLIGJvdW5kYXJ5ICovCiAgICAgICAg
IGR0ID0gSVZSU19NQVBQSU5HU19ERVZUQUIoaXZyc19tYXBwaW5ncykgPQotICAgICAgICAgICAg
YWxsb2NhdGVfYnVmZmVyKGR0X2FsbG9jX3NpemUoKSwgIkRldmljZSBUYWJsZSIpOworICAgICAg
ICAgICAgYWxsb2NhdGVfYnVmZmVyKGR0X2FsbG9jX3NpemUoKSwgIkRldmljZSBUYWJsZSIsIHRy
dWUpOwogICAgIH0KICAgICBpZiAoICFkdCApCiAgICAgICAgIHJldHVybiAtRU5PTUVNOwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
