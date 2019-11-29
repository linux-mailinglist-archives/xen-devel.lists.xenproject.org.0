Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C1610D5C8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:43:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iafYp-0006pL-Pv; Fri, 29 Nov 2019 12:39:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lAOS=ZV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iafYo-0006pF-8h
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:39:46 +0000
X-Inumbo-ID: 5206f3ba-12a5-11ea-a3e5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5206f3ba-12a5-11ea-a3e5-12813bfff9fa;
 Fri, 29 Nov 2019 12:39:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BCA62ACE0;
 Fri, 29 Nov 2019 12:39:43 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Fri, 29 Nov 2019 13:39:41 +0100
Message-Id: <20191129123941.11975-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3] xen/events: remove event handling recursion
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
cmx5IHB2b3BzIHRpbWVzCihrZXJuZWwgMi42LjI2KSB3aGVuIHRoZXJlIHdlcmUgYWxsIHRoZSBY
ZW4gYmFja2VuZCBkcml2ZXJzIG1pc3NpbmcKZnJvbSB0aGUgdXBzdHJlYW0ga2VybmVsLCBhbmQg
c29tZSBvZiB0aG9zZSBvdXQtb2YtdHJlZSBkcml2ZXJzIHdlcmUKZW5hYmxpbmcgaW50ZXJydXB0
cyBpbiB0aGVpciBldmVudCBoYW5kbGVycyAod2hpY2ggd2FzIGV4cGxpY2l0bHkKYWxsb3dlZCBp
biB0aGUgaW5pdGlhbCBYZW5vTGludXgpLgoKTm93YWRheXMgd2UgZG9uJ3QgbmVlZCB0byBzdXBw
b3J0IHRob3NlIG9sZCBkcml2ZXJzIGFueSBtb3JlIGFuZCB0aGUKY2FwYWJpbGl0eSB0byBhbGxv
dyByZWN1cnNpdmUgY2FsbHMgb2YgX194ZW5fZXZ0Y2huX2RvX3VwY2FsbCgpIGNhbgpiZSByZW1v
dmVkLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
VjI6IGFkYXB0IGNvbW1pdCBtZXNzYWdlIChKYW4gQmV1bGljaCkKVjM6IHJtYigpIC0+IHZpcnRf
cm1iKCkgKEJvcmlzIE9zdHJvdnNreSkKLS0tCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jh
c2UuYyB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKaW5kZXggNmM4ODQz
OTY4YTUyLi40OTllZmY3ZDNmNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVu
dHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCkBAIC0xMjEz
LDMxICsxMjEzLDIxIEBAIHZvaWQgeGVuX3NlbmRfSVBJX29uZSh1bnNpZ25lZCBpbnQgY3B1LCBl
bnVtIGlwaV92ZWN0b3IgdmVjdG9yKQogCW5vdGlmeV9yZW1vdGVfdmlhX2lycShpcnEpOwogfQog
Ci1zdGF0aWMgREVGSU5FX1BFUl9DUFUodW5zaWduZWQsIHhlZF9uZXN0aW5nX2NvdW50KTsKLQog
c3RhdGljIHZvaWQgX194ZW5fZXZ0Y2huX2RvX3VwY2FsbCh2b2lkKQogewogCXN0cnVjdCB2Y3B1
X2luZm8gKnZjcHVfaW5mbyA9IF9fdGhpc19jcHVfcmVhZCh4ZW5fdmNwdSk7Ci0JaW50IGNwdSA9
IGdldF9jcHUoKTsKLQl1bnNpZ25lZCBjb3VudDsKKwlpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9p
ZCgpOwogCiAJZG8gewogCQl2Y3B1X2luZm8tPmV2dGNobl91cGNhbGxfcGVuZGluZyA9IDA7CiAK
LQkJaWYgKF9fdGhpc19jcHVfaW5jX3JldHVybih4ZWRfbmVzdGluZ19jb3VudCkgLSAxKQotCQkJ
Z290byBvdXQ7Ci0KIAkJeGVuX2V2dGNobl9oYW5kbGVfZXZlbnRzKGNwdSk7CiAKIAkJQlVHX09O
KCFpcnFzX2Rpc2FibGVkKCkpOwogCi0JCWNvdW50ID0gX190aGlzX2NwdV9yZWFkKHhlZF9uZXN0
aW5nX2NvdW50KTsKLQkJX190aGlzX2NwdV93cml0ZSh4ZWRfbmVzdGluZ19jb3VudCwgMCk7Ci0J
fSB3aGlsZSAoY291bnQgIT0gMSB8fCB2Y3B1X2luZm8tPmV2dGNobl91cGNhbGxfcGVuZGluZyk7
Ci0KLW91dDoKKwkJdmlydF9ybWIoKTsgLyogSHlwZXJ2aXNvciBjYW4gc2V0IHVwY2FsbCBwZW5k
aW5nLiAqLwogCi0JcHV0X2NwdSgpOworCX0gd2hpbGUgKHZjcHVfaW5mby0+ZXZ0Y2huX3VwY2Fs
bF9wZW5kaW5nKTsKIH0KIAogdm9pZCB4ZW5fZXZ0Y2huX2RvX3VwY2FsbChzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
