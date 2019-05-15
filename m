Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC291FB72
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 22:20:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR0LP-0003jc-JF; Wed, 15 May 2019 20:17:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E9wX=TP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hR0LN-0003jX-V6
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 20:17:41 +0000
X-Inumbo-ID: 7ccc11ea-774e-11e9-96d2-3bf8880a9c96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7ccc11ea-774e-11e9-96d2-3bf8880a9c96;
 Wed, 15 May 2019 20:17:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E21C374;
 Wed, 15 May 2019 13:17:39 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 386143F703;
 Wed, 15 May 2019 13:17:38 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 May 2019 21:17:30 +0100
Message-Id: <20190515201730.19079-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/arm: traps: Avoid using BUG_ON() to check
 guest state in advance_pc()
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
Cc: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@ice.rwth-aachen.de>,
 Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbmRpdGlvbiBvZiB0aGUgQlVHX09OKCkgaW4gYWR2YW5jZV9wYygpIGlzIHByZXR0eSB3
cm9uZyBiZWNhdXNlCnRoZSBiaXRzIFsyNjoyNV0gYW5kIFsxNToxMF0gaGF2ZSBhIGRpZmZlcmVu
dCBtZWFuaW5nIGJldHdlZW4gQUFyY2gzMgphbmQgQUFyY2g2NCBzdGF0ZS4KCk9uIEFBcmNoMzIs
IHRoZXkgYXJlIHVzZWQgdG8gc3RvcmUgUFNUQVRFLklULiBPbiBBQXJjaDY0LCB0aGV5IGFyZSBS
RVMwCm9yIHVzZWQgZm9yIG5ldyBmZWF0dXJlIChlLmcgQVJNdjguMC1TU0JTLCBBUk12OC41LUJU
SSkuCgpUaGlzIG1lYW5zIGEgNjQtYml0IGd1ZXN0IHdpbGwgaGl0IHRoZSBCVUdfT04oKSBpZiBp
dCBpcyB0cnlpbmcgdG8gdXNlCmFueSBvZiB0aGVzZSBmZWF0dXJlcy4KCk1vcmUgZ2VuZXJhbGx5
LCBSRVMwIG1lYW5zIHRoYXQgdGhlIGJpdHMgaXMgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UuIFNv
CmNyYXNoaW5nIHRoZSBob3N0IGlzIGRlZmluaXRlbHkgbm90IHRoZSByaWdodCBzb2x1dGlvbi4K
CkluIHRoaXMgcGFydGljdWxhciBjYXNlLCB3ZSBvbmx5IG5lZWQgdG8ga25vdyB0aGUgZ3Vlc3Qg
d2FzIHVzaW5nIDMyLWJpdApNb2RlIGFuZCB0aGUgVGh1bWIgaW5zdHJ1Y3Rpb25zLiBTbyByZXBs
YWNlIHRoZSBCVUdfT04oKSBieSBhIHByb3BlcgpjaGVjay4KClJlcG9ydGVkLWJ5OiBMdWthcyBK
w7xuZ2VyIDxsdWthcy5qdWVuZ2VyQGljZS5yd3RoLWFhY2hlbi5kZT4KU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgVGhpcyBwYXRjaCBu
ZWVkcyB0byBiZSBiYWNrcG9ydGVkIGFzIGZhciBhcyBwb3NzaWJsZS4gT3RoZXJ3aXNlIFhlbgog
ICAgd291bGQgbm90IGJlIGFibGUgdG8gcnVuIG9uIHByb2Nlc3NvciBpbXBsZW1lbnRpbmcgQVJN
djguMC1TU0JTLAogICAgQVJNdjguNS1CVEkgb3IgQVJNdjguNS1NZW1UYWcuIFRoZSBmb3JtZXIg
aXMgYWN0dWFsbHkgdGhlIG1vc3QKICAgIGNyaXRpY2FsIGFzIHRoaXMgaXMgdXNlZCBmb3IgY29u
dHJvbGxpbmcgbWl0YWdpb24gZm9yIFNTQkQgKGFrYQogICAgU3BlY3RyZSB2NCkgaW4gaGFyZHdh
cmUuCi0tLQogeGVuL2FyY2gvYXJtL3RyYXBzLmMgfCA3ICsrLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwppbmRleCBkOGI5YThhMGYwLi43OThh
M2E0NWE0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYworKysgYi94ZW4vYXJjaC9h
cm0vdHJhcHMuYwpAQCAtMTY1MCwxMiArMTY1MCw5IEBAIGludCBjaGVja19jb25kaXRpb25hbF9p
bnN0cihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgY29uc3QgdW5pb24gaHNyIGhzcikKIHZv
aWQgYWR2YW5jZV9wYyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgY29uc3QgdW5pb24gaHNy
IGhzcikKIHsKICAgICB1bnNpZ25lZCBsb25nIGl0Yml0cywgY29uZCwgY3BzciA9IHJlZ3MtPmNw
c3I7CisgICAgYm9vbCBpc190aHVtYiA9IHBzcl9tb2RlX2lzXzMyYml0KGNwc3IpICYmIChjcHNy
ICYgUFNSX1RIVU1CKTsKIAotICAgIC8qIFBTUl9JVF9NQVNLIGJpdHMgY2FuIG9ubHkgYmUgc2V0
IGZvciAzMi1iaXQgcHJvY2Vzc29ycyBpbiBUaHVtYiBtb2RlLiAqLwotICAgIEJVR19PTiggKCFw
c3JfbW9kZV9pc18zMmJpdChjcHNyKXx8IShjcHNyJlBTUl9USFVNQikpCi0gICAgICAgICAgICAm
JiAoY3BzciZQU1JfSVRfTUFTSykgKTsKLQotICAgIGlmICggY3BzciZQU1JfSVRfTUFTSyApCisg
ICAgaWYgKCBpc190aHVtYiAmJiAoY3BzciAmIFBTUl9JVF9NQVNLKSApCiAgICAgewogICAgICAg
ICAvKiBUaGUgSVRTVEFURVs3OjBdIGJsb2NrIGlzIGNvbnRhaW5lZCBpbiBDUFNSWzE1OjEwXSxD
UFNSWzI2OjI1XQogICAgICAgICAgKgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
