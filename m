Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9DB6B58A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 06:25:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnbSu-0003Do-9C; Wed, 17 Jul 2019 04:22:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SQlR=VO=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hnbSs-0003Dj-8j
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 04:22:50 +0000
X-Inumbo-ID: 86c371c0-a84a-11e9-be6d-0b4407356694
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86c371c0-a84a-11e9-be6d-0b4407356694;
 Wed, 17 Jul 2019 04:22:45 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H4IaAT156874;
 Wed, 17 Jul 2019 04:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=ZaTW46yy/IPS+Uj8SvYea4HIn3z7+WN7LtSK/DDihz4=;
 b=ePRMs8awd/lTWeMpgQbWKbolJaWrnLONgEEG0Q81rgZvlACcR/cwq4E4RBxuqXqGRAzI
 wr5uZVipjClnyYIpK/Eav4QlyhuTEFf2r4x4Z/MycjDjLo7v59hg5Oi+8cJwuaPBHeHa
 IJDPAxyB1QEOqd3OPgbmVAaV75TZGDnmgdeJOlTFixmjS42sBqJ3XsMFaUOlJlQPohZr
 +kxp3ZmaT9s1haWVZUs03TLvtW7CpBOW0KMMhtJJkc68xWEqp51zaQ5o/4duDmE6DlOJ
 RVURGIf5YC8iM+mZbCHPo9if0uR7jHElX/TG8ypGXoXsJ1prkPcAkcZ8Kcy9wcxuk1oD cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2tq7xr004e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 04:22:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H4IY8e097456;
 Wed, 17 Jul 2019 04:22:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2tsctwqsjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 04:22:31 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6H4MU9T010466;
 Wed, 17 Jul 2019 04:22:30 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 17 Jul 2019 04:22:29 +0000
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 16 Jul 2019 12:26:08 +0800
Message-Id: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907170052
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907170052
Subject: [Xen-devel] [PATCH v8 4/5] x86/paravirt: Remove const mark from
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
Cc: jgross@suse.com, sstabellini@kernel.org, x86@kernel.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4gYXMgIm5vcHYiIHN1cHBvcnQgbmVlZHMgaXQgdG8gYmUgY2hhbmdlYWJsZSBhdCBib290IHVw
IHN0YWdlLgoKQ2hlY2twYXRjaCByZXBvcnRzIHdhcm5pbmcsIHNvIG1vdmUgdmFyaWFibGUgZGVj
bGFyYXRpb25zIGZyb20KaHlwZXJ2aXNvci5jIHRvIGh5cGVydmlzb3IuaAoKU2lnbmVkLW9mZi1i
eTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+CkNjOiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdv
IE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44
LmRlPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaCB8IDggKysrKysrKysK
IGFyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jICB8IDggLS0tLS0tLS0KIGFyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5faHZtLmMgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2h5cGVydmlzb3IuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaAppbmRl
eCBmN2I0YzUzLi5lNDFjYmYyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBl
cnZpc29yLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oCkBAIC01OCw2
ICs1OCwxNCBAQCBzdHJ1Y3QgaHlwZXJ2aXNvcl94ODYgewogCWJvb2wgaWdub3JlX25vcHY7CiB9
OwogCitleHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl92bXdhcmU7
CitleHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl9tc19oeXBlcnY7
CitleHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5fcHY7Citl
eHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl9rdm07CitleHRlcm4g
Y29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl9qYWlsaG91c2U7CitleHRlcm4g
Y29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl9hY3JuOworZXh0ZXJuIHN0cnVj
dCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVuX2h2bTsKKwogZXh0ZXJuIGJvb2wgbm9wdjsK
IGV4dGVybiBlbnVtIHg4Nl9oeXBlcnZpc29yX3R5cGUgeDg2X2h5cGVyX3R5cGU7CiBleHRlcm4g
dm9pZCBpbml0X2h5cGVydmlzb3JfcGxhdGZvcm0odm9pZCk7CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rZXJuZWwvY3B1L2h5cGVydmlzb3IuYyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNv
ci5jCmluZGV4IDdlYWFkNDEuLjU1M2JmYmYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9j
cHUvaHlwZXJ2aXNvci5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvaHlwZXJ2aXNvci5jCkBA
IC0yNiwxNCArMjYsNiBAQAogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KICNpbmNsdWRlIDxh
c20vaHlwZXJ2aXNvci5oPgogCi1leHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4
Nl9oeXBlcl92bXdhcmU7Ci1leHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9o
eXBlcl9tc19oeXBlcnY7Ci1leHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9o
eXBlcl94ZW5fcHY7Ci1leHRlcm4gY29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBl
cl94ZW5faHZtOwotZXh0ZXJuIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJf
a3ZtOwotZXh0ZXJuIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfamFpbGhv
dXNlOwotZXh0ZXJuIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfYWNybjsK
LQogc3RhdGljIGNvbnN0IF9faW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiAqIGNvbnN0
IGh5cGVydmlzb3JzW10gPQogewogI2lmZGVmIENPTkZJR19YRU5fUFYKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5j
CmluZGV4IDE3NTZjZjcuLmI2NzE5ODMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0
ZW5faHZtLmMKKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYwpAQCAtMjU5LDcgKzI1
OSw3IEBAIHN0YXRpYyBfX2luaXQgdm9pZCB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCh2b2lkKQog
I2VuZGlmCiB9CiAKLWNvbnN0IF9faW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZf
aHlwZXJfeGVuX2h2bSA9IHsKK3N0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVuX2h2
bSBfX2luaXRkYXRhID0gewogCS5uYW1lICAgICAgICAgICAgICAgICAgID0gIlhlbiBIVk0iLAog
CS5kZXRlY3QgICAgICAgICAgICAgICAgID0geGVuX3BsYXRmb3JtX2h2bSwKIAkudHlwZQkJCT0g
WDg2X0hZUEVSX1hFTl9IVk0sCi0tIAoxLjguMy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
