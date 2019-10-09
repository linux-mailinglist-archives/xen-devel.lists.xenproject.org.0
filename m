Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9620D0D4E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:58:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9cO-0004ak-HK; Wed, 09 Oct 2019 10:54:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DL70=YC=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iI9cM-0004af-Rl
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:54:54 +0000
X-Inumbo-ID: 397db9cc-ea83-11e9-80e3-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 397db9cc-ea83-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 10:54:54 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99AnjSO040844;
 Wed, 9 Oct 2019 10:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2019-08-05;
 bh=D1DI7s8LFQ5/QtMZA4sUUJEJOvqF3NRZbFcaYtB93A0=;
 b=fA8MVhIcTxHSUNaf18CxFk+ddGB/CrPPI8kjZjxTa/QYiZXAb1Ct3G+ctvV0FvIBmYol
 RHiqFAYimxe9YvNkmCpA7ZeEUNh78cV3Hh3jxh8zWpUJUtpWhxauzLnULS909JZTW2TS
 C7VAlmt3nE86jazen8bPdg3YNKiE5/cVPVYeoE9Isba0fNE9bkcVsQ3ZP3/H1Wwwhrfd
 5t+l9Xldgcs2NXnAa23xbSqOmc3O8h8aQU94Ia7jsJm7UTqpJYxb5fFJNtcai2OOZWw/
 L4Ivw7w2u273SMDa0JO8UJLkzgC/bsf+KCMkY+Y+MVsK18r5qZXK0kHoM1/1vwS/O/52 NQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2vek4qka7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2019 10:54:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99AmsxB119322;
 Wed, 9 Oct 2019 10:54:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2vh8k0hgam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2019 10:54:25 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x99AsOhm031195;
 Wed, 9 Oct 2019 10:54:25 GMT
Received: from tomti.i.net-space.pl (/10.175.167.68)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Oct 2019 03:54:24 -0700
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 12:53:57 +0200
Message-Id: <20191009105358.32256-3-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191009105358.32256-1-daniel.kiper@oracle.com>
References: <20191009105358.32256-1-daniel.kiper@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9404
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910090101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9404
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910090101
Subject: [Xen-devel] [PATCH v3 2/3] x86/boot: Introduce the
 kernel_info.setup_type_max
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
Cc: jgross@suse.com, eric.snowberg@oracle.com, ard.biesheuvel@linaro.org,
 konrad.wilk@oracle.com, corbet@lwn.net, peterz@infradead.org,
 ross.philipson@oracle.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 bp@alien8.de, luto@kernel.org, hpa@zytor.com, boris.ostrovsky@oracle.com,
 tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmaWVsZCBjb250YWlucyBtYXhpbWFsIGFsbG93ZWQgdHlwZSBmb3Igc2V0dXBfZGF0YS4K
Ck5vdyBidW1wIHRoZSBzZXR1cF9oZWFkZXIgdmVyc2lvbiBpbiBhcmNoL3g4Ni9ib290L2hlYWRl
ci5TLgoKU3VnZ2VzdGVkLWJ5OiBILiBQZXRlciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4KU2lnbmVk
LW9mZi1ieTogRGFuaWVsIEtpcGVyIDxkYW5pZWwua2lwZXJAb3JhY2xlLmNvbT4KUmV2aWV3ZWQt
Ynk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KUmV2aWV3
ZWQtYnk6IFJvc3MgUGhpbGlwc29uIDxyb3NzLnBoaWxpcHNvbkBvcmFjbGUuY29tPgotLS0KIERv
Y3VtZW50YXRpb24veDg2L2Jvb3QucnN0ICAgICAgICAgICAgIHwgOSArKysrKysrKy0KIGFyY2gv
eDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TIHwgNSArKysrKwogYXJjaC94ODYvYm9v
dC9oZWFkZXIuUyAgICAgICAgICAgICAgICAgfCAyICstCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkv
YXNtL2Jvb3RwYXJhbS5oICB8IDMgKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5y
c3QgYi9Eb2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdAppbmRleCBkNTMyM2EzOWY1ZTMuLjRjNTM2
YmM4ODE2ZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi94ODYvYm9vdC5yc3QKQEAgLTczLDcgKzczLDcgQEAgUHJvdG9jb2wgMi4xNDoJ
QlVSTlQgQlkgSU5DT1JSRUNUIENPTU1JVCBhZTdlMTIzOGU2OGYyYTQ3MmExMjU2NzNhYjUwNmQ0
OTE1OGMxODgKIAkJKHg4Ni9ib290OiBBZGQgQUNQSSBSU0RQIGFkZHJlc3MgdG8gc2V0dXBfaGVh
ZGVyKQogCQlETyBOT1QgVVNFISEhIEFTU1VNRSBTQU1FIEFTIDIuMTMuCiAKLVByb3RvY29sIDIu
MTU6CShLZXJuZWwgNS41KSBBZGRlZCB0aGUga2VybmVsX2luZm8uCitQcm90b2NvbCAyLjE1Ogko
S2VybmVsIDUuNSkgQWRkZWQgdGhlIGtlcm5lbF9pbmZvIGFuZCBrZXJuZWxfaW5mby5zZXR1cF90
eXBlX21heC4KID09PT09PT09PT09PT0JPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKIC4uIG5vdGU6OgpAQCAtOTc2LDYgKzk3Niwx
MyBAQCBPZmZzZXQvc2l6ZToJMHgwMDA4LzQKICAgVGhpcyBmaWVsZCBjb250YWlucyB0aGUgc2l6
ZSBvZiB0aGUga2VybmVsX2luZm8gaW5jbHVkaW5nIGtlcm5lbF9pbmZvLmhlYWRlcgogICBhbmQg
a2VybmVsX2luZm8ua2VybmVsX2luZm9fdmFyX2xlbl9kYXRhLgogCis9PT09PT09PT09PT0JPT09
PT09PT09PT09PT0KK0ZpZWxkIG5hbWU6CXNldHVwX3R5cGVfbWF4CitPZmZzZXQvc2l6ZToJMHgw
MDA4LzQKKz09PT09PT09PT09PQk9PT09PT09PT09PT09PQorCisgIFRoaXMgZmllbGQgY29udGFp
bnMgbWF4aW1hbCBhbGxvd2VkIHR5cGUgZm9yIHNldHVwX2RhdGEgYW5kIHNldHVwX2luZGlyZWN0
IHN0cnVjdHMuCisKIAogVGhlIEltYWdlIENoZWNrc3VtCiA9PT09PT09PT09PT09PT09PT0KZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TIGIvYXJjaC94
ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5lbF9pbmZvLlMKaW5kZXggOGVhNmY2ZTNmZWVmLi5mODE4
ZWU4ZmJhMzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5m
by5TCisrKyBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TCkBAIC0xLDUg
KzEsNyBAQAogLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KIAorI2luY2x1
ZGUgPGFzbS9ib290cGFyYW0uaD4KKwogCS5zZWN0aW9uICIucm9kYXRhLmtlcm5lbF9pbmZvIiwg
ImEiCiAKIAkuZ2xvYmFsIGtlcm5lbF9pbmZvCkBAIC0xMiw2ICsxNCw5IEBAIGtlcm5lbF9pbmZv
OgogCS8qIFNpemUgdG90YWwuICovCiAJLmxvbmcJa2VybmVsX2luZm9fZW5kIC0ga2VybmVsX2lu
Zm8KIAorCS8qIE1heGltYWwgYWxsb3dlZCB0eXBlIGZvciBzZXR1cF9kYXRhIGFuZCBzZXR1cF9p
bmRpcmVjdCBzdHJ1Y3RzLiAqLworCS5sb25nCVNFVFVQX1RZUEVfTUFYCisKIGtlcm5lbF9pbmZv
X3Zhcl9sZW5fZGF0YToKIAkvKiBFbXB0eSBmb3IgdGltZSBiZWluZy4uLiAqLwoga2VybmVsX2lu
Zm9fZW5kOgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvYm9vdC9oZWFkZXIuUyBiL2FyY2gveDg2L2Jv
b3QvaGVhZGVyLlMKaW5kZXggMjJkY2VjYWFhODk4Li45N2Q5YjZkNmMxYWYgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2Jvb3QvaGVhZGVyLlMKKysrIGIvYXJjaC94ODYvYm9vdC9oZWFkZXIuUwpAQCAt
MzAwLDcgKzMwMCw3IEBAIF9zdGFydDoKIAkjIFBhcnQgMiBvZiB0aGUgaGVhZGVyLCBmcm9tIHRo
ZSBvbGQgc2V0dXAuUwogCiAJCS5hc2NpaQkiSGRyUyIJCSMgaGVhZGVyIHNpZ25hdHVyZQotCQku
d29yZAkweDAyMGQJCSMgaGVhZGVyIHZlcnNpb24gbnVtYmVyICg+PSAweDAxMDUpCisJCS53b3Jk
CTB4MDIwZgkJIyBoZWFkZXIgdmVyc2lvbiBudW1iZXIgKD49IDB4MDEwNSkKIAkJCQkJIyBvciBl
bHNlIG9sZCBsb2FkbGluLTEuNSB3aWxsIGZhaWwpCiAJCS5nbG9ibCByZWFsbW9kZV9zd3RjaAog
cmVhbG1vZGVfc3d0Y2g6CS53b3JkCTAsIDAJCSMgZGVmYXVsdF9zd2l0Y2gsIFNFVFVQU0VHCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oIGIvYXJjaC94
ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFyYW0uaAppbmRleCBhMWViY2Q3YTk5MWMuLmRiYjQx
MTI4ZTVhMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFyYW0u
aAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oCkBAIC0xMSw2ICsx
MSw5IEBACiAjZGVmaW5lIFNFVFVQX0FQUExFX1BST1BFUlRJRVMJCTUKICNkZWZpbmUgU0VUVVBf
SkFJTEhPVVNFCQkJNgogCisvKiBtYXgoU0VUVVBfKikgKi8KKyNkZWZpbmUgU0VUVVBfVFlQRV9N
QVgJCQlTRVRVUF9KQUlMSE9VU0UKKwogLyogcmFtX3NpemUgZmxhZ3MgKi8KICNkZWZpbmUgUkFN
RElTS19JTUFHRV9TVEFSVF9NQVNLCTB4MDdGRgogI2RlZmluZSBSQU1ESVNLX1BST01QVF9GTEFH
CQkweDgwMDAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
