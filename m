Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25D010C56B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 09:48:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaFQt-0005tK-03; Thu, 28 Nov 2019 08:45:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaFQq-0005t8-Mb
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 08:45:48 +0000
X-Inumbo-ID: 791ab738-11bb-11ea-a3cd-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 791ab738-11bb-11ea-a3cd-12813bfff9fa;
 Thu, 28 Nov 2019 08:45:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32A43B174;
 Thu, 28 Nov 2019 08:45:47 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu, 28 Nov 2019 09:45:45 +0100
Message-Id: <20191128084545.13831-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/events: remove event handling recursion
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
VjI6IGFkYXB0IGNvbW1pdCBtZXNzYWdlIChKYW4gQmV1bGljaCkKLS0tCiBkcml2ZXJzL3hlbi9l
dmVudHMvZXZlbnRzX2Jhc2UuYyB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNl
LmMKaW5kZXggNmM4ODQzOTY4YTUyLi4zMzIxMmM0OTRhZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
eGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNf
YmFzZS5jCkBAIC0xMjEzLDMxICsxMjEzLDIxIEBAIHZvaWQgeGVuX3NlbmRfSVBJX29uZSh1bnNp
Z25lZCBpbnQgY3B1LCBlbnVtIGlwaV92ZWN0b3IgdmVjdG9yKQogCW5vdGlmeV9yZW1vdGVfdmlh
X2lycShpcnEpOwogfQogCi1zdGF0aWMgREVGSU5FX1BFUl9DUFUodW5zaWduZWQsIHhlZF9uZXN0
aW5nX2NvdW50KTsKLQogc3RhdGljIHZvaWQgX194ZW5fZXZ0Y2huX2RvX3VwY2FsbCh2b2lkKQog
ewogCXN0cnVjdCB2Y3B1X2luZm8gKnZjcHVfaW5mbyA9IF9fdGhpc19jcHVfcmVhZCh4ZW5fdmNw
dSk7Ci0JaW50IGNwdSA9IGdldF9jcHUoKTsKLQl1bnNpZ25lZCBjb3VudDsKKwlpbnQgY3B1ID0g
c21wX3Byb2Nlc3Nvcl9pZCgpOwogCiAJZG8gewogCQl2Y3B1X2luZm8tPmV2dGNobl91cGNhbGxf
cGVuZGluZyA9IDA7CiAKLQkJaWYgKF9fdGhpc19jcHVfaW5jX3JldHVybih4ZWRfbmVzdGluZ19j
b3VudCkgLSAxKQotCQkJZ290byBvdXQ7Ci0KIAkJeGVuX2V2dGNobl9oYW5kbGVfZXZlbnRzKGNw
dSk7CiAKIAkJQlVHX09OKCFpcnFzX2Rpc2FibGVkKCkpOwogCi0JCWNvdW50ID0gX190aGlzX2Nw
dV9yZWFkKHhlZF9uZXN0aW5nX2NvdW50KTsKLQkJX190aGlzX2NwdV93cml0ZSh4ZWRfbmVzdGlu
Z19jb3VudCwgMCk7Ci0JfSB3aGlsZSAoY291bnQgIT0gMSB8fCB2Y3B1X2luZm8tPmV2dGNobl91
cGNhbGxfcGVuZGluZyk7Ci0KLW91dDoKKwkJcm1iKCk7IC8qIEh5cGVydmlzb3IgY2FuIHNldCB1
cGNhbGwgcGVuZGluZy4gKi8KIAotCXB1dF9jcHUoKTsKKwl9IHdoaWxlICh2Y3B1X2luZm8tPmV2
dGNobl91cGNhbGxfcGVuZGluZyk7CiB9CiAKIHZvaWQgeGVuX2V2dGNobl9kb191cGNhbGwoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
