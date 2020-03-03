Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0927717859F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 23:27:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Fx3-0008IQ-87; Tue, 03 Mar 2020 22:23:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8H3=4U=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1j9Fx1-0008IL-8d
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 22:23:43 +0000
X-Inumbo-ID: a3576f7c-5d9d-11ea-b52f-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3576f7c-5d9d-11ea-b52f-bc764e2007e4;
 Tue, 03 Mar 2020 22:23:42 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023MIHxP056840;
 Tue, 3 Mar 2020 22:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=RvBME80uuPeWcTzh/WQfzn28mvoGe375BqaUVKtmEqI=;
 b=vONHwh1Q80nSUx9IjGEH/j2TJp2ladGzh047GLgidu+/3VbEgf2fvVrgFd6/lHLdAL69
 avl/05t2qoWdEC1TYk7i2K+b1Ae9gweuQCEooecijAKsI1aExHy4b+h6tKOp5mehS1Fl
 F1HQ92Gso9JYlTISypN7SSME4RPJmuyYdRJuiw02N4Jghq3Qjp5y/l1aD7rrIY1Ay7FW
 lSfljqs0TN+Lz24hdDTsi++ks14vd5/5j/giPWcoFxL15tqKQ8llu1JyvVwQV4wBTztt
 1526ek8ZiyfeVWgaivywnls7EKX5TTQ6dcBfA21uTOo96FHQXjOhO4MDUQJBITbe5e49 Ag== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2yffwqtb57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 22:23:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023MMdCJ153226;
 Tue, 3 Mar 2020 22:23:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2yg1emx3ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 22:23:39 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 023MNb1X030999;
 Tue, 3 Mar 2020 22:23:37 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 14:23:37 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Date: Tue,  3 Mar 2020 14:14:22 -0800
Message-Id: <20200303221423.21962-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030144
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030143
Subject: [Xen-devel] [PATCH v3 1/2] xenbus: req->body should be updated
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
MTA6X3BhcnNlX2ludGVnZXJfZml4dXBfcmFkaXgrMHg2LzB4NjAKClRoZSB2aXJ0X3JtYigpIGlz
IGFkZGVkIGluIHRoZSAndHJ1ZScgcGF0aCBvZiB0ZXN0X3JlcGx5KCkuIFRoZSAid2hpbGUiCmlz
IGNoYW5nZWQgdG8gImRvIHdoaWxlIiBzbyB0aGF0IHRlc3RfcmVwbHkoKSBpcyB1c2VkIGFzIGEg
cmVhZCBtZW1vcnkKYmFycmllci4KClNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xp
LnpoYW5nQG9yYWNsZS5jb20+Ci0tLQpDaGFuZ2VkIHNpbmNlIHYxOgogIC0gY2hhbmdlICJiYXJy
aWVyKCkiIHRvICJ2aXJ0X3JtYigpIiBpbiB0ZXN0X3JlcGx5KCkKQ2hhbmdlZCBzaW5jZSB2MjoK
ICAtIFVzZSAidmlydF9ybWIoKSIgb25seSBpbiAndHJ1ZScgcGF0aAoKIGRyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfY29tbXMuYyB8IDIgKysKIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMu
YyAgICB8IDkgKysrKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1z
LmMgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMKaW5kZXggZDIzOWZjM2M1ZTNk
Li44NTJlZDE2MWZjMmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfY29t
bXMuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1zLmMKQEAgLTMxMyw2ICsz
MTMsOCBAQCBzdGF0aWMgaW50IHByb2Nlc3NfbXNnKHZvaWQpCiAJCQlyZXEtPm1zZy50eXBlID0g
c3RhdGUubXNnLnR5cGU7CiAJCQlyZXEtPm1zZy5sZW4gPSBzdGF0ZS5tc2cubGVuOwogCQkJcmVx
LT5ib2R5ID0gc3RhdGUuYm9keTsKKwkJCS8qIHdyaXRlIGJvZHksIHRoZW4gdXBkYXRlIHN0YXRl
ICovCisJCQl2aXJ0X3dtYigpOwogCQkJcmVxLT5zdGF0ZSA9IHhiX3JlcV9zdGF0ZV9nb3RfcmVw
bHk7CiAJCQlyZXEtPmNiKHJlcSk7CiAJCX0gZWxzZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c194cy5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jCmluZGV4
IGRkYzE4ZGE2MTgzNC4uM2EwNmViNjk5ZjMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3hzLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jCkBAIC0x
OTEsOCArMTkxLDExIEBAIHN0YXRpYyBib29sIHhlbmJ1c19vayh2b2lkKQogCiBzdGF0aWMgYm9v
bCB0ZXN0X3JlcGx5KHN0cnVjdCB4Yl9yZXFfZGF0YSAqcmVxKQogewotCWlmIChyZXEtPnN0YXRl
ID09IHhiX3JlcV9zdGF0ZV9nb3RfcmVwbHkgfHwgIXhlbmJ1c19vaygpKQorCWlmIChyZXEtPnN0
YXRlID09IHhiX3JlcV9zdGF0ZV9nb3RfcmVwbHkgfHwgIXhlbmJ1c19vaygpKSB7CisJCS8qIHJl
YWQgcmVxLT5zdGF0ZSBiZWZvcmUgYWxsIG90aGVyIGZpZWxkcyAqLworCQl2aXJ0X3JtYigpOwog
CQlyZXR1cm4gdHJ1ZTsKKwl9CiAKIAkvKiBNYWtlIHN1cmUgdG8gcmVyZWFkIHJlcS0+c3RhdGUg
ZWFjaCB0aW1lLiAqLwogCWJhcnJpZXIoKTsKQEAgLTIwMiw3ICsyMDUsNyBAQCBzdGF0aWMgYm9v
bCB0ZXN0X3JlcGx5KHN0cnVjdCB4Yl9yZXFfZGF0YSAqcmVxKQogCiBzdGF0aWMgdm9pZCAqcmVh
ZF9yZXBseShzdHJ1Y3QgeGJfcmVxX2RhdGEgKnJlcSkKIHsKLQl3aGlsZSAocmVxLT5zdGF0ZSAh
PSB4Yl9yZXFfc3RhdGVfZ290X3JlcGx5KSB7CisJZG8gewogCQl3YWl0X2V2ZW50KHJlcS0+d3Es
IHRlc3RfcmVwbHkocmVxKSk7CiAKIAkJaWYgKCF4ZW5idXNfb2soKSkKQEAgLTIxNiw3ICsyMTks
NyBAQCBzdGF0aWMgdm9pZCAqcmVhZF9yZXBseShzdHJ1Y3QgeGJfcmVxX2RhdGEgKnJlcSkKIAkJ
aWYgKHJlcS0+ZXJyKQogCQkJcmV0dXJuIEVSUl9QVFIocmVxLT5lcnIpOwogCi0JfQorCX0gd2hp
bGUgKHJlcS0+c3RhdGUgIT0geGJfcmVxX3N0YXRlX2dvdF9yZXBseSk7CiAKIAlyZXR1cm4gcmVx
LT5ib2R5OwogfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
