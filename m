Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FA17DF4
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 18:18:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOPEo-0008EB-Ti; Wed, 08 May 2019 16:16:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7fFX=TI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOPEn-0008E6-KP
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 16:16:09 +0000
X-Inumbo-ID: 967c3d36-71ac-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 967c3d36-71ac-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 16:16:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 453AB374;
 Wed,  8 May 2019 09:16:08 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 353553F238;
 Wed,  8 May 2019 09:16:07 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 May 2019 17:15:56 +0100
Message-Id: <20190508161603.21964-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v2 0/7] xen/arm: TLB flush helpers rework
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
IGZvY3VzIG9uIHJld29ya2luZyBob3cgd2UgZmx1c2ggdGhlIFRMQnMgaW4gWGVuLgoKQ2hlZXJz
LAoKSnVsaWVuIEdyYWxsICg3KToKICB4ZW4vYXJtOiBtbTogQ29uc29saWRhdGUgc2V0dGluZyBT
Q1RMUl9FTDIuV1hOIGluIGEgc2luZ2xlIHBsYWNlCiAgeGVuL2FybTogUmVtb3ZlIGZsdXNoX3hl
bl90ZXh0X3RsYl9sb2NhbCgpCiAgeGVuL2FybTogdGxiZmx1c2g6IENsYXJpZnkgdGhlIFRMQiBo
ZWxwZXJzIG5hbWUKICB4ZW4vYXJtOiBwYWdlOiBDbGFyaWZ5IHRoZSBYZW4gVExCcyBoZWxwZXJz
IG5hbWUKICB4ZW4vYXJtOiBHYXRoZXIgYWxsIFRMQiBmbHVzaCBoZWxwZXJzIGluIHRsYmZsdXNo
LmgKICB4ZW4vYXJtOiB0bGJmbHVzaDogUmV3b3JrIFRMQiBoZWxwZXJzCiAgeGVuL2FybTogbW06
IEZsdXNoIHRoZSBUTEJzIGV2ZW4gaWYgYSBtYXBwaW5nIGZhaWxlZCBpbgogICAgY3JlYXRlX3hl
bl9lbnRyaWVzCgogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgICAgICAgICAgIHwgNjkgKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vcDJtLmMgICAgICAg
ICAgICAgICAgICAgfCAgNiArLS0KIHhlbi9hcmNoL2FybS9zbXAuYyAgICAgICAgICAgICAgICAg
ICB8ICAyICstCiB4ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICAgICAgICAgICAgfCAgMiArLQog
eGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9mbHVzaHRsYi5oIHwgNzEgKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9wYWdlLmggICAg
IHwgNDggKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQv
Zmx1c2h0bGIuaCB8IDc1ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogeGVu
L2luY2x1ZGUvYXNtLWFybS9hcm02NC9wYWdlLmggICAgIHwgNDkgKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vZmx1c2h0bGIuaCAgICAgICB8IDM4ICsrKysrKysr
KysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmggICAgICAgICAgIHwgMzggLS0t
LS0tLS0tLS0tLS0tLS0tCiAxMCBmaWxlcyBjaGFuZ2VkLCAxODQgaW5zZXJ0aW9ucygrKSwgMjE0
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
