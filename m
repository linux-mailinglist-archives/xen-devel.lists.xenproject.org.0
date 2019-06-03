Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79333AAE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXv2Z-0003UJ-UD; Mon, 03 Jun 2019 22:02:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXv2X-0003TO-Sg
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:02:49 +0000
X-Inumbo-ID: 52f7aa8a-864b-11e9-a35d-3f1990661454
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52f7aa8a-864b-11e9-a35d-3f1990661454;
 Mon, 03 Jun 2019 22:02:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2E7C247AE;
 Mon,  3 Jun 2019 22:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559599368;
 bh=Sb+G7D0OfxVfHWapWMJscrohNrwgbQqmQouZL6hY+FI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NnkieFNWkpSHVjMwwOlSCq4EmyjmimLWNEiAb3RVt7glXGBhs7VoDx5AkD+z6bFoy
 yfDq9HO+UOYJtT5YuvXhgwJ4AQyMQq2qM9nmMUZ/PtTMO8baksr/1fQ1yJuBQekp18
 uHe3OUCKljO8S6DRVbFUAy1p7lqA1HyvwIkT8uxY=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 15:02:45 -0700
Message-Id: <20190603220245.22750-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 julien.grall@arm.com, JBeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1hc2sgY2FsY3VsYXRpb24gaW4gcGR4X2luaXRfbWFzayBpcyB3cm9uZyB3aGVuIHRoZSBm
aXJzdCBiYW5rCnN0YXJ0cyBhdCBhZGRyZXNzIDB4MC4gVGhlIHJlYXNvbiBpcyB0aGF0IHBkeF9p
bml0X21hc2sgd2lsbCBkbyAnMCAtIDEnCmNhdXNpbmcgYW4gdW5kZXJmbG93LiBBcyBhIHJlc3Vs
dCwgdGhlIG1hc2sgYmVjb21lcyAweGZmZmZmZmZmZmZmZmZmZmYKd2hpY2ggaXMgdGhlIGJpZ2dl
c3QgcG9zc2libGUgbWFzayBhbmQgZW5kcyB1cCBjYXVzaW5nIGEgc2lnbmlmaWNhbnQKbWVtb3J5
IHdhc3RlIGluIHRoZSBmcmFtZXRhYmxlIHNpemUgY29tcHV0YXRpb24uCgpGb3IgaW5zdGFuY2Us
IG9uIHBsYXRmb3JtcyB0aGF0IGhhdmUgYSBsb3cgbWVtb3J5IGJhbmsgc3RhcnRpbmcgYXQgMHgw
CmFuZCBhIGhpZ2ggbWVtb3J5IGJhbmssIHRoZSBmcmFtZXRhYmxlIHdpbGwgZW5kIHVwIGNvdmVy
aW5nIGFsbCB0aGUKaG9sZXMgaW4gYmV0d2Vlbi4KClRoZSBwdXJwb3NlIG9mIHRoZSBtYXNrIGlz
IHRvIGJlIHBhc3NlZCBhcyBhIHBhcmFtZXRlciB0bwpwZm5fcGR4X2hvbGVfc2V0dXAsIHdoaWNo
IGJhc2VkIG9uIHRoZSBtYXNrIHBhcmFtZXRlciBjYWxjdWxhdGVzCnBmbl9wZHhfaG9sZV9zaGlm
dCwgcGZuX3BkeF9ib3R0b21fbWFzaywgZXRjLiB3aGljaCBhcmUgYWN0dWFsbHkgdGhlCmltcG9y
dGFudCBtYXNrcyBmb3IgZnJhbWV0YWJsZSBpbml0aWFsaXphdGlvbiBsYXRlciBvbi4KCnBmbl9w
ZHhfaG9sZV9zZXR1cCBuZXZlciBjb21wcmVzc2VzIGFkZHJlc3NlcyBiZWxvdyBNQVhfT1JERVIg
Yml0cyAoMUdCCm9uIEFSTSkuIFRodXMsIGl0IGlzIHNhZmUgdG8gaW5pdGlhbGl6ZSBtYXNrIHBh
c3NpbmcgMVVMTCA8PCAoTUFYX09SREVSCisgUEFHRV9TSElGVCkgYXMgc3RhcnQgYWRkcmVzcyB0
byBwZHhfaW5pdF9tYXNrLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVm
YW5vc0B4aWxpbnguY29tPgpDQzogSkJldWxpY2hAc3VzZS5jb20KQ0M6IGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20KQ0M6IEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbQpDQzogaWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbQpDQzoga29ucmFkLndpbGtAb3JhY2xlLmNvbQpDQzogdGltQHhlbi5v
cmcKQ0M6IHdlaS5saXUyQGNpdHJpeC5jb20KLS0tCgpDaGFuZ2VzIGluIHYzOgotIGltcHJvdmUg
aW4tY29kZSBjb21tZW50cwoKQ2hhbmdlcyBpbiB2MjoKLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UK
LSBhZGQgaW4tY29kZSBjb21tZW50cyByZWdhcmRpbmcgdXBkYXRlIHNpdGVzCi0gaW1wcm92ZSBp
bi1jb2RlIGNvbW1lbnRzCi0gbW92ZSB0aGUgbWFzayBpbml0aWFsaXphdGlvbiBjaGFuZ2VzIHRv
IHBkeF9pbml0X21hc2sKLS0tCiB4ZW4vYXJjaC9hcm0vc2V0dXAuYyB8IDkgKysrKysrKystCiB4
ZW4vY29tbW9uL3BkeC5jICAgICB8IDggKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0
dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCmluZGV4IGNjYjBmMTgxZWEuLjQ1MzEyZGYwMDYg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1
cC5jCkBAIC00ODIsNyArNDgyLDE0IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2b2lk
KQogewogICAgIHBhZGRyX3QgYmFua19zdGFydCwgYmFua19zaXplLCBiYW5rX2VuZDsKIAotICAg
IHU2NCBtYXNrID0gcGR4X2luaXRfbWFzayhib290aW5mby5tZW0uYmFua1swXS5zdGFydCk7Cisg
ICAgLyoKKyAgICAgKiBBcm0gZG9lcyBub3QgaGF2ZSBhbnkgcmVzdHJpY3Rpb25zIG9uIHRoZSBi
aXRzIHRvIGNvbXByZXNzLiBQYXNzIDAgdG8KKyAgICAgKiBsZXQgdGhlIGNvbW1vbiBjb2RlIGZ1
cnRoZXIgcmVzdHJpY3QgdGhlIG1hc2suCisgICAgICoKKyAgICAgKiBJZiB0aGUgbG9naWMgY2hh
bmdlcyBpbiBwZm5fcGR4X2hvbGVfc2V0dXAgd2UgbWlnaHQgaGF2ZSB0bworICAgICAqIHVwZGF0
ZSB0aGlzIGZ1bmN0aW9uIHRvby4KKyAgICAgKi8KKyAgICB1NjQgbWFzayA9IHBkeF9pbml0X21h
c2soMHgwKTsKICAgICBpbnQgYmFuazsKIAogICAgIGZvciAoIGJhbmsgPSAwIDsgYmFuayA8IGJv
b3RpbmZvLm1lbS5ucl9iYW5rczsgYmFuaysrICkKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGR4
LmMgYi94ZW4vY29tbW9uL3BkeC5jCmluZGV4IGJiN2U0MzcwNDkuLmEzYzZmNGMxZWUgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vcGR4LmMKKysrIGIveGVuL2NvbW1vbi9wZHguYwpAQCAtNTAsOSAr
NTAsMTIgQEAgc3RhdGljIHU2NCBfX2luaXQgZmlsbF9tYXNrKHU2NCBtYXNrKQogICAgIHJldHVy
biBtYXNrOwogfQogCisvKgorICogV2UgZG9uJ3QgY29tcHJlc3MgdGhlIGZpcnN0IE1BWF9PUkRF
UiBiaXQgb2YgdGhlIGFkZHJlc3Nlcy4KKyAqLwogdTY0IF9faW5pdCBwZHhfaW5pdF9tYXNrKHU2
NCBiYXNlX2FkZHIpCiB7Ci0gICAgcmV0dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIgLSAxKTsKKyAg
ICByZXR1cm4gZmlsbF9tYXNrKG1heChiYXNlX2FkZHIsICh1NjQpMSA8PCAoTUFYX09SREVSICsg
UEFHRV9TSElGVCkpIC0gMSk7CiB9CiAKIHU2NCBfX2luaXQgcGR4X3JlZ2lvbl9tYXNrKHU2NCBi
YXNlLCB1NjQgbGVuKQpAQCAtODAsNiArODMsOSBAQCB2b2lkIF9faW5pdCBwZm5fcGR4X2hvbGVf
c2V0dXAodW5zaWduZWQgbG9uZyBtYXNrKQogICAgICAqIFRoaXMgZ3VhcmFudGVlcyB0aGF0IHBh
Z2UtcG9pbnRlciBhcml0aG1ldGljIHJlbWFpbnMgdmFsaWQgd2l0aGluCiAgICAgICogY29udGln
dW91cyBhbGlnbmVkIHJhbmdlcyBvZiAyXk1BWF9PUkRFUiBwYWdlcy4gQW1vbmcgb3RoZXJzLCBv
dXIKICAgICAgKiBidWRkeSBhbGxvY2F0b3IgcmVsaWVzIG9uIHRoaXMgYXNzdW1wdGlvbi4KKyAg
ICAgKgorICAgICAqIElmIHRoZSBsb2dpYyBjaGFuZ2VzIGhlcmUsIHdlIG1pZ2h0IGhhdmUgdG8g
dXBkYXRlIHRoZSBBUk0gc3BlY2lmaWMKKyAgICAgKiBpbml0X3BkeCB0b28uCiAgICAgICovCiAg
ICAgZm9yICggaiA9IE1BWF9PUkRFUi0xOyA7ICkKICAgICB7Ci0tIAoyLjE3LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
