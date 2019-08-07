Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F37F83E49
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 02:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv9jX-0004do-G9; Wed, 07 Aug 2019 00:23:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv9jW-0004dX-49
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 00:23:14 +0000
X-Inumbo-ID: 8a9f5071-b8a9-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a9f5071-b8a9-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 00:23:12 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38E33214C6;
 Wed,  7 Aug 2019 00:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565137392;
 bh=jDipdn+4VUYW2qZ4ApT2mSbJxsiNklXhSAwqKIj+xQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yUnkcD3+V5WHqogYv3QNC6vpxa1WpIM2Gs0r7tKjsSz25Zf0Mxj7I1RTzk/wAG61O
 r33G3Yjo8WopagOwTTdqArqeMJdkGJTT9mBKSnKqOa5qldtD5/aDTm8itSeM7Z0n0D
 h3wvKfrSPdjAHfi0C3ibXUctEEViDU/SQ2W2Dkh8=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue,  6 Aug 2019 17:23:06 -0700
Message-Id: <20190807002311.9906-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v4 1/6] xen/arm: introduce p2m_is_mmio
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
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgcDJtX2lzX21taW8gbWFjcm8gZm9yIGVhc3kgY2hlY2tpbmdzLgoKU2lnbmVkLW9mZi1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgotLS0KIHhlbi9pbmNs
dWRlL2FzbS1hcm0vcDJtLmggfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL3AybS5oCmluZGV4IDAzZjJlZTc1YzEuLjMxOTAyMzE3ZGEgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wMm0u
aApAQCAtMTMyLDYgKzEzMiwxMSBAQCB0eXBlZGVmIGVudW0gewogI2RlZmluZSBQMk1fUkFNX1RZ
UEVTIChwMm1fdG9fbWFzayhwMm1fcmFtX3J3KSB8ICAgICAgICBcCiAgICAgICAgICAgICAgICAg
ICAgICAgIHAybV90b19tYXNrKHAybV9yYW1fcm8pKQogCisvKiBNTUlPIHR5cGVzICovCisjZGVm
aW5lIFAyTV9NTUlPX1RZUEVTIChwMm1fdG9fbWFzayhwMm1fbW1pb19kaXJlY3RfZGV2KSB8IFwK
KyAgICAgICAgICAgICAgICAgICAgICAgIHAybV90b19tYXNrKHAybV9tbWlvX2RpcmVjdF9uYykg
IHwgXAorICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3RvX21hc2socDJtX21taW9fZGlyZWN0
X2MpKQorCiAvKiBHcmFudCBtYXBwaW5nIHR5cGVzLCB3aGljaCBtYXAgdG8gYSByZWFsIGZyYW1l
IGluIGFub3RoZXIgVk0gKi8KICNkZWZpbmUgUDJNX0dSQU5UX1RZUEVTIChwMm1fdG9fbWFzayhw
Mm1fZ3JhbnRfbWFwX3J3KSB8ICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3RvX21h
c2socDJtX2dyYW50X21hcF9ybykpCkBAIC0xNDYsNiArMTUxLDcgQEAgdHlwZWRlZiBlbnVtIHsK
ICNkZWZpbmUgcDJtX2lzX2FueV9yYW0oX3QpIChwMm1fdG9fbWFzayhfdCkgJiAgICAgICAgICAg
ICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKFAyTV9SQU1fVFlQRVMgfCBQ
Mk1fR1JBTlRfVFlQRVMgfCAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fRk9S
RUlHTl9UWVBFUykpCisjZGVmaW5lIHAybV9pc19tbWlvKF90KSAocDJtX3RvX21hc2soX3QpICYg
UDJNX01NSU9fVFlQRVMpCiAKIC8qIEFsbCBjb21tb24gdHlwZSBkZWZpbml0aW9ucyBzaG91bGQg
bGl2ZSBhaGVhZCBvZiB0aGlzIGluY2x1c2lvbi4gKi8KICNpZmRlZiBfWEVOX1AyTV9DT01NT05f
SAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
