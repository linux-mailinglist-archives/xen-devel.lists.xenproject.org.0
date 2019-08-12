Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2708B03B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:55:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQgl-0002Cg-PD; Tue, 13 Aug 2019 06:53:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQgk-0002CC-Ll
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:53:46 +0000
X-Inumbo-ID: e19da1ba-bd26-11e9-a064-c7d14abe968e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e19da1ba-bd26-11e9-a064-c7d14abe968e;
 Mon, 12 Aug 2019 17:30:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF6D1993;
 Mon, 12 Aug 2019 10:30:29 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 487E93F706;
 Mon, 12 Aug 2019 10:30:29 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:29:54 +0100
Message-Id: <20190812173019.11956-4-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 03/28] xen/arm64: head: Rework and document
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
eXMKaG9va2VkIGJlZm9yZSBhbnkgdXNlLiBMZXQncyBzdGFydCBkb2luZyBpdCBub3cgaW4gc2V0
dXBfZml4bWFwKCkuCgpMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4g
cmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUKZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYzOgogICAg
ICAgIC0gRml4IHR5cG8gaW4gdGhlIGNvbW1pdCBtZXNzYWdlCiAgICAgICAgLSBBZGQgU3RlZmFu
bydzIEFja2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFVwZGF0ZSB0aGUgY29t
bWVudCB0byByZWZsZWN0IHRoYXQgd2UgY2xvYmJlcnMgeDEgLSB4NCBhbmQgbm90CiAgICAgICAg
eDAgLSB4MS4KICAgICAgICAtIEFkZCB0aGUgbGlzdCBvZiBpbnB1dCByZWdpc3RlcnMKICAgICAg
ICAtIHMvSUQgbWFwLzE6MSBtYXBwaW5nLwogICAgICAgIC0gUmV3b3JkIHRoZSBjb21taXQgbWVz
c2FnZQotLS0KIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgfCAxOCArKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCmluZGV4IGVjMTM4YWFlM2UuLjdiNmI4MjA3MjYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtNzAy
LDggKzcwMiwyMSBAQCBpZGVudGl0eV9tYXBwaW5nX3JlbW92ZWQ6CiAgICAgICAgIHJldAogRU5E
UFJPQyhyZW1vdmVfaWRlbnRpdHlfbWFwcGluZykKIAorLyoKKyAqIE1hcCB0aGUgVUFSVCBpbiB0
aGUgZml4bWFwICh3aGVuIGVhcmx5cHJpbnRrIGlzIHVzZWQpIGFuZCBob29rIHRoZQorICogZml4
bWFwIHRhYmxlIGluIHRoZSBwYWdlIHRhYmxlcy4KKyAqCisgKiBUaGUgZml4bWFwIGNhbm5vdCBi
ZSBtYXBwZWQgaW4gY3JlYXRlX3BhZ2VfdGFibGVzIGJlY2F1c2UgaXQgbWF5CisgKiBjbGFzaCB3
aXRoIHRoZSAxOjEgbWFwcGluZy4KKyAqCisgKiBJbnB1dHM6CisgKiAgIHgyMDogUGh5c2ljYWwg
b2Zmc2V0CisgKiAgIHgyMzogRWFybHkgVUFSVCBiYXNlIHBoeXNpY2FsIGFkZHJlc3MKKyAqCisg
KiBDbG9iYmVycyB4MSAtIHg0CisgKi8KIHNldHVwX2ZpeG1hcDoKLSNpZiBkZWZpbmVkKENPTkZJ
R19FQVJMWV9QUklOVEspIC8qIEZpeG1hcCBpcyBvbmx5IHVzZWQgYnkgZWFybHkgcHJpbnRrICov
CisjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwogICAgICAgICAvKiBBZGQgVUFSVCB0byB0aGUg
Zml4bWFwIHRhYmxlICovCiAgICAgICAgIGxkciAgIHgxLCA9eGVuX2ZpeG1hcCAgICAgICAgLyog
eDEgOj0gdmFkZHIgKHhlbl9maXhtYXApICovCiAgICAgICAgIGxzciAgIHgyLCB4MjMsICNUSElS
RF9TSElGVApAQCAtNzExLDYgKzcyNCw3IEBAIHNldHVwX2ZpeG1hcDoKICAgICAgICAgbW92ICAg
eDMsICNQVF9ERVZfTDMKICAgICAgICAgb3JyICAgeDIsIHgyLCB4MyAgICAgICAgICAgICAvKiB4
MiA6PSA0SyBkZXYgbWFwIGluY2x1ZGluZyBVQVJUICovCiAgICAgICAgIHN0ciAgIHgyLCBbeDEs
ICMoRklYTUFQX0NPTlNPTEUqOCldIC8qIE1hcCBpdCBpbiB0aGUgZmlyc3QgZml4bWFwJ3Mgc2xv
dCAqLworI2VuZGlmCiAKICAgICAgICAgLyogTWFwIGZpeG1hcCBpbnRvIGJvb3Rfc2Vjb25kICov
CiAgICAgICAgIGxkciAgIHg0LCA9Ym9vdF9zZWNvbmQgICAgICAgLyogeDQgOj0gdmFkZHIgKGJv
b3Rfc2Vjb25kKSAqLwpAQCAtNzIzLDcgKzczNyw3IEBAIHNldHVwX2ZpeG1hcDoKIAogICAgICAg
ICAvKiBFbnN1cmUgYW55IHBhZ2UgdGFibGUgdXBkYXRlcyBtYWRlIGFib3ZlIGhhdmUgb2NjdXJy
ZWQuICovCiAgICAgICAgIGRzYiAgIG5zaHN0Ci0jZW5kaWYKKwogICAgICAgICByZXQKIEVORFBS
T0Moc2V0dXBfZml4bWFwKQogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
