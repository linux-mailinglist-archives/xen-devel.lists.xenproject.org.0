Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3780C905F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 20:04:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFiw1-0005Ld-VL; Wed, 02 Oct 2019 18:01:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFiw0-0005LE-52
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 18:01:08 +0000
X-Inumbo-ID: 955a0812-e53e-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 955a0812-e53e-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 18:00:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A23E1000;
 Wed,  2 Oct 2019 11:00:56 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E2403F706;
 Wed,  2 Oct 2019 11:00:55 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 19:00:45 +0100
Message-Id: <20191002180047.17144-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191002180047.17144-1-julien.grall@arm.com>
References: <20191002180047.17144-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 4/6] xen/arm: cpufeature: Match
 register size with value size in cpus_have_const_cap
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
Cc: Artem_Mygaiev@epam.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgaXMgcGlja2llciB0aGFuIEdDQyBmb3IgdGhlIHJlZ2lzdGVyIHNpemUgaW4gYXNtIHN0
YXRlbWVudC4gSXQKZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUg
c2l6ZS4KClRoZSBhc20gc3RhdGVtZW50IGV4cGVjdHMgYSAzMi1iaXQgKHJlc3AuIDY0LWJpdCkg
dmFsdWUgb24gQXJtMzIKKHJlc3AuIEFybTY0KSB3aGVyZWFzIHRoZSB2YWx1ZSBpcyBhIGJvb2xl
YW4gKENsYW5nIGNvbnNpZGVyIHRvIGJlCjMyLWJpdCkuCgpJdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBpbXBvc2UgMzItYml0IHJlZ2lzdGVyIGZvciBib3RoIGFyY2hpdGVjdHVyZQpidXQgdGhpcyBy
ZXF1aXJlIHRoZSBjb2RlIHRvIHVzZSBfX09QMzIuIEhvd2V2ZXIsIGl0IGRvZXMgbm8gcmVhbGx5
CmltcHJvdmUgdGhlIGFzc2VtYmx5IGdlbmVyYXRlZC4gSW5zdGVhZCwgcmVwbGFjZSBzd2l0Y2gg
dGhlIHZhcmlhYmxlIHRvCnVzZSByZWdpc3Rlcl90LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAg
ICAtIFVzZSAhISBwZXIgU3RlZmFubydzIHJlcXVlc3QKLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJt
L2NwdWZlYXR1cmUuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1
cmUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oCmluZGV4IGMyYzhmMzQxN2Mu
LjRjNWZmNmU4YWMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vY3B1ZmVhdHVyZS5oCkBAIC02NywxNCArNjcsMTQg
QEAgc3RhdGljIGlubGluZSBib29sIGNwdXNfaGF2ZV9jYXAodW5zaWduZWQgaW50IG51bSkKIAog
LyogU3lzdGVtIGNhcGFiaWxpdHkgY2hlY2sgZm9yIGNvbnN0YW50IGNhcCAqLwogI2RlZmluZSBj
cHVzX2hhdmVfY29uc3RfY2FwKG51bSkgKHsgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgYm9v
bCBfX3JldDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIHJlZ2lz
dGVyX3QgX19yZXQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgYXNtIHZvbGF0
aWxlIChBTFRFUk5BVElWRSgibW92ICUwLCAjMCIsICAgICBcCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIm1vdiAlMCwgIzEiLCAgICAgXAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG51bSkgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICA6
ICI9ciIgKF9fcmV0KSk7ICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICB1bmxpa2VseShfX3JldCk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgdW5saWtlbHkoISFfX3JldCk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgIH0pCiAKIHN0YXRpYyBpbmxpbmUgdm9p
ZCBjcHVzX3NldF9jYXAodW5zaWduZWQgaW50IG51bSkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
