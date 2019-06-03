Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CA32657
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 04:00:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXcDy-0002Q7-61; Mon, 03 Jun 2019 01:57:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXcDx-0002Q1-3i
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:57:21 +0000
X-Inumbo-ID: e8205d4a-85a2-11e9-8f22-5ffccb4f699b
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8205d4a-85a2-11e9-8f22-5ffccb4f699b;
 Mon, 03 Jun 2019 01:57:15 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Mon, 3 Jun 2019 09:55:01 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 09:57:04 +0800
Message-ID: <1559527024-7507-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH RESEND] xen: cpu: change
 'cpu_hotplug_[begin|done]' to inline function
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Baodong Chen <chenbaodong@mxnavi.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPgotLS0K
IHhlbi9jb21tb24vY3B1LmMgICAgICB8IDEwIC0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9j
cHUuaCB8IDEwICsrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdS5jIGIveGVuL2NvbW1v
bi9jcHUuYwppbmRleCBmMzg4ZDg5Li5hNTI2YjU1IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2Nw
dS5jCisrKyBiL3hlbi9jb21tb24vY3B1LmMKQEAgLTUxLDE2ICs1MSw2IEBAIHZvaWQgcHV0X2Nw
dV9tYXBzKHZvaWQpCiAgICAgc3Bpbl91bmxvY2tfcmVjdXJzaXZlKCZjcHVfYWRkX3JlbW92ZV9s
b2NrKTsKIH0KIAotYm9vbF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpCi17Ci0gICAgcmV0dXJu
IGdldF9jcHVfbWFwcygpOwotfQotCi12b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCkKLXsKLSAg
ICBwdXRfY3B1X21hcHMoKTsKLX0KLQogc3RhdGljIE5PVElGSUVSX0hFQUQoY3B1X2NoYWluKTsK
IAogdm9pZCBfX2luaXQgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqbmIpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY3B1LmggYi94ZW4vaW5jbHVkZS94
ZW4vY3B1LmgKaW5kZXggNDYzOGM1MC4uNTY4ZDQ4MyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2NwdS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9jcHUuaApAQCAtMTAsOCArMTAsMTQgQEAg
Ym9vbF90IGdldF9jcHVfbWFwcyh2b2lkKTsKIHZvaWQgcHV0X2NwdV9tYXBzKHZvaWQpOwogCiAv
KiBTYWZlbHkgcGVyZm9ybSBDUFUgaG90cGx1ZyBhbmQgdXBkYXRlIGNwdV9vbmxpbmVfbWFwLCBl
dGMuICovCi1ib29sX3QgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCk7Ci12b2lkIGNwdV9ob3RwbHVn
X2RvbmUodm9pZCk7CitzdGF0aWMgaW5saW5lIGJvb2wgY3B1X2hvdHBsdWdfYmVnaW4odm9pZCkK
K3sKKyAgICByZXR1cm4gZ2V0X2NwdV9tYXBzKCk7Cit9CitzdGF0aWMgaW5saW5lIHZvaWQgY3B1
X2hvdHBsdWdfZG9uZSh2b2lkKQoreworICAgIHB1dF9jcHVfbWFwcygpOworfQogCiAvKiBSZWNl
aXZlIG5vdGlmaWNhdGlvbiBvZiBDUFUgaG90cGx1ZyBldmVudHMuICovCiB2b2lkIHJlZ2lzdGVy
X2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iKTsKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
