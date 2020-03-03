Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC927176A71
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 03:10:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8wyk-0000Jk-6x; Tue, 03 Mar 2020 02:08:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8H3=4U=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1j8wyi-0000Ja-PS
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 02:08:12 +0000
X-Inumbo-ID: d596084a-5cf3-11ea-82f6-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d596084a-5cf3-11ea-82f6-bc764e2007e4;
 Tue, 03 Mar 2020 02:08:12 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02327h3I108607;
 Tue, 3 Mar 2020 02:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=3sx1vwQWdvQ5Z2ZWTgaCbJGjCVKxUP31T5G8RYrSA9g=;
 b=SxIcil+TzhF+21mvM5EaqrspnmMG4eoA/3iVEixTBt1zn/oc3eCxghJSHWLe5NhaAK7G
 lQYNqgXVojp+VUqbW1wq7/A1p8Oq21OCwsK73ATtOLuALkLHkDrNI1sbq/mNmqB+SZR5
 TjH56yctfiI+B59WZTQhPyM5/yxMA8nC30IeC871clG11yIUfk1RU2i7HaA190dBW+Rf
 Np/bxzTWS9eodxNEh6P8q6RlNySHSKzuXu6xhAN0+WKWuHdkqdv65ndKCPj4HWPplSBA
 ZG4IheREbKyWr4YM9rNZR7D16jWg+eQgnphwyNG30JovaRJMK3zTy8gLj92N2DjUZz7I 4g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yffcubv6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 02:08:10 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023271G6135520;
 Tue, 3 Mar 2020 02:08:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2yg1gwbdan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 02:08:09 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023288ms023929;
 Tue, 3 Mar 2020 02:08:08 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Mar 2020 18:08:08 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Mar 2020 17:58:59 -0800
Message-Id: <20200303015859.18813-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303015859.18813-1-dongli.zhang@oracle.com>
References: <20200303015859.18813-1-dongli.zhang@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=976 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030013
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030013
Subject: [Xen-devel] [PATCH 2/2] xenbus: req->err should be updated before
 req->state
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
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joe.jin@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIHRoZSBiYXJyaWVyIHRvIGd1YXJhbnRlZSB0aGF0IHJlcS0+ZXJyIGlz
IGFsd2F5cyB1cGRhdGVkCmJlZm9yZSByZXEtPnN0YXRlLgoKT3RoZXJ3aXNlLCByZWFkX3JlcGx5
KCkgd291bGQgbm90IHJldHVybiBFUlJfUFRSKHJlcS0+ZXJyKSBidXQKcmVxLT5ib2R5LCB3aGVu
IHByb2Nlc3Nfd3JpdGVzKCktPnhiX3dyaXRlKCkgaXMgZmFpbGVkLgoKU2lnbmVkLW9mZi1ieTog
RG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi94
ZW5idXMveGVuYnVzX2NvbW1zLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jIGIvZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jCmluZGV4IDg1MmVkMTYxZmMyYS4uZWI1MTUx
ZmM4ZWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMKKysr
IGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jCkBAIC0zOTcsNiArMzk3LDggQEAg
c3RhdGljIGludCBwcm9jZXNzX3dyaXRlcyh2b2lkKQogCWlmIChzdGF0ZS5yZXEtPnN0YXRlID09
IHhiX3JlcV9zdGF0ZV9hYm9ydGVkKQogCQlrZnJlZShzdGF0ZS5yZXEpOwogCWVsc2UgeworCQkv
KiB3cml0ZSBlcnIsIHRoZW4gdXBkYXRlIHN0YXRlICovCisJCXZpcnRfd21iKCk7CiAJCXN0YXRl
LnJlcS0+c3RhdGUgPSB4Yl9yZXFfc3RhdGVfZ290X3JlcGx5OwogCQl3YWtlX3VwKCZzdGF0ZS5y
ZXEtPndxKTsKIAl9Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
