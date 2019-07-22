Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F4E70BD5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2q-00031G-GI; Mon, 22 Jul 2019 21:40:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2n-0002vD-Fb
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:29 +0000
X-Inumbo-ID: 517e79aa-acc9-11e9-b45d-cf2cd706ffcc
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 517e79aa-acc9-11e9-b45d-cf2cd706ffcc;
 Mon, 22 Jul 2019 21:40:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C8B6152F;
 Mon, 22 Jul 2019 14:40:26 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA7923F71F;
 Mon, 22 Jul 2019 14:40:25 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:46 +0100
Message-Id: <20190722213958.5761-24-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 23/35] xen/arm32: head: Introduce print_reg
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
bEBhcm0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQK
LS0tCiB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMjMgKysrKysrKysrKysrKysrKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCmluZGV4IDEzNGMzZGRhOTIuLmJiY2ZkY2QzNTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9hcm0zMi9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpAQCAtNzks
OCArNzksMjUgQEAKIDk4OiAgICAgLmFzY2l6IF9zICAgICAgICAgIDtcCiAgICAgICAgIC5hbGln
biAyICAgICAgICAgICA7XAogOTk6CisKKy8qCisgKiBNYWNybyB0byBwcmludCB0aGUgdmFsdWUg
b2YgcmVnaXN0ZXIgXHJiCisgKgorICogQ2xvYmJlcnMgcjAgLSByNAorICovCisubWFjcm8gcHJp
bnRfcmVnIHJiCisgICAgICAgIG1vdiAgIHIwLCBccmIKKyAgICAgICAgbW92ICAgcjQsIGxyCisg
ICAgICAgIGJsICAgIHB1dG4KKyAgICAgICAgbW92ICAgbHIsIHI0CisuZW5kbQorCiAjZWxzZSAv
KiBDT05GSUdfRUFSTFlfUFJJTlRLICovCiAjZGVmaW5lIFBSSU5UKHMpCisKKy5tYWNybyBwcmlu
dF9yZWcgcmIKKy5lbmRtCisKICNlbmRpZiAvKiAhQ09ORklHX0VBUkxZX1BSSU5USyAqLwogCiAg
ICAgICAgIC5hcm0KQEAgLTE1OSw4ICsxNzYsNyBAQCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCiAj
aWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwogICAgICAgICBtb3ZfdyByMTEsIEVBUkxZX1VBUlRf
QkFTRV9BRERSRVNTICAgLyogcjExIDo9IFVBUlQgYmFzZSBhZGRyZXNzICovCiAgICAgICAgIFBS
SU5UKCItIENQVSAiKQotICAgICAgICBtb3YgICByMCwgcjcKLSAgICAgICAgYmwgICAgcHV0bgor
ICAgICAgICBwcmludF9yZWcgcjcKICAgICAgICAgUFJJTlQoIiBib290aW5nIC1cclxuIikKICNl
bmRpZgogCkBAIC0yMTEsOCArMjI3LDcgQEAgc2tpcF9ic3M6CiAgICAgICAgIGJuZSAgIDFmCiAg
ICAgICAgIG1vdiAgIHI0LCByMAogICAgICAgICBQUklOVCgiLSBNaXNzaW5nIHByb2Nlc3NvciBp
bmZvOiAiKQotICAgICAgICBtb3YgICByMCwgcjQKLSAgICAgICAgYmwgICAgcHV0bgorICAgICAg
ICBwcmludF9yZWcgcjQKICAgICAgICAgUFJJTlQoIiAtXHJcbiIpCiAgICAgICAgIGIgICAgIGZh
aWwKIDE6Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
