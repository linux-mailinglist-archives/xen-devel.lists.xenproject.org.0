Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA281D51
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:32:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hud3y-0004tr-IN; Mon, 05 Aug 2019 13:30:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9cV=WB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hud3w-0004sR-Ei
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:30:08 +0000
X-Inumbo-ID: 24105ea2-b785-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 24105ea2-b785-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 13:30:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 664B61570;
 Mon,  5 Aug 2019 06:30:07 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E64FA3F706;
 Mon,  5 Aug 2019 06:30:05 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  5 Aug 2019 14:29:55 +0100
Message-Id: <20190805132955.1630-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805132955.1630-1-julien.grall@arm.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 4/4] xen/console: Simplify domU console
 handling in guest_console_write
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MiBwYXRocyBpbiB0aGUgZG9tVSBjb25zb2xlIGhhbmRsaW5nIGFyZSBub3cgdGhlIHNhbWUuIFNv
IHRoZXkgY2FuIGJlCm1lcmdlZCB0byBtYWtlIHRoZSBjb2RlIHNpbXBsZXIuCgpTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpBY2tlZC1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAt
IEZpeCBpbmRlbnRhdGlvbgogICAgICAgIC0gQWRkIFN0ZWZhbm8ncyByZXZpZXdlZC1ieQogICAg
ICAgIC0gQWRkIFdlaSdzIGFja2VkLWJ5Ci0tLQogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMg
fCA5ICsrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hlbi9kcml2
ZXJzL2NoYXIvY29uc29sZS5jCmluZGV4IGZhOGY1Y2ZmNGIuLjQxMDVjYTU4ZDggMTAwNjQ0Ci0t
LSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jCkBAIC01ODUsMTMgKzU4NSw4IEBAIHN0YXRpYyBsb25nIGd1ZXN0X2NvbnNvbGVfd3Jp
dGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjaGFyKSBidWZmZXIsCiAgICAgICAgICAgICAqa291
dCA9ICdcMCc7CiAgICAgICAgICAgICBzcGluX2xvY2soJmNkLT5wYnVmX2xvY2spOwogICAgICAg
ICAgICAga2NvdW50ID0ga2luIC0ga2J1ZjsKLSAgICAgICAgICAgIGlmICggYyA9PSAnXG4nICkK
LSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBjZC0+cGJ1ZltjZC0+cGJ1Zl9pZHhdID0g
J1wwJzsKLSAgICAgICAgICAgICAgICBndWVzdF9wcmludGsoY2QsIFhFTkxPR19HX0RFQlVHICIl
cyVzXG4iLCBjZC0+cGJ1Ziwga2J1Zik7Ci0gICAgICAgICAgICAgICAgY2QtPnBidWZfaWR4ID0g
MDsKLSAgICAgICAgICAgIH0KLSAgICAgICAgICAgIGVsc2UgaWYgKCBjZC0+cGJ1Zl9pZHggKyAo
a291dCAtIGtidWYpIDwgKERPTUFJTl9QQlVGX1NJWkUgLSAxKSApCisgICAgICAgICAgICBpZiAo
IGMgIT0gJ1xuJyAmJgorICAgICAgICAgICAgICAgICAoY2QtPnBidWZfaWR4ICsgKGtvdXQgLSBr
YnVmKSA8IChET01BSU5fUEJVRl9TSVpFIC0gMSkpICkKICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAvKiBidWZmZXIgdGhlIG91dHB1dCB1bnRpbCBhIG5ld2xpbmUgKi8KICAgICAgICAg
ICAgICAgICBtZW1jcHkoY2QtPnBidWYgKyBjZC0+cGJ1Zl9pZHgsIGtidWYsIGtvdXQgLSBrYnVm
KTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
