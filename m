Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF04D2E4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 18:11:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdzby-0001ec-OD; Thu, 20 Jun 2019 16:08:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YAo9=UT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hdzbw-0001eX-QB
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 16:08:28 +0000
X-Inumbo-ID: a1661b34-9375-11e9-8c4b-f72420807426
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1661b34-9375-11e9-8c4b-f72420807426;
 Thu, 20 Jun 2019 16:08:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 979FEAF2B;
 Thu, 20 Jun 2019 16:08:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2019 18:08:21 +0200
Message-Id: <20190620160821.4210-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] mm: fix regression with deferred struct page
 init
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
 Alexander Duyck <alexander.h.duyck@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDBlNTZhY2FlNGI0ZGQ0YTkgKCJtbTogaW5pdGlhbGl6ZSBNQVhfT1JERVJfTlJfUEFH
RVMgYXQgYSB0aW1lCmluc3RlYWQgb2YgZG9pbmcgbGFyZ2VyIHNlY3Rpb25zIikgaXMgY2F1c2lu
ZyBhIHJlZ3Jlc3Npb24gb24gc29tZQpzeXN0ZW1zIHdoZW4gdGhlIGtlcm5lbCBpcyBib290ZWQg
YXMgWGVuIGRvbTAuCgpUaGUgc3lzdGVtIHdpbGwganVzdCBoYW5nIGluIGVhcmx5IGJvb3QuCgpS
ZWFzb24gaXMgYW4gZW5kbGVzcyBsb29wIGluIGdldF9wYWdlX2Zyb21fZnJlZWxpc3QoKSBpbiBj
YXNlIHRoZSBmaXJzdAp6b25lIGxvb2tlZCBhdCBoYXMgbm8gZnJlZSBtZW1vcnkuIGRlZmVycmVk
X2dyb3dfem9uZSgpIGlzIGFsd2F5cwpyZXR1cm5pbmcgdHJ1ZSBkdWUgdG8gdGhlIGZvbGxvd2lu
ZyBjb2RlIHNuaXBwbGV0OgoKICAvKiBJZiB0aGUgem9uZSBpcyBlbXB0eSBzb21lYm9keSBlbHNl
IG1heSBoYXZlIGNsZWFyZWQgb3V0IHRoZSB6b25lICovCiAgaWYgKCFkZWZlcnJlZF9pbml0X21l
bV9wZm5fcmFuZ2VfaW5fem9uZSgmaSwgem9uZSwgJnNwZm4sICZlcGZuLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlyc3RfZGVmZXJyZWRfcGZuKSkgewogICAg
ICAgICAgcGdkYXQtPmZpcnN0X2RlZmVycmVkX3BmbiA9IFVMT05HX01BWDsKICAgICAgICAgIHBn
ZGF0X3Jlc2l6ZV91bmxvY2socGdkYXQsICZmbGFncyk7CiAgICAgICAgICByZXR1cm4gdHJ1ZTsK
ICB9CgpUaGlzIGluIHR1cm4gcmVzdWx0cyBpbiB0aGUgbG9vcCBhcyBnZXRfcGFnZV9mcm9tX2Zy
ZWVsaXN0KCkgaXMKYXNzdW1pbmcgZm9yd2FyZCBwcm9ncmVzcyBjYW4gYmUgbWFkZSBieSBkb2lu
ZyBzb21lIG1vcmUgc3RydWN0IHBhZ2UKaW5pdGlhbGl6YXRpb24uCgpDYzogQWxleGFuZGVyIER1
eWNrIDxhbGV4YW5kZXIuaC5kdXlja0BsaW51eC5pbnRlbC5jb20+CkZpeGVzOiAwZTU2YWNhZTRi
NGRkNGE5ICgibW06IGluaXRpYWxpemUgTUFYX09SREVSX05SX1BBR0VTIGF0IGEgdGltZSBpbnN0
ZWFkIG9mIGRvaW5nIGxhcmdlciBzZWN0aW9ucyIpClN1Z2dlc3RlZC1ieTogQWxleGFuZGVyIER1
eWNrIDxhbGV4YW5kZXIuaC5kdXlja0BsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBtbS9wYWdlX2FsbG9jLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRleCBkNjZiYzhhYmUw
YWYuLjhlM2JjOTQ5ZWJjYyAxMDA2NDQKLS0tIGEvbW0vcGFnZV9hbGxvYy5jCisrKyBiL21tL3Bh
Z2VfYWxsb2MuYwpAQCAtMTgyNiw3ICsxODI2LDggQEAgZGVmZXJyZWRfZ3Jvd196b25lKHN0cnVj
dCB6b25lICp6b25lLCB1bnNpZ25lZCBpbnQgb3JkZXIpCiAJCQkJCQkgZmlyc3RfZGVmZXJyZWRf
cGZuKSkgewogCQlwZ2RhdC0+Zmlyc3RfZGVmZXJyZWRfcGZuID0gVUxPTkdfTUFYOwogCQlwZ2Rh
dF9yZXNpemVfdW5sb2NrKHBnZGF0LCAmZmxhZ3MpOwotCQlyZXR1cm4gdHJ1ZTsKKwkJLyogUmV0
cnkgb25seSBvbmNlLiAqLworCQlyZXR1cm4gZmlyc3RfZGVmZXJyZWRfcGZuICE9IFVMT05HX01B
WDsKIAl9CiAKIAkvKgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
