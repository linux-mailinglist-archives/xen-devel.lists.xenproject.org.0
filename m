Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F234B000
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 04:27:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdQHm-00021Y-Eh; Wed, 19 Jun 2019 02:25:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kts=US=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hdQHk-00021Q-Uh
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 02:25:16 +0000
X-Inumbo-ID: 795b2386-9239-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 795b2386-9239-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 02:25:16 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2Olgm059593;
 Wed, 19 Jun 2019 02:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=bKxrAYHwoH0/SIJITZmlVmnts64uX0JP+N6ODtWcKB8=;
 b=wA7QDUr/rs9c2cSLSyO3D8p8dT7zL6SsTSugm4VYGsoNuYN/3lkdljIIn5CADg3ofGhg
 i+wxm46yOJm/SqhB2dv+b+ZItBq6QeOtJtctRO+xEArsEL3aFRyy6DX/2rdWRL52LczV
 eKf7AbI7e1f4QADAEuR3hzhMUJ0DuAq9nhaCiiDVaCTXeumP6ZA5HvE6NfDFl2I61rQ+
 KpTreqC54vt7ULpeiI5PGSq4KuArcKDBR2tmuBI6XyOvuyc3wUSaeXhkv5H6ULcy3+NA
 w91UWFzOHmd2aNAGdSguZV/B6lVL22MeMf5Kf43SOLH8MU3JqSX8kUEN9xRYl7+4lLUT Kg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2t78098nrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 02:25:14 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2PE9F121124;
 Wed, 19 Jun 2019 02:25:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2t77ymtnba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 02:25:14 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5J2PCYi018386;
 Wed, 19 Jun 2019 02:25:12 GMT
Received: from [10.156.74.184] (/10.156.74.184)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 19:25:12 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-12-ankur.a.arora@oracle.com>
 <71d3131a-cd14-6bf6-391a-6e4b0533fb23@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <3986345a-2f34-52cd-7d5f-3cd1d8b3267e@oracle.com>
Date: Tue, 18 Jun 2019 19:25:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <71d3131a-cd14-6bf6-391a-6e4b0533fb23@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190017
Subject: Re: [Xen-devel] [RFC PATCH 11/16] xen/grant-table: make grant-table
 xenhost aware
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

T24gNi8xNy8xOSAyOjM2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LjA1LjE5IDE5
OjI1LCBBbmt1ciBBcm9yYSB3cm90ZToKPj4gTGFyZ2VseSBtZWNoYW5pY2FsIGNoYW5nZXM6IHRo
ZSBleHBvcnRlZCBncmFudCB0YWJsZSBzeW1ib2xzIG5vdyB0YWtlCj4+IHhlbmhvc3RfdCAqIGFz
IGEgcGFyYW1ldGVyLiBBbHNvLCBtb3ZlIHRoZSBncmFudCB0YWJsZSBnbG9iYWwgc3RhdGUKPj4g
aW5zaWRlIHhlbmhvc3RfdC4KPj4KPj4gSWYgdGhlcmUncyBtb3JlIHRoYW4gb25lIHhlbmhvc3Qs
IHRoZW4gaW5pdGlhbGl6ZSBib3RoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmt1ciBBcm9yYSA8
YW5rdXIuYS5hcm9yYUBvcmFjbGUuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC94ODYveGVuL2dyYW50
LXRhYmxlLmMgfMKgIDcxICsrKy0tCj4+IMKgIGRyaXZlcnMveGVuL2dyYW50LXRhYmxlLmPCoCB8
IDYxMSArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4+IMKgIGluY2x1ZGUv
eGVuL2dyYW50X3RhYmxlLmjCoCB8wqAgNzIgKystLS0KPj4gwqAgaW5jbHVkZS94ZW4veGVuaG9z
dC5owqDCoMKgwqDCoCB8wqAgMTEgKwo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDQ0MyBpbnNlcnRp
b25zKCspLCAzMjIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94
ZW5ob3N0LmggYi9pbmNsdWRlL3hlbi94ZW5ob3N0LmgKPj4gaW5kZXggOWUwODYyN2E5ZTNlLi5h
Y2VlMGM3ODcyYjYgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUveGVuL3hlbmhvc3QuaAo+PiArKysg
Yi9pbmNsdWRlL3hlbi94ZW5ob3N0LmgKPj4gQEAgLTEyOSw2ICsxMjksMTcgQEAgdHlwZWRlZiBz
dHJ1Y3Qgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGV2dGNobl9vcHMgKmV2
dGNobl9vcHM7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgKipldnRjaG5fdG9faXJxOwo+PiDC
oMKgwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoCAvKiBncmFudCB0YWJsZSBwcml2YXRlIHN0YXRl
ICovCj4+ICvCoMKgwqAgc3RydWN0IHsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIHByaXZhdGUgdG8g
ZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyAqLwo+PiArwqDCoMKgwqDCoMKgwqAgdm9pZCAqZ250
dGFiX3ByaXZhdGU7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIHg4Ni94ZW4vZ3JhbnQtdGFi
bGUuYyAqLwo+PiArwqDCoMKgwqDCoMKgwqAgdm9pZCAqZ250dGFiX3NoYXJlZF92bV9hcmVhOwo+
PiArwqDCoMKgwqDCoMKgwqAgdm9pZCAqZ250dGFiX3N0YXR1c192bV9hcmVhOwo+PiArwqDCoMKg
wqDCoMKgwqAgdm9pZCAqYXV0b194bGF0X2dyYW50X2ZyYW1lczsKPiAKPiBQbGVhc2UgdXNlIHBy
b3BlciB0eXBlcyBoZXJlIGluc3RlYWQgb2Ygdm9pZCAqLiBUaGlzIGF2b2lkcyBsb3RzIG9mCj4g
Y2FzdHMuIEl0IGlzIG9rYXkgdG8ganVzdCBhZGQgYW5vbnltb3VzIHN0cnVjdCBkZWZpbml0aW9u
cyBhbmQga2VlcCB0aGUKPiByZWFsIHN0cnVjdCBsYXlvdXQgbG9jYWwgdG8gZ3JhbnQgdGFibGUg
Y29kZS4KV2lsbCBmaXguCgpBbmt1cgoKPiAKPiAKPiBKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
