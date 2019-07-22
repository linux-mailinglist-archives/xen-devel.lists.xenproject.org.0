Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552A70BD9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg32-0003Sc-2E; Mon, 22 Jul 2019 21:40:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2u-0003CT-CQ
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:36 +0000
X-Inumbo-ID: 5642fb6e-acc9-11e9-b4fb-3fed55cc5072
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5642fb6e-acc9-11e9-b4fb-3fed55cc5072;
 Mon, 22 Jul 2019 21:40:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97362153B;
 Mon, 22 Jul 2019 14:40:34 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56193F71F;
 Mon, 22 Jul 2019 14:40:33 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:55 +0100
Message-Id: <20190722213958.5761-33-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 32/35] xen/arm32: head: Rework and document
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
ICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMTkg
KysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggNTZlMmQwOWVkNC4uZTBmOGMyZTBjYiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJt
MzIvaGVhZC5TCkBAIC01MzYsOCArNTM2LDIxIEBAIGlkZW50aXR5X21hcHBpbmdfcmVtb3ZlZDoK
ICAgICAgICAgbW92ICAgcGMsIGxyCiBFTkRQUk9DKHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nKQog
CisvKgorICogTWFwIHRoZSBVQVJUIGluIHRoZSBmaXhtYXAgKHdoZW4gZWFybHlwcmludGsgaXMg
dXNlZCkgYW5kIGhvb2sgdGhlCisgKiBmaXhtYXAgdGFibGUgaW4gdGhlIHBhZ2UgdGFibGVzLgor
ICoKKyAqIFRoZSBmaXhtYXAgY2Fubm90IGJlIG1hcHBlZCBpbiBjcmVhdGVfcGFnZV90YWJsZXMg
YmVjYXVzZSBpdCBtYXkKKyAqIGNsYXNoIHdpdGggdGhlIDE6MSBtYXBwaW5nLgorICoKKyAqIElu
cHV0czoKKyAqICAgcjEwOiBQaHlzaWNhbCBvZmZzZXQKKyAqICAgcjExOiBFYXJseSBVQVJUIGJh
c2UgcGh5c2ljYWwgYWRkcmVzcworICoKKyAqIENsb2JiZXJzIHIxIC0gcjQKKyAqLwogc2V0dXBf
Zml4bWFwOgotI2lmIGRlZmluZWQoQ09ORklHX0VBUkxZX1BSSU5USykgLyogRml4bWFwIGlzIG9u
bHkgdXNlZCBieSBlYXJseSBwcmludGsgKi8KKyNpZiBkZWZpbmVkKENPTkZJR19FQVJMWV9QUklO
VEspCiAgICAgICAgIC8qIEFkZCBVQVJUIHRvIHRoZSBmaXhtYXAgdGFibGUgKi8KICAgICAgICAg
bGRyICAgcjEsID14ZW5fZml4bWFwICAgICAgICAvKiByMSA6PSB2YWRkciAoeGVuX2ZpeG1hcCkg
Ki8KICAgICAgICAgbHNyICAgcjIsIHIxMSwgI1RISVJEX1NISUZUCkBAIC01NDYsNyArNTU5LDcg
QEAgc2V0dXBfZml4bWFwOgogICAgICAgICBvcnIgICByMiwgcjIsICNQVF9MT1dFUihERVZfTDMp
IC8qIHIyOnIzIDo9IDRLIGRldiBtYXAgaW5jbHVkaW5nIFVBUlQgKi8KICAgICAgICAgbW92ICAg
cjMsICMweDAKICAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjEsICMoRklYTUFQX0NPTlNPTEUqOCld
IC8qIE1hcCBpdCBpbiB0aGUgZmlyc3QgZml4bWFwJ3Mgc2xvdCAqLwotMToKKyNlbmRpZgogCiAg
ICAgICAgIC8qIE1hcCBmaXhtYXAgaW50byBib290X3NlY29uZCAqLwogICAgICAgICBsZHIgICBy
MSwgPWJvb3Rfc2Vjb25kICAgICAgIC8qIHIxIDo9IHZhZGRyIChib290X3NlY29uZCkgKi8KQEAg
LTU2MSw3ICs1NzQsNyBAQCBzZXR1cF9maXhtYXA6CiAKICAgICAgICAgLyogRW5zdXJlIGFueSBw
YWdlIHRhYmxlIHVwZGF0ZXMgbWFkZSBhYm92ZSBoYXZlIG9jY3VycmVkLiAqLwogICAgICAgICBk
c2IgICBuc2hzdAotI2VuZGlmCisKICAgICAgICAgbW92ICAgcGMsIGxyCiBFTkRQUk9DKHNldHVw
X2ZpeG1hcCkKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
