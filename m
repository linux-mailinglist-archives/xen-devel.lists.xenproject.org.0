Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDEA132BD
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:02:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbXl-00087x-HI; Fri, 03 May 2019 17:00:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXk-00086q-3H
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:16 +0000
X-Inumbo-ID: eb861d4b-6dc4-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eb861d4b-6dc4-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:00:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85085374"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 17:59:54 +0100
Message-ID: <20190503165957.5960-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 08/11] mg-repro-setup: Move flight
 creation up before task creation
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

Tm8gc2lnbmlmaWNhbnQgZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZy1yZXByby1zZXR1cCB8IDYg
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL21nLXJlcHJvLXNldHVwIGIvbWctcmVwcm8tc2V0dXAKaW5kZXggZDYzZTI5
YjYuLjJlMWQzYjg4IDEwMDc1NQotLS0gYS9tZy1yZXByby1zZXR1cAorKysgYi9tZy1yZXByby1z
ZXR1cApAQCAtMTY3LDYgKzE2Nyw5IEBAIHdoaWxlIFsgJCMgLW5lIDAgXTsgZG8KIAllc2FjCiBk
b25lCiAKK2ZsaWdodD0kKC4vY3MtYWRqdXN0LWZsaWdodCBuZXc6JGJsZXNzaW5nKQorcHJvZ3Jl
c3MgIm5ldyBmbGlnaHQgaXMgJGZsaWdodCIKKwogT1NTVEVTVF9UQVNLPSQocGVybCAtZSAnCiAJ
dXNlIE9zc3Rlc3Q7CiAJdXNlIE9zc3Rlc3Q6OkV4ZWN1dGl2ZTsKQEAgLTE3Niw5ICsxNzksNiBA
QCBPU1NURVNUX1RBU0s9JChwZXJsIC1lICcKICcpCiBleHBvcnQgT1NTVEVTVF9UQVNLCiAKLWZs
aWdodD0kKC4vY3MtYWRqdXN0LWZsaWdodCBuZXc6JGJsZXNzaW5nKQotcHJvZ3Jlc3MgIm5ldyBm
bGlnaHQgaXMgJGZsaWdodCIKLQogaWYgWyAiJHthbGxvY19pZGVudHNbKl19IiBdOyB0aGVuCiAJ
cHJvZ3Jlc3MgImFsbG9jYXRpbmcgJHthbGxvY19pZGVudHNbKl19IC4uLiIKIAlhbGxvY19vdXRw
dXQ9dG1wLyRmbGlnaHQuYWxsb2NhdGlvbnMKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
