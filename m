Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FDF70BB9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2T-0002Q3-LF; Mon, 22 Jul 2019 21:40:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2R-0002MX-V8
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:07 +0000
X-Inumbo-ID: 45b43da2-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 45b43da2-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C54D1509;
 Mon, 22 Jul 2019 14:40:06 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E87433F71F;
 Mon, 22 Jul 2019 14:40:05 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:24 +0100
Message-Id: <20190722213958.5761-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 01/35] xen/arm64: macros: Introduce an
 assembly macro to alias x30
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

VGhlIHJldHVybiBhZGRyZXNzIG9mIGEgZnVuY3Rpb24gaXMgYWx3YXlzIHN0b3JlZCBpbiB4MzAu
IEZvciBjb252ZW5pZW5jZSwKaW50cm9kdWNlIGEgcmVnaXN0ZXIgYWxpYXMgc28gImxyIiBjYW4g
YmUgdXNlZCBpbiBhc3NlbWJseS4KClRoaXMgaXMgZGVmaW5lZCBpbiBhc20tYXJtL2FybTY0L21h
Y3Jvcy5oIHRvIGFsbG93IGFsbCBhc3NlbWJseSBmaWxlcwp0byB1c2UgaXQuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBDaGFuZ2Vz
IGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvZW50
cnkuUyAgICAgICAgIHwgNSAtLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9tYWNyb3Mu
aCB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9lbnRyeS5TIGIveGVuL2FyY2gv
YXJtL2FybTY0L2VudHJ5LlMKaW5kZXggOTdiMDVmNTNlYS4uMmQ5YTI3MTNhMSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2Vu
dHJ5LlMKQEAgLTcsMTEgKzcsNiBAQAogI2luY2x1ZGUgPHB1YmxpYy94ZW4uaD4KIAogLyoKLSAq
IFJlZ2lzdGVyIGFsaWFzZXMuCi0gKi8KLWxyICAgICAgLnJlcSAgICB4MzAgICAgICAgICAgICAg
LyogbGluayByZWdpc3RlciAqLwotCi0vKgogICogU3RhY2sgcHVzaGluZy9wb3BwaW5nIChyZWdp
c3RlciBwYWlycyBvbmx5KS4gRXF1aXZhbGVudCB0byBzdG9yZSBkZWNyZW1lbnQKICAqIGJlZm9y
ZSwgbG9hZCBpbmNyZW1lbnQgYWZ0ZXIuCiAgKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vYXJtNjQvbWFjcm9zLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L21hY3Jvcy5o
CmluZGV4IDljNWU2NzZiMzcuLmY5ODFiNGY0M2UgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vYXJtNjQvbWFjcm9zLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9tYWNy
b3MuaApAQCAtMjEsNSArMjEsMTAgQEAKICAgICBsZHIgICAgIFxkc3QsIFtcZHN0LCBcdG1wXQog
ICAgIC5lbmRtCiAKKy8qCisgKiBSZWdpc3RlciBhbGlhc2VzLgorICovCitsciAgICAgIC5yZXEg
ICAgeDMwICAgICAgICAgICAgIC8qIGxpbmsgcmVnaXN0ZXIgKi8KKwogI2VuZGlmIC8qIF9fQVNN
X0FSTV9BUk02NF9NQUNST1NfSCAqLwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
