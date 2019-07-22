Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D770BCB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2Y-0002Sm-MD; Mon, 22 Jul 2019 21:40:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2W-0002Ri-Et
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:12 +0000
X-Inumbo-ID: 474f1cf0-acc9-11e9-950f-87b7baaea3f8
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 474f1cf0-acc9-11e9-950f-87b7baaea3f8;
 Mon, 22 Jul 2019 21:40:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FCF0344;
 Mon, 22 Jul 2019 14:40:09 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1AA3F71F;
 Mon, 22 Jul 2019 14:40:08 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:27 +0100
Message-Id: <20190722213958.5761-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 04/35] xen/arm64: head: Rework UART
 initialization on boot CPU
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

QW55dGhpbmcgZXhlY3V0ZWQgYWZ0ZXIgdGhlIGxhYmVsIGNvbW1vbl9zdGFydCBjYW4gYmUgZXhl
Y3V0ZWQgb24gYWxsCkNQVXMuIEhvd2V2ZXIgbW9zdCBvZiB0aGUgaW5zdHJ1Y3Rpb25zIGV4ZWN1
dGVkIGJldHdlZW4gdGhlIGxhYmVsCmNvbW1vbl9zdGFydCBhbmQgaW5pdF91YXJ0IGFyZSBub3Qg
ZXhlY3V0ZWQgb24gdGhlIGJvb3QgQ1BVLgoKVGhlIG9ubHkgaW5zdHJ1Y3Rpb25zIGV4ZWN1dGVk
IGFyZSB0byBsb29rdXAgdGhlIENQVUlEIHNvIGl0IGNhbiBiZQpwcmludGVkIG9uIHRoZSBjb25z
b2xlIChpZiBlYXJseXByaW50ayBpcyBlbmFibGVkKS4gUHJpbnRpbmcgdGhlIENQVUlECmlzIG5v
dCBlbnRpcmVseSB1c2VmdWwgdG8gaGF2ZSBmb3IgdGhlIGJvb3QgQ1BVIGFuZCByZXF1aXJlcyBh
CmNvbmRpdGlvbmFsIGJyYW5jaCB0byBieXBhc3MgdW51c2VkIGluc3RydWN0aW9ucy4KCkZ1cnRo
ZXJtb3JlLCB0aGUgZnVuY3Rpb24gaW5pdF91YXJ0IGlzIG9ubHkgY2FsbGVkIGZvciBib290IENQ
VQpyZXF1aXJpbmcgYW5vdGhlciBjb25kaXRpb25hbCBicmFuY2guIFRoaXMgbWFrZXMgdGhlIGNv
ZGUgYSBiaXQgdHJpY2t5CnRvIGZvbGxvdy4KClRoZSBVQVJUIGluaXRpYWxpemF0aW9uIGlzIG5v
dyBtb3ZlZCBiZWZvcmUgdGhlIGxhYmVsIGNvbW1vbl9zdGFydC4gVGhpcwpub3cgcmVxdWlyZXMg
dG8gaGF2ZSBhIHNsaWdodGx5IGFsdGVyZWQgcHJpbnQgZm9yIHRoZSBib290IENQVSBhbmQgc2V0
CnRoZSBlYXJseSBVQVJUIGJhc2UgYWRkcmVzcyBpbiBlYWNoIHRoZSB0d28gcGF0aCAoYm9vdCBD
UFUgYW5kCnNlY29uZGFyeSBDUFVzKS4KClRoaXMgaGFzIHRoZSBuaWNlIGVmZmVjdCB0byByZW1v
dmUgYSBjb3VwbGUgb2YgY29uZGl0aW9uYWwgYnJhbmNoIGluCnRoZSBjb2RlLgoKQWZ0ZXIgdGhp
cyByZXdvcmssIHRoZSBDUFVJRCBpcyBvbmx5IHVzZWQgYXQgdGhlIHZlcnkgYmVnaW5uaW5nIG9m
IHRoZQpzZWNvbmRhcnkgQ1BVcyBib290IHBhdGguIFNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gInJl
c2VydmUiIHgyNCBmb3IgdGhlCkNQVUlELgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEZv
bGQgInhlbi9hcm02NDogaGVhZDogRG9uJ3QgInJlc2VydmUiIHgyNCBmb3IgdGhlIENQVUlEIiBp
bgogICAgICAgIHRoaXMgcGF0Y2gKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMzEg
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCmluZGV4IDZhZmU4M2MzNDcuLmI2
ODQwOTFhYWMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKKysrIGIveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtNjksNyArNjksNyBAQAogICogIHgyMSAtIERUQiBh
ZGRyZXNzIChib290IGNwdSBvbmx5KQogICogIHgyMiAtIGlzX3NlY29uZGFyeV9jcHUKICAqICB4
MjMgLSBVQVJUIGFkZHJlc3MKLSAqICB4MjQgLSBjcHVpZAorICogIHgyNCAtCiAgKiAgeDI1IC0g
aWRlbnRpdHkgbWFwIGluIHBsYWNlCiAgKiAgeDI2IC0gc2tpcF96ZXJvX2JzcwogICogIHgyNyAt
CkBAIC0yNjUsNiArMjY1LDEyIEBAIHJlYWxfc3RhcnRfZWZpOgogICAgICAgICBsb2FkX3BhZGRy
IHgyMSwgX3NkdGIKICNlbmRpZgogCisgICAgICAgIC8qIEluaXRpYWxpemUgdGhlIFVBUlQgaWYg
ZWFybHlwcmludGsgaGFzIGJlZW4gZW5hYmxlZC4gKi8KKyNpZmRlZiBDT05GSUdfRUFSTFlfUFJJ
TlRLCisgICAgICAgIGJsICAgIGluaXRfdWFydAorI2VuZGlmCisgICAgICAgIFBSSU5UKCItIEJv
b3QgQ1BVIGJvb3RpbmcgLVxyXG4iKQorCiAgICAgICAgIG1vdiAgIHgyMiwgIzAgICAgICAgICAg
ICAgICAgLyogeDIyIDo9IGlzX3NlY29uZGFyeV9jcHUgKi8KIAogICAgICAgICBiICAgICBjb21t
b25fc3RhcnQKQEAgLTI4MSwxNCArMjg3LDExIEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKICAg
ICAgICAgLyogQm9vdCBDUFUgYWxyZWFkeSB6ZXJvIEJTUyBzbyBza2lwIGl0IG9uIHNlY29uZGFy
eSBDUFVzLiAqLwogICAgICAgICBtb3YgICB4MjYsICMxICAgICAgICAgICAgICAgIC8qIFgyNiA6
PSBza2lwX3plcm9fYnNzICovCiAKLWNvbW1vbl9zdGFydDoKICAgICAgICAgbXJzICAgeDAsIG1w
aWRyX2VsMQogICAgICAgICBsZHIgICB4MTMsID0ofk1QSURSX0hXSURfTUFTSykKICAgICAgICAg
YmljICAgeDI0LCB4MCwgeDEzICAgICAgICAgICAvKiBNYXNrIG91dCBmbGFncyB0byBnZXQgQ1BV
IElEICovCiAKLSAgICAgICAgLyogTm9uLWJvb3QgQ1BVcyB3YWl0IGhlcmUgdW50aWwgX19jcHVf
dXAgaXMgcmVhZHkgZm9yIHRoZW0gKi8KLSAgICAgICAgY2J6ICAgeDIyLCAxZgotCisgICAgICAg
IC8qIFdhaXQgaGVyZSB1bnRpbCBfX2NwdV91cCBpcyByZWFkeSB0byBoYW5kbGUgdGhlIENQVSAq
LwogICAgICAgICBsb2FkX3BhZGRyIHgwLCBzbXBfdXBfY3B1CiAgICAgICAgIGRzYiAgIHN5CiAy
OiAgICAgIGxkciAgIHgxLCBbeDBdCkBAIC0zMDAsMTQgKzMwMywxNCBAQCBjb21tb25fc3RhcnQ6
CiAKICNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLCiAgICAgICAgIGxkciAgIHgyMywgPUVBUkxZ
X1VBUlRfQkFTRV9BRERSRVNTIC8qIHgyMyA6PSBVQVJUIGJhc2UgYWRkcmVzcyAqLwotICAgICAg
ICBjYm56ICB4MjIsIDFmCi0gICAgICAgIGJsICAgIGluaXRfdWFydCAgICAgICAgICAgICAgICAg
LyogQm9vdCBDUFUgc2V0cyB1cCB0aGUgVUFSVCB0b28gKi8KLTE6ICAgICAgUFJJTlQoIi0gQ1BV
ICIpCisgICAgICAgIFBSSU5UKCItIENQVSAiKQogICAgICAgICBtb3YgICB4MCwgeDI0CiAgICAg
ICAgIGJsICAgIHB1dG4KICAgICAgICAgUFJJTlQoIiBib290aW5nIC1cclxuIikKICNlbmRpZgog
Citjb21tb25fc3RhcnQ6CisKICAgICAgICAgUFJJTlQoIi0gQ3VycmVudCBFTCAiKQogICAgICAg
ICBtcnMgICB4NCwgQ3VycmVudEVMCiAgICAgICAgIG1vdiAgIHgwLCB4NApAQCAtNjIwLDEwICs2
MjMsMTYgQEAgRU5UUlkoc3dpdGNoX3R0YnIpCiAgICAgICAgIHJldAogCiAjaWZkZWYgQ09ORklH
X0VBUkxZX1BSSU5USwotLyogQnJpbmcgdXAgdGhlIFVBUlQuCi0gKiB4MjM6IEVhcmx5IFVBUlQg
YmFzZSBhZGRyZXNzCi0gKiBDbG9iYmVycyB4MC14MSAqLworLyoKKyAqIEluaXRpYWxpemUgdGhl
IFVBUlQuIFNob3VsZCBvbmx5IGJlIGNhbGxlZCBvbiB0aGUgYm9vdCBDUFUuCisgKgorICogT3Vw
dXQ6CisgKiAgeDIzOiBFYXJseSBVQVJUIGJhc2UgcGh5c2ljYWwgYWRkcmVzcworICoKKyAqIENs
b2JiZXJzIHgwIC0geDEKKyAqLwogaW5pdF91YXJ0OgorICAgICAgICBsZHIgICB4MjMsID1FQVJM
WV9VQVJUX0JBU0VfQUREUkVTUwogI2lmZGVmIEVBUkxZX1BSSU5US19JTklUX1VBUlQKICAgICAg
ICAgZWFybHlfdWFydF9pbml0IHgyMywgMAogI2VuZGlmCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
