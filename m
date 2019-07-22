Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8670BC6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg2a-0002Vq-Nn; Mon, 22 Jul 2019 21:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2Y-0002TG-NT
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:14 +0000
X-Inumbo-ID: 48c8466a-acc9-11e9-bc40-333e19a5e78f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 48c8466a-acc9-11e9-bc40-333e19a5e78f;
 Mon, 22 Jul 2019 21:40:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03D7E153B;
 Mon, 22 Jul 2019 14:40:12 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51A093F71F;
 Mon, 22 Jul 2019 14:40:11 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:30 +0100
Message-Id: <20190722213958.5761-8-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 07/35] xen/arm64: head: Rework and document
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
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
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Ci0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIEFkZCBTdGVmYW5vJ3MgcmV2aWV3ZWQt
YnkKLS0tCiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMTUgKysrKysrKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UwppbmRleCBkZjc5N2ExNTczLi5mYmNjNzkyYWRlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TCisrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKQEAgLTM1MCw2ICsz
NTAsMTMgQEAgc2Vjb25kYXJ5X3N3aXRjaGVkOgogICAgICAgICBiICAgICBsYXVuY2gKIEVORFBS
T0MoaW5pdF9zZWNvbmRhcnkpCiAKKy8qCisgKiBDaGVjayBpZiB0aGUgQ1BVIGhhcyBiZWVuIGJv
b3RlZCBpbiBIeXBlcnZpc29yIG1vZGUuCisgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgbmV2ZXIgcmV0
dXJuIHdoZW4gdGhlIENQVSBpcyBib290ZWQgaW4gYW5vdGhlciBtb2RlCisgKiB0aGFuIEh5cGVy
dmlzb3IgbW9kZS4KKyAqCisgKiBDbG9iYmVycyB4MCAtIHg1CisgKi8KIGNoZWNrX2NwdV9tb2Rl
OgogICAgICAgICBQUklOVCgiLSBDdXJyZW50IEVMICIpCiAgICAgICAgIG1ycyAgIHg1LCBDdXJy
ZW50RUwKQEAgLTM1OSwxNSArMzY2LDEzIEBAIGNoZWNrX2NwdV9tb2RlOgogICAgICAgICAvKiBB
cmUgd2UgaW4gRUwyICovCiAgICAgICAgIGNtcCAgIHg1LCAjUFNSX01PREVfRUwydAogICAgICAg
ICBjY21wICB4NSwgI1BTUl9NT0RFX0VMMmgsICMweDQsIG5lCi0gICAgICAgIGIuZXEgIGVsMiAv
KiBZZXMgKi8KLQorICAgICAgICBiLm5lICAxZiAvKiBObyAqLworICAgICAgICByZXQKKzE6CiAg
ICAgICAgIC8qIE9LLCB3ZSdyZSBib25lZC4gKi8KICAgICAgICAgUFJJTlQoIi0gWGVuIG11c3Qg
YmUgZW50ZXJlZCBpbiBOUyBFTDIgbW9kZSAtXHJcbiIpCiAgICAgICAgIFBSSU5UKCItIFBsZWFz
ZSB1cGRhdGUgdGhlIGJvb3Rsb2FkZXIgLVxyXG4iKQogICAgICAgICBiIGZhaWwKLQotZWwyOiAg
ICBQUklOVCgiLSBYZW4gc3RhcnRpbmcgYXQgRUwyIC1cclxuIikKLSAgICAgICAgcmV0CiBFTkRQ
Uk9DKGNoZWNrX2NwdV9tb2RlKQogCiB6ZXJvX2JzczoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
