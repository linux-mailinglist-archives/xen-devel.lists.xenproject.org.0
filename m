Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A462FEE383
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:19:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRe6L-0006G3-LM; Mon, 04 Nov 2019 15:17:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wy1X=Y4=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iRe6J-0006Fo-LN
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:17:03 +0000
X-Inumbo-ID: 2598c29c-ff16-11e9-a181-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2598c29c-ff16-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:17:00 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA4FCH2q032157;
 Mon, 4 Nov 2019 15:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=+83lcVguJyvnyafDeVP9ncl+WMvkJ+8ZOi3EzqtPjgg=;
 b=ILq4JoZ91xi0X3BXYbFx3Jh8Aov5v6iXEjEc8SDZw/oOBGdKSX//iFs7g5bXLcofHE+j
 0vEJXr3MXBR+RsxU1IHBhSehGzuhhZhGkQ05jap4OVRaCocR7O96nIop/p4fI11n0+Nb
 QKysaIwRZnn58e6Fh/GR4foux9BMiMMqHGZTXLiNqmAI4SgNZUxyWNkgxahaHDs+1x21
 iJjsxkaWE7GsYTMp7/OStbWM8FMZCyBk68WXMEZxPH173hsbVjnuRG2fyEXlseydpbu6
 Tos8URXi3eSie9mw/WGIlY7CEWPRyqcwu3/3OMb1ngMxtu52S/NbipUYBE4zleispc7n LQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2w11rpr139-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2019 15:14:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA4FB2JA136281;
 Mon, 4 Nov 2019 15:14:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2w1k8uxutt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2019 15:14:30 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA4FEKf4002177;
 Mon, 4 Nov 2019 15:14:25 GMT
Received: from tomti.i.net-space.pl (/10.175.168.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Nov 2019 07:14:16 -0800
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Mon,  4 Nov 2019 16:13:51 +0100
Message-Id: <20191104151354.28145-1-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9431
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=663
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911040151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9431
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=742 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911040151
Subject: [Xen-devel] [PATCH v5 0/3] x86/boot: Introduce the kernel_info et
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
ZWwva2RlYnVnZnMuYyAgICAgICAgICAgICB8ICAyMCArKysrKysrLS0KIGFyY2gveDg2L2tlcm5l
bC9rc3lzZnMuYyAgICAgICAgICAgICAgIHwgIDMwICsrKysrKysrKystLS0tCiBhcmNoL3g4Ni9r
ZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAgICB8ICAgNCArKwogYXJjaC94ODYvbW0vaW9yZW1h
cC5jICAgICAgICAgICAgICAgICAgfCAgMTEgKysrKysKIDEzIGZpbGVzIGNoYW5nZWQsIDI5OCBp
bnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCkRhbmllbCBLaXBlciAoMyk6CiAgICAgIHg4
Ni9ib290OiBJbnRyb2R1Y2UgdGhlIGtlcm5lbF9pbmZvCiAgICAgIHg4Ni9ib290OiBJbnRyb2R1
Y2UgdGhlIGtlcm5lbF9pbmZvLnNldHVwX3R5cGVfbWF4CiAgICAgIHg4Ni9ib290OiBJbnRyb2R1
Y2UgdGhlIHNldHVwX2luZGlyZWN0CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
