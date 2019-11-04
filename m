Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC60EE374
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:18:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRe5b-000681-78; Mon, 04 Nov 2019 15:16:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wy1X=Y4=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iRe5Z-00067o-Bd
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:16:17 +0000
X-Inumbo-ID: 0baa784e-ff16-11e9-a181-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0baa784e-ff16-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:16:16 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA4FCOqk018209;
 Mon, 4 Nov 2019 15:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2019-08-05;
 bh=4g6rIyW2HVYzag3aHGnsRCeX4Q0Rd09J0Dv6UEG9yS0=;
 b=V8Fupi4cyW56hfzBq+dFWXkR+05lvuQ6x9/a0+g9I8ubebW3pKJiavAWlsTXq2G/WN6W
 G6zey1A7vmiy9mi5M8t7DkxY5WwtOh8o3aP/6ahza+L6xn3VoYZ2xYeyvvGI1FuyrN4s
 PxQtjeTGkmVIgwgKEq3wauXdPDRKGQI862DU7GUfH+fba6/Owlh9eaGfS86+PeCvepDC
 BzqNHLQUJOYClCOUo4lIeMdL4DXaGKyCORwi3exKcuud5Pe0ju/EJ7nvUNUD7LG7HnPp
 Br8e6igUmYwf16GVU3AQI2N/3J3H1rXTGKIOPO1ytj0iXWFyexP5UQ87uPpvRueY+md1 4Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2w12eqyv4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2019 15:14:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA4FB3o2136319;
 Mon, 4 Nov 2019 15:14:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2w1k8uxuu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2019 15:14:30 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA4FEPcQ014465;
 Mon, 4 Nov 2019 15:14:26 GMT
Received: from tomti.i.net-space.pl (/10.175.168.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Nov 2019 07:14:25 -0800
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Mon,  4 Nov 2019 16:13:53 +0100
Message-Id: <20191104151354.28145-3-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191104151354.28145-1-daniel.kiper@oracle.com>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9431
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911040151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9431
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911040151
Subject: [Xen-devel] [PATCH v5 2/3] x86/boot: Introduce the
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
ClRoaXMgcGF0Y2ggZG9lcyBub3QgYnVtcCBzZXR1cF9oZWFkZXIgdmVyc2lvbiBpbiBhcmNoL3g4
Ni9ib290L2hlYWRlci5TCmJlY2F1c2UgaXQgd2lsbCBiZSBmb2xsb3dlZCBieSBhZGRpdGlvbmFs
IGNoYW5nZXMgY29taW5nIGludG8gdGhlCkxpbnV4L3g4NiBib290IHByb3RvY29sLgoKU3VnZ2Vz
dGVkLWJ5OiBILiBQZXRlciBBbnZpbiAoSW50ZWwpIDxocGFAenl0b3IuY29tPgpTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgS2lwZXIgPGRhbmllbC5raXBlckBvcmFjbGUuY29tPgpSZXZpZXdlZC1ieTog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpSZXZpZXdlZC1i
eTogUm9zcyBQaGlsaXBzb24gPHJvc3MucGhpbGlwc29uQG9yYWNsZS5jb20+ClJldmlld2VkLWJ5
OiBILiBQZXRlciBBbnZpbiAoSW50ZWwpIDxocGFAenl0b3IuY29tPgotLS0KdjUgLSBzdWdnZXN0
aW9ucy9maXhlczoKICAgLSBtb3ZlIGluY29ycmVjdCByZWZlcmVuY2VzIHRvIHRoZSBzZXR1cF9p
bmRpcmVjdCB0byB0aGUKICAgICBwYXRjaCBpbnRyb2R1Y2luZyBpdCwKICAgLSBkbyBub3QgYnVt
cCBzZXR1cF9oZWFkZXIgdmVyc2lvbiBpbiBhcmNoL3g4Ni9ib290L2hlYWRlci5TCiAgICAgKHN1
Z2dlc3RlZCBieSBILiBQZXRlciBBbnZpbikuCi0tLQogRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5y
c3QgICAgICAgICAgICAgfCA5ICsrKysrKysrLQogYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2tl
cm5lbF9pbmZvLlMgfCA1ICsrKysrCiBhcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJh
bS5oICB8IDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdCBiL0RvY3VtZW50
YXRpb24veDg2L2Jvb3QucnN0CmluZGV4IGM2MGZhZmRhOTQyNy4uMWRhZDZlZWU4YTVjIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3g4
Ni9ib290LnJzdApAQCAtNzMsNyArNzMsNyBAQCBQcm90b2NvbCAyLjE0OglCVVJOVCBCWSBJTkNP
UlJFQ1QgQ09NTUlUIGFlN2UxMjM4ZTY4ZjJhNDcyYTEyNTY3M2FiNTA2ZDQ5MTU4YzE4OAogCQko
eDg2L2Jvb3Q6IEFkZCBBQ1BJIFJTRFAgYWRkcmVzcyB0byBzZXR1cF9oZWFkZXIpCiAJCURPIE5P
VCBVU0UhISEgQVNTVU1FIFNBTUUgQVMgMi4xMy4KIAotUHJvdG9jb2wgMi4xNToJKEtlcm5lbCA1
LjUpIEFkZGVkIHRoZSBrZXJuZWxfaW5mby4KK1Byb3RvY29sIDIuMTU6CShLZXJuZWwgNS41KSBB
ZGRlZCB0aGUga2VybmVsX2luZm8gYW5kIGtlcm5lbF9pbmZvLnNldHVwX3R5cGVfbWF4LgogPT09
PT09PT09PT09PQk9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KIAogLi4gbm90ZTo6CkBAIC05ODEsNiArOTgxLDEzIEBAIE9mZnNldC9z
aXplOgkweDAwMDgvNAogICBUaGlzIGZpZWxkIGNvbnRhaW5zIHRoZSBzaXplIG9mIHRoZSBrZXJu
ZWxfaW5mbyBpbmNsdWRpbmcga2VybmVsX2luZm8uaGVhZGVyCiAgIGFuZCBrZXJuZWxfaW5mby5r
ZXJuZWxfaW5mb192YXJfbGVuX2RhdGEuCiAKKz09PT09PT09PT09PQk9PT09PT09PT09PT09PQor
RmllbGQgbmFtZToJc2V0dXBfdHlwZV9tYXgKK09mZnNldC9zaXplOgkweDAwMDgvNAorPT09PT09
PT09PT09CT09PT09PT09PT09PT09CisKKyAgVGhpcyBmaWVsZCBjb250YWlucyBtYXhpbWFsIGFs
bG93ZWQgdHlwZSBmb3Igc2V0dXBfZGF0YS4KKwogCiBUaGUgSW1hZ2UgQ2hlY2tzdW0KID09PT09
PT09PT09PT09PT09PQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5l
bF9pbmZvLlMgYi9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQva2VybmVsX2luZm8uUwppbmRleCA4
ZWE2ZjZlM2ZlZWYuLjAxOGRhY2JkNzUzZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvYm9vdC9jb21w
cmVzc2VkL2tlcm5lbF9pbmZvLlMKKysrIGIvYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5l
bF9pbmZvLlMKQEAgLTEsNSArMSw3IEBACiAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCAqLwogCisjaW5jbHVkZSA8YXNtL2Jvb3RwYXJhbS5oPgorCiAJLnNlY3Rpb24gIi5yb2Rh
dGEua2VybmVsX2luZm8iLCAiYSIKIAogCS5nbG9iYWwga2VybmVsX2luZm8KQEAgLTEyLDYgKzE0
LDkgQEAga2VybmVsX2luZm86CiAJLyogU2l6ZSB0b3RhbC4gKi8KIAkubG9uZwlrZXJuZWxfaW5m
b19lbmQgLSBrZXJuZWxfaW5mbwogCisJLyogTWF4aW1hbCBhbGxvd2VkIHR5cGUgZm9yIHNldHVw
X2RhdGEuICovCisJLmxvbmcJU0VUVVBfVFlQRV9NQVgKKwoga2VybmVsX2luZm9fdmFyX2xlbl9k
YXRhOgogCS8qIEVtcHR5IGZvciB0aW1lIGJlaW5nLi4uICovCiBrZXJuZWxfaW5mb19lbmQ6CmRp
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
