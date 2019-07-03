Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994EC5F0ED
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 03:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiqMJ-0000W1-Dv; Thu, 04 Jul 2019 01:16:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMc9=VB=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiqMI-0000Vt-LY
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 01:16:22 +0000
X-Inumbo-ID: 529d239c-9df9-11e9-8224-7f87ca585c88
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 529d239c-9df9-11e9-8224-7f87ca585c88;
 Thu, 04 Jul 2019 01:16:17 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641ELVj123406;
 Thu, 4 Jul 2019 01:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=7EONRTmmeGFvVCXtQC6IK+HBE0ZbOZS1TzpKDcuyVw0=;
 b=SvuqvOW0QMcbCnNoA3Hk6po54G1amoaC8/wol5laRpot5IEisw9rJSawyorwuRKKOVBQ
 1sGMgGp4RlO2NprxXph5PDQTTcdn+7g0AnFZrFkoHg8cGe8Yn59AaWE1TpW7Fdj7pLu7
 apeGBjgwDuhuiE6T4PHpW6TZdkr/4ficoYXOSlzGfNKZgx/9qWNnH/jCjxPGB4AcKx2t
 4YWu+922ulCF1jwXgAJLibGHgkaNueKkKgAz7amS2KPRAxKPgSA0+QWBXxjSQAHmbAcw
 Wu8lQF3JFAwx8ADEJJ8VHZmFw5pD8Dr4su5EvSxuhlClNoOOsn/ygFTCVWUyhI4Aw3jI CA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2te5tbv6rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:16:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641Ca7m171107;
 Thu, 4 Jul 2019 01:16:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2th5qm18at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:16:06 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x641G5lu026874;
 Thu, 4 Jul 2019 01:16:05 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 03 Jul 2019 18:16:04 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jul 2019 09:19:37 +0800
Message-Id: <1562116778-5846-4-git-send-email-zhenzhong.duan@oracle.com>
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
Subject: [Xen-devel] [PATCH v5 3/4] xen: Map "xen_nopv" parameter to "nopv"
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
ZmYtYnk6IFpoZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgpDYzogQm9y
aXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzog
SW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFs
aWVuOC5kZT4KLS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJz
LnR4dCB8ICAyICsrCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jICAgICAgICAgICAgICAg
ICAgICB8IDEyICsrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9r
ZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dAppbmRleCAyMWUwOGFmLi44YWIzNGExIDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAorKysgYi9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dApAQCAtNTI1NCw2ICs1MjU0LDgg
QEAKIAl4ZW5fbm9wdglbWDg2XQogCQkJRGlzYWJsZXMgdGhlIFBWIG9wdGltaXphdGlvbnMgZm9y
Y2luZyB0aGUgSFZNIGd1ZXN0IHRvCiAJCQlydW4gYXMgZ2VuZXJpYyBIVk0gZ3Vlc3Qgd2l0aCBu
byBQViBkcml2ZXJzLgorCQkJVGhpcyBvcHRpb24gaXMgb2Jzb2xldGVkIGJ5IHRoZSAibm9wdiIg
b3B0aW9uLCB3aGljaAorCQkJaGFzIGVxdWl2YWxlbnQgZWZmZWN0IGZvciBYRU4gcGxhdGZvcm0u
CiAKIAl4ZW5fc2NydWJfcGFnZXM9CVtYRU5dCiAJCQlCb29sZWFuIG9wdGlvbiB0byBjb250cm9s
IHNjcnViYmluZyBwYWdlcyBiZWZvcmUgZ2l2aW5nIHRoZW0gYmFjawpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYveGVuL2VubGlnaHRlbl9odm0uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMK
aW5kZXggYWM0OTQzYy4uMTc1NmNmNyAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRl
bl9odm0uYworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0yMTAsMTggKzIx
MCwxOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgeGVuX2h2bV9ndWVzdF9pbml0KHZvaWQpCiAjZW5k
aWYKIH0KIAotc3RhdGljIGJvb2wgeGVuX25vcHY7CiBzdGF0aWMgX19pbml0IGludCB4ZW5fcGFy
c2Vfbm9wdihjaGFyICphcmcpCiB7Ci0gICAgICAgeGVuX25vcHYgPSB0cnVlOwotICAgICAgIHJl
dHVybiAwOworCXByX25vdGljZSgiXCJ4ZW5fbm9wdlwiIGlzIGRlcHJlY2F0ZWQsIHBsZWFzZSB1
c2UgXCJub3B2XCIgaW5zdGVhZFxuIik7CisKKwlpZiAoeGVuX2NwdWlkX2Jhc2UoKSkKKwkJbm9w
diA9IHRydWU7CisJcmV0dXJuIDA7CiB9CiBlYXJseV9wYXJhbSgieGVuX25vcHYiLCB4ZW5fcGFy
c2Vfbm9wdik7CiAKIGJvb2wgX19pbml0IHhlbl9odm1fbmVlZF9sYXBpYyh2b2lkKQogewotCWlm
ICh4ZW5fbm9wdikKLQkJcmV0dXJuIGZhbHNlOwogCWlmICh4ZW5fcHZfZG9tYWluKCkpCiAJCXJl
dHVybiBmYWxzZTsKIAlpZiAoIXhlbl9odm1fZG9tYWluKCkpCkBAIC0yMzMsNyArMjMzLDcgQEAg
Ym9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGljKHZvaWQpCiAKIHN0YXRpYyB1aW50MzJfdCBf
X2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQogewotCWlmICh4ZW5fcHZfZG9tYWluKCkgfHwg
eGVuX25vcHYpCisJaWYgKHhlbl9wdl9kb21haW4oKSkKIAkJcmV0dXJuIDA7CiAKIAlyZXR1cm4g
eGVuX2NwdWlkX2Jhc2UoKTsKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
