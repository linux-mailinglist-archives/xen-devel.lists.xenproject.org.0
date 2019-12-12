Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E711CFA4
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:21:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifPI4-0000m0-9h; Thu, 12 Dec 2019 14:18:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifPI3-0000lu-2o
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:18:03 +0000
X-Inumbo-ID: 2f8842b8-1cea-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f8842b8-1cea-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 14:17:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E81E7B170;
 Thu, 12 Dec 2019 14:17:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu, 12 Dec 2019 15:17:50 +0100
Message-Id: <20191212141750.1896-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/balloon: fix ballooned page accounting
 without hotplug enabled
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
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBDT05GSUdfWEVOX0JBTExPT05fTUVNT1JZX0hPVFBMVUcgaXMgbm90IGRlZmluZWQKcmVz
ZXJ2ZV9hZGRpdGlvbmFsX21lbW9yeSgpIHdpbGwgc2V0IGJhbGxvb25fc3RhdHMudGFyZ2V0X3Bh
Z2VzIHRvIGEKd3JvbmcgdmFsdWUgaW4gY2FzZSB0aGVyZSBhcmUgc3RpbGwgc29tZSBiYWxsb29u
ZWQgcGFnZXMgYWxsb2NhdGVkIHZpYQphbGxvY194ZW5iYWxsb29uZWRfcGFnZXMoKS4KClRoaXMg
d2lsbCByZXN1bHQgaW4gYmFsbG9vbl9wcm9jZXNzKCkgbm8gbG9uZ2VyIGJlIHRyaWdnZXJlZCB3
aGVuCmJhbGxvb25lZCBwYWdlcyBhcmUgZnJlZWQgaW4gYmF0Y2hlcy4KClJlcG9ydGVkLWJ5OiBO
aWNob2xhcyBUc2lyYWtpcyA8bmlrby50c2lyYWtpc0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9iYWxsb29u
LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2JhbGxvb24uYyBiL2RyaXZlcnMveGVuL2JhbGxv
b24uYwppbmRleCA0ZjJlNzhhNWU0ZGIuLjBjMTQyYmNhYjc5ZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy94ZW4vYmFsbG9vbi5jCisrKyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwpAQCAtMzk0LDcgKzM5
NCw4IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgeGVuX21lbW9yeV9uYiA9IHsKICNl
bHNlCiBzdGF0aWMgZW51bSBicF9zdGF0ZSByZXNlcnZlX2FkZGl0aW9uYWxfbWVtb3J5KHZvaWQp
CiB7Ci0JYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXMgPSBiYWxsb29uX3N0YXRzLmN1cnJlbnRf
cGFnZXM7CisJYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXMgPSBiYWxsb29uX3N0YXRzLmN1cnJl
bnRfcGFnZXMgKworCQkJCSAgICAgYmFsbG9vbl9zdGF0cy50YXJnZXRfdW5wb3B1bGF0ZWQ7CiAJ
cmV0dXJuIEJQX0VDQU5DRUxFRDsKIH0KICNlbmRpZiAvKiBDT05GSUdfWEVOX0JBTExPT05fTUVN
T1JZX0hPVFBMVUcgKi8KLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
