Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E072618274
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 00:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOVLZ-0005dw-Qd; Wed, 08 May 2019 22:47:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJge=TI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOVLX-0005d8-Sz
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 22:47:31 +0000
X-Inumbo-ID: 42f5e222-71e3-11e9-ac19-5beb5252e5b0
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42f5e222-71e3-11e9-ac19-5beb5252e5b0;
 Wed, 08 May 2019 22:47:31 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDBB32173E;
 Wed,  8 May 2019 22:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557355650;
 bh=iBQFuyk2ANlWeX08tzlXt00YPbSG8rP6JeadB7axNJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jXk1DqaeXwHaclmvOmy8x0gpf3bMPRz4XKWpEkym59gjbOeKkQg6Xo+ZhZCF2ne+E
 l8sMveGXkUvqVEG2xY94o8/JQhZ13a9JBdqHf93zhJsK3XGt/JcMOhtK0hB2UicXwK
 2+UAkJZPBJ4k2rYhKvk8Mv7hNdJ6wMgr01afQe7M=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Wed,  8 May 2019 15:47:27 -0700
Message-Id: <20190508224727.11549-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v2 3/3] xen/arm: fix mask calculation in
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
 JBeulich@suse.com, xen-devel@lists.xenproject.org
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
cmcKQ0M6IHdlaS5saXUyQGNpdHJpeC5jb20KLS0tCgpDaGFuZ2VzIGluIHYyOgotIHVwZGF0ZSBj
b21taXQgbWVzc2FnZQotIGFkZCBpbi1jb2RlIGNvbW1lbnRzIHJlZ2FyZGluZyB1cGRhdGUgc2l0
ZXMKLSBpbXByb3ZlIGluLWNvZGUgY29tbWVudHMKLSBtb3ZlIHRoZSBtYXNrIGluaXRpYWxpemF0
aW9uIGNoYW5nZXMgdG8gcGR4X2luaXRfbWFzawotLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwg
OSArKysrKysrKy0KIHhlbi9jb21tb24vcGR4LmMgICAgIHwgOCArKysrKysrLQogMiBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5kZXggY2NiMGYxODFl
YS4uYWZhYWZlN2I4NCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVu
L2FyY2gvYXJtL3NldHVwLmMKQEAgLTQ4Miw3ICs0ODIsMTQgQEAgc3RhdGljIHZvaWQgX19pbml0
IGluaXRfcGR4KHZvaWQpCiB7CiAgICAgcGFkZHJfdCBiYW5rX3N0YXJ0LCBiYW5rX3NpemUsIGJh
bmtfZW5kOwogCi0gICAgdTY0IG1hc2sgPSBwZHhfaW5pdF9tYXNrKGJvb3RpbmZvLm1lbS5iYW5r
WzBdLnN0YXJ0KTsKKyAgICAvKgorICAgICAqIFBhc3MgMHgwIHRvIHBkeF9pbml0X21hc2sgdG8g
Z2V0IGEgbWFzayBpbml0aWFsaXplZCB3aXRoIHRoZQorICAgICAqIGZpcnN0IHRvIDE8PE1BWF9P
UkRFUiBwYWdlcyBvZiBSQU0gbGVmdCB1bmNvbXByZXNzZWQuCisgICAgICoKKyAgICAgKiBJZiB0
aGUgbG9naWMgY2hhbmdlcyBpbiBwZm5fcGR4X2hvbGVfc2V0dXAgd2UgbWlnaHQgaGF2ZSB0bwor
ICAgICAqIHVwZGF0ZSB0aGlzIGZ1bmN0aW9uIHRvby4KKyAgICAgKi8KKyAgICB1NjQgbWFzayA9
IHBkeF9pbml0X21hc2soMHgwKTsKICAgICBpbnQgYmFuazsKIAogICAgIGZvciAoIGJhbmsgPSAw
IDsgYmFuayA8IGJvb3RpbmZvLm1lbS5ucl9iYW5rczsgYmFuaysrICkKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vcGR4LmMgYi94ZW4vY29tbW9uL3BkeC5jCmluZGV4IGJiN2U0MzcwNDkuLjI2OGQ2
ZjdlYzMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcGR4LmMKKysrIGIveGVuL2NvbW1vbi9wZHgu
YwpAQCAtNTAsOSArNTAsMTMgQEAgc3RhdGljIHU2NCBfX2luaXQgZmlsbF9tYXNrKHU2NCBtYXNr
KQogICAgIHJldHVybiBtYXNrOwogfQogCisvKgorICogV2UgYWx3YXlzIG1hcCB0aGUgZmlyc3Qg
MTw8TUFYX09SREVSIHBhZ2VzIG9mIFJBTSwgaGVuY2UsIHRoZXkKKyAqIGFyZSBsZWZ0IHVuY29t
cHJlc3NlZC4KKyAqLwogdTY0IF9faW5pdCBwZHhfaW5pdF9tYXNrKHU2NCBiYXNlX2FkZHIpCiB7
Ci0gICAgcmV0dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIgLSAxKTsKKyAgICByZXR1cm4gZmlsbF9t
YXNrKG1heChiYXNlX2FkZHIsICh1NjQpMSA8PCAoTUFYX09SREVSICsgUEFHRV9TSElGVCkpIC0g
MSk7CiB9CiAKIHU2NCBfX2luaXQgcGR4X3JlZ2lvbl9tYXNrKHU2NCBiYXNlLCB1NjQgbGVuKQpA
QCAtODAsNiArODQsOCBAQCB2b2lkIF9faW5pdCBwZm5fcGR4X2hvbGVfc2V0dXAodW5zaWduZWQg
bG9uZyBtYXNrKQogICAgICAqIFRoaXMgZ3VhcmFudGVlcyB0aGF0IHBhZ2UtcG9pbnRlciBhcml0
aG1ldGljIHJlbWFpbnMgdmFsaWQgd2l0aGluCiAgICAgICogY29udGlndW91cyBhbGlnbmVkIHJh
bmdlcyBvZiAyXk1BWF9PUkRFUiBwYWdlcy4gQW1vbmcgb3RoZXJzLCBvdXIKICAgICAgKiBidWRk
eSBhbGxvY2F0b3IgcmVsaWVzIG9uIHRoaXMgYXNzdW1wdGlvbi4KKyAgICAgKgorICAgICAqIElm
IHRoZSBsb2dpYyBjaGFuZ2VzIGhlcmUsIHdlIG1pZ2h0IGhhdmUgdG8gdXBkYXRlIGluaXRfcGR4
IHRvby4KICAgICAgKi8KICAgICBmb3IgKCBqID0gTUFYX09SREVSLTE7IDsgKQogICAgIHsKLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
