Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DECD18273
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 00:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOVLH-0005bY-3B; Wed, 08 May 2019 22:47:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJge=TI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOVLG-0005bT-8J
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 22:47:14 +0000
X-Inumbo-ID: 383677ac-71e3-11e9-8388-fb2894b3ffc4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 383677ac-71e3-11e9-8388-fb2894b3ffc4;
 Wed, 08 May 2019 22:47:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12FA2214AF;
 Wed,  8 May 2019 22:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557355632;
 bh=qhG7DnfGbgfD+4x+9UUAOCturtHny4LJOZ3KAWc3pyo=;
 h=Date:From:To:cc:Subject:From;
 b=HyPKYbfB2NxNXKGuG/KelxYkcckoo8nyIPDrXN3e+A2EuV5VXFB0bgrXoOBkSd87s
 8QLvB0upVUXCiM0E2Zc1EwIH3Z0Xc4dlB21h72jS4bRln4C4KxMDEy2NOQMcxD4cRH
 vfPSA7/XKy4swRtEL4HSB5cP+rvWYY91l6iaKDoU=
Date: Wed, 8 May 2019 15:47:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/3] PDX fixes
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, JBeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaXMgYSBzbWFsbCBjb2xsZWN0aW9uIG9mIFBEWCBmaXhlcy4g
VGhleSBhcmUgdGVjaG5pY2FsbHkKaW5kZXBlbmRlbnQgYnV0IGRpc2NvdmVyZWQgdG9nZXRoZXIg
dHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIG1lbW9yeQp3YXN0ZSBjYXVzZWQgYnkgdGhlIGZyYW1l
dGFibGUgYWxsb2NhdGlvbiBvbiBYaWxpbnggWnlucU1QLgoKQ2hlZXJzLAoKU3RlZmFubwoKClRo
ZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZGM0OTc2MzVkOTNmNjY3MmY4MjcyN2Fk
OTdhNTUyMDUxNzdiZTJhYToKCiAgYnVpbGQgc3lzdGVtOiBtYWtlIGluc3RhbGwtc3R1YmRvbSBk
ZXBlbmQgb24gaW5zdGFsbC10b29scyBhZ2FpbiAoMjAxOS0wNC0yMyAxNzowMDowOCArMDEwMCkK
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwOi8veGVuYml0
cy54ZW5wcm9qZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxl
LmdpdCAKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2NzNmYjE0ZGM5OTcxMTk4NTM5
ZDAyYzUwM2FiYzg1ZDMwZTk1NDI2OgoKICB4ZW4vYXJtOiBmaXggbWFzayBjYWxjdWxhdGlvbiBp
biBwZHhfaW5pdF9tYXNrICgyMDE5LTA1LTA4IDE1OjM3OjAzIC0wNzAwKQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpTdGVm
YW5vIFN0YWJlbGxpbmkgKDMpOgogICAgICB4ZW4vYXJtOiBmaXggbnJfcGR4cyBjYWxjdWxhdGlv
bgogICAgICB4ZW46IGFjdHVhbGx5IHNraXAgdGhlIGZpcnN0IE1BWF9PUkRFUiBiaXRzIGluIHBm
bl9wZHhfaG9sZV9zZXR1cAogICAgICB4ZW4vYXJtOiBmaXggbWFzayBjYWxjdWxhdGlvbiBpbiBw
ZHhfaW5pdF9tYXNrCgogeGVuL2FyY2gvYXJtL21tLmMgICAgfCAgNCArKy0tCiB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyB8ICA5ICsrKysrKysrLQogeGVuL2NvbW1vbi9wZHguYyAgICAgfCAxNCArKysr
KysrKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
