Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F177E4AEAE
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 01:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdNOf-0004qv-Gt; Tue, 18 Jun 2019 23:20:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdNOe-0004qq-Bl
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 23:20:12 +0000
X-Inumbo-ID: 9df34c56-921f-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9df34c56-921f-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 23:20:10 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D559720873;
 Tue, 18 Jun 2019 23:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560900010;
 bh=COv/dqOuYFQigpJGfouL+o6mtGDm7jWJYT7RnMZ5vfE=;
 h=Date:From:To:cc:Subject:From;
 b=eNSuMgjH2ts1UvdDmNnt8PKOuP0TjdYzqduXGM0xWnPXaJYuXSTKS1ywZDVzrC72e
 hrt3EMFLOaOCRZuEK0BzisjL9NyB93PjaiTb3t96COPVtT7LwP5F3ANhvv68WO29cq
 5riSL209iFRVqlUzz5I5rmPRkWuee1vIIOms7J1s=
Date: Tue, 18 Jun 2019 16:20:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/5] iomem memory policy
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, andrew.cooper3@citrix.com,
 julien.grall@arm.com, JBeulich@suse.com, ian.jackson@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBhIG1lbW9yeSBwb2xpY3kgcGFyYW1ldGVy
IGZvciB0aGUgaW9tZW0gb3B0aW9uLApzbyB0aGF0IHdlIGNhbiBtYXAgYW4gaW9tZW0gcmVnaW9u
IGludG8gYSBndWVzdCBhcyBjYWNoZWFibGUgbWVtb3J5LgoKSSByZW1vdmVkIG90aGVyIHRoaW5n
cyByZWxhdGVkIHRvIHJlc2VydmVkLW1lbW9yeSBvbiBBcm0sIEknbGwgc2VuZCB0aGVtCnNlcGFy
YXRlbHkuCgpDaGVlcnMsCgpTdGVmYW5vCgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQgMmFjNDhmZDUyZDg0NmE4YzM5NDkzNzNhYTBkNzc2YzZjYjU0NTJkYjoKCiAgeDg2L3gy
QVBJQzogdGlnaHRlbiBjaGVjayBpbiBjbHVzdGVyIG1vZGUgSVBJIHNlbmRpbmcgKDIwMTktMDYt
MTcgMTc6Mzg6MzUgKzAyMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiAgaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFi
ZWxsaW5pL3hlbi11bnN0YWJsZS5naXQgCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8g
MjA5MzkxYzM5OTQ0ZjI2ODNmZWM0MTY0ZjFlYmE4MTM0NjdlNWI0NDoKCiAgeGVuL2FybTogY2xh
cmlmeSB0aGUgc3VwcG9ydCBzdGF0dXMgb2YgaW9tZW0gY29uZmlndXJhdGlvbnMgKDIwMTktMDYt
MTggMTY6MTY6MjggLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoNSk6CiAgICAg
IHhlbjogYWRkIGEgcDJtdCBwYXJhbWV0ZXIgdG8gbWFwX21taW9fcmVnaW9ucwogICAgICB4ZW46
IGV4dGVuZCBYRU5fRE9NQ1RMX21lbW9yeV9tYXBwaW5nIHRvIGhhbmRsZSBtZW1vcnkgcG9saWN5
CiAgICAgIGxpYnhjOiBpbnRyb2R1Y2UgeGNfZG9tYWluX21lbV9tYXBfcG9saWN5CiAgICAgIGxp
YnhsL3hsOiBhZGQgbWVtb3J5IHBvbGljeSBvcHRpb24gdG8gaW9tZW0KICAgICAgeGVuL2FybTog
Y2xhcmlmeSB0aGUgc3VwcG9ydCBzdGF0dXMgb2YgaW9tZW0gY29uZmlndXJhdGlvbnMKCiBTVVBQ
T1JULm1kICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkb2NzL21hbi94bC5jZmcuNS5w
b2QuaW4gICAgICAgICB8IDEwICsrKysrKysrKy0KIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3Ry
bC5oICAgIHwgIDggKysrKysrKysKIHRvb2xzL2xpYnhjL3hjX2RvbWFpbi5jICAgICAgICAgIHwg
MjQgKysrKysrKysrKysrKysrKysrKystLS0tCiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAg
ICAgICB8ICA1ICsrKysrCiB0b29scy9saWJ4bC9saWJ4bF9hcmNoLmggICAgICAgICB8ICAzICsr
KwogdG9vbHMvbGlieGwvbGlieGxfYXJtLmMgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwog
dG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICAgICAgfCAxMiArKysrKysrKysrLS0KIHRvb2xz
L2xpYnhsL2xpYnhsX3R5cGVzLmlkbCAgICAgIHwgIDkgKysrKysrKysrCiB0b29scy9saWJ4bC9s
aWJ4bF94ODYuYyAgICAgICAgICB8IDEyICsrKysrKysrKysrKwogdG9vbHMveGwveGxfcGFyc2Uu
YyAgICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKystCiB4ZW4vYXJjaC9hcm0v
YWNwaS9kb21haW5fYnVpbGQuYyB8ICA0ICsrLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YyAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL2FybS9naWMtdjIuYyAgICAgICAgICAgIHwgIDMgKyst
CiB4ZW4vYXJjaC9hcm0vcDJtLmMgICAgICAgICAgICAgICB8IDIxICsrKystLS0tLS0tLS0tLS0t
LS0tLQogeGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9leHlub3M1LmMgfCAgNiArKysrLS0KIHhlbi9h
cmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYyAgIHwgMTIgKysrKysrKystLS0tCiB4ZW4vYXJjaC9h
cm0vdHJhcHMuYyAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC9hcm0vdmdpYy12Mi5jICAg
ICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLXYyLmMgICAgICB8ICAyICst
CiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYv
bW0vcDJtLmMgICAgICAgICAgICB8ICA4ICsrKystLS0tCiB4ZW4vY29tbW9uL2RvbWN0bC5jICAg
ICAgICAgICAgICB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIHhlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcDJt
LmggICAgICAgIHwgMTUgLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3AybS5o
ICAgICAgICB8ICA4ICsrKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAgICB8
IDIzICsrKysrKysrKysrKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS94ZW4vcDJtLWNvbW1vbi5o
ICAgICB8IDExICsrKysrKystLS0tCiAyOCBmaWxlcyBjaGFuZ2VkLCAyMDcgaW5zZXJ0aW9ucygr
KSwgNjggZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
