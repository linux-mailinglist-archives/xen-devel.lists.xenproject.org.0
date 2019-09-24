Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36540BCA65
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:38:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCluX-0000QG-N7; Tue, 24 Sep 2019 14:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCluW-0000Q9-3j
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:35:24 +0000
X-Inumbo-ID: 89c5708e-ded8-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 89c5708e-ded8-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 14:35:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D5D31570;
 Tue, 24 Sep 2019 07:35:21 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC1D53F59C;
 Tue, 24 Sep 2019 07:35:20 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 15:35:14 +0100
Message-Id: <20190924143515.8810-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190924143515.8810-1-julien.grall@arm.com>
References: <20190924143515.8810-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 v2 1/2] xen/arm: Implement workaround
 for Cortex A-57 and Cortex A72 AT speculate
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
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBp
biB2MjoKICAgICAgICAtIEFkZCBtaXNzaW5nIHwKLS0tCiBkb2NzL21pc2MvYXJtL3NpbGljb24t
ZXJyYXRhLnR4dCB8ICAyICsrCiB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgICAgICAgICB8IDEw
ICsrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0IGIvZG9jcy9taXNjL2FybS9zaWxp
Y29uLWVycmF0YS50eHQKaW5kZXggNmNkMTM2NmYxNS4uMTFlNWE5ZGNlYyAxMDA2NDQKLS0tIGEv
ZG9jcy9taXNjL2FybS9zaWxpY29uLWVycmF0YS50eHQKKysrIGIvZG9jcy9taXNjL2FybS9zaWxp
Y29uLWVycmF0YS50eHQKQEAgLTQ4LDUgKzQ4LDcgQEAgc3RhYmxlIGh5cGVydmlzb3JzLgogfCBB
Uk0gICAgICAgICAgICB8IENvcnRleC1BNTcgICAgICB8ICM4NTI1MjMgICAgICAgICB8IE4vQSAg
ICAgICAgICAgICAgICAgICAgIHwKIHwgQVJNICAgICAgICAgICAgfCBDb3J0ZXgtQTU3ICAgICAg
fCAjODMyMDc1ICAgICAgICAgfCBBUk02NF9FUlJBVFVNXzgzMjA3NSAgICB8CiB8IEFSTSAgICAg
ICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwgIzgzNDIyMCAgICAgICAgIHwgQVJNNjRfRVJSQVRV
TV84MzQyMjAgICAgfAorfCBBUk0gICAgICAgICAgICB8IENvcnRleC1BNTcgICAgICB8ICMxMzE5
NTM3ICAgICAgICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwKK3wgQVJNICAgICAgICAgICAg
fCBDb3J0ZXgtQTcyICAgICAgfCAjMTMxOTM2NyAgICAgICAgfCBOL0EgICAgICAgICAgICAgICAg
ICAgICB8CiB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE3NiAgICAgIHwgIzExNjU1MjIgICAg
ICAgIHwgTi9BICAgICAgICAgICAgICAgICAgICAgfAogfCBBUk0gICAgICAgICAgICB8IE1NVS01
MDAgICAgICAgICB8ICM4NDI4NjkgICAgICAgICB8IE4vQSAgICAgICAgICAgICAgICAgICAgIHwK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyBiL3hlbi9hcmNoL2FybS9jcHVl
cnJhdGEuYwppbmRleCA2ZjQ4M2IyZDhkLi5kYTcyYjAyNDQyIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC9hcm0vY3B1ZXJyYXRhLmMKKysrIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCkBAIC00ODEs
NiArNDgxLDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJtX2NwdV9jYXBhYmlsaXRpZXMgYXJt
X2VycmF0YVtdID0gewogICAgICAgICAuY2FwYWJpbGl0eSA9IEFSTTY0X1dPUktBUk9VTkRfQVRf
U1BFQ1VMQVRFLAogICAgICAgICBNSURSX1JBTkdFKE1JRFJfQ09SVEVYX0E3NiwgMCwgMiA8PCBN
SURSX1ZBUklBTlRfU0hJRlQpLAogICAgIH0sCisgICAgeworICAgICAgICAuZGVzYyA9ICJBUk0g
ZXJyYXR1bSAxMzE5NTM3IiwKKyAgICAgICAgLmNhcGFiaWxpdHkgPSBBUk02NF9XT1JLQVJPVU5E
X0FUX1NQRUNVTEFURSwKKyAgICAgICAgTUlEUl9BTExfVkVSU0lPTlMoTUlEUl9DT1JURVhfQTcy
KSwKKyAgICB9LAorICAgIHsKKyAgICAgICAgLmRlc2MgPSAiQVJNIGVycmF0dW0gMTMxOTM2NyIs
CisgICAgICAgIC5jYXBhYmlsaXR5ID0gQVJNNjRfV09SS0FST1VORF9BVF9TUEVDVUxBVEUsCisg
ICAgICAgIE1JRFJfQUxMX1ZFUlNJT05TKE1JRFJfQ09SVEVYX0E1NyksCisgICAgfSwKICAgICB7
fSwKIH07CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
