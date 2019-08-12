Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF68A4A3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9W-0006iK-UU; Mon, 12 Aug 2019 17:30:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9V-0006ha-Ev
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:37 +0000
X-Inumbo-ID: e555a358-bd26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e555a358-bd26-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 17:30:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60AA51715;
 Mon, 12 Aug 2019 10:30:36 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5953F706;
 Mon, 12 Aug 2019 10:30:35 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:01 +0100
Message-Id: <20190812173019.11956-11-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 10/28] xen/arm32: head: Don't clobber r14/lr
 in the macro PRINT
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

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdGhlIG1hY3JvIFBSSU5UIHdpbGwgY2xvYmJl
ciByMTQvbHIuIFRoaXMKbWVhbnMgdGhlIHVzZXIgc2hvdWxkIHNhdmUgcjE0IGlmIGl0IGNhcmVz
IGFib3V0IGl0LgoKRm9sbG93LXVwIHBhdGNoZXMgd2lsbCBpbnRyb2R1Y2UgbW9yZSB1c2Ugb2Yg
UFJJTlQgaW4gcGxhY2VzIHdoZXJlIGxyCnNob3VsZCBiZSBwcmVzZXJ2ZWQuIFJhdGhlciB0aGFu
IHJlcXVpcmluZyBhbGwgdGhlIHVzZXIgdG8gcHJlc2VydmUgbHIsCnRoZSBtYWNybyBQUklOVCBp
cyBtb2RpZmllZCB0byBzYXZlIGFuZCByZXN0b3JlIGl0LgoKV2hpbGUgdGhlIGNvbW1lbnQgc3Rh
dGUgcjMgd2lsbCBiZSBjbG9iYmVyZWQsIHRoaXMgaXMgbm90IHRoZSBjYXNlLiBTbwpQUklOVCB3
aWxsIHVzZSByMyB0byBwcmVzZXJ2ZSBsci4KCkxhc3RseSwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkg
dG8gbW92ZSB0aGUgY29tbWVudCBvbiB0b3Agb2YgUFJJTlQgYW5kIHVzZQpQUklOVCBpbiBpbml0
X3VhcnQuIEJvdGggY2hhbmdlcyB3aWxsIGJlIGhlbHBmdWwgaW4gYSBmb2xsb3ctdXAgcGF0Y2gu
CgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZp
ZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0t
CiAgICBDaGFuZ2VzIGluIHYzOgogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyBhY2tlZC1ieQoKICAg
IENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS9h
cm0zMi9oZWFkLlMgfCAyNyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwppbmRleCA4
YjRjOGE0NzE0Li5iNTQzMzFjMTlkIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVh
ZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTY0LDE1ICs2NCwyMCBAQAog
ICogICByMTQgLSBMUgogICogICByMTUgLSBQQwogICovCi0vKiBNYWNybyB0byBwcmludCBhIHN0
cmluZyB0byB0aGUgVUFSVCwgaWYgdGhlcmUgaXMgb25lLgotICogQ2xvYmJlcnMgcjAtcjMuICov
CiAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwotI2RlZmluZSBQUklOVChfcykgICAgICAgXAot
ICAgICAgICBhZHIgICByMCwgOThmIDsgXAotICAgICAgICBibCAgICBwdXRzICAgIDsgXAotICAg
ICAgICBiICAgICA5OWYgICAgIDsgXAotOTg6ICAgICAuYXNjaXogX3MgICAgIDsgXAotICAgICAg
ICAuYWxpZ24gMiAgICAgIDsgXAorLyoKKyAqIE1hY3JvIHRvIHByaW50IGEgc3RyaW5nIHRvIHRo
ZSBVQVJULCBpZiB0aGVyZSBpcyBvbmUuCisgKgorICogQ2xvYmJlcnMgcjAgLSByMworICovCisj
ZGVmaW5lIFBSSU5UKF9zKSAgICAgICAgICAgXAorICAgICAgICBtb3YgICByMywgbHIgICAgICAg
O1wKKyAgICAgICAgYWRyICAgcjAsIDk4ZiAgICAgIDtcCisgICAgICAgIGJsICAgIHB1dHMgICAg
ICAgICA7XAorICAgICAgICBtb3YgICBsciwgcjMgICAgICAgO1wKKyAgICAgICAgYiAgICAgOTlm
ICAgICAgICAgIDtcCis5ODogICAgIC5hc2NpeiBfcyAgICAgICAgICA7XAorICAgICAgICAuYWxp
Z24gMiAgICAgICAgICAgO1wKIDk5OgogI2Vsc2UgLyogQ09ORklHX0VBUkxZX1BSSU5USyAqLwog
I2RlZmluZSBQUklOVChzKQpAQCAtNTAwLDEwICs1MDUsOCBAQCBpbml0X3VhcnQ6CiAjaWZkZWYg
RUFSTFlfUFJJTlRLX0lOSVRfVUFSVAogICAgICAgICBlYXJseV91YXJ0X2luaXQgcjExLCByMSwg
cjIKICNlbmRpZgotICAgICAgICBhZHIgICByMCwgMWYKLSAgICAgICAgYiAgICAgcHV0cyAgICAg
ICAgICAgICAgICAgIC8qIEp1bXAgdG8gcHV0cyAqLwotMTogICAgICAuYXNjaXogIi0gVUFSVCBl
bmFibGVkIC1cclxuIgotICAgICAgICAuYWxpZ24gNAorICAgICAgICBQUklOVCgiLSBVQVJUIGVu
YWJsZWQgLVxyXG4iKQorICAgICAgICBtb3YgICBwYywgbHIKIAogLyoKICAqIFByaW50IGVhcmx5
IGRlYnVnIG1lc3NhZ2VzLgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
