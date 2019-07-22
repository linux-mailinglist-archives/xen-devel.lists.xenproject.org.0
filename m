Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B070BDA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:43:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2z-0003M5-Jl; Mon, 22 Jul 2019 21:40:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2r-00035e-KO
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:33 +0000
X-Inumbo-ID: 552bfa33-acc9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 552bfa33-acc9-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 21:40:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB68D1595;
 Mon, 22 Jul 2019 14:40:32 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2546F3F71F;
 Mon, 22 Jul 2019 14:40:32 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:53 +0100
Message-Id: <20190722213958.5761-31-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 30/35] xen/arm32: head: Don't setup the
 fixmap on secondary CPUs
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

c2V0dXBfZml4bWFwKCkgd2lsbCBzZXR1cCB0aGUgZml4bWFwIGluIHRoZSBib290IHBhZ2UgdGFi
bGVzIGluIG9yZGVyIHRvCnVzZSBlYXJseXByaW50ayBhbmQgYWxzbyB1cGRhdGUgdGhlIHJlZ2lz
dGVyIHIxMSBob2xkaW5nIHRoZSBhZGRyZXNzIHRvCnRoZSBVQVJULgoKSG93ZXZlciwgc2Vjb25k
YXJ5IENQVXMgYXJlIG5vdCB1c2luZyBlYXJseXByaW50ayBiZXR3ZWVuIHR1cm5pbmcgdGhlCk1N
VSBvbiBhbmQgc3dpdGNoaW5nIHRvIHRoZSBydW50aW1lIHBhZ2UgdGFibGUuIFNvIHNldHRpbmcg
dXAgdGhlCmZpeG1hcCBpbiB0aGUgYm9vdCBwYWdlcyB0YWJsZSBpcyBwb2ludGxlc3MuCgpUaGlz
IG1lYW5zIG1vc3Qgb2Ygc2V0dXBfZml4bWFwKCkgaXMgbm90IG5lY2Vzc2FyeSBmb3IgdGhlIHNl
Y29uZGFyeQpDUFVzLiBUaGUgdXBkYXRlIG9mIFVBUlQgYWRkcmVzcyBpcyBub3cgbW92ZWQgb3V0
IG9mIHNldHVwX2ZpeG1hcCgpIGFuZApkdXBsaWNhdGVkIGluIHRoZSBDUFUgYm9vdCBhbmQgc2Vj
b25kYXJ5IENQVXMgYm9vdC4gQWRkaXRpb25hbGx5LCB0aGUKY2FsbCB0byBzZXR1cF9maXhtYXAo
KSBpcyByZW1vdmVkIGZyb20gc2Vjb25kYXJ5IENQVXMgYm9vdC4KCkxhc3RseSwgdGFrZSB0aGUg
b3Bwb3J0dW5pdHkgdG8gcmVwbGFjZSBsb2FkIGZyb20gbGl0ZXJhbCBwb29sIHdpdGggdGhlCm5l
dyBtYWNybyBtb3Zfdy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBQYXRjaCBhZGRlZAot
LS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAyMCArKysrKysrKy0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMKaW5kZXggNmRjNjAzMjQ5OC4uMGE1YzNhODUyNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJt
L2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC0xNTksNiAr
MTU5LDEwIEBAIHBhc3RfekltYWdlOgogICAgICAgICBtb3YgICBwYywgcjAKIHByaW1hcnlfc3dp
dGNoZWQ6CiAgICAgICAgIGJsICAgIHNldHVwX2ZpeG1hcAorI2lmZGVmIENPTkZJR19FQVJMWV9Q
UklOVEsKKyAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRyZXNzIHRvIGFjY2VzcyB0aGUgVUFS
VC4gKi8KKyAgICAgICAgbW92X3cgcjExLCBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUworI2Vu
ZGlmCiAgICAgICAgIGIgICAgIGxhdW5jaAogRU5EUFJPQyhzdGFydCkKIApAQCAtMjAwLDggKzIw
NCw2IEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKICAgICAgICAgbGRyICAgcjAsID1zZWNvbmRh
cnlfc3dpdGNoZWQKICAgICAgICAgbW92ICAgcGMsIHIwCiBzZWNvbmRhcnlfc3dpdGNoZWQ6Ci0g
ICAgICAgIGJsICAgIHNldHVwX2ZpeG1hcAotCiAgICAgICAgIC8qCiAgICAgICAgICAqIE5vbi1i
b290IENQVXMgbmVlZCB0byBtb3ZlIG9uIHRvIHRoZSBwcm9wZXIgcGFnZXRhYmxlcywgd2hpY2gg
d2VyZQogICAgICAgICAgKiBzZXR1cCBpbiBpbml0X3NlY29uZGFyeV9wYWdldGFibGVzLgpAQCAt
MjIxLDYgKzIyMywxMCBAQCBzZWNvbmRhcnlfc3dpdGNoZWQ6CiAgICAgICAgIGRzYiAgICAgICAg
ICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRpb24gb2YgVExCK0JQIGZsdXNoICov
CiAgICAgICAgIGlzYgogCisjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USworICAgICAgICAvKiBV
c2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJULiAqLworICAgICAgICBtb3Zf
dyByMTEsIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTCisjZW5kaWYKICAgICAgICAgYiAgICAg
bGF1bmNoCiBFTkRQUk9DKGluaXRfc2Vjb25kYXJ5KQogCkBAIC00NzUsMTMgKzQ4MSw2IEBAIHNl
dHVwX2ZpeG1hcDoKICAgICAgICAgICovCiAgICAgICAgIGRzYgogI2lmIGRlZmluZWQoQ09ORklH
X0VBUkxZX1BSSU5USykgLyogRml4bWFwIGlzIG9ubHkgdXNlZCBieSBlYXJseSBwcmludGsgKi8K
LSAgICAgICAgLyoKLSAgICAgICAgICogTm9uLWJvb3QgQ1BVcyBkb24ndCBuZWVkIHRvIHJlYnVp
bGQgdGhlIGZpeG1hcCBpdHNlbGYsIGp1c3QKLSAgICAgICAgICogdGhlIG1hcHBpbmcgZnJvbSBi
b290X3NlY29uZCB0byB4ZW5fZml4bWFwCi0gICAgICAgICAqLwotICAgICAgICB0ZXEgICByMTIs
ICMwCi0gICAgICAgIGJuZSAgIDFmCi0KICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1h
cCB0YWJsZSAqLwogICAgICAgICBsZHIgICByMSwgPXhlbl9maXhtYXAgICAgICAgIC8qIHIxIDo9
IHZhZGRyICh4ZW5fZml4bWFwKSAqLwogICAgICAgICBsc3IgICByMiwgcjExLCAjVEhJUkRfU0hJ
RlQKQEAgLTUwMiw5ICs1MDEsNiBAQCBzZXR1cF9maXhtYXA6CiAgICAgICAgIG1vdiAgIHI0LCBy
NCwgbHNyICMoU0VDT05EX1NISUZUIC0gMykgICAvKiByNCA6PSBTbG90IGZvciBGSVhNQVAoMCkg
Ki8KICAgICAgICAgbW92ICAgcjMsICMweDAKICAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjEsIHI0
XSAgICAgICAvKiBNYXAgaXQgaW4gdGhlIGZpeG1hcCdzIHNsb3QgKi8KLQotICAgICAgICAvKiBV
c2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJULiAqLwotICAgICAgICBsZHIg
ICByMTEsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwogI2VuZGlmCiAKICAgICAgICAgLyoK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
