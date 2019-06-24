Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89BA54E33
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 14:03:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfk7f-0005lo-Ge; Tue, 25 Jun 2019 12:00:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8O1u=UY=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hfk7e-0005lZ-7c
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 12:00:26 +0000
X-Inumbo-ID: cf5edaca-9740-11e9-9b78-4723d50cd05f
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf5edaca-9740-11e9-9b78-4723d50cd05f;
 Tue, 25 Jun 2019 12:00:22 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBwkuP132922;
 Tue, 25 Jun 2019 12:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=iNQTvVUSmgNuLxw/E1kf9kiRXgGAedbtzYJ7h/7MhiM=;
 b=xIAw4zPPw23qdkXzzO7kIYWXxKfuSWEZME+9rRcJ1KvLaeHHFqrGGzTHONRNQHR7BvVZ
 iK/Wag51OR8USF4fgGFhHZ5vUQwTXO7LO8xhdrYFJjhRsgd51IIKWgto3cQmrs+kX1iB
 C5PUWNcg8xG3ReOM2UlG+VGrJaSp3A2yktkKQP6bydJ+7Nd8+hyXdMeuv7X5SN8805fl
 Etm7qGx+urDGi96IDdT9cOP1lnHDUiJUC8Be6ypgeuoJyuZ4lDJPECpRaL9udvR4pEai
 i9dIB1JcfOepxDS7yGP06jlhELtV3mRA8Wqx/52aQBiPJ3uJS0TyyvcLdC6iPIwbgA2D 8A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2t9c9pkv6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:00:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBxTnS064989;
 Tue, 25 Jun 2019 12:00:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t9acc2gnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:00:05 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5PC046Z027550;
 Tue, 25 Jun 2019 12:00:04 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 05:00:04 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 24 Jun 2019 20:02:57 +0800
Message-Id: <1561377779-28036-6-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906250097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250097
Subject: [Xen-devel] [PATCH v2 5/7] x86/xen: nopv parameter support for HVM
 guest
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
Cc: jgross@suse.com, sstabellini@kernel.org, peterz@infradead.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UFZIIGd1ZXN0IG5lZWRzIFBWIGV4dGVudGlvbnMgdG8gd29yaywgc28gbm9wdiBwYXJhbWV0ZXIg
aXMgaWdub3JlZApmb3IgUFZIIGJ1dCBub3QgZm9yIEhWTSBndWVzdC4KCkluIG9yZGVyIGZvciBu
b3B2IHBhcmFtZXRlciB0byB0YWtlIGVmZmVjdCBmb3IgSFZNIGd1ZXN0LCB3ZSBuZWVkIHRvCmRp
c3Rpbmd1aXNoIGJldHdlZW4gUFZIIGFuZCBIVk0gZ3Vlc3QgZWFybHkgaW4gaHlwZXJ2aXNvciBk
ZXRlY3Rpb24KY29kZS4gQnkgbW92aW5nIHRoZSBkZXRlY3Rpb24gb2YgUFZIIGluIHhlbl9wbGF0
Zm9ybV9odm0oKSwKeGVuX3B2aF9kb21haW4oKSBjb3VsZCBiZSB1c2VkIGZvciB0aGF0IHB1cnBv
c2UuCgpTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xl
LmNvbT4KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRy
b25peC5kZT4KQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgpDYzogQm9yaXNsYXYg
UGV0a292IDxicEBhbGllbjguZGU+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
LS0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIHwgMTggKysrKysrKysrKysrLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIGIvYXJjaC94ODYveGVuL2VubGln
aHRlbl9odm0uYwppbmRleCA3ZmNiNGVhLi4yNjkzOWU3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni94
ZW4vZW5saWdodGVuX2h2bS5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKQEAg
LTI1LDYgKzI1LDcgQEAKICNpbmNsdWRlICJtbXUuaCIKICNpbmNsdWRlICJzbXAuaCIKIAorZXh0
ZXJuIGJvb2wgbm9wdjsKIHN0YXRpYyB1bnNpZ25lZCBsb25nIHNoYXJlZF9pbmZvX3BmbjsKIAog
dm9pZCB4ZW5faHZtX2luaXRfc2hhcmVkX2luZm8odm9pZCkKQEAgLTIyNiwyMCArMjI3LDI0IEBA
IHN0YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQogCWlmICh4ZW5f
cHZfZG9tYWluKCkpCiAJCXJldHVybiAwOwogCisjaWZkZWYgQ09ORklHX1hFTl9QVkgKKwkvKiBU
ZXN0IGZvciBQVkggZG9tYWluIChQVkggYm9vdCBwYXRoIHRha2VuIG92ZXJyaWRlcyBBQ1BJIGZs
YWdzKS4gKi8KKwlpZiAoIXg4Nl9wbGF0Zm9ybS5sZWdhY3kucnRjICYmIHg4Nl9wbGF0Zm9ybS5s
ZWdhY3kubm9fdmdhKQorCQl4ZW5fcHZoID0gdHJ1ZTsKKyNlbmRpZgorCisJaWYgKCF4ZW5fcHZo
X2RvbWFpbigpICYmIG5vcHYpCisJCXJldHVybiAwOworCiAJcmV0dXJuIHhlbl9jcHVpZF9iYXNl
KCk7CiB9CiAKIHN0YXRpYyBfX2luaXQgdm9pZCB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCh2b2lk
KQogewogI2lmZGVmIENPTkZJR19YRU5fUFZICi0JLyogVGVzdCBmb3IgUFZIIGRvbWFpbiAoUFZI
IGJvb3QgcGF0aCB0YWtlbiBvdmVycmlkZXMgQUNQSSBmbGFncykuICovCi0JaWYgKCF4ZW5fcHZo
ICYmCi0JICAgICh4ODZfcGxhdGZvcm0ubGVnYWN5LnJ0YyB8fCAheDg2X3BsYXRmb3JtLmxlZ2Fj
eS5ub192Z2EpKQorCWlmICgheGVuX3B2aCkKIAkJcmV0dXJuOwogCi0JLyogUFZIIGRldGVjdGVk
LiAqLwotCXhlbl9wdmggPSB0cnVlOwotCiAJLyogTWFrZSBzdXJlIHdlIGRvbid0IGZhbGwgYmFj
ayB0byAoZGVmYXVsdCkgQUNQSV9JUlFfTU9ERUxfUElDLiAqLwogCWlmICghbnJfaW9hcGljcyAm
JiBhY3BpX2lycV9tb2RlbCA9PSBBQ1BJX0lSUV9NT0RFTF9QSUMpCiAJCWFjcGlfaXJxX21vZGVs
ID0gQUNQSV9JUlFfTU9ERUxfUExBVEZPUk07CkBAIC0yNTgsNCArMjYzLDUgQEAgc3RhdGljIF9f
aW5pdCB2b2lkIHhlbl9odm1fZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCiAJLmluaXQuaW5pdF9tZW1f
bWFwcGluZwk9IHhlbl9odm1faW5pdF9tZW1fbWFwcGluZywKIAkuaW5pdC5ndWVzdF9sYXRlX2lu
aXQJPSB4ZW5faHZtX2d1ZXN0X2xhdGVfaW5pdCwKIAkucnVudGltZS5waW5fdmNwdSAgICAgICA9
IHhlbl9waW5fdmNwdSwKKwkuaWdub3JlX25vcHYgICAgICAgICAgICA9IHRydWUsCiB9OwotLSAK
MS44LjMuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
