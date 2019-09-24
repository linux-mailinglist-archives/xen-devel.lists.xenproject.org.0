Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D0BC666
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:13:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCii8-0004b3-Tb; Tue, 24 Sep 2019 11:10:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCii6-0004Zl-Ln
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:10:22 +0000
X-Inumbo-ID: 8e72795a-debb-11e9-994c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 8e72795a-debb-11e9-994c-bc764e2007e4;
 Tue, 24 Sep 2019 11:07:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD22F142F;
 Tue, 24 Sep 2019 04:07:53 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 164183F67D;
 Tue, 24 Sep 2019 04:07:52 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 12:07:49 +0100
Message-Id: <20190924110749.18210-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/arm: Implement workaround for
 Cortex A-57 and Cortex A72 AT speculate
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

Qm90aCBDb3J0ZXgtQTU3IChlcnJhdHVtIDEzMTk1MzcpIGFuZCBDb3J0ZXgtQTcyIChlcnJhdHVt
IDEzMTkzNjcpIGNhbgplbmQgd2l0aCBjb3JydXB0IFRMQnMgaWYgdGhleSBzcGVjdWxhdGUgYW4g
QVQgaW5zdHJ1Y3Rpb24gd2hpbGUgUzEvUzIKc3lzdGVtIHJlZ2lzdGVycyBpbiBpbmNvbnNpc3Rl
bnQgc3RhdGUuCgpUaGUgd29ya2Fyb3VuZCBpcyB0aGUgc2FtZSBhcyBmb3IgQ29ydGV4IEEtNzYg
aW1wbGVtZW50ZWQgYnkgY29tbWl0CmExOGJlMDZhY2EgInhlbi9hcm06IEltcGxlbWVudCB3b3Jr
YXJvdW5kIGZvciBDb3J0ZXgtQTc2IGVycmF0dW0gMTE2NTUyMiIsCnNvIGl0IGlzIG9ubHkgbmVj
ZXNzYXJ5IHRvIHBsdW1iIGluIHRoZSBjcHVlcnJhdGEgZnJhbWV3b3JrLgoKU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tCiBkb2NzL21pc2MvYXJt
L3NpbGljb24tZXJyYXRhLnR4dCB8ICAyICsrCiB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgICAg
ICAgICB8IDEwICsrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0IGIvZG9jcy9taXNj
L2FybS9zaWxpY29uLWVycmF0YS50eHQKaW5kZXggNmNkMTM2NmYxNS4uY2YxOTNhNmQ0ZCAxMDA2
NDQKLS0tIGEvZG9jcy9taXNjL2FybS9zaWxpY29uLWVycmF0YS50eHQKKysrIGIvZG9jcy9taXNj
L2FybS9zaWxpY29uLWVycmF0YS50eHQKQEAgLTQ4LDUgKzQ4LDcgQEAgc3RhYmxlIGh5cGVydmlz
b3JzLgogfCBBUk0gICAgICAgICAgICB8IENvcnRleC1BNTcgICAgICB8ICM4NTI1MjMgICAgICAg
ICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwKIHwgQVJNICAgICAgICAgICAgfCBDb3J0ZXgt
QTU3ICAgICAgfCAjODMyMDc1ICAgICAgICAgfCBBUk02NF9FUlJBVFVNXzgzMjA3NSAgICB8CiB8
IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwgIzgzNDIyMCAgICAgICAgIHwgQVJN
NjRfRVJSQVRVTV84MzQyMjAgICAgfAorfCBBUk0gICAgICAgICAgICB8IENvcnRleC1BNTcgICAg
ICB8ICMxMzE5NTM3ICAgICAgICB8IE4vQQorfCBBUk0gICAgICAgICAgICB8IENvcnRleC1BNzIg
ICAgICB8ICMxMzE5MzY3ICAgICAgICB8IE4vQQogfCBBUk0gICAgICAgICAgICB8IENvcnRleC1B
NzYgICAgICB8ICMxMTY1NTIyICAgICAgICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwKIHwg
QVJNICAgICAgICAgICAgfCBNTVUtNTAwICAgICAgICAgfCAjODQyODY5ICAgICAgICAgfCBOL0Eg
ICAgICAgICAgICAgICAgICAgICB8CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRh
LmMgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMKaW5kZXggNmY0ODNiMmQ4ZC4uZGE3MmIwMjQ0
MiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCisrKyBiL3hlbi9hcmNoL2Fy
bS9jcHVlcnJhdGEuYwpAQCAtNDgxLDYgKzQ4MSwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFy
bV9jcHVfY2FwYWJpbGl0aWVzIGFybV9lcnJhdGFbXSA9IHsKICAgICAgICAgLmNhcGFiaWxpdHkg
PSBBUk02NF9XT1JLQVJPVU5EX0FUX1NQRUNVTEFURSwKICAgICAgICAgTUlEUl9SQU5HRShNSURS
X0NPUlRFWF9BNzYsIDAsIDIgPDwgTUlEUl9WQVJJQU5UX1NISUZUKSwKICAgICB9LAorICAgIHsK
KyAgICAgICAgLmRlc2MgPSAiQVJNIGVycmF0dW0gMTMxOTUzNyIsCisgICAgICAgIC5jYXBhYmls
aXR5ID0gQVJNNjRfV09SS0FST1VORF9BVF9TUEVDVUxBVEUsCisgICAgICAgIE1JRFJfQUxMX1ZF
UlNJT05TKE1JRFJfQ09SVEVYX0E3MiksCisgICAgfSwKKyAgICB7CisgICAgICAgIC5kZXNjID0g
IkFSTSBlcnJhdHVtIDEzMTkzNjciLAorICAgICAgICAuY2FwYWJpbGl0eSA9IEFSTTY0X1dPUktB
Uk9VTkRfQVRfU1BFQ1VMQVRFLAorICAgICAgICBNSURSX0FMTF9WRVJTSU9OUyhNSURSX0NPUlRF
WF9BNTcpLAorICAgIH0sCiAgICAge30sCiB9OwogCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
