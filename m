Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E6C260B3
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 11:48:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTNos-0006Vc-G9; Wed, 22 May 2019 09:45:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTNoq-0006VI-A0
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:45:56 +0000
X-Inumbo-ID: 642b236b-7c76-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 642b236b-7c76-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 09:45:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B27E9AF25;
 Wed, 22 May 2019 09:45:53 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 22 May 2019 11:45:49 +0200
Message-Id: <20190522094549.28397-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190522094549.28397-1-jgross@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 3/3] xen: build common/preempt.c only with
 CONFIG_DEBUG
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm90aGluZyBsZWZ0IGluIGNvbW1vbi9wcmVlbXB0LmMgaW4gbm9uLWRlYnVnIGJ1
aWxkcy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0t
CiB4ZW4vY29tbW9uL01ha2VmaWxlICB8IDIgKy0KIHhlbi9jb21tb24vcHJlZW1wdC5jIHwgMiAt
LQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL01ha2VmaWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQppbmRleCAz
M2QwM2I4NjJmLi5kNjU3NmEzZmMzIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCisr
KyBiL3hlbi9jb21tb24vTWFrZWZpbGUKQEAgLTMwLDcgKzMwLDcgQEAgb2JqLXkgKz0gbm90aWZp
ZXIubwogb2JqLXkgKz0gcGFnZV9hbGxvYy5vCiBvYmotJChDT05GSUdfSEFTX1BEWCkgKz0gcGR4
Lm8KIG9iai0kKENPTkZJR19QRVJGX0NPVU5URVJTKSArPSBwZXJmYy5vCi1vYmoteSArPSBwcmVl
bXB0Lm8KK29iai0kKENPTkZJR19ERUJVRykgKz0gcHJlZW1wdC5vCiBvYmoteSArPSByYW5kb20u
bwogb2JqLXkgKz0gcmFuZ2VzZXQubwogb2JqLXkgKz0gcmFkaXgtdHJlZS5vCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3ByZWVtcHQuYyBiL3hlbi9jb21tb24vcHJlZW1wdC5jCmluZGV4IDMwNzdj
NTFkNTIuLjhiYjA5OWU4ZTggMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcHJlZW1wdC5jCisrKyBi
L3hlbi9jb21tb24vcHJlZW1wdC5jCkBAIC0yMyw3ICsyMyw2IEBACiAjaW5jbHVkZSA8eGVuL2ly
cS5oPgogI2luY2x1ZGUgPGFzbS9zeXN0ZW0uaD4KIAotI2lmbmRlZiBOREVCVUcKIERFRklORV9Q
RVJfQ1BVKHVuc2lnbmVkIGludCwgX19wcmVlbXB0X2NvdW50KTsKIAogdm9pZCBBU1NFUlRfTk9U
X0lOX0FUT01JQyh2b2lkKQpAQCAtMzIsNCArMzEsMyBAQCB2b2lkIEFTU0VSVF9OT1RfSU5fQVRP
TUlDKHZvaWQpCiAgICAgQVNTRVJUKCFpbl9pcnEoKSk7CiAgICAgQVNTRVJUKGxvY2FsX2lycV9p
c19lbmFibGVkKCkpOwogfQotI2VuZGlmCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
