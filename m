Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD045447
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 07:49:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbf2S-0003yi-1h; Fri, 14 Jun 2019 05:46:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbf2Q-0003yW-Lo
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 05:46:10 +0000
X-Inumbo-ID: b54b0e8c-8e67-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b54b0e8c-8e67-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 05:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 038FEAEB8;
 Fri, 14 Jun 2019 05:46:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 07:46:03 +0200
Message-Id: <20190614054604.30101-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190614054604.30101-1-jgross@suse.com>
References: <20190614054604.30101-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 2/3] xen/swiotlb: simplify
 range_straddles_page_boundary()
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
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkoKSBpcyBvcGVuIGNvZGluZyBzZXZlcmFsIG1h
Y3JvcyBmcm9tCmluY2x1ZGUveGVuL3BhZ2UuaC4gVXNlIHRob3NlIGluc3RlYWQuIEFkZGl0aW9u
YWxseSB0aGVyZSBpcyBubyBuZWVkCnRvIGhhdmUgY2hlY2tfcGFnZXNfcGh5c2ljYWxseV9jb250
aWd1b3VzKCkgYXMgYSBzZXBhcmF0ZSBmdW5jdGlvbiBhcwppdCBpcyB1c2VkIG9ubHkgb25jZSwg
c28gbWVyZ2UgaXQgaW50byByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeSgpLgoKU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogQm9y
aXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3hl
bi9zd2lvdGxiLXhlbi5jIHwgMjggKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKaW5k
ZXggNTBmZDdkZTU0OTY5Li4zN2RkY2ZjZmJiMjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N3
aW90bGIteGVuLmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAtODMsMzQgKzgz
LDE4IEBAIHN0YXRpYyBpbmxpbmUgZG1hX2FkZHJfdCB4ZW5fdmlydF90b19idXModm9pZCAqYWRk
cmVzcykKIAlyZXR1cm4geGVuX3BoeXNfdG9fYnVzKHZpcnRfdG9fcGh5cyhhZGRyZXNzKSk7CiB9
CiAKLXN0YXRpYyBpbnQgY2hlY2tfcGFnZXNfcGh5c2ljYWxseV9jb250aWd1b3VzKHVuc2lnbmVk
IGxvbmcgeGVuX3BmbiwKLQkJCQkJICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LAotCQkJCQkgICAg
IHNpemVfdCBsZW5ndGgpCitzdGF0aWMgaW5saW5lIGludCByYW5nZV9zdHJhZGRsZXNfcGFnZV9i
b3VuZGFyeShwaHlzX2FkZHJfdCBwLCBzaXplX3Qgc2l6ZSkKIHsKLQl1bnNpZ25lZCBsb25nIG5l
eHRfYmZuOwotCWludCBpOwotCWludCBucl9wYWdlczsKKwl1bnNpZ25lZCBsb25nIG5leHRfYmZu
LCB4ZW5fcGZuID0gWEVOX1BGTl9ET1dOKHApOworCXVuc2lnbmVkIGludCBpLCBucl9wYWdlcyA9
IFhFTl9QRk5fVVAoeGVuX29mZnNldF9pbl9wYWdlKHApICsgc2l6ZSk7CiAKIAluZXh0X2JmbiA9
IHBmbl90b19iZm4oeGVuX3Bmbik7Ci0JbnJfcGFnZXMgPSAob2Zmc2V0ICsgbGVuZ3RoICsgWEVO
X1BBR0VfU0laRS0xKSA+PiBYRU5fUEFHRV9TSElGVDsKIAotCWZvciAoaSA9IDE7IGkgPCBucl9w
YWdlczsgaSsrKSB7CisJZm9yIChpID0gMTsgaSA8IG5yX3BhZ2VzOyBpKyspCiAJCWlmIChwZm5f
dG9fYmZuKCsreGVuX3BmbikgIT0gKytuZXh0X2JmbikKLQkJCXJldHVybiAwOwotCX0KLQlyZXR1
cm4gMTsKLX0KKwkJCXJldHVybiAxOwogCi1zdGF0aWMgaW5saW5lIGludCByYW5nZV9zdHJhZGRs
ZXNfcGFnZV9ib3VuZGFyeShwaHlzX2FkZHJfdCBwLCBzaXplX3Qgc2l6ZSkKLXsKLQl1bnNpZ25l
ZCBsb25nIHhlbl9wZm4gPSBYRU5fUEZOX0RPV04ocCk7Ci0JdW5zaWduZWQgaW50IG9mZnNldCA9
IHAgJiB+WEVOX1BBR0VfTUFTSzsKLQotCWlmIChvZmZzZXQgKyBzaXplIDw9IFhFTl9QQUdFX1NJ
WkUpCi0JCXJldHVybiAwOwotCWlmIChjaGVja19wYWdlc19waHlzaWNhbGx5X2NvbnRpZ3VvdXMo
eGVuX3Bmbiwgb2Zmc2V0LCBzaXplKSkKLQkJcmV0dXJuIDA7Ci0JcmV0dXJuIDE7CisJcmV0dXJu
IDA7CiB9CiAKIHN0YXRpYyBpbnQgaXNfeGVuX3N3aW90bGJfYnVmZmVyKGRtYV9hZGRyX3QgZG1h
X2FkZHIpCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
