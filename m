Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6111325AA
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 13:08:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ionda-0004tn-Jh; Tue, 07 Jan 2020 12:07:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tB6F=24=amazon.com=prvs=2686fb3d9=hongyxia@srs-us1.protection.inumbo.net>)
 id 1iondZ-0004te-NT
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 12:07:05 +0000
X-Inumbo-ID: 380ba090-3146-11ea-abea-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 380ba090-3146-11ea-abea-12813bfff9fa;
 Tue, 07 Jan 2020 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578398825; x=1609934825;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=exyJQ+i5lRIs/ws2ZIutwakEn61cmiThMv/7Wo7m3NE=;
 b=sG3zlVTMtxQJeriZe0Jx7P2o1B7oFjCRoX4Q4KVCyISu8nCzI6hAF68k
 GbbGZQ7IVyiSGLj+UqC1KfOAkhey42261Lbw87XW+UzE7G5nEeHFnM0YN
 krFqWxSsPSF5YL/UFkQwne3jyO02vz/HdLI2TL9LbPPdE+Uuh2Q9+HkiZ E=;
IronPort-SDR: pNoB7y7rDrPVV4JpUpTQy2ZPlrIDG4b8bfbHWzM5Cbyz3zmLMIoBvEI/aEH7vG2Oi/zzRKgj8W
 50H2HQ9jsHDw==
X-IronPort-AV: E=Sophos;i="5.69,406,1571702400"; 
   d="scan'208";a="8790213"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 07 Jan 2020 12:06:54 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id B6826A270F; Tue,  7 Jan 2020 12:06:53 +0000 (UTC)
Received: from EX13D37EUA001.ant.amazon.com (10.43.165.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 7 Jan 2020 12:06:53 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D37EUA001.ant.amazon.com (10.43.165.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 Jan 2020 12:06:52 +0000
Received: from u0b3720fa96e858.ant.amazon.com (10.125.106.133) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 Jan 2020 12:06:49 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 12:06:42 +0000
Message-ID: <cover.1578397252.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 0/7] Add alternative API for XEN PTEs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBiYXRjaCBhZGRzIGFuIGFsdGVybmF0aXZlIGFsbG9jLW1hcC11bm1hcC1mcmVlIFhlbiBQ
VEUgQVBJIHRvIHRoZQpub3JtYWwgYWxsb2MtZnJlZSBvbiB0aGUgeGVuaGVhcCwgaW4gcHJlcGFy
YXRpb24gb2Ygc3dpdGNoaW5nIHRvIGRvbWhlYXAKZm9yIFhlbiBwYWdlIHRhYmxlcy4gU2luY2Ug
bWFwIGFuZCB1bm1hcCBhcmUgYmFzaWNhbGx5IG5vLW9wcyBub3csIGFuZApvdGhlciBjaGFuZ2Vz
IGFyZSBjb3NtZXRpYyB0byBlYXNlIGZ1dHVyZSBwYXRjaGVzLCB0aGlzIGJhdGNoIGRvZXMgbm90
CmludHJvZHVjZSBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzLgoKdHJlZToKaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2h4MjQyL3hlbi5naXQgZGlyZWN0bm9ubWFwLXYzCgot
LS0KQ2hhbmdlZCBzaW5jZSB2NDoKLSBoYW5kbGUgSU5WQUxJRF9NRk4gaW4gbmV3IEFQSXMKLSBk
cm9wIHNvbWUgZ290byBsYWJlbHMgc2luY2UgdGhlcmUgY291bGQgYmUgYmV0dGVyIG9wdGlvbnMK
LSBjb25zdCBxdWFsaWZ5IGludHJvZHVjZWQgdmFyaWFibGVzCi0gZGVmZXIgc29tZSBjaGFuZ2Vz
IHRvIGZ1dHVyZSBwYXRjaGVzIGR1ZSB0byBvbmdvaW5nIGRpc2N1c3Npb25zIG9uCiAgbWFwX3Bh
Z2VzX3RvX3hlbgoKQ2hhbmdlZCBzaW5jZSB2MzoKLSBjaGFuZ2UgbXkgZW1haWwgYWRkcmVzcyBp
biBhbGwgcGF0Y2hlcwotIGFkZHJlc3MgbWFueSBzdHlsZSBpc3N1ZXMgaW4gdjMKLSByZWJhc2UK
CkNoYW5nZWQgc2luY2UgdjI6Ci0gc3BsaXQgaW50byBhIHNtYWxsZXIgc2VyaWVzCi0gZHJvcCB0
aGUgY2xlYXJfcGFnZSBvcHRpbWlzYXRpb24gYXMgV2VpIHN1Z2dlc3RzCi0gcmViYXNlCgpDaGFu
Z2VkIHNpbmNlIHYxOgotIHNxdWFzaCBzb21lIGNvbW1pdHMKLSBtZXJnZSBidWcgZml4ZXMgaW50
byB0aGlzIGZpcnN0IGJhdGNoCi0gcmViYXNlIGFnYWluc3QgbGF0ZXN0IG1hc3RlcgoKV2VpIExp
dSAoNyk6CiAgeDg2OiBtb3ZlIHNvbWUgeGVuIG1tIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucwogIHg4
NjogaW50cm9kdWNlIGEgbmV3IHNldCBvZiBBUElzIHRvIG1hbmFnZSBYZW4gcGFnZSB0YWJsZXMK
ICB4ODYvbW06IGludHJvZHVjZSBsezEsMn10IGxvY2FsIHZhcmlhYmxlcyB0byBtYXBfcGFnZXNf
dG9feGVuCiAgeDg2L21tOiBpbnRyb2R1Y2UgbHsxLDJ9dCBsb2NhbCB2YXJpYWJsZXMgdG8gbW9k
aWZ5X3hlbl9tYXBwaW5ncwogIHg4Ni9tbTogbWFwX3BhZ2VzX3RvX3hlbiB3b3VsZCBiZXR0ZXIg
aGF2ZSBvbmUgZXhpdCBwYXRoCiAgeDg2L21tOiBtYWtlIHN1cmUgdGhlcmUgaXMgb25lIGV4aXQg
cGF0aCBmb3IgbW9kaWZ5X3hlbl9tYXBwaW5ncwogIHg4Ni9tbTogY2hhbmdlIHBsKmUgdG8gbCp0
IGluIHZpcnRfdG9feGVuX2wqZQoKIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgIHwgMjU4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9tbS5oICAgfCAgMTYgKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2UuaCB8ICAg
NSAtCiAzIGZpbGVzIGNoYW5nZWQsIDE3NSBpbnNlcnRpb25zKCspLCAxMDQgZGVsZXRpb25zKC0p
CgotLSAKMi4xNS4zLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
