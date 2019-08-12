Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF528B05A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:59:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQj5-00046F-Fz; Tue, 13 Aug 2019 06:56:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxQj4-00045J-9J
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:56:10 +0000
X-Inumbo-ID: ea194f92-bd26-11e9-bd8c-07b407aedc9a
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ea194f92-bd26-11e9-bd8c-07b407aedc9a;
 Mon, 12 Aug 2019 17:30:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F22F174E;
 Mon, 12 Aug 2019 10:30:44 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD98E3F706;
 Mon, 12 Aug 2019 10:30:43 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:10 +0100
Message-Id: <20190812173019.11956-20-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 19/28] xen/arm32: head: Don't setup the
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
QGFybS5jb20+ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgotLS0KICAgIENoYW5nZXMgaW4gdjM6CiAgICAgICAgLSBBZGQgU3RlZmFubydz
IHJldmlld2VkLWJ5CgogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0t
LQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDIwICsrKysrKysrLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
UwppbmRleCAwYzk1ZDFjNDMyLi44Zjk0NWQzMThhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKQEAgLTE1OSw2ICsx
NTksMTAgQEAgcGFzdF96SW1hZ2U6CiAgICAgICAgIG1vdiAgIHBjLCByMAogcHJpbWFyeV9zd2l0
Y2hlZDoKICAgICAgICAgYmwgICAgc2V0dXBfZml4bWFwCisjaWZkZWYgQ09ORklHX0VBUkxZX1BS
SU5USworICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBVQVJU
LiAqLworICAgICAgICBtb3ZfdyByMTEsIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTCisjZW5k
aWYKICAgICAgICAgYiAgICAgbGF1bmNoCiBFTkRQUk9DKHN0YXJ0KQogCkBAIC0yMDEsOCArMjA1
LDYgQEAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQogICAgICAgICBsZHIgICByMCwgPXNlY29uZGFy
eV9zd2l0Y2hlZAogICAgICAgICBtb3YgICBwYywgcjAKIHNlY29uZGFyeV9zd2l0Y2hlZDoKLSAg
ICAgICAgYmwgICAgc2V0dXBfZml4bWFwCi0KICAgICAgICAgLyoKICAgICAgICAgICogTm9uLWJv
b3QgQ1BVcyBuZWVkIHRvIG1vdmUgb24gdG8gdGhlIHByb3BlciBwYWdldGFibGVzLCB3aGljaCB3
ZXJlCiAgICAgICAgICAqIHNldHVwIGluIGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJsZXMuCkBAIC0y
MjEsNiArMjIzLDEwIEBAIHNlY29uZGFyeV9zd2l0Y2hlZDoKICAgICAgICAgZHNiICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiBFbnN1cmUgY29tcGxldGlvbiBvZiBUTEIrQlAgZmx1c2ggKi8K
ICAgICAgICAgaXNiCiAKKyNpZmRlZiBDT05GSUdfRUFSTFlfUFJJTlRLCisgICAgICAgIC8qIFVz
ZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQuICovCisgICAgICAgIG1vdl93
IHIxMSwgRUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKKyNlbmRpZgogICAgICAgICBiICAgICBs
YXVuY2gKIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCiAKQEAgLTQ3NSwxMyArNDgxLDYgQEAgc2V0
dXBfZml4bWFwOgogICAgICAgICAgKi8KICAgICAgICAgZHNiCiAjaWYgZGVmaW5lZChDT05GSUdf
RUFSTFlfUFJJTlRLKSAvKiBGaXhtYXAgaXMgb25seSB1c2VkIGJ5IGVhcmx5IHByaW50ayAqLwot
ICAgICAgICAvKgotICAgICAgICAgKiBOb24tYm9vdCBDUFVzIGRvbid0IG5lZWQgdG8gcmVidWls
ZCB0aGUgZml4bWFwIGl0c2VsZiwganVzdAotICAgICAgICAgKiB0aGUgbWFwcGluZyBmcm9tIGJv
b3Rfc2Vjb25kIHRvIHhlbl9maXhtYXAKLSAgICAgICAgICovCi0gICAgICAgIHRlcSAgIHIxMiwg
IzAKLSAgICAgICAgYm5lICAgMWYKLQogICAgICAgICAvKiBBZGQgVUFSVCB0byB0aGUgZml4bWFw
IHRhYmxlICovCiAgICAgICAgIGxkciAgIHIxLCA9eGVuX2ZpeG1hcCAgICAgICAgLyogcjEgOj0g
dmFkZHIgKHhlbl9maXhtYXApICovCiAgICAgICAgIGxzciAgIHIyLCByMTEsICNUSElSRF9TSElG
VApAQCAtNTAyLDkgKzUwMSw2IEBAIHNldHVwX2ZpeG1hcDoKICAgICAgICAgbW92ICAgcjQsIHI0
LCBsc3IgIyhTRUNPTkRfU0hJRlQgLSAzKSAgIC8qIHI0IDo9IFNsb3QgZm9yIEZJWE1BUCgwKSAq
LwogICAgICAgICBtb3YgICByMywgIzB4MAogICAgICAgICBzdHJkICByMiwgcjMsIFtyMSwgcjRd
ICAgICAgIC8qIE1hcCBpdCBpbiB0aGUgZml4bWFwJ3Mgc2xvdCAqLwotCi0gICAgICAgIC8qIFVz
ZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQuICovCi0gICAgICAgIGxkciAg
IHIxMSwgPUVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTCiAjZW5kaWYKIAogICAgICAgICAvKgot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
