Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53B5F0EE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 03:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiqMG-0000Va-Ps; Thu, 04 Jul 2019 01:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pMc9=VB=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiqMF-0000VQ-DL
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 01:16:19 +0000
X-Inumbo-ID: 51162028-9df9-11e9-9dcd-fb3fa9e3a810
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51162028-9df9-11e9-9dcd-fb3fa9e3a810;
 Thu, 04 Jul 2019 01:16:15 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641EI9A034007;
 Thu, 4 Jul 2019 01:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=8R30P8/VE15uPa2Cd5dwobgt5Ubg1NVPlqUdVRzGKOg=;
 b=PFa7vxlW1+CH/aILqZteNTx4bLTRzCCKfxlUc0pO0k9P6N6FzCrBr2ot3WvgURE9f+Ra
 mpXvtK6hbtuAJrn0CepZRt+szQO2DmQpNdFuyHd3POlkpUne1LAe+EsWKQrLhCX/DQo2
 LlsU8znXbYYmx2OMPJvKWob3JSGNoXynzfPFS93Lqx/BOdLQPnpjkgETMyneOYUzbojN
 WEKblRARQYCw9aRAC48uKdNVHzjaXSVFJKCWAMEmHshiNS1AF1rc2fZGLEgI4RKPryIr
 1ysZDf1XeyfedeyiA8VNc6PPHjNnfzG/FG6XuEvhwgxd0+aLyyUNX7T2q/7Bwm/0UvdY Fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2te61q46r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:15:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x641CfXm100559;
 Thu, 4 Jul 2019 01:15:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2tebbknp7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Jul 2019 01:15:58 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x641FvGL010644;
 Thu, 4 Jul 2019 01:15:57 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 03 Jul 2019 18:15:56 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jul 2019 09:19:34 +0800
Message-Id: <1562116778-5846-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9307
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907040013
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9307
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907040014
Subject: [Xen-devel] [PATCH v5 0/4] misc fixes to PV extentions code
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
IHdvcmsKYXMgZXhwZWN0ZWQuCgp2NToKUEFUQ0gyOgp1cGRhdGUgcGF0Y2ggZGVzY3JpcHRpb24g
cGVyIEJvcmlzCmFkZCBkZWNsYXJhdGlvbiBvZiBub3B2IHZhcmlhYmxlIGluIGFyY2gveDg2L2lu
Y2x1ZGUvYXNtL2h5cGVydmlzb3IuaAp3aGljaCB3aWxsIGJlIHVzZWQgaW4gUEFUQ0gzIGFuZCBQ
QVRDSDQKClBBVENIMyB1cGRhdGUgeGVuX3BhcnNlX25vcHYoKSBwZXIgQm9yaXMKUEFUQ0g0IGFk
ZCBub3B2PWZhbHNlIHBlciBCb3JpcwpDb21iaW5lIFBBVENINSBpbnRvIFBBVENIMwoKCnY0OgpQ
QVRDSDUgYSBuZXcgcGF0Y2ggdG8gYWRkICd4ZW5fbm9wdicgYmFjayBwZXIgQm9yaXMKCnYzOgpS
ZW1vdmUgc29tZSB1bnJlbGF0ZWQgcGF0Y2hlcyBmcm9tIHBhdGNoc2V0IGFzIHN1Z2dlc3RlZCBi
eSBUZ2x4CgpQQVRDSDEgdW5jaGFuZ2VkClBBVENIMiBhZGQgUmV2aWV3ZWQtYnkKUEFUQ0gzIGFk
ZCBSZXZpZXdlZC1ieQpQQVRDSDQgcmV3cml0ZSB0aGUgcGF0Y2ggYXMgSmdyb3NzIGZvdW5kIGFu
IGlzc3VlIGluIG9sZCBwYXRjaCwKZGVzY3JpcHRpb24gaXMgYWxzbyB1cGRhdGVkLgoKCgp2MjoK
UEFUQ0gzIHVzZSAnaWdub3JlX25vcHYnIGZvciBQVkgvUFYgZ3Vlc3QgYXMgc3VnZ2VzdGVkIGJ5
IEpncm9zcy4KUEFUQ0g1IG5ldyBhZGRlZCBvbmUsIHNwZWNpZmljYWxseSBmb3IgSFZNIGd1ZXN0
CgpUaGFua3MKWmhlbnpob25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
