Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E88460C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 09:34:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvGQo-0004Gk-J5; Wed, 07 Aug 2019 07:32:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvGQn-0004Gf-QC
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 07:32:21 +0000
X-Inumbo-ID: 7cd3709f-b8e5-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7cd3709f-b8e5-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 07:32:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF2AFAF97;
 Wed,  7 Aug 2019 07:32:18 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 09:32:16 +0200
Message-Id: <20190807073216.3239-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/x86: lock cacheline for add_sized()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YWRkX3NpemVkKCkgc2hvdWxkIHVzZSBhbiBhdG9taWMgdXBkYXRlIG9mIHRoZSBtZW1vcnkgd29y
ZCwgYXMgaXQgaXMKdXNlZCBieSBzcGluX3VubG9jaygpLgoKVGlja2V0IGxvY2tzIGFyZSB1c2lu
ZyBhIHJlYWQtbW9kaWZ5LXdyaXRlIG9wZXJhdGlvbiBvbiBwYXJ0cyBvZiB0aGUKbG9ja3dvcmQg
Zm9yIHVubG9ja2luZywgd2hpbGUgdHJ5aW5nIHRvIGxvY2sgaXMgZG9uZSBieSBhbiBhdG9taWMK
dXBkYXRlIG9mIHRoZSBjb21wbGV0ZSBsb2Nrd29yZC4gVGhpcyByZXF1aXJlcyB0aGUgdW5sb2Nr
IG9wZXJhdGlvbiB0bwpiZSBhdG9taWMsIHRvbywgYXMgb3RoZXJ3aXNlIHRoZSB1bmxvY2sgbWln
aHQgbm90IHdyaXRlIGJhY2sgdGhlCmNvcnJlY3QgZGF0YS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2F0b21p
Yy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvYXRvbWljLmgKaW5kZXggNjgyYmNmOTFiMS4uODk3ZjY2MTE5MSAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hdG9taWMuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L2F0b21pYy5oCkBAIC0yMSw3ICsyMSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBuYW1lKHZvbGF0
aWxlIHR5cGUgKmFkZHIsIHR5cGUgdmFsKSBcCiAjZGVmaW5lIGJ1aWxkX2FkZF9zaXplZChuYW1l
LCBzaXplLCB0eXBlLCByZWcpIFwKICAgICBzdGF0aWMgaW5saW5lIHZvaWQgbmFtZSh2b2xhdGls
ZSB0eXBlICphZGRyLCB0eXBlIHZhbCkgICAgICAgICAgICAgIFwKICAgICB7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
LSAgICAgICAgYXNtIHZvbGF0aWxlKCJhZGQiIHNpemUgIiAlMSwlMCIgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKKyAgICAgICAgYXNtIHZvbGF0aWxlKCJsb2NrIGFkZCIgc2l6ZSAi
ICUxLCUwIiAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAg
IDogIj1tIiAoKmFkZHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICAgICAgICAgICAgICAgICAgIDogcmVnICh2YWwpKTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKICAgICB9Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
