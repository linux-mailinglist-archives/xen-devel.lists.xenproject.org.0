Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445301A2FE
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 20:31:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPAFh-0006vs-DS; Fri, 10 May 2019 18:28:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hPAFf-0006vY-P8
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 18:28:11 +0000
X-Inumbo-ID: 5d2fecb4-7351-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d2fecb4-7351-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 18:28:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,454,1549929600"; d="scan'208";a="85337737"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 10 May 2019 19:28:03 +0100
Message-ID: <1557512884-32395-4-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] xen/watchdog: Drop all locked operations on
 the watchdog_inuse_map
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIG1vZGlmaWNhdGlvbnMgdG8gdGhlIHdhdGNoZG9nX2ludXNlX21hcCBoYXBwZW4gd2l0aCBk
LT53YXRjaGRvZ19sb2NrIGhlbGQsCnNvIHRoZXJlIGFyZSBubyBjb25jdXJyZW5jeSBwcm9ibGVt
cyB0byBkZWFsIHdpdGguCgpGdXJ0aGVybW9yZSwgdGhlcmUgaXMgbm8gbmVlZCB0byB1c2UgYSBs
b29wIHRvIGxvY2F0ZSB0aGUgbmV4dCBhdmFpbGFibGUKd2F0Y2hkb2cuICBBcyB0aGUgYml0bWFw
IGlzIGN1cnJlbnRseSAyIGJpdHMgd2lkZSBhbmQgaXMgc3RvcmVkIGluIGEgdWludDMyX3QsCnRo
ZSBuZXh0IGF2YWlsYWJsZSB0aW1lciBjYW4gYmUgbG9jYXRlZCBpbiBPKDEpIHRpbWUgdXNpbmcg
Yml0LXNjYW5uaW5nCmluc3RydWN0aW9ucy4KCk5vIGNoYW5nZSBpbiBiZWhhdmlvdXIsIGJ1dCBz
aG91bGQgaGF2ZSBsZXNzIGNhY2hlLWNvaGVyZW5jeSBpbXBhY3QuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNp
dHJpeC5jb20+CkNDOiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPgpDQzog
Q2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpDQzogUGF1IFJ1
aXogU2Fmb250IDxwYXUuc2Fmb250QGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVs
ZS5jIHwgMTQgKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDg5YWJhODguLjk4YzJjMzUgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTEwNjgs
MTcgKzEwNjgsMTUgQEAgc3RhdGljIGxvbmcgZG9tYWluX3dhdGNoZG9nKHN0cnVjdCBkb21haW4g
KmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0aW1lb3V0KQogICAgIH0KICAgICBlbHNlIC8qIEFs
bG9jYXRlIHRoZSBuZXh0IGF2YWlsYWJsZSB0aW1lci4gKi8KICAgICB7Ci0gICAgICAgIGZvciAo
IGlkID0gMDsgaWQgPCBOUl9ET01BSU5fV0FUQ0hET0dfVElNRVJTOyBpZCsrICkKLSAgICAgICAg
ewotICAgICAgICAgICAgaWYgKCB0ZXN0X2FuZF9zZXRfYml0KGlkLCAmZC0+d2F0Y2hkb2dfaW51
c2VfbWFwKSApCi0gICAgICAgICAgICAgICAgY29udGludWU7Ci0gICAgICAgICAgICBicmVhazsK
LSAgICAgICAgfQotICAgICAgICBpZiAoIGlkID09IE5SX0RPTUFJTl9XQVRDSERPR19USU1FUlMg
KQorICAgICAgICBpZCA9IGZmcyh+ZC0+d2F0Y2hkb2dfaW51c2VfbWFwKSAtIDE7CisKKyAgICAg
ICAgaWYgKCB1bmxpa2VseShpZCA+PSBOUl9ET01BSU5fV0FUQ0hET0dfVElNRVJTKSApCiAgICAg
ICAgIHsKICAgICAgICAgICAgIHJjID0gLUVOT1NQQzsKICAgICAgICAgICAgIGdvdG8gdW5sb2Nr
OwogICAgICAgICB9CisKKyAgICAgICAgX19zZXRfYml0KGlkLCAmZC0+d2F0Y2hkb2dfaW51c2Vf
bWFwKTsKICAgICAgICAgcmMgPSBpZCArIDE7CiAgICAgfQogCkBAIC0xMDg2LDcgKzEwODQsNyBA
QCBzdGF0aWMgbG9uZyBkb21haW5fd2F0Y2hkb2coc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3Qg
aWQsIHVpbnQzMl90IHRpbWVvdXQpCiAgICAgaWYgKCB1bmxpa2VseSh0aW1lb3V0ID09IDApICkK
ICAgICB7CiAgICAgICAgIHN0b3BfdGltZXIoJmQtPndhdGNoZG9nX3RpbWVyW2lkXSk7Ci0gICAg
ICAgIGNsZWFyX2JpdChpZCwgJmQtPndhdGNoZG9nX2ludXNlX21hcCk7CisgICAgICAgIF9fY2xl
YXJfYml0KGlkLCAmZC0+d2F0Y2hkb2dfaW51c2VfbWFwKTsKICAgICB9CiAgICAgZWxzZQogICAg
ICAgICBzZXRfdGltZXIoJmQtPndhdGNoZG9nX3RpbWVyW2lkXSwgTk9XKCkgKyBTRUNPTkRTKHRp
bWVvdXQpKTsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
