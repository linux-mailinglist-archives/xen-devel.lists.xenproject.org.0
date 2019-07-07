Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2D61C32
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 11:14:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkPgi-0004Th-6r; Mon, 08 Jul 2019 09:11:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IuGq=VF=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hkPgh-0004TS-3S
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 09:11:55 +0000
X-Inumbo-ID: 6beba52a-a160-11e9-8419-5f7ea15e786a
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6beba52a-a160-11e9-8419-5f7ea15e786a;
 Mon, 08 Jul 2019 09:11:51 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6899Y67139750;
 Mon, 8 Jul 2019 09:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=g2DHAK+GUXOKjeTx2IBEpkNnbp12a0u2MlWfdpHPiPY=;
 b=l1PKt9yUYfMPL3AKijizmeJGVZg0Syn/AxySYeAn1ZR5QclRyXNcS05GRlkCeI1jyjLp
 OTtHb4A41dubjula1fmPhkViLmzm1MTjHN2byT3HzLXUr46YFMvvsQ48Ij5BZM8YFnEj
 0mvLYfMXwnu+yGgbGy5hSXytCmYwgHRnD7mLTOsI52Qr7ZQQfUoJELFq+5W5UDwlQcre
 vcREKQ6mtu5E3ExkHim9MjnTmVOnaIZspmiXF5HEwsQ03sSe723LSxnmayFOBUmAuD63
 kiroVbAIRdqLM5hnfEndRYtcb2TpzNAWPMvyv/fTLZ7e9OOMprnU4E/zTBl63xDXz0sY mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2tjk2td9cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6897tLM189818;
 Mon, 8 Jul 2019 09:11:39 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2tjhpccsmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:39 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x689BbYs000301;
 Mon, 8 Jul 2019 09:11:37 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 02:11:37 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  7 Jul 2019 17:15:07 +0800
Message-Id: <1562490908-17882-4-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v6 3/4] xen: Map "xen_nopv" parameter to "nopv"
 and mark it obsolete
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

Q2xlYW4gdXAgdW5uZWNlc3NvcnkgY29kZSBhZnRlciB0aGF0IG9wZXJhdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgpSZXZpZXdl
ZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4
LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBCb3Jpc2xhdiBQZXRr
b3YgPGJwQGFsaWVuOC5kZT4KLS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dCB8ICAyICsrCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jICAgICAg
ICAgICAgICAgICAgICB8IDEyICsrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1p
bi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAppbmRleCAyMWUwOGFmLi44YWIzNGExIDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAorKysgYi9E
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAtNTI1NCw2
ICs1MjU0LDggQEAKIAl4ZW5fbm9wdglbWDg2XQogCQkJRGlzYWJsZXMgdGhlIFBWIG9wdGltaXph
dGlvbnMgZm9yY2luZyB0aGUgSFZNIGd1ZXN0IHRvCiAJCQlydW4gYXMgZ2VuZXJpYyBIVk0gZ3Vl
c3Qgd2l0aCBubyBQViBkcml2ZXJzLgorCQkJVGhpcyBvcHRpb24gaXMgb2Jzb2xldGVkIGJ5IHRo
ZSAibm9wdiIgb3B0aW9uLCB3aGljaAorCQkJaGFzIGVxdWl2YWxlbnQgZWZmZWN0IGZvciBYRU4g
cGxhdGZvcm0uCiAKIAl4ZW5fc2NydWJfcGFnZXM9CVtYRU5dCiAJCQlCb29sZWFuIG9wdGlvbiB0
byBjb250cm9sIHNjcnViYmluZyBwYWdlcyBiZWZvcmUgZ2l2aW5nIHRoZW0gYmFjawpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0
ZW5faHZtLmMKaW5kZXggYWM0OTQzYy4uMTc1NmNmNyAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVu
L2VubGlnaHRlbl9odm0uYworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0y
MTAsMTggKzIxMCwxOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgeGVuX2h2bV9ndWVzdF9pbml0KHZv
aWQpCiAjZW5kaWYKIH0KIAotc3RhdGljIGJvb2wgeGVuX25vcHY7CiBzdGF0aWMgX19pbml0IGlu
dCB4ZW5fcGFyc2Vfbm9wdihjaGFyICphcmcpCiB7Ci0gICAgICAgeGVuX25vcHYgPSB0cnVlOwot
ICAgICAgIHJldHVybiAwOworCXByX25vdGljZSgiXCJ4ZW5fbm9wdlwiIGlzIGRlcHJlY2F0ZWQs
IHBsZWFzZSB1c2UgXCJub3B2XCIgaW5zdGVhZFxuIik7CisKKwlpZiAoeGVuX2NwdWlkX2Jhc2Uo
KSkKKwkJbm9wdiA9IHRydWU7CisJcmV0dXJuIDA7CiB9CiBlYXJseV9wYXJhbSgieGVuX25vcHYi
LCB4ZW5fcGFyc2Vfbm9wdik7CiAKIGJvb2wgX19pbml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lk
KQogewotCWlmICh4ZW5fbm9wdikKLQkJcmV0dXJuIGZhbHNlOwogCWlmICh4ZW5fcHZfZG9tYWlu
KCkpCiAJCXJldHVybiBmYWxzZTsKIAlpZiAoIXhlbl9odm1fZG9tYWluKCkpCkBAIC0yMzMsNyAr
MjMzLDcgQEAgYm9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGljKHZvaWQpCiAKIHN0YXRpYyB1
aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQogewotCWlmICh4ZW5fcHZfZG9t
YWluKCkgfHwgeGVuX25vcHYpCisJaWYgKHhlbl9wdl9kb21haW4oKSkKIAkJcmV0dXJuIDA7CiAK
IAlyZXR1cm4geGVuX2NwdWlkX2Jhc2UoKTsKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
