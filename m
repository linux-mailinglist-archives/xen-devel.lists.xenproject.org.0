Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001FB66C28
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 14:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hluHp-0002yI-48; Fri, 12 Jul 2019 12:04:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vyeD=VJ=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hluHn-0002yB-Rh
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 12:04:23 +0000
X-Inumbo-ID: 2f0a7eec-a49d-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f0a7eec-a49d-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 12:04:22 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC3wmH193517;
 Fri, 12 Jul 2019 12:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=J9lJrCjR1CDld97lcMgVwVTIYNKOCq4NNPlK+e/GGis=;
 b=1tOoXXngBgKpnmWItLtPyg9qdomO8RmLdaOI+SPKuWqrbtLpEhL+cWDRv1bltCXmBjZi
 AbleJF2yLVo5HMf9lHPjOtX0JWAL5Ipe0swA9wRH/B74lZKDdO+96GjjMV2nYdRd+ZlS
 AOCBlSuNbQSNGNKleM4hDh3QJNgdb1mc2/gYQmGMEYWeHIB7afd7wEX1muFlPlZqUyRs
 7NlOkPgQzeh34f3rDG0uDVh5zgh5v7S49auuf2dUH/iKCnrcMxC/aJwzfEnrZXYcRpay
 0vuJhoptNbgX5FKHBkuOahVzFT0VXy7liVebIOS9W0bxNjphPQSdTEew3If8ix6Yt3BI TQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2tjk2u5aer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:04:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6CC3Squ118169;
 Fri, 12 Jul 2019 12:04:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2tnc8u3wv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 12:04:05 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6CC43aV006181;
 Fri, 12 Jul 2019 12:04:03 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 12 Jul 2019 04:58:29 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 11 Jul 2019 20:02:07 +0800
Message-Id: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120132
Subject: [Xen-devel] [PATCH v7 0/5] misc fixes to PV extensions code
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
IHdvcmsKYXMgZXhwZWN0ZWQuCgp2NzoKUEFUQ0g0IGEgbmV3IGFkZGVkIHBhdGNoIHByZXJlcXVp
dGUgZm9yIFBBVENINShwcmV2aW91c2x5IFBBVENINCkKUEFUQ0g1IHJld3JpdGUgdGhlIGNvZGUg
YmFzZWQgb24gQm9yaXMncyBzdWdnZXN0aW9uLiBJIGNvbXBhcmUgdGhlIG9uZQp0byB1cGRhdGUg
aW50ZXJmYWNlIGZ1bmN0aW9uIG9uZS1ieS1vbmUgYW5kIHRoZSBvbmUgdG8gbW9kaWZ5IGFsbAp4
ODZfaHlwZXJfeGVuX2h2bSdzIG9wcyB0byBpbW1lZGlhdGVseSByZXR1cm4gaWYgbm9wdiBpcyBz
ZXQsIGJvdGgKaGF2ZSBzYW1lIGVmZmVjdCBhbmQgdGhlIGZpcnN0IGxvb2tzIHNtYXJ0ZXIsIHNv
IGNob29zZSB0aGUgMXN0IG9uZS4KCnY2OgpQQVRDSDMgYWRkIFJldmlld2VkLWJ5ClBBVENINCBy
ZW1vdmUgdW5uZWNlc3NvcnkgeGVuX2h2bV9ub3B2X2d1ZXN0X2xhdGVfaW5pdCgpIHBlciBCb3Jp
cwoKdjU6ClBBVENIMjoKdXBkYXRlIHBhdGNoIGRlc2NyaXB0aW9uIHBlciBCb3JpcwphZGQgZGVj
bGFyYXRpb24gb2Ygbm9wdiB2YXJpYWJsZSBpbiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZp
c29yLmgKd2hpY2ggd2lsbCBiZSB1c2VkIGluIFBBVENIMyBhbmQgUEFUQ0g0CgpQQVRDSDMgdXBk
YXRlIHhlbl9wYXJzZV9ub3B2KCkgcGVyIEJvcmlzClBBVENINCBhZGQgbm9wdj1mYWxzZSBwZXIg
Qm9yaXMKQ29tYmluZSBQQVRDSDUgaW50byBQQVRDSDMKCgp2NDoKUEFUQ0g1IGEgbmV3IHBhdGNo
IHRvIGFkZCAneGVuX25vcHYnIGJhY2sgcGVyIEJvcmlzCgp2MzoKUmVtb3ZlIHNvbWUgdW5yZWxh
dGVkIHBhdGNoZXMgZnJvbSBwYXRjaHNldCBhcyBzdWdnZXN0ZWQgYnkgVGdseAoKUEFUQ0gxIHVu
Y2hhbmdlZApQQVRDSDIgYWRkIFJldmlld2VkLWJ5ClBBVENIMyBhZGQgUmV2aWV3ZWQtYnkKUEFU
Q0g0IHJld3JpdGUgdGhlIHBhdGNoIGFzIEpncm9zcyBmb3VuZCBhbiBpc3N1ZSBpbiBvbGQgcGF0
Y2gsCmRlc2NyaXB0aW9uIGlzIGFsc28gdXBkYXRlZC4KCnYyOgpQQVRDSDMgdXNlICdpZ25vcmVf
bm9wdicgZm9yIFBWSC9QViBndWVzdCBhcyBzdWdnZXN0ZWQgYnkgSmdyb3NzLgpQQVRDSDUgbmV3
IGFkZGVkIG9uZSwgc3BlY2lmaWNhbGx5IGZvciBIVk0gZ3Vlc3QKClRoYW5rcwpaaGVuemhvbmcK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
