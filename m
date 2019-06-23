Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C150B56
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 15:02:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfOYU-0006XF-28; Mon, 24 Jun 2019 12:58:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OLIz=UX=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hfOYS-0006X8-LN
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 12:58:40 +0000
X-Inumbo-ID: c7d0a7be-967f-11e9-ad16-3363066e5954
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7d0a7be-967f-11e9-ad16-3363066e5954;
 Mon, 24 Jun 2019 12:58:37 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCsHZP045489;
 Mon, 24 Jun 2019 12:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2018-07-02;
 bh=NfIpW5m3VpvjUSio8dF11x/kBwlpwlo1ekYCD0h4Qk8=;
 b=IGMsHrMS2fAoEAx11Y9xAipulaGOKc79b9ufDIR0k6j3B/E5rJmLuNGtBn13kRGAxtjA
 HmjZpILCk5sQ7mowxzxWpoJXgL8hUb79oGyGQMagInkZTj1kwZQy2k1Cse3uQqtavHgD
 hzJFTqA/lL67i9AqYwhcgo4vbEbyySXKwwdUQKlEcNjdR8aDiZBkKe+jWK2yHU+p4vJz
 1QjSCSgfqWayprex7bOiaosLHSfj/fwzUGTyNIxG7htGCFpvH6mIIkZeW2zAHfajD6SZ
 rU6F7waII+nuwwWKcq7eSbqCxDxQ7ygtDJ6Sk6Ge1hcMOiG5fuAA/TkTJnM0YKKDUBHu 9A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2t9c9pe7ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 12:58:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCwCth042307;
 Mon, 24 Jun 2019 12:58:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t9acbg5qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 12:58:21 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5OCwJp0010645;
 Mon, 24 Jun 2019 12:58:20 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 05:58:19 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 23 Jun 2019 21:01:41 +0800
Message-Id: <1561294903-6166-4-git-send-email-zhenzhong.duan@oracle.com>
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
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240105
Subject: [Xen-devel] [PATCH 4/6] Revert "xen: Introduce 'xen_nopv' to
 disable PV extensions for HVM guests."
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

VGhpcyByZXZlcnRzIGNvbW1pdCA4ZDY5M2I5MTFiYjljNTcwMDljMjRjYjE3NzJkMjA1Yjg0Yzc5
ODVjLgoKSW5zdGVhZCB3ZSB1c2UgYW4gdW5pZmllZCBwYXJhbWV0ZXIgJ25vcHYnIGZvciBhbGwg
dGhlIGh5cGVydmlzb3IKcGxhdGZvcm1zLgoKU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4g
PHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKLS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dCB8ICA0IC0tLS0KIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgICAgICAgICAgICAgICAg
ICAgIHwgMTIgKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBh
cmFtZXRlcnMudHh0CmluZGV4IGIzNTJmMzYuLmViYjc1YzEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CisrKyBiL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0CkBAIC01MjUxLDEwICs1MjUxLDYg
QEAKIAkJCURpc2FibGVzIHRoZSB0aWNrZXRsb2NrIHNsb3dwYXRoIHVzaW5nIFhlbiBQVgogCQkJ
b3B0aW1pemF0aW9ucy4KIAotCXhlbl9ub3B2CVtYODZdCi0JCQlEaXNhYmxlcyB0aGUgUFYgb3B0
aW1pemF0aW9ucyBmb3JjaW5nIHRoZSBIVk0gZ3Vlc3QgdG8KLQkJCXJ1biBhcyBnZW5lcmljIEhW
TSBndWVzdCB3aXRoIG5vIFBWIGRyaXZlcnMuCi0KIAl4ZW5fc2NydWJfcGFnZXM9CVtYRU5dCiAJ
CQlCb29sZWFuIG9wdGlvbiB0byBjb250cm9sIHNjcnViYmluZyBwYWdlcyBiZWZvcmUgZ2l2aW5n
IHRoZW0gYmFjawogCQkJdG8gWGVuLCBmb3IgdXNlIGJ5IG90aGVyIGRvbWFpbnMuIENhbiBiZSBh
bHNvIGNoYW5nZWQgYXQgcnVudGltZQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRl
bl9odm0uYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMKaW5kZXggYWM0OTQzYy4uN2Zj
YjRlYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9odm0uYworKysgYi9hcmNo
L3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jCkBAIC0yMTAsMTggKzIxMCw4IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCB4ZW5faHZtX2d1ZXN0X2luaXQodm9pZCkKICNlbmRpZgogfQogCi1zdGF0aWMgYm9v
bCB4ZW5fbm9wdjsKLXN0YXRpYyBfX2luaXQgaW50IHhlbl9wYXJzZV9ub3B2KGNoYXIgKmFyZykK
LXsKLSAgICAgICB4ZW5fbm9wdiA9IHRydWU7Ci0gICAgICAgcmV0dXJuIDA7Ci19Ci1lYXJseV9w
YXJhbSgieGVuX25vcHYiLCB4ZW5fcGFyc2Vfbm9wdik7Ci0KIGJvb2wgX19pbml0IHhlbl9odm1f
bmVlZF9sYXBpYyh2b2lkKQogewotCWlmICh4ZW5fbm9wdikKLQkJcmV0dXJuIGZhbHNlOwogCWlm
ICh4ZW5fcHZfZG9tYWluKCkpCiAJCXJldHVybiBmYWxzZTsKIAlpZiAoIXhlbl9odm1fZG9tYWlu
KCkpCkBAIC0yMzMsNyArMjIzLDcgQEAgYm9vbCBfX2luaXQgeGVuX2h2bV9uZWVkX2xhcGljKHZv
aWQpCiAKIHN0YXRpYyB1aW50MzJfdCBfX2luaXQgeGVuX3BsYXRmb3JtX2h2bSh2b2lkKQogewot
CWlmICh4ZW5fcHZfZG9tYWluKCkgfHwgeGVuX25vcHYpCisJaWYgKHhlbl9wdl9kb21haW4oKSkK
IAkJcmV0dXJuIDA7CiAKIAlyZXR1cm4geGVuX2NwdWlkX2Jhc2UoKTsKLS0gCjEuOC4zLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
