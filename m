Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065611C847
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:14:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWHW-0006DZ-Mz; Tue, 14 May 2019 12:11:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWHV-0006DJ-8H
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:11:41 +0000
X-Inumbo-ID: 6d94a1e0-7641-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6d94a1e0-7641-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:11:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5309A341;
 Tue, 14 May 2019 05:11:39 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40E6A3F71E;
 Tue, 14 May 2019 05:11:38 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:11:24 +0100
Message-Id: <20190514121132.26732-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH MM-PART1 v3 0/8] xen/arm: TLB flush helpers
 rework
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKSSBzcGVudCB0aGUgbGFzdCBmZXcgbW9udGhzIGxvb2tpbmcgYXQgWGVuIGJvb3Qg
YW5kIG1lbW9yeSBtYW5hZ2VtZW50IHRvIG1ha2UKaXQgc2ltcGxlciwgbW9yZSBlZmZpY2llbnQg
YW5kIGFsc28gbW9yZSBjb21wbGlhbnQgaW4gcmVzcGVjdCBvZiB0aGUgQXJtIEFybS4KClRoZSBm
dWxsIHJld29yayBpcyBxdWl0ZSBjb25zZXF1ZW5jZSAoYWxyZWFkeSAxNTAgcGF0Y2hlcyBhbmQg
SSBoYXZlbid0IHlldApmaW5pc2hlZCEpLCBzbyBJIGFtIHBsYW5uaW5nIHRvIHNlbmQgaW4gc21h
bGxlciBwYXJ0IG92ZXIgdGhlIG5leHQgZmV3IHdlZWtzLgoKSW4gdGhpcyBmaXJzdCBwYXJ0LCBJ
IGZvY3VzIG9uIHJld29ya2luZyBob3cgd2UgZmx1c2ggdGhlIFRMQnMgaW4gWGVuLgoKVGhlIG1h
aW4gYWRkaXRpb24gZm9yIHRoaXMgdmVyc2lvbiBpcyB0byBwcmV2ZW50IFhlbiBib290aW5nIG9u
IEFJVklWVAppbnN0cnVjdGlvbiBjYWNoZXMgKHNlZSBwYXRjaCAjMSkuIEZvciBhbGwgdGhlIG90
aGVyIGNoYW5nZXMsIHNlZSBlYWNoIHBhdGNoLgoKQ2hlZXJzLAoKSnVsaWVuIEdyYWxsICg4KToK
ICB4ZW4vYXJtOiBEb24ndCBib290IFhlbiBvbiBwbGF0Zm9ybSB1c2luZyBBSVZJVlQgaW5zdHJ1
Y3Rpb24gY2FjaGVzCiAgeGVuL2FybTogbW06IENvbnNvbGlkYXRlIHNldHRpbmcgU0NUTFJfRUwy
LldYTiBpbiBhIHNpbmdsZSBwbGFjZQogIHhlbi9hcm06IFJlbW92ZSBmbHVzaF94ZW5fdGV4dF90
bGJfbG9jYWwoKQogIHhlbi9hcm06IHRsYmZsdXNoOiBDbGFyaWZ5IHRoZSBUTEIgaGVscGVycyBu
YW1lCiAgeGVuL2FybTogcGFnZTogQ2xhcmlmeSB0aGUgWGVuIFRMQnMgaGVscGVycyBuYW1lCiAg
eGVuL2FybTogR2F0aGVyIGFsbCBUTEIgZmx1c2ggaGVscGVycyBpbiB0bGJmbHVzaC5oCiAgeGVu
L2FybTogdGxiZmx1c2g6IFJld29yayBUTEIgaGVscGVycwogIHhlbi9hcm06IG1tOiBGbHVzaCB0
aGUgVExCcyBldmVuIGlmIGEgbWFwcGluZyBmYWlsZWQgaW4KICAgIGNyZWF0ZV94ZW5fZW50cmll
cwoKIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgICAgICAgICAgICB8IDY5ICsrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL3AybS5jICAgICAgICAgICAgICAg
ICAgIHwgIDYgKy0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgfCAgNSAr
KysKIHhlbi9hcmNoL2FybS9zbXAuYyAgICAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJj
aC9hcm0vdHJhcHMuYyAgICAgICAgICAgICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUvYXNtLWFy
bS9hcm0zMi9mbHVzaHRsYi5oIHwgNzEgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LQogeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9wYWdlLmggICAgIHwgNDggKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvZmx1c2h0bGIuaCB8IDc1ICsr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9h
cm02NC9wYWdlLmggICAgIHwgNDkgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRl
L2FzbS1hcm0vZmx1c2h0bGIuaCAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKwogeGVuL2lu
Y2x1ZGUvYXNtLWFybS9wYWdlLmggICAgICAgICAgIHwgMzggLS0tLS0tLS0tLS0tLS0tLS0tCiB4
ZW4vaW5jbHVkZS9hc20tYXJtL3Byb2Nlc3Nvci5oICAgICAgfCAgNSArKysKIDEyIGZpbGVzIGNo
YW5nZWQsIDE5NCBpbnNlcnRpb25zKCspLCAyMTQgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
