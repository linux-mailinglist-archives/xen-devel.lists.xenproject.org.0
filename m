Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5493BCF7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:35:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ24-0007pG-6B; Mon, 10 Jun 2019 19:32:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ21-0007mv-Op
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:37 +0000
X-Inumbo-ID: 7f51d9fa-8bb6-11e9-99cd-e7629283a8cb
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7f51d9fa-8bb6-11e9-99cd-e7629283a8cb;
 Mon, 10 Jun 2019 19:32:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AF41344;
 Mon, 10 Jun 2019 12:32:34 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2AED3F73C;
 Mon, 10 Jun 2019 12:32:33 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:11 +0100
Message-Id: <20190610193215.23704-14-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 13/17] xen/arm64: head: Don't setup the fixmap
 on secondary CPUs
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

c2V0dXBfZml4bWFwKCkgd2lsbCBzZXR1cCB0aGUgZml4bWFwIGluIHRoZSBib290IHBhZ2UgdGFi
bGVzIGluIG9yZGVyIHRvCnVzZSBlYXJseXByaW50ayBhbmQgYWxzbyB1cGRhdGUgdGhlIHJlZ2lz
dGVyIHgyMyBob2xkaW5nIHRoZSBhZGRyZXNzIHRvCnRoZSBVQVJULgoKSG93ZXZlciwgc2Vjb25k
YXJ5IENQVXMgYXJlIHN3aXRjaGluZyB0byB0aGUgcnVudGltZSBwYWdlIHRhYmxlcyBiZWZvcmUK
dXNpbmcgdGhlIGVhcmx5cHJpbnRrIGFnYWluLiBTbyBzZXR0dGluZyB1cCB0aGUgZml4bWFwIGlu
IHRoZSBib290IHBhZ2VzCnRhYmxlcyBpcyBwb2ludGxlc3MuCgpUaGlzIG1lYW5zIG1vc3Qgb2Yg
c2V0dXBfZml4bWFwKCkgaXMgbm90IG5lY2Vzc2FyeSBmb3IgdGhlIHNlY29uZGFyeQpDUFVzLiBU
aGUgdXBkYXRlIG9mIFVBUlQgYWRkcmVzcyBpcyBub3cgbW92ZWQgb3V0IG9mIHNldHVwX2ZpeG1h
cCgpIGFuZApkdXBsaWNhdGVkIGluIHRoZSBDUFUgYm9vdCBhbmQgc2Vjb25kYXJ5IENQVXMgYm9v
dC4gQWRkaXRpb25hbGx5LCB0aGUKY2FsbCB0byBzZXR1cF9maXhtYXAoKSBpcyByZW1vdmVkIGZy
b20gc2Vjb25kYXJ5IENQVXMgYm9vdC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDE4ICsr
KysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMKaW5kZXggNmJlNGFmNzU3OS4uMTkyYWYzZThhMiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCkBAIC0zMDEsNiArMzAxLDEwIEBAIHJlYWxfc3RhcnRfZWZpOgogICAgICAgICBiciAg
ICB4MAogcHJpbWFyeV9zd2l0Y2hlZDoKICAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCisjaWZk
ZWYgQ09ORklHX0VBUkxZX1BSSU5USworICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3Mg
dG8gYWNjZXNzIHRoZSBVQVJULiAqLworICAgICAgICBsZHIgICB4MjMsID1FQVJMWV9VQVJUX1ZJ
UlRVQUxfQUREUkVTUworI2VuZGlmCiAgICAgICAgIGIgICAgIGxhdW5jaAogRU5EUFJPQyhyZWFs
X3N0YXJ0KQogCkBAIC0zNDMsOCArMzQ3LDYgQEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQogICAg
ICAgICBsZHIgICB4MCwgPXNlY29uZGFyeV9zd2l0Y2hlZAogICAgICAgICBiciAgICB4MAogc2Vj
b25kYXJ5X3N3aXRjaGVkOgotICAgICAgICBibCAgICBzZXR1cF9maXhtYXAKLQogICAgICAgICAv
KgogICAgICAgICAgKiBOb24tYm9vdCBDUFVzIG5lZWQgdG8gbW92ZSBvbiB0byB0aGUgcHJvcGVy
IHBhZ2V0YWJsZXMsIHdoaWNoIHdlcmUKICAgICAgICAgICogc2V0dXAgaW4gaW5pdF9zZWNvbmRh
cnlfcGFnZXRhYmxlcy4KQEAgLTM2MSw2ICszNjMsMTAgQEAgc2Vjb25kYXJ5X3N3aXRjaGVkOgog
ICAgICAgICBkc2IgICBzeSAgICAgICAgICAgICAgICAgICAgIC8qIEVuc3VyZSBjb21wbGV0aW9u
IG9mIFRMQiBmbHVzaCAqLwogICAgICAgICBpc2IKIAorI2lmZGVmIENPTkZJR19FQVJMWV9QUklO
VEsKKyAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4g
Ki8KKyAgICAgICAgbGRyICAgeDIzLCA9RUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKKyNlbmRp
ZgogICAgICAgICBiICAgICBsYXVuY2gKIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCiAKQEAgLTYz
MSwxMCArNjM3LDYgQEAgc2V0dXBfZml4bWFwOgogICAgICAgICAgKiBkb24ndCBuZWVkIHRoZSAx
OjEgbWFwIGFueSBtb3JlICovCiAgICAgICAgIGRzYiAgIHN5CiAjaWYgZGVmaW5lZChDT05GSUdf
RUFSTFlfUFJJTlRLKSAvKiBGaXhtYXAgaXMgb25seSB1c2VkIGJ5IGVhcmx5IHByaW50ayAqLwot
ICAgICAgICAvKiBOb24tYm9vdCBDUFVzIGRvbid0IG5lZWQgdG8gcmVidWlsZCB0aGUgZml4bWFw
IGl0c2VsZiwganVzdAotICAgICAgICAgKiB0aGUgbWFwcGluZyBmcm9tIGJvb3Rfc2Vjb25kIHRv
IHhlbl9maXhtYXAgKi8KLSAgICAgICAgY2JueiAgeDIyLCAxZgotCiAgICAgICAgIC8qIEFkZCBV
QVJUIHRvIHRoZSBmaXhtYXAgdGFibGUgKi8KICAgICAgICAgbGRyICAgeDEsID14ZW5fZml4bWFw
ICAgICAgICAvKiB4MSA6PSB2YWRkciAoeGVuX2ZpeG1hcCkgKi8KICAgICAgICAgbHNyICAgeDIs
IHgyMywgI1RISVJEX1NISUZUCkBAIC02NDIsNyArNjQ0LDYgQEAgc2V0dXBfZml4bWFwOgogICAg
ICAgICBtb3YgICB4MywgI1BUX0RFVl9MMwogICAgICAgICBvcnIgICB4MiwgeDIsIHgzICAgICAg
ICAgICAgIC8qIHgyIDo9IDRLIGRldiBtYXAgaW5jbHVkaW5nIFVBUlQgKi8KICAgICAgICAgc3Ry
ICAgeDIsIFt4MSwgIyhGSVhNQVBfQ09OU09MRSo4KV0gLyogTWFwIGl0IGluIHRoZSBmaXJzdCBm
aXhtYXAncyBzbG90ICovCi0xOgogCiAgICAgICAgIC8qIE1hcCBmaXhtYXAgaW50byBib290X3Nl
Y29uZCAqLwogICAgICAgICBsZHIgICB4NCwgPWJvb3Rfc2Vjb25kICAgICAgIC8qIHg0IDo9IHZh
ZGRyIChib290X3NlY29uZCkgKi8KQEAgLTY1Miw5ICs2NTMsNiBAQCBzZXR1cF9maXhtYXA6CiAg
ICAgICAgIGxkciAgIHgxLCA9RklYTUFQX0FERFIoMCkKICAgICAgICAgbHNyICAgeDEsIHgxLCAj
KFNFQ09ORF9TSElGVCAtIDMpICAgLyogeDEgOj0gU2xvdCBmb3IgRklYTUFQKDApICovCiAgICAg
ICAgIHN0ciAgIHgyLCBbeDQsIHgxXSAgICAgICAgICAgLyogTWFwIGl0IGluIHRoZSBmaXhtYXAn
cyBzbG90ICovCi0KLSAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0
aGUgVUFSVC4gKi8KLSAgICAgICAgbGRyICAgeDIzLCA9RUFSTFlfVUFSVF9WSVJUVUFMX0FERFJF
U1MKICNlbmRpZgogCiAgICAgICAgIC8qCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
