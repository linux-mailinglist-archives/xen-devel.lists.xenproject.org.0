Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9315B61C33
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 11:15:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkPgb-0004TD-Jp; Mon, 08 Jul 2019 09:11:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IuGq=VF=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hkPgZ-0004St-Ss
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 09:11:47 +0000
X-Inumbo-ID: 68e8ba64-a160-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 68e8ba64-a160-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 09:11:46 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6899QTb139444;
 Mon, 8 Jul 2019 09:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=YuCOXIRb/dHuU0bztnXWfWAbrWp+ScSgOTP4KoY+oi4=;
 b=fte+4okDlbBOW36ZhZ3sYg4Sw9JLrnVas78c0E7OyeWp/fw11it2dHFh/v0iE+esoPkQ
 hE6WOYa8/KBehCvThKu+5w9YkRNP6XNbvmNXnWI5sph2Vd65unRfr8gGNwPsWxh87iiU
 LcZOeJyRUDNdxXD5zLPEIrJU+Pud/iK4nGZ0SLYVrbw88Om8H9m38zM8j75dmQ4ueqHC
 DWvnb2VIwA9R15lPz6+G7scJZhUiEf4UIoJwyiMilUrPiw/W7RhQuof09pHGpLGWAyIG
 Y7E3TiG+OgfsGnhgMQ8/SKFz9YHhUi5lh0WEy4tlYQhgZJV3kHV1GoBIswPJwpe/hL7s Iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2tjk2td9c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6897t5O110914;
 Mon, 8 Jul 2019 09:11:33 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2tjkf23d95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:33 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x689BWbg032749;
 Mon, 8 Jul 2019 09:11:32 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 02:11:31 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  7 Jul 2019 17:15:05 +0800
Message-Id: <1562490908-17882-2-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907080120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907080121
Subject: [Xen-devel] [PATCH v6 1/4] x86/xen: Mark xen_hvm_need_lapic() and
 xen_x2apic_para_available() as __init
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
Cc: jgross@suse.com, sstabellini@kernel.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYXMgdGhleSBhcmUgb25seSBjYWxsZWQgYXQgZWFybHkgYm9vdHVwIHN0YWdlLiBJbiBmYWN0
LCBvdGhlcgpmdW5jdGlvbnMgaW4geDg2X2h5cGVyX3hlbl9odm0uaW5pdC4qIGFyZSBhbGwgbWFy
a2VkIGFzIF9faW5pdC4KClVuZXhwb3J0IHhlbl9odm1fbmVlZF9sYXBpYyBhcyBpdCdzIG5ldmVy
IHVzZWQgb3V0c2lkZS4KClNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcu
ZHVhbkBvcmFjbGUuY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRob21hcyBH
bGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhh
dC5jb20+CkNjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KLS0tCiBhcmNoL3g4Ni9p
bmNsdWRlL2FzbS94ZW4vaHlwZXJ2aXNvci5oIHwgNiArKystLS0KIGFyY2gveDg2L3hlbi9lbmxp
Z2h0ZW5faHZtLmMgICAgICAgICAgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
eGVuL2h5cGVydmlzb3IuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9oeXBlcnZpc29yLmgK
aW5kZXggMzkxNzFiMy4uNDJlMTI0NSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
eGVuL2h5cGVydmlzb3IuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJ2aXNv
ci5oCkBAIC00NCwxNCArNDQsMTQgQEAgc3RhdGljIGlubGluZSB1aW50MzJfdCB4ZW5fY3B1aWRf
YmFzZSh2b2lkKQogfQogCiAjaWZkZWYgQ09ORklHX1hFTgotZXh0ZXJuIGJvb2wgeGVuX2h2bV9u
ZWVkX2xhcGljKHZvaWQpOworZXh0ZXJuIGJvb2wgX19pbml0IHhlbl9odm1fbmVlZF9sYXBpYyh2
b2lkKTsKIAotc3RhdGljIGlubGluZSBib29sIHhlbl94MmFwaWNfcGFyYV9hdmFpbGFibGUodm9p
ZCkKK3N0YXRpYyBpbmxpbmUgYm9vbCBfX2luaXQgeGVuX3gyYXBpY19wYXJhX2F2YWlsYWJsZSh2
b2lkKQogewogCXJldHVybiB4ZW5faHZtX25lZWRfbGFwaWMoKTsKIH0KICNlbHNlCi1zdGF0aWMg
aW5saW5lIGJvb2wgeGVuX3gyYXBpY19wYXJhX2F2YWlsYWJsZSh2b2lkKQorc3RhdGljIGlubGlu
ZSBib29sIF9faW5pdCB4ZW5feDJhcGljX3BhcmFfYXZhaWxhYmxlKHZvaWQpCiB7CiAJcmV0dXJu
ICh4ZW5fY3B1aWRfYmFzZSgpICE9IDApOwogfQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2Vu
bGlnaHRlbl9odm0uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKaW5kZXggMGU3NTY0
Mi4uYWM0OTQzYyAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYworKysg
Yi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0yMTgsNyArMjE4LDcgQEAgc3RhdGlj
IF9faW5pdCBpbnQgeGVuX3BhcnNlX25vcHYoY2hhciAqYXJnKQogfQogZWFybHlfcGFyYW0oInhl
bl9ub3B2IiwgeGVuX3BhcnNlX25vcHYpOwogCi1ib29sIHhlbl9odm1fbmVlZF9sYXBpYyh2b2lk
KQorYm9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGljKHZvaWQpCiB7CiAJaWYgKHhlbl9ub3B2
KQogCQlyZXR1cm4gZmFsc2U7CkBAIC0yMzAsNyArMjMwLDYgQEAgYm9vbCB4ZW5faHZtX25lZWRf
bGFwaWModm9pZCkKIAkJcmV0dXJuIGZhbHNlOwogCXJldHVybiB0cnVlOwogfQotRVhQT1JUX1NZ
TUJPTF9HUEwoeGVuX2h2bV9uZWVkX2xhcGljKTsKIAogc3RhdGljIHVpbnQzMl90IF9faW5pdCB4
ZW5fcGxhdGZvcm1faHZtKHZvaWQpCiB7Ci0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
