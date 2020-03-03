Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE717804E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 19:59:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9CjB-0007pm-HG; Tue, 03 Mar 2020 18:57:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8H3=4U=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1j9Cj9-0007pb-Dv
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 18:57:11 +0000
X-Inumbo-ID: c96046fc-5d80-11ea-a209-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c96046fc-5d80-11ea-a209-12813bfff9fa;
 Tue, 03 Mar 2020 18:57:10 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023Is7td050119;
 Tue, 3 Mar 2020 18:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=3sx1vwQWdvQ5Z2ZWTgaCbJGjCVKxUP31T5G8RYrSA9g=;
 b=zaZ8UEh5QMzNbdzHE6voY1AIV/S2dUkTMkHhtDcPX1Qrlza/3uIFLPIZIgQBuafC5O5Q
 V8zUGRUjb0mABFgZNtk2YjjYf1uYU3yFqOsnfY8aWV++UxS2HsVpXxYezjG1bEgC7IoZ
 BEp6TsrxrgmgL88szeAZmvztKnlj4VqzZf373eE9o2g6LSJkoIBYKwSL5Yw0753MrIrs
 cKb4ffWwMby8vkCzRHOM0C0MLZT+50sYBAymZ0wPK38jd3dnoxNmkKPMpm4V6qvqJQRg
 D4z/5Sf7emOWDgFmc8wr9dMSBZUafyiduKlATGRiWyPpbu6wosuN9CwlL0e4UTc439Aw sQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2yffwqs991-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 18:57:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023IqTvw072605;
 Tue, 3 Mar 2020 18:57:08 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2yg1p555qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 18:57:08 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023Iv6it011726;
 Tue, 3 Mar 2020 18:57:07 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 10:57:06 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Date: Tue,  3 Mar 2020 10:47:52 -0800
Message-Id: <20200303184752.20821-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303184752.20821-1-dongli.zhang@oracle.com>
References: <20200303184752.20821-1-dongli.zhang@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=980 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030124
Subject: [Xen-devel] [PATCH v2 2/2] xenbus: req->err should be updated
 before req->state
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
Cc: jgross@suse.com, joe.jin@oracle.com, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, julien@xen.org
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
