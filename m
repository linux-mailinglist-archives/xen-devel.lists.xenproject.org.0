Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA953BCF8
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 21:35:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQ1v-0007fE-8z; Mon, 10 Jun 2019 19:32:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQ1s-0007di-Ri
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 19:32:28 +0000
X-Inumbo-ID: 7b48ac70-8bb6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7b48ac70-8bb6-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 19:32:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5F4A344;
 Mon, 10 Jun 2019 12:32:27 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0922F3F73C;
 Mon, 10 Jun 2019 12:32:26 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Jun 2019 20:32:05 +0100
Message-Id: <20190610193215.23704-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190610193215.23704-1-julien.grall@arm.com>
References: <20190610193215.23704-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 07/17] xen/arm64: head: Rework and document
 check_cpu_mode()
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBicmFuY2ggaW4gdGhlIHN1Y2Nlc3MgY2FzZSBjYW4gYmUgYXZvaWRlZCBieSBpbnZlcnRpbmcg
dGhlIGJyYW5jaApjb25kaXRpb24uIEF0IHRoZSBzYW1lIHRpbWUsIHJlbW92ZSBhIHBvaW50bGVz
cyBjb21tZW50IGFzIFhlbiBjYW4gb25seQpydW4gYXQgRUwyLgoKTGFzdGx5LCBkb2N1bWVudCB0
aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCmZ1bmN0
aW9uLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
LS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTUgKysrKysrKysrKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpp
bmRleCBjY2Q4YTFiMGE4Li44N2ZjZDNiZTZjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKQEAgLTM1MCw2ICszNTAs
MTMgQEAgc2Vjb25kYXJ5X3N3aXRjaGVkOgogICAgICAgICBiICAgICBsYXVuY2gKIEVORFBST0Mo
aW5pdF9zZWNvbmRhcnkpCiAKKy8qCisgKiBDaGVjayBpZiB0aGUgQ1BVIGhhcyBiZWVuIGJvb3Rl
ZCBpbiBIeXBlcnZpc29yIG1vZGUuCisgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgbmV2ZXIgcmV0dXJu
IHdoZW4gdGhlIENQVSBpcyBib290ZWQgaW4gYW5vdGhlciBtb2RlCisgKiB0aGFuIEh5cGVydmlz
b3IgbW9kZS4KKyAqCisgKiBDbG9iYmVycyB4MCAtIHg1CisgKi8KIGNoZWNrX2NwdV9tb2RlOgog
ICAgICAgICBQUklOVCgiLSBDdXJyZW50IEVMICIpCiAgICAgICAgIG1ycyAgIHg1LCBDdXJyZW50
RUwKQEAgLTM1OSwxNSArMzY2LDEzIEBAIGNoZWNrX2NwdV9tb2RlOgogICAgICAgICAvKiBBcmUg
d2UgaW4gRUwyICovCiAgICAgICAgIGNtcCAgIHg1LCAjUFNSX01PREVfRUwydAogICAgICAgICBj
Y21wICB4NSwgI1BTUl9NT0RFX0VMMmgsICMweDQsIG5lCi0gICAgICAgIGIuZXEgIGVsMiAvKiBZ
ZXMgKi8KLQorICAgICAgICBiLm5lICAxZiAvKiBObyAqLworICAgICAgICByZXQKKzE6CiAgICAg
ICAgIC8qIE9LLCB3ZSdyZSBib25lZC4gKi8KICAgICAgICAgUFJJTlQoIi0gWGVuIG11c3QgYmUg
ZW50ZXJlZCBpbiBOUyBFTDIgbW9kZSAtXHJcbiIpCiAgICAgICAgIFBSSU5UKCItIFBsZWFzZSB1
cGRhdGUgdGhlIGJvb3Rsb2FkZXIgLVxyXG4iKQogICAgICAgICBiIGZhaWwKLQotZWwyOiAgICBQ
UklOVCgiLSBYZW4gc3RhcnRpbmcgYXQgRUwyIC1cclxuIikKLSAgICAgICAgcmV0CiBFTkRQUk9D
KGNoZWNrX2NwdV9tb2RlKQogCiB6ZXJvX2JzczoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
