Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B41C856
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWHb-0006GQ-0K; Tue, 14 May 2019 12:11:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWHZ-0006FL-GP
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:11:45 +0000
X-Inumbo-ID: 7023b6cd-7641-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7023b6cd-7641-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:11:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 996F5341;
 Tue, 14 May 2019 05:11:43 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F89E3F71E;
 Tue, 14 May 2019 05:11:42 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:11:27 +0100
Message-Id: <20190514121132.26732-4-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514121132.26732-1-julien.grall@arm.com>
References: <20190514121132.26732-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART1 v3 3/8] xen/arm: Remove
 flush_xen_text_tlb_local()
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZ1bmN0aW9uIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgpIGhhcyBiZWVuIG1pc3VzZWQg
YW5kIHdpbGwgcmVzdWx0CnRvIGludmFsaWRhdGUgdGhlIGluc3RydWN0aW9uIGNhY2hlIG1vcmUg
dGhhbiBuZWNlc3NhcnkuCgpGb3IgaW5zdGFuY2UsIHRoZXJlIGlzIG5vIG5lZWQgdG8gaW52YWxp
ZGF0ZSB0aGUgaW5zdHJ1Y3Rpb24gY2FjaGUgaWYKd2UgYXJlIHNldHRpbmcgU0NUTFJfRUwyLldY
Ti4KClRoZXJlIGlzIGVmZmVjdGl2ZWx5IG9ubHkgb25lIGNhbGxlciAoaS5lIGZyZWVfaW5pdF9t
ZW1vcnkoKSB3aG8gd291bGQKbmVlZCB0byBpbnZhbGlkYXRlIHRoZSBpbnN0cnVjdGlvbiBjYWNo
ZS4KClNvIHJhdGhlciB0aGFuIGtlZXBpbmcgYXJvdW5kIHRoZSBmdW5jdGlvbiBmbHVzaF94ZW5f
dGV4dF90bGJfbG9jYWwoKQpyZXBsYWNlIGl0IHdpdGggY2FsbCB0byBmbHVzaF94ZW5fdGxiX2xv
Y2FsKCkgYW5kIGV4cGxpY2l0ZWx5IGZsdXNoCnRoZSBjYWNoZSB3aGVuIG5lY2Vzc2FyeS4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2Vk
LWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFu
Z2VzIGluIHYzOgogICAgICAgIC0gRml4IHR5cG9lcwoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAg
ICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAg
ICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2Fy
bTMyL3BhZ2UuaCB8IDIzICsrKysrKysrKy0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20t
YXJtL2FybTY0L3BhZ2UuaCB8IDIxICsrKysrLS0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFu
Z2VkLCAyOCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDkzYWQxMTgxODMuLmRmYmUz
OWM3MGEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2FybS9t
bS5jCkBAIC02MTAsOCArNjEwLDEyIEBAIHZvaWQgX19pbml0IHJlbW92ZV9lYXJseV9tYXBwaW5n
cyh2b2lkKQogc3RhdGljIHZvaWQgeGVuX3B0X2VuZm9yY2Vfd254KHZvaWQpCiB7CiAgICAgV1JJ
VEVfU1lTUkVHMzIoUkVBRF9TWVNSRUczMihTQ1RMUl9FTDIpIHwgU0NUTFJfV1hOLCBTQ1RMUl9F
TDIpOwotICAgIC8qIEZsdXNoIGV2ZXJ5dGhpbmcgYWZ0ZXIgc2V0dGluZyBXWE4gYml0LiAqLwot
ICAgIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgpOworICAgIC8qCisgICAgICogVGhlIFRMQnMg
bWF5IGNhY2hlIFNDVExSX0VMMi5XWE4uIFNvIGVuc3VyZSBpdCBpcyBzeW5jaHJvbml6ZWQKKyAg
ICAgKiBiZWZvcmUgZmx1c2hpbmcgdGhlIFRMQnMuCisgICAgICovCisgICAgaXNiKCk7CisgICAg
Zmx1c2hfeGVuX2RhdGFfdGxiX2xvY2FsKCk7CiB9CiAKIGV4dGVybiB2b2lkIHN3aXRjaF90dGJy
KHVpbnQ2NF90IHR0YnIpOwpAQCAtMTEyMyw3ICsxMTI3LDcgQEAgc3RhdGljIHZvaWQgc2V0X3B0
ZV9mbGFnc19vbl9yYW5nZShjb25zdCBjaGFyICpwLCB1bnNpZ25lZCBsb25nIGwsIGVudW0gbWcg
bWcpCiAgICAgICAgIH0KICAgICAgICAgd3JpdGVfcHRlKHhlbl94ZW5tYXAgKyBpLCBwdGUpOwog
ICAgIH0KLSAgICBmbHVzaF94ZW5fdGV4dF90bGJfbG9jYWwoKTsKKyAgICBmbHVzaF94ZW5fZGF0
YV90bGJfbG9jYWwoKTsKIH0KIAogLyogUmVsZWFzZSBhbGwgX19pbml0IGFuZCBfX2luaXRkYXRh
IHJhbmdlcyB0byBiZSByZXVzZWQgKi8KQEAgLTExMzYsNiArMTE0MCwxMyBAQCB2b2lkIGZyZWVf
aW5pdF9tZW1vcnkodm9pZCkKICAgICB1aW50MzJfdCAqcDsKIAogICAgIHNldF9wdGVfZmxhZ3Nf
b25fcmFuZ2UoX19pbml0X2JlZ2luLCBsZW4sIG1nX3J3KTsKKworICAgIC8qCisgICAgICogRnJv
bSBub3cgb24sIGluaXQgd2lsbCBub3QgYmUgdXNlZCBmb3IgZXhlY3V0aW9uIGFueW1vcmUsCisg
ICAgICogc28gbnVrZSB0aGUgaW5zdHJ1Y3Rpb24gY2FjaGUgdG8gcmVtb3ZlIGVudHJpZXMgcmVs
YXRlZCB0byBpbml0LgorICAgICAqLworICAgIGludmFsaWRhdGVfaWNhY2hlX2xvY2FsKCk7CisK
ICNpZmRlZiBDT05GSUdfQVJNXzMyCiAgICAgLyogdWRmIGluc3RydWN0aW9uIGkuZSAoc2VlIEE4
LjguMjQ3IGluIEFSTSBEREkgMDQwNkMuYykgKi8KICAgICBpbnNuID0gMHhlN2YwMDBmMDsKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oIGIveGVuL2luY2x1ZGUv
YXNtLWFybS9hcm0zMi9wYWdlLmgKaW5kZXggZWE0YjMxMmM3MC4uNDBhNzdkYWE5ZCAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9wYWdlLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLWFybS9hcm0zMi9wYWdlLmgKQEAgLTQ2LDI0ICs0NiwxOSBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgaW52YWxpZGF0ZV9pY2FjaGUodm9pZCkKIH0KIAogLyoKLSAqIEZsdXNoIGFsbCBoeXBlcnZp
c29yIG1hcHBpbmdzIGZyb20gdGhlIFRMQiBhbmQgYnJhbmNoIHByZWRpY3RvciBvZgotICogdGhl
IGxvY2FsIHByb2Nlc3Nvci4KLSAqCi0gKiBUaGlzIGlzIG5lZWRlZCBhZnRlciBjaGFuZ2luZyBY
ZW4gY29kZSBtYXBwaW5ncy4KLSAqCi0gKiBUaGUgY2FsbGVyIG5lZWRzIHRvIGlzc3VlIHRoZSBu
ZWNlc3NhcnkgRFNCIGFuZCBELWNhY2hlIGZsdXNoZXMKLSAqIGJlZm9yZSBjYWxsaW5nIGZsdXNo
X3hlbl90ZXh0X3RsYi4KKyAqIEludmFsaWRhdGUgYWxsIGluc3RydWN0aW9uIGNhY2hlcyBvbiB0
aGUgbG9jYWwgcHJvY2Vzc29yIHRvIFBvVS4KKyAqIFdlIGFsc28gbmVlZCB0byBmbHVzaCB0aGUg
YnJhbmNoIHByZWRpY3RvciBmb3IgQVJNdjcgYXMgaXQgbWF5IGJlCisgKiBhcmNoaXRlY3R1cmFs
bHkgdmlzaWJsZSB0byB0aGUgc29mdHdhcmUgKHNlZSBCMi4yLjQgaW4gQVJNIERESSAwNDA2Qy5i
KS4KICAqLwotc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCh2b2lk
KQorc3RhdGljIGlubGluZSB2b2lkIGludmFsaWRhdGVfaWNhY2hlX2xvY2FsKHZvaWQpCiB7CiAg
ICAgYXNtIHZvbGF0aWxlICgKLSAgICAgICAgImlzYjsiICAgICAgICAgICAgICAgICAgICAgICAg
LyogRW5zdXJlIHN5bmNocm9uaXphdGlvbiB3aXRoIHByZXZpb3VzIGNoYW5nZXMgdG8gdGV4dCAq
LwotICAgICAgICBDTURfQ1AzMihUTEJJQUxMSCkgICAgICAgICAgICAvKiBGbHVzaCBoeXBlcnZp
c29yIFRMQiAqLwotICAgICAgICBDTURfQ1AzMihJQ0lBTExVKSAgICAgICAgICAgICAvKiBGbHVz
aCBJLWNhY2hlICovCi0gICAgICAgIENNRF9DUDMyKEJQSUFMTCkgICAgICAgICAgICAgIC8qIEZs
dXNoIGJyYW5jaCBwcmVkaWN0b3IgKi8KLSAgICAgICAgImRzYjsiICAgICAgICAgICAgICAgICAg
ICAgICAgLyogRW5zdXJlIGNvbXBsZXRpb24gb2YgVExCK0JQIGZsdXNoICovCi0gICAgICAgICJp
c2I7IgorICAgICAgICBDTURfQ1AzMihJQ0lBTExVKSAgICAgICAvKiBGbHVzaCBJLWNhY2hlLiAq
LworICAgICAgICBDTURfQ1AzMihCUElBTEwpICAgICAgICAvKiBGbHVzaCBicmFuY2ggcHJlZGlj
dG9yLiAqLwogICAgICAgICA6IDogOiAibWVtb3J5Iik7CisKKyAgICBkc2IobnNoKTsgICAgICAg
ICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRpb24gb2YgdGhlIGZsdXNoIEktY2FjaGUgKi8K
KyAgICBpc2IoKTsgICAgICAgICAgICAgICAgICAgICAgLyogU3luY2hyb25pemUgZmV0Y2hlZCBp
bnN0cnVjdGlvbiBzdHJlYW0uICovCiB9CiAKIC8qCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2FybTY0L3BhZ2UuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvcGFnZS5oCmlu
ZGV4IDIzZDc3ODE1NGQuLjZjMzZkMDIxMGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vYXJtNjQvcGFnZS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvcGFnZS5oCkBA
IC0zNywyMyArMzcsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIGludmFsaWRhdGVfaWNhY2hlKHZv
aWQpCiAgICAgaXNiKCk7CiB9CiAKLS8qCi0gKiBGbHVzaCBhbGwgaHlwZXJ2aXNvciBtYXBwaW5n
cyBmcm9tIHRoZSBUTEIgb2YgdGhlIGxvY2FsIHByb2Nlc3Nvci4KLSAqCi0gKiBUaGlzIGlzIG5l
ZWRlZCBhZnRlciBjaGFuZ2luZyBYZW4gY29kZSBtYXBwaW5ncy4KLSAqCi0gKiBUaGUgY2FsbGVy
IG5lZWRzIHRvIGlzc3VlIHRoZSBuZWNlc3NhcnkgRFNCIGFuZCBELWNhY2hlIGZsdXNoZXMKLSAq
IGJlZm9yZSBjYWxsaW5nIGZsdXNoX3hlbl90ZXh0X3RsYi4KLSAqLwotc3RhdGljIGlubGluZSB2
b2lkIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCh2b2lkKQorLyogSW52YWxpZGF0ZSBhbGwgaW5z
dHJ1Y3Rpb24gY2FjaGVzIG9uIHRoZSBsb2NhbCBwcm9jZXNzb3IgdG8gUG9VICovCitzdGF0aWMg
aW5saW5lIHZvaWQgaW52YWxpZGF0ZV9pY2FjaGVfbG9jYWwodm9pZCkKIHsKLSAgICBhc20gdm9s
YXRpbGUgKAotICAgICAgICAiaXNiOyIgICAgICAgLyogRW5zdXJlIHN5bmNocm9uaXphdGlvbiB3
aXRoIHByZXZpb3VzIGNoYW5nZXMgdG8gdGV4dCAqLwotICAgICAgICAidGxiaSAgIGFsbGUyOyIg
ICAgICAgICAgICAgICAgIC8qIEZsdXNoIGh5cGVydmlzb3IgVExCICovCi0gICAgICAgICJpYyAg
ICAgaWFsbHU7IiAgICAgICAgICAgICAgICAgLyogRmx1c2ggSS1jYWNoZSAqLwotICAgICAgICAi
ZHNiICAgIHN5OyIgICAgICAgICAgICAgICAgICAgIC8qIEVuc3VyZSBjb21wbGV0aW9uIG9mIFRM
QiBmbHVzaCAqLwotICAgICAgICAiaXNiOyIKLSAgICAgICAgOiA6IDogIm1lbW9yeSIpOworICAg
IGFzbSB2b2xhdGlsZSAoImljIGlhbGx1Iik7CisgICAgZHNiKG5zaCk7ICAgICAgICAgICAgICAg
LyogRW5zdXJlIGNvbXBsZXRpb24gb2YgdGhlIEktY2FjaGUgZmx1c2ggKi8KKyAgICBpc2IoKTsK
IH0KIAogLyoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
