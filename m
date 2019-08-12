Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95548A49B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9h-0006vt-HW; Mon, 12 Aug 2019 17:30:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9f-0006tg-RC
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:47 +0000
X-Inumbo-ID: ebaaf76d-bd26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ebaaf76d-bd26-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 17:30:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 223711715;
 Mon, 12 Aug 2019 10:30:47 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70C5A3F706;
 Mon, 12 Aug 2019 10:30:46 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:13 +0100
Message-Id: <20190812173019.11956-23-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 22/28] xen/arm32: head: Rework and document
 launch()
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

Qm9vdCBDUFUgYW5kIHNlY29uZGFyeSBDUFVzIHdpbGwgdXNlIGRpZmZlcmVudCBlbnRyeSBwb2lu
dCB0byBDIGNvZGUuIEF0CnRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0
byB1c2UgaXMgdGFrZW4gd2l0aGluIGxhdW5jaCgpLgoKSW4gb3JkZXIgdG8gYXZvaWQgdXNpbmcg
Y29uZGl0aW9uYWwgaW5zdHJ1Y3Rpb24gYW5kIG1ha2UgdGhlIGNhbGwKY2xlYXJlciwgbGF1bmNo
KCkgaXMgcmV3b3JrZWQgdG8gdGFrZSBpbiBwYXJhbWV0ZXJzIHRoZSBlbnRyeSBwb2ludCBhbmQg
aXRzCmFyZ3VtZW50cy4KCkxhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFp
biByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQpmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgotLS0KICAgIENoYW5nZXMgaW4gdjM6
CiAgICAgICAgLSBBZGQgU3RlZmFubydzIHJldmlld2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MjoK
ICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDM0
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRleCBlZTVjM2QyYWY4
Li4zYzE4MDM3NTc1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCisrKyBi
L3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTE3NCw2ICsxNzQsMTEgQEAgcHJpbWFyeV9z
d2l0Y2hlZDoKICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUg
VUFSVC4gKi8KICAgICAgICAgbW92X3cgcjExLCBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwog
I2VuZGlmCisgICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKKyAgICAgICAgLyogU2V0dXAg
dGhlIGFyZ3VtZW50cyBmb3Igc3RhcnRfeGVuIGFuZCBqdW1wIHRvIEMgd29ybGQgKi8KKyAgICAg
ICAgbW92ICAgcjAsIHIxMCAgICAgICAgICAgICAgICAvKiByMCA6PSBQaHlzaWNhbCBvZmZzZXQg
Ki8KKyAgICAgICAgbW92ICAgcjEsIHI4ICAgICAgICAgICAgICAgICAvKiByMSA6PSBwYWRkcihG
RFQpICovCisgICAgICAgIGxkciAgIHIyLCA9c3RhcnRfeGVuCiAgICAgICAgIGIgICAgIGxhdW5j
aAogRU5EUFJPQyhzdGFydCkKIApAQCAtMjM4LDYgKzI0Myw5IEBAIHNlY29uZGFyeV9zd2l0Y2hl
ZDoKICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4g
Ki8KICAgICAgICAgbW92X3cgcjExLCBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwogI2VuZGlm
CisgICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKKyAgICAgICAgLyogSnVtcCB0byBDIHdv
cmxkICovCisgICAgICAgIGxkciAgIHIyLCA9c3RhcnRfc2Vjb25kYXJ5CiAgICAgICAgIGIgICAg
IGxhdW5jaAogRU5EUFJPQyhpbml0X3NlY29uZGFyeSkKIApAQCAtNTgzLDE5ICs1OTEsMjUgQEAg
c2V0dXBfZml4bWFwOgogICAgICAgICBtb3YgICBwYywgbHIKIEVORFBST0Moc2V0dXBfZml4bWFw
KQogCisvKgorICogU2V0dXAgdGhlIGluaXRpYWwgc3RhY2sgYW5kIGp1bXAgdG8gdGhlIEMgd29y
bGQKKyAqCisgKiBJbnB1dHM6CisgKiAgIHIwIDogQXJndW1lbnQgMCBvZiB0aGUgQyBmdW5jdGlv
biB0byBjYWxsCisgKiAgIHIxIDogQXJndW1lbnQgMSBvZiB0aGUgQyBmdW5jdGlvbiB0byBjYWxs
CisgKiAgIHIyIDogQyBlbnRyeSBwb2ludAorICoKKyAqIENsb2JiZXJzIHIzCisgKi8KIGxhdW5j
aDoKLSAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4iKQotCi0gICAgICAgIGxkciAgIHIwLCA9
aW5pdF9kYXRhCi0gICAgICAgIGFkZCAgIHIwLCAjSU5JVElORk9fc3RhY2sgICAgLyogRmluZCB0
aGUgYm9vdC10aW1lIHN0YWNrICovCi0gICAgICAgIGxkciAgIHNwLCBbcjBdCisgICAgICAgIGxk
ciAgIHIzLCA9aW5pdF9kYXRhCisgICAgICAgIGFkZCAgIHIzLCAjSU5JVElORk9fc3RhY2sgICAg
LyogRmluZCB0aGUgYm9vdC10aW1lIHN0YWNrICovCisgICAgICAgIGxkciAgIHNwLCBbcjNdCiAg
ICAgICAgIGFkZCAgIHNwLCAjU1RBQ0tfU0laRSAgICAgICAgLyogKHdoaWNoIGdyb3dzIGRvd24g
ZnJvbSB0aGUgdG9wKS4gKi8KICAgICAgICAgc3ViICAgc3AsICNDUFVJTkZPX3NpemVvZiAgICAv
KiBNYWtlIHJvb20gZm9yIENQVSBzYXZlIHJlY29yZCAqLwotICAgICAgICB0ZXEgICByMTIsICMw
Ci0gICAgICAgIG1vdmVxIHIwLCByMTAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdzOiAt
IHBoeXNfb2Zmc2V0ICovCi0gICAgICAgIG1vdmVxIHIxLCByOCAgICAgICAgICAgICAgICAgLyog
ICAgICAgICAgICAgICAtIERUQiBhZGRyZXNzICovCi0gICAgICAgIGJlcSAgIHN0YXJ0X3hlbiAg
ICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBpbnRvIHRoZSBsYW5kIG9mIEMgKi8KLSAgICAg
ICAgYiAgICAgc3RhcnRfc2Vjb25kYXJ5ICAgICAgICAvKiAodG8gdGhlIGFwcHJvcHJpYXRlIGVu
dHJ5IHBvaW50KSAqLworCisgICAgICAgIC8qIEp1bXAgdG8gQyB3b3JsZCAqLworICAgICAgIGJ4
ICAgIHIyCiBFTkRQUk9DKGxhdW5jaCkKIAogLyogRmFpbC1zdG9wICovCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
