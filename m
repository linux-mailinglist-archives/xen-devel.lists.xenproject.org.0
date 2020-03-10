Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC6417F10B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 08:33:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBZK2-0001YM-36; Tue, 10 Mar 2020 07:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WGVw=43=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBZK0-0001YC-R4
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 07:29:00 +0000
X-Inumbo-ID: cede43a2-62a0-11ea-ad1e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cede43a2-62a0-11ea-ad1e-12813bfff9fa;
 Tue, 10 Mar 2020 07:28:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0E245AE2E;
 Tue, 10 Mar 2020 07:28:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Mar 2020 08:28:51 +0100
Message-Id: <20200310072853.27567-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200310072853.27567-1-jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 4/6] xen/rcu: fix rcu_lock_domain()
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cmN1X2xvY2tfZG9tYWluKCkgbWlzdXNlcyB0aGUgZG9tYWluIHN0cnVjdHVyZSBhcyByY3UgbG9j
aywgd2hpY2ggaXMKd29ya2luZyBvbmx5IGFzIGxvbmcgYXMgcmN1X3JlYWRfbG9jaygpIGlzbid0
IGV2YWx1YXRpbmcgdGhlIGxvY2suCgpGaXggdGhhdCBieSBhZGRpbmcgYSByY3UgbG9jayB0byBz
dHJ1Y3QgZG9tYWluIGFuZCB1c2UgdGhhdCBmb3IKcmN1X2xvY2tfZG9tYWluKCkuCgpTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9k
b21haW4uYyAgICAgICAgfCAxICsKIHhlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oIHwgMSArCiB4
ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICB8IDYgKysrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2Rv
bWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwppbmRleCA2YWQ0NThmYTZiLi5iNGViNDc2YTlj
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWlu
LmMKQEAgLTM5OCw2ICszOTgsNyBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlk
X3QgZG9taWQsCiAgICAgICAgIGdvdG8gZmFpbDsKIAogICAgIGF0b21pY19zZXQoJmQtPnJlZmNu
dCwgMSk7CisgICAgUkNVX1JFQURfTE9DS19JTklUKCZkLT5yY3VfbG9jayk7CiAgICAgc3Bpbl9s
b2NrX2luaXRfcHJvZihkLCBkb21haW5fbG9jayk7CiAgICAgc3Bpbl9sb2NrX2luaXRfcHJvZihk
LCBwYWdlX2FsbG9jX2xvY2spOwogICAgIHNwaW5fbG9ja19pbml0KCZkLT5oeXBlcmNhbGxfZGVh
ZGxvY2tfbXV0ZXgpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmggYi94
ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAppbmRleCA4N2YzNWI3NzA0Li4zMWM4Yjg2ZDEzIDEw
MDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcmN1cGRhdGUuaAorKysgYi94ZW4vaW5jbHVkZS94
ZW4vcmN1cGRhdGUuaApAQCAtNjUsNiArNjUsNyBAQCBpbnQgcmN1X25lZWRzX2NwdShpbnQgY3B1
KTsKIHN0cnVjdCBfcmN1X3JlYWRfbG9jayB7fTsKIHR5cGVkZWYgc3RydWN0IF9yY3VfcmVhZF9s
b2NrIHJjdV9yZWFkX2xvY2tfdDsKICNkZWZpbmUgREVGSU5FX1JDVV9SRUFEX0xPQ0soeCkgcmN1
X3JlYWRfbG9ja190IHgKKyNkZWZpbmUgUkNVX1JFQURfTE9DS19JTklUKHgpCiAKIC8qKgogICog
cmN1X3JlYWRfbG9jayAtIG1hcmsgdGhlIGJlZ2lubmluZyBvZiBhbiBSQ1UgcmVhZC1zaWRlIGNy
aXRpY2FsIHNlY3Rpb24uCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDNhNGY0MzA5OGMuLjY0N2U0ZDMxZmIgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCkBAIC0zNDgsNiArMzQ4LDggQEAgc3RydWN0IGRvbWFpbgogCiAgICAgc2hhcmVkX2luZm9f
dCAgICpzaGFyZWRfaW5mbzsgICAgIC8qIHNoYXJlZCBkYXRhIGFyZWEgKi8KIAorICAgIHJjdV9y
ZWFkX2xvY2tfdCAgcmN1X2xvY2s7CisKICAgICBzcGlubG9ja190ICAgICAgIGRvbWFpbl9sb2Nr
OwogCiAgICAgc3BpbmxvY2tfdCAgICAgICBwYWdlX2FsbG9jX2xvY2s7IC8qIHByb3RlY3RzIGFs
bCB0aGUgZm9sbG93aW5nIGZpZWxkcyAgKi8KQEAgLTYzNCwxMyArNjM2LDEzIEBAIGludCByY3Vf
bG9ja19saXZlX3JlbW90ZV9kb21haW5fYnlfaWQoZG9taWRfdCBkb20sIHN0cnVjdCBkb21haW4g
KipkKTsKIHN0YXRpYyBpbmxpbmUgdm9pZCByY3VfdW5sb2NrX2RvbWFpbihzdHJ1Y3QgZG9tYWlu
ICpkKQogewogICAgIGlmICggZCAhPSBjdXJyZW50LT5kb21haW4gKQotICAgICAgICByY3VfcmVh
ZF91bmxvY2soZCk7CisgICAgICAgIHJjdV9yZWFkX3VubG9jaygmZC0+cmN1X2xvY2spOwogfQog
CiBzdGF0aWMgaW5saW5lIHN0cnVjdCBkb21haW4gKnJjdV9sb2NrX2RvbWFpbihzdHJ1Y3QgZG9t
YWluICpkKQogewogICAgIGlmICggZCAhPSBjdXJyZW50LT5kb21haW4gKQotICAgICAgICByY3Vf
cmVhZF9sb2NrKGQpOworICAgICAgICByY3VfcmVhZF9sb2NrKCZkLT5yY3VfbG9jayk7CiAgICAg
cmV0dXJuIGQ7CiB9CiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
