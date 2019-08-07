Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9983E4A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 02:26:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv9jY-0004es-Bd; Wed, 07 Aug 2019 00:23:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv9jX-0004dm-8s
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 00:23:15 +0000
X-Inumbo-ID: 8aea54ed-b8a9-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8aea54ed-b8a9-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 00:23:13 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94E6E21743;
 Wed,  7 Aug 2019 00:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565137392;
 bh=kySvefi7qf7TmYa7lUBxuohtznj99+jY/nnCVAYolso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lJ4Za2uWN/5ocCupfWUUp1vld+jOORX82t2FCIuBA7ZCLGh+yiBZS96eHsOSqTM9o
 VHJIDV+RZ44Z1q5t8frjjIyTGrviKzZkrHU/x7FzdDjrx7+jO4Ix/93R1Jjo06++nO
 /k17L1pP5Yah1pb2jkn4I87VFDqqSWkunzEKAcCM=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  6 Aug 2019 17:23:07 -0700
Message-Id: <20190807002311.9906-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v4 2/6] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, JBeulich@suse.com, andrew.cooper3@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgcDJtdCBwYXJhbWV0ZXIgdG8gbWFwX21taW9fcmVnaW9ucywgcGFzcyBwMm1fbW1pb19k
aXJlY3RfZGV2IG9uCkFSTSBhbmQgcDJtX21taW9fZGlyZWN0IG9uIHg4NiAtLSBubyBjaGFuZ2Vz
IGluIGJlaGF2aW9yLgoKT24geDg2LCBpbnRyb2R1Y2UgYSBtYWNybyB0byBzdHJpcCBhd2F5IHRo
ZSBsYXN0IHBhcmFtZXRlciBhbmQgcmVuYW1lCnRoZSBleGlzdGluZyBpbXBsZW1lbnRhdGlvbiBv
ZiBtYXBfbW1pb19yZWdpb25zIHRvIG1hcF9tbWlvX3JlZ2lvbi4KVXNlIG1hcF9tbWlvX3JlZ2lv
biBpbiB2cGNpIGFzIGl0IGlzIHg4Ni1vbmx5IHRvZGF5LgoKT24gQVJNLCBnaXZlbiB0aGUgc2lt
aWxhcml0eSBiZXR3ZWVuIG1hcF9tbWlvX3JlZ2lvbnMgYWZ0ZXIgdGhlIGNoYW5nZQphbmQgbWFw
X3JlZ2lvbnNfcDJtdCwgcmVtb3ZlIHVuL21hcF9yZWdpb25zX3AybXQuIEFsc28gYWRkIGFuIEFT
U0VSVCB0bwpjaGVjayB0aGF0IG9ubHkgcDJtX21taW9fKiB0eXBlcyBhcmUgcGFzc2VkIHRvIGl0
LgoKQWxzbyBmaXggdGhlIHN0eWxlIG9mIHRoZSBjb21tZW50IG9uIHRvcCBvZiBtYXBfbW1pb19y
ZWdpb25zIHNpbmNlIHdlCmFyZSBhdCBpdC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KQ0M6IEpCZXVsaWNoQHN1c2UuY29tCkNDOiBhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tCi0tLQpDaGFuZ2VzIGluIHY0OgotIHJlbmFtZSBfX21hcF9t
bWlvX3JlZ2lvbnMgdG8gbWFwX21taW9fcmVnaW9uCi0gdXNlIHAybV9pc19tbWlvCgpDaGFuZ2Vz
IGluIHYzOgotIGNvZGUgc3R5bGUKLSBpbnRyb2R1Y2UgX19tYXBfbW1pb19yZWdpb25zIG9uIHg4
NgotIGZpeCBjb21tZW50IHN0eWxlIG9uIHRvcCBvZiBtYXBfbW1pb19yZWdpb25zCi0gYWRkIGFu
IGFzc2VydCBvbiBhbGxvd2VkIHAybXQgdHlwZXMgaW4gbWFwX21taW9fcmVnaW9ucwoKQ2hhbmdl
cyBpbiB2MjoKLSBuZXcgcGF0Y2gKLS0tCiB4ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQu
YyB8ICA0ICsrLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgICAgIHwgIDIgKy0KIHhl
bi9hcmNoL2FybS9naWMtdjIuYyAgICAgICAgICAgIHwgIDMgKystCiB4ZW4vYXJjaC9hcm0vcDJt
LmMgICAgICAgICAgICAgICB8IDE5ICsrLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvZXh5bm9zNS5jIHwgIDYgKysrKy0tCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29t
YXA1LmMgICB8IDEyICsrKysrKysrLS0tLQogeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgICAg
ICAgfCAgMiArLQogeGVuL2FyY2gvYXJtL3ZnaWMtdjIuYyAgICAgICAgICAgfCAgMiArLQogeGVu
L2FyY2gvYXJtL3ZnaWMvdmdpYy12Mi5jICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2h2bS9k
b20wX2J1aWxkLmMgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAg
fCAgOCArKysrLS0tLQogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgfCAgNyArKysr
KystCiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAgICAgICB8ICAyICstCiB4ZW4vaW5jbHVk
ZS9hc20tYXJtL3AybS5oICAgICAgICB8IDE1IC0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9wMm0uaCAgICAgICAgfCAgOCArKysrKysrKwogeGVuL2luY2x1ZGUveGVuL3AybS1j
b21tb24uaCAgICAgfCAxMSArKysrKysrLS0tLQogMTYgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0
aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FjcGkv
ZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYwppbmRleCAx
YjFjZmFiYjAwLi4wOWY5MWNjOGJmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYWNwaS9kb21h
aW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYwpAQCAtMTkz
LDcgKzE5Myw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBhY3BpX21hcF9vdGhlcl90YWJsZXMoc3Ry
dWN0IGRvbWFpbiAqZCkKICAgICB7CiAgICAgICAgIGFkZHIgPSBhY3BpX2dibF9yb290X3RhYmxl
X2xpc3QudGFibGVzW2ldLmFkZHJlc3M7CiAgICAgICAgIHNpemUgPSBhY3BpX2dibF9yb290X3Rh
YmxlX2xpc3QudGFibGVzW2ldLmxlbmd0aDsKLSAgICAgICAgcmVzID0gbWFwX3JlZ2lvbnNfcDJt
dChkLAorICAgICAgICByZXMgPSBtYXBfbW1pb19yZWdpb25zKGQsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2FkZHJfdG9fZ2ZuKGFkZHIpLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFBGTl9VUChzaXplKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
YWRkcl90b19tZm4oYWRkciksCkBAIC01NDcsNyArNTQ3LDcgQEAgaW50IF9faW5pdCBwcmVwYXJl
X2FjcGkoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKICAgICBh
Y3BpX2NyZWF0ZV9lZmlfbW1hcF90YWJsZShkLCAma2luZm8tPm1lbSwgdGJsX2FkZCk7CiAKICAg
ICAvKiBNYXAgdGhlIEVGSSBhbmQgQUNQSSB0YWJsZXMgdG8gRG9tMCAqLwotICAgIHJjID0gbWFw
X3JlZ2lvbnNfcDJtdChkLAorICAgIHJjID0gbWFwX21taW9fcmVnaW9ucyhkLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICBnYWRkcl90b19nZm4oZC0+YXJjaC5lZmlfYWNwaV9ncGEpLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICBQRk5fVVAoZC0+YXJjaC5lZmlfYWNwaV9sZW4pLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICB2aXJ0X3RvX21mbihkLT5hcmNoLmVmaV9hY3BpX3RhYmxl
KSwKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYwppbmRleCA0Yzg0MDQxNTVhLi41NDRiMDA0MGNlIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCkBAIC0xMTY4LDcgKzExNjgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBtYXBfcmFuZ2Vf
dG9fZG9tYWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAogCiAgICAgaWYgKCBu
ZWVkX21hcHBpbmcgKQogICAgIHsKLSAgICAgICAgcmVzID0gbWFwX3JlZ2lvbnNfcDJtdChkLAor
ICAgICAgICByZXMgPSBtYXBfbW1pb19yZWdpb25zKGQsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2FkZHJfdG9fZ2ZuKGFkZHIpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFBGTl9VUChsZW4pLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3Rv
X21mbihhZGRyKSwKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjIuYyBiL3hlbi9hcmNo
L2FybS9naWMtdjIuYwppbmRleCAyNTY5ODhjNjY1Li5kMmVmMzYxZmM3IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKKysrIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCkBAIC03MDEs
NyArNzAxLDggQEAgc3RhdGljIGludCBnaWN2Ml9tYXBfaHdkb3duX2V4dHJhX21hcHBpbmdzKHN0
cnVjdCBkb21haW4gKmQpCiAKICAgICAgICAgcmV0ID0gbWFwX21taW9fcmVnaW9ucyhkLCBnYWRk
cl90b19nZm4odjJtX2RhdGEtPmFkZHIpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFBGTl9VUCh2Mm1fZGF0YS0+c2l6ZSksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWFkZHJfdG9fbWZuKHYybV9kYXRhLT5hZGRyKSk7CisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWFkZHJfdG9fbWZuKHYybV9kYXRhLT5hZGRyKSwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwMm1fbW1pb19kaXJlY3RfZGV2KTsKICAgICAgICAgaWYgKCByZXQgKQogICAg
ICAgICB7CiAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiR0lDdjI6IE1hcCB2Mm0gZnJh
bWUgdG8gZCVkIGZhaWxlZC5cbiIsCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94
ZW4vYXJjaC9hcm0vcDJtLmMKaW5kZXggZTI4ZWExYzg1YS4uNGIyNmJjYTkyYSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL3AybS5jCisrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwpAQCAtMTMxMCwz
MSArMTMxMCwxNiBAQCBzdGF0aWMgaW5saW5lIGludCBwMm1fcmVtb3ZlX21hcHBpbmcoc3RydWN0
IGRvbWFpbiAqZCwKICAgICByZXR1cm4gcmM7CiB9CiAKLWludCBtYXBfcmVnaW9uc19wMm10KHN0
cnVjdCBkb21haW4gKmQsCitpbnQgbWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAog
ICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgZ2ZuLAogICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBuciwKICAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbiwKICAgICAgICAg
ICAgICAgICAgICAgIHAybV90eXBlX3QgcDJtdCkKIHsKKyAgICBBU1NFUlQocDJtX2lzX21taW8o
cDJtdCkpOwogICAgIHJldHVybiBwMm1faW5zZXJ0X21hcHBpbmcoZCwgZ2ZuLCBuciwgbWZuLCBw
Mm10KTsKIH0KIAotaW50IHVubWFwX3JlZ2lvbnNfcDJtdChzdHJ1Y3QgZG9tYWluICpkLAotICAg
ICAgICAgICAgICAgICAgICAgICBnZm5fdCBnZm4sCi0gICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgbnIsCi0gICAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbikKLXsKLSAg
ICByZXR1cm4gcDJtX3JlbW92ZV9tYXBwaW5nKGQsIGdmbiwgbnIsIG1mbik7Ci19Ci0KLWludCBt
YXBfbW1pb19yZWdpb25zKHN0cnVjdCBkb21haW4gKmQsCi0gICAgICAgICAgICAgICAgICAgICBn
Zm5fdCBzdGFydF9nZm4sCi0gICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yLAot
ICAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuKQotewotICAgIHJldHVybiBwMm1faW5zZXJ0
X21hcHBpbmcoZCwgc3RhcnRfZ2ZuLCBuciwgbWZuLCBwMm1fbW1pb19kaXJlY3RfZGV2KTsKLX0K
LQogaW50IHVubWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAg
ICAgICAgICAgICBnZm5fdCBzdGFydF9nZm4sCiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgbnIsCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2V4eW5vczUu
YyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvZXh5bm9zNS5jCmluZGV4IDY1NjA1MDcwOTIuLjk3
Y2QwODA3NTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvZXh5bm9zNS5jCisr
KyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvZXh5bm9zNS5jCkBAIC04MywxMSArODMsMTMgQEAg
c3RhdGljIGludCBleHlub3M1MjUwX3NwZWNpZmljX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCkK
IHsKICAgICAvKiBNYXAgdGhlIGNoaXAgSUQgKi8KICAgICBtYXBfbW1pb19yZWdpb25zKGQsIGdh
ZGRyX3RvX2dmbihFWFlOT1M1X1BBX0NISVBJRCksIDEsCi0gICAgICAgICAgICAgICAgICAgICBt
YWRkcl90b19tZm4oRVhZTk9TNV9QQV9DSElQSUQpKTsKKyAgICAgICAgICAgICAgICAgICAgIG1h
ZGRyX3RvX21mbihFWFlOT1M1X1BBX0NISVBJRCksCisgICAgICAgICAgICAgICAgICAgICBwMm1f
bW1pb19kaXJlY3RfZGV2KTsKIAogICAgIC8qIE1hcCB0aGUgUFdNIHJlZ2lvbiAqLwogICAgIG1h
cF9tbWlvX3JlZ2lvbnMoZCwgZ2FkZHJfdG9fZ2ZuKEVYWU5PUzVfUEFfVElNRVIpLCAyLAotICAg
ICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKEVYWU5PUzVfUEFfVElNRVIpKTsKKyAgICAg
ICAgICAgICAgICAgICAgIG1hZGRyX3RvX21mbihFWFlOT1M1X1BBX1RJTUVSKSwKKyAgICAgICAg
ICAgICAgICAgICAgIHAybV9tbWlvX2RpcmVjdF9kZXYpOwogCiAgICAgcmV0dXJuIDA7CiB9CmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1LmMgYi94ZW4vYXJjaC9hcm0v
cGxhdGZvcm1zL29tYXA1LmMKaW5kZXggYWVlMjRlNGQyOC4uYzU3MDFkZmQ2YyAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFwNS5jCisrKyBiL3hlbi9hcmNoL2FybS9wbGF0
Zm9ybXMvb21hcDUuYwpAQCAtOTksMTkgKzk5LDIzIEBAIHN0YXRpYyBpbnQgb21hcDVfc3BlY2lm
aWNfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIC8qIE1hcCB0aGUgUFJNIG1vZHVs
ZSAqLwogICAgIG1hcF9tbWlvX3JlZ2lvbnMoZCwgZ2FkZHJfdG9fZ2ZuKE9NQVA1X1BSTV9CQVNF
KSwgMiwKLSAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3RvX21mbihPTUFQNV9QUk1fQkFTRSkp
OworICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKE9NQVA1X1BSTV9CQVNFKSwKKyAg
ICAgICAgICAgICAgICAgICAgIHAybV9tbWlvX2RpcmVjdF9kZXYpOwogCiAgICAgLyogTWFwIHRo
ZSBQUk1fTVBVICovCiAgICAgbWFwX21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19nZm4oT01BUDVf
UFJDTV9NUFVfQkFTRSksIDEsCi0gICAgICAgICAgICAgICAgICAgICBtYWRkcl90b19tZm4oT01B
UDVfUFJDTV9NUFVfQkFTRSkpOworICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKE9N
QVA1X1BSQ01fTVBVX0JBU0UpLAorICAgICAgICAgICAgICAgICAgICAgcDJtX21taW9fZGlyZWN0
X2Rldik7CiAKICAgICAvKiBNYXAgdGhlIFdha2V1cCBHZW4gKi8KICAgICBtYXBfbW1pb19yZWdp
b25zKGQsIGdhZGRyX3RvX2dmbihPTUFQNV9XS1VQR0VOX0JBU0UpLCAxLAotICAgICAgICAgICAg
ICAgICAgICAgbWFkZHJfdG9fbWZuKE9NQVA1X1dLVVBHRU5fQkFTRSkpOworICAgICAgICAgICAg
ICAgICAgICAgbWFkZHJfdG9fbWZuKE9NQVA1X1dLVVBHRU5fQkFTRSksCisgICAgICAgICAgICAg
ICAgICAgICBwMm1fbW1pb19kaXJlY3RfZGV2KTsKIAogICAgIC8qIE1hcCB0aGUgb24tY2hpcCBT
UkFNICovCiAgICAgbWFwX21taW9fcmVnaW9ucyhkLCBnYWRkcl90b19nZm4oT01BUDVfU1JBTV9Q
QSksIDMyLAotICAgICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKE9NQVA1X1NSQU1fUEEp
KTsKKyAgICAgICAgICAgICAgICAgICAgIG1hZGRyX3RvX21mbihPTUFQNV9TUkFNX1BBKSwKKyAg
ICAgICAgICAgICAgICAgICAgIHAybV9tbWlvX2RpcmVjdF9kZXYpOwogCiAgICAgcmV0dXJuIDA7
CiB9CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFw
cy5jCmluZGV4IGYwNjJhZTZmNmEuLjcyMDk0MDVkODAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2Fy
bS90cmFwcy5jCisrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCkBAIC0xODc5LDcgKzE4NzksNyBA
QCBzdGF0aWMgYm9vbCB0cnlfbWFwX21taW8oZ2ZuX3QgZ2ZuKQogICAgIGlmICggIWlvbWVtX2Fj
Y2Vzc19wZXJtaXR0ZWQoZCwgbWZuX3gobWZuKSwgbWZuX3gobWZuKSArIDEpICkKICAgICAgICAg
cmV0dXJuIGZhbHNlOwogCi0gICAgcmV0dXJuICFtYXBfcmVnaW9uc19wMm10KGQsIGdmbiwgMSwg
bWZuLCBwMm1fbW1pb19kaXJlY3RfYyk7CisgICAgcmV0dXJuICFtYXBfbW1pb19yZWdpb25zKGQs
IGdmbiwgMSwgbWZuLCBwMm1fbW1pb19kaXJlY3RfYyk7CiB9CiAKIHN0YXRpYyB2b2lkIGRvX3Ry
YXBfc3RhZ2UyX2Fib3J0X2d1ZXN0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLApkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMtdjIuYyBiL3hlbi9hcmNoL2FybS92Z2ljLXYyLmMKaW5k
ZXggNjRiMTQxZmVhNS4uMTU0MzYyNWVhNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMt
djIuYworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12Mi5jCkBAIC02OTEsNyArNjkxLDcgQEAgc3Rh
dGljIGludCB2Z2ljX3YyX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCiAgICAgICogcmVn
aW9uIG9mIHRoZSBndWVzdC4KICAgICAgKi8KICAgICByZXQgPSBtYXBfbW1pb19yZWdpb25zKGQs
IGdhZGRyX3RvX2dmbihjYmFzZSksIGNzaXplIC8gUEFHRV9TSVpFLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbWFkZHJfdG9fbWZuKHZiYXNlKSk7CisgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtYWRkcl90b19tZm4odmJhc2UpLCBwMm1fbW1pb19kaXJlY3RfZGV2KTsKICAgICBpZiAo
IHJldCApCiAgICAgICAgIHJldHVybiByZXQ7CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92
Z2ljL3ZnaWMtdjIuYyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMtdjIuYwppbmRleCBiNWJhNGFj
ZTg3Li4wNGYzNGRkYWI1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLXYyLmMK
KysrIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy12Mi5jCkBAIC0zMDksNyArMzA5LDcgQEAgaW50
IHZnaWNfdjJfbWFwX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluICpkKQogICAgICAqIHJlZ2lvbiBv
ZiB0aGUgZ3Vlc3QuCiAgICAgICovCiAgICAgcmV0ID0gbWFwX21taW9fcmVnaW9ucyhkLCBnYWRk
cl90b19nZm4oY2Jhc2UpLCBjc2l6ZSAvIFBBR0VfU0laRSwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1hZGRyX3RvX21mbih2YmFzZSkpOworICAgICAgICAgICAgICAgICAgICAgICAgICAg
bWFkZHJfdG9fbWZuKHZiYXNlKSwgcDJtX21taW9fZGlyZWN0X2Rldik7CiAgICAgaWYgKCByZXQg
KQogICAgIHsKICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIlVuYWJsZSB0byByZW1hcCBW
R0lDIENQVSB0byBWQ1BVXG4iKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9i
dWlsZC5jIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKaW5kZXggODg0NTM5OWFlOS4u
MmQzOTQwYjBmYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKKysr
IGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKQEAgLTc5LDcgKzc5LDcgQEAgc3RhdGlj
IGludCBfX2luaXQgbW9kaWZ5X2lkZW50aXR5X21taW8oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgbG9uZyBwZm4sCiAKICAgICBmb3IgKCA7IDsgKQogICAgIHsKLSAgICAgICAgcmMgPSBtYXAg
PyAgIG1hcF9tbWlvX3JlZ2lvbnMoZCwgX2dmbihwZm4pLCBucl9wYWdlcywgX21mbihwZm4pKQor
ICAgICAgICByYyA9IG1hcCA/IG1hcF9tbWlvX3JlZ2lvbihkLCBfZ2ZuKHBmbiksIG5yX3BhZ2Vz
LCBfbWZuKHBmbikpCiAgICAgICAgICAgICAgICAgIDogdW5tYXBfbW1pb19yZWdpb25zKGQsIF9n
Zm4ocGZuKSwgbnJfcGFnZXMsIF9tZm4ocGZuKSk7CiAgICAgICAgIGlmICggcmMgPT0gMCApCiAg
ICAgICAgICAgICBicmVhazsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCBmZWY5N2M4MmY2Li5lNjAyY2QyMjljIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBA
IC0yMjc3LDEwICsyMjc3LDEwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbW1pb19vcmRlcihjb25z
dCBzdHJ1Y3QgZG9tYWluICpkLAogCiAjZGVmaW5lIE1BUF9NTUlPX01BWF9JVEVSIDY0IC8qIHBy
ZXR0eSBhcmJpdHJhcnkgKi8KIAotaW50IG1hcF9tbWlvX3JlZ2lvbnMoc3RydWN0IGRvbWFpbiAq
ZCwKLSAgICAgICAgICAgICAgICAgICAgIGdmbl90IHN0YXJ0X2dmbiwKLSAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgbnIsCi0gICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4p
CitpbnQgbWFwX21taW9fcmVnaW9uKHN0cnVjdCBkb21haW4gKmQsCisgICAgICAgICAgICAgICAg
ICAgIGdmbl90IHN0YXJ0X2dmbiwKKyAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBu
ciwKKyAgICAgICAgICAgICAgICAgICAgbWZuX3QgbWZuKQogewogICAgIGludCByZXQgPSAwOwog
ICAgIHVuc2lnbmVkIGxvbmcgaTsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94
ZW4vY29tbW9uL2RvbWN0bC5jCmluZGV4IGI0OGU0MDg1ODMuLjI2NzRjYWEwMDUgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vZG9tY3RsLmMKKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwpAQCAtOTE5
LDYgKzkxOSw3IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2Rv
bWN0bF90KSB1X2RvbWN0bCkKICAgICAgICAgdW5zaWduZWQgbG9uZyBucl9tZm5zID0gb3AtPnUu
bWVtb3J5X21hcHBpbmcubnJfbWZuczsKICAgICAgICAgdW5zaWduZWQgbG9uZyBtZm5fZW5kID0g
bWZuICsgbnJfbWZucyAtIDE7CiAgICAgICAgIGludCBhZGQgPSBvcC0+dS5tZW1vcnlfbWFwcGlu
Zy5hZGRfbWFwcGluZzsKKyAgICAgICAgcDJtX3R5cGVfdCBwMm10OwogCiAgICAgICAgIHJldCA9
IC1FSU5WQUw7CiAgICAgICAgIGlmICggbWZuX2VuZCA8IG1mbiB8fCAvKiB3cmFwPyAqLwpAQCAt
OTMxLDYgKzkzMiwxMCBAQCBsb25nIGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhl
bl9kb21jdGxfdCkgdV9kb21jdGwpCiAgICAgICAgIC8qIE11c3QgYnJlYWsgaHlwZXJjYWxsIHVw
IGFzIHRoaXMgY291bGQgdGFrZSBhIHdoaWxlLiAqLwogICAgICAgICBpZiAoIG5yX21mbnMgPiA2
NCApCiAgICAgICAgICAgICBicmVhazsKKworICAgICAgICBwMm10ID0gcDJtX21taW9fZGlyZWN0
X2RldjsKKyNlbHNlCisgICAgICAgIHAybXQgPSBwMm1fbW1pb19kaXJlY3Q7CiAjZW5kaWYKIAog
ICAgICAgICByZXQgPSAtRVBFUk07CkBAIC05NDgsNyArOTUzLDcgQEAgbG9uZyBkb19kb21jdGwo
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQogICAgICAgICAg
ICAgICAgICAgICJtZW1vcnlfbWFwOmFkZDogZG9tJWQgZ2ZuPSVseCBtZm49JWx4IG5yPSVseFxu
IiwKICAgICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIGdmbiwgbWZuLCBucl9tZm5zKTsK
IAotICAgICAgICAgICAgcmV0ID0gbWFwX21taW9fcmVnaW9ucyhkLCBfZ2ZuKGdmbiksIG5yX21m
bnMsIF9tZm4obWZuKSk7CisgICAgICAgICAgICByZXQgPSBtYXBfbW1pb19yZWdpb25zKGQsIF9n
Zm4oZ2ZuKSwgbnJfbWZucywgX21mbihtZm4pLCBwMm10KTsKICAgICAgICAgICAgIGlmICggcmV0
IDwgMCApCiAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcKICAgICAgICAg
ICAgICAgICAgICAgICAgIm1lbW9yeV9tYXA6ZmFpbDogZG9tJWQgZ2ZuPSVseCBtZm49JWx4IG5y
PSVseCByZXQ6JWxkXG4iLApkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBi
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKaW5kZXggM2M3OTRmNDg2ZC4uNzZiMzNhZjU4ZSAx
MDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYworKysgYi94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jCkBAIC01Miw3ICs1Miw3IEBAIHN0YXRpYyBpbnQgbWFwX3JhbmdlKHVuc2ln
bmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB2b2lkICpkYXRhLAogICAgICAgICAgKiAtIHt1
bn1tYXBfbW1pb19yZWdpb25zIGRvZXNuJ3Qgc3VwcG9ydCBwcmVlbXB0aW9uLgogICAgICAgICAg
Ki8KIAotICAgICAgICByYyA9IG1hcC0+bWFwID8gbWFwX21taW9fcmVnaW9ucyhtYXAtPmQsIF9n
Zm4ocyksIHNpemUsIF9tZm4ocykpCisgICAgICAgIHJjID0gbWFwLT5tYXAgPyBtYXBfbW1pb19y
ZWdpb24obWFwLT5kLCBfZ2ZuKHMpLCBzaXplLCBfbWZuKHMpKQogICAgICAgICAgICAgICAgICAg
ICAgIDogdW5tYXBfbW1pb19yZWdpb25zKG1hcC0+ZCwgX2dmbihzKSwgc2l6ZSwgX21mbihzKSk7
CiAgICAgICAgIGlmICggcmMgPT0gMCApCiAgICAgICAgIHsKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vcDJtLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3AybS5oCmluZGV4IDMxOTAy
MzE3ZGEuLmY5NzBjNTM3NjQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wMm0uaApAQCAtMjU4LDIxICsyNTgsNiBAQCB2b2lk
IHAybV90b2dnbGVfY2FjaGUoc3RydWN0IHZjcHUgKnYsIGJvb2wgd2FzX2VuYWJsZWQpOwogCiB2
b2lkIHAybV9mbHVzaF92bShzdHJ1Y3QgdmNwdSAqdik7CiAKLS8qCi0gKiBNYXAgYSByZWdpb24g
aW4gdGhlIGd1ZXN0IHAybSB3aXRoIGEgc3BlY2lmaWMgcDJtIHR5cGUuCi0gKiBUaGUgbWVtb3J5
IGF0dHJpYnV0ZXMgd2lsbCBiZSBkZXJpdmVkIGZyb20gdGhlIHAybSB0eXBlLgotICovCi1pbnQg
bWFwX3JlZ2lvbnNfcDJtdChzdHJ1Y3QgZG9tYWluICpkLAotICAgICAgICAgICAgICAgICAgICAg
Z2ZuX3QgZ2ZuLAotICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBuciwKLSAgICAg
ICAgICAgICAgICAgICAgIG1mbl90IG1mbiwKLSAgICAgICAgICAgICAgICAgICAgIHAybV90eXBl
X3QgcDJtdCk7Ci0KLWludCB1bm1hcF9yZWdpb25zX3AybXQoc3RydWN0IGRvbWFpbiAqZCwKLSAg
ICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgZ2ZuLAotICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIG5yLAotICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4pOwotCiBp
bnQgbWFwX2Rldl9tbWlvX3JlZ2lvbihzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAg
ICAgICAgICAgZ2ZuX3QgZ2ZuLAogICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBuciwKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmggYi94ZW4vaW5jbHVk
ZS9hc20teDg2L3AybS5oCmluZGV4IGFmZjM0ZTNhZGYuLmE3MDUwZWUyMWMgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0u
aApAQCAtMTAwMSw2ICsxMDAxLDE0IEBAIHN0YXRpYyBpbmxpbmUgaW50IHAybV9lbnRyeV9tb2Rp
Znkoc3RydWN0IHAybV9kb21haW4gKnAybSwgcDJtX3R5cGVfdCBudCwKICAgICByZXR1cm4gMDsK
IH0KIAorLyogeDg2IGRvZXNuJ3QgdXNlIHRoZSBwMm10IHBhcmFtZXRlciwganVzdCBzdHJpcCBp
dCBhd2F5ICovCisjZGVmaW5lIG1hcF9tbWlvX3JlZ2lvbnMoZCwgc3RhcnRfZ2ZuLCBuciwgbWZu
LCBwMm10KSBcCisgICAgICAgICAgICBtYXBfbW1pb19yZWdpb24oZCwgc3RhcnRfZ2ZuLCBuciwg
bWZuKQoraW50IG1hcF9tbWlvX3JlZ2lvbihzdHJ1Y3QgZG9tYWluICpkLAorICAgICAgICAgICAg
ICAgICAgICBnZm5fdCBzdGFydF9nZm4sCisgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbnIsCisgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbik7CisKICNlbmRpZiAvKiBfWEVO
X0FTTV9YODZfUDJNX0ggKi8KIAogLyoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wMm0t
Y29tbW9uLmggYi94ZW4vaW5jbHVkZS94ZW4vcDJtLWNvbW1vbi5oCmluZGV4IDU4MDMxYTZlYTgu
LmUyMGI0OTc0YjAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wMm0tY29tbW9uLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL3AybS1jb21tb24uaApAQCAtOCwxMyArOCwxNiBAQCBpbnQgX19t
dXN0X2NoZWNrCiBndWVzdF9waHlzbWFwX3JlbW92ZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGdm
bl90IGdmbiwgbWZuX3QgbWZuLAogICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgcGFnZV9vcmRlcik7CiAKLS8qIE1hcCBNTUlPIHJlZ2lvbnMgaW4gdGhlIHAybTogc3RhcnRf
Z2ZuIGFuZCBuciBkZXNjcmliZSB0aGUgcmFuZ2UgaW4KLSAqICAqIHRoZSBndWVzdCBwaHlzaWNh
bCBhZGRyZXNzIHNwYWNlIHRvIG1hcCwgc3RhcnRpbmcgZnJvbSB0aGUgbWFjaGluZQotICogICAq
IGZyYW1lIG51bWJlciBtZm4uICovCisvKgorICogTWFwIE1NSU8gcmVnaW9ucyBpbiB0aGUgcDJt
OiBzdGFydF9nZm4gYW5kIG5yIGRlc2NyaWJlIHRoZSByYW5nZSBpbgorICogdGhlIGd1ZXN0IHBo
eXNpY2FsIGFkZHJlc3Mgc3BhY2UgdG8gbWFwLCBzdGFydGluZyBmcm9tIHRoZSBtYWNoaW5lCisg
KiBmcmFtZSBudW1iZXIgbWZuLgorICovCiBpbnQgbWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9t
YWluICpkLAogICAgICAgICAgICAgICAgICAgICAgZ2ZuX3Qgc3RhcnRfZ2ZuLAogICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBuciwKLSAgICAgICAgICAgICAgICAgICAgIG1mbl90
IG1mbik7CisgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4sCisgICAgICAgICAgICAgICAg
ICAgICBwMm1fdHlwZV90IHAybXQpOwogaW50IHVubWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9t
YWluICpkLAogICAgICAgICAgICAgICAgICAgICAgICBnZm5fdCBzdGFydF9nZm4sCiAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIsCi0tIAoyLjE3LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
