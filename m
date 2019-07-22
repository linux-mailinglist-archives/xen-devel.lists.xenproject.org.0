Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6144070BCC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2b-0002XY-In; Mon, 22 Jul 2019 21:40:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2a-0002VI-3k
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:16 +0000
X-Inumbo-ID: 4a6588d4-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4a6588d4-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B071F344;
 Mon, 22 Jul 2019 14:40:14 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09D303F71F;
 Mon, 22 Jul 2019 14:40:13 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:33 +0100
Message-Id: <20190722213958.5761-11-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 10/35] xen/arm64: head: Improve coding style
 and document create_pages_tables()
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

QWRqdXN0IHRoZSBjb2Rpbmcgc3R5bGUgdXNlZCBpbiB0aGUgY29tbWVudHMgd2l0aGluIGNyZWF0
ZV9wYWdlc190YWJsZXMoKQoKTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBt
YWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCmZ1bmN0aW9uLiBOb3RlIHRoYXQgeDI1IGlz
IG5vdyBvbmx5IHVzZWQgd2l0aGluIHRoZSBmdW5jdGlvbiwgc28gaXQgZG9lcwpub3QgbmVlZCB0
byBiZSBwYXJ0IG9mIHRoZSBjb21tb24gcmVnaXN0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggZGRj
NTE2NzAyMC4uZWRkZjY2MzAyMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCkBAIC03MCw3ICs3MCw3IEBACiAgKiAg
eDIyIC0gaXNfc2Vjb25kYXJ5X2NwdQogICogIHgyMyAtIFVBUlQgYWRkcmVzcwogICogIHgyNCAt
Ci0gKiAgeDI1IC0gaWRlbnRpdHkgbWFwIGluIHBsYWNlCisgKiAgeDI1IC0KICAqICB4MjYgLSBz
a2lwX3plcm9fYnNzIChib290IGNwdSBvbmx5KQogICogIHgyNyAtCiAgKiAgeDI4IC0KQEAgLTQz
NiwxNiArNDM2LDI3IEBAIGNwdV9pbml0OgogICAgICAgICByZXQKIEVORFBST0MoY3B1X2luaXQp
CiAKKy8qCisgKiBSZWJ1aWxkIHRoZSBib290IHBhZ2V0YWJsZSdzIGZpcnN0LWxldmVsIGVudHJp
ZXMuIFRoZSBzdHJ1Y3R1cmUKKyAqIGlzIGRlc2NyaWJlZCBpbiBtbS5jLgorICoKKyAqIEFmdGVy
IHRoZSBDUFUgZW5hYmxlcyBwYWdpbmcgaXQgd2lsbCBhZGQgdGhlIGZpeG1hcCBtYXBwaW5nCisg
KiB0byB0aGVzZSBwYWdlIHRhYmxlcywgaG93ZXZlciB0aGlzIG1heSBjbGFzaCB3aXRoIHRoZSAx
OjEKKyAqIG1hcHBpbmcuIFNvIGVhY2ggQ1BVIG11c3QgcmVidWlsZCB0aGUgcGFnZSB0YWJsZXMg
aGVyZSB3aXRoCisgKiB0aGUgMToxIGluIHBsYWNlLgorICoKKyAqIElucHV0czoKKyAqICAgeDE5
OiBwYWRkcihzdGFydCkKKyAqICAgeDIwOiBwaHlzIG9mZnNldAorICoKKyAqIENsb2JiZXJzIHgw
IC0geDQsIHgyNQorICoKKyAqIFJlZ2lzdGVyIHVzYWdlIHdpdGhpbiB0aGlzIGZ1bmN0aW9uOgor
ICogICB4MjU6IElkZW50aXR5IG1hcCBpbiBwbGFjZQorICovCiBjcmVhdGVfcGFnZV90YWJsZXM6
Ci0gICAgICAgIC8qIFJlYnVpbGQgdGhlIGJvb3QgcGFnZXRhYmxlJ3MgZmlyc3QtbGV2ZWwgZW50
cmllcy4gVGhlIHN0cnVjdHVyZQotICAgICAgICAgKiBpcyBkZXNjcmliZWQgaW4gbW0uYy4KLSAg
ICAgICAgICoKLSAgICAgICAgICogQWZ0ZXIgdGhlIENQVSBlbmFibGVzIHBhZ2luZyBpdCB3aWxs
IGFkZCB0aGUgZml4bWFwIG1hcHBpbmcKLSAgICAgICAgICogdG8gdGhlc2UgcGFnZSB0YWJsZXMs
IGhvd2V2ZXIgdGhpcyBtYXkgY2xhc2ggd2l0aCB0aGUgMToxCi0gICAgICAgICAqIG1hcHBpbmcu
IFNvIGVhY2ggQ1BVIG11c3QgcmVidWlsZCB0aGUgcGFnZSB0YWJsZXMgaGVyZSB3aXRoCi0gICAg
ICAgICAqIHRoZSAxOjEgaW4gcGxhY2UuICovCi0KLSAgICAgICAgLyogSWYgWGVuIGlzIGxvYWRl
ZCBhdCBleGFjdGx5IFhFTl9WSVJUX1NUQVJUIHRoZW4gd2UgZG9uJ3QKKyAgICAgICAgLyoKKyAg
ICAgICAgICogSWYgWGVuIGlzIGxvYWRlZCBhdCBleGFjdGx5IFhFTl9WSVJUX1NUQVJUIHRoZW4g
d2UgZG9uJ3QKICAgICAgICAgICogbmVlZCBhbiBhZGRpdGlvbmFsIDE6MSBtYXBwaW5nLCB0aGUg
dmlydHVhbCBtYXBwaW5nIHdpbGwKICAgICAgICAgICogc3VmZmljZS4KICAgICAgICAgICovCkBA
IC00NjksNyArNDgwLDggQEAgY3JlYXRlX3BhZ2VfdGFibGVzOgogICAgICAgICBjYnogICB4MSwg
MWYgICAgICAgICAgICAgICAgIC8qIEl0J3MgaW4gc2xvdCAwLCBtYXAgaW4gYm9vdF9maXJzdAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIG9yIGJvb3Rfc2Vjb25kIGxh
dGVyIG9uICovCiAKLSAgICAgICAgLyogTGV2ZWwgemVybyBkb2VzIG5vdCBzdXBwb3J0IHN1cGVy
cGFnZSBtYXBwaW5ncywgc28gd2UgaGF2ZQorICAgICAgICAvKgorICAgICAgICAgKiBMZXZlbCB6
ZXJvIGRvZXMgbm90IHN1cHBvcnQgc3VwZXJwYWdlIG1hcHBpbmdzLCBzbyB3ZSBoYXZlCiAgICAg
ICAgICAqIHRvIHVzZSBhbiBleHRyYSBmaXJzdCBsZXZlbCBwYWdlIGluIHdoaWNoIHdlIGNyZWF0
ZSBhIDFHQiBtYXBwaW5nLgogICAgICAgICAgKi8KICAgICAgICAgbG9hZF9wYWRkciB4MiwgYm9v
dF9maXJzdF9pZAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
