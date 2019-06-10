Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E46B3BCEE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:34:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ20-0007kt-KG; Mon, 10 Jun 2019 19:32:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1z-0007kH-Gp
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:35 +0000
X-Inumbo-ID: 7ea70a16-8bb6-11e9-a861-33f576285945
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7ea70a16-8bb6-11e9-a861-33f576285945;
 Mon, 10 Jun 2019 19:32:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E7C2C0A;
 Mon, 10 Jun 2019 12:32:33 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 965C33F73C;
 Mon, 10 Jun 2019 12:32:32 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:10 +0100
Message-Id: <20190610193215.23704-13-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 12/17] xen/arm64: head: Move assembly switch to
 the runtime PT in secondary CPUs path
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGFzc2VtYmx5IHN3aXRjaCB0byB0aGUgcnVudGltZSBQVCBpcyBvbmx5IG5lY2Vzc2FyeSBm
b3IgdGhlCnNlY29uZGFyeSBDUFVzLiBTbyBtb3ZlIHRoZSBjb2RlIGluIHRoZSBzZWNvbmRhcnkg
Q1BVcyBwYXRoLgoKV2hpbGUgdGhpcyBpcyBkZWZpbml0ZWx5IG5vdCBjb21wbGlhbnQgd2l0aCB0
aGUgQXJtIEFybSBhcyB3ZSBhcmUKc3dpdGNoaW5nIGJldHdlZW4gdHdvIGRpZmZlcmVudHMgc2V0
IG9mIHBhZ2UtdGFibGVzIHdpdGhvdXQgdHVybmluZyBvZmYKdGhlIE1NVS4gVHVybmluZyBvZmYg
dGhlIE1NVSBpcyBpbXBvc3NpYmxlIGhlcmUgYXMgdGhlIElEIG1hcCBtYXkgY2xhc2gKd2l0aCBv
dGhlciBtYXBwaW5ncyBpbiB0aGUgcnVudGltZSBwYWdlLXRhYmxlcy4gVGhpcyB3aWxsIHJlcXVp
cmUgbW9yZQpyZXdvcmsgdG8gYXZvaWQgdGhlIHByb2JsZW0uIFNvIGZvciBub3cgYWRkIGEgVE9E
TyBpbiB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDMzICsrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMg
Yi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IGQ2NzNmN2MwZDguLjZiZTRhZjc1Nzkg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUwpAQCAtMzQ0LDYgKzM0NCwyMyBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkp
CiAgICAgICAgIGJyICAgIHgwCiBzZWNvbmRhcnlfc3dpdGNoZWQ6CiAgICAgICAgIGJsICAgIHNl
dHVwX2ZpeG1hcAorCisgICAgICAgIC8qCisgICAgICAgICAqIE5vbi1ib290IENQVXMgbmVlZCB0
byBtb3ZlIG9uIHRvIHRoZSBwcm9wZXIgcGFnZXRhYmxlcywgd2hpY2ggd2VyZQorICAgICAgICAg
KiBzZXR1cCBpbiBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzLgorICAgICAgICAgKgorICAgICAg
ICAgKiBYWFg6IFRoaXMgaXMgbm90IGNvbXBsaWFudCB3aXRoIHRoZSBBcm0gQXJtLgorICAgICAg
ICAgKi8KKyAgICAgICAgbGRyICAgeDQsID1pbml0X3R0YnIgICAgICAgICAvKiBWQSBvZiBUVEJS
MF9FTDIgc3Rhc2hlZCBieSBDUFUgMCAqLworICAgICAgICBsZHIgICB4NCwgW3g0XSAgICAgICAg
ICAgICAgIC8qIEFjdHVhbCB2YWx1ZSAqLworICAgICAgICBkc2IgICBzeQorICAgICAgICBtc3Ig
ICBUVEJSMF9FTDIsIHg0CisgICAgICAgIGRzYiAgIHN5CisgICAgICAgIGlzYgorICAgICAgICB0
bGJpICBhbGxlMgorICAgICAgICBkc2IgICBzeSAgICAgICAgICAgICAgICAgICAgIC8qIEVuc3Vy
ZSBjb21wbGV0aW9uIG9mIFRMQiBmbHVzaCAqLworICAgICAgICBpc2IKKwogICAgICAgICBiICAg
ICBsYXVuY2gKIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCiAKQEAgLTY1NywyMiArNjc0LDYgQEAg
RU5EUFJPQyhzZXR1cF9maXhtYXApCiBsYXVuY2g6CiAgICAgICAgIFBSSU5UKCItIFJlYWR5IC1c
clxuIikKIAotICAgICAgICAvKiBUaGUgYm9vdCBDUFUgc2hvdWxkIGdvIHN0cmFpZ2h0IGludG8g
QyBub3cgKi8KLSAgICAgICAgY2J6ICAgeDIyLCBsYXVuY2gKLQotICAgICAgICAvKiBOb24tYm9v
dCBDUFVzIG5lZWQgdG8gbW92ZSBvbiB0byB0aGUgcHJvcGVyIHBhZ2V0YWJsZXMsIHdoaWNoIHdl
cmUKLSAgICAgICAgICogc2V0dXAgaW4gaW5pdF9zZWNvbmRhcnlfcGFnZXRhYmxlcy4gKi8KLQot
ICAgICAgICBsZHIgICB4NCwgPWluaXRfdHRiciAgICAgICAgIC8qIFZBIG9mIFRUQlIwX0VMMiBz
dGFzaGVkIGJ5IENQVSAwICovCi0gICAgICAgIGxkciAgIHg0LCBbeDRdICAgICAgICAgICAgICAg
LyogQWN0dWFsIHZhbHVlICovCi0gICAgICAgIGRzYiAgIHN5Ci0gICAgICAgIG1zciAgIFRUQlIw
X0VMMiwgeDQKLSAgICAgICAgZHNiICAgc3kKLSAgICAgICAgaXNiCi0gICAgICAgIHRsYmkgIGFs
bGUyCi0gICAgICAgIGRzYiAgIHN5ICAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBs
ZXRpb24gb2YgVExCIGZsdXNoICovCi0gICAgICAgIGlzYgotCiAgICAgICAgIGxkciAgIHgwLCA9
aW5pdF9kYXRhCiAgICAgICAgIGFkZCAgIHgwLCB4MCwgI0lOSVRJTkZPX3N0YWNrIC8qIEZpbmQg
dGhlIGJvb3QtdGltZSBzdGFjayAqLwogICAgICAgICBsZHIgICB4MCwgW3gwXQotLSAKMi4xMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
