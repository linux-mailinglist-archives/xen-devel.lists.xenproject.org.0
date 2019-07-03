Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820D5F0EB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 03:19:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiqMI-0000Vh-3h; Thu, 04 Jul 2019 01:16:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMc9=VB=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiqMF-0000VV-Sx
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 01:16:19 +0000
X-Inumbo-ID: 5375b5e6-9df9-11e9-8980-bc764e045a96
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5375b5e6-9df9-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 01:16:18 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641Efot123673;
 Thu, 4 Jul 2019 01:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=HhKAAWVPipFLRo00kLa1NJDWOLc4M9riT3RNfy4Uozs=;
 b=wb7MTWSeBsklCUBYPP99Z2BcF022Vw3ID16E/qh0bdF7nB7k1tlNEWUtZO2/cS8lP0ZD
 yNCz1L07vjhGc0qoJRLasQyOaDbHgOCxOdEXyd54gcfMQIk7DUjJ3oOfVdOfV8Q8vQ5g
 i8oAQpk7tKiO5Ms8vco8jiuHzpem2VPS3mxsJ8bKszx6U4gRSOvfPaUZPpUoY5CD+HiG
 lWK79YzScafjJjT6ivE7ICnc8TpIky7TSX3WmnIewaloynLkKNq42lBpqed0havaSTxq
 fhQ8TDFt8aDTFi2RL3MIclgIj8jVEMcu8L4Bn73q+IsNVF5vPoKkE9TKh9lQsAxuvw0M GA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2te5tbv6s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:16:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641Cceh089845;
 Thu, 4 Jul 2019 01:16:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2tebkv5tdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:16:07 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x641G7tj010700;
 Thu, 4 Jul 2019 01:16:07 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 03 Jul 2019 18:16:07 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jul 2019 09:19:38 +0800
Message-Id: <1562116778-5846-5-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v5 4/4] x86/xen: Add "nopv" support for HVM guest
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

UFZIIGd1ZXN0IG5lZWRzIFBWIGV4dGVudGlvbnMgdG8gd29yaywgc28gIm5vcHYiIHBhcmFtZXRl
ciBzaG91bGQgYmUKaWdub3JlZCBmb3IgUFZIIGJ1dCBub3QgZm9yIEhWTSBndWVzdC4KCklmIFBW
SCBndWVzdCBib290cyB1cCB2aWEgdGhlIFhlbi1QVkggYm9vdCBlbnRyeSwgeGVuX3B2aCBpcyBz
ZXQgZWFybHksCndlIGtub3cgaXQncyBQVkggZ3Vlc3QgYW5kIGlnbm9yZSAibm9wdiIgcGFyYW1l
dGVyIGRpcmVjdGx5LgoKSWYgUFZIIGd1ZXN0IGJvb3RzIHVwIHZpYSB0aGUgbm9ybWFsIGJvb3Qg
ZW50cnkgc2FtZSBhcyBIVk0gZ3Vlc3QsIGl0J3MKaGFyZCB0byBkaXN0aW5ndWlzaCBQVkggYW5k
IEhWTSBndWVzdCBhdCB0aGF0IHRpbWUuCgpUbyBoYW5kbGUgdGhhdCBjYXNlLCBhZGQgYSBuZXcg
ZnVuY3Rpb24geGVuX2h2bV9ub3B2X2d1ZXN0X2xhdGVfaW5pdCgpCnRvIGRldGVjdCBQVkggYXQg
YSBsYXRlIHRpbWUgYW5kIHBhbmljIGl0c2VsZiBpZiBub3B2IGVuYWJsZWQgZm9yIGEKUFZIIGd1
ZXN0LgoKU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNs
ZS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpD
YzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0
cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2
IFBldGtvdiA8YnBAYWxpZW44LmRlPgotLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMg
fCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYyBiL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKaW5kZXggMTc1NmNmNy4uMDlhMDEwYSAxMDA2NDQK
LS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYworKysgYi9hcmNoL3g4Ni94ZW4vZW5s
aWdodGVuX2h2bS5jCkBAIC0yMzEsMTEgKzIzMSwzNyBAQCBib29sIF9faW5pdCB4ZW5faHZtX25l
ZWRfbGFwaWModm9pZCkKIAlyZXR1cm4gdHJ1ZTsKIH0KIAorc3RhdGljIF9faW5pdCB2b2lkIHhl
bl9odm1fbm9wdl9ndWVzdF9sYXRlX2luaXQodm9pZCkKK3sKKyNpZmRlZiBDT05GSUdfWEVOX1BW
SAorCWlmICh4ODZfcGxhdGZvcm0ubGVnYWN5LnJ0YyB8fCAheDg2X3BsYXRmb3JtLmxlZ2FjeS5u
b192Z2EpCisJCXJldHVybjsKKworCS8qIFBWSCBkZXRlY3RlZC4gKi8KKwl4ZW5fcHZoID0gdHJ1
ZTsKKworCXBhbmljKCJcIm5vcHZcIiBhbmQgXCJ4ZW5fbm9wdlwiIHBhcmFtZXRlcnMgYXJlIHVu
c3VwcG9ydGVkIGluIFBWSCBndWVzdC4iKTsKKyNlbmRpZgorfQorCisKIHN0YXRpYyB1aW50MzJf
dCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQogewogCWlmICh4ZW5fcHZfZG9tYWluKCkp
CiAJCXJldHVybiAwOwogCisJaWYgKHhlbl9wdmhfZG9tYWluKCkgJiYgbm9wdikgeworCQkvKiBH
dWVzdCBib290aW5nIHZpYSB0aGUgWGVuLVBWSCBib290IGVudHJ5IGdvZXMgaGVyZSAqLworCQlw
cl9pbmZvKCJcIm5vcHZcIiBwYXJhbWV0ZXIgaXMgaWdub3JlZCBpbiBQVkggZ3Vlc3RcbiIpOwor
CQlub3B2ID0gZmFsc2U7CisJfSBlbHNlIGlmIChub3B2KSB7CisJCS8qCisJCSAqIEd1ZXN0IGJv
b3RpbmcgdmlhIG5vcm1hbCBib290IGVudHJ5IChsaWtlIHZpYSBncnViMikgZ29lcworCQkgKiBo
ZXJlLgorCQkgKi8KKwkJeDg2X2luaXQuaHlwZXIuZ3Vlc3RfbGF0ZV9pbml0ID0geGVuX2h2bV9u
b3B2X2d1ZXN0X2xhdGVfaW5pdDsKKwkJcmV0dXJuIDA7CisJfQogCXJldHVybiB4ZW5fY3B1aWRf
YmFzZSgpOwogfQogCkBAIC0yNjgsNCArMjk0LDUgQEAgc3RhdGljIF9faW5pdCB2b2lkIHhlbl9o
dm1fZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCiAJLmluaXQuaW5pdF9tZW1fbWFwcGluZwk9IHhlbl9o
dm1faW5pdF9tZW1fbWFwcGluZywKIAkuaW5pdC5ndWVzdF9sYXRlX2luaXQJPSB4ZW5faHZtX2d1
ZXN0X2xhdGVfaW5pdCwKIAkucnVudGltZS5waW5fdmNwdSAgICAgICA9IHhlbl9waW5fdmNwdSwK
KwkuaWdub3JlX25vcHYgICAgICAgICAgICA9IHRydWUsCiB9OwotLSAKMS44LjMuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
