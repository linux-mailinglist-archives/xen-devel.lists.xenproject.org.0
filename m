Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C75C8B5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 07:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiB9z-0000z2-1N; Tue, 02 Jul 2019 05:16:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=is1s=U7=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiB9x-0000yx-If
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 05:16:53 +0000
X-Inumbo-ID: 99ae3f58-9c88-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 99ae3f58-9c88-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 05:16:52 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625Dgvr130013;
 Tue, 2 Jul 2019 05:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=1NF2v8UzQafv3qTkhNae1pzQtd/3b2jGxsE9mcKGwfQ=;
 b=P5JgOCwnqx/pGoprC+uVNqsHi1fAJ1wMTXs+UZG0w8FWMXvurjmHzs9IrpDIX98rYmoh
 6nAfNn1z2KSECaIw6D+dciIEbYvcgY63VjN4dvuqKEPjzg4DoFIzJSG76VDb1UKUAkbg
 ugNIJ7CVSeyKX6Kclyx4Nex9T0kWycFzw7lKKN4bIk4RqARQNbOT2yZvGGy71tl0leYr
 NVCrUlN/PkPYUxyujMoEC3vRFkr4FKLRbgQ8Y4s5bMUb8q95LRcKATVFN4FgMGPt2j5j
 G6DkHF7SEw71FvLkgcXuffqtaedKtj59XKowoVkf9vp1dm0DdZX9wCsFJEEwD/VweVmo Hg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2te61ps3pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x625CSh9040352;
 Tue, 2 Jul 2019 05:16:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tebbjhuar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 05:16:38 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x625GbGx006323;
 Tue, 2 Jul 2019 05:16:37 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 22:16:36 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  1 Jul 2019 13:19:54 +0800
Message-Id: <1561958399-28906-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020058
Subject: [Xen-devel] [PATCH v4 0/5] misc fixes to PV extentions code
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
ZGVwZW5kIG9uIHRoZW0uCgpBcyBJIHNlZSB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHhlbl9ub3B2
IHdoZW4gYm9vdGluZyBQVkggZ3Vlc3QsIHNvCkkgcmV2ZXJ0ICd4ZW5fbm9wdicgaW4gb25lIHBh
dGNoIGFuZCBtYXAgaXQgYmFjayB0byAnbm9wdicgaW4gdGhlCmZvbGxvd2luZyBwYXRjaC4gVGhp
cyBpcyB0aGUgZWFzaWVyIHdheSB0byBmaXggdGhlIGlzc3VlIGFuZCBlYXN5CmZvciByZXZpZXcu
CgpJIGRpZG4ndCBnZXQgZW52IHRvIHRlc3Qgd2l0aCBqYWlsaG91c2UgYW5kIEh5cGVydiwgdGhl
IG90aGVycyB3b3JrCmFzIGV4cGVjdGVkLgoKdjQ6ClBBVENINSBhIG5ldyBwYXRjaCB0byBhZGQg
J3hlbl9ub3B2JyBiYWNrIHBlciBCb3JpcwoKdjM6ClJlbW92ZSBzb21lIHVucmVsYXRlZCBwYXRj
aGVzIGZyb20gcGF0Y2hzZXQgYXMgc3VnZ2VzdGVkIGJ5IFRnbHgKClBBVENIMSB1bmNoYW5nZWQK
UEFUQ0gyIGFkZCBSZXZpZXdlZC1ieQpQQVRDSDMgYWRkIFJldmlld2VkLWJ5ClBBVENINCByZXdy
aXRlIHRoZSBwYXRjaCBhcyBKZ3Jvc3MgZm91bmQgYW4gaXNzdWUgaW4gb2xkIHBhdGNoLApkZXNj
cmlwdGlvbiBpcyBhbHNvIHVwZGF0ZWQuCgoKCnYyOgpQQVRDSDMgdXNlICdpZ25vcmVfbm9wdicg
Zm9yIFBWSC9QViBndWVzdCBhcyBzdWdnZXN0ZWQgYnkgSmdyb3NzLgpQQVRDSDUgbmV3IGFkZGVk
IG9uZSwgc3BlY2lmaWNhbGx5IGZvciBIVk0gZ3Vlc3QKClRoYW5rcwpaaGVuemhvbmcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
