Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A2C1282A2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:14:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiNgH-0001iZ-Pt; Fri, 20 Dec 2019 19:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BDN=2K=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iiNgF-0001iU-SV
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:11:19 +0000
X-Inumbo-ID: 8078c300-235c-11ea-93e1-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8078c300-235c-11ea-93e1-12813bfff9fa;
 Fri, 20 Dec 2019 19:11:19 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBKJAHoD177728;
 Fri, 20 Dec 2019 19:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=8GZNBShQQ7V7PrA2Jhwg30hVOWFWIPLHm0EN5lU1Eu8=;
 b=mPeiQp9yK7rPQbnlM57whCzPPwFGWhjdmk33fMFd39X7bXX5KmyxbqzlImmNHgWyZegU
 w2/BaDaQbVjLp2KtL3lWEh8Axw+YkVqId93CtbxRDnG3Qlb+mbsrfCs3BUB/lEIVPXMv
 e43jw8VrixidUhz2BwT2V+vd5o0eeBsaRXy7qW0B1StKicT+0YrOg6eEHLVHDvECebPW
 wimz8t79xTJNgcfKqKA7zN+ReoGrKJw7hBJTNBIv/UR4lsXcMXRLfl24XOnwJSmhHGPG
 GpY0FJwupGjKq5VtIyVBZfwumEqBPZhvq+RDbeXwZKTn+gu4AqK1vweJoVvycXfrwPhq Xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2x01kntfh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Dec 2019 19:11:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBKJALLZ041856;
 Fri, 20 Dec 2019 19:11:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2x13tjuuyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Dec 2019 19:11:07 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBKJB4xp008032;
 Fri, 20 Dec 2019 19:11:04 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 20 Dec 2019 11:11:04 -0800
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20191219034941.19141-1-marmarek@invisiblethingslab.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <4ed998e1-c8e6-a2c3-031a-9104c912cb76@oracle.com>
Date: Fri, 20 Dec 2019 14:11:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191219034941.19141-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9477
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=994
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912200143
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9477
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912200143
Subject: Re: [Xen-devel] [PATCH v2] xen-pciback: optionally allow interrupt
 enable flag writes
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8xOC8xOSAxMDo0OSBQTSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3Rl
Ogo+IC0tLQo+ICAgZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZS5jICAgICAgICAg
IHwgMzUgKysrKysrKysKPiAgIGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2UuaCAg
ICAgICAgICB8IDEwICsrKwo+ICAgLi4uL3hlbi94ZW4tcGNpYmFjay9jb25mX3NwYWNlX2NhcGFi
aWxpdHkuYyAgIHwgODggKysrKysrKysrKysrKysrKysrKwo+ICAgZHJpdmVycy94ZW4veGVuLXBj
aWJhY2svY29uZl9zcGFjZV9oZWFkZXIuYyAgIHwgMTkgKysrKwo+ICAgZHJpdmVycy94ZW4veGVu
LXBjaWJhY2svcGNpX3N0dWIuYyAgICAgICAgICAgIHwgNjYgKysrKysrKysrKysrKysKPiAgIGRy
aXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaWJhY2suaCAgICAgICAgICAgICB8ICAxICsKPiAgIDYg
ZmlsZXMgY2hhbmdlZCwgMjE5IGluc2VydGlvbnMoKykKClRoaXMgYWxzbyBuZWVkcyBhbiB1cGRh
dGUgdG8gRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItcGNpYmFjay4KCgo+
IEBAIC02NCw2ICs2NCw3IEBAIHN0YXRpYyBpbnQgY29tbWFuZF93cml0ZShzdHJ1Y3QgcGNpX2Rl
diAqZGV2LCBpbnQgb2Zmc2V0LCB1MTYgdmFsdWUsIHZvaWQgKmRhdGEpCj4gICAJaW50IGVycjsK
PiAgIAl1MTYgdmFsOwo+ICAgCXN0cnVjdCBwY2lfY21kX2luZm8gKmNtZCA9IGRhdGE7Cj4gKwl1
MTYgY2FwX3ZhbHVlOwoKV2hhdCBpcyB0aGlzIGZvcj8KCgo+ICAgCj4gICAJZGV2X2RhdGEgPSBw
Y2lfZ2V0X2RydmRhdGEoZGV2KTsKPiAgIAlpZiAoIXBjaV9pc19lbmFibGVkKGRldikgJiYgaXNf
ZW5hYmxlX2NtZCh2YWx1ZSkpIHsKPiBAQCAtMTE3LDYgKzExOCwyNCBAQCBzdGF0aWMgaW50IGNv
bW1hbmRfd3JpdGUoc3RydWN0IHBjaV9kZXYgKmRldiwgaW50IG9mZnNldCwgdTE2IHZhbHVlLCB2
b2lkICpkYXRhKQo+ICAgCQlwY2lfY2xlYXJfbXdpKGRldik7Cj4gICAJfQo+ICAgCj4gKwlpZiAo
ZGV2X2RhdGEgJiYgZGV2X2RhdGEtPmFsbG93X2ludGVycnVwdF9jb250cm9sKSB7Cj4gKwkJaWYg
KCEoY21kLT52YWwgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpICYmCj4gKwkJICAgICh2YWx1
ZSAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSkpIHsKPiArCQkJcGNpX2ludHgoZGV2LCAwKTsK
PiArCQl9IGVsc2UgaWYgKChjbWQtPnZhbCAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSkgJiYK
PiArCQkgICAgISh2YWx1ZSAmIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSkpIHsKPiArCQkJLyog
RG8gbm90IGFsbG93IGVuYWJsaW5nIElOVHggdG9nZXRoZXIgd2l0aCBNU0kgb3IgTVNJLVguICov
Cj4gKwkJCXN3aXRjaCAoeGVuX3BjaWJrX2dldF9pbnRlcnJ1cHRfdHlwZShkZXYpKSB7Cj4gKwkJ
CQljYXNlIElOVEVSUlVQVF9UWVBFX05PTkU6Cj4gKwkJCQljYXNlIElOVEVSUlVQVF9UWVBFX0lO
VFg6Cj4gKwkJCQkJcGNpX2ludHgoZGV2LCAxKTsKPiArCQkJCQlicmVhazsKPiArCQkJCWRlZmF1
bHQ6Cj4gKwkJCQkJcmV0dXJuIFBDSUJJT1NfU0VUX0ZBSUxFRDsKPiArCQkJfQo+ICsJCX0KCgpQ
ZXJoYXBzIHRoaXMgaXMgc2xpZ2h0bHkgZWFzaWVyIHRvIHJlYWQ6CgppZiAoY21kLT52YWwgXiB2
YWwpwqAgJsKgIFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSkgewogwqDCoMKgIMKgwqDCoCBpZiAo
dmFsdWUgJiBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEUpIHsKIMKgwqDCoCDCoMKgIMKgwqDCoCDC
oCDCoMKgIHBjaV9pbnR4KGRldiwgMCk7CiDCoMKgwqAgwqDCoMKgIH0gZWxzZSB7CiDCoMKgwqAg
wqDCoMKgIMKgwqDCoMKgwqDCoMKgIC8qIERvIG5vdCBhbGxvdyBlbmFibGluZyBJTlR4IHRvZ2V0
aGVyIHdpdGggTVNJIG9yIApNU0ktWC4gKi8KIMKgwqAgwqDCoMKgIMKgwqDCoMKgIHN3aXRjaCAo
eGVuX3BjaWJrX2dldF9pbnRlcnJ1cHRfdHlwZShkZXYpKSB7CiDCoMKgIMKgwqDCoCDCoMKgwqAg
wqDCoMKgwqAgY2FzZSBJTlRFUlJVUFRfVFlQRV9OT05FOgogwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoMKgIGNhc2UgSU5URVJSVVBUX1RZUEVfSU5UWDoKIMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgwqAgcGNpX2ludHgoZGV2LCAxKTsKIMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
wqDCoMKgwqAgYnJlYWs7CiDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgwqAgZGVmYXVsdDoKIMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgwqAgcmV0dXJuIFBDSUJJT1NfU0VUX0ZBSUxF
RDsKIMKgwqAgwqDCoMKgIMKgwqDCoMKgIH0KIMKgIMKgwqDCoMKgIH0KfQoKQW5kIGFsc28sIGlm
IElOVEVSUlVQVF9UWVBFX0lOVFgsIGFyZW4ndCB5b3UgYWxyZWFkeSBlbmFibGVkPwoKCi1ib3Jp
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
