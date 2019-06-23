Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC150B55
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 15:02:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfOYQ-0006Wn-Jm; Mon, 24 Jun 2019 12:58:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OLIz=UX=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hfOYP-0006Wi-DR
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 12:58:37 +0000
X-Inumbo-ID: c5ccc312-967f-11e9-8fbf-830508511844
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5ccc312-967f-11e9-8fbf-830508511844;
 Mon, 24 Jun 2019 12:58:33 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCsGs3142975;
 Mon, 24 Jun 2019 12:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=KLBclTheGjubyUpbAx+QHqK/8lekhX1YiHOk2x91wZU=;
 b=LyMN2+S4uJvGq8XmNHJVvnpR67iAGd3vC6p4NbKp3UGqqh4hnJ9n8WxpSKKmi4Jq8JWn
 vo8c0Il2jxhJWGEvd9ahOI+n4i2himzhdZR4vvA2N/aDN0CqcyDLMII1wgbKEvvm5A/P
 Zm3lD6r1Gzixk0z+MBa7gZWBtxhw05yVJgoYZBEETB2c+RnkUQ5LfS95bmEd/U9tTXHG
 q60lAks2RT9jdaavL6NcYWtwKXbVxTs95p5DBu7Aq/dLJwxj7e/imHCpHNXsiduY+B1J
 HtFLAFK4xvdKTw5CCwv6wsjcnxfP4Gd7hBPb70KhOrNxKahyU28PKMzhUq9unFMU5nMV Jg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t9cyq66qa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 12:58:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCwBQl108078;
 Mon, 24 Jun 2019 12:58:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2t9p6tjnhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 12:58:19 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5OCwHri010630;
 Mon, 24 Jun 2019 12:58:17 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 05:58:16 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 23 Jun 2019 21:01:40 +0800
Message-Id: <1561294903-6166-3-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561294903-6166-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1561294903-6166-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240105
Subject: [Xen-devel] [PATCH 3/6] x86: Add nopv parameter to disable PV
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
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@kernel.org, bp@alien8.de,
 hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gdmlydHVhbGl6YXRpb24gZW52aXJvbm1lbnQsIFBWIGV4dGVuc2lvbnMgKGRyaXZlcnMsIGlu
dGVycnVwdHMsCnRpbWVycywgZXRjKSBhcmUgZW5hYmxlZCBpbiB0aGUgbWFqb3JpdHkgb2YgdXNl
IGNhc2VzIHdoaWNoIGlzIHRoZQpiZXN0IG9wdGlvbi4KCkhvd2V2ZXIsIGluIHNvbWUgY2FzZXMg
KGtleGVjIG5vdCBmdWxseSB3b3JraW5nLCBiZW5jaG1hcmtpbmcpCndlIHdhbnQgdG8gZGlzYWJs
ZSBQViBleHRlbnNpb25zLiBBcyBzdWNoIGludHJvZHVjZSB0aGUKJ25vcHYnIHBhcmFtZXRlciB0
aGF0IHdpbGwgZG8gaXQuCgpUaGVyZSBpcyBhbHJlYWR5ICd4ZW5fbm9wdicgcGFyYW1ldGVyIGZv
ciBYRU4gcGxhdGZvcm0gYnV0IG5vdCBmb3IKb3RoZXJzLiAneGVuX25vcHYnIGNhbiB0aGVuIGJl
IHJlbW92ZWQgd2l0aCB0aGlzIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFu
IDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCi0tLQogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQgfCAgNCArKysrCiBhcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVydmlzb3IuYyAgICAgICAgICAg
ICAgICB8IDExICsrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJz
LnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cmlu
ZGV4IDEzOGY2NjYuLmIzNTJmMzYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CisrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
a2VybmVsLXBhcmFtZXRlcnMudHh0CkBAIC01MjY4LDYgKzUyNjgsMTAgQEAKIAkJCWltcHJvdmUg
dGltZXIgcmVzb2x1dGlvbiBhdCB0aGUgZXhwZW5zZSBvZiBwcm9jZXNzaW5nCiAJCQltb3JlIHRp
bWVyIGludGVycnVwdHMuCiAKKwlub3B2PQkJW1g4Nl0KKwkJCURpc2FibGVzIHRoZSBQViBvcHRp
bWl6YXRpb25zIGZvcmNpbmcgdGhlIGd1ZXN0IHRvIHJ1bgorCQkJYXMgZ2VuZXJpYyBndWVzdCB3
aXRoIG5vIFBWIGRyaXZlcnMuCisKIAl4aXJjMnBzX2NzPQlbTkVULFBDTUNJQV0KIAkJCUZvcm1h
dDoKIAkJCTxpcnE+LDxpcnFfbWFzaz4sPGlvPiw8ZnVsbF9kdXBsZXg+LDxkb19zb3VuZD4sPGxv
Y2t1cF9oYWNrPlssPGlycTI+Wyw8aXJxMz5bLDxpcnE0Pl1dXQpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVydmlz
b3IuYwppbmRleCA0NzljYTQ3Li40ZjJjODc1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwv
Y3B1L2h5cGVydmlzb3IuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L2h5cGVydmlzb3IuYwpA
QCAtODUsMTAgKzg1LDIxIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjb3B5X2FycmF5KGNvbnN0IHZv
aWQgKnNyYywgdm9pZCAqdGFyZ2V0LCB1bnNpZ25lZCBpbnQgc2l6ZSkKIAkJCXRvW2ldID0gZnJv
bVtpXTsKIH0KIAorc3RhdGljIGJvb2wgbm9wdjsKK3N0YXRpYyBfX2luaXQgaW50IHhlbl9wYXJz
ZV9ub3B2KGNoYXIgKmFyZykKK3sKKwlub3B2ID0gdHJ1ZTsKKwlyZXR1cm4gMDsKK30KK2Vhcmx5
X3BhcmFtKCJub3B2IiwgeGVuX3BhcnNlX25vcHYpOworCiB2b2lkIF9faW5pdCBpbml0X2h5cGVy
dmlzb3JfcGxhdGZvcm0odm9pZCkKIHsKIAljb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgKmg7
CiAKKwlpZiAobm9wdikKKwkJcmV0dXJuOworCiAJaCA9IGRldGVjdF9oeXBlcnZpc29yX3ZlbmRv
cigpOwogCiAJaWYgKCFoKQotLSAKMS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
