Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F12E3176
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 13:51:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbcE-0001y8-Br; Thu, 24 Oct 2019 11:49:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hYBa=YR=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iNbcC-0001y3-MN
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 11:49:16 +0000
X-Inumbo-ID: 4d94d77e-f654-11e9-bbab-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d94d77e-f654-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 11:49:15 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OBdxUn027790;
 Thu, 24 Oct 2019 11:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2019-08-05;
 bh=z13BAF6ghH9YJkJPP/cOfQet3c3eWcpMKhNqVJkkLRM=;
 b=bWrkHXfqnm9iQapN5MJCYi1RPzf0CfNulUZ4eLSmNGn83Pg/jE/OBDfrGJWsbm0hvQfi
 qj9hwLqAKRC/OlqQ8JffjEb5wsFJF41FWAjXSwr29vDXHJ2fUIITjsjHOfCzNqnUFBGY
 EShZtABmBBD0CyQtpyXpOUFQHzNJLQhXXFFqwzYMjUM0UzMkcy4fbccV2+mGsN2DFFBm
 DVXnJUPgN+MQglCoq9T3j+lKkXqOtuiIfE/i9gBKrfoFX2vSxNzp6ctnS3gSB8cgrZSW
 8U6m8nMA6o9Bn8Lm6LjD71b+43h6k7k4vB/xq5UDMgv5Skn08Rq+UmvWNjgnP2A4L33o Jw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2vqteq323h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 11:48:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OBdDSh050160;
 Thu, 24 Oct 2019 11:48:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2vtjkjcsf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 11:48:47 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9OBmjeO010783;
 Thu, 24 Oct 2019 11:48:46 GMT
Received: from tomti.i.net-space.pl (/10.175.165.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Oct 2019 04:48:45 -0700
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Thu, 24 Oct 2019 13:48:13 +0200
Message-Id: <20191024114814.6488-3-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191024114814.6488-1-daniel.kiper@oracle.com>
References: <20191024114814.6488-1-daniel.kiper@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910240116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910240116
Subject: [Xen-devel] [PATCH v4 2/3] x86/boot: Introduce the
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
 bp@alien8.de, rdunlap@infradead.org, luto@kernel.org, hpa@zytor.com,
 kanth.ghatraju@oracle.com, boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmaWVsZCBjb250YWlucyBtYXhpbWFsIGFsbG93ZWQgdHlwZSBmb3Igc2V0dXBfZGF0YS4K
Ck5vdyBidW1wIHRoZSBzZXR1cF9oZWFkZXIgdmVyc2lvbiBpbiBhcmNoL3g4Ni9ib290L2hlYWRl
ci5TLgoKU3VnZ2VzdGVkLWJ5OiBILiBQZXRlciBBbnZpbiAoSW50ZWwpIDxocGFAenl0b3IuY29t
PgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgS2lwZXIgPGRhbmllbC5raXBlckBvcmFjbGUuY29tPgpS
ZXZpZXdlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PgpSZXZpZXdlZC1ieTogUm9zcyBQaGlsaXBzb24gPHJvc3MucGhpbGlwc29uQG9yYWNsZS5jb20+
ClJldmlld2VkLWJ5OiBILiBQZXRlciBBbnZpbiAoSW50ZWwpIDxocGFAenl0b3IuY29tPgotLS0K
IERvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0ICAgICAgICAgICAgIHwgOSArKysrKysrKy0KIGFy
Y2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TIHwgNSArKysrKwogYXJjaC94ODYv
Ym9vdC9oZWFkZXIuUyAgICAgICAgICAgICAgICAgfCAyICstCiBhcmNoL3g4Ni9pbmNsdWRlL3Vh
cGkvYXNtL2Jvb3RwYXJhbS5oICB8IDMgKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi94ODYvYm9v
dC5yc3QgYi9Eb2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdAppbmRleCBjNjBmYWZkYTk0MjcuLjhl
NTIzYzIzZWRlMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5yc3QKKysrIGIv
RG9jdW1lbnRhdGlvbi94ODYvYm9vdC5yc3QKQEAgLTczLDcgKzczLDcgQEAgUHJvdG9jb2wgMi4x
NDoJQlVSTlQgQlkgSU5DT1JSRUNUIENPTU1JVCBhZTdlMTIzOGU2OGYyYTQ3MmExMjU2NzNhYjUw
NmQ0OTE1OGMxODgKIAkJKHg4Ni9ib290OiBBZGQgQUNQSSBSU0RQIGFkZHJlc3MgdG8gc2V0dXBf
aGVhZGVyKQogCQlETyBOT1QgVVNFISEhIEFTU1VNRSBTQU1FIEFTIDIuMTMuCiAKLVByb3RvY29s
IDIuMTU6CShLZXJuZWwgNS41KSBBZGRlZCB0aGUga2VybmVsX2luZm8uCitQcm90b2NvbCAyLjE1
OgkoS2VybmVsIDUuNSkgQWRkZWQgdGhlIGtlcm5lbF9pbmZvIGFuZCBrZXJuZWxfaW5mby5zZXR1
cF90eXBlX21heC4KID09PT09PT09PT09PT0JPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKIC4uIG5vdGU6OgpAQCAtOTgxLDYgKzk4
MSwxMyBAQCBPZmZzZXQvc2l6ZToJMHgwMDA4LzQKICAgVGhpcyBmaWVsZCBjb250YWlucyB0aGUg
c2l6ZSBvZiB0aGUga2VybmVsX2luZm8gaW5jbHVkaW5nIGtlcm5lbF9pbmZvLmhlYWRlcgogICBh
bmQga2VybmVsX2luZm8ua2VybmVsX2luZm9fdmFyX2xlbl9kYXRhLgogCis9PT09PT09PT09PT0J
PT09PT09PT09PT09PT0KK0ZpZWxkIG5hbWU6CXNldHVwX3R5cGVfbWF4CitPZmZzZXQvc2l6ZToJ
MHgwMDA4LzQKKz09PT09PT09PT09PQk9PT09PT09PT09PT09PQorCisgIFRoaXMgZmllbGQgY29u
dGFpbnMgbWF4aW1hbCBhbGxvd2VkIHR5cGUgZm9yIHNldHVwX2RhdGEgYW5kIHNldHVwX2luZGly
ZWN0IHN0cnVjdHMuCisKIAogVGhlIEltYWdlIENoZWNrc3VtCiA9PT09PT09PT09PT09PT09PT0K
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TIGIvYXJj
aC94ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5lbF9pbmZvLlMKaW5kZXggOGVhNmY2ZTNmZWVmLi5m
ODE4ZWU4ZmJhMzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxf
aW5mby5TCisrKyBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rZXJuZWxfaW5mby5TCkBAIC0x
LDUgKzEsNyBAQAogLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KIAorI2lu
Y2x1ZGUgPGFzbS9ib290cGFyYW0uaD4KKwogCS5zZWN0aW9uICIucm9kYXRhLmtlcm5lbF9pbmZv
IiwgImEiCiAKIAkuZ2xvYmFsIGtlcm5lbF9pbmZvCkBAIC0xMiw2ICsxNCw5IEBAIGtlcm5lbF9p
bmZvOgogCS8qIFNpemUgdG90YWwuICovCiAJLmxvbmcJa2VybmVsX2luZm9fZW5kIC0ga2VybmVs
X2luZm8KIAorCS8qIE1heGltYWwgYWxsb3dlZCB0eXBlIGZvciBzZXR1cF9kYXRhIGFuZCBzZXR1
cF9pbmRpcmVjdCBzdHJ1Y3RzLiAqLworCS5sb25nCVNFVFVQX1RZUEVfTUFYCisKIGtlcm5lbF9p
bmZvX3Zhcl9sZW5fZGF0YToKIAkvKiBFbXB0eSBmb3IgdGltZSBiZWluZy4uLiAqLwoga2VybmVs
X2luZm9fZW5kOgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvYm9vdC9oZWFkZXIuUyBiL2FyY2gveDg2
L2Jvb3QvaGVhZGVyLlMKaW5kZXggMjJkY2VjYWFhODk4Li45N2Q5YjZkNmMxYWYgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2Jvb3QvaGVhZGVyLlMKKysrIGIvYXJjaC94ODYvYm9vdC9oZWFkZXIuUwpA
QCAtMzAwLDcgKzMwMCw3IEBAIF9zdGFydDoKIAkjIFBhcnQgMiBvZiB0aGUgaGVhZGVyLCBmcm9t
IHRoZSBvbGQgc2V0dXAuUwogCiAJCS5hc2NpaQkiSGRyUyIJCSMgaGVhZGVyIHNpZ25hdHVyZQot
CQkud29yZAkweDAyMGQJCSMgaGVhZGVyIHZlcnNpb24gbnVtYmVyICg+PSAweDAxMDUpCisJCS53
b3JkCTB4MDIwZgkJIyBoZWFkZXIgdmVyc2lvbiBudW1iZXIgKD49IDB4MDEwNSkKIAkJCQkJIyBv
ciBlbHNlIG9sZCBsb2FkbGluLTEuNSB3aWxsIGZhaWwpCiAJCS5nbG9ibCByZWFsbW9kZV9zd3Rj
aAogcmVhbG1vZGVfc3d0Y2g6CS53b3JkCTAsIDAJCSMgZGVmYXVsdF9zd2l0Y2gsIFNFVFVQU0VH
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oIGIvYXJj
aC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFyYW0uaAppbmRleCBhMWViY2Q3YTk5MWMuLmRi
YjQxMTI4ZTVhMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFy
YW0uaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oCkBAIC0xMSw2
ICsxMSw5IEBACiAjZGVmaW5lIFNFVFVQX0FQUExFX1BST1BFUlRJRVMJCTUKICNkZWZpbmUgU0VU
VVBfSkFJTEhPVVNFCQkJNgogCisvKiBtYXgoU0VUVVBfKikgKi8KKyNkZWZpbmUgU0VUVVBfVFlQ
RV9NQVgJCQlTRVRVUF9KQUlMSE9VU0UKKwogLyogcmFtX3NpemUgZmxhZ3MgKi8KICNkZWZpbmUg
UkFNRElTS19JTUFHRV9TVEFSVF9NQVNLCTB4MDdGRgogI2RlZmluZSBSQU1ESVNLX1BST01QVF9G
TEFHCQkweDgwMDAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
