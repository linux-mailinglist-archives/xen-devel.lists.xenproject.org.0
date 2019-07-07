Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB62361C35
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 11:15:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkPgb-0004T7-B5; Mon, 08 Jul 2019 09:11:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IuGq=VF=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hkPgZ-0004Ss-Ss
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 09:11:47 +0000
X-Inumbo-ID: 68fb5f1b-a160-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 68fb5f1b-a160-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 09:11:46 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6899OlR045630;
 Mon, 8 Jul 2019 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=McFjyxa5TN9dJj6AfIiEg6O5IDlY1x1JqP2XAQDDw6g=;
 b=21vUSpkMsAe5ZhtskmJx17cM8H9Mdm4Fge2bNjJJdYI+Cm59Xwk5A3fa3AYHCflRGEa+
 ap5bgNr5INE/wvEiCfNNjXlWdeV6MvUX4VzmwoAQNKqm1P9hQbEsKd94fwGwZiDuOb1I
 O1dr6KclejiemY7eUW9N0rxc8xIKMuDSUj6qjdygrzLkTof76KJVZjZUCJmCrrkpYA3v
 cWBm/KVjkUX3zSLtFIeUjXz9EurM8M1HES9EmeF+0TeBC+Cah9LeKb33tkDhA9S9KUga
 PMru+tRx4twAk1hXT9+H62WVAJzuIr0JmZxmUudVujYsyaANuFX3xIzOIQhvt9Gta1Rz cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2tjkkpd87j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6897t5P110914;
 Mon, 8 Jul 2019 09:11:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2tjkf23d9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:35 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x689BYcS005110;
 Mon, 8 Jul 2019 09:11:34 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 02:11:34 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  7 Jul 2019 17:15:06 +0800
Message-Id: <1562490908-17882-3-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v6 2/4] x86: Add "nopv" parameter to disable PV
 extensions
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
 Jan Kiszka <jan.kiszka@siemens.com>,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdmlydHVhbGl6YXRpb24gZW52aXJvbm1lbnQsIFBWIGV4dGVuc2lvbnMgKGRyaXZlcnMsIGlu
dGVycnVwdHMsCnRpbWVycywgZXRjKSBhcmUgZW5hYmxlZCBpbiB0aGUgbWFqb3JpdHkgb2YgdXNl
IGNhc2VzIHdoaWNoIGlzIHRoZQpiZXN0IG9wdGlvbi4KCkhvd2V2ZXIsIGluIHNvbWUgY2FzZXMg
KGtleGVjIG5vdCBmdWxseSB3b3JraW5nLCBiZW5jaG1hcmtpbmcpCndlIHdhbnQgdG8gZGlzYWJs
ZSBQViBleHRlbnNpb25zLiBXZSBoYXZlICJ4ZW5fbm9wdiIgZm9yIHRoYXQgcHVycG9zZQpidXQg
b25seSBmb3IgWEVOLiBGb3IgYSBjb25zaXN0ZW50IGFkbWluIGV4cGVyaWVuY2UgYSBjb21tb24g
Y29tbWFuZApsaW5lIHBhcmFtZXRlciAibm9wdiIgc2V0IGFjcm9zcyBhbGwgUFYgZ3Vlc3QgaW1w
bGVtZW50YXRpb25zIGlzIGEKYmV0dGVyIGNob2ljZS4KClRoZXJlIGFyZSBndWVzdCB0eXBlcyB3
aGljaCBqdXN0IHdvbid0IHdvcmsgd2l0aG91dCBQViBleHRlbnNpb25zLApsaWtlIFhlbiBQViwg
WGVuIFBWSCBhbmQgamFpbGhvdXNlLiBhZGQgYSAiaWdub3JlX25vcHYiIG1lbWJlciB0bwpzdHJ1
Y3QgaHlwZXJ2aXNvcl94ODYgc2V0IHRvIHRydWUgZm9yIHRob3NlIGd1ZXN0IHR5cGVzIGFuZCBj
YWxsCnRoZSBkZXRlY3QgZnVuY3Rpb25zIG9ubHkgaWYgbm9wdiBpcyBmYWxzZSBvciBpZ25vcmVf
bm9wdiBpcyB0cnVlLgoKU3VnZ2VzdGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+ClNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUu
Y29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29A
cmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgpDYzogSmFuIEtp
c3prYSA8amFuLmtpc3prYUBzaWVtZW5zLmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1l
dGVycy50eHQgfCAgNSArKysrKwogYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oICAg
ICAgICAgICAgICAgfCAgNCArKysrCiBhcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVydmlzb3IuYyAg
ICAgICAgICAgICAgICB8IDExICsrKysrKysrKysrCiBhcmNoL3g4Ni9rZXJuZWwvamFpbGhvdXNl
LmMgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYu
YyAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogNSBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFy
YW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJz
LnR4dAppbmRleCAxMzhmNjY2Li4yMWUwOGFmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAtNTI2OCw2ICs1MjY4LDExIEBACiAJCQlp
bXByb3ZlIHRpbWVyIHJlc29sdXRpb24gYXQgdGhlIGV4cGVuc2Ugb2YgcHJvY2Vzc2luZwogCQkJ
bW9yZSB0aW1lciBpbnRlcnJ1cHRzLgogCisJbm9wdj0JCVtYODYsWEVOLEtWTSxIWVBFUl9WLFZN
V0FSRV0KKwkJCURpc2FibGVzIHRoZSBQViBvcHRpbWl6YXRpb25zIGZvcmNpbmcgdGhlIGd1ZXN0
IHRvIHJ1bgorCQkJYXMgZ2VuZXJpYyBndWVzdCB3aXRoIG5vIFBWIGRyaXZlcnMuIEN1cnJlbnRs
eSBzdXBwb3J0CisJCQlYRU4gSFZNLCBLVk0sIEhZUEVSX1YgYW5kIFZNV0FSRSBndWVzdC4KKwog
CXhpcmMycHNfY3M9CVtORVQsUENNQ0lBXQogCQkJRm9ybWF0OgogCQkJPGlycT4sPGlycV9tYXNr
Piw8aW8+LDxmdWxsX2R1cGxleD4sPGRvX3NvdW5kPiw8bG9ja3VwX2hhY2s+Wyw8aXJxMj5bLDxp
cnEzPlssPGlycTQ+XV1dCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZp
c29yLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmgKaW5kZXggOGM1YWFiYS4u
MDAyNDBiMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaApAQCAtNTIsOCArNTIsMTIgQEAg
c3RydWN0IGh5cGVydmlzb3JfeDg2IHsKIAogCS8qIHJ1bnRpbWUgY2FsbGJhY2tzICovCiAJc3Ry
dWN0IHg4Nl9oeXBlcl9ydW50aW1lIHJ1bnRpbWU7CisKKwkvKiBpZ25vcmUgbm9wdiBwYXJhbWV0
ZXIgKi8KKwlib29sIGlnbm9yZV9ub3B2OwogfTsKIAorZXh0ZXJuIGJvb2wgbm9wdjsKIGV4dGVy
biBlbnVtIHg4Nl9oeXBlcnZpc29yX3R5cGUgeDg2X2h5cGVyX3R5cGU7CiBleHRlcm4gdm9pZCBp
bml0X2h5cGVydmlzb3JfcGxhdGZvcm0odm9pZCk7CiBzdGF0aWMgaW5saW5lIGJvb2wgaHlwZXJ2
aXNvcl9pc190eXBlKGVudW0geDg2X2h5cGVydmlzb3JfdHlwZSB0eXBlKQpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2h5
cGVydmlzb3IuYwppbmRleCA0NzljYTQ3Li4zMzdmZjA3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
ZXJuZWwvY3B1L2h5cGVydmlzb3IuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVydmlz
b3IuYwpAQCAtNTQsNiArNTQsMTQgQEAKIGVudW0geDg2X2h5cGVydmlzb3JfdHlwZSB4ODZfaHlw
ZXJfdHlwZTsKIEVYUE9SVF9TWU1CT0woeDg2X2h5cGVyX3R5cGUpOwogCitib29sIF9faW5pdGRh
dGEgbm9wdjsKK3N0YXRpYyBfX2luaXQgaW50IHBhcnNlX25vcHYoY2hhciAqYXJnKQoreworCW5v
cHYgPSB0cnVlOworCXJldHVybiAwOworfQorZWFybHlfcGFyYW0oIm5vcHYiLCBwYXJzZV9ub3B2
KTsKKwogc3RhdGljIGlubGluZSBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgKiBfX2luaXQK
IGRldGVjdF9oeXBlcnZpc29yX3ZlbmRvcih2b2lkKQogewpAQCAtNjEsNiArNjksOSBAQAogCXVp
bnQzMl90IHByaSwgbWF4X3ByaSA9IDA7CiAKIAlmb3IgKHAgPSBoeXBlcnZpc29yczsgcCA8IGh5
cGVydmlzb3JzICsgQVJSQVlfU0laRShoeXBlcnZpc29ycyk7IHArKykgeworCQlpZiAodW5saWtl
bHkobm9wdikgJiYgISgqcCktPmlnbm9yZV9ub3B2KQorCQkJY29udGludWU7CisKIAkJcHJpID0g
KCpwKS0+ZGV0ZWN0KCk7CiAJCWlmIChwcmkgPiBtYXhfcHJpKSB7CiAJCQltYXhfcHJpID0gcHJp
OwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2phaWxob3VzZS5jIGIvYXJjaC94ODYva2Vy
bmVsL2phaWxob3VzZS5jCmluZGV4IDFiMmVlNTUuLmM1MmM0MTA1IDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rZXJuZWwvamFpbGhvdXNlLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2phaWxob3VzZS5j
CkBAIC0yMTcsNCArMjE3LDUgQEAgc3RhdGljIGJvb2wgamFpbGhvdXNlX3gyYXBpY19hdmFpbGFi
bGUodm9pZCkKIAkuZGV0ZWN0CQkJPSBqYWlsaG91c2VfZGV0ZWN0LAogCS5pbml0LmluaXRfcGxh
dGZvcm0JPSBqYWlsaG91c2VfaW5pdF9wbGF0Zm9ybSwKIAkuaW5pdC54MmFwaWNfYXZhaWxhYmxl
CT0gamFpbGhvdXNlX3gyYXBpY19hdmFpbGFibGUsCisJLmlnbm9yZV9ub3B2CQk9IHRydWUsCiB9
OwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9wdi5jCmluZGV4IDQ3MjJiYTIuLjVkMTY4MjQgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMK
QEAgLTE0NjMsNCArMTQ2Myw1IEBAIHN0YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3Jt
X3B2KHZvaWQpCiAJLmRldGVjdCAgICAgICAgICAgICAgICAgPSB4ZW5fcGxhdGZvcm1fcHYsCiAJ
LnR5cGUJCQk9IFg4Nl9IWVBFUl9YRU5fUFYsCiAJLnJ1bnRpbWUucGluX3ZjcHUgICAgICAgPSB4
ZW5fcGluX3ZjcHUsCisJLmlnbm9yZV9ub3B2CQk9IHRydWUsCiB9OwotLSAKMS44LjMuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
