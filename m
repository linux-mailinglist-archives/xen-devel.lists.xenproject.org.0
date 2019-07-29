Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4578439
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 06:40:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrxOj-0004n6-S6; Mon, 29 Jul 2019 04:36:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uQHP=V2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hrxOi-0004n1-Jx
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 04:36:32 +0000
X-Inumbo-ID: 6dce2308-b1ba-11e9-a026-c3e35348a00f
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dce2308-b1ba-11e9-a026-c3e35348a00f;
 Mon, 29 Jul 2019 04:36:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F4013AC2E;
 Mon, 29 Jul 2019 04:36:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 29 Jul 2019 06:36:24 +0200
Message-Id: <20190729043624.16965-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen: don't longjmp() after domain_crash() in
 check_wakeup_from_wait()
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
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

Q29udGludWluZyBvbiB0aGUgc3RhY2sgc2F2ZWQgYnkgX19wcmVwYXJlX3RvX3dhaXQoKSBvbiB0
aGUgd3JvbmcgY3B1CmlzIHJhdGhlciBkYW5nZXJvdXMuCgpJbnN0ZWFkIG9mIGRvaW5nIHNvIGp1
c3QgY2FsbCB0aGUgc2NoZWR1bGVyIGFnYWluIGFzIGl0IGFscmVhZHkgaXMKaGFwcGVuaW5nIGlu
IHRoZSBzaW1pbGFyIGNhc2UgaW4gX19wcmVwYXJlX3RvX3dhaXQoKSB3aGVuIGRvaW5nIHRoZQpz
ZXRqbXAoKSB3b3VsZCBiZSB3cm9uZy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3dhaXQuYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3dhaXQuYyBi
L3hlbi9jb21tb24vd2FpdC5jCmluZGV4IDNmYzVmNjg2MTEuLjI0NzE2ZTc2NzYgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vd2FpdC5jCisrKyBiL3hlbi9jb21tb24vd2FpdC5jCkBAIC0xOTYsNiAr
MTk2LDExIEBAIHZvaWQgY2hlY2tfd2FrZXVwX2Zyb21fd2FpdCh2b2lkKQogICAgIHsKICAgICAg
ICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgInZjcHUgYWZmaW5pdHkgbG9zdFxuIik7CiAgICAgICAg
IGRvbWFpbl9jcmFzaChjdXJyLT5kb21haW4pOworCisgICAgICAgIC8qIFJlLWluaXRpYXRlIHNj
aGVkdWxlciBhbmQgZG9uJ3QgbG9uZ2ptcCgpLiAqLworICAgICAgICByYWlzZV9zb2Z0aXJxKFND
SEVEVUxFX1NPRlRJUlEpOworICAgICAgICBmb3IgKCA7IDsgKQorICAgICAgICAgICAgZG9fc29m
dGlycSgpOwogICAgIH0KIAogICAgIC8qCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
