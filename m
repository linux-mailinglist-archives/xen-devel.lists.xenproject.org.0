Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EC04B04E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 05:03:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdQqf-0005K6-WD; Wed, 19 Jun 2019 03:01:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kts=US=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hdQqe-0005Jp-35
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 03:01:20 +0000
X-Inumbo-ID: 8278c899-923e-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8278c899-923e-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 03:01:18 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2xXmx070355;
 Wed, 19 Jun 2019 03:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=7tyT0YcMicDx0xhFBdh7+OaH2yc89XO8q+cebhQ9PlY=;
 b=XA8ComtPxAHsBCBAmlvOcy5PFm3bQ+bJxRwXbWIv1Jvmz6p60FLvq/JaykfI+i1vwAWK
 RXbMjJM5jGKXOlxyq5wBsQxh9U3fE76irqfWhQAhnlQR+u/n/Yxj8qdQSU5RxYXL1QB/
 wWg5LHmTFQqdPf07yCtLsJjCTpNJ1WWgvdiUddPDXClXYYYiriDzxIhYfcEgNNIUsVrc
 M9FGHAwQs3U1QwDbr6dH9PPj6O01XR2gpjLcHk3E0TDB/8jyPwXRIyB7QjCd5ttV55zG
 8kqt+4QemoViH7qXXMh8OZ8tLEZetsRnOtwHGb54nPTtmfY0UN4ecyPD+JrBlSR+JMFn JA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t78098qwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 03:01:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J31Cmq051398;
 Wed, 19 Jun 2019 03:01:16 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2t77yn2xe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 03:01:16 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5J31GfN030593;
 Wed, 19 Jun 2019 03:01:16 GMT
Received: from [10.156.74.184] (/10.156.74.184)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 20:01:15 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-17-ankur.a.arora@oracle.com>
 <a35ab9a8-4874-fbc8-0148-aa07543e8672@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <11b62ba8-8aa2-9b84-c6fb-259d0548d753@oracle.com>
Date: Tue, 18 Jun 2019 20:02:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a35ab9a8-4874-fbc8-0148-aa07543e8672@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190022
Subject: Re: [Xen-devel] [RFC PATCH 16/16] xen/grant-table: host_addr fixup
 in mapping on xenhost_r0
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xNy8xOSAzOjU1IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LjA1LjE5IDE5
OjI1LCBBbmt1ciBBcm9yYSB3cm90ZToKPj4gWGVuaG9zdCB0eXBlIHhlbmhvc3RfcjAgZG9lcyBu
b3Qgc3VwcG9ydCBzdGFuZGFyZCBHTlRUQUJPUF9tYXBfZ3JhbnRfcmVmCj4+IHNlbWFudGljcyAo
bWFwIGEgZ3JlZiBvbnRvIGEgc3BlY2lmaWVkIGhvc3RfYWRkcikuIFRoYXQncyBiZWNhdXNlCj4+
IHNpbmNlIHRoZSBoeXBlcnZpc29yIGlzIGxvY2FsIChzYW1lIGFkZHJlc3Mgc3BhY2UgYXMgdGhl
IGNhbGxlciBvZgo+PiBHTlRUQUJPUF9tYXBfZ3JhbnRfcmVmKSwgdGhlcmUgaXMgbm8gZXh0ZXJu
YWwgZW50aXR5IHRoYXQgY291bGQKPj4gbWFwIGFuIGFyYml0cmFyeSBwYWdlIHVuZGVybmVhdGgg
YW4gYXJiaXRyYXJ5IGFkZHJlc3MuCj4+Cj4+IFRvIGhhbmRsZSB0aGlzLCB0aGUgR05UVEFCT1Bf
bWFwX2dyYW50X3JlZiBoeXBlcmNhbGwgb24geGVuaG9zdF9yMAo+PiB0cmVhdHMgdGhlIGhvc3Rf
YWRkciBhcyBhbiBPVVQgcGFyYW1ldGVyIGluc3RlYWQgb2YgSU4gYW5kIGV4cGVjdHMgdGhlCj4+
IGdudHRhYl9tYXBfcmVmcygpIGFuZCBzaW1pbGFyIHRvIGZpeHVwIGFueSBzdGF0ZSB0aGF0IGNh
Y2hlcyB0aGUKPj4gdmFsdWUgb2YgaG9zdF9hZGRyIGZyb20gYmVmb3JlIHRoZSBoeXBlcmNhbGwu
Cj4+Cj4+IEFjY29yZGluZ2x5IGdudHRhYl9tYXBfcmVmcygpIG5vdyBhZGRzIHR3byBwYXJhbWV0
ZXJzLCBhIGZpeHVwIGZ1bmN0aW9uCj4+IGFuZCBhIHBvaW50ZXIgdG8gY2FjaGVkIG1hcHMgdG8g
Zml4dXA6Cj4+IMKgIGludCBnbnR0YWJfbWFwX3JlZnMoeGVuaG9zdF90ICp4aCwgc3RydWN0IGdu
dHRhYl9tYXBfZ3JhbnRfcmVmIAo+PiAqbWFwX29wcywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGdudHRhYl9tYXBfZ3JhbnRfcmVmICprbWFwX29wcywKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKipwYWdlcywgdW5zaWduZWQgaW50IGNvdW50KQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBnbnR0YWJfbWFw
X2ZpeHVwX3QgbWFwX2ZpeHVwX2ZuLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICoq
bWFwX2ZpeHVwW10sIHVuc2lnbmVkIGludCBjb3VudCkKPj4KPj4gVGhlIHJlYXNvbiB3ZSB1c2Ug
YSBmaXh1cCBmdW5jdGlvbiBhbmQgbm90IGFuIGFkZGl0aW9uYWwgbWFwcGluZyBvcAo+PiBpbiB0
aGUgeGVuaG9zdF90IGlzIGJlY2F1c2UsIGRlcGVuZGluZyBvbiB0aGUgY2FsbGVyLCB3aGF0IHdl
IGFyZSBmaXhpbmcKPj4gbWlnaHQgYmUgZGlmZmVyZW50OiBibGtiYWNrLCBuZXRiYWNrIGZvciBp
bnN0YW5jZSBjYWNoZSBob3N0X2FkZHIgaW4KPj4gdmlhIGEgc3RydWN0IHBhZ2UgKiwgd2hpbGUg
X194ZW5idXNfbWFwX3JpbmcoKSBjYWNoZXMgYSBwaHlzX2FkZHIuCj4+Cj4+IFRoaXMgcGF0Y2gg
Zml4ZXMgdXAgeGVuLWJsa2JhY2sgYW5kIHhlbi1nbnRkZXYgZHJpdmVycy4KPj4KPj4gVE9ETzoK
Pj4gwqDCoCAtIGFsc28gcmV3cml0ZSBnbnR0YWJfYmF0Y2hfbWFwKCkgYW5kIF9feGVuYnVzX21h
cF9yaW5nKCkuCj4+IMKgwqAgLSBtb2RpZnkgeGVuLW5ldGJhY2ssIHNjc2liYWNrLCBwY2liYWNr
IGV0Ywo+Pgo+PiBDby1kZXZlbG9wZWQtYnk6IEpvYW8gTWFydGlucyA8am9hby5tLm1hcnRpbnNA
b3JhY2xlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQW5rdXIgQXJvcmEgPGFua3VyLmEuYXJvcmFA
b3JhY2xlLmNvbT4KPiAKPiBXaXRob3V0IHNlZWluZyB0aGUgX194ZW5idXNfbWFwX3JpbmcoKSBt
b2RpZmljYXRpb24gaXQgaXMgaW1wb3NzaWJsZSB0bwo+IGRvIGEgcHJvcGVyIHJldmlldyBvZiB0
aGlzIHBhdGNoLgpXaWxsIGRvIGluIHYyLgoKQW5rdXIKCj4gCj4gCj4gSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
