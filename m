Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D09826D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:12:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0V33-0003yd-3Y; Wed, 21 Aug 2019 18:09:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0V31-0003yY-Sw
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:09:27 +0000
X-Inumbo-ID: cfbc8276-c43e-11e9-b95f-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfbc8276-c43e-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 18:09:27 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI4G65096012;
 Wed, 21 Aug 2019 18:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=AJXvESKrDPfCZ8FVC/kOkI8e6nOyzPv0X/0A3Ph4ZFc=;
 b=T6KcRYmEGAqXne0tozryw31y+NqDLTl8yQgH+RhvTisexiwRIxY8OJaQaKmEuOPNuyrz
 msu/xyxkXTTxzFrviEEhnqbvQHh6Q2GYm8buscIxUQv1TFTcS3bNF41F3SfnBWT0qEmv
 4WntHihJ0kmVTUcrWvO9cINXt924hMcDZhkfegX+9v1QL5L8Eo9FLj1S+1EL9eMBq+LV
 EfATcZpswBf67qySJgvLEMp0PQRK+u2iF7/C/kiqXgQvnlURgZNovk8NSBwtSANawklN
 0X2hw9uMIRRtaB9hSCBWgSnbY66HHcrJiyg/LDAeno5nIGc28EWcl8N3dynfQy22PIWu 7Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2ue90tqmys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:09:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI3aog027844;
 Wed, 21 Aug 2019 18:09:19 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2uh83nyf07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:09:19 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7LI9IDU000947;
 Wed, 21 Aug 2019 18:09:18 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:09:18 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org
References: <20190814083815.89086-1-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <7f49e8f7-4c93-cd8c-d92a-19aeb6d2e9a0@oracle.com>
Date: Wed, 21 Aug 2019 14:09:17 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190814083815.89086-1-wipawel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210180
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210180
Subject: Re: [Xen-devel] [livepatch-hooks-2 PATCH 2/4] create-diff-object:
 Add support for applied/reverted marker
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
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNC8xOSA0OjM4IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBXaXRoIHZl
cnNpb24gMiBvZiBhIHBheWxvYWQgc3RydWN0dXJlIGFkZGl0aW9uYWwgZmllbGQgaXMgc3VwcG9y
dGVkCj4gdG8gdHJhY2sgd2hldGhlciBnaXZlbiBmdW5jdGlvbiBoYXMgYmVlbiBhcHBsaWVkIG9y
IHJldmVydGVkLgo+IFRoZXJlIGFsc28gY29tZXMgYWRkaXRpb25hbCA4LWJ5dGUgYWxpZ25tZW50
IHBhZGRpbmcgdG8gcmVzZXJ2ZQo+IHBsYWNlIGZvciBmdXR1cmUgZmxhZ3MgYW5kIG9wdGlvbnMu
Cj4gCj4gVGhlIG5ldyBmaWVsZHMgYXJlIHplcm8tb3V0IHVwb24gLmxpdmVwYXRjaC5mdW5jcyBz
ZWN0aW9uIGNyZWF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6
IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiAtLS0KPiAgIGNvbW1vbi5oICAgICAgICAgICAgIHwgMiAr
Kwo+ICAgY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCA0ICsrKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbW1vbi5o
IGIvY29tbW9uLmgKPiBpbmRleCAwNmUxOWU3Li5kOGNkZTM1IDEwMDY0NAo+IC0tLSBhL2NvbW1v
bi5oCj4gKysrIGIvY29tbW9uLmgKPiBAQCAtMTI0LDYgKzEyNCw4IEBAIHN0cnVjdCBsaXZlcGF0
Y2hfcGF0Y2hfZnVuYyB7Cj4gICAJdWludDMyX3Qgb2xkX3NpemU7Cj4gICAJdWludDhfdCB2ZXJz
aW9uOwo+ICAgCXVuc2lnbmVkIGNoYXIgcGFkWzMxXTsKClNvIHRoZSAzMSBwYWQgaXMgZm9yIHRo
aXMgcHVycG9zZSAtIHRoYXQgeW91IGNhbiBtYWtlIGl0IHNtYWxsZXIuIFdoeSAKbm90IHVzZSB0
aGF0PwoKPiArCXVpbnQ4X3QgYXBwbGllZDsKPiArCXVpbnQ4X3QgX3BhZFs3XTsKPiAgIH07Cj4g
ICAKPiAgIHN0cnVjdCBzcGVjaWFsX3NlY3Rpb24gewo+IGRpZmYgLS1naXQgYS9jcmVhdGUtZGlm
Zi1vYmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCj4gaW5kZXggMjYzYzdkMi4uNTM0NTE2
YiAxMDA2NDQKPiAtLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYwo+ICsrKyBiL2NyZWF0ZS1kaWZm
LW9iamVjdC5jCj4gQEAgLTIwMDksOCArMjAwOSwxMCBAQCBzdGF0aWMgdm9pZCBsaXZlcGF0Y2hf
Y3JlYXRlX3BhdGNoZXNfc2VjdGlvbnMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsCj4gICAJCQlm
dW5jc1tpbmRleF0ub2xkX3NpemUgPSByZXN1bHQuc2l6ZTsKPiAgIAkJCWZ1bmNzW2luZGV4XS5u
ZXdfYWRkciA9IDA7Cj4gICAJCQlmdW5jc1tpbmRleF0ubmV3X3NpemUgPSBzeW0tPnN5bS5zdF9z
aXplOwo+IC0JCQlmdW5jc1tpbmRleF0udmVyc2lvbiA9IDE7Cj4gKwkJCWZ1bmNzW2luZGV4XS52
ZXJzaW9uID0gMjsKPiAgIAkJCW1lbXNldChmdW5jc1tpbmRleF0ucGFkLCAwLCBzaXplb2YgZnVu
Y3NbaW5kZXhdLnBhZCk7Cj4gKwkJCWZ1bmNzW2luZGV4XS5hcHBsaWVkID0gMDsKPiArCQkJbWVt
c2V0KGZ1bmNzW2luZGV4XS5fcGFkLCAwLCBzaXplb2YgZnVuY3NbaW5kZXhdLl9wYWQpOwo+ICAg
Cj4gICAJCQkvKgo+ICAgCQkJICogQWRkIGEgcmVsb2NhdGlvbiB0aGF0IHdpbGwgcG9wdWxhdGUK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
