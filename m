Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E018D6861B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 11:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hmx1z-0004u0-K4; Mon, 15 Jul 2019 09:12:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wvxR=VM=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hmx1x-0004tv-Va
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 09:12:22 +0000
X-Inumbo-ID: a1822b66-a6e0-11e9-992e-a718556de48a
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1822b66-a6e0-11e9-992e-a718556de48a;
 Mon, 15 Jul 2019 09:12:12 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6F991ei076054;
 Mon, 15 Jul 2019 09:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=z/YmuPr9JSWV/DypPBDpQvIz06xjsjRJ9H2PM05NQvs=;
 b=ZGLFovZPZ6uQQ5eC2fw1yn6EHcqLHh5YNaq+ye4mFA4NHLKwaYfz8XAHDy1VBR5o0fRI
 76GJJZejiNCUzXievGiR2xJljuVEL9H7amPvwVvdrnc+0hzM6bKIJwCzbyeehMWXe/gc
 AKGd2/LRF8115jb0zBk523suvfoEy7FroY63NVTigkMZ+n5TxBiEdX8xB0OY/mtQ+Wvz
 sXJRqJIskTxKt5PJc05Qj9r60HF/7esHJwu3np7EkSVAQeg6Ldwdvz0t+7qkeQ0eU7uC
 T0G6gFeSMnNNkEPMcvzhIcQc8lUS3YfWfQ93C1UYKEIIDWn7wdR0Ptf+OY0j1PYZcDD8 Cg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2tq6qtdbq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 09:11:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6F97a4P048335;
 Mon, 15 Jul 2019 09:11:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2tq5bbpp8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 09:11:50 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6F9BmRB010318;
 Mon, 15 Jul 2019 09:11:49 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 15 Jul 2019 02:11:48 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 14 Jul 2019 17:15:32 +0800
Message-Id: <1563095732-16700-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9318
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907150109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9318
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907150109
Subject: [Xen-devel] [PATCH v3] xen/pv: Fix a boot up hang revealed by int3
 self test
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
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDc0NTdjMGRhMDI0YiAoIng4Ni9hbHRlcm5hdGl2ZXM6IEFkZCBpbnQzX2VtdWxhdGVf
Y2FsbCgpCnNlbGZ0ZXN0IikgaXMgdXNlZCB0byBlbnN1cmUgdGhlcmUgaXMgYSBnYXAgc2V0dXAg
aW4gaW50MyBleGNlcHRpb24gc3RhY2sKd2hpY2ggY291bGQgYmUgdXNlZCBmb3IgaW5zZXJ0aW5n
IGNhbGwgcmV0dXJuIGFkZHJlc3MuCgpUaGlzIGdhcCBpcyBtaXNzZWQgaW4gWEVOIFBWIGludDMg
ZXhjZXB0aW9uIGVudHJ5IHBhdGgsIHRoZW4gYmVsb3cgcGFuaWMKdHJpZ2dlcmVkOgoKWyAgICAw
Ljc3Mjg3Nl0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0OiAwMDAwIFsjMV0gU01QIE5PUFRJClsg
ICAgMC43NzI4ODZdIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDUu
Mi4wKyAjMTEKWyAgICAwLjc3Mjg5M10gUklQOiBlMDMwOmludDNfbWFnaWMrMHgwLzB4NwpbICAg
IDAuNzcyOTA1XSBSU1A6IDM1MDc6ZmZmZmZmZmY4MjIwM2U5OCBFRkxBR1M6IDAwMDAwMjQ2Clsg
ICAgMC43NzMzMzRdIENhbGwgVHJhY2U6ClsgICAgMC43NzMzMzRdICBhbHRlcm5hdGl2ZV9pbnN0
cnVjdGlvbnMrMHgzZC8weDEyZQpbICAgIDAuNzczMzM0XSAgY2hlY2tfYnVncysweDdjOS8weDg4
NwpbICAgIDAuNzczMzM0XSAgPyBfX2dldF9sb2NrZWRfcHRlKzB4MTc4LzB4MWYwClsgICAgMC43
NzMzMzRdICBzdGFydF9rZXJuZWwrMHg0ZmYvMHg1MzUKWyAgICAwLjc3MzMzNF0gID8gc2V0X2lu
aXRfYXJnKzB4NTUvMHg1NQpbICAgIDAuNzczMzM0XSAgeGVuX3N0YXJ0X2tlcm5lbCsweDU3MS8w
eDU3YQoKRm9yIDY0Yml0IFBWIGd1ZXN0cywgWGVuJ3MgQUJJIGVudGVycyB0aGUga2VybmVsIHdp
dGggdXNpbmcgU1lTUkVULCB3aXRoCiVyY3gvJXIxMSBvbiB0aGUgc3RhY2suIFRvIGNvbnZlcnQg
YmFjayB0byAibm9ybWFsIiBsb29raW5nIGV4Y2VwdGlvbnMsCnRoZSB4ZW4gdGh1bmtzIGRvICd4
ZW5fKjogcG9wICVyY3g7IHBvcCAlcjExOyBqbXAgKicuCgpFLmcuIEV4dHJhY3RpbmcgJ3hlbl9w
dl90cmFwIHhlbmludDMnIHdlIGhhdmU6Cnhlbl94ZW5pbnQzOgogcG9wICVyY3g7CiBwb3AgJXIx
MTsKIGptcCB4ZW5pbnQzCgpBcyB4ZW5pbnQzIGFuZCBpbnQzIGVudHJ5IGNvZGUgYXJlIHNhbWUg
ZXhjZXB0IHhlbmludDMgZG9lc24ndCBnZW5lcmF0ZQphIGdhcCwgd2UgY2FuIGZpeCBpdCBieSB1
c2luZyBpbnQzIGFuZCBkcm9wIHVzZWxlc3MgeGVuaW50My4KClNpZ25lZC1vZmYtYnk6IFpoZW56
aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgpDYzogQm9yaXMgT3N0cm92c2t5
IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Q2M6IEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPgpDYzogUGV0ZXIgWmlqbHN0cmEg
PHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBl
dGtvdiA8YnBAYWxpZW44LmRlPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCiBib290dXAgdGVzdCBwYXNzIHdpdGggUFYgZ3Vlc3QuCgogdjM6IHNldCBp
c3Rfb2theSB0byBmYWxzZSBmb3IgaW50MyBwZXIgUGV0ZXJaCiAgICAgYWRkIEFuZHJldydzIGNv
bW1lbnRzIHRvIHBhdGNoIGRlc2NyaXB0aW9uCgogdjI6IGZpeCB1cCBkZXNjcmlwdGlvbi4KLS0t
CiBhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TICAgIHwgMSAtCiBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS90cmFwcy5oIHwgMiArLQogYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jICB8IDIgKy0KIGFy
Y2gveDg2L3hlbi94ZW4tYXNtXzY0LlMgICAgfCAxIC0KIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2VudHJ5L2Vu
dHJ5XzY0LlMgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TCmluZGV4IDBlYTQ4MzEuLjM1YTY2
ZmMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMKKysrIGIvYXJjaC94ODYv
ZW50cnkvZW50cnlfNjQuUwpAQCAtMTE3Niw3ICsxMTc2LDYgQEAgaWR0ZW50cnkgc3RhY2tfc2Vn
bWVudAkJZG9fc3RhY2tfc2VnbWVudAloYXNfZXJyb3JfY29kZT0xCiAjaWZkZWYgQ09ORklHX1hF
Tl9QVgogaWR0ZW50cnkgeGVubm1pCQkJZG9fbm1pCQkJaGFzX2Vycm9yX2NvZGU9MAogaWR0ZW50
cnkgeGVuZGVidWcJCWRvX2RlYnVnCQloYXNfZXJyb3JfY29kZT0wCi1pZHRlbnRyeSB4ZW5pbnQz
CQlkb19pbnQzCQkJaGFzX2Vycm9yX2NvZGU9MAogI2VuZGlmCiAKIGlkdGVudHJ5IGdlbmVyYWxf
cHJvdGVjdGlvbglkb19nZW5lcmFsX3Byb3RlY3Rpb24JaGFzX2Vycm9yX2NvZGU9MQpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdHJhcHMuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3RyYXBzLmgKaW5kZXggN2Q2ZjNmMy4uZjJiZDI4NCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5j
bHVkZS9hc20vdHJhcHMuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90cmFwcy5oCkBAIC00
MCw3ICs0MCw3IEBACiBhc21saW5rYWdlIHZvaWQgeGVuX2RpdmlkZV9lcnJvcih2b2lkKTsKIGFz
bWxpbmthZ2Ugdm9pZCB4ZW5feGVubm1pKHZvaWQpOwogYXNtbGlua2FnZSB2b2lkIHhlbl94ZW5k
ZWJ1Zyh2b2lkKTsKLWFzbWxpbmthZ2Ugdm9pZCB4ZW5feGVuaW50Myh2b2lkKTsKK2FzbWxpbmth
Z2Ugdm9pZCB4ZW5faW50Myh2b2lkKTsKIGFzbWxpbmthZ2Ugdm9pZCB4ZW5fb3ZlcmZsb3codm9p
ZCk7CiBhc21saW5rYWdlIHZvaWQgeGVuX2JvdW5kcyh2b2lkKTsKIGFzbWxpbmthZ2Ugdm9pZCB4
ZW5faW52YWxpZF9vcCh2b2lkKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwppbmRleCA0NzIyYmEyLi4zMGMxNGNi
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKKysrIGIvYXJjaC94ODYv
eGVuL2VubGlnaHRlbl9wdi5jCkBAIC01OTYsMTIgKzU5NiwxMiBAQCBzdHJ1Y3QgdHJhcF9hcnJh
eV9lbnRyeSB7CiAKIHN0YXRpYyBzdHJ1Y3QgdHJhcF9hcnJheV9lbnRyeSB0cmFwX2FycmF5W10g
PSB7CiAJeyBkZWJ1ZywgICAgICAgICAgICAgICAgICAgICAgIHhlbl94ZW5kZWJ1ZywgICAgICAg
ICAgICAgICAgICAgIHRydWUgfSwKLQl7IGludDMsICAgICAgICAgICAgICAgICAgICAgICAgeGVu
X3hlbmludDMsICAgICAgICAgICAgICAgICAgICAgdHJ1ZSB9LAogCXsgZG91YmxlX2ZhdWx0LCAg
ICAgICAgICAgICAgICB4ZW5fZG91YmxlX2ZhdWx0LCAgICAgICAgICAgICAgICB0cnVlIH0sCiAj
aWZkZWYgQ09ORklHX1g4Nl9NQ0UKIAl7IG1hY2hpbmVfY2hlY2ssICAgICAgICAgICAgICAgeGVu
X21hY2hpbmVfY2hlY2ssICAgICAgICAgICAgICAgdHJ1ZSB9LAogI2VuZGlmCiAJeyBubWksICAg
ICAgICAgICAgICAgICAgICAgICAgIHhlbl94ZW5ubWksICAgICAgICAgICAgICAgICAgICAgIHRy
dWUgfSwKKwl7IGludDMsICAgICAgICAgICAgICAgICAgICAgICAgeGVuX2ludDMsICAgICAgICAg
ICAgICAgICAgICAgICAgZmFsc2UgfSwKIAl7IG92ZXJmbG93LCAgICAgICAgICAgICAgICAgICAg
eGVuX292ZXJmbG93LCAgICAgICAgICAgICAgICAgICAgZmFsc2UgfSwKICNpZmRlZiBDT05GSUdf
SUEzMl9FTVVMQVRJT04KIAl7IGVudHJ5X0lOVDgwX2NvbXBhdCwgICAgICAgICAgeGVuX2VudHJ5
X0lOVDgwX2NvbXBhdCwgICAgICAgICAgZmFsc2UgfSwKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hl
bi94ZW4tYXNtXzY0LlMgYi9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TCmluZGV4IDFlOWVmMGIu
LmViZjYxMGIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi94ZW4tYXNtXzY0LlMKKysrIGIvYXJj
aC94ODYveGVuL3hlbi1hc21fNjQuUwpAQCAtMzIsNyArMzIsNiBAQCB4ZW5fcHZfdHJhcCBkaXZp
ZGVfZXJyb3IKIHhlbl9wdl90cmFwIGRlYnVnCiB4ZW5fcHZfdHJhcCB4ZW5kZWJ1ZwogeGVuX3B2
X3RyYXAgaW50MwoteGVuX3B2X3RyYXAgeGVuaW50MwogeGVuX3B2X3RyYXAgeGVubm1pCiB4ZW5f
cHZfdHJhcCBvdmVyZmxvdwogeGVuX3B2X3RyYXAgYm91bmRzCi0tIAoxLjguMy4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
