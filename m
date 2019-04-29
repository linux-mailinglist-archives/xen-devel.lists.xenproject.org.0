Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1492E797
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:18:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8xP-0004X4-Fu; Mon, 29 Apr 2019 16:16:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiJS=S7=citrix.com=prvs=0159f91d2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hL8xN-0004Wh-Ma
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:16:41 +0000
X-Inumbo-ID: 2bb23458-6a9a-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2bb23458-6a9a-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 16:16:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,410,1549929600"; d="scan'208";a="84670045"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Apr 2019 17:16:29 +0100
Message-ID: <1556554590-25358-2-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
References: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.{11,
 10} 1/2] xen: Fix backport of "xen/cmdline: Fix buggy strncmp(s, LITERAL,
 ss - s) construct"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2Ugd2VyZSBtaXNzZWQgYXMgYSBjb25zZXF1ZW5jZSBvZiBiZWluZyByZWJhc2VkIG92ZXIg
b3RoZXIgY21kbGluZQpjbGVhbnVwLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+CgogeGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyAgIHwgNCArKy0tCiB4ZW4vYXJjaC94
ODYvaHZtL3ZteC92bWNzLmMgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxk
LmMgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCmluZGV4IGI3NDQ3OTEuLmRiZDdkMGQgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2Rv
bTBfYnVpbGQuYwpAQCAtMjM3LDEwICsyMzcsMTAgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vf
ZG9tMF9wYXJhbShjb25zdCBjaGFyICpzKQogICAgICAgICBpZiAoICFzcyApCiAgICAgICAgICAg
ICBzcyA9IHN0cmNocihzLCAnXDAnKTsKIAotICAgICAgICBpZiAoICFzdHJuY21wKHMsICJwdmgi
LCBzcyAtIHMpICkKKyAgICAgICAgaWYgKCAhY21kbGluZV9zdHJjbXAocywgInB2aCIpICkKICAg
ICAgICAgICAgIGRvbTBfcHZoID0gdHJ1ZTsKICNpZmRlZiBDT05GSUdfU0hBRE9XX1BBR0lORwot
ICAgICAgICBlbHNlIGlmICggIXN0cm5jbXAocywgInNoYWRvdyIsIHNzIC0gcykgKQorICAgICAg
ICBlbHNlIGlmICggIWNtZGxpbmVfc3RyY21wKHMsICJzaGFkb3ciKSApCiAgICAgICAgICAgICBv
cHRfZG9tMF9zaGFkb3cgPSB0cnVlOwogI2VuZGlmCiAgICAgICAgIGVsc2UKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3Mu
YwppbmRleCA0OWM5MTZiLi4xOTc1NWYyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bWNzLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jCkBAIC05MCw5ICs5MCw5
IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2VwdF9wYXJhbShjb25zdCBjaGFyICpzKQogICAg
ICAgICBpZiAoICFzcyApCiAgICAgICAgICAgICBzcyA9IHN0cmNocihzLCAnXDAnKTsKIAotICAg
ICAgICBpZiAoICFzdHJuY21wKHMsICJwbWwiLCBzcyAtIHMpICkKKyAgICAgICAgaWYgKCAhY21k
bGluZV9zdHJjbXAocywgInBtbCIpICkKICAgICAgICAgICAgIG9wdF9wbWxfZW5hYmxlZCA9IHZh
bDsKLSAgICAgICAgZWxzZSBpZiAoICFzdHJuY21wKHMsICJhZCIsIHNzIC0gcykgKQorICAgICAg
ICBlbHNlIGlmICggIWNtZGxpbmVfc3RyY21wKHMsICJhZCIpICkKICAgICAgICAgICAgIG9wdF9l
cHRfYWQgPSB2YWw7CiAgICAgICAgIGVsc2UKICAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
