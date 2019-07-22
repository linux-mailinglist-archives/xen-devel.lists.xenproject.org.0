Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D015570BC0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2i-0002ju-Le; Mon, 22 Jul 2019 21:40:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2g-0002fp-9W
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:22 +0000
X-Inumbo-ID: 4d2341ec-acc9-11e9-bcc2-f3c6d6cef6ca
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4d2341ec-acc9-11e9-bcc2-f3c6d6cef6ca;
 Mon, 22 Jul 2019 21:40:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B8251509;
 Mon, 22 Jul 2019 14:40:19 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9951C3F71F;
 Mon, 22 Jul 2019 14:40:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:38 +0100
Message-Id: <20190722213958.5761-16-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 15/35] xen/arm64: head: Rework and document
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
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgog
ICAgICAgIC0gVXBkYXRlIHRoZSBjb21tZW50IHRvIHJlZmxlY3QgdGhhdCB3ZSBjbG9iYmVycyB4
MSAtIHg0IGFuZCBub3QKICAgICAgICB4MCAtIHgxLgogICAgICAgIC0gQWRkIHRoZSBsaXN0IG9m
IGlucHV0IHJlZ2lzdGVycwogICAgICAgIC0gcy9JRCBtYXAvMToxIG1hcHBpbmcvCiAgICAgICAg
LSBSZXdvcmQgdGhlIGNvbW1pdCBtZXNzYWdlCi0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UyB8IDE4ICsrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggYTYwN2IzYmRiMS4uZjE2NWRkNjFj
YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUworKysgYi94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCkBAIC02OTMsOCArNjkzLDIxIEBAIGlkZW50aXR5X21hcHBpbmdfcmVt
b3ZlZDoKICAgICAgICAgcmV0CiBFTkRQUk9DKHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKQogCisv
KgorICogTWFwIHRoZSBVQVJUIGluIHRoZSBmaXhtYXAgKHdoZW4gZWFybHlwcmludGsgaXMgdXNl
ZCkgYW5kIGhvb2sgdGhlCisgKiBmaXhtYXAgdGFibGUgaW4gdGhlIHBhZ2UgdGFibGVzLgorICoK
KyAqIFRoZSBmaXhtYXAgY2Fubm90IGJlIG1hcHBlZCBpbiBjcmVhdGVfcGFnZV90YWJsZXMgYmVj
YXVzZSBpdCBtYXkKKyAqIGNsYXNoIHdpdGggdGhlIDE6MSBtYXBwaW5nLgorICoKKyAqIElucHV0
czoKKyAqICAgeDIwOiBQaHlzaWNhbCBvZmZzZXQKKyAqICAgeDIzOiBFYXJseSBVQVJUIGJhc2Ug
cGh5c2ljYWwgYWRkcmVzcworICoKKyAqIENsb2JiZXJzIHgxIC0geDQKKyAqLwogc2V0dXBfZml4
bWFwOgotI2lmIGRlZmluZWQoQ09ORklHX0VBUkxZX1BSSU5USykgLyogRml4bWFwIGlzIG9ubHkg
dXNlZCBieSBlYXJseSBwcmludGsgKi8KKyNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLCiAgICAg
ICAgIC8qIEFkZCBVQVJUIHRvIHRoZSBmaXhtYXAgdGFibGUgKi8KICAgICAgICAgbGRyICAgeDEs
ID14ZW5fZml4bWFwICAgICAgICAvKiB4MSA6PSB2YWRkciAoeGVuX2ZpeG1hcCkgKi8KICAgICAg
ICAgbHNyICAgeDIsIHgyMywgI1RISVJEX1NISUZUCkBAIC03MDIsNiArNzE1LDcgQEAgc2V0dXBf
Zml4bWFwOgogICAgICAgICBtb3YgICB4MywgI1BUX0RFVl9MMwogICAgICAgICBvcnIgICB4Miwg
eDIsIHgzICAgICAgICAgICAgIC8qIHgyIDo9IDRLIGRldiBtYXAgaW5jbHVkaW5nIFVBUlQgKi8K
ICAgICAgICAgc3RyICAgeDIsIFt4MSwgIyhGSVhNQVBfQ09OU09MRSo4KV0gLyogTWFwIGl0IGlu
IHRoZSBmaXJzdCBmaXhtYXAncyBzbG90ICovCisjZW5kaWYKIAogICAgICAgICAvKiBNYXAgZml4
bWFwIGludG8gYm9vdF9zZWNvbmQgKi8KICAgICAgICAgbGRyICAgeDQsID1ib290X3NlY29uZCAg
ICAgICAvKiB4NCA6PSB2YWRkciAoYm9vdF9zZWNvbmQpICovCkBAIC03MTQsNyArNzI4LDcgQEAg
c2V0dXBfZml4bWFwOgogCiAgICAgICAgIC8qIEVuc3VyZSBhbnkgcGFnZSB0YWJsZSB1cGRhdGVz
IG1hZGUgYWJvdmUgaGF2ZSBvY2N1cnJlZC4gKi8KICAgICAgICAgZHNiICAgbnNoc3QKLSNlbmRp
ZgorCiAgICAgICAgIHJldAogRU5EUFJPQyhzZXR1cF9maXhtYXApCiAKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
