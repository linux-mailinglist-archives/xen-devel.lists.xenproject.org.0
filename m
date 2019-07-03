Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F85F0F0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 03:21:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiqOB-0000sF-0L; Thu, 04 Jul 2019 01:18:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMc9=VB=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiqO9-0000rs-DA
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 01:18:17 +0000
X-Inumbo-ID: 9990df5f-9df9-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9990df5f-9df9-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 01:18:16 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641EI3V123328;
 Thu, 4 Jul 2019 01:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=McFjyxa5TN9dJj6AfIiEg6O5IDlY1x1JqP2XAQDDw6g=;
 b=qo6dcN+40a12F1kR8Pc1IkBdJPcYwDKknnPIgKtfiuGmzU2p2K4Eb4f0jTfVz0CUj0rS
 PC7utQ/o4BYKSi9UT/+e0CKeU6YvyzbepTAq8Y7yJ2ugbY5nVGiVGm7c8TV00jbv4TqO
 W3opOcMFJ0FKsCHT9yEsAqA/McoHGo5EXfJfkCzy1JaMPrVE+NldLKFjfWdAVGWw4CSa
 l2ydnTTst7Jr9A3fPc5OzQDTjNnDrl6HA8n2sd+9mOVT5jOiTAZftVkJNT0igsHC9rTS
 RO1re2EaseC+2n3tHWG0ry9aJ7+YS7k7Sz5ttwe97z06wSQLYlaPbsJbPZ/8kljOjz28 UA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2te5tbv6wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:18:05 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641CZXK089761;
 Thu, 4 Jul 2019 01:16:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2tebkv5td0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:16:04 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x641G2u7032301;
 Thu, 4 Jul 2019 01:16:02 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 03 Jul 2019 18:16:02 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jul 2019 09:19:36 +0800
Message-Id: <1562116778-5846-3-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562116778-5846-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1562116778-5846-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9307
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907040013
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9307
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907040014
Subject: [Xen-devel] [PATCH v5 2/4] x86: Add "nopv" parameter to disable PV
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
