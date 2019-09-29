Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEE2C1609
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 17:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEbYt-0002O0-TX; Sun, 29 Sep 2019 15:56:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEbYr-0002Nu-PC
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 15:56:37 +0000
X-Inumbo-ID: b53c931c-e2d1-11e9-96b9-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b53c931c-e2d1-11e9-96b9-12813bfff9fa;
 Sun, 29 Sep 2019 15:56:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815E51570;
 Sun, 29 Sep 2019 08:56:32 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B51DC3F706;
 Sun, 29 Sep 2019 08:56:31 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 29 Sep 2019 16:56:26 +0100
Message-Id: <20190929155627.23493-2-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190929155627.23493-1-julien.grall@arm.com>
References: <20190929155627.23493-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH for-4.13 1/2] xen/arm: domain_build: Avoid
 implicit conversion from ULL to UL
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgOC4wIHdpbGwgZmFpbCB0byBidWlsZCBkb21haW5fYnVpbGQuYyBvbiBBcm0zMiBiZWNh
dXNlIG9mIHRoZQpmb2xsb3dpbmcgZXJyb3I6Cgpkb21haW5fYnVpbGQuYzo0NDg6MjE6IGVycm9y
OiBpbXBsaWNpdCBjb252ZXJzaW9uIGZyb20gJ3Vuc2lnbmVkIGxvbmcgbG9uZycgdG8gJ3Vuc2ln
bmVkIGxvbmcnIGNoYW5nZXMgdmFsdWUgZnJvbSAxMDkwOTIxNjkzMTg0IHRvIDAKWy1XZXJyb3Is
LVdjb25zdGFudC1jb252ZXJzaW9uXQogICAgYmFua19zaXplID0gTUlOKEdVRVNUX1JBTTFfU0la
RSwga2luZm8tPnVuYXNzaWduZWRfbWVtKTsKCkFybTMyIGlzIGFibGUgdG8gc3VwcG9ydCBtb3Jl
IHRoYW4gNEdCIG9mIHBoeXNpY2FsIG1lbW9yeSwgc28gaXQgd291bGQKYmUgdGhlb3JpY2FsbHkg
cG9zc2libGUgdG8gY3JlYXRlIGRvbWlhbiB3aXRoIG1vcmUgdGhlIDRHQiBvZiBSQU0uClRoZXJl
Zm9yZSwgdGhlIHNpemUgb2YgYSBiYW5rIG1heSBub3QgZml0IGluIDMyLWJpdC4KClRoaXMgY2Fu
IGJlIHJlc29sdmVkIGJ5IHN3aXRjaCB0aGUgdmFyaWFibGUgYmFua19zaXplIGFuZCB0aGUgcGFy
YW1ldGVyCnRvdF9zaXplIHRvICJwYWRkcl90Ii4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CgogICAgSSBhbSBub3QgYXdhcmUgb2YgYW55IHVzZXJzIHRyeWluZyB0byBhbGxv
Y2F0ZSBtb3JlIHRoYW4gNEdCIFZNIGZvcgogICAgMzItYml0ICh0aGVyZSBtb3JlIGl0IGlzIGlu
IHRoZSBkb20wbGVzcyBwYXRoKS4gTm9uZXRoZWxlc3MsIGl0CiAgICB3b3VsZCBiZSBiZXN0IHRv
IGZpeCBpdCBhcyBzb29uIGFzIHBvc3NpYmxlLgoKICAgIE9ubHkgYnVpbHQgdGVzdCBpdC4KLS0t
CiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDMzN2E4
OWU1MTguLmI3OTFlNGI1MTIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTM3Nyw3ICszNzcsNyBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgYWxsb2NhdGVfbWVtb3J5XzExKHN0cnVjdCBkb21haW4gKmQsCiBz
dGF0aWMgYm9vbCBfX2luaXQgYWxsb2NhdGVfYmFua19tZW1vcnkoc3RydWN0IGRvbWFpbiAqZCwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrZXJuZWxfaW5m
byAqa2luZm8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5fdCBz
Z2ZuLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyB0b3Rfc2l6ZSkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRy
X3QgdG90X3NpemUpCiB7CiAgICAgaW50IHJlczsKICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZzsK
QEAgLTQzMyw3ICs0MzMsNyBAQCBzdGF0aWMgYm9vbCBfX2luaXQgYWxsb2NhdGVfYmFua19tZW1v
cnkoc3RydWN0IGRvbWFpbiAqZCwKIHN0YXRpYyB2b2lkIF9faW5pdCBhbGxvY2F0ZV9tZW1vcnko
c3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKIHsKICAgICB1bnNp
Z25lZCBpbnQgaTsKLSAgICB1bnNpZ25lZCBsb25nIGJhbmtfc2l6ZTsKKyAgICBwYWRkcl90IGJh
bmtfc2l6ZTsKIAogICAgIHByaW50ayhYRU5MT0dfSU5GTyAiQWxsb2NhdGluZyBtYXBwaW5ncyB0
b3RhbGxpbmcgJWxkTUIgZm9yICVwZDpcbiIsCiAgICAgICAgICAgIC8qIERvbid0IHdhbnQgZm9y
bWF0IHRoaXMgYXMgUFJJcGFkZHIgKDE2IGRpZ2l0IGhleCkgKi8KLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
