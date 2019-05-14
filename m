Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A081C8D4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWak-0005Ks-4u; Tue, 14 May 2019 12:31:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWai-0005Km-M1
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:31:32 +0000
X-Inumbo-ID: 3406c379-7644-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3406c379-7644-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:31:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4457A341;
 Tue, 14 May 2019 05:31:31 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32CB13F71E;
 Tue, 14 May 2019 05:31:30 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:31:13 +0100
Message-Id: <20190514123125.29086-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH MM-PART3 v2 00/12] xen/arm: Provide a generic
 function to update Xen PT
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyB0aGUgdGhpcmQgcGFydCBvZiB0aGUgYm9vdC9tZW1vcnkgcmV3b3Jr
IGZvciBYZW4gb24gQXJtLiBBdCB0aGUKbW9tZW50LCB0aGUgdXBkYXRlIHRvIFhlbiBQVCBpcyBz
Y2F0dGVyZWQgYWxsIGFyb3VuZCBtbS5jLiBUaGlzIG1ha2VzCmRpZmZpY3VsdCB0byByZXdvcmsg
WGVuIG1lbW9yeSBsYXlvdXQgb3IgZXZlbiBlbnN1cmluZyB3ZSBhcmUgZm9sbG93aW5nIHRoZQpB
cm0gQXJtIHByb3Blcmx5IChhbmQgd2UgYXJlIG5vdCBzbyBmYXIhKS4KClRoaXMgcGFydCBjb250
YWlucyBjb2RlIHRvIHByb3ZpZGUgYSBnZW5lcmljIGZ1bmN0aW9uIHRvIHVwZGF0ZSBYZW4gUFQu
CldoaWxlIEkgY291bGQgaGF2ZSBzdGFydGVkIGZyb20gc2NyYXRjaCwgSSBkZWNpZGVkIHRvIGJh
c2UgdGhlIG5ldyBmdW5jdGlvbgpvbiBjcmVhdGVfeGVuX2VudHJpZXMoKSAobm93IHJlbmFtZWQg
eGVuX3B0X3VwZGF0ZSgpKS4gVGhpcyBtYWtlcyBzbGlnaHRseQplYXNpZXIgdG8gZm9sbG93IHRo
ZSBjaGFuZ2VzLgoKSW4gdGhpcyBzZXJpZXMsIHRoZSBuZXcgZ2VuZXJpYyBmdW5jdGlvbiB3aWxs
IG9ubHkgc3VwcG9ydCAzcmQtbGV2ZWwgdXBkYXRlCmFuZCBjYW5ub3QgYmUgdXNlZCBpbiBlYXJs
eSBib290IChpLmUgYmVjYXVzZSB4ZW5oZWFwIGlzIG5vdCBpbml0aWFsaXplZCkuClRoaXMgd2ls
bCBiZSBleHRlbmRlZCBpbiBmb2xsb3ctdXAgc2VyaWVzIHRvIGFsbG93IG1vcmUgdXNlIHdpdGhp
biBtbS5jLgoKVGhlcmUgYXJlIHByb2JhYmx5IHNvbWUgb3B0aW1pemF0aW9uIHBvc3NpYmxlIGFy
b3VuZCB0aGUgVExCcyBmbHVzaC4gSSBoYXZlbid0Cmxvb2tlZCBhdCBpdCBzbyBmYXIuCgpUaGUg
bGFzdCB0d28gcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyBpcyB0byBzaG93IGhvdyBleGlzdGluZyBj
YWxsZXJzIGNhbiBiZQpjb252ZXJ0ZWQuIFRoZXJlIGFyZSBtb3JlIGNvbnZlcnNpb24gdG8gY29t
ZSBpbiBmb2xsb3ctdXAgc2VyaWVzLgoKVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIGZpcnN0
IHR3byBwYXJ0cyBzZW50IHNlcGFyYXRlbHkgKHNlZSBbMV0gYW5kIFsyXSkuCgpGb3IgY29udmVu
aWVuY2UsIEkgcHJvdmlkZWQgYSBicmFuY2ggd2l0aCBhbGwgdGhlIHBhdGNoZXMgYXBwbGllZCBi
YXNlZCBvbgpzdGFnaW5nOgoKICAgIGdpdDovL3hlbmJpdHMueGVuLm9yZy9wZW9wbGUvanVsaWVu
Zy94ZW4tdW5zdGFibGUuZ2l0IGJyYW5jaCBtbS9wYXJ0My92MgoKQ2hlZXJzLAoKWzFdIGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNS9t
c2cwMTEwOS5odG1sClsyXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDExNDkuaHRtbAoKSnVsaWVuIEdyYWxsICgxMik6CiAg
eGVuL2FybTogbHBhZTogQWRkIGEgbWFjcm8gdG8gZ2VuZXJhdGUgb2Zmc2V0cyBmcm9tIGFuIGFk
ZHJlc3MKICB4ZW4vYXJtOiBtbTogUmVuYW1lIGNyZWF0ZV94ZW5fZW50cmllcygpIHRvIHhlbl9w
dF91cGRhdGUoKQogIHhlbi9hcm06IG1tOiBNb3ZlIG91dCBvZiB4ZW5fcHRfdXBkYXRlKCkgdGhl
IGxvZ2ljIHRvIHVwZGF0ZSBhbiBlbnRyeQogIHhlbi9hcm06IG1tOiBPbmx5IGluY3JlbWVudCBt
Zm4gd2hlbiB2YWxpZCBpbiB4ZW5fcHRfdXBkYXRlCiAgeGVuL2FybTogbW06IEludHJvZHVjZSBf
UEFHRV9QUkVTRU5UIGFuZCBfUEFHRV9QT1BVTEFURQogIHhlbi9hcm06IG1tOiBTYW5pdHkgY2hl
Y2sgYW55IHVwZGF0ZSBvZiBYZW4gcGFnZSB0YWJsZXMKICB4ZW4vYXJtOiBtbTogUmV3b3JrIHhl
bl9wdF91cGRhdGVfZW50cnkgdG8gYXZvaWQgdXNlIHhlbm1hcF9vcGVyYXRpb24KICB4ZW4vYXJt
OiBtbTogUmVtb3ZlIGVudW0geGVubWFwX29wZXJhdGlvbgogIHhlbi9hcm06IG1tOiBVc2Ugeywg
dW59bWFwX2RvbWFpbl9wYWdlKCkgdG8gbWFwL3VubWFwIFhlbiBwYWdlLXRhYmxlcwogIHhlbi9h
cm06IG1tOiBSZXdvcmsgWGVuIHBhZ2UtdGFibGVzIHdhbGsgZHVyaW5nIHVwZGF0ZQogIHhlbi9h
cm06IG1tOiBEb24ndCBvcGVuLWNvZGUgWGVuIFBUIHVwZGF0ZSBpbiB7c2V0LCBjbGVhcn1fZml4
bWFwKCkKICB4ZW4vYXJtOiBtbTogUmVtb3ZlIHNldF9wdGVfZmxhZ3Nfb25fcmFuZ2UoKQoKIHhl
bi9hcmNoL2FybS9tbS5jICAgICAgICAgIHwgNDIxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL3AybS5jICAgICAgICAgfCAgMjMgKy0t
CiB4ZW4vaW5jbHVkZS9hc20tYXJtL2xwYWUuaCB8ICAgOSArCiB4ZW4vaW5jbHVkZS9hc20tYXJt
L3BhZ2UuaCB8ICAgOSArLQogNCBmaWxlcyBjaGFuZ2VkLCAzMDUgaW5zZXJ0aW9ucygrKSwgMTU3
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
