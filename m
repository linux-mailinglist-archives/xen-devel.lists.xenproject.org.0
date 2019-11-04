Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5BEE1C9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 15:01:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRcsR-0006uD-1d; Mon, 04 Nov 2019 13:58:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iRcsQ-0006u7-5D
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 13:58:38 +0000
X-Inumbo-ID: 31e26734-ff0b-11e9-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31e26734-ff0b-11e9-b678-bc764e2007e4;
 Mon, 04 Nov 2019 13:58:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56D91B417;
 Mon,  4 Nov 2019 13:58:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Mon,  4 Nov 2019 14:58:12 +0100
Message-Id: <20191104135812.2314-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/events: remove event handling recursion
 detection
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
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

X194ZW5fZXZ0Y2huX2RvX3VwY2FsbCgpIGNvbnRhaW5zIGd1YXJkcyBhZ2FpbnN0IGJlaW5nIGNh
bGxlZApyZWN1cnNpdmVseS4gVGhpcyBtZWNoYW5pc20gd2FzIGludHJvZHVjZWQgaW4gdGhlIGVh
cmx5IHB2b3BzIHRpbWVzCihrZXJuZWwgMi42LjI2KSB3aGVuIHRoZXJlIHdlcmUgc3RpbGwgWGVu
IHZlcnNpb25zIGFyb3VuZCBub3QgaG9ub3JpbmcKZGlzYWJsZWQgaW50ZXJydXB0cyBmb3Igc2Vu
ZGluZyBldmVudHMgdG8gcHYgZ3Vlc3RzLgoKVGhpcyB3YXMgY2hhbmdlZCBpbiBYZW4gMy4wLCB3
aGljaCBpcyBtdWNoIG9sZGVyIHRoYW4gYW55IFhlbiB2ZXJzaW9uCnN1cHBvcnRlZCBieSB0aGUg
a2VybmVsLCBzbyB0aGUgcmVjdXJzaW9uIGRldGVjdGlvbiBjYW4gYmUgcmVtb3ZlZC4KClNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hl
bi9ldmVudHMvZXZlbnRzX2Jhc2UuYyB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19i
YXNlLmMKaW5kZXggNmM4ODQzOTY4YTUyLi4zMzIxMmM0OTRhZmQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jCkBAIC0xMjEzLDMxICsxMjEzLDIxIEBAIHZvaWQgeGVuX3NlbmRfSVBJX29uZSh1
bnNpZ25lZCBpbnQgY3B1LCBlbnVtIGlwaV92ZWN0b3IgdmVjdG9yKQogCW5vdGlmeV9yZW1vdGVf
dmlhX2lycShpcnEpOwogfQogCi1zdGF0aWMgREVGSU5FX1BFUl9DUFUodW5zaWduZWQsIHhlZF9u
ZXN0aW5nX2NvdW50KTsKLQogc3RhdGljIHZvaWQgX194ZW5fZXZ0Y2huX2RvX3VwY2FsbCh2b2lk
KQogewogCXN0cnVjdCB2Y3B1X2luZm8gKnZjcHVfaW5mbyA9IF9fdGhpc19jcHVfcmVhZCh4ZW5f
dmNwdSk7Ci0JaW50IGNwdSA9IGdldF9jcHUoKTsKLQl1bnNpZ25lZCBjb3VudDsKKwlpbnQgY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwogCiAJZG8gewogCQl2Y3B1X2luZm8tPmV2dGNobl91cGNh
bGxfcGVuZGluZyA9IDA7CiAKLQkJaWYgKF9fdGhpc19jcHVfaW5jX3JldHVybih4ZWRfbmVzdGlu
Z19jb3VudCkgLSAxKQotCQkJZ290byBvdXQ7Ci0KIAkJeGVuX2V2dGNobl9oYW5kbGVfZXZlbnRz
KGNwdSk7CiAKIAkJQlVHX09OKCFpcnFzX2Rpc2FibGVkKCkpOwogCi0JCWNvdW50ID0gX190aGlz
X2NwdV9yZWFkKHhlZF9uZXN0aW5nX2NvdW50KTsKLQkJX190aGlzX2NwdV93cml0ZSh4ZWRfbmVz
dGluZ19jb3VudCwgMCk7Ci0JfSB3aGlsZSAoY291bnQgIT0gMSB8fCB2Y3B1X2luZm8tPmV2dGNo
bl91cGNhbGxfcGVuZGluZyk7Ci0KLW91dDoKKwkJcm1iKCk7IC8qIEh5cGVydmlzb3IgY2FuIHNl
dCB1cGNhbGwgcGVuZGluZy4gKi8KIAotCXB1dF9jcHUoKTsKKwl9IHdoaWxlICh2Y3B1X2luZm8t
PmV2dGNobl91cGNhbGxfcGVuZGluZyk7CiB9CiAKIHZvaWQgeGVuX2V2dGNobl9kb191cGNhbGwo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
