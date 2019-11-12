Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F54F9102
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 14:49:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUWWF-00048E-OF; Tue, 12 Nov 2019 13:47:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BqWi=ZE=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iUWWE-000482-96
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 13:47:42 +0000
X-Inumbo-ID: fd692936-0552-11ea-a21c-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd692936-0552-11ea-a21c-12813bfff9fa;
 Tue, 12 Nov 2019 13:47:39 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACDimK6003260;
 Tue, 12 Nov 2019 13:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=sMMKPgpww4smX1YXtV6wvZBBiRbV6FeG/gIOCQT+ds0=;
 b=Bq6pJIEVs4RMpNnXnIBOggUpB4Pl+OJCfwsaO7OdULOY1eVaDRgmE4FttDhZAl2GFacg
 Jc5xudY3smfglUuw/njbjej9AVjqLt2Y9N7TKzdzczNr6CW7EocX6h0e//J3Pj27Lm05
 SbcaevEvvY1l5GUe796cnfT+9fhFKLKdUueVLLdw0ojx9iPLUJ2tum5VGUu5djZtUKrL
 9MupeomPWigh66UlhkInUrtyqKTUArrVvaC4BEbPfur+MfwYXWVuxbF+Ed7tU9wQy4vC
 oHcCCQb7+V4v4C8C1aDl1Sy36cz9HSL9FhfUob7U0bo3Pb+mcXeLSCTCa4zhKO6qjY4y IQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2w5mvtmvda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 13:47:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACDhMli076743;
 Tue, 12 Nov 2019 13:47:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2w7vbav1xw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 13:47:04 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xACDkuC7009057;
 Tue, 12 Nov 2019 13:46:58 GMT
Received: from tomti.i.net-space.pl (/10.175.202.33)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 05:46:56 -0800
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Tue, 12 Nov 2019 14:46:37 +0100
Message-Id: <20191112134640.16035-1-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=659
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=725 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120124
Subject: [Xen-devel] [PATCH v6 0/3] x86/boot: Introduce the kernel_info et
 consortes
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

SGksCgpEdWUgdG8gdmVyeSBsaW1pdGVkIHNwYWNlIGluIHRoZSBzZXR1cF9oZWFkZXIgdGhpcyBw
YXRjaCBzZXJpZXMgaW50cm9kdWNlcyBuZXcKa2VybmVsX2luZm8gc3RydWN0IHdoaWNoIHdpbGwg
YmUgdXNlZCB0byBjb252ZXkgaW5mb3JtYXRpb24gZnJvbSB0aGUga2VybmVsIHRvCnRoZSBib290
bG9hZGVyLiBUaGlzIHdheSB0aGUgYm9vdCBwcm90b2NvbCBjYW4gYmUgZXh0ZW5kZWQgcmVnYXJk
bGVzcyBvZiB0aGUKc2V0dXBfaGVhZGVyIGxpbWl0YXRpb25zLiBBZGRpdGlvbmFsbHksIHRoZSBw
YXRjaCBzZXJpZXMgaW50cm9kdWNlcyBzb21lCmNvbnZlbmllbmNlIGZlYXR1cmVzIGxpa2UgdGhl
IHNldHVwX2luZGlyZWN0IHN0cnVjdCBhbmQgdGhlCmtlcm5lbF9pbmZvLnNldHVwX3R5cGVfbWF4
IGZpZWxkLgoKRGFuaWVsCgogRG9jdW1lbnRhdGlvbi94ODYvYm9vdC5yc3QgICAgICAgICAgICAg
fCAxNzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3g4Ni9ib290L01ha2VmaWxlICAgICAg
ICAgICAgICAgICB8ICAgMiArLQogYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL01ha2VmaWxlICAg
ICAgfCAgIDQgKy0KIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rYXNsci5jICAgICAgIHwgIDEy
ICsrKysrKwogYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5lbF9pbmZvLlMgfCAgMjIgKysr
KysrKysrKwogYXJjaC94ODYvYm9vdC9oZWFkZXIuUyAgICAgICAgICAgICAgICAgfCAgIDMgKy0K
IGFyY2gveDg2L2Jvb3QvdG9vbHMvYnVpbGQuYyAgICAgICAgICAgIHwgICA1ICsrKwogYXJjaC94
ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFyYW0uaCAgfCAgMTYgKysrKysrKy0KIGFyY2gveDg2
L2tlcm5lbC9lODIwLmMgICAgICAgICAgICAgICAgIHwgIDExICsrKysrCiBhcmNoL3g4Ni9rZXJu
ZWwva2RlYnVnZnMuYyAgICAgICAgICAgICB8ICAyMSArKysrKysrKy0tCiBhcmNoL3g4Ni9rZXJu
ZWwva3N5c2ZzLmMgICAgICAgICAgICAgICB8ICAzMSArKysrKysrKysrLS0tLQogYXJjaC94ODYv
a2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICAgfCAgIDYgKysrCiBhcmNoL3g4Ni9tbS9pb3Jl
bWFwLmMgICAgICAgICAgICAgICAgICB8ICAxMSArKysrKwogMTMgZmlsZXMgY2hhbmdlZCwgMzAy
IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKRGFuaWVsIEtpcGVyICgzKToKICAgICAg
eDg2L2Jvb3Q6IEludHJvZHVjZSB0aGUga2VybmVsX2luZm8KICAgICAgeDg2L2Jvb3Q6IEludHJv
ZHVjZSB0aGUga2VybmVsX2luZm8uc2V0dXBfdHlwZV9tYXgKICAgICAgeDg2L2Jvb3Q6IEludHJv
ZHVjZSB0aGUgc2V0dXBfaW5kaXJlY3QKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
