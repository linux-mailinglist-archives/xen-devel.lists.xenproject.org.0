Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B334B04B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 05:00:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdQml-0004Xh-S4; Wed, 19 Jun 2019 02:57:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kts=US=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hdQmj-0004Xc-QI
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 02:57:17 +0000
X-Inumbo-ID: f21e499b-923d-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f21e499b-923d-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 02:57:16 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2nJj5064244;
 Wed, 19 Jun 2019 02:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=jowh4Q4xUHQyWNPimAhffMpXX6KZ+2w3g3sh8AxxwsY=;
 b=Pmi20vm4sK9eiMf5uhJceBaQ4Y1ZODgWavxSLVk4GF4GC0ls8cALPJ9JZMccAIQzJmQY
 sa6qSQELNDc86Ohi8ifXjwETuCdRl81AtVDE+doTgL53HDCeAVrvgLazXjqpAL0OX6h3
 dDX6xU+tLNOCY7yMZX9oUZcUG7/bfDoVZxWKu5EG+tjHNrTRXgzjp1TJePfIDJcBmokJ
 ikHePLDKgP5sj+tBMMeztwvvoOu578sH0RNALB6boHSPtTlRC5Wf3sRZ7ehvBdWNfD3c
 TAOwTwWjUSmxXBZHVdYku53tF2EORDBQnezjpABr0IZ0dFAKNM+rc8R7AF2J4rTVDjn7 kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2t78098qmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 02:57:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2raEA106635;
 Wed, 19 Jun 2019 02:55:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2t77ymtvjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 02:55:14 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5J2tD25016091;
 Wed, 19 Jun 2019 02:55:13 GMT
Received: from [10.156.74.184] (/10.156.74.184)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 19:55:13 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-14-ankur.a.arora@oracle.com>
 <2c025112-aaeb-0918-ff01-10842d285314@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <dc57c816-bceb-d4bb-af83-579bae58529f@oracle.com>
Date: Tue, 18 Jun 2019 19:55:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2c025112-aaeb-0918-ff01-10842d285314@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190021
Subject: Re: [Xen-devel] [RFC PATCH 13/16] drivers/xen: gnttab, evtchn,
 xenbus API changes
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

T24gNi8xNy8xOSAzOjA3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LjA1LjE5IDE5
OjI1LCBBbmt1ciBBcm9yYSB3cm90ZToKPj4gTWVjaGFuaWNhbCBjaGFuZ2VzLCBub3cgbW9zdCBv
ZiB0aGVzZSBjYWxscyB0YWtlIHhlbmhvc3RfdCAqCj4+IGFzIHBhcmFtZXRlci4KPj4KPj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBKb2FvIE1hcnRpbnMgPGpvYW8ubS5tYXJ0aW5zQG9yYWNsZS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFua3VyIEFyb3JhIDxhbmt1ci5hLmFyb3JhQG9yYWNsZS5jb20+Cj4+
IC0tLQo+PiDCoCBkcml2ZXJzL3hlbi9jcHVfaG90cGx1Zy5jwqDCoMKgwqAgfCAxNCArKysrKyst
LS0tLS0tCj4+IMKgIGRyaXZlcnMveGVuL2dudGFsbG9jLmPCoMKgwqDCoMKgwqDCoCB8IDEzICsr
KysrKysrLS0tLQo+PiDCoCBkcml2ZXJzL3hlbi9nbnRkZXYuY8KgwqDCoMKgwqDCoMKgwqDCoCB8
IDE2ICsrKysrKysrKysrLS0tLQo+PiDCoCBkcml2ZXJzL3hlbi9tYW5hZ2UuY8KgwqDCoMKgwqDC
oMKgwqDCoCB8IDM3ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgIGRy
aXZlcnMveGVuL3BsYXRmb3JtLXBjaS5jwqDCoMKgIHwgMTIgKysrKysrKy0tLS0tCj4+IMKgIGRy
aXZlcnMveGVuL3N5cy1oeXBlcnZpc29yLmPCoCB8IDEyICsrKysrKysrLS0tLQo+PiDCoCBkcml2
ZXJzL3hlbi94ZW4tYmFsbG9vbi5jwqDCoMKgwqAgfCAxMCArKysrKysrLS0tCj4+IMKgIGRyaXZl
cnMveGVuL3hlbmZzL3hlbnN0b3JlZC5jIHzCoCA3ICsrKystLS0KPj4gwqAgOCBmaWxlcyBjaGFu
Z2VkLCA3MyBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2NwdV9ob3RwbHVnLmMgYi9kcml2ZXJzL3hlbi9jcHVfaG90cGx1Zy5jCj4+
IGluZGV4IGFmZWI5NDQ0NmQzNC4uNGEwNWJjMDI4OTU2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L3hlbi9jcHVfaG90cGx1Zy5jCj4+ICsrKyBiL2RyaXZlcnMveGVuL2NwdV9ob3RwbHVnLmMKPj4g
QEAgLTMxLDEzICszMSwxMyBAQCBzdGF0aWMgdm9pZCBkaXNhYmxlX2hvdHBsdWdfY3B1KGludCBj
cHUpCj4+IMKgwqDCoMKgwqAgdW5sb2NrX2RldmljZV9ob3RwbHVnKCk7Cj4+IMKgIH0KPj4gLXN0
YXRpYyBpbnQgdmNwdV9vbmxpbmUodW5zaWduZWQgaW50IGNwdSkKPj4gK3N0YXRpYyBpbnQgdmNw
dV9vbmxpbmUoeGVuaG9zdF90ICp4aCwgdW5zaWduZWQgaW50IGNwdSkKPiAKPiBEbyB3ZSByZWFs
bHkgbmVlZCB4ZW5ob3N0IGZvciBjcHUgb24vb2ZmbGluaWc/Ckkgd2FzIGluIHR3byBtaW5kcyBh
Ym91dCB0aGlzLiBXZSBvbmx5IG5lZWQgaXQgZm9yIHRoZSB4ZW5idXMKaW50ZXJmYWNlcyB3aGlj
aCBjb3VsZCB2ZXJ5IHdlbGwgaGF2ZSBiZWVuIGp1c3QgeGhfZGVmYXVsdC4KCkhvd2V2ZXIsIHRo
ZSB4ZW5ob3N0IGlzIHBhcnQgb2YgdGhlIHhlbmJ1c193YXRjaCBzdGF0ZSwgc28KSSB0aG91Z2h0
IGl0IGlzIGVhc2llciB0byBwZXJjb2xhdGUgdGhhdCBkb3duIGluc3RlYWQgb2YKYWRkaW5nIHho
X2RlZmF1bHQgYWxsIG92ZXIgdGhlIHBsYWNlLgoKPiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL21hbmFnZS5jIGIvZHJpdmVycy94ZW4vbWFuYWdlLmMKPj4gaW5kZXggOWE2OWQ5NTVkZDVj
Li4xNjU1ZDBhMDM5ZmQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMveGVuL21hbmFnZS5jCj4+ICsr
KyBiL2RyaXZlcnMveGVuL21hbmFnZS5jCj4+IEBAIC0yMjcsMTQgKzIyNywxNCBAQCBzdGF0aWMg
dm9pZCBzaHV0ZG93bl9oYW5kbGVyKHN0cnVjdCB4ZW5idXNfd2F0Y2ggCj4+ICp3YXRjaCwKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gwqDCoCBhZ2FpbjoKPj4gLcKgwqDCoCBlcnIg
PSB4ZW5idXNfdHJhbnNhY3Rpb25fc3RhcnQoeGhfZGVmYXVsdCwgJnhidCk7Cj4+ICvCoMKgwqAg
ZXJyID0geGVuYnVzX3RyYW5zYWN0aW9uX3N0YXJ0KHdhdGNoLT54aCwgJnhidCk7Cj4+IMKgwqDC
oMKgwqAgaWYgKGVycikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gLcKgwqDCoCBz
dHIgPSAoY2hhciAqKXhlbmJ1c19yZWFkKHhoX2RlZmF1bHQsIHhidCwgImNvbnRyb2wiLCAic2h1
dGRvd24iLCAKPj4gTlVMTCk7Cj4+ICvCoMKgwqAgc3RyID0gKGNoYXIgKil4ZW5idXNfcmVhZCh3
YXRjaC0+eGgsIHhidCwgImNvbnRyb2wiLCAic2h1dGRvd24iLCAKPj4gTlVMTCk7Cj4+IMKgwqDC
oMKgwqAgLyogSWdub3JlIHJlYWQgZXJyb3JzIGFuZCBlbXB0eSByZWFkcy4gKi8KPj4gwqDCoMKg
wqDCoCBpZiAoWEVOQlVTX0lTX0VSUl9SRUFEKHN0cikpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHhl
bmJ1c190cmFuc2FjdGlvbl9lbmQoeGhfZGVmYXVsdCwgeGJ0LCAxKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIHhlbmJ1c190cmFuc2FjdGlvbl9lbmQod2F0Y2gtPnhoLCB4YnQsIDEpOwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuOwo+PiDCoMKgwqDCoMKgIH0KPj4gQEAgLTI0NSw5ICsyNDUsOSBA
QCBzdGF0aWMgdm9pZCBzaHV0ZG93bl9oYW5kbGVyKHN0cnVjdCB4ZW5idXNfd2F0Y2ggCj4+ICp3
YXRjaCwKPj4gwqDCoMKgwqDCoCAvKiBPbmx5IGFja25vd2xlZGdlIGNvbW1hbmRzIHdoaWNoIHdl
IGFyZSBwcmVwYXJlZCB0byBoYW5kbGUuICovCj4+IMKgwqDCoMKgwqAgaWYgKGlkeCA8IEFSUkFZ
X1NJWkUoc2h1dGRvd25faGFuZGxlcnMpKQo+PiAtwqDCoMKgwqDCoMKgwqAgeGVuYnVzX3dyaXRl
KHhoX2RlZmF1bHQsIHhidCwgImNvbnRyb2wiLCAic2h1dGRvd24iLCAiIik7Cj4+ICvCoMKgwqDC
oMKgwqDCoCB4ZW5idXNfd3JpdGUod2F0Y2gtPnhoLCB4YnQsICJjb250cm9sIiwgInNodXRkb3du
IiwgIiIpOwo+PiAtwqDCoMKgIGVyciA9IHhlbmJ1c190cmFuc2FjdGlvbl9lbmQoeGhfZGVmYXVs
dCwgeGJ0LCAwKTsKPj4gK8KgwqDCoCBlcnIgPSB4ZW5idXNfdHJhbnNhY3Rpb25fZW5kKHdhdGNo
LT54aCwgeGJ0LCAwKTsKPj4gwqDCoMKgwqDCoCBpZiAoZXJyID09IC1FQUdBSU4pIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGtmcmVlKHN0cik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGFn
YWluOwo+PiBAQCAtMjcyLDEwICsyNzIsMTAgQEAgc3RhdGljIHZvaWQgc3lzcnFfaGFuZGxlcihz
dHJ1Y3QgeGVuYnVzX3dhdGNoIAo+PiAqd2F0Y2gsIGNvbnN0IGNoYXIgKnBhdGgsCj4+IMKgwqDC
oMKgwqAgaW50IGVycjsKPj4gwqDCoCBhZ2FpbjoKPj4gLcKgwqDCoCBlcnIgPSB4ZW5idXNfdHJh
bnNhY3Rpb25fc3RhcnQoeGhfZGVmYXVsdCwgJnhidCk7Cj4+ICvCoMKgwqAgZXJyID0geGVuYnVz
X3RyYW5zYWN0aW9uX3N0YXJ0KHdhdGNoLT54aCwgJnhidCk7Cj4+IMKgwqDCoMKgwqAgaWYgKGVy
cikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gLcKgwqDCoCBlcnIgPSB4ZW5idXNf
c2NhbmYoeGhfZGVmYXVsdCwgeGJ0LCAiY29udHJvbCIsICJzeXNycSIsICIlYyIsIAo+PiAmc3lz
cnFfa2V5KTsKPj4gK8KgwqDCoCBlcnIgPSB4ZW5idXNfc2NhbmYod2F0Y2gtPnhoLCB4YnQsICJj
b250cm9sIiwgInN5c3JxIiwgIiVjIiwgCj4+ICZzeXNycV9rZXkpOwo+PiDCoMKgwqDCoMKgIGlm
IChlcnIgPCAwKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIFRoZSBYZW5zdG9yZSB3YXRjaCBmaXJlcyBkaXJlY3RseSBhZnRlciByZWdpc3Rlcmlu
ZyBpdCBhbmQKPj4gQEAgLTI4NywyMSArMjg3LDIxIEBAIHN0YXRpYyB2b2lkIHN5c3JxX2hhbmRs
ZXIoc3RydWN0IHhlbmJ1c193YXRjaCAKPj4gKndhdGNoLCBjb25zdCBjaGFyICpwYXRoLAo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyciAhPSAtRU5PRU5UICYmIGVyciAhPSAtRVJBTkdFKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9lcnIoIkVycm9yICVkIHJlYWRpbmcgc3lz
cnEgY29kZSBpbiBjb250cm9sL3N5c3JxXG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVycik7Cj4+IC3CoMKgwqDCoMKgwqDCoCB4ZW5idXNfdHJhbnNhY3Rp
b25fZW5kKHhoX2RlZmF1bHQsIHhidCwgMSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCB4ZW5idXNfdHJh
bnNhY3Rpb25fZW5kKHdhdGNoLT54aCwgeGJ0LCAxKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybjsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgaWYgKHN5c3JxX2tleSAhPSAnXDAn
KSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBlcnIgPSB4ZW5idXNfcHJpbnRmKHhoX2RlZmF1bHQsIHhi
dCwgImNvbnRyb2wiLCAic3lzcnEiLCAKPj4gIiVjIiwgJ1wwJyk7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBlcnIgPSB4ZW5idXNfcHJpbnRmKHdhdGNoLT54aCwgeGJ0LCAiY29udHJvbCIsICJzeXNycSIs
ICIlYyIsIAo+PiAnXDAnKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfZXJyKCIlczogRXJyb3IgJWQgd3JpdGluZyBzeXNy
cSBpbiBjb250cm9sL3N5c3JxXG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF9fZnVuY19fLCBlcnIpOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZW5i
dXNfdHJhbnNhY3Rpb25fZW5kKHhoX2RlZmF1bHQsIHhidCwgMSk7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHhlbmJ1c190cmFuc2FjdGlvbl9lbmQod2F0Y2gtPnhoLCB4YnQsIDEpOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9
Cj4+IMKgwqDCoMKgwqAgfQo+PiAtwqDCoMKgIGVyciA9IHhlbmJ1c190cmFuc2FjdGlvbl9lbmQo
eGhfZGVmYXVsdCwgeGJ0LCAwKTsKPj4gK8KgwqDCoCBlcnIgPSB4ZW5idXNfdHJhbnNhY3Rpb25f
ZW5kKHdhdGNoLT54aCwgeGJ0LCAwKTsKPj4gwqDCoMKgwqDCoCBpZiAoZXJyID09IC1FQUdBSU4p
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGFnYWluOwo+PiBAQCAtMzI0LDE0ICszMjQsMTQg
QEAgc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayB4ZW5fcmVib290X25iID0gewo+PiDCoMKg
wqDCoMKgIC5ub3RpZmllcl9jYWxsID0gcG93ZXJvZmZfbmIsCj4+IMKgIH07Cj4+IC1zdGF0aWMg
aW50IHNldHVwX3NodXRkb3duX3dhdGNoZXIodm9pZCkKPj4gK3N0YXRpYyBpbnQgc2V0dXBfc2h1
dGRvd25fd2F0Y2hlcih4ZW5ob3N0X3QgKnhoKQo+IAo+IEkgdGhpbmsgc2h1dGRvd24gaXMgcHVy
ZWx5IGxvY2FsLCB0b28uClllcywgSSBpbnRyb2R1Y2VkIHhlbmhvc3QgZm9yIHRoZSBzYW1lIHJl
YXNvbiBhcyBhYm92ZS4KCkkgYWdyZWUgdGhhdCBlaXRoZXIgb2YgdGhlc2UgY2FzZXMgKGFuZCBz
aW1pbGFyIG90aGVycykgaGF2ZSBubyB1c2UKZm9yIHRoZSBjb25jZXB0IG9mIHhlbmhvc3QuIERv
IHlvdSB0aGluayBpdCBtYWtlcyBzZW5zZSBmb3IgdGhlc2UKdG8gcGFzcyBOVUxMIGluc3RlYWQg
YW5kIHRoZSB1bmRlcmx5aW5nIGludGVyZmFjZSB3b3VsZCBqdXN0IGFzc3VtZQp4aF9kZWZhdWx0
LgoKQW5rdXIKCj4gCj4gCj4gSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
