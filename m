Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779AB1CBF1
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 17:33:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQZO2-0005qx-Uw; Tue, 14 May 2019 15:30:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jxAo=TO=amazon.com=prvs=030dd7525=sironi@srs-us1.protection.inumbo.net>)
 id 1hQZBh-0004Pl-RT
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 15:17:53 +0000
X-Inumbo-ID: 714cf055-765b-11e9-8980-bc764e045a96
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 714cf055-765b-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1557847072; x=1589383072;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ApUn5NrD10awU4eW559R8go9dXcgyOtHemBHTUkzGiI=;
 b=hhbFKKybPtDMuLu03QsPug21ByqZsKgAuMZOjw6ekJDiC77EJZOlG8Nq
 FsNQFGJta4ACy5LmunEXdXRDJLT84k//ufetYESzLoaVP/7ZazvYmR85C
 lYtdR/rCuSAGMr0wgfrvN8JQ4dHM0IWBjjeEWVjFjs5IfwAFhdeu8e4J5 A=;
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="766033521"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 May 2019 15:17:51 +0000
Received: from uf8b156e456a5587c9af4.ant.amazon.com
 (iad7-ws-svc-lb50-vlan2.amazon.com [10.0.93.210])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4EFHhWL108365
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 14 May 2019 15:17:45 GMT
Received: from uf8b156e456a5587c9af4.ant.amazon.com (localhost [127.0.0.1])
 by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 x4EFHgN3028019; Tue, 14 May 2019 17:17:42 +0200
Received: (from sironi@localhost)
 by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Submit) id
 x4EFHfS2028018; Tue, 14 May 2019 17:17:41 +0200
From: Filippo Sironi <sironi@amazon.de>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, borntraeger@de.ibm.com, 
 boris.ostrovsky@oracle.com, cohuck@redhat.com, konrad.wilk@oracle.com,
 xen-devel@lists.xenproject.org, vasu.srinivasan@oracle.com
Date: Tue, 14 May 2019 17:16:42 +0200
Message-Id: <1557847002-23519-3-git-send-email-sironi@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557847002-23519-1-git-send-email-sironi@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
Precedence: Bulk
X-Mailman-Approved-At: Tue, 14 May 2019 15:30:36 +0000
Subject: [Xen-devel] [PATCH v2 2/2] KVM: x86: Implement the arch-specific
 hook to report the VM UUID
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Filippo Sironi <sironi@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24geDg2LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZvcm1hdGlvbiAoaS5l
LiwgRE1JIFR5cGUgMSkKYXMgVk0gVVVJRC4KClNpZ25lZC1vZmYtYnk6IEZpbGlwcG8gU2lyb25p
IDxzaXJvbmlAYW1hem9uLmRlPgotLS0KIGFyY2gveDg2L2tlcm5lbC9rdm0uYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2tlcm5lbC9rdm0uYyBiL2FyY2gveDg2L2tlcm5lbC9rdm0uYwppbmRleCA1YzkzYTY1ZWUxZTUu
LjQ0MWNhYjA4YTA5ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2t2bS5jCisrKyBiL2Fy
Y2gveDg2L2tlcm5lbC9rdm0uYwpAQCAtMjUsNiArMjUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2t2bV9wYXJhLmg+CiAjaW5jbHVkZSA8bGludXgvY3B1
Lmg+CisjaW5jbHVkZSA8bGludXgvZG1pLmg+CiAjaW5jbHVkZSA8bGludXgvbW0uaD4KICNpbmNs
dWRlIDxsaW51eC9oaWdobWVtLmg+CiAjaW5jbHVkZSA8bGludXgvaGFyZGlycS5oPgpAQCAtNjk0
LDYgKzY5NSwxMiBAQCBib29sIGt2bV9wYXJhX2F2YWlsYWJsZSh2b2lkKQogfQogRVhQT1JUX1NZ
TUJPTF9HUEwoa3ZtX3BhcmFfYXZhaWxhYmxlKTsKIAorY29uc3QgY2hhciAqa3ZtX3BhcmFfZ2V0
X3V1aWQodm9pZCkKK3sKKwlyZXR1cm4gZG1pX2dldF9zeXN0ZW1faW5mbyhETUlfUFJPRFVDVF9V
VUlEKTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV9wYXJhX2dldF91dWlkKTsKKwogdW5zaWdu
ZWQgaW50IGt2bV9hcmNoX3BhcmFfZmVhdHVyZXModm9pZCkKIHsKIAlyZXR1cm4gY3B1aWRfZWF4
KGt2bV9jcHVpZF9iYXNlKCkgfCBLVk1fQ1BVSURfRkVBVFVSRVMpOwotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
