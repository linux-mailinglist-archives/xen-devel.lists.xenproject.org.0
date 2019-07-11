Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5FE66854
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 10:16:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlqeq-0004FZ-Ff; Fri, 12 Jul 2019 08:11:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hlqep-0004FU-9N
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 08:11:55 +0000
X-Inumbo-ID: b32763d8-a47c-11e9-a338-5f08aee08db6
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b32763d8-a47c-11e9-a338-5f08aee08db6;
 Fri, 12 Jul 2019 08:11:50 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C89Jha099333;
 Fri, 12 Jul 2019 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=pqd0p1GXeUPggPPvXgNNFelVAfyPsXqmmeemTWLVezY=;
 b=Vt08rtIQ4pSnPnJ+H7ONebQ6+AySlLrp604xldWUxpRaxasHRQbCzRsfKgQZGQQ24eIi
 s5+T67nk3RwOCHU7PoEsPVe1psrZbhvaYpka8P1OvmnoDUbA1cDgijo8OB9RABcbOrdM
 AccTxS806NpbyBRBR8IcP8Ar2Icvb5BsodR6asWMYL9H7YgPdeN2wSKGkNRu8QCp2THj
 QH44FLnXFlRT9gv850J5eHYM7287AtPBpk4+c0DsaBSRq3l4w972e6KovlfOYh8S8/Sx
 SmdW6RdpTh6ioVifS7K9RrxzrUOJpIq7abJBHJRzBACwjX6m+5J0G6805hKDGgxxAg8l eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2tjkkq44y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 08:11:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C87aZX087491;
 Fri, 12 Jul 2019 08:11:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2tmwgyn7hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 08:11:34 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6C8BXno016345;
 Fri, 12 Jul 2019 08:11:34 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 01:11:33 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jul 2019 16:15:21 +0800
Message-Id: <1562832921-20831-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120086
Subject: [Xen-devel] [PATCH v2] xen/pv: Fix a boot up hang revealed by int3
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, srinivas.eeda@oracle.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDc0NTdjMGRhMDI0YiAoIng4Ni9hbHRlcm5hdGl2ZXM6IEFkZCBpbnQzX2VtdWxhdGVf
Y2FsbCgpCnNlbGZ0ZXN0IikgaXMgdXNlZCB0byBlbnN1cmUgdGhlcmUgaXMgYSBnYXAgc2V0dXAg
aW4gZXhjZXB0aW9uIHN0YWNrCndoaWNoIGNvdWxkIGJlIHVzZWQgZm9yIGluc2VydGluZyBjYWxs
IHJldHVybiBhZGRyZXNzLgoKVGhpcyBnYXAgaXMgbWlzc2VkIGluIFhFTiBQViBpbnQzIGV4Y2Vw
dGlvbiBlbnRyeSBwYXRoLCB0aGVuIGJlbG93IHBhbmljCnRyaWdnZXJlZDoKClsgICAgMC43NzI4
NzZdIGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdDogMDAwMCBbIzFdIFNNUCBOT1BUSQpbICAgIDAu
NzcyODg2XSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjIuMCsg
IzExClsgICAgMC43NzI4OTNdIFJJUDogZTAzMDppbnQzX21hZ2ljKzB4MC8weDcKWyAgICAwLjc3
MjkwNV0gUlNQOiAzNTA3OmZmZmZmZmZmODIyMDNlOTggRUZMQUdTOiAwMDAwMDI0NgpbICAgIDAu
NzczMzM0XSBDYWxsIFRyYWNlOgpbICAgIDAuNzczMzM0XSAgYWx0ZXJuYXRpdmVfaW5zdHJ1Y3Rp
b25zKzB4M2QvMHgxMmUKWyAgICAwLjc3MzMzNF0gIGNoZWNrX2J1Z3MrMHg3YzkvMHg4ODcKWyAg
ICAwLjc3MzMzNF0gID8gX19nZXRfbG9ja2VkX3B0ZSsweDE3OC8weDFmMApbICAgIDAuNzczMzM0
XSAgc3RhcnRfa2VybmVsKzB4NGZmLzB4NTM1ClsgICAgMC43NzMzMzRdICA/IHNldF9pbml0X2Fy
ZysweDU1LzB4NTUKWyAgICAwLjc3MzMzNF0gIHhlbl9zdGFydF9rZXJuZWwrMHg1NzEvMHg1N2EK
CkFzIHhlbmludDMgYW5kIGludDMgZW50cnkgY29kZSBhcmUgc2FtZSBleGNlcHQgeGVuaW50MyBk
b2Vzbid0IGdlbmVyYXRlCmEgZ2FwLCB3ZSBjYW4gZml4IGl0IGJ5IHVzaW5nIGludDMgYW5kIGRy
b3AgdXNlbGVzcyB4ZW5pbnQzLgoKU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56
aG9uZy5kdWFuQG9yYWNsZS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNr
eUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogQW5keSBMdXRvbWly
c2tpIDxsdXRvQGtlcm5lbC5vcmc+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVh
ZC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEluZ28g
TW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjgu
ZGU+Ci0tLQogdjI6IGZpeCB1cCBkZXNjcmlwdGlvbi4KLS0tCiBhcmNoL3g4Ni9lbnRyeS9lbnRy
eV82NC5TICAgIHwgMSAtCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90cmFwcy5oIHwgMiArLQogYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdi5jICB8IDIgKy0KIGFyY2gveDg2L3hlbi94ZW4tYXNtXzY0
LlMgICAgfCAxIC0KIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlMgYi9hcmNoL3g4Ni9l
bnRyeS9lbnRyeV82NC5TCmluZGV4IDBlYTQ4MzEuLjM1YTY2ZmMgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2VudHJ5L2VudHJ5XzY0LlMKKysrIGIvYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUwpAQCAt
MTE3Niw3ICsxMTc2LDYgQEAgaWR0ZW50cnkgc3RhY2tfc2VnbWVudAkJZG9fc3RhY2tfc2VnbWVu
dAloYXNfZXJyb3JfY29kZT0xCiAjaWZkZWYgQ09ORklHX1hFTl9QVgogaWR0ZW50cnkgeGVubm1p
CQkJZG9fbm1pCQkJaGFzX2Vycm9yX2NvZGU9MAogaWR0ZW50cnkgeGVuZGVidWcJCWRvX2RlYnVn
CQloYXNfZXJyb3JfY29kZT0wCi1pZHRlbnRyeSB4ZW5pbnQzCQlkb19pbnQzCQkJaGFzX2Vycm9y
X2NvZGU9MAogI2VuZGlmCiAKIGlkdGVudHJ5IGdlbmVyYWxfcHJvdGVjdGlvbglkb19nZW5lcmFs
X3Byb3RlY3Rpb24JaGFzX2Vycm9yX2NvZGU9MQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20vdHJhcHMuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RyYXBzLmgKaW5kZXggN2Q2ZjNm
My4uZjJiZDI4NCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdHJhcHMuaAorKysg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90cmFwcy5oCkBAIC00MCw3ICs0MCw3IEBACiBhc21saW5r
YWdlIHZvaWQgeGVuX2RpdmlkZV9lcnJvcih2b2lkKTsKIGFzbWxpbmthZ2Ugdm9pZCB4ZW5feGVu
bm1pKHZvaWQpOwogYXNtbGlua2FnZSB2b2lkIHhlbl94ZW5kZWJ1Zyh2b2lkKTsKLWFzbWxpbmth
Z2Ugdm9pZCB4ZW5feGVuaW50Myh2b2lkKTsKK2FzbWxpbmthZ2Ugdm9pZCB4ZW5faW50Myh2b2lk
KTsKIGFzbWxpbmthZ2Ugdm9pZCB4ZW5fb3ZlcmZsb3codm9pZCk7CiBhc21saW5rYWdlIHZvaWQg
eGVuX2JvdW5kcyh2b2lkKTsKIGFzbWxpbmthZ2Ugdm9pZCB4ZW5faW52YWxpZF9vcCh2b2lkKTsK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHYuYwppbmRleCA0NzIyYmEyLi4yMTM4ZDY5IDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni94ZW4vZW5saWdodGVuX3B2LmMKKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCkBA
IC01OTYsNyArNTk2LDcgQEAgc3RydWN0IHRyYXBfYXJyYXlfZW50cnkgewogCiBzdGF0aWMgc3Ry
dWN0IHRyYXBfYXJyYXlfZW50cnkgdHJhcF9hcnJheVtdID0gewogCXsgZGVidWcsICAgICAgICAg
ICAgICAgICAgICAgICB4ZW5feGVuZGVidWcsICAgICAgICAgICAgICAgICAgICB0cnVlIH0sCi0J
eyBpbnQzLCAgICAgICAgICAgICAgICAgICAgICAgIHhlbl94ZW5pbnQzLCAgICAgICAgICAgICAg
ICAgICAgIHRydWUgfSwKKwl7IGludDMsICAgICAgICAgICAgICAgICAgICAgICAgeGVuX2ludDMs
ICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSB9LAogCXsgZG91YmxlX2ZhdWx0LCAgICAgICAg
ICAgICAgICB4ZW5fZG91YmxlX2ZhdWx0LCAgICAgICAgICAgICAgICB0cnVlIH0sCiAjaWZkZWYg
Q09ORklHX1g4Nl9NQ0UKIAl7IG1hY2hpbmVfY2hlY2ssICAgICAgICAgICAgICAgeGVuX21hY2hp
bmVfY2hlY2ssICAgICAgICAgICAgICAgdHJ1ZSB9LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVu
L3hlbi1hc21fNjQuUyBiL2FyY2gveDg2L3hlbi94ZW4tYXNtXzY0LlMKaW5kZXggMWU5ZWYwYi4u
ZWJmNjEwYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL3hlbi1hc21fNjQuUworKysgYi9hcmNo
L3g4Ni94ZW4veGVuLWFzbV82NC5TCkBAIC0zMiw3ICszMiw2IEBAIHhlbl9wdl90cmFwIGRpdmlk
ZV9lcnJvcgogeGVuX3B2X3RyYXAgZGVidWcKIHhlbl9wdl90cmFwIHhlbmRlYnVnCiB4ZW5fcHZf
dHJhcCBpbnQzCi14ZW5fcHZfdHJhcCB4ZW5pbnQzCiB4ZW5fcHZfdHJhcCB4ZW5ubWkKIHhlbl9w
dl90cmFwIG92ZXJmbG93CiB4ZW5fcHZfdHJhcCBib3VuZHMKLS0gCjEuOC4zLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
