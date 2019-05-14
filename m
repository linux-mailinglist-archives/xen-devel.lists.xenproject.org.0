Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D51C8A0
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:27:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWUn-0002rC-Fm; Tue, 14 May 2019 12:25:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWUk-0002nC-W8
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:25:23 +0000
X-Inumbo-ID: 57becc0b-7643-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 57becc0b-7643-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:25:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB294341;
 Tue, 14 May 2019 05:25:21 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881E43F71E;
 Tue, 14 May 2019 05:25:20 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:24:50 +0100
Message-Id: <20190514122456.28559-14-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 RESEND v2 13/19] xen/arm32: mm: Avoid
 to zero and clean cache for CPU0 domheap
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgdG8gdXNlIHRoZSBzYW1lIHNoYXJl
YWJpbGl0eSBhbmQKY2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBk
YXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBUaGlzCm1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Ig
Q1BVMCBkb21oZWFwIGlzIHVubmVjZXNzYXJ5LgoKRnVydGhlcm1vcmUsIENQVTAgcGFnZS10YWJs
ZXMgYXJlIHBhcnQgb2YgWGVuIGJpbmFyeSBhbmQgd2lsbCBhbHJlYWR5IGJlCnplcm9lZCBiZWZv
cmUgYmVlbiB1c2VkLiBTbyBpdCBpcyBwb2ludGxlc3MgdG8gemVybyB0aGUgZG9taGVhcCBhZ2Fp
bi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJl
dmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAg
ICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gVHdlYWsgYSBiaXQgdGhlIGNvbW1pdCBtZXNzYWdl
CiAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKLS0tCiB4ZW4vYXJjaC9hcm0vbW0u
YyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5kZXggZTA5MGFmYjk3Ni4u
Y2RhMjg0N2QwMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKKysrIGIveGVuL2FyY2gv
YXJtL21tLmMKQEAgLTcyNCwxMSArNzI0LDYgQEAgdm9pZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxl
cyh1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQpCiAjaWZkZWYgQ09ORklHX0FSTV8zMgog
ICAgIHBlcl9jcHUoeGVuX3BndGFibGUsIDApID0gY3B1MF9wZ3RhYmxlOwogICAgIHBlcl9jcHUo
eGVuX2RvbW1hcCwgMCkgPSBjcHUwX2RvbW1hcDsKLQotICAgIC8qIE1ha2Ugc3VyZSBpdCBpcyBj
bGVhciAqLwotICAgIG1lbXNldCh0aGlzX2NwdSh4ZW5fZG9tbWFwKSwgMCwgRE9NSEVBUF9TRUNP
TkRfUEFHRVMqUEFHRV9TSVpFKTsKLSAgICBjbGVhbl9kY2FjaGVfdmFfcmFuZ2UodGhpc19jcHUo
eGVuX2RvbW1hcCksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBET01IRUFQX1NFQ09O
RF9QQUdFUypQQUdFX1NJWkUpOwogI2VuZGlmCiB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
