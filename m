Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC2BB8DD6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 11:34:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBFGT-0002Cq-NB; Fri, 20 Sep 2019 09:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WsuA=XP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iBFGR-0002Cg-O1
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 09:31:43 +0000
X-Inumbo-ID: 730ac83d-db89-11e9-9686-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 730ac83d-db89-11e9-9686-12813bfff9fa;
 Fri, 20 Sep 2019 09:31:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC43E337;
 Fri, 20 Sep 2019 02:31:39 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDF553F575;
 Fri, 20 Sep 2019 02:31:38 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 20 Sep 2019 10:31:30 +0100
Message-Id: <20190920093130.11842-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13 v2] xen/arm32: setup: Give a xenheap
 page to the boot allocator
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
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
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KUmV2aWV3
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MjoKICAgICAgICAtIEFkZCBKYW4ncyByZXZpZXdlZC1ieQogICAgICAgIC0gVXNlIGJvb3Rf
bWZuX3N0YXJ0IHJhdGhlciB0aGFuIGJvb3RfbWZuX2VuZCB3aGVuIGdpdmluZwogICAgICAgIHhl
bmhlYXAgcGFnZXMuCi0tLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgfCA4ICsrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCA1ODFiMjYy
NjU1Li5mY2E3ZTY4Y2JhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94
ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtNTkzLDYgKzU5Myw3IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBzZXR1cF9tbSh2b2lkKQogICAgIHVuc2lnbmVkIGxvbmcgaGVhcF9wYWdlcywgeGVuaGVhcF9w
YWdlcywgZG9taGVhcF9wYWdlczsKICAgICBpbnQgaTsKICAgICBjb25zdCB1aW50MzJfdCBjdHIg
PSBSRUFEX0NQMzIoQ1RSKTsKKyAgICBtZm5fdCBib290X21mbl9zdGFydCwgYm9vdF9tZm5fZW5k
OwogCiAgICAgaWYgKCAhYm9vdGluZm8ubWVtLm5yX2JhbmtzICkKICAgICAgICAgcGFuaWMoIk5v
IG1lbW9yeSBiYW5rXG4iKTsKQEAgLTY2NSw2ICs2NjYsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0
IHNldHVwX21tKHZvaWQpCiAKICAgICBzZXR1cF94ZW5oZWFwX21hcHBpbmdzKChlID4+IFBBR0Vf
U0hJRlQpIC0geGVuaGVhcF9wYWdlcywgeGVuaGVhcF9wYWdlcyk7CiAKKyAgICAvKiBXZSBuZWVk
IGEgc2luZ2xlIG1hcHBlZCBwYWdlIGZvciBwb3B1bGF0aW5nIGJvb3RtZW1fcmVnaW9uX2xpc3Qu
ICovCisgICAgYm9vdF9tZm5fc3RhcnQgPSBtZm5fYWRkKHhlbmhlYXBfbWZuX2VuZCwgLTEpOwor
ICAgIGJvb3RfbWZuX2VuZCA9IHhlbmhlYXBfbWZuX2VuZDsKKyAgICBpbml0X2Jvb3RfcGFnZXMo
bWZuX3RvX21hZGRyKGJvb3RfbWZuX3N0YXJ0KSwgbWZuX3RvX21hZGRyKGJvb3RfbWZuX2VuZCkp
OworCiAgICAgLyogQWRkIG5vbi14ZW5oZWFwIG1lbW9yeSAqLwogICAgIGZvciAoIGkgPSAwOyBp
IDwgYm9vdGluZm8ubWVtLm5yX2JhbmtzOyBpKysgKQogICAgIHsKQEAgLTcxMCw3ICs3MTYsNyBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkKIAogICAgIC8qIEFkZCB4ZW5oZWFw
IG1lbW9yeSB0aGF0IHdhcyBub3QgYWxyZWFkeSBhZGRlZCB0byB0aGUgYm9vdCBhbGxvY2F0b3Iu
ICovCiAgICAgaW5pdF94ZW5oZWFwX3BhZ2VzKG1mbl90b19tYWRkcih4ZW5oZWFwX21mbl9zdGFy
dCksCi0gICAgICAgICAgICAgICAgICAgICAgIG1mbl90b19tYWRkcih4ZW5oZWFwX21mbl9lbmQp
KTsKKyAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX21hZGRyKGJvb3RfbWZuX3N0YXJ0KSk7
CiB9CiAjZWxzZSAvKiBDT05GSUdfQVJNXzY0ICovCiBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBf
bW0odm9pZCkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
