Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA7E1C88F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 14:25:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWRu-0000Yi-My; Tue, 14 May 2019 12:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQWRs-0000UE-65
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:22:24 +0000
X-Inumbo-ID: ed3274ae-7642-11e9-9bd8-af6c598e80cf
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ed3274ae-7642-11e9-9bd8-af6c598e80cf;
 Tue, 14 May 2019 12:22:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E887015AB;
 Tue, 14 May 2019 05:22:22 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B538B3F71E;
 Tue, 14 May 2019 05:22:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 14 May 2019 13:21:36 +0100
Message-Id: <20190514122136.28215-28-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190514122136.28215-1-julien.grall@arm.com>
References: <20190514122136.28215-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH MM-PART2 v2 19/19] xen/arm: Pair call to
 set_fixmap with call to clear_fixmap in copy_from_paddr
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

QXQgdGhlIG1vbWVudCwgc2V0X2ZpeG1hcCBtYXkgcmVwbGFjZSBhIHZhbGlkIGVudHJ5IHdpdGhv
dXQgZm9sbG93aW5nCnRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVz
dWx0IHRvIFRMQiBjb25mbGljdCBhYm9ydC4KClJhdGhlciB0aGFuIGRlYWxpbmcgd2l0aCBCcmVh
ay1CZWZvcmUtTWFrZSBpbiBzZXRfZml4bWFwLCBldmVyeSBjYWxsIHRvCnNldF9maXhtYXAgaXMg
cGFpcmVkIHdpdGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAg
IC0gQWRkIEFuZHJpaSdzIHJldmlld2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL2tlcm5lbC5jIHwg
MyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0va2VybmVsLmMgYi94ZW4vYXJjaC9hcm0va2VybmVsLmMK
aW5kZXggZTNmZmRiMmZhMS4uMzg5YmVmMmFmYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2tl
cm5lbC5jCisrKyBiL3hlbi9hcmNoL2FybS9rZXJuZWwuYwpAQCAtNTgsMTMgKzU4LDEyIEBAIHZv
aWQgX19pbml0IGNvcHlfZnJvbV9wYWRkcih2b2lkICpkc3QsIHBhZGRyX3QgcGFkZHIsIHVuc2ln
bmVkIGxvbmcgbGVuKQogICAgICAgICBzZXRfZml4bWFwKEZJWE1BUF9NSVNDLCBtYWRkcl90b19t
Zm4ocGFkZHIpLCBQQUdFX0hZUEVSVklTT1JfV0MpOwogICAgICAgICBtZW1jcHkoZHN0LCBzcmMg
KyBzLCBsKTsKICAgICAgICAgY2xlYW5fZGNhY2hlX3ZhX3JhbmdlKGRzdCwgbCk7CisgICAgICAg
IGNsZWFyX2ZpeG1hcChGSVhNQVBfTUlTQyk7CiAKICAgICAgICAgcGFkZHIgKz0gbDsKICAgICAg
ICAgZHN0ICs9IGw7CiAgICAgICAgIGxlbiAtPSBsOwogICAgIH0KLQotICAgIGNsZWFyX2ZpeG1h
cChGSVhNQVBfTUlTQyk7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBwbGFjZV9tb2R1bGVzKHN0
cnVjdCBrZXJuZWxfaW5mbyAqaW5mbywKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
