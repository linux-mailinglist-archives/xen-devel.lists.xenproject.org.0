Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9A1A2FD
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 20:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPAFf-0006vW-SQ; Fri, 10 May 2019 18:28:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hPAFe-0006vK-Fx
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 18:28:10 +0000
X-Inumbo-ID: 5caea7a1-7351-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5caea7a1-7351-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 18:28:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,454,1549929600"; d="scan'208";a="85337735"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 10 May 2019 19:28:01 +0100
Message-ID: <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] xen/watchdog: Fold exit paths to have a
 single unlock
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

VGhpcyBpcyBtb3N0bHkgdG8gc2ltcGxpZnkgZnV0dXJlIGxvZ2ljYWwgY2hhbmdlcywgYnV0IGl0
IGRvZXMgY29tZSB3aXRoIGEKbW9kZXN0IHJlZHVuY3Rpb24gaW4gY29tcGlsZWQgY29kZSBzaXpl
ICgtNTUsIDM0NSA9PiAyOTApLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1
LmNpdHJpeC5jb20+CkNDOiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPgpD
QzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpDQzogUGF1
IFJ1aXogU2Fmb250IDxwYXUuc2Fmb250QGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hl
ZHVsZS5jIHwgMTQgKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDY2ZjFlMjYuLjQ3ZjVkMDQgMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTEw
NTAsNiArMTA1MCw4IEBAIHN0YXRpYyB2b2lkIGRvbWFpbl93YXRjaGRvZ190aW1lb3V0KHZvaWQg
KmRhdGEpCiAKIHN0YXRpYyBsb25nIGRvbWFpbl93YXRjaGRvZyhzdHJ1Y3QgZG9tYWluICpkLCB1
aW50MzJfdCBpZCwgdWludDMyX3QgdGltZW91dCkKIHsKKyAgICBsb25nIHJjID0gMDsKKwogICAg
IGlmICggaWQgPiBOUl9ET01BSU5fV0FUQ0hET0dfVElNRVJTICkKICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CiAKQEAgLTEwNjQsMTUgKzEwNjYsMTUgQEAgc3RhdGljIGxvbmcgZG9tYWluX3dhdGNo
ZG9nKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0aW1lb3V0KQogICAg
ICAgICAgICAgc2V0X3RpbWVyKCZkLT53YXRjaGRvZ190aW1lcltpZF0sIE5PVygpICsgU0VDT05E
Uyh0aW1lb3V0KSk7CiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgfQotICAgICAgICBzcGlu
X3VubG9jaygmZC0+d2F0Y2hkb2dfbG9jayk7Ci0gICAgICAgIHJldHVybiBpZCA9PSBOUl9ET01B
SU5fV0FUQ0hET0dfVElNRVJTID8gLUVOT1NQQyA6IGlkICsgMTsKKyAgICAgICAgcmMgPSBpZCA9
PSBOUl9ET01BSU5fV0FUQ0hET0dfVElNRVJTID8gLUVOT1NQQyA6IGlkICsgMTsKKyAgICAgICAg
Z290byB1bmxvY2s7CiAgICAgfQogCiAgICAgaWQgLT0gMTsKICAgICBpZiAoICF0ZXN0X2JpdChp
ZCwgJmQtPndhdGNoZG9nX2ludXNlX21hcCkgKQogICAgIHsKLSAgICAgICAgc3Bpbl91bmxvY2so
JmQtPndhdGNoZG9nX2xvY2spOwotICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICAgICAgcmMg
PSAtRUlOVkFMOworICAgICAgICBnb3RvIHVubG9jazsKICAgICB9CiAKICAgICBpZiAoIHRpbWVv
dXQgPT0gMCApCkBAIC0xMDg1LDggKzEwODcsMTAgQEAgc3RhdGljIGxvbmcgZG9tYWluX3dhdGNo
ZG9nKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0aW1lb3V0KQogICAg
ICAgICBzZXRfdGltZXIoJmQtPndhdGNoZG9nX3RpbWVyW2lkXSwgTk9XKCkgKyBTRUNPTkRTKHRp
bWVvdXQpKTsKICAgICB9CiAKKyB1bmxvY2s6CiAgICAgc3Bpbl91bmxvY2soJmQtPndhdGNoZG9n
X2xvY2spOwotICAgIHJldHVybiAwOworCisgICAgcmV0dXJuIHJjOwogfQogCiB2b2lkIHdhdGNo
ZG9nX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpCi0tIAoyLjEuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
