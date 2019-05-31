Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D62306BE
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 04:50:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWXZd-0003En-0V; Fri, 31 May 2019 02:47:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=USVC=T7=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWXZb-0003Ei-0I
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 02:47:15 +0000
X-Inumbo-ID: 612365a4-834e-11e9-bdd5-bf224ddb4e64
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 612365a4-834e-11e9-bdd5-bf224ddb4e64;
 Fri, 31 May 2019 02:47:09 +0000 (UTC)
Received: from localhost.localdomain (61.161.186.150) by
 mxnavi-mail.mxnavi.com (116.90.87.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 31 May 2019 10:44:53 +0800
From: Baodong Chen <chenbaodong@mxnavi.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 31 May 2019 10:46:55 +0800
Message-ID: <1559270815-19243-1-git-send-email-chenbaodong@mxnavi.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: [Xen-devel] [PATCH] xen: cpu: change 'cpu_hotplug_[begin|done]' to
 inline function
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
cHUuaCB8ICA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2NwdS5jIGIveGVuL2NvbW1vbi9jcHUu
YwppbmRleCBmMzg4ZDg5Li5hNTI2YjU1IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NwdS5jCisr
KyBiL3hlbi9jb21tb24vY3B1LmMKQEAgLTUxLDE2ICs1MSw2IEBAIHZvaWQgcHV0X2NwdV9tYXBz
KHZvaWQpCiAgICAgc3Bpbl91bmxvY2tfcmVjdXJzaXZlKCZjcHVfYWRkX3JlbW92ZV9sb2NrKTsK
IH0KIAotYm9vbF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpCi17Ci0gICAgcmV0dXJuIGdldF9j
cHVfbWFwcygpOwotfQotCi12b2lkIGNwdV9ob3RwbHVnX2RvbmUodm9pZCkKLXsKLSAgICBwdXRf
Y3B1X21hcHMoKTsKLX0KLQogc3RhdGljIE5PVElGSUVSX0hFQUQoY3B1X2NoYWluKTsKIAogdm9p
ZCBfX2luaXQgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIp
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY3B1LmggYi94ZW4vaW5jbHVkZS94ZW4vY3B1
LmgKaW5kZXggNDYzOGM1MC4uNzBhMmRmNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2Nw
dS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9jcHUuaApAQCAtMTAsOCArMTAsOCBAQCBib29sX3Qg
Z2V0X2NwdV9tYXBzKHZvaWQpOwogdm9pZCBwdXRfY3B1X21hcHModm9pZCk7CiAKIC8qIFNhZmVs
eSBwZXJmb3JtIENQVSBob3RwbHVnIGFuZCB1cGRhdGUgY3B1X29ubGluZV9tYXAsIGV0Yy4gKi8K
LWJvb2xfdCBjcHVfaG90cGx1Z19iZWdpbih2b2lkKTsKLXZvaWQgY3B1X2hvdHBsdWdfZG9uZSh2
b2lkKTsKK3N0YXRpYyBpbmxpbmUgYm9vbF90IGNwdV9ob3RwbHVnX2JlZ2luKHZvaWQpIHsgcmV0
dXJuIGdldF9jcHVfbWFwcygpOyB9CitzdGF0aWMgaW5saW5lIHZvaWQgY3B1X2hvdHBsdWdfZG9u
ZSh2b2lkKSB7IHB1dF9jcHVfbWFwcygpOyB9CiAKIC8qIFJlY2VpdmUgbm90aWZpY2F0aW9uIG9m
IENQVSBob3RwbHVnIGV2ZW50cy4gKi8KIHZvaWQgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKHN0cnVj
dCBub3RpZmllcl9ibG9jayAqbmIpOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
