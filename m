Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D84CB2E9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 03:18:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGCBK-0003K4-4A; Fri, 04 Oct 2019 01:14:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Z5s=X5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iGCBI-0003Jz-LP
 for xen-devel@lists.xen.org; Fri, 04 Oct 2019 01:14:52 +0000
X-Inumbo-ID: 5d756bce-e644-11e9-8c93-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d756bce-e644-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 01:14:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F36420862;
 Fri,  4 Oct 2019 01:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570151690;
 bh=6TizvD9wLbgDmYEXLBSY0aXyuTTW4Gy1xAl5BuwOrmM=;
 h=Date:From:To:cc:Subject:From;
 b=X03uEYpUR7Wm7LVJvYfJQG2aY7T+C/tRR+iKrzUdE3OIA+Om7D8IAuiyU82P08Y+v
 67ZTTHvKEHvlzDmiyEBxAxRZyY/NQl00bcJxYKBXOHknkMRbEsPQe2iQZuAO3NeAkl
 +9M67luL1/iJl3/FkRPoIlRiAzOvaxZy3lui3OHQ=
Date: Thu, 3 Oct 2019 18:14:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1910031812380.30844@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v9 0/8] dom0less device assignment
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, sstabellini@kernel.org,
 andrii_anisov@epam.com, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgYWRkcyBkZXZpY2UgYXNzaWdubWVudCBz
dXBwb3J0IHRvIERvbTBsZXNzLgpUaGUgbGFzdCBwYXRjaCBpcyB0aGUgZG9jdW1lbnRhdGlvbi4K
CkNoZWVycywKClN0ZWZhbm8KCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDdh
NGU2NzExMTE0OTA1YjNjYmJlNDhlODFjMzIyMjM2MWE3ZjM1Nzk6CgogIHhlbi9zY2hlZDogbW92
ZSBzdHJ1Y3QgdGFza19zbGljZSBpbnRvIHN0cnVjdCBzY2hlZF91bml0ICgyMDE5LTA5LTI3IDE2
OjAzOjMxICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cgog
IGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1odHRwL3Blb3BsZS9zc3RhYmVsbGlu
aS94ZW4tdW5zdGFibGUuZ2l0IGRvbTBsZXNzLXB0LXY5Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5n
ZXMgdXAgdG8gNzY2MGYwM2NhOGRkY2ZkZTMyNTg2NGVkMGJiZjgwZjhlMGMyMGU2YzoKCiAgeGVu
L2FybTogYWRkIGRvbTAtbGVzcyBkZXZpY2UgYXNzaWdubWVudCBpbmZvIHRvIGRvY3MgKDIwMTkt
MTAtMDMgMTA6MzU6NDEgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoOCk6CiAg
ICAgIHhlbi9hcm06IGludHJvZHVjZSBoYW5kbGVfZGV2aWNlX2ludGVycnVwdHMKICAgICAgeGVu
L2FybTogZXhwb3J0IGRldmljZV90cmVlX2dldF9yZWcgYW5kIGRldmljZV90cmVlX2dldF91MzIK
ICAgICAgeGVuL2FybTogaW50cm9kdWNlIGtpbmZvLT5waGFuZGxlX2dpYwogICAgICB4ZW4vYXJt
OiBjb3B5IGR0YiBmcmFnbWVudCB0byBndWVzdCBkdGIKICAgICAgeGVuL2FybTogYXNzaWduIGRl
dmljZXMgdG8gYm9vdCBkb21haW5zCiAgICAgIHhlbi9hcm06IGhhbmRsZSAibXVsdGlib290LGRl
dmljZS10cmVlIiBjb21wYXRpYmxlIG5vZGVzCiAgICAgIHhlbi9hcm06IGludHJvZHVjZSBucl9z
cGlzCiAgICAgIHhlbi9hcm06IGFkZCBkb20wLWxlc3MgZGV2aWNlIGFzc2lnbm1lbnQgaW5mbyB0
byBkb2NzCgogZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCB8ICA0NCArKyst
CiBkb2NzL21pc2MvYXJtL3Bhc3N0aHJvdWdoLnR4dCAgICAgICAgIHwgMTA2ICsrKysrKysrCiB4
ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICAgICAgICAgIHwgIDEwICstCiB4ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgICAgICAgICAgIHwgNDU5ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0KIHhlbi9hcmNoL2FybS9rZXJuZWwuYyAgICAgICAgICAgICAgICAgfCAgMTQg
Ky0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2lu
Y2x1ZGUvYXNtLWFybS9rZXJuZWwuaCAgICAgICAgICB8ICAgNSArLQogeGVuL2luY2x1ZGUvYXNt
LWFybS9zZXR1cC5oICAgICAgICAgICB8ICAgNyArCiA4IGZpbGVzIGNoYW5nZWQsIDU3OSBpbnNl
cnRpb25zKCspLCA2NyBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
