Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2564EFFE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 22:27:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heQ4y-0005CV-Un; Fri, 21 Jun 2019 20:24:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heQ4x-0005CD-7G
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 20:24:11 +0000
X-Inumbo-ID: 86b2d91a-9462-11e9-95b8-af25c1a2abbd
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86b2d91a-9462-11e9-95b8-af25c1a2abbd;
 Fri, 21 Jun 2019 20:24:10 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 460992084E;
 Fri, 21 Jun 2019 20:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561148649;
 bh=nmMBhSQIbEAo+yHLesSyhzfGXA5KVkjU5E+/GIc69wg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=if0S6FVwhji3Ngao0/GQrZ5Vbdc8ijV2X1dsSk5PqWAjlj62ra+8oQxowjs8Qb2WX
 qcEOU/Ln5Xvy2JEdOFN9gqzw9F4YRemYHXqEVR6t78HlqPwTEKXDXL/RE4y4qeuQBM
 QLUms/i+NcgqD2a19pigmMKSN1RVf8oobIDegetY=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Jun 2019 13:24:06 -0700
Message-Id: <20190621202407.7781-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1906211320580.25730@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211320580.25730@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v5 1/2] xen: Replace u64 with uint64_t in
 pdx_init_mask() and callers
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
Cc: andrew.cooper3@citrix.com, julien.grall@arm.com, sstabellini@kernel.org,
 JBeulich@suse.com, Stefano Stabellini <stefanos@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIGlzIHBoYXNpbmcgb3V0IHRoZSB1c2Ugb2YgdTY0IGluIGZhdm9yIG9mIHVpbnQ2NF90LiBU
aGVyZWZvcmUsIHRoZQppbnN0YW5jZSBvZiB1NjQgaW4gdGhlIHBkeF9pbml0X21hc2soKSAoYW5k
IHRoZSBjYWxsZXJzKSBhcmUgbm93CnJlcGxhY2VkIHdpdGggdWludDY0X3QuIFRha2UgdGhlIG9w
cG9ydHVuaXR5IHRvIGFsc28gbW9kaWZ5CnNyYXRfcmVnaW9uX21hc2sgYXMgdGhpcyBpcyB1c2Vk
IHRvIHN0b3JlIHRoZSByZXN1bHQgb2YgcGR4X2luaXRfbWFzaygpLgoKU2lnbmVkLW9mZi1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDQzogSkJldWxpY2hAc3VzZS5jb20KQ0M6IGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20KQ0M6IGp1bGllbi5ncmFsbEBhcm0uY29tCi0tLQpDaGFuZ2Vz
IGluIHY1OgotIG5ldyBjb21taXQgbWVzc2FnZQotLS0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICB8
IDIgKy0KIHhlbi9hcmNoL3g4Ni9zcmF0LmMgICB8IDIgKy0KIHhlbi9jb21tb24vcGR4LmMgICAg
ICB8IDIgKy0KIHhlbi9pbmNsdWRlL3hlbi9wZHguaCB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5kZXggNDE1NmMwZWJiMy4uZDVkMTg4
YTEwNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVuL2FyY2gvYXJt
L3NldHVwLmMKQEAgLTQ4NCw3ICs0ODQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9wZHgo
dm9pZCkKIHsKICAgICBwYWRkcl90IGJhbmtfc3RhcnQsIGJhbmtfc2l6ZSwgYmFua19lbmQ7CiAK
LSAgICB1NjQgbWFzayA9IHBkeF9pbml0X21hc2soYm9vdGluZm8ubWVtLmJhbmtbMF0uc3RhcnQp
OworICAgIHVpbnQ2NF90IG1hc2sgPSBwZHhfaW5pdF9tYXNrKGJvb3RpbmZvLm1lbS5iYW5rWzBd
LnN0YXJ0KTsKICAgICBpbnQgYmFuazsKIAogICAgIGZvciAoIGJhbmsgPSAwIDsgYmFuayA8IGJv
b3RpbmZvLm1lbS5ucl9iYW5rczsgYmFuaysrICkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9z
cmF0LmMgYi94ZW4vYXJjaC94ODYvc3JhdC5jCmluZGV4IDJkNzBiNDU5MDkuLjQ3YTQyNjcyMjAg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMKKysrIGIveGVuL2FyY2gveDg2L3NyYXQu
YwpAQCAtNDAxLDcgKzQwMSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG5vZGVzX2NvdmVyX21lbW9y
eSh2b2lkKQogCiB2b2lkIF9faW5pdCBhY3BpX251bWFfYXJjaF9maXh1cCh2b2lkKSB7fQogCi1z
dGF0aWMgdTY0IF9faW5pdGRhdGEgc3JhdF9yZWdpb25fbWFzazsKK3N0YXRpYyB1aW50NjRfdCBf
X2luaXRkYXRhIHNyYXRfcmVnaW9uX21hc2s7CiAKIHN0YXRpYyBpbnQgX19pbml0IHNyYXRfcGFy
c2VfcmVnaW9uKHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqaGVhZGVyLAogCQkJCSAgICBj
b25zdCB1bnNpZ25lZCBsb25nIGVuZCkKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGR4LmMgYi94
ZW4vY29tbW9uL3BkeC5jCmluZGV4IGJiN2U0MzcwNDkuLjgzNTZmMDNjZTggMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vcGR4LmMKKysrIGIveGVuL2NvbW1vbi9wZHguYwpAQCAtNTAsNyArNTAsNyBA
QCBzdGF0aWMgdTY0IF9faW5pdCBmaWxsX21hc2sodTY0IG1hc2spCiAgICAgcmV0dXJuIG1hc2s7
CiB9CiAKLXU2NCBfX2luaXQgcGR4X2luaXRfbWFzayh1NjQgYmFzZV9hZGRyKQordWludDY0X3Qg
X19pbml0IHBkeF9pbml0X21hc2sodWludDY0X3QgYmFzZV9hZGRyKQogewogICAgIHJldHVybiBm
aWxsX21hc2soYmFzZV9hZGRyIC0gMSk7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
cGR4LmggYi94ZW4vaW5jbHVkZS94ZW4vcGR4LmgKaW5kZXggYTE1MWFhYzFhMi4uNzcwZmFkYzA2
YyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3BkeC5oCisrKyBiL3hlbi9pbmNsdWRlL3hl
bi9wZHguaApAQCAtMTMsNyArMTMsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBwZm5fdG9wX21h
c2ssIG1hX3RvcF9tYXNrOwogICAgICAgICAgICAgICAgICAgICAgICAgIChzaXplb2YoKmZyYW1l
X3RhYmxlKSAmIC1zaXplb2YoKmZyYW1lX3RhYmxlKSkpCiBleHRlcm4gdW5zaWduZWQgbG9uZyBw
ZHhfZ3JvdXBfdmFsaWRbXTsKIAotZXh0ZXJuIHU2NCBwZHhfaW5pdF9tYXNrKHU2NCBiYXNlX2Fk
ZHIpOworZXh0ZXJuIHVpbnQ2NF90IHBkeF9pbml0X21hc2sodTY0IGJhc2VfYWRkcik7CiBleHRl
cm4gdTY0IHBkeF9yZWdpb25fbWFzayh1NjQgYmFzZSwgdTY0IGxlbik7CiAKIGV4dGVybiB2b2lk
IHNldF9wZHhfcmFuZ2UodW5zaWduZWQgbG9uZyBzbWZuLCB1bnNpZ25lZCBsb25nIGVtZm4pOwot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
