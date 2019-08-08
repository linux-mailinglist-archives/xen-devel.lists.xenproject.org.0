Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDF86DCA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 01:14:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvraT-00033z-82; Thu, 08 Aug 2019 23:12:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvraQ-00032S-QT
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 23:12:46 +0000
X-Inumbo-ID: 07f75751-ba32-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07f75751-ba32-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 23:12:45 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A4922184E;
 Thu,  8 Aug 2019 23:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565305965;
 bh=o+lOhO4/XOL9cIiB+ezJTpXaJ/h7+Udl/MZxTpDYfw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pML6ErdujTKypteuLsMQ8SEf6Oj922cZAkfjnB17KrSg7rkAiyUtPKmxJbl81oq8N
 QxocgY7ph6Q6TwhgGvBVg2hqySs9xHareF+fE4p3YQF6h3/0QrNsi7PPfc9jKuStRx
 bq2BWbBC9UINQMBTpLWNh5wQywI2Y5GC4ynrLi/c=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Thu,  8 Aug 2019 16:12:41 -0700
Message-Id: <20190808231242.26424-5-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v3 5/6] xen/arm: introduce nr_spis
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
 andrii_anisov@epam.com, Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgZG9uJ3QgaGF2ZSBhIGNsZWFyIHdheSB0byBrbm93IGhvdyBtYW55IHZpcnR1YWwgU1BJcyB3
ZSBuZWVkIGZvciB0aGUKYm9vdCBkb21haW5zLiBJbnRyb2R1Y2UgYSBuZXcgb3B0aW9uIHVuZGVy
IHhlbixkb21haW4gdG8gc3BlY2lmeSB0aGUKbnVtYmVyIG9mIFNQSXMgdG8gYWxsb2NhdGUgZm9y
IHRoZSBkb21haW4uCgpUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwsIHdoZW4gYWJzZW50LCB3ZSds
bCB1c2UgdGhlIHBoeXNpY2FsIG51bWJlciBvZgpnaWMgbGluZXMgZm9yIGRvbTBsZXNzIGRvbWFp
bnMsIGp1c3QgbGlrZSBmb3IgZG9tMC4gR2l2ZW4gdGhhdCBkb20wbGVzcwpWTXMgYXJlIG1lYW50
IGZvciBzdGF0aWMgcGFydGl0aW9uaW5nIHNjZW5hcmlvcyB3aGVyZSB0aGUgbnVtYmVyIG9mIFZN
cwppcyB2ZXJ5IGxvdywgaW5jcmVhc2VkIG1lbW9yeSBvdmVyaGVhZCBzaG91bGQgbm90IGJlIGEg
cHJvYmxlbSwgYW5kIGl0CmlzIHBvc3NpYmxlIHRvIG1pbmltaXppbmcgaXQgYnkgdXNpbmcgIm5y
X3NwaXMiLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxp
bnguY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCi0gaW50
cm9kdWNlIG5yX3NwaXMKLS0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCA3ICsrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jCmluZGV4IDAwNTdhNTA5ZDEuLmZjNGU1YmM0Y2EgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
QEAgLTIyNzAsNyArMjI3MCw2IEBAIHZvaWQgX19pbml0IGNyZWF0ZV9kb21Vcyh2b2lkKQogICAg
ICAgICBzdHJ1Y3QgZG9tYWluICpkOwogICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVk
b21haW4gZF9jZmcgPSB7CiAgICAgICAgICAgICAuYXJjaC5naWNfdmVyc2lvbiA9IFhFTl9ET01D
VExfQ09ORklHX0dJQ19OQVRJVkUsCi0gICAgICAgICAgICAuYXJjaC5ucl9zcGlzID0gMCwKICAg
ICAgICAgICAgIC5mbGFncyA9IFhFTl9ET01DVExfQ0RGX2h2bV9ndWVzdCB8IFhFTl9ET01DVExf
Q0RGX2hhcCwKICAgICAgICAgICAgIC5tYXhfZXZ0Y2huX3BvcnQgPSAtMSwKICAgICAgICAgICAg
IC5tYXhfZ3JhbnRfZnJhbWVzID0gNjQsCkBAIC0yMjgwLDEzICsyMjc5LDEzIEBAIHZvaWQgX19p
bml0IGNyZWF0ZV9kb21Vcyh2b2lkKQogICAgICAgICBpZiAoICFkdF9kZXZpY2VfaXNfY29tcGF0
aWJsZShub2RlLCAieGVuLGRvbWFpbiIpICkKICAgICAgICAgICAgIGNvbnRpbnVlOwogCi0gICAg
ICAgIGlmICggZHRfcHJvcGVydHlfcmVhZF9ib29sKG5vZGUsICJ2cGwwMTEiKSApCi0gICAgICAg
ICAgICBkX2NmZy5hcmNoLm5yX3NwaXMgPSBHVUVTVF9WUEwwMTFfU1BJIC0gMzIgKyAxOwotCiAg
ICAgICAgIGlmICggIWR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJjcHVzIiwgJmRfY2ZnLm1h
eF92Y3B1cykgKQogICAgICAgICAgICAgcGFuaWMoIk1pc3NpbmcgcHJvcGVydHkgJ2NwdXMnIGZv
ciBkb21haW4gJXNcbiIsCiAgICAgICAgICAgICAgICAgICBkdF9ub2RlX25hbWUobm9kZSkpOwog
CisgICAgICAgIGlmICggIWR0X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJucl9zcGlzIiwgJmRf
Y2ZnLmFyY2gubnJfc3BpcykgKQorICAgICAgICAgICAgZF9jZmcuYXJjaC5ucl9zcGlzID0gZ2lj
X251bWJlcl9saW5lcygpIC0gMzI7CisKICAgICAgICAgZCA9IGRvbWFpbl9jcmVhdGUoKyttYXhf
aW5pdF9kb21pZCwgJmRfY2ZnLCBmYWxzZSk7CiAgICAgICAgIGlmICggSVNfRVJSKGQpICkKICAg
ICAgICAgICAgIHBhbmljKCJFcnJvciBjcmVhdGluZyBkb21haW4gJXNcbiIsIGR0X25vZGVfbmFt
ZShub2RlKSk7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
