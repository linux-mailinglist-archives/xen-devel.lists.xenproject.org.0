Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68418587E5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 19:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgXjh-0004CF-GG; Thu, 27 Jun 2019 16:59:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZxQ=U2=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1hgXjf-0004CA-P5
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 16:58:59 +0000
X-Inumbo-ID: db0b6970-98fc-11e9-8a29-afeaacfaa1ce
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id db0b6970-98fc-11e9-8a29-afeaacfaa1ce;
 Thu, 27 Jun 2019 16:58:58 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgXjZ-000846-Sc; Thu, 27 Jun 2019 16:58:53 +0000
From: Colin King <colin.king@canonical.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org
Date: Thu, 27 Jun 2019 17:58:53 +0100
Message-Id: <20190627165853.21864-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] ALSA: xen-front: fix unintention integer
 overflow on left shifts
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClNoaWZ0aW5n
IHRoZSBpbnRlZ2VyIHZhbHVlIDEgaXMgZXZhbHVhdGVkIHVzaW5nIDMyLWJpdAphcml0aG1ldGlj
IGFuZCB0aGVuIHVzZWQgaW4gYW4gZXhwcmVzc2lvbiB0aGF0IGV4cGVjdHMgYSA2NC1iaXQKdmFs
dWUsIHNvIHRoZXJlIGlzIHBvdGVudGlhbGx5IGFuIGludGVnZXIgb3ZlcmZsb3cuIEZpeCB0aGlz
CmJ5IHVzaW5nIHRoZSBCSVRfVUxMIG1hY3JvIHRvIHBlcmZvcm0gdGhlIHNoaWZ0LgoKQWRkcmVz
c2VzLUNvdmVyaXR5OiAoIlVuaW50ZW50aW9uYWwgaW50ZWdlciBvdmVyZmxvdyIpClNpZ25lZC1v
ZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogc291
bmQveGVuL3hlbl9zbmRfZnJvbnRfYWxzYS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3hlbi94ZW5f
c25kX2Zyb250X2Fsc2EuYyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYwppbmRleCBi
MTRhYjUxMmMyY2UuLmUwMTYzMTk1OWVkOCAxMDA2NDQKLS0tIGEvc291bmQveGVuL3hlbl9zbmRf
ZnJvbnRfYWxzYS5jCisrKyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYwpAQCAtMTk2
LDcgKzE5Niw3IEBAIHN0YXRpYyB1NjQgdG9fc25kaWZfZm9ybWF0c19tYXNrKHU2NCBhbHNhX2Zv
cm1hdHMpCiAJbWFzayA9IDA7CiAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoQUxTQV9TTkRJ
Rl9GT1JNQVRTKTsgaSsrKQogCQlpZiAocGNtX2Zvcm1hdF90b19iaXRzKEFMU0FfU05ESUZfRk9S
TUFUU1tpXS5hbHNhKSAmIGFsc2FfZm9ybWF0cykKLQkJCW1hc2sgfD0gMSA8PCBBTFNBX1NORElG
X0ZPUk1BVFNbaV0uc25kaWY7CisJCQltYXNrIHw9IEJJVF9VTEwoQUxTQV9TTkRJRl9GT1JNQVRT
W2ldLnNuZGlmKTsKIAogCXJldHVybiBtYXNrOwogfQpAQCAtMjA4LDcgKzIwOCw3IEBAIHN0YXRp
YyB1NjQgdG9fYWxzYV9mb3JtYXRzX21hc2sodTY0IHNuZGlmX2Zvcm1hdHMpCiAKIAltYXNrID0g
MDsKIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShBTFNBX1NORElGX0ZPUk1BVFMpOyBpKysp
Ci0JCWlmICgxIDw8IEFMU0FfU05ESUZfRk9STUFUU1tpXS5zbmRpZiAmIHNuZGlmX2Zvcm1hdHMp
CisJCWlmIChCSVRfVUxMKEFMU0FfU05ESUZfRk9STUFUU1tpXS5zbmRpZikgJiBzbmRpZl9mb3Jt
YXRzKQogCQkJbWFzayB8PSBwY21fZm9ybWF0X3RvX2JpdHMoQUxTQV9TTkRJRl9GT1JNQVRTW2ld
LmFsc2EpOwogCiAJcmV0dXJuIG1hc2s7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
