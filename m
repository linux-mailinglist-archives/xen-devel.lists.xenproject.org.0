Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05B5C70B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 04:19:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hi8M6-0002oY-05; Tue, 02 Jul 2019 02:17:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=is1s=U7=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hi8M3-0002oJ-PF
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 02:17:11 +0000
X-Inumbo-ID: 7f160885-9c6f-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f160885-9c6f-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 02:17:10 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x622DuCg002640;
 Tue, 2 Jul 2019 02:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=JBk+9q6K3yoqn/77EyVKRhimbO8wdik/7q1ScDaQrDU=;
 b=DXEwpbckhUODFnesaSI6tWfTFGu08oZ2ocmXursuCbHXTxiZ+3A+E9agSgkuq9m+7IRV
 rXeZcwqCT1FkRSrU9IJus+TIHIBzMQzg9uLIwMNFlQ9MaEuFD2azdSM0q2XF/NDFcvhZ
 9d090WU5I211v1jqGbdL7dzT5MEWTRlxYw+Q0phgSn+j4jPFdf8upvGXZUT6r1bWjDyV
 JQOkiu4pxCe8f4T3RcHAjVnboAhnJgJvO/oGygOzcBh/odQdh3Xvl/JNXTKdPta8gGFU
 VVmDKsytQ8vAy9U4BIMLJd2kkQhw+z8ifLp7ai9vyWoCKD4WorSKE6nlVcxqYk4luJU1 mQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2te61e0ny4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 02:16:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x622CjP7147236;
 Tue, 2 Jul 2019 02:16:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2tebbjg8x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 02:16:52 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x622GoiI011178;
 Tue, 2 Jul 2019 02:16:50 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 19:16:50 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jul 2019 10:20:24 +0800
Message-Id: <1561947628-1147-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020020
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020021
Subject: [Xen-devel] [PATCH v3 0/4] misc fixes to PV extentions code
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
 boris.ostrovsky@oracle.co, xen-devel@lists.xenproject.org, tglx@linutronix.de
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
ZGVwZW5kIG9uIHRoZW0uCgpBcyBJIGRpZG4ndCBnb3QgZnVydGhlciBjb21tZW50cyBmcm9tIEpn
cm9zcyBhYm91dCByZW1vdmUgJ3hlbl9ub3B2JywKc28gSSBwcmVzdW1lIGhlIGhhcyBubyBvYmpl
Y3Rpb24gdG8gdGhhdC4gSW4gZmFjdCwgSSB0aGluayBubyBwcm9kdWN0CmVudmlyb25tZW50IHdp
bGwgdXNlICd4ZW5fbm9wdicgZm9yIHBlcmZvcm1hbmNlLiBKZ3Jvc3MsIGlmIHlvdSBjaGFuZ2Vk
Cm1pbmQgdG8gcHJlc2VydmUgaXQgZmluYWxseSwganVzdCBsZXQgbWUga25vdy4KCkkgZGlkbid0
IGdldCBlbnYgdG8gdGVzdCB3aXRoIGphaWxob3VzZSBhbmQgSHlwZXJ2LCB0aGUgb3RoZXJzIHdv
cmsKYXMgZXhwZWN0ZWQuCgp2MzoKUmVtb3ZlIHNvbWUgdW5yZWxhdGVkIHBhdGNoZXMgZnJvbSBw
YXRjaHNldCBhcyBzdWdnZXN0ZWQgYnkgVGdseAoKUEFUQ0gxIHVuY2hhbmdlZApQQVRDSDIgYWRk
IFJldmlld2VkLWJ5ClBBVENIMyBhZGQgUmV2aWV3ZWQtYnkKUEFUQ0g0IHJld3JpdGUgdGhlIHBh
dGNoIGFzIEpncm9zcyBmb3VuZCBhbiBpc3N1ZSBpbiBvbGQgcGF0Y2gsCmRlc2NyaXB0aW9uIGlz
IGFsc28gdXBkYXRlZC4KCgoKdjI6ClBBVENIMyB1c2UgJ2lnbm9yZV9ub3B2JyBmb3IgUFZIL1BW
IGd1ZXN0IGFzIHN1Z2dlc3RlZCBieSBKZ3Jvc3MuClBBVENINSBuZXcgYWRkZWQgb25lLCBzcGVj
aWZpY2FsbHkgZm9yIEhWTSBndWVzdAoKVGhhbmtzClpoZW56aG9uZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
