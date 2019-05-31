Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A825430D9F
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 13:56:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWg5u-00019e-Gq; Fri, 31 May 2019 11:53:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWg5s-00019Z-8F
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 11:53:08 +0000
X-Inumbo-ID: a6dce80c-839a-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a6dce80c-839a-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 11:53:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6388DAEC2;
 Fri, 31 May 2019 11:53:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 31 May 2019 13:53:03 +0200
Message-Id: <20190531115303.16459-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen: remove on-stack cpumask from
 stop_machine_run()
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlICJhbGxidXRzZWxmIiBjcHVtYXNrIGluIHN0b3BfbWFjaGluZV9ydW4oKSBpcyBub3QgbmVl
ZGVkLiBJbnN0ZWFkCm9mIGFsbG9jYXRpbmcgaXQgb24gdGhlIHN0YWNrIGl0IGNhbiBlYXNpbHkg
YmUgYXZvaWRlZC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCiB4ZW4vY29tbW9uL3N0b3BfbWFjaGluZS5jIHwgMTMgKysrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3N0b3BfbWFjaGluZS5jIGIveGVuL2NvbW1vbi9zdG9wX21hY2hpbmUuYwpp
bmRleCBjZTZmNTYyNGM0Li43NGQwNDQyN2JkIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3N0b3Bf
bWFjaGluZS5jCisrKyBiL3hlbi9jb21tb24vc3RvcF9tYWNoaW5lLmMKQEAgLTY5LDggKzY5LDgg
QEAgc3RhdGljIHZvaWQgc3RvcG1hY2hpbmVfd2FpdF9zdGF0ZSh2b2lkKQogCiBpbnQgc3RvcF9t
YWNoaW5lX3J1bihpbnQgKCpmbikodm9pZCAqKSwgdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGNw
dSkKIHsKLSAgICBjcHVtYXNrX3QgYWxsYnV0c2VsZjsKICAgICB1bnNpZ25lZCBpbnQgaSwgbnJf
Y3B1czsKKyAgICB1bnNpZ25lZCBpbnQgdGhpcyA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKICAgICBp
bnQgcmV0OwogCiAgICAgQlVHX09OKCFsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKQEAgLTc5LDkg
Kzc5LDkgQEAgaW50IHN0b3BfbWFjaGluZV9ydW4oaW50ICgqZm4pKHZvaWQgKiksIHZvaWQgKmRh
dGEsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgaWYgKCAhZ2V0X2NwdV9tYXBzKCkgKQogICAgICAg
ICByZXR1cm4gLUVCVVNZOwogCi0gICAgY3B1bWFza19hbmRub3QoJmFsbGJ1dHNlbGYsICZjcHVf
b25saW5lX21hcCwKLSAgICAgICAgICAgICAgICAgICBjcHVtYXNrX29mKHNtcF9wcm9jZXNzb3Jf
aWQoKSkpOwotICAgIG5yX2NwdXMgPSBjcHVtYXNrX3dlaWdodCgmYWxsYnV0c2VsZik7CisgICAg
bnJfY3B1cyA9IG51bV9vbmxpbmVfY3B1cygpOworICAgIGlmICggY3B1X29ubGluZSh0aGlzKSAp
CisgICAgICAgIG5yX2NwdXMtLTsKIAogICAgIC8qIE11c3Qgbm90IHNwaW4gaGVyZSBhcyB0aGUg
aG9sZGVyIHdpbGwgZXhwZWN0IHVzIHRvIGJlIGRlc2NoZWR1bGVkLiAqLwogICAgIGlmICggIXNw
aW5fdHJ5bG9jaygmc3RvcG1hY2hpbmVfbG9jaykgKQpAQCAtMTAwLDggKzEwMCw5IEBAIGludCBz
dG9wX21hY2hpbmVfcnVuKGludCAoKmZuKSh2b2lkICopLCB2b2lkICpkYXRhLCB1bnNpZ25lZCBp
bnQgY3B1KQogCiAgICAgc21wX3dtYigpOwogCi0gICAgZm9yX2VhY2hfY3B1ICggaSwgJmFsbGJ1
dHNlbGYgKQotICAgICAgICB0YXNrbGV0X3NjaGVkdWxlX29uX2NwdSgmcGVyX2NwdShzdG9wbWFj
aGluZV90YXNrbGV0LCBpKSwgaSk7CisgICAgZm9yX2VhY2hfb25saW5lX2NwdSAoIGkgKQorICAg
ICAgICBpZiAoIGkgIT0gdGhpcyApCisgICAgICAgICAgICB0YXNrbGV0X3NjaGVkdWxlX29uX2Nw
dSgmcGVyX2NwdShzdG9wbWFjaGluZV90YXNrbGV0LCBpKSwgaSk7CiAKICAgICBzdG9wbWFjaGlu
ZV9zZXRfc3RhdGUoU1RPUE1BQ0hJTkVfUFJFUEFSRSk7CiAgICAgc3RvcG1hY2hpbmVfd2FpdF9z
dGF0ZSgpOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
