Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B81A2FF
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 20:31:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPAFf-0006vQ-Jq; Fri, 10 May 2019 18:28:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hPAFe-0006vF-7P
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 18:28:10 +0000
X-Inumbo-ID: 5c000217-7351-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5c000217-7351-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 18:28:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,454,1549929600"; d="scan'208";a="85337734"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 10 May 2019 19:28:00 +0100
Message-ID: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] xen/watchdog: Code and API improvements to
 the domain watchdog
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

VGhpcyBpcyBhIG1vc3RseSB0byBhZGRyZXNzIGEgY29ybmVyIGNhc2Ugd2hlbiB1c2luZyB3YXRj
aGRvZ3MsIHdoZW4gYSBkb21haW4Kd2lzaGVzIHRvIGNlYXNlIGZlbmNpbmcgYWN0aXZpdGVzIGFu
ZCBjbGVhbmx5IHJlYm9vdC4KClBhdGNoZXMgMSB0byAzIGFyZSBqdXN0IGNvZGUgaW1wcm92ZW1l
bnRzIGluIGRvbWFpbl93YXRjaGRvZygpLiAgUGF0Y2ggNAppbnRyb2R1Y2VzIHRoZSBuZXcgZnVu
Y3Rpb25hbGl0eS4KCkFuZHJldyBDb29wZXIgKDQpOgogIHhlbi93YXRjaGRvZzogRm9sZCBleGl0
IHBhdGhzIHRvIGhhdmUgYSBzaW5nbGUgdW5sb2NrCiAgeGVuL3dhdGNoZG9nOiBSZWFycmFuZ2Ug
dGhlIGxvZ2ljIHRvIGZvbGQgdGhlIHRpbWVyLWFybWluZyBwYXRocwogIHhlbi93YXRjaGRvZzog
RHJvcCBhbGwgbG9ja2VkIG9wZXJhdGlvbnMgb24gdGhlIHdhdGNoZG9nX2ludXNlX21hcAogIHhl
bi93YXRjaGRvZzogU3VwcG9ydCBkaXNhYmxlIGFsbCB3YXRjaGRvZyB0aW1lcnMgaW4gb25lIGdv
CgogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgfCA0NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvc2NoZWQuaCB8ICA2
ICsrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkKCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
