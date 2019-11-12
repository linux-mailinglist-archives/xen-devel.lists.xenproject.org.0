Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57CF9106
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 14:50:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUWXA-0004Hn-G2; Tue, 12 Nov 2019 13:48:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BqWi=ZE=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iUWX8-0004HU-9Q
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 13:48:38 +0000
X-Inumbo-ID: 203aaad4-0553-11ea-b678-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 203aaad4-0553-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 13:48:37 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACDijKZ003005;
 Tue, 12 Nov 2019 13:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2019-08-05;
 bh=LT6waPksh3tQZejaHtyZ9Sh8F/B1DIxRO+lN0Qg60bg=;
 b=U5CzJhNVxkjDDk9XrS5UmuNa4gBV/IaOFQeS7P0NHzHW85s4/fMLzs0wkWpEGddcfyPs
 5JoicCFPyXqY6BK9NtAWBij+8+S6YE4Q3RV+0m5DDitcecn/STp9DUqW/n2pYTUufCpE
 jtONmyD65oRI4AX8Thetzfi3wVN4OO0nL0e0Ig9bIDSWpQjV5fAsy2irYLqM9LyfHJRe
 0xjk0DIWq/VcH0O/PpywLsRpFPTLSm7CLeveu3CvD0CKxEKx+RVUtorw8dqC75QRBPcA
 7QoJK7c0HG8b4ARjv9yHYTWGnIwQDZz4aHCC4q59Ppmnpgs5AYu6ibgaQPmHTPoVfOWA QA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2w5mvtmvde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 13:47:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACDiCDQ124182;
 Tue, 12 Nov 2019 13:47:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2w7j00uar4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 13:47:05 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xACDl5n5020432;
 Tue, 12 Nov 2019 13:47:05 GMT
Received: from tomti.i.net-space.pl (/10.175.202.33)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 05:47:04 -0800
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Tue, 12 Nov 2019 14:46:39 +0100
Message-Id: <20191112134640.16035-3-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191112134640.16035-1-daniel.kiper@oracle.com>
References: <20191112134640.16035-1-daniel.kiper@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120124
Subject: [Xen-devel] [PATCH v6 2/3] x86/boot: Introduce the
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
CkRvIG5vdCBidW1wIHNldHVwX2hlYWRlciB2ZXJzaW9uIGluIGFyY2gveDg2L2Jvb3QvaGVhZGVy
LlMgYmVjYXVzZSBpdAp3aWxsIGJlIGZvbGxvd2VkIGJ5IGFkZGl0aW9uYWwgY2hhbmdlcyBjb21p
bmcgaW50byB0aGUgTGludXgveDg2IGJvb3QKcHJvdG9jb2wuCgpTdWdnZXN0ZWQtYnk6IEguIFBl
dGVyIEFudmluIChJbnRlbCkgPGhwYUB6eXRvci5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBL
aXBlciA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBSb3NzIFBoaWxp
cHNvbiA8cm9zcy5waGlsaXBzb25Ab3JhY2xlLmNvbT4KUmV2aWV3ZWQtYnk6IEguIFBldGVyIEFu
dmluIChJbnRlbCkgPGhwYUB6eXRvci5jb20+Ci0tLQp2NiAtIHN1Z2dlc3Rpb25zL2ZpeGVzOgog
ICAtIGZpeCBzZXR1cF90eXBlX21heCBvZmZzZXQgaW4gRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5y
c3QKICAgICAoc3VnZ2VzdGVkIGJ5IEJvcmlzbGF2IFBldGtvdiksCiAgIC0gZHJvcCAiVGhpcyBw
YXRjaCIgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2UKICAgICAoc3VnZ2VzdGVkIGJ5IEJvcmlzbGF2
IFBldGtvdikuCgp2NSAtIHN1Z2dlc3Rpb25zL2ZpeGVzOgogICAtIG1vdmUgaW5jb3JyZWN0IHJl
ZmVyZW5jZXMgdG8gdGhlIHNldHVwX2luZGlyZWN0IHRvIHRoZQogICAgIHBhdGNoIGludHJvZHVj
aW5nIGl0LAogICAtIGRvIG5vdCBidW1wIHNldHVwX2hlYWRlciB2ZXJzaW9uIGluIGFyY2gveDg2
L2Jvb3QvaGVhZGVyLlMKICAgICAoc3VnZ2VzdGVkIGJ5IEguIFBldGVyIEFudmluKS4KLS0tCiBE
b2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdCAgICAgICAgICAgICB8IDkgKysrKysrKystCiBhcmNo
L3g4Ni9ib290L2NvbXByZXNzZWQva2VybmVsX2luZm8uUyB8IDUgKysrKysKIGFyY2gveDg2L2lu
Y2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmggIHwgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
eDg2L2Jvb3QucnN0IGIvRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5yc3QKaW5kZXggYzYwZmFmZGE5
NDI3Li42Y2RkNzY3YzM4MzUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0
CisrKyBiL0RvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0CkBAIC03Myw3ICs3Myw3IEBAIFByb3Rv
Y29sIDIuMTQ6CUJVUk5UIEJZIElOQ09SUkVDVCBDT01NSVQgYWU3ZTEyMzhlNjhmMmE0NzJhMTI1
NjczYWI1MDZkNDkxNThjMTg4CiAJCSh4ODYvYm9vdDogQWRkIEFDUEkgUlNEUCBhZGRyZXNzIHRv
IHNldHVwX2hlYWRlcikKIAkJRE8gTk9UIFVTRSEhISBBU1NVTUUgU0FNRSBBUyAyLjEzLgogCi1Q
cm90b2NvbCAyLjE1OgkoS2VybmVsIDUuNSkgQWRkZWQgdGhlIGtlcm5lbF9pbmZvLgorUHJvdG9j
b2wgMi4xNToJKEtlcm5lbCA1LjUpIEFkZGVkIHRoZSBrZXJuZWxfaW5mbyBhbmQga2VybmVsX2lu
Zm8uc2V0dXBfdHlwZV9tYXguCiA9PT09PT09PT09PT09CT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQogCiAuLiBub3RlOjoKQEAgLTk4
MSw2ICs5ODEsMTMgQEAgT2Zmc2V0L3NpemU6CTB4MDAwOC80CiAgIFRoaXMgZmllbGQgY29udGFp
bnMgdGhlIHNpemUgb2YgdGhlIGtlcm5lbF9pbmZvIGluY2x1ZGluZyBrZXJuZWxfaW5mby5oZWFk
ZXIKICAgYW5kIGtlcm5lbF9pbmZvLmtlcm5lbF9pbmZvX3Zhcl9sZW5fZGF0YS4KIAorPT09PT09
PT09PT09CT09PT09PT09PT09PT09CitGaWVsZCBuYW1lOglzZXR1cF90eXBlX21heAorT2Zmc2V0
L3NpemU6CTB4MDAwYy80Cis9PT09PT09PT09PT0JPT09PT09PT09PT09PT0KKworICBUaGlzIGZp
ZWxkIGNvbnRhaW5zIG1heGltYWwgYWxsb3dlZCB0eXBlIGZvciBzZXR1cF9kYXRhLgorCiAKIFRo
ZSBJbWFnZSBDaGVja3N1bQogPT09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9ib290L2NvbXByZXNzZWQva2VybmVsX2luZm8uUyBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3Nl
ZC9rZXJuZWxfaW5mby5TCmluZGV4IDhlYTZmNmUzZmVlZi4uMDE4ZGFjYmQ3NTNlIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQva2VybmVsX2luZm8uUworKysgYi9hcmNoL3g4
Ni9ib290L2NvbXByZXNzZWQva2VybmVsX2luZm8uUwpAQCAtMSw1ICsxLDcgQEAKIC8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCiAKKyNpbmNsdWRlIDxhc20vYm9vdHBhcmFt
Lmg+CisKIAkuc2VjdGlvbiAiLnJvZGF0YS5rZXJuZWxfaW5mbyIsICJhIgogCiAJLmdsb2JhbCBr
ZXJuZWxfaW5mbwpAQCAtMTIsNiArMTQsOSBAQCBrZXJuZWxfaW5mbzoKIAkvKiBTaXplIHRvdGFs
LiAqLwogCS5sb25nCWtlcm5lbF9pbmZvX2VuZCAtIGtlcm5lbF9pbmZvCiAKKwkvKiBNYXhpbWFs
IGFsbG93ZWQgdHlwZSBmb3Igc2V0dXBfZGF0YS4gKi8KKwkubG9uZwlTRVRVUF9UWVBFX01BWAor
CiBrZXJuZWxfaW5mb192YXJfbGVuX2RhdGE6CiAJLyogRW1wdHkgZm9yIHRpbWUgYmVpbmcuLi4g
Ki8KIGtlcm5lbF9pbmZvX2VuZDoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9h
c20vYm9vdHBhcmFtLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oCmlu
ZGV4IGExZWJjZDdhOTkxYy4uZGJiNDExMjhlNWEwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNs
dWRlL3VhcGkvYXNtL2Jvb3RwYXJhbS5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20v
Ym9vdHBhcmFtLmgKQEAgLTExLDYgKzExLDkgQEAKICNkZWZpbmUgU0VUVVBfQVBQTEVfUFJPUEVS
VElFUwkJNQogI2RlZmluZSBTRVRVUF9KQUlMSE9VU0UJCQk2CiAKKy8qIG1heChTRVRVUF8qKSAq
LworI2RlZmluZSBTRVRVUF9UWVBFX01BWAkJCVNFVFVQX0pBSUxIT1VTRQorCiAvKiByYW1fc2l6
ZSBmbGFncyAqLwogI2RlZmluZSBSQU1ESVNLX0lNQUdFX1NUQVJUX01BU0sJMHgwN0ZGCiAjZGVm
aW5lIFJBTURJU0tfUFJPTVBUX0ZMQUcJCTB4ODAwMAotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
