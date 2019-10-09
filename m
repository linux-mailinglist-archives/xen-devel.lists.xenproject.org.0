Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343EFD0D4C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:57:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9cc-0004f8-Q1; Wed, 09 Oct 2019 10:55:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DL70=YC=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iI9cb-0004ej-HA
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:55:09 +0000
X-Inumbo-ID: 38f19b04-ea83-11e9-97ed-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38f19b04-ea83-11e9-97ed-12813bfff9fa;
 Wed, 09 Oct 2019 10:54:53 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99An3EM076380;
 Wed, 9 Oct 2019 10:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=M33GVO9Y3jme01jHHD3zcMXHqJ6aM2z9oePhh2hkmuM=;
 b=qqpha/Te0Pky6KVXQk6AfDXZU2rXagKbsGeiW09MRWld8zjLm9/Ca+V9NZIcRUTcP1Hp
 w/n76C552Hetap0fxKNnEQ9LoesxXYBtHMlazkm5/rKaq8t+L67kAFN8CLu6yeVTWF0s
 wyiJP5m6Bqi94EcYz3RRLU2ytkAMDkl8YB0uNEe2vIYai8pcGNSnD+gpdHHpH6vRxPCs
 eSQmKOJRg8QQNG+Y/UYNW30dTChC2GdjjKcrtFeM7JLrbudajEHPoMJCfB5LpJeYwKZ4
 FnUtQeYQkIpc4mTqkcxGD99Qz2QUOihkg5ZrrxY/v2c3vHt+xJIyNEqNfjvvzTUSaKIn +w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2vejkukb03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2019 10:54:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x99AmbN2162723;
 Wed, 9 Oct 2019 10:54:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2vh5caap72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Oct 2019 10:54:24 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x99AsHxQ031048;
 Wed, 9 Oct 2019 10:54:19 GMT
Received: from tomti.i.net-space.pl (/10.175.167.68)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Oct 2019 03:54:16 -0700
From: Daniel Kiper <daniel.kiper@oracle.com>
To: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 12:53:55 +0200
Message-Id: <20191009105358.32256-1-daniel.kiper@oracle.com>
X-Mailer: git-send-email 2.11.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9404
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=672
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910090101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9404
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=747 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910090101
Subject: [Xen-devel] [PATCH v3 0/3] x86/boot: Introduce the kernel_info et
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
 bp@alien8.de, luto@kernel.org, hpa@zytor.com, boris.ostrovsky@oracle.com,
 tglx@linutronix.de
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
fCAxNjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3g4Ni9ib290L01ha2VmaWxlICAgICAg
ICAgICAgICAgICB8ICAgMiArLQogYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL01ha2VmaWxlICAg
ICAgfCAgIDQgKy0KIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9rYXNsci5jICAgICAgIHwgIDEy
ICsrKysrKwogYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5lbF9pbmZvLlMgfCAgMjIgKysr
KysrKysrKysKIGFyY2gveDg2L2Jvb3QvaGVhZGVyLlMgICAgICAgICAgICAgICAgIHwgICAzICst
CiBhcmNoL3g4Ni9ib290L3Rvb2xzL2J1aWxkLmMgICAgICAgICAgICB8ICAgNSArKysKIGFyY2gv
eDg2L2luY2x1ZGUvdWFwaS9hc20vYm9vdHBhcmFtLmggIHwgIDE2ICsrKysrKystCiBhcmNoL3g4
Ni9rZXJuZWwvZTgyMC5jICAgICAgICAgICAgICAgICB8ICAxMSArKysrKysKIGFyY2gveDg2L2tl
cm5lbC9rZGVidWdmcy5jICAgICAgICAgICAgIHwgIDIwICsrKysrKysrLS0KIGFyY2gveDg2L2tl
cm5lbC9rc3lzZnMuYyAgICAgICAgICAgICAgIHwgIDMwICsrKysrKysrKystLS0tCiBhcmNoL3g4
Ni9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAgICB8ICAgNCArKwogYXJjaC94ODYvbW0vaW9y
ZW1hcC5jICAgICAgICAgICAgICAgICAgfCAgMTEgKysrKysrCiAxMyBmaWxlcyBjaGFuZ2VkLCAy
OTIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpEYW5pZWwgS2lwZXIgKDMpOgogICAg
ICB4ODYvYm9vdDogSW50cm9kdWNlIHRoZSBrZXJuZWxfaW5mbwogICAgICB4ODYvYm9vdDogSW50
cm9kdWNlIHRoZSBrZXJuZWxfaW5mby5zZXR1cF90eXBlX21heAogICAgICB4ODYvYm9vdDogSW50
cm9kdWNlIHRoZSBzZXR1cF9pbmRpcmVjdAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
