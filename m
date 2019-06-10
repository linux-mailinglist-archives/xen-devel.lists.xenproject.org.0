Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 428273BCF4
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:35:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1o-0007ce-5x; Mon, 10 Jun 2019 19:32:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1n-0007cO-8a
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:23 +0000
X-Inumbo-ID: 780e1bbf-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 780e1bbf-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5892BC0A;
 Mon, 10 Jun 2019 12:32:22 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 708313F73C;
 Mon, 10 Jun 2019 12:32:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:00 +0100
Message-Id: <20190610193215.23704-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 02/17] xen/arm64: head: Don't clobber x30/lr in
 the macro PRINT
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

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIG1hY3JvIFBSSU5UIHdpbGwgY2xvYmJl
ciB4MzAvbHIuIFRoaXMKbWVhbnMgdGhlIHVzZXIgc2hvdWxkIHNhdmUgbHIgaWYgaXQgY2FyZXMg
YWJvdXQgaXQuCgpGb2xsb3ctdXAgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBtb3JlIHVzZSBvZiBQ
UklOVCBpbiBwbGFjZSB3aGVyZSBscgpzaG91bGQgYmUgcHJlc2VydmVkLiBSYXRoZXIgdGhhbiBy
ZXF1aXJpbmcgYWxsIHRoZSB1c2VycyB0byBwcmVzZXJ2ZSBsciwKdGhlIG1hY3JvIFBSSU5UIGlz
IG1vZGlmaWVkIHRvIHNhdmUgYW5kIHJlc3RvcmUgaXQuCgpXaGlsZSB0aGUgY29tbWVudCBzdGF0
ZSB4MyB3aWxsIGJlIGNsb2JiZXJlZCwgdGhpcyBpcyBub3QgdGhlIGNhc2UuIFNvClBSSU5UIHdp
bGwgdXNlIHgzIHRvIHByZXNlcnZlIGxyLgoKTGFzdGx5LCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0
byBtb3ZlIHRoZSBjb21tZW50IG9uIHRvcCBvZiBQUklOVCBhbmQgdXNlClBSSU5UIGluIGluaXRf
dWFydC4gQm90aCBjaGFuZ2VzIHdpbGwgYmUgaGVscGZ1bCBpbiBhIGZvbGxvdy11cCBwYXRjaC4K
ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQog
eGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDE0ICsrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IGM4
YmJkZjA1YTYuLmE1MTQ3YzhkODAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtNzgsMTIgKzc4LDE3IEBACiAg
KiAgeDMwIC0gbHIKICAqLwogCi0vKiBNYWNybyB0byBwcmludCBhIHN0cmluZyB0byB0aGUgVUFS
VCwgaWYgdGhlcmUgaXMgb25lLgotICogQ2xvYmJlcnMgeDAteDMuICovCiAjaWZkZWYgQ09ORklH
X0VBUkxZX1BSSU5USworLyoKKyAqIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRvIHRoZSBVQVJU
LCBpZiB0aGVyZSBpcyBvbmUuCisgKgorICogQ2xvYmJlcnMgeDAgLSB4MworICovCiAjZGVmaW5l
IFBSSU5UKF9zKSAgICAgICAgICAgXAorICAgICAgICBtb3YgICB4MywgbHIgIDsgICAgIFwKICAg
ICAgICAgYWRyICAgeDAsIDk4ZiA7ICAgICBcCiAgICAgICAgIGJsICAgIHB1dHMgICAgOyAgICAg
XAorICAgICAgICBtb3YgICBsciwgeDMgIDsgICAgIFwKICAgICAgICAgUk9EQVRBX1NUUig5OCwg
X3MpCiAjZWxzZSAvKiBDT05GSUdfRUFSTFlfUFJJTlRLICovCiAjZGVmaW5lIFBSSU5UKHMpCkBA
IC02MzAsOSArNjM1LDggQEAgaW5pdF91YXJ0OgogI2lmZGVmIEVBUkxZX1BSSU5US19JTklUX1VB
UlQKICAgICAgICAgZWFybHlfdWFydF9pbml0IHgyMywgMAogI2VuZGlmCi0gICAgICAgIGFkciAg
IHgwLCAxZgotICAgICAgICBiICAgICBwdXRzCi1ST0RBVEFfU1RSKDEsICItIFVBUlQgZW5hYmxl
ZCAtXHJcbiIpCisgICAgICAgIFBSSU5UKCItIFVBUlQgZW5hYmxlZCAtXHJcbiIpCisgICAgICAg
IHJldAogCiAvKiBQcmludCBlYXJseSBkZWJ1ZyBtZXNzYWdlcy4KICAqIHgwOiBOdWwtdGVybWlu
YXRlZCBzdHJpbmcgdG8gcHJpbnQuCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
