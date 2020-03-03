Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC2178092
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 20:00:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9CjB-0007pg-7W; Tue, 03 Mar 2020 18:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8H3=4U=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1j9Cj9-0007pW-3Y
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 18:57:11 +0000
X-Inumbo-ID: c91945f4-5d80-11ea-94a0-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c91945f4-5d80-11ea-94a0-bc764e2007e4;
 Tue, 03 Mar 2020 18:57:10 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023Ir0Xi187016;
 Tue, 3 Mar 2020 18:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=To/HLjUYEZTWO743zz0YfxZ/TOEA4AfwhsEsN360nNs=;
 b=mrXy5wOeWLiDAiGG5U2dNrZyyOYOJeG3ll/DDA+MOGlF2y7Wr6pefmG5MQryMFraVv8K
 BAU9t1fHnAPWLhOGM3lnFcc7gK1WoMpqtyHH1NgZzqJebzWRDvnWkQg8FlSLUjiAfBCG
 w48QTNCoKaX+WeY3PEY+Ob0CLVgYqqriMCT1FofLkBC6L3nwUdwe2fltWoszRyPmLk7b
 KepjXl4AqXVHCwfoyrbValQfl3ircjla3GWJhr8OXcdTqcBDtF/W4Q7+7F4XDY7Hj8F3
 ZIWUX2owcd/AWnCoEknoDz5rEPcK+vjl6LFvEXiYfgN7HYtmEBlrlkwkv1EC1hUpcqIY 8Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2yghn354b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 18:57:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023IqdlF108404;
 Tue, 3 Mar 2020 18:57:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2yg1emfmd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Mar 2020 18:57:08 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 023Iv6HI007887;
 Tue, 3 Mar 2020 18:57:06 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Mar 2020 10:57:06 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Date: Tue,  3 Mar 2020 10:47:51 -0800
Message-Id: <20200303184752.20821-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9549
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030124
Subject: [Xen-devel] [PATCH v2 1/2] xenbus: req->body should be updated
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
MTA6X3BhcnNlX2ludGVnZXJfZml4dXBfcmFkaXgrMHg2LzB4NjAKClRoZSBiYXJyaWVyKCkgaW4g
dGVzdF9yZXBseSgpIGlzIGNoYW5nZWQgdG8gdmlydF9ybWIoKS4gVGhlICJ3aGlsZSIgaXMKY2hh
bmdlZCB0byAiZG8gd2hpbGUiIHNvIHRoYXQgdGVzdF9yZXBseSgpIGlzIHVzZWQgYXMgYSByZWFk
IG1lbW9yeQpiYXJyaWVyLgoKU2lnbmVkLW9mZi1ieTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhh
bmdAb3JhY2xlLmNvbT4KLS0tCkNoYW5nZWQgc2luY2UgdjE6CiAgLSBjaGFuZ2UgImJhcnJpZXIo
KSIgdG8gInZpcnRfcm1iKCkiIGluIHRlc3RfcmVwbHkoKQoKIGRyaXZlcnMveGVuL3hlbmJ1cy94
ZW5idXNfY29tbXMuYyB8ICAyICsrCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3hzLmMgICAg
fCAxMSArKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5j
IGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jCmluZGV4IGQyMzlmYzNjNWUzZC4u
ODUyZWQxNjFmYzJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX2NvbW1z
LmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19jb21tcy5jCkBAIC0zMTMsNiArMzEz
LDggQEAgc3RhdGljIGludCBwcm9jZXNzX21zZyh2b2lkKQogCQkJcmVxLT5tc2cudHlwZSA9IHN0
YXRlLm1zZy50eXBlOwogCQkJcmVxLT5tc2cubGVuID0gc3RhdGUubXNnLmxlbjsKIAkJCXJlcS0+
Ym9keSA9IHN0YXRlLmJvZHk7CisJCQkvKiB3cml0ZSBib2R5LCB0aGVuIHVwZGF0ZSBzdGF0ZSAq
LworCQkJdmlydF93bWIoKTsKIAkJCXJlcS0+c3RhdGUgPSB4Yl9yZXFfc3RhdGVfZ290X3JlcGx5
OwogCQkJcmVxLT5jYihyZXEpOwogCQl9IGVsc2UKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfeHMuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYwppbmRleCBk
ZGMxOGRhNjE4MzQuLjFlMTRjMjExODg2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4veGVuYnVz
L3hlbmJ1c194cy5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYwpAQCAtMTk0
LDE1ICsxOTQsMTggQEAgc3RhdGljIGJvb2wgdGVzdF9yZXBseShzdHJ1Y3QgeGJfcmVxX2RhdGEg
KnJlcSkKIAlpZiAocmVxLT5zdGF0ZSA9PSB4Yl9yZXFfc3RhdGVfZ290X3JlcGx5IHx8ICF4ZW5i
dXNfb2soKSkKIAkJcmV0dXJuIHRydWU7CiAKLQkvKiBNYWtlIHN1cmUgdG8gcmVyZWFkIHJlcS0+
c3RhdGUgZWFjaCB0aW1lLiAqLwotCWJhcnJpZXIoKTsKKwkvKgorCSAqIHJlYWQgcmVxLT5zdGF0
ZSBiZWZvcmUgb3RoZXIgZmllbGRzIG9mIHN0cnVjdCB4Yl9yZXFfZGF0YQorCSAqIGluIHRoZSBj
YWxsZXIgb2YgdGVzdF9yZXBseSgpLCBlLmcuLCByZWFkX3JlcGx5KCkKKwkgKi8KKwl2aXJ0X3Jt
YigpOwogCiAJcmV0dXJuIGZhbHNlOwogfQogCiBzdGF0aWMgdm9pZCAqcmVhZF9yZXBseShzdHJ1
Y3QgeGJfcmVxX2RhdGEgKnJlcSkKIHsKLQl3aGlsZSAocmVxLT5zdGF0ZSAhPSB4Yl9yZXFfc3Rh
dGVfZ290X3JlcGx5KSB7CisJZG8gewogCQl3YWl0X2V2ZW50KHJlcS0+d3EsIHRlc3RfcmVwbHko
cmVxKSk7CiAKIAkJaWYgKCF4ZW5idXNfb2soKSkKQEAgLTIxNiw3ICsyMTksNyBAQCBzdGF0aWMg
dm9pZCAqcmVhZF9yZXBseShzdHJ1Y3QgeGJfcmVxX2RhdGEgKnJlcSkKIAkJaWYgKHJlcS0+ZXJy
KQogCQkJcmV0dXJuIEVSUl9QVFIocmVxLT5lcnIpOwogCi0JfQorCX0gd2hpbGUgKHJlcS0+c3Rh
dGUgIT0geGJfcmVxX3N0YXRlX2dvdF9yZXBseSk7CiAKIAlyZXR1cm4gcmVxLT5ib2R5OwogfQot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
