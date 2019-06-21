Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E94F1BB
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2019 01:58:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heTNk-0004Sn-3m; Fri, 21 Jun 2019 23:55:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heTNh-0004Sh-VV
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 23:55:45 +0000
X-Inumbo-ID: 151df000-9480-11e9-8728-bf71a9abe478
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 151df000-9480-11e9-8728-bf71a9abe478;
 Fri, 21 Jun 2019 23:55:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB743206B6;
 Fri, 21 Jun 2019 23:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561161343;
 bh=hapcLdfN+hR7QKbisPkA3qm/OhUAfj6Kf0y5TvooPzo=;
 h=Date:From:To:cc:Subject:From;
 b=wtQFRGHsWeh23RmgNk0NFn6WhFnZGqEIQJDhV1RXFughgsZT2BDrzuKjmRMucaxsP
 KwKABJzwki/UK4h328blQlFqqM/eNABSS22/bwHDrOStA0LGfyGh3FTHCncwZNGljK
 Q/zS6LtonzrZsGrIIKokLBwlSQG4MtEQscYEU8ZI=
Date: Fri, 21 Jun 2019 16:55:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/6] reserved-memory in dom0
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
Cc: julien.grall@arm.com, sstabellini@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBwYXJ0aWFsIHJlc2VydmVkLW1l
bW9yeSBzdXBwb3J0IGZvciBkb20wCm9ubHkgKG5vIGRvbVUgc3VwcG9ydCBmb3IgcmVzZXJ2ZWQt
bWVtb3J5IHlldC4pCgpPbmUgY2hhbmdlIGlzIHN0aWxsIG91dHN0YW5kaW5nOiBjbGVhbmluZyB1
cCBwcm9jZXNzX21lbW9yeV9ub2RlIHNvIHRoYXQKaXQgaXMgbm90IGNvbXBsZXRlbHkgc2hhcmVk
IGJldHdlZW4gdGhlIG5vcm1hbCBtZW1vcnkgY2FzZSBhbmQgdGhlCnJlc2VydmVkLW1lbW9yeSBj
YXNlLgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMTE5MTE1NjM2MTA3ODY2
MTVjMmIzYTAxY2RjYWFmMDlhNmY5ZTM4ZDoKCiAgeGVuL2FybTogZml4IG1hc2sgY2FsY3VsYXRp
b24gaW4gcGR4X2luaXRfbWFzayAoMjAxOS0wNi0yMSAxNDowNzo0NyAtMDcwMCkKCmFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRwOi8veGVuYml0cy54ZW5wcm9q
ZWN0Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxlLmdpdCAKCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBkYTUwYTNmNmQzN2FhNDJmZDczZGFiNGE1MGMy
ZGU3MTMzZDliMTYyOgoKICB4ZW4vYXJtOiBhZGQgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgdG8g
dGhlIGRvbTAgbWVtb3J5IG5vZGUgKDIwMTktMDYtMjEgMTY6NTI6MzggLTA3MDApCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ClN0ZWZhbm8gU3RhYmVsbGluaSAoNik6CiAgICAgIHhlbi9hcm06IGV4dGVuZCBkZXZpY2VfdHJl
ZV9mb3JfZWFjaF9ub2RlCiAgICAgIHhlbi9hcm06IG1ha2UgcHJvY2Vzc19tZW1vcnlfbm9kZSBh
IGRldmljZV90cmVlX25vZGVfZnVuYwogICAgICB4ZW4vYXJtOiBrZWVwIHRyYWNrIG9mIHJlc2Vy
dmVkLW1lbW9yeSByZWdpb25zCiAgICAgIHhlbi9hcm06IGhhbmRsZSByZXNlcnZlZC1tZW1vcnkg
aW4gY29uc2lkZXJfbW9kdWxlcyBhbmQgZHRfdW5yZXNlcnZlZF9yZWdpb25zCiAgICAgIHhlbi9h
cm06IGRvbid0IGlvbWVtX3Blcm1pdF9hY2Nlc3MgZm9yIHJlc2VydmVkLW1lbW9yeSByZWdpb25z
CiAgICAgIHhlbi9hcm06IGFkZCByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byB0aGUgZG9tMCBt
ZW1vcnkgbm9kZQoKIHhlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYyAgICAgIHwgIDIgKy0KIHhlbi9h
cmNoL2FybS9ib290ZmR0LmMgICAgICAgIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgfCA0MCArKysr
KysrKysrKysrKysrKysrLS0tLS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICB8IDUz
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogeGVuL2luY2x1ZGUvYXNtLWFybS9z
ZXR1cC5oICAgfCAgMSArCiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8ICA1ICsrLS0K
IDYgZmlsZXMgY2hhbmdlZCwgMTM2IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
