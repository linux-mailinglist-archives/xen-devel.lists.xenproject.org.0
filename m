Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CCFB4F17
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 15:25:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iADQD-0000bJ-E0; Tue, 17 Sep 2019 13:21:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iADQB-0000b5-VW
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 13:21:32 +0000
X-Inumbo-ID: 0fc00e6e-d94e-11e9-960c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0fc00e6e-d94e-11e9-960c-12813bfff9fa;
 Tue, 17 Sep 2019 13:21:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6513228;
 Tue, 17 Sep 2019 06:21:30 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B24233F575;
 Tue, 17 Sep 2019 06:21:29 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 17 Sep 2019 14:21:25 +0100
Message-Id: <20190917132125.13033-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm32: setup: Give a xenheap page to the
 boot allocator
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgY29tbWl0IDZlM2U3NzEyMDMgInhlbi9hcm06IHNldHVwOiBSZWxvY2F0ZSB0aGUgRGV2
aWNlLVRyZWUgbGF0ZXIgb24KaW4gdGhlIGJvb3QiLCB0aGUgYm9vdCBhbGxvY2F0b3Igd2lsbCBu
b3QgcmVjZWl2ZSBhbnkgeGVuaGVhcCBwYWdlIChpLmUuCm1hcHBlZCBwYWdlKSBvbiBBcm0zMi4K
Ckhvd2V2ZXIsIHRoZSBib290IGFsbG9jYXRvciBpbXBsaWNpdGVseSByZWx5IG9uIGhhdmluZyB0
aGUgZmlyc3QgcGFnZQphbHJlYWR5IG1hcHBlZCBhbmQgdGhlcmVmb3JlIHJlc3VsdCB0byBicmVh
ayBib290IG9uIEFybTMyLgoKVGhlIGVhc2llc3Qgd2F5IGZvciBub3cgaXMgdG8gZ2l2ZSBhIHhl
bmhlYXAgcGFnZSB0byB0aGUgYm9vdCBhbGxvY2F0b3IuCldlIG1heSB3YW50IHRvIHJldGhpbmsg
dGhlIGludGVyZmFjZSBpbiB0aGUgZnV0dXJlLgoKRml4ZXM6IDZlM2U3NzEyMDMgKCd4ZW4vYXJt
OiBzZXR1cDogUmVsb2NhdGUgdGhlIERldmljZS1UcmVlIGxhdGVyIG9uIGluIHRoZSBib290JykK
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiB4
ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAu
YyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCmluZGV4IGViYmZhZDk0ZTQuLmU2ZGRlZmI1Y2YgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5j
CkBAIC01OTMsNiArNTkzLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21tKHZvaWQpCiAg
ICAgdW5zaWduZWQgbG9uZyBoZWFwX3BhZ2VzLCB4ZW5oZWFwX3BhZ2VzLCBkb21oZWFwX3BhZ2Vz
OwogICAgIGludCBpOwogICAgIGNvbnN0IHVpbnQzMl90IGN0ciA9IFJFQURfQ1AzMihDVFIpOwor
ICAgIG1mbl90IGJvb3RfbWZuX3N0YXJ0LCBib290X21mbl9lbmQ7CiAKICAgICBpZiAoICFib290
aW5mby5tZW0ubnJfYmFua3MgKQogICAgICAgICBwYW5pYygiTm8gbWVtb3J5IGJhbmtcbiIpOwpA
QCAtNjY1LDYgKzY2NiwxMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKIAog
ICAgIHNldHVwX3hlbmhlYXBfbWFwcGluZ3MoKGUgPj4gUEFHRV9TSElGVCkgLSB4ZW5oZWFwX3Bh
Z2VzLCB4ZW5oZWFwX3BhZ2VzKTsKIAorICAgIC8qIFdlIG5lZWQgYSBzaW5nbGUgbWFwcGVkIHBh
Z2UgZm9yIHBvcHVsYXRpbmcgYm9vdG1lbV9yZWdpb25fbGlzdC4gKi8KKyAgICBib290X21mbl9z
dGFydCA9IG1mbl9hZGQoeGVuaGVhcF9tZm5fZW5kLCAtMSk7CisgICAgYm9vdF9tZm5fZW5kID0g
eGVuaGVhcF9tZm5fZW5kOworICAgIGluaXRfYm9vdF9wYWdlcyhtZm5fdG9fbWFkZHIoYm9vdF9t
Zm5fc3RhcnQpLCBtZm5fdG9fbWFkZHIoYm9vdF9tZm5fZW5kKSk7CisKICAgICAvKiBBZGQgbm9u
LXhlbmhlYXAgbWVtb3J5ICovCiAgICAgZm9yICggaSA9IDA7IGkgPCBib290aW5mby5tZW0ubnJf
YmFua3M7IGkrKyApCiAgICAgewpAQCAtNzEwLDcgKzcxNiw3IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBzZXR1cF9tbSh2b2lkKQogCiAgICAgLyogQWRkIHhlbmhlYXAgbWVtb3J5IHRoYXQgd2FzIG5v
dCBhbHJlYWR5IGFkZGVkIHRvIHRoZSBib290IGFsbG9jYXRvci4gKi8KICAgICBpbml0X3hlbmhl
YXBfcGFnZXMobWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX3N0YXJ0KSwKLSAgICAgICAgICAgICAg
ICAgICAgICAgbWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX2VuZCkpOworICAgICAgICAgICAgICAg
ICAgICAgICBtZm5fdG9fbWFkZHIoYm9vdF9tZm5fZW5kKSk7CiB9CiAjZWxzZSAvKiBDT05GSUdf
QVJNXzY0ICovCiBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
