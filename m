Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483366C1A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 14:08:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hluHr-0002ya-CY; Fri, 12 Jul 2019 12:04:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hluHq-0002yU-5J
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 12:04:26 +0000
X-Inumbo-ID: 30dcc6f5-a49d-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30dcc6f5-a49d-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 12:04:25 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC3mBq093615;
 Fri, 12 Jul 2019 12:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=7mSXW1AaKAj4lnksyNN8rOaqG9NBDQLiPAqjKyUrhew=;
 b=bh2AHFVKZnF9quE+D6y7wuHOHN5HvcKGkaq/HIvfD1KJzd8EVfZmeNZ9qYg8RLoHmYh0
 brWSLT88B0DzNpJOVjmznqnRD0JLPgx8imnK9lV+Wd3mPSljN7ALCraV11zaOdwhJ9mY
 8vgxPZMQl2M7OBkgcBtlr1gbEUj9VbBSCf/We2VadT9yyjXYYbOtDY9kNvFKxHwdP5qb
 GbkJpZQSPtjFmjLXT9ExJIoiadw5gwowzQXukD37a3CAl8PdMuxIM4c0i/Gj0W8exTg3
 g7kom/njDSVkGww/Wu5upIJqyZFUnBGraaDJ+wHnsgar3WFfy5K2PvBF4zAOzkRpbQnn Lw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2tjkkq572n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:04:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC3TgJ175345;
 Fri, 12 Jul 2019 12:04:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2tmwgyr39k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:04:07 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6CC461N020739;
 Fri, 12 Jul 2019 12:04:06 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 04:58:34 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jul 2019 20:02:09 +0800
Message-Id: <1562846532-32152-3-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120132
Subject: [Xen-devel] [PATCH v7 2/5] x86: Add "nopv" parameter to disable PV
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
LnR4dAppbmRleCBmMWM0MzNkLi5kYmZlOWMyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAtNTI3MSw2ICs1MjcxLDExIEBACiAJCQlp
bXByb3ZlIHRpbWVyIHJlc29sdXRpb24gYXQgdGhlIGV4cGVuc2Ugb2YgcHJvY2Vzc2luZwogCQkJ
bW9yZSB0aW1lciBpbnRlcnJ1cHRzLgogCisJbm9wdj0JCVtYODYsWEVOLEtWTSxIWVBFUl9WLFZN
V0FSRV0KKwkJCURpc2FibGVzIHRoZSBQViBvcHRpbWl6YXRpb25zIGZvcmNpbmcgdGhlIGd1ZXN0
IHRvIHJ1bgorCQkJYXMgZ2VuZXJpYyBndWVzdCB3aXRoIG5vIFBWIGRyaXZlcnMuIEN1cnJlbnRs
eSBzdXBwb3J0CisJCQlYRU4gSFZNLCBLVk0sIEhZUEVSX1YgYW5kIFZNV0FSRSBndWVzdC4KKwog
CXhpcmMycHNfY3M9CVtORVQsUENNQ0lBXQogCQkJRm9ybWF0OgogCQkJPGlycT4sPGlycV9tYXNr
Piw8aW8+LDxmdWxsX2R1cGxleD4sPGRvX3NvdW5kPiw8bG9ja3VwX2hhY2s+Wyw8aXJxMj5bLDxp
cnEzPlssPGlycTQ+XV1dCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZp
c29yLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmgKaW5kZXggNTBhMzBmNi4u
ZjdiNGM1MyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oCisr
KyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaApAQCAtNTMsOCArNTMsMTIgQEAg
c3RydWN0IGh5cGVydmlzb3JfeDg2IHsKIAogCS8qIHJ1bnRpbWUgY2FsbGJhY2tzICovCiAJc3Ry
dWN0IHg4Nl9oeXBlcl9ydW50aW1lIHJ1bnRpbWU7CisKKwkvKiBpZ25vcmUgbm9wdiBwYXJhbWV0
ZXIgKi8KKwlib29sIGlnbm9yZV9ub3B2OwogfTsKIAorZXh0ZXJuIGJvb2wgbm9wdjsKIGV4dGVy
biBlbnVtIHg4Nl9oeXBlcnZpc29yX3R5cGUgeDg2X2h5cGVyX3R5cGU7CiBleHRlcm4gdm9pZCBp
bml0X2h5cGVydmlzb3JfcGxhdGZvcm0odm9pZCk7CiBzdGF0aWMgaW5saW5lIGJvb2wgaHlwZXJ2
aXNvcl9pc190eXBlKGVudW0geDg2X2h5cGVydmlzb3JfdHlwZSB0eXBlKQpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2h5
cGVydmlzb3IuYwppbmRleCA4N2UzOWFkLi43ZWFhZDQxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
ZXJuZWwvY3B1L2h5cGVydmlzb3IuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVydmlz
b3IuYwpAQCAtNTgsNiArNTgsMTQgQEAKIGVudW0geDg2X2h5cGVydmlzb3JfdHlwZSB4ODZfaHlw
ZXJfdHlwZTsKIEVYUE9SVF9TWU1CT0woeDg2X2h5cGVyX3R5cGUpOwogCitib29sIF9faW5pdGRh
dGEgbm9wdjsKK3N0YXRpYyBfX2luaXQgaW50IHBhcnNlX25vcHYoY2hhciAqYXJnKQoreworCW5v
cHYgPSB0cnVlOworCXJldHVybiAwOworfQorZWFybHlfcGFyYW0oIm5vcHYiLCBwYXJzZV9ub3B2
KTsKKwogc3RhdGljIGlubGluZSBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgKiBfX2luaXQK
IGRldGVjdF9oeXBlcnZpc29yX3ZlbmRvcih2b2lkKQogewpAQCAtNjUsNiArNzMsOSBAQAogCXVp
bnQzMl90IHByaSwgbWF4X3ByaSA9IDA7CiAKIAlmb3IgKHAgPSBoeXBlcnZpc29yczsgcCA8IGh5
cGVydmlzb3JzICsgQVJSQVlfU0laRShoeXBlcnZpc29ycyk7IHArKykgeworCQlpZiAodW5saWtl
bHkobm9wdikgJiYgISgqcCktPmlnbm9yZV9ub3B2KQorCQkJY29udGludWU7CisKIAkJcHJpID0g
KCpwKS0+ZGV0ZWN0KCk7CiAJCWlmIChwcmkgPiBtYXhfcHJpKSB7CiAJCQltYXhfcHJpID0gcHJp
OwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2phaWxob3VzZS5jIGIvYXJjaC94ODYva2Vy
bmVsL2phaWxob3VzZS5jCmluZGV4IDY4NTdiNDUuLjNhZDM0ZjAgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2tlcm5lbC9qYWlsaG91c2UuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvamFpbGhvdXNlLmMK
QEAgLTIxNyw0ICsyMTcsNSBAQCBzdGF0aWMgYm9vbCBfX2luaXQgamFpbGhvdXNlX3gyYXBpY19h
dmFpbGFibGUodm9pZCkKIAkuZGV0ZWN0CQkJPSBqYWlsaG91c2VfZGV0ZWN0LAogCS5pbml0Lmlu
aXRfcGxhdGZvcm0JPSBqYWlsaG91c2VfaW5pdF9wbGF0Zm9ybSwKIAkuaW5pdC54MmFwaWNfYXZh
aWxhYmxlCT0gamFpbGhvdXNlX3gyYXBpY19hdmFpbGFibGUsCisJLmlnbm9yZV9ub3B2CQk9IHRy
dWUsCiB9OwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jIGIvYXJjaC94
ODYveGVuL2VubGlnaHRlbl9wdi5jCmluZGV4IDQ3MjJiYTIuLjVkMTY4MjQgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVu
X3B2LmMKQEAgLTE0NjMsNCArMTQ2Myw1IEBAIHN0YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3Bs
YXRmb3JtX3B2KHZvaWQpCiAJLmRldGVjdCAgICAgICAgICAgICAgICAgPSB4ZW5fcGxhdGZvcm1f
cHYsCiAJLnR5cGUJCQk9IFg4Nl9IWVBFUl9YRU5fUFYsCiAJLnJ1bnRpbWUucGluX3ZjcHUgICAg
ICAgPSB4ZW5fcGluX3ZjcHUsCisJLmlnbm9yZV9ub3B2CQk9IHRydWUsCiB9OwotLSAKMS44LjMu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
