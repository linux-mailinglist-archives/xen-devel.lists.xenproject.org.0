Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E22B1442
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 20:06:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8TR9-0007Oy-Td; Thu, 12 Sep 2019 18:03:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1ldN=XH=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1i8TR8-0007Ot-D2
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 18:03:18 +0000
X-Inumbo-ID: 98f7f626-d587-11e9-978d-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98f7f626-d587-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 18:03:17 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CHxEFx155240;
 Thu, 12 Sep 2019 18:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=eF5ZvNeDNNFBCR3/VhAcPHWKX7FFqyhFN5sQiitqf9Y=;
 b=XHvtafrLUoNxMB9KQ/UTPz/XLKFyF+wwjz03klmhmYxhOULzMb+ulKvlb7jFkFxVxv7N
 FIufNx3wyMhWUGBqXIA73mpzGNRMkVQuonO24mw3mqZQJLACsXb4jbciLqwO3UJinOPw
 PwpLkLfCR3zYzs6Oy6de/mCd3Iuuw5cTqZA79oneCoI33mV4TjJA6Rm/5lmIZj0uD/Y2
 xhu+ioTnK02Kx8Bwc2ZbG2U9yxdjFJW/hPyKw1bT/tA0mf3czvIGmPeS3bNqtNxwAjfq
 idIpBIwKj+58WcTahHDi622Ls3+5/rK0yQuGXQPhMmkGUW7Akn9WPouyNg/IfngsHWAJ zA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2uytd306d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 18:03:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8CHx30J045449;
 Thu, 12 Sep 2019 18:03:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2uytdnsbfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 18:03:16 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8CI3Fh0016854;
 Thu, 12 Sep 2019 18:03:15 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Sep 2019 11:03:14 -0700
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
Date: Thu, 12 Sep 2019 11:03:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9378
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=759
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909120189
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9378
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=820 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909120189
Subject: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after msix
 vector been updated
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBiZWxvdyB0ZXN0Y2FzZSwgZ3Vlc3Qga2VybmVsIHJlcG9ydGVkICJObyBpcnEgaGFuZGxl
ciBmb3IgdmVjdG9yIjoKICAxKS4gUGFzc3Rocm91Z2ggbWx4IGliIFZGIHRvIDIgcHZodm0gZ3Vl
c3RzLgogIDIpLiBTdGFydCByZHMtc3RyZXNzIGJldHdlZW4gMiBndWVzdHMuCiAgMykuIFNjYWxl
IGRvd24gMiBndWVzdHMgdmNwdSBmcm9tIDMyIHRvIDYgYXQgdGhlIHNhbWUgdGltZS4KClJlcGVh
dCBhYm92ZSB0ZXN0IHNldmVyYWwgaXRlcmF0aW9uLCBndWVzdCBrZXJuZWwgcmVwb3J0ZWQgIk5v
IGlycSBoYW5kbGVyCmZvciB2ZWN0b3IiLCBhbmQgSUIgdHJhZmZpYyBkb3duZWQgdG8gemVybyB3
aGljaCBjYXVzZWQgYnkgaW50ZXJydXB0IGxvc3QuCgpXaGVuIHZjcHUgb2ZmbGluZSwga2VybmVs
IGRpc2FibGVkIGxvY2FsIElSUSwgbWlncmF0ZSBJUlEgdG8gb3RoZXIgY3B1LAp1cGRhdGUgTVNJ
LVggdGFibGUsIGVuYWJsZSBJUlEuIElmIGFueSBuZXcgaW50ZXJydXB0IGFycml2ZWQgYWZ0ZXIK
bG9jYWwgSVJRIGRpc2FibGVkIGFsc28gYmVmb3JlIE1TSS1YIHRhYmxlIGJlZW4gdXBkYXRlZCwg
aW50ZXJydXB0IHN0aWxsIAp1c2VkIG9sZCB2ZWN0b3IgYW5kIGRlc3QgY3B1IGluZm8sIGFuZCB3
aGVuIGxvY2FsIElSUSBlbmFibGVkIGFnYWluLCAKaW50ZXJydXB0IGJlZW4gc2VudCB0byB3cm9u
ZyBjcHUgYW5kIHZlY3Rvci4KCkxvb2tzIHN5bmMgUElSIHRvIElSUiBhZnRlciBNU0ktWCBiZWVu
IHVwZGF0ZWQgaXMgaGVscCBmb3IgdGhpcyBpc3N1ZS4KCkJUVywgSSBjb3VsZCBub3QgcmVwcm9k
dWNlZCB0aGlzIGlzc3VlIGlmIEkgZGlzYWJsZWQgYXBpY3YuCgpTaWduZWQtb2ZmLWJ5OiBKb2Ug
SmluIDxqb2UuamluQG9yYWNsZS5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8u
YyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lv
LmMKaW5kZXggNDI5MGM3YzcxMC4uMTBjNWI1ZDFlMSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvaW8uYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCkBAIC00
MTIsNiArNDEyLDkgQEAgaW50IHB0X2lycV9jcmVhdGVfYmluZCgKICAgICAgICAgICAgICAgICBw
aXJxX2RwY2ktPmdtc2kuZ3ZlYyA9IHB0X2lycV9iaW5kLT51Lm1zaS5ndmVjOwogICAgICAgICAg
ICAgICAgIHBpcnFfZHBjaS0+Z21zaS5nZmxhZ3MgPSBnZmxhZ3M7CiAgICAgICAgICAgICB9CisK
KyAgICAgICAgICAgIGlmICggaHZtX2Z1bmNzLnN5bmNfcGlyX3RvX2lyciApCisgICAgICAgICAg
ICAgICAgaHZtX2Z1bmNzLnN5bmNfcGlyX3RvX2lycihkLT52Y3B1W3BpcnFfZHBjaS0+Z21zaS5k
ZXN0X3ZjcHVfaWRdKTsKICAgICAgICAgfQogICAgICAgICAvKiBDYWxjdWxhdGUgZGVzdF92Y3B1
X2lkIGZvciBNU0ktdHlwZSBwaXJxIG1pZ3JhdGlvbi4gKi8KICAgICAgICAgZGVzdCA9IE1BU0tf
RVhUUihwaXJxX2RwY2ktPmdtc2kuZ2ZsYWdzLAotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3KQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
