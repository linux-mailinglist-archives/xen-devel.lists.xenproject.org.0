Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0EF66C26
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 14:08:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hluHt-0002z7-KX; Fri, 12 Jul 2019 12:04:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hluHr-0002yh-HR
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 12:04:27 +0000
X-Inumbo-ID: 30f86b7a-a49d-11e9-b077-47b9931d4c93
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30f86b7a-a49d-11e9-b077-47b9931d4c93;
 Fri, 12 Jul 2019 12:04:25 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC408T193538;
 Fri, 12 Jul 2019 12:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=cmT+Q26he6loqTunuFKBeKHkRTXIORCg1WJGoyTRd0U=;
 b=dT0B4osZgrJIBjgIG/p8aeYQD6xxSoEnCYjXXaYuYzsGKOv4LR1wp93zJyKSTmygCSTp
 ph73BeOol2YBxWwyvpj38coMoLYOI+cVJZrxfQcWnXol4g5Vhre3eD85sxsxSsoGSu8A
 GJlrREG2eNQDebVAVAHPGheUGv+XBUlucOwWsZCOAbN+RHXjk9TmN9CvX2cWeQPUQsEn
 RJgYIgohkM4CapajncSQK6g2hxYctkZhY4fKZr9JCIM1Tpk168u7sPAV+RrMBo8f9pEO
 9GNJkT2qcB28xgvOK9MKeZmQ5vuPv4YMYiGZiobxNe+0h25W7NyK7Zdryc7tcYbX1m7L VA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2tjk2u5af6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:04:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC3Qgd095638;
 Fri, 12 Jul 2019 12:04:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2tpefd290c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:04:09 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6CC4849020751;
 Fri, 12 Jul 2019 12:04:08 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 04:58:39 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jul 2019 20:02:11 +0800
Message-Id: <1562846532-32152-5-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v7 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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

Li4gYXMgIm5vcHYiIHN1cHBvcnQgbmVlZHMgaXQgdG8gYmUgY2hhbmdlYWJsZSBhdCBib290IHVw
IHN0YWdlLgoKQ2hlY2twYXRjaCByZXBvcnQgd2FybmluZywgc28gbW92ZSB2YXJpYWJsZSBkZWNs
YXJhdGlvbnMgZnJvbQpoeXBlcnZpc29yLmMgdG8gaHlwZXJ2aXNvci5oCgpTaWduZWQtb2ZmLWJ5
OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KQ2M6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEluZ28g
TW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjgu
ZGU+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oIHwgOCArKysrKysrKwog
YXJjaC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMgIHwgOCAtLS0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vaHlw
ZXJ2aXNvci5oCmluZGV4IGY3YjRjNTMuLmU0MWNiZjIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2h5cGVydmlzb3IuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZp
c29yLmgKQEAgLTU4LDYgKzU4LDE0IEBAIHN0cnVjdCBoeXBlcnZpc29yX3g4NiB7CiAJYm9vbCBp
Z25vcmVfbm9wdjsKIH07CiAKK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2
X2h5cGVyX3Ztd2FyZTsKK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5
cGVyX21zX2h5cGVydjsKK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5
cGVyX3hlbl9wdjsKK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVy
X2t2bTsKK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX2phaWxo
b3VzZTsKK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX2Fjcm47
CitleHRlcm4gc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtOworCiBleHRl
cm4gYm9vbCBub3B2OwogZXh0ZXJuIGVudW0geDg2X2h5cGVydmlzb3JfdHlwZSB4ODZfaHlwZXJf
dHlwZTsKIGV4dGVybiB2b2lkIGluaXRfaHlwZXJ2aXNvcl9wbGF0Zm9ybSh2b2lkKTsKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jIGIvYXJjaC94ODYva2VybmVs
L2NwdS9oeXBlcnZpc29yLmMKaW5kZXggN2VhYWQ0MS4uNTUzYmZiZiAxMDA2NDQKLS0tIGEvYXJj
aC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMKKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9o
eXBlcnZpc29yLmMKQEAgLTI2LDE0ICsyNiw2IEBACiAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5o
PgogI2luY2x1ZGUgPGFzbS9oeXBlcnZpc29yLmg+CiAKLWV4dGVybiBjb25zdCBzdHJ1Y3QgaHlw
ZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3Ztd2FyZTsKLWV4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl94ODYgeDg2X2h5cGVyX21zX2h5cGVydjsKLWV4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl94ODYgeDg2X2h5cGVyX3hlbl9wdjsKLWV4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl94ODYgeDg2X2h5cGVyX3hlbl9odm07Ci1leHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jf
eDg2IHg4Nl9oeXBlcl9rdm07Ci1leHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4
Nl9oeXBlcl9qYWlsaG91c2U7Ci1leHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4
Nl9oeXBlcl9hY3JuOwotCiBzdGF0aWMgY29uc3QgX19pbml0Y29uc3Qgc3RydWN0IGh5cGVydmlz
b3JfeDg2ICogY29uc3QgaHlwZXJ2aXNvcnNbXSA9CiB7CiAjaWZkZWYgQ09ORklHX1hFTl9QVgot
LSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
