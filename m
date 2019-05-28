Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 257752C77B
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 15:11:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVbpz-0007tD-OR; Tue, 28 May 2019 13:08:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVbpy-0007t8-Ec
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 13:08:18 +0000
X-Inumbo-ID: a7d05117-8149-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7d05117-8149-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 13:08:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4FFB3AEF3;
 Tue, 28 May 2019 13:08:15 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 15:08:11 +0200
Message-Id: <20190528130811.26480-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen: remove on-stack cpumask from
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
bT4KLS0tCiB4ZW4vY29tbW9uL3N0b3BfbWFjaGluZS5jIHwgMTEgKysrKystLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zdG9wX21hY2hpbmUuYyBiL3hlbi9jb21tb24vc3RvcF9tYWNoaW5lLmMKaW5k
ZXggY2U2ZjU2MjRjNC4uY2NkYTJlZmEzZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zdG9wX21h
Y2hpbmUuYworKysgYi94ZW4vY29tbW9uL3N0b3BfbWFjaGluZS5jCkBAIC02OSw4ICs2OSw4IEBA
IHN0YXRpYyB2b2lkIHN0b3BtYWNoaW5lX3dhaXRfc3RhdGUodm9pZCkKIAogaW50IHN0b3BfbWFj
aGluZV9ydW4oaW50ICgqZm4pKHZvaWQgKiksIHZvaWQgKmRhdGEsIHVuc2lnbmVkIGludCBjcHUp
CiB7Ci0gICAgY3B1bWFza190IGFsbGJ1dHNlbGY7CiAgICAgdW5zaWduZWQgaW50IGksIG5yX2Nw
dXM7CisgICAgdW5zaWduZWQgaW50IG15X2NwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKICAgICBp
bnQgcmV0OwogCiAgICAgQlVHX09OKCFsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKQEAgLTc5LDkg
Kzc5LDcgQEAgaW50IHN0b3BfbWFjaGluZV9ydW4oaW50ICgqZm4pKHZvaWQgKiksIHZvaWQgKmRh
dGEsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgaWYgKCAhZ2V0X2NwdV9tYXBzKCkgKQogICAgICAg
ICByZXR1cm4gLUVCVVNZOwogCi0gICAgY3B1bWFza19hbmRub3QoJmFsbGJ1dHNlbGYsICZjcHVf
b25saW5lX21hcCwKLSAgICAgICAgICAgICAgICAgICBjcHVtYXNrX29mKHNtcF9wcm9jZXNzb3Jf
aWQoKSkpOwotICAgIG5yX2NwdXMgPSBjcHVtYXNrX3dlaWdodCgmYWxsYnV0c2VsZik7CisgICAg
bnJfY3B1cyA9IGNwdW1hc2tfd2VpZ2h0KCZjcHVfb25saW5lX21hcCkgLSAxOwogCiAgICAgLyog
TXVzdCBub3Qgc3BpbiBoZXJlIGFzIHRoZSBob2xkZXIgd2lsbCBleHBlY3QgdXMgdG8gYmUgZGVz
Y2hlZHVsZWQuICovCiAgICAgaWYgKCAhc3Bpbl90cnlsb2NrKCZzdG9wbWFjaGluZV9sb2NrKSAp
CkBAIC0xMDAsOCArOTgsOSBAQCBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQgKCpmbikodm9pZCAq
KSwgdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGNwdSkKIAogICAgIHNtcF93bWIoKTsKIAotICAg
IGZvcl9lYWNoX2NwdSAoIGksICZhbGxidXRzZWxmICkKLSAgICAgICAgdGFza2xldF9zY2hlZHVs
ZV9vbl9jcHUoJnBlcl9jcHUoc3RvcG1hY2hpbmVfdGFza2xldCwgaSksIGkpOworICAgIGZvcl9l
YWNoX2NwdSAoIGksICZjcHVfb25saW5lX21hcCApCisgICAgICAgIGlmICggaSAhPSBteV9jcHUg
KQorICAgICAgICAgICAgdGFza2xldF9zY2hlZHVsZV9vbl9jcHUoJnBlcl9jcHUoc3RvcG1hY2hp
bmVfdGFza2xldCwgaSksIGkpOwogCiAgICAgc3RvcG1hY2hpbmVfc2V0X3N0YXRlKFNUT1BNQUNI
SU5FX1BSRVBBUkUpOwogICAgIHN0b3BtYWNoaW5lX3dhaXRfc3RhdGUoKTsKLS0gCjIuMTYuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
