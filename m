Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB561C37
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 11:15:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkPgb-0004TJ-Sz; Mon, 08 Jul 2019 09:11:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IuGq=VF=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hkPga-0004T2-6s
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 09:11:48 +0000
X-Inumbo-ID: 670838c0-a160-11e9-a357-174144195c19
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 670838c0-a160-11e9-a357-174144195c19;
 Mon, 08 Jul 2019 09:11:43 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6899N1m045622;
 Mon, 8 Jul 2019 09:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=HrLoCLWKaK68rHicJaIU6MsioVbmLOJdaDU92K7D8ok=;
 b=tCQMMzgabehfm7OTcpmRRmZH/CeFRo9huZe6zZBm3ddL+DXYhBX0Q7XEAI8ETyetM8wD
 B7A6dMd/hrPQf6XgJpR8+GxoNoVZKCi1y41ENxqkoKM/nFNBrTEvH5wE5nZMeo5uLDhW
 iVyII8WAHKxzcBETvG85BMPTIx+LEPchtvoIHVY/kxGgvCUSHz1hkLXFBBfJjM20+i22
 MuKlGIQ8byC7Vd4u37Io5eq91055SPgtpicAwD2qVQQBb3+VbCU4P4i2vjmV7G1tvRq1
 vRz8UNCz1KVxgrgh+J6BkjJeSQUWg08qwkrga4St6EpOc867feT4FpGkUF4zTMXpoFq0 9A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2tjkkpd879-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6897uOB111007;
 Mon, 8 Jul 2019 09:11:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2tjkf23d87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jul 2019 09:11:30 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x689BTkI005039;
 Mon, 8 Jul 2019 09:11:29 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jul 2019 02:11:29 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  7 Jul 2019 17:15:04 +0800
Message-Id: <1562490908-17882-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907080120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9311
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907080121
Subject: [Xen-devel] [PATCH v6 0/4] misc fixes to PV extensions code
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
Cc: jgross@suse.com, sstabellini@kernel.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJbiB2aXJ0dWFsaXphdGlvbiBlbnZpcm9ubWVudCwgUFYgZXh0ZW5zaW9ucyAoZHJpdmVy
cywgaW50ZXJydXB0cywKdGltZXJzLCBldGMpIGFyZSBlbmFibGVkIGluIHRoZSBtYWpvcml0eSBv
ZiB1c2UgY2FzZXMgd2hpY2ggaXMgdGhlCmJlc3Qgb3B0aW9uLgoKSG93ZXZlciwgaW4gc29tZSBj
YXNlcyAoa2V4ZWMgbm90IGZ1bGx5IHdvcmtpbmcsIGJlbmNobWFya2luZywgZXRjKQp3ZSB3YW50
IHRvIGRpc2FibGUgUFYgZXh0ZW5zaW9ucy4gV2UgaGF2ZSB4ZW5fbm9wdiBmb3IgdGhhdCBwdXJw
b3NlCmJ1dCBvbmx5IGZvciBYRU4uIEZvciBhIGNvbnNpc3RlbnQgYWRtaW4gZXhwZXJpZW5jZSBh
IGNvbW1vbiBjb21tYW5kCmxpbmUgcGFyYW1ldGVyIHNldCBhY3Jvc3MgYWxsIFBWIGd1ZXN0IGlt
cGxlbWVudGF0aW9ucyBpcyBhIGJldHRlcgpjaG9pY2UuCgpUbyBhY2hpZXZlIHRoaXMgaW50cm9k
dWNlIGEgbmV3ICdub3B2JyBwYXJhbWV0ZXIgd2hpY2ggaXMgdXNhYmxlIGJ5Cm1vc3Qgb2YgUFYg
Z3Vlc3QgaW1wbGVtZW50YXRpb24uIER1ZSB0byB0aGUgbGltaXRhdGlvbiBvZiBzb21lIFBWCmd1
ZXN0cyhYRU4gUFYsIFhFTiBQVkggYW5kIGphaWxob3VzZSksICdub3B2JyBpcyBpZ25vcmVkIGZv
ciBYRU4gUFYKLCBqYWlsaG91c2UgYW5kIFhFTiBQVkggaWYgYm9vdGluZyB2aWEgWGVuLVBWSCBi
b290IGVudHJ5LiBJZiBib290aW5nCnZpYSBub3JtYWwgYm9vdCBlbnRyeShsaWtlIGdydWIyKSwg
UFZIIGd1ZXN0IGhhcyB0byBwYW5pYyBpdHNlbGYKY3VycmVudGx5LgoKV2hpbGUgYW5hbHl6aW5n
IHRoZSBQViBndWVzdCBjb2RlIG9uZSBidWcgd2VyZSBmb3VuZCBhbmQgZml4ZWQuCihQYXRjaGVz
IDEpLiBJdCBjYW4gYmUgYXBwbGllZCBpbmRlcGVuZGVudCBvZiB0aGUgZnVuY3Rpb25hbApjaGFu
Z2VzLCBidXQgaXMga2VwdCBpbiB0aGUgc2VyaWVzIGFzIHRoZSBmdW5jdGlvbmFsIGNoYW5nZXMK
ZGVwZW5kIG9uIHRoZW0uCgpGb3IgY29tcGF0aWJpbGl0eSByZWFzb24sICJ4ZW5fbm9wdiIgaXMg
a2VlcGVkIGFuZCBtYXBwZWQgdG8gIm5vcHYiLAp0aGlzIHdheSBhbHNvIGF2b2lkcyBhbiBpc3N1
ZSB3aXRoIHhlbl9ub3B2IHdoZW4gYm9vdGluZyBQVkggZ3Vlc3QuCgpCdWlsZCB0ZXN0IHBhc3Nl
cyB3aXRoIENPTkZJR19IWVBFUlZJU09SX0dVRVNUIGVuYWJsZSBhbmQgZGlzYWJsZWQuCkkgZGlk
bid0IGdldCBlbnYgdG8gdGVzdCB3aXRoIGphaWxob3VzZSBhbmQgSHlwZXJ2LCB0aGUgb3RoZXJz
IHdvcmsKYXMgZXhwZWN0ZWQuCgp2NjoKUEFUQ0gzIGFkZCBSZXZpZXdlZC1ieQpQQVRDSDQgcmVt
b3ZlIHVubmVjZXNzb3J5IHhlbl9odm1fbm9wdl9ndWVzdF9sYXRlX2luaXQoKSBwZXIgQm9yaXMK
CnY1OgpQQVRDSDI6CnVwZGF0ZSBwYXRjaCBkZXNjcmlwdGlvbiBwZXIgQm9yaXMKYWRkIGRlY2xh
cmF0aW9uIG9mIG5vcHYgdmFyaWFibGUgaW4gYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNv
ci5oCndoaWNoIHdpbGwgYmUgdXNlZCBpbiBQQVRDSDMgYW5kIFBBVENINAoKUEFUQ0gzIHVwZGF0
ZSB4ZW5fcGFyc2Vfbm9wdigpIHBlciBCb3JpcwpQQVRDSDQgYWRkIG5vcHY9ZmFsc2UgcGVyIEJv
cmlzCkNvbWJpbmUgUEFUQ0g1IGludG8gUEFUQ0gzCgoKdjQ6ClBBVENINSBhIG5ldyBwYXRjaCB0
byBhZGQgJ3hlbl9ub3B2JyBiYWNrIHBlciBCb3JpcwoKdjM6ClJlbW92ZSBzb21lIHVucmVsYXRl
ZCBwYXRjaGVzIGZyb20gcGF0Y2hzZXQgYXMgc3VnZ2VzdGVkIGJ5IFRnbHgKClBBVENIMSB1bmNo
YW5nZWQKUEFUQ0gyIGFkZCBSZXZpZXdlZC1ieQpQQVRDSDMgYWRkIFJldmlld2VkLWJ5ClBBVENI
NCByZXdyaXRlIHRoZSBwYXRjaCBhcyBKZ3Jvc3MgZm91bmQgYW4gaXNzdWUgaW4gb2xkIHBhdGNo
LApkZXNjcmlwdGlvbiBpcyBhbHNvIHVwZGF0ZWQuCgoKCnYyOgpQQVRDSDMgdXNlICdpZ25vcmVf
bm9wdicgZm9yIFBWSC9QViBndWVzdCBhcyBzdWdnZXN0ZWQgYnkgSmdyb3NzLgpQQVRDSDUgbmV3
IGFkZGVkIG9uZSwgc3BlY2lmaWNhbGx5IGZvciBIVk0gZ3Vlc3QKClRoYW5rcwpaaGVuemhvbmcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
