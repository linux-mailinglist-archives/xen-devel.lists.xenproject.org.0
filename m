Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D269E317A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 13:52:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbcI-0001ym-O7; Thu, 24 Oct 2019 11:49:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hYBa=YR=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iNbcH-0001yg-K6
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 11:49:21 +0000
X-Inumbo-ID: 4ddee5da-f654-11e9-a531-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ddee5da-f654-11e9-a531-bc764e2007e4;
 Thu, 24 Oct 2019 11:49:16 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OBdBot022926;
 Thu, 24 Oct 2019 11:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=+83lcVguJyvnyafDeVP9ncl+WMvkJ+8ZOi3EzqtPjgg=;
 b=PpqDwkeJLhJ7Ingfq7KJFOlkrifCd+/mA6l8d9UJ1OOM/xI0iraz0D8SdpNPN0VdCxTa
 xoUl6oQNnxJdYQ69+qro0MemPKSRZLJesx7Mq3CCloJRBn2sbnhIdzna6ddDNltl/eEd
 gIV2KA9OKZ2qd8GcfHEZlEjZSmR+gY1DGF8oh+0JyDSUFLo00OhWzNVR4zz9m71jpbrn
 gvuccVAW7JjSwBDWewa7pc8WRmYf6Mk8W4x4j2UOeuAmTmp35PqTXSOdLXVQdw7IYPZR
 PRQqjrPEGuMAZnr6hVloS9IaWycgWbMs+G9wF9wPmSlHlB65eAxQT4kJRhZqbb8/+Tig ZQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2vqu4r2vjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 11:48:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9OBeE34147828;
 Thu, 24 Oct 2019 11:48:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2vtsk4kdhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 11:48:46 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9OBmc76019554;
 Thu, 24 Oct 2019 11:48:38 GMT
Received: from tomti.i.net-space.pl (/10.175.165.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Oct 2019 04:48:37 -0700
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Thu, 24 Oct 2019 13:48:11 +0200
Message-Id: <20191024114814.6488-1-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=663
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910240116
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=742 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910240116
Subject: [Xen-devel] [PATCH v4 0/3] x86/boot: Introduce the kernel_info et
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
