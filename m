Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA915176A76
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 03:11:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8wyk-0000K0-LI; Tue, 03 Mar 2020 02:08:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8H3=4U=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1j8wyj-0000Jf-LF
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 02:08:13 +0000
X-Inumbo-ID: d56f3f76-5cf3-11ea-a055-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d56f3f76-5cf3-11ea-a055-12813bfff9fa;
 Tue, 03 Mar 2020 02:08:12 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0231x3hb148451;
 Tue, 3 Mar 2020 02:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=ZnTpS8VIGtwdzMLvw2RMV+Mj4v/yLUlDY6U0RXZtG6w=;
 b=Zl2uZxUioaUBYlL7h/H550/UBD5qHypNu0P3pvhuNsBmgsuXxMdxVp76/NApRX/mRRJR
 HybXvZ9rtmVUkSD2mb5/lJeUI5UmTqCyMIHxEMvz6gn36mlHR/XswNjLlWks5v6ikn9+
 wh2hb1w0R5fokF7cs9EG+o7lQoBU5q9gWd6YkJJ8HNkfOLBCxq4/p4PKfEW2xW4Rrn6u
 6FFImHE0jgvAPTvwK/fSGqnzsU0ZV/ZlIw3bGnFHXzk/BEYDb4JyGU7cGolt8MZJ0PEh
 2G/ENgwrJZw4YQdN9uwlbyLtmGGXzUxpjnfj4eYbI9ucXoVzBM7PrJ8cYedDu0I88VAq ow== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2yghn2ynms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 02:08:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0231wSUu048266;
 Tue, 3 Mar 2020 02:08:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2yg1p35wud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 02:08:09 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023288C0031539;
 Tue, 3 Mar 2020 02:08:08 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Mar 2020 18:08:07 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Date: Mon,  2 Mar 2020 17:58:58 -0800
Message-Id: <20200303015859.18813-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030012
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030012
Subject: [Xen-devel] [PATCH 1/2] xenbus: req->body should be updated before
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

VGhlIHJlcS0+Ym9keSBzaG91bGQgYmUgdXBkYXRlZCBiZWZvcmUgcmVxLT5zdGF0ZSBpcyB1cGRh
dGVkIGFuZCB0aGUKb3JkZXIgc2hvdWxkIGJlIGd1YXJhbnRlZWQgYnkgYSBiYXJyaWVyLgoKT3Ro
ZXJ3aXNlLCByZWFkX3JlcGx5KCkgbWlnaHQgcmV0dXJuIHJlcS0+Ym9keSA9IE5VTEwuCgpCZWxv
dyBpcyBzYW1wbGUgY2FsbHN0YWNrIHdoZW4gdGhlIGlzc3VlIGlzIHJlcHJvZHVjZWQgb24gcHVy
cG9zZSBieQpyZW9yZGVyaW5nIHRoZSB1cGRhdGVzIG9mIHJlcS0+Ym9keSBhbmQgcmVxLT5zdGF0
ZSBhbmQgYWRkaW5nIGRlbGF5IGluCmNvZGUgYmV0d2VlbiB1cGRhdGVzIG9mIHJlcS0+c3RhdGUg
YW5kIHJlcS0+Ym9keS4KClsgICAyMi4zNTYxMDVdIGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdDog
MDAwMCBbIzFdIFNNUCBQVEkKWyAgIDIyLjM2MTE4NV0gQ1BVOiAyIFBJRDogNTIgQ29tbTogeGVu
d2F0Y2ggTm90IHRhaW50ZWQgNS41LjB4ZW4rICM2ClsgICAyMi4zNjY3MjddIEhhcmR3YXJlIG5h
bWU6IFhlbiBIVk0gZG9tVSwgQklPUyAuLi4KWyAgIDIyLjM3MjI0NV0gUklQOiAwMDEwOl9wYXJz
ZV9pbnRlZ2VyX2ZpeHVwX3JhZGl4KzB4Ni8weDYwCi4uLiAuLi4KWyAgIDIyLjM5MjE2M10gUlNQ
OiAwMDE4OmZmZmZiMmQ2NDAyM2ZkZjAgRUZMQUdTOiAwMDAxMDI0NgpbICAgMjIuMzk1OTMzXSBS
QVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiA3NTc0NmU3NTYyNzU1ZjZkIFJDWDogMDAwMDAwMDAw
MDAwMDAwMApbICAgMjIuNDAwODcxXSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmYjJk
NjQwMjNmZGZjIFJESTogNzU3NDZlNzU2Mjc1NWY2ZApbICAgMjIuNDA1ODc0XSBSQlA6IDAwMDAw
MDAwMDAwMDAwMDAgUjA4OiAwMDAwMDAwMDAwMDAwMWU4IFIwOTogMDAwMDAwMDAwMGNkY2RjZApb
ICAgMjIuNDEwOTQ1XSBSMTA6IGZmZmZiMmQ2NDAyZmZlMDAgUjExOiBmZmZmOWQ5NTM5NWVhZWIw
IFIxMjogZmZmZjlkOTUzNTkzNTAwMApbICAgMjIuNDE3NjEzXSBSMTM6IGZmZmY5ZDk1MjZkNGEw
MDAgUjE0OiBmZmZmOWQ5NTI2ZjRmMzQwIFIxNTogZmZmZjlkOTUzNzY1NDAwMApbICAgMjIuNDIz
NzI2XSBGUzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjlkOTUzYmM4MDAwMCgwMDAw
KSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgICAyMi40Mjk4OThdIENTOiAgMDAxMCBEUzogMDAw
MCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAgIDIyLjQzNDM0Ml0gQ1IyOiAwMDAw
MDBjNDIwNmE5MDAwIENSMzogMDAwMDAwMDFlYTNmYzAwMiBDUjQ6IDAwMDAwMDAwMDAxNjA2ZTAK
WyAgIDIyLjQzOTY0NV0gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAwMDAwMDAw
MCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAKWyAgIDIyLjQ0NDk0MV0gRFIzOiAwMDAwMDAwMDAwMDAw
MDAwIERSNjogMDAwMDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDAKWyAgIDIyLjQ1
MDM0Ml0gQ2FsbCBUcmFjZToKWyAgIDIyLjQ1MjUwOV0gIHNpbXBsZV9zdHJ0b3VsbCsweDI3LzB4
NzAKWyAgIDIyLjQ1NTU3Ml0gIHhlbmJ1c190cmFuc2FjdGlvbl9zdGFydCsweDMxLzB4NTAKWyAg
IDIyLjQ1OTEwNF0gIG5ldGJhY2tfY2hhbmdlZCsweDc2Yy8weGNjMSBbeGVuX25ldGZyb250XQpb
ICAgMjIuNDYzMjc5XSAgPyBmaW5kX3dhdGNoKzB4NDAvMHg0MApbICAgMjIuNDY2MTU2XSAgeGVu
d2F0Y2hfdGhyZWFkKzB4YjQvMHgxNTAKWyAgIDIyLjQ2OTMwOV0gID8gd2FpdF93b2tlbisweDgw
LzB4ODAKWyAgIDIyLjQ3MjE5OF0gIGt0aHJlYWQrMHgxMGUvMHgxMzAKWyAgIDIyLjQ3NDkyNV0g
ID8ga3RocmVhZF9wYXJrKzB4ODAvMHg4MApbICAgMjIuNDc3OTQ2XSAgcmV0X2Zyb21fZm9yaysw
eDM1LzB4NDAKWyAgIDIyLjQ4MDk2OF0gTW9kdWxlcyBsaW5rZWQgaW46IHhlbl9rYmRmcm9udCB4
ZW5fZmJmcm9udCgrKSB4ZW5fbmV0ZnJvbnQgeGVuX2Jsa2Zyb250ClsgICAyMi40ODY3ODNdIC0t
LVsgZW5kIHRyYWNlIGE5MjIyMDMwYTc0N2MzZjcgXS0tLQpbICAgMjIuNDkwNDI0XSBSSVA6IDAw
MTA6X3BhcnNlX2ludGVnZXJfZml4dXBfcmFkaXgrMHg2LzB4NjAKClRoZSAid2hpbGUiIGlzIGNo
YW5nZWQgdG8gImRvIHdoaWxlIiBzbyB0aGF0IHdhaXRfZXZlbnQoKSBpcyB1c2VkIGFzIGEKYmFy
cmllci4KClNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5j
b20+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jIHwgMiArKwogZHJpdmVy
cy94ZW4veGVuYnVzL3hlbmJ1c194cy5jICAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94
ZW5idXMveGVuYnVzX2NvbW1zLmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMK
aW5kZXggZDIzOWZjM2M1ZTNkLi44NTJlZDE2MWZjMmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfY29tbXMuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2Nv
bW1zLmMKQEAgLTMxMyw2ICszMTMsOCBAQCBzdGF0aWMgaW50IHByb2Nlc3NfbXNnKHZvaWQpCiAJ
CQlyZXEtPm1zZy50eXBlID0gc3RhdGUubXNnLnR5cGU7CiAJCQlyZXEtPm1zZy5sZW4gPSBzdGF0
ZS5tc2cubGVuOwogCQkJcmVxLT5ib2R5ID0gc3RhdGUuYm9keTsKKwkJCS8qIHdyaXRlIGJvZHks
IHRoZW4gdXBkYXRlIHN0YXRlICovCisJCQl2aXJ0X3dtYigpOwogCQkJcmVxLT5zdGF0ZSA9IHhi
X3JlcV9zdGF0ZV9nb3RfcmVwbHk7CiAJCQlyZXEtPmNiKHJlcSk7CiAJCX0gZWxzZQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jIGIvZHJpdmVycy94ZW4veGVuYnVz
L3hlbmJ1c194cy5jCmluZGV4IGRkYzE4ZGE2MTgzNC4uZjViMGE2YTcyYWQzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3hzLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVz
L3hlbmJ1c194cy5jCkBAIC0yMDIsNyArMjAyLDcgQEAgc3RhdGljIGJvb2wgdGVzdF9yZXBseShz
dHJ1Y3QgeGJfcmVxX2RhdGEgKnJlcSkKIAogc3RhdGljIHZvaWQgKnJlYWRfcmVwbHkoc3RydWN0
IHhiX3JlcV9kYXRhICpyZXEpCiB7Ci0Jd2hpbGUgKHJlcS0+c3RhdGUgIT0geGJfcmVxX3N0YXRl
X2dvdF9yZXBseSkgeworCWRvIHsKIAkJd2FpdF9ldmVudChyZXEtPndxLCB0ZXN0X3JlcGx5KHJl
cSkpOwogCiAJCWlmICgheGVuYnVzX29rKCkpCkBAIC0yMTYsNyArMjE2LDcgQEAgc3RhdGljIHZv
aWQgKnJlYWRfcmVwbHkoc3RydWN0IHhiX3JlcV9kYXRhICpyZXEpCiAJCWlmIChyZXEtPmVycikK
IAkJCXJldHVybiBFUlJfUFRSKHJlcS0+ZXJyKTsKIAotCX0KKwl9IHdoaWxlIChyZXEtPnN0YXRl
ICE9IHhiX3JlcV9zdGF0ZV9nb3RfcmVwbHkpOwogCiAJcmV0dXJuIHJlcS0+Ym9keTsKIH0KLS0g
CjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
