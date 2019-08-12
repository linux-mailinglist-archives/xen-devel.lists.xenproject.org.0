Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB4B8A49C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9Y-0006kd-JP; Mon, 12 Aug 2019 17:30:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9W-0006iQ-TC
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:38 +0000
X-Inumbo-ID: e65def37-bd26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e65def37-bd26-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 17:30:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E21C174E;
 Mon, 12 Aug 2019 10:30:38 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C38A3F706;
 Mon, 12 Aug 2019 10:30:37 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:03 +0100
Message-Id: <20190812173019.11956-13-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 12/28] xen/arm32: head: Introduce print_reg
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

QXQgdGhlIG1vbWVudCwgdGhlIHVzZXIgc2hvdWxkIHNhdmUgcjE0L2xyIGlmIGl0IGNhcmVzIGFi
b3V0IGl0LgoKRm9sbG93LXVwIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2YgcHV0
biBpbiBwbGFjZSB3aGVyZSBscgpzaG91bGQgYmUgcHJlc2VydmVkLgoKRnVydGhlcm1vcmUsIGFu
eSB1c2VyIG9mIHB1dG4gc2hvdWxkIGFsc28gbW92ZSB0aGUgdmFsdWUgdG8gcmVnaXN0ZXIgcjAK
aWYgaXQgd2FzIHN0b3JlZCBpbiBhIGRpZmZlcmVudCByZWdpc3Rlci4KCkZvciBjb252ZW5pZW5j
ZSwgYSBuZXcgbWFjcm8gaXMgaW50cm9kdWNlZCB0byBwcmludCBhIGdpdmVuIHJlZ2lzdGVyLgpU
aGUgbWFjcm8gd2lsbCB0YWtlIGNhcmUgZm9yIHVzIHRvIG1vdmUgdGhlIHZhbHVlIHRvIHIwIGFu
ZCBhbHNvCnByZXNlcnZlIGxyLgoKTGFzdGx5IHRoZSBuZXcgbWFjcm8gaXMgdXNlZCB0byByZXBs
YWNlIGFsbCB0aGUgY2FsbHNpdGUgb2YgcHV0bi4gVGhpcwp3aWxsIHNpbXBsaWZ5IHJld29yay9y
ZXZpZXcgbGF0ZXIgb24uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gQWRkIFN0ZWZhbm8n
cyByZXZpZXdlZC1ieQoKICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAot
LS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAyMyArKysrKysrKysrKysrKysrKysrLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9o
ZWFkLlMKaW5kZXggZmQzYTI3MzU1MC4uYzRlZTA2YmE5MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC03OSw4
ICs3OSwyNSBAQAogOTg6ICAgICAuYXNjaXogX3MgICAgICAgICAgO1wKICAgICAgICAgLmFsaWdu
IDIgICAgICAgICAgIDtcCiA5OToKKworLyoKKyAqIE1hY3JvIHRvIHByaW50IHRoZSB2YWx1ZSBv
ZiByZWdpc3RlciBccmIKKyAqCisgKiBDbG9iYmVycyByMCAtIHI0CisgKi8KKy5tYWNybyBwcmlu
dF9yZWcgcmIKKyAgICAgICAgbW92ICAgcjAsIFxyYgorICAgICAgICBtb3YgICByNCwgbHIKKyAg
ICAgICAgYmwgICAgcHV0bgorICAgICAgICBtb3YgICBsciwgcjQKKy5lbmRtCisKICNlbHNlIC8q
IENPTkZJR19FQVJMWV9QUklOVEsgKi8KICNkZWZpbmUgUFJJTlQocykKKworLm1hY3JvIHByaW50
X3JlZyByYgorLmVuZG0KKwogI2VuZGlmIC8qICFDT05GSUdfRUFSTFlfUFJJTlRLICovCiAKICAg
ICAgICAgLmFybQpAQCAtMTU5LDggKzE3Niw3IEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKICNp
ZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLCiAgICAgICAgIG1vdl93IHIxMSwgRUFSTFlfVUFSVF9C
QVNFX0FERFJFU1MgICAvKiByMTEgOj0gVUFSVCBiYXNlIGFkZHJlc3MgKi8KICAgICAgICAgUFJJ
TlQoIi0gQ1BVICIpCi0gICAgICAgIG1vdiAgIHIwLCByNwotICAgICAgICBibCAgICBwdXRuCisg
ICAgICAgIHByaW50X3JlZyByNwogICAgICAgICBQUklOVCgiIGJvb3RpbmcgLVxyXG4iKQogI2Vu
ZGlmCiAKQEAgLTIxMSw4ICsyMjcsNyBAQCBza2lwX2JzczoKICAgICAgICAgYm5lICAgMWYKICAg
ICAgICAgbW92ICAgcjQsIHIwCiAgICAgICAgIFBSSU5UKCItIE1pc3NpbmcgcHJvY2Vzc29yIGlu
Zm86ICIpCi0gICAgICAgIG1vdiAgIHIwLCByNAotICAgICAgICBibCAgICBwdXRuCisgICAgICAg
IHByaW50X3JlZyByNAogICAgICAgICBQUklOVCgiIC1cclxuIikKICAgICAgICAgYiAgICAgZmFp
bAogMToKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
