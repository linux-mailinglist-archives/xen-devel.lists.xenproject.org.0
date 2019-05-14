Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634961C884
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:24:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRs-0000UG-Qe; Tue, 14 May 2019 12:22:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRr-0000TC-KV
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:23 +0000
X-Inumbo-ID: ec586b83-7642-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ec586b83-7642-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 12:22:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 771E8341;
 Tue, 14 May 2019 05:22:21 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43BD43F71E;
 Tue, 14 May 2019 05:22:20 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:35 +0100
Message-Id: <20190514122136.28215-27-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 v2 18/19] xen/arm: mm: Check start is
 always before end in {destroy, modify}_xen_mappings
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHR3byBoZWxwZXJzIHtkZXN0cm95LCBtb2RpZnl9X3hlbl9tYXBwaW5ncyBkb24ndCBjaGVj
ayB0aGF0IHRoZQpzdGFydCBpcyBhbHdheXMgYmVmb3JlIHRoZSBlbmQuIFRoaXMgc2hvdWxkIG5l
dmVyIGhhcHBlbiBidXQgaWYgaXQKaGFwcGVucywgaXQgd2lsbCByZXN1bHQgdG8gdW5leHBlY3Rl
ZCBiZWhhdmlvci4KCkNhdGNoIHN1Y2ggaXNzdWVzIGVhcmxpZXIgb24gYnkgYWRkaW5nIGFuIEFT
U0VSVCBpbiBkZXN0cm95X3hlbl9tYXBwaW5ncwphbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncy4KClNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2Vk
LWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFu
Z2VzIGluIHYyOgogICAgICAgIC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2Fy
Y2gvYXJtL21tLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwppbmRleCBlYWNj
MTY0N2UwLi5iNDA4ZGU3Yzc1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vbW0uYworKysgYi94
ZW4vYXJjaC9hcm0vbW0uYwpAQCAtMTA3NywxMSArMTA3NywxMyBAQCBpbnQgcG9wdWxhdGVfcHRf
cmFuZ2UodW5zaWduZWQgbG9uZyB2aXJ0LCB1bnNpZ25lZCBsb25nIG5yX21mbnMpCiAKIGludCBk
ZXN0cm95X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHYsIHVuc2lnbmVkIGxvbmcgZSkKIHsK
KyAgICBBU1NFUlQodiA8PSBlKTsKICAgICByZXR1cm4gY3JlYXRlX3hlbl9lbnRyaWVzKFJFTU9W
RSwgdiwgSU5WQUxJRF9NRk4sIChlIC0gdikgPj4gUEFHRV9TSElGVCwgMCk7CiB9CiAKIGludCBt
b2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNp
Z25lZCBpbnQgZmxhZ3MpCiB7CisgICAgQVNTRVJUKHMgPD0gZSk7CiAgICAgcmV0dXJuIGNyZWF0
ZV94ZW5fZW50cmllcyhNT0RJRlksIHMsIElOVkFMSURfTUZOLCAoZSAtIHMpID4+IFBBR0VfU0hJ
RlQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFncyk7CiB9Ci0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
