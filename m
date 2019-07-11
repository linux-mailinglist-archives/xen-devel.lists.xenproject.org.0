Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC54665E2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 06:47:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlnPc-0006Kr-7Z; Fri, 12 Jul 2019 04:44:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hlnPa-0006Km-Ve
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 04:43:59 +0000
X-Inumbo-ID: a8de8c81-a45f-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a8de8c81-a45f-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 04:43:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C4dH4j056602;
 Fri, 12 Jul 2019 04:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=uw9ARe8x7QtRm6OOT1c/IbRl5bsJpRHqHU8DP7hvV60=;
 b=pQPEW7Dx4el+JBLPt8X5lkuRVGTKaPyBnwXZoCQOAJekYwf8Y7K3H1fIMkpvvELMZmuA
 Li1Ucgf0pXYPFe92BXDYi+6ztpdw5dbxpOnFCTIKkXiqP/bQpTzS3sbx+/7+S2yWfPBO
 o/o3yFhFXl8262oWh/I04NkRq4MluTsLOIQyXkKiHaBCso8scqH52BBz4hgipWQ4Xd4+
 RkDrSj2dPUEoMfzb53xFUmHuyGmc8CGhBZu68mYfr2r1cMxbjYpsa/8U0M0r+dogTrxZ
 lYQzmPH/+YWoWRqkz+tYCgoub1bWlFFFnoWQPgztequYVPW4o1tAWaCRRqh1v3Md+ykQ zQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2tjm9r3d9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 04:43:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C4gWQZ162744;
 Fri, 12 Jul 2019 04:43:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2tpefcvn8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 04:43:34 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6C4hUXJ012299;
 Fri, 12 Jul 2019 04:43:32 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 11 Jul 2019 21:43:30 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jul 2019 12:47:18 +0800
Message-Id: <1562820438-30328-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120047
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120046
Subject: [Xen-devel] [PATCH] xen/pv: Fix a boot up hang triggered by int3
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
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDc0NTdjMGRhMDI0YiAoIng4Ni9hbHRlcm5hdGl2ZXM6IEFkZCBpbnQzX2VtdWxhdGVf
Y2FsbCgpCnNlbGZ0ZXN0IikgcmV2ZWFscyBhIGJ1ZyBpbiBYRU4gUFYgaW50MyBhc3NlbWJsZSBj
b2RlLiBUaGVyZSBpcwphIGRvdWJsZSBwb3Agb2YgcmVnaXN0ZXIgUjExIGFuZCBSQ1ggY3VycnVw
dGluZyB0aGUgZXhjZXB0aW9uCmZyYW1lLCBvbmUgaW4geGVuX2ludDMgYW5kIHRoZSBvdGhlciBp
biB4ZW5feGVuaW50My4KCldlIHNlZSBiZWxvdyBoYW5nIGF0IGJvb3R1cDoKCmdlbmVyYWwgcHJv
dGVjdGlvbiBmYXVsdDogMDAwMCBbIzFdIFNNUCBOT1BUSQpDUFU6IDAgUElEOiAwIENvbW06IHN3
YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjIuMCsgIzYKUklQOiBlMDMwOmludDNfbWFnaWMrMHgwLzB4
NwpDYWxsIFRyYWNlOgogYWx0ZXJuYXRpdmVfaW5zdHJ1Y3Rpb25zKzB4M2QvMHgxMmUKIGNoZWNr
X2J1Z3MrMHg3YzkvMHg4ODcKID9fX2dldF9sb2NrZWRfcHRlKzB4MTc4LzB4MWYwCiBzdGFydF9r
ZXJuZWwrMHg0ZmYvMHg1MzUKID9zZXRfaW5pdF9hcmcrMHg1NS8weDU1CiB4ZW5fc3RhcnRfa2Vy
bmVsKzB4NTcxLzB4NTdhCgpGaXggaXQgYnkgcmVtb3ZpbmcgeGVuX3hlbmludDMuCgpTaWduZWQt
b2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KQ2M6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+CkNj
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxt
aW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+Ci0tLQog
YXJjaC94ODYvaW5jbHVkZS9hc20vdHJhcHMuaCB8IDIgKy0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0
ZW5fcHYuYyAgfCAyICstCiBhcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TICAgIHwgMSAtCiAzIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90cmFwcy5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdHJh
cHMuaAppbmRleCA3ZDZmM2YzLi5mMmJkMjg0IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS90cmFwcy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RyYXBzLmgKQEAgLTQwLDcg
KzQwLDcgQEAKIGFzbWxpbmthZ2Ugdm9pZCB4ZW5fZGl2aWRlX2Vycm9yKHZvaWQpOwogYXNtbGlu
a2FnZSB2b2lkIHhlbl94ZW5ubWkodm9pZCk7CiBhc21saW5rYWdlIHZvaWQgeGVuX3hlbmRlYnVn
KHZvaWQpOwotYXNtbGlua2FnZSB2b2lkIHhlbl94ZW5pbnQzKHZvaWQpOworYXNtbGlua2FnZSB2
b2lkIHhlbl9pbnQzKHZvaWQpOwogYXNtbGlua2FnZSB2b2lkIHhlbl9vdmVyZmxvdyh2b2lkKTsK
IGFzbWxpbmthZ2Ugdm9pZCB4ZW5fYm91bmRzKHZvaWQpOwogYXNtbGlua2FnZSB2b2lkIHhlbl9p
bnZhbGlkX29wKHZvaWQpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5j
IGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCmluZGV4IDQ3MjJiYTIuLjIxMzhkNjkgMTAw
NjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYworKysgYi9hcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX3B2LmMKQEAgLTU5Niw3ICs1OTYsNyBAQCBzdHJ1Y3QgdHJhcF9hcnJheV9lbnRy
eSB7CiAKIHN0YXRpYyBzdHJ1Y3QgdHJhcF9hcnJheV9lbnRyeSB0cmFwX2FycmF5W10gPSB7CiAJ
eyBkZWJ1ZywgICAgICAgICAgICAgICAgICAgICAgIHhlbl94ZW5kZWJ1ZywgICAgICAgICAgICAg
ICAgICAgIHRydWUgfSwKLQl7IGludDMsICAgICAgICAgICAgICAgICAgICAgICAgeGVuX3hlbmlu
dDMsICAgICAgICAgICAgICAgICAgICAgdHJ1ZSB9LAorCXsgaW50MywgICAgICAgICAgICAgICAg
ICAgICAgICB4ZW5faW50MywgICAgICAgICAgICAgICAgICAgICAgICB0cnVlIH0sCiAJeyBkb3Vi
bGVfZmF1bHQsICAgICAgICAgICAgICAgIHhlbl9kb3VibGVfZmF1bHQsICAgICAgICAgICAgICAg
IHRydWUgfSwKICNpZmRlZiBDT05GSUdfWDg2X01DRQogCXsgbWFjaGluZV9jaGVjaywgICAgICAg
ICAgICAgICB4ZW5fbWFjaGluZV9jaGVjaywgICAgICAgICAgICAgICB0cnVlIH0sCmRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni94ZW4veGVuLWFzbV82NC5TIGIvYXJjaC94ODYveGVuL3hlbi1hc21fNjQu
UwppbmRleCAxZTllZjBiLi5lYmY2MTBiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94ZW4veGVuLWFz
bV82NC5TCisrKyBiL2FyY2gveDg2L3hlbi94ZW4tYXNtXzY0LlMKQEAgLTMyLDcgKzMyLDYgQEAg
eGVuX3B2X3RyYXAgZGl2aWRlX2Vycm9yCiB4ZW5fcHZfdHJhcCBkZWJ1ZwogeGVuX3B2X3RyYXAg
eGVuZGVidWcKIHhlbl9wdl90cmFwIGludDMKLXhlbl9wdl90cmFwIHhlbmludDMKIHhlbl9wdl90
cmFwIHhlbm5taQogeGVuX3B2X3RyYXAgb3ZlcmZsb3cKIHhlbl9wdl90cmFwIGJvdW5kcwotLSAK
MS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
