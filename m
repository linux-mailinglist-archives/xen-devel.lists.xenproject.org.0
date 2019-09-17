Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A452B551F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 20:15:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAHyI-00086Z-5r; Tue, 17 Sep 2019 18:13:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAHyH-000863-3x
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 18:13:01 +0000
X-Inumbo-ID: c5efc576-d976-11e9-b76c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c5efc576-d976-11e9-b76c-bc764e2007e4;
 Tue, 17 Sep 2019 18:12:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F14F1168F;
 Tue, 17 Sep 2019 11:12:55 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BDDA3F67D;
 Tue, 17 Sep 2019 11:12:55 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 17 Sep 2019 19:12:40 +0100
Message-Id: <20190917181244.30027-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190917181244.30027-1-julien.grall@arm.com>
References: <20190917181244.30027-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v4 4/8] xen/arm32: head: Rework and document
 setup_fixmap()
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

QXQgdGhlIG1vbWVudCwgdGhlIGZpeG1hcCB0YWJsZSBpcyBvbmx5IGhvb2tlZCB3aGVuIGVhcmx5
cHJpbnRrIGlzIHVzZWQuClRoaXMgaXMgZmluZSB0b2RheSBiZWNhdXNlIGluIEMgbGFuZCwgdGhl
IGZpeG1hcCBpcyBub3QgdXNlZCBieSBhbnlvbmUKdW50aWwgdGhlIHRoZSBib290IENQVSBpcyBz
d2l0Y2hpbmcgdG8gdGhlIHJ1bnRpbWUgcGFnZS10YWJsZXMuCgpJbiB0aGUgZnV0dXJlLCB0aGUg
Ym9vdCBDUFUgd2lsbCBub3Qgc3dpdGNoIGJldHdlZW4gcGFnZS10YWJsZXMgdG8KYXZvaWQgVExC
IGluY29oZXJlbmN5LiBUaHVzLCB0aGUgZml4bWFwIHRhYmxlIHdpbGwgbmVlZCB0byBiZSBhbHdh
eXMKaG9va2VkIGJlb2ZyZSBhbnkgdXNlLiBMZXQncyBzdGFydCBkb2luZyBpdCBub3cgaW4gc2V0
dXBfZml4bWFwKCkuCgpMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4g
cmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgog
ICAgICAgIC0gVGhlIHVudXNlZCBsYWJlbCBpcyBub3cgcmVtb3ZlZCBpbiB0aGUgcHJldmlvdXMg
cGF0Y2gKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgcmV2aWV3ZWQtYnkKCiAgICBDaGFuZ2VzIGlu
IHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
IHwgMTggKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5T
IGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRleCA2NWI3ZTBkNzExLi5mNThkMGZjYjgw
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMKQEAgLTU0Niw4ICs1NDYsMjEgQEAgaWRlbnRpdHlfbWFwcGluZ19yZW1v
dmVkOgogICAgICAgICBtb3YgICBwYywgbHIKIEVORFBST0MocmVtb3ZlX2lkZW50aXR5X21hcHBp
bmcpCiAKKy8qCisgKiBNYXAgdGhlIFVBUlQgaW4gdGhlIGZpeG1hcCAod2hlbiBlYXJseXByaW50
ayBpcyB1c2VkKSBhbmQgaG9vayB0aGUKKyAqIGZpeG1hcCB0YWJsZSBpbiB0aGUgcGFnZSB0YWJs
ZXMuCisgKgorICogVGhlIGZpeG1hcCBjYW5ub3QgYmUgbWFwcGVkIGluIGNyZWF0ZV9wYWdlX3Rh
YmxlcyBiZWNhdXNlIGl0IG1heQorICogY2xhc2ggd2l0aCB0aGUgMToxIG1hcHBpbmcuCisgKgor
ICogSW5wdXRzOgorICogICByMTA6IFBoeXNpY2FsIG9mZnNldAorICogICByMTE6IEVhcmx5IFVB
UlQgYmFzZSBwaHlzaWNhbCBhZGRyZXNzCisgKgorICogQ2xvYmJlcnMgcjEgLSByNAorICovCiBz
ZXR1cF9maXhtYXA6Ci0jaWYgZGVmaW5lZChDT05GSUdfRUFSTFlfUFJJTlRLKSAvKiBGaXhtYXAg
aXMgb25seSB1c2VkIGJ5IGVhcmx5IHByaW50ayAqLworI2lmIGRlZmluZWQoQ09ORklHX0VBUkxZ
X1BSSU5USykKICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1hcCB0YWJsZSAqLwogICAg
ICAgICBsZHIgICByMSwgPXhlbl9maXhtYXAgICAgICAgIC8qIHIxIDo9IHZhZGRyICh4ZW5fZml4
bWFwKSAqLwogICAgICAgICBsc3IgICByMiwgcjExLCAjVEhJUkRfU0hJRlQKQEAgLTU1Niw2ICs1
NjksNyBAQCBzZXR1cF9maXhtYXA6CiAgICAgICAgIG9yciAgIHIyLCByMiwgI1BUX0xPV0VSKERF
Vl9MMykgLyogcjI6cjMgOj0gNEsgZGV2IG1hcCBpbmNsdWRpbmcgVUFSVCAqLwogICAgICAgICBt
b3YgICByMywgIzB4MAogICAgICAgICBzdHJkICByMiwgcjMsIFtyMSwgIyhGSVhNQVBfQ09OU09M
RSo4KV0gLyogTWFwIGl0IGluIHRoZSBmaXJzdCBmaXhtYXAncyBzbG90ICovCisjZW5kaWYKIAog
ICAgICAgICAvKiBNYXAgZml4bWFwIGludG8gYm9vdF9zZWNvbmQgKi8KICAgICAgICAgbGRyICAg
cjEsID1ib290X3NlY29uZCAgICAgICAvKiByMSA6PSB2YWRkciAoYm9vdF9zZWNvbmQpICovCkBA
IC01NzAsNyArNTg0LDcgQEAgc2V0dXBfZml4bWFwOgogCiAgICAgICAgIC8qIEVuc3VyZSBhbnkg
cGFnZSB0YWJsZSB1cGRhdGVzIG1hZGUgYWJvdmUgaGF2ZSBvY2N1cnJlZC4gKi8KICAgICAgICAg
ZHNiICAgbnNoc3QKLSNlbmRpZgorCiAgICAgICAgIG1vdiAgIHBjLCBscgogRU5EUFJPQyhzZXR1
cF9maXhtYXApCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
