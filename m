Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE87610738
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 12:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLmnI-0005aJ-2h; Wed, 01 May 2019 10:48:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnG-0005Yw-NO
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:54 +0000
X-Inumbo-ID: b4c62424-6bfe-11e9-befc-57774e018db9
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4c62424-6bfe-11e9-befc-57774e018db9;
 Wed, 01 May 2019 10:48:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,417,1549929600"; d="scan'208";a="84837306"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 1 May 2019 11:48:36 +0100
Message-ID: <20190501104839.21621-13-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 12/15] cross builds: mfi-common:
 Break out set_build_hostflags
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpWZXJpZmllZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJhdGUt
ZHVtcC1mbGlnaHQtcnVudmFycy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1maS1jb21tb24gfCA3ICsrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZmkt
Y29tbW9uIGIvbWZpLWNvbW1vbgppbmRleCBmOTExNTZmZS4uZGFkMDNlMzkgMTAwNjQ0Ci0tLSBh
L21maS1jb21tb24KKysrIGIvbWZpLWNvbW1vbgpAQCAtMjE2LDYgKzIxNiwxMSBAQCBjcmVhdGVf
eGVuX2J1aWxkX2pvYiAoKSB7CiAgICAgJGV4dHJhX3J1bnZhcnMKIH0KIAorc2V0X2J1aWxkX2hv
c3RmbGFncyAoKSB7CisgICMgc2V0X2J1aWxkX2hvc3RmbGFncyBIT1NUX0FSQ0gKKyAgYnVpbGRf
aG9zdGZsYWdzPSJzaGFyZS1idWlsZC0kc3VpdGUtJDEsYXJjaC0kMSxzdWl0ZS0kc3VpdGUscHVy
cG9zZS1idWlsZCIKK30KKwogY3JlYXRlX2J1aWxkX2pvYnMgKCkgewogCiAgIGxvY2FsIGFyY2gK
QEAgLTM0Miw3ICszNDcsNyBAQCBjcmVhdGVfYnVpbGRfam9icyAoKSB7CiAgICAgICAgIGFyY2hf
cnVudmFycz1cIlwkQVJDSF9SVU5WQVJTXyRhcmNoXCIKICAgICAiCiAKLSAgICBidWlsZF9ob3N0
ZmxhZ3M9c2hhcmUtYnVpbGQtJHN1aXRlLSRhcmNoLGFyY2gtJGFyY2gsc3VpdGUtJHN1aXRlLHB1
cnBvc2UtYnVpbGQKKyAgICBzZXRfYnVpbGRfaG9zdGZsYWdzICRhcmNoCiAKICAgICBmb3IgZW5h
YmxlX3hzbSBpbiAkKHhzbV92YXJpYW50cyAkYXJjaCkgOyBkbwogICAgICAgaWYgWyB4JGVuYWJs
ZV94c20gPSB4dHJ1ZSBdIDsgdGhlbgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
