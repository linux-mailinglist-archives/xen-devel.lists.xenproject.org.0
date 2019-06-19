Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63D84B002
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 04:28:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdQGt-0001z6-2T; Wed, 19 Jun 2019 02:24:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5kts=US=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1hdQGr-0001z1-9y
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 02:24:21 +0000
X-Inumbo-ID: 575827d6-9239-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 575827d6-9239-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 02:24:19 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2OH0I059493;
 Wed, 19 Jun 2019 02:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=wo5C4cIK+CFDK6ndeFNVNNiqCKM+8qE7NHBJGFfU5Sg=;
 b=P2Rj2Yg+ILLTttuRoKcPNGVKIdGkShEZTMF0MYywZKcyhSVS1RkLa4nNZDpyO9RXJVnQ
 q4U8VC4Q8bb5I375q/1ZSc2K+XeTATaiRTzRc6wFOzj8IEpsDqBp4Wwcm+GkLrFQSzTj
 l7o7D0Ibgao0iIDJucgPmqkmpNN4GCT+HOOZPyH82tituqDLjOQgPc+pB8Yn2Aa/pKTv
 odaGCVM0c5D8I8nrnlwC641rOTxTPlPM4xHxgHZNiC/axMqhbdkJ9wmBuEGNVgFlfXTq
 5rn5aeftiIOl+WP09DvglmuKZ8deuY7ubH7g5pGImrdE/18bsKFg+8wP5HPP8jEapQI0 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t78098nnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 02:24:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5J2MXTH050954;
 Wed, 19 Jun 2019 02:24:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2t77ynjn77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 02:24:16 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5J2OESH003350;
 Wed, 19 Jun 2019 02:24:14 GMT
Received: from [10.156.74.184] (/10.156.74.184)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 18 Jun 2019 19:24:13 -0700
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-11-ankur.a.arora@oracle.com>
 <c67f2fd9-c837-bc13-492f-f3bed7f01f05@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <aa050a5f-1897-64c0-d19d-d0f31b8d6c62@oracle.com>
Date: Tue, 18 Jun 2019 19:24:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c67f2fd9-c837-bc13-492f-f3bed7f01f05@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190017
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190017
Subject: Re: [Xen-devel] [RFC PATCH 10/16] xen/balloon: support ballooning
 in xenhost_t
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

CgpPbiA2LzE3LzE5IDI6MjggQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDkuMDUuMTkg
MTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+PiBYZW4gYmFsbG9vbmluZyB1c2VzIGhvbGxvdyBz
dHJ1Y3QgcGFnZXMgKHdpdGggdGhlIHVuZGVybHlpbmcgR0ZOcyBiZWluZwo+PiBwb3B1bGF0ZWQv
dW5wb3B1bGF0ZWQgdmlhIGh5cGVyY2FsbHMpIHdoaWNoIGFyZSB1c2VkIGJ5IHRoZSBncmFudCBs
b2dpYwo+PiB0byBtYXAgZ3JhbnRzIGZyb20gb3RoZXIgZG9tYWlucy4KPj4KPj4gVGhpcyBwYXRj
aCBhbGxvd3MgdGhlIGRlZmF1bHQgeGVuaG9zdCB0byBwcm92aWRlIGFuIGFsdGVybmF0ZSBiYWxs
b29uaW5nCj4+IGFsbG9jYXRpb24gbWVjaGFuaXNtLiBUaGlzIGlzIGV4cGVjdGVkIHRvIGJlIHVz
ZWZ1bCBmb3IgbG9jYWwgeGVuaG9zdHMKPj4gKHR5cGUgeGVuaG9zdF9yMCkgYmVjYXVzZSB1bmxp
a2UgWGVuLCB3aGVyZSB0aGVyZSBpcyBhbiBleHRlcm5hbAo+PiBoeXBlcnZpc29yIHdoaWNoIGNh
biBjaGFuZ2UgdGhlIG1lbW9yeSB1bmRlcm5lYXRoIGEgR0ZOLCB0aGF0IGlzIG5vdAo+PiBwb3Nz
aWJsZSB3aGVuIHRoZSBoeXBlcnZpc29yIGlzIHJ1bm5pbmcgaW4gdGhlIHNhbWUgYWRkcmVzcyBz
cGFjZQo+PiBhcyB0aGUgZW50aXR5IGRvaW5nIHRoZSBiYWxsb29uaW5nLgo+Pgo+PiBDby1kZXZl
bG9wZWQtYnk6IEFua3VyIEFyb3JhIDxhbmt1ci5hLmFyb3JhQG9yYWNsZS5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEpvYW8gTWFydGlucyA8am9hby5tLm1hcnRpbnNAb3JhY2xlLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogQW5rdXIgQXJvcmEgPGFua3VyLmEuYXJvcmFAb3JhY2xlLmNvbT4KPj4gLS0t
Cj4+IMKgIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmPCoMKgwqDCoMKgwqAgfMKgIDcgKysr
KysrKwo+PiDCoCBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmPCoMKgwqDCoMKgwqDCoCB8wqAg
OCArKysrKysrKwo+PiDCoCBkcml2ZXJzL3hlbi9iYWxsb29uLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDE5ICsrKysrKysrKysrKysrKystLS0KPj4gwqAgZHJpdmVycy94ZW4vZ3JhbnQt
dGFibGUuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tCj4+IMKgIGRyaXZlcnMveGVuL3By
aXZjbWQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KPj4gwqAgZHJpdmVy
cy94ZW4veGVuLXNlbGZiYWxsb29uLmPCoMKgwqDCoMKgIHzCoCAyICsrCj4+IMKgIGRyaXZlcnMv
eGVuL3hlbmJ1cy94ZW5idXNfY2xpZW50LmMgfMKgIDYgKysrLS0tCj4+IMKgIGRyaXZlcnMveGVu
L3hsYXRlX21tdS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tCj4+IMKgIGluY2x1
ZGUveGVuL2JhbGxvb24uaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KPj4g
wqAgaW5jbHVkZS94ZW4veGVuaG9zdC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxOSAr
KysrKysrKysrKysrKysrKysrCj4+IMKgIDEwIGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMo
KyksIDE0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9v
bi5jIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCj4+IGluZGV4IDVlZjRkNmFkOTIwZC4uMDhiZWNm
NTc0NzQzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMKPj4gKysrIGIvZHJp
dmVycy94ZW4vYmFsbG9vbi5jCj4+IEBAIC02Myw2ICs2Myw3IEBACj4+IMKgICNpbmNsdWRlIDxh
c20vdGxiLmg+Cj4+IMKgICNpbmNsdWRlIDx4ZW4vaW50ZXJmYWNlL3hlbi5oPgo+PiArI2luY2x1
ZGUgPHhlbi94ZW5ob3N0Lmg+Cj4+IMKgICNpbmNsdWRlIDxhc20veGVuL2h5cGVydmlzb3IuaD4K
Pj4gwqAgI2luY2x1ZGUgPGFzbS94ZW4vaHlwZXJjYWxsLmg+Cj4+IEBAIC01ODMsMTIgKzU4NCwy
MSBAQCBzdGF0aWMgaW50IGFkZF9iYWxsb29uZWRfcGFnZXMoaW50IG5yX3BhZ2VzKQo+PiDCoMKg
ICogQHBhZ2VzOiBwYWdlcyByZXR1cm5lZAo+PiDCoMKgICogQHJldHVybiAwIG9uIHN1Y2Nlc3Ms
IGVycm9yIG90aGVyd2lzZQo+PiDCoMKgICovCj4+IC1pbnQgYWxsb2NfeGVuYmFsbG9vbmVkX3Bh
Z2VzKGludCBucl9wYWdlcywgc3RydWN0IHBhZ2UgKipwYWdlcykKPj4gK2ludCBhbGxvY194ZW5i
YWxsb29uZWRfcGFnZXMoeGVuaG9zdF90ICp4aCwgaW50IG5yX3BhZ2VzLCBzdHJ1Y3QgcGFnZSAK
Pj4gKipwYWdlcykKPj4gwqAgewo+PiDCoMKgwqDCoMKgIGludCBwZ25vID0gMDsKPj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4gwqDCoMKgwqDCoCBpbnQgcmV0Owo+PiArwqDCoMKg
IC8qCj4+ICvCoMKgwqDCoCAqIHhlbm1lbSB0cmFuc2FjdGlvbnMgZm9yIHJlbW90ZSB4ZW5ob3N0
IGFyZSBkaXNhbGxvd2VkLgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBpZiAoeGgtPnR5cGUg
PT0geGVuaG9zdF9yMikKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+IAo+IFdo
eSBkb24ndCB5b3Ugc2V0IGEgZHVtbXkgZnVuY3Rpb24gcmV0dXJuaW5nIC1FSU5WQUwgaW50byB0
aGUgeGVuaG9zdF9yMgo+IHN0cnVjdHVyZSBpbnN0ZWFkPwpXaWxsIGRvLiBBbmQsIHNhbWUgZm9y
IHRoZSB0d28gY29tbWVudHMgYmVsb3cuCgpBbmt1cgoKPiAKPj4gKwo+PiArwqDCoMKgIGlmICh4
aC0+b3BzLT5hbGxvY19iYWxsb29uZWRfcGFnZXMpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
eGgtPm9wcy0+YWxsb2NfYmFsbG9vbmVkX3BhZ2VzKHhoLCBucl9wYWdlcywgcGFnZXMpOwo+PiAr
Cj4gCj4gUGxlYXNlIG1ha2UgYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKCkgYW4gaW5saW5lIHdy
YXBwZXIgYW5kIHVzZSB0aGUKPiBjdXJyZW50IGltcGxtZW50YWlvbiBhcyB0aGUgZGVmYXVsdC4g
VGhpcyBhdm9pZHMgYW5vdGhlciBpZiAoKS4KPiAKPj4gwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZi
YWxsb29uX211dGV4KTsKPj4gwqDCoMKgwqDCoCBiYWxsb29uX3N0YXRzLnRhcmdldF91bnBvcHVs
YXRlZCArPSBucl9wYWdlczsKPj4gQEAgLTYyMCw3ICs2MzAsNyBAQCBpbnQgYWxsb2NfeGVuYmFs
bG9vbmVkX3BhZ2VzKGludCBucl9wYWdlcywgc3RydWN0IAo+PiBwYWdlICoqcGFnZXMpCj4+IMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgwqAgb3V0X3VuZG86Cj4+IMKgwqDCoMKgwqAgbXV0ZXhf
dW5sb2NrKCZiYWxsb29uX211dGV4KTsKPj4gLcKgwqDCoCBmcmVlX3hlbmJhbGxvb25lZF9wYWdl
cyhwZ25vLCBwYWdlcyk7Cj4+ICvCoMKgwqAgZnJlZV94ZW5iYWxsb29uZWRfcGFnZXMoeGgsIHBn
bm8sIHBhZ2VzKTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoCB9Cj4+IMKgIEVYUE9S
VF9TWU1CT0woYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKTsKPj4gQEAgLTYzMCwxMCArNjQwLDEz
IEBAIEVYUE9SVF9TWU1CT0woYWxsb2NfeGVuYmFsbG9vbmVkX3BhZ2VzKTsKPj4gwqDCoCAqIEBu
cl9wYWdlczogTnVtYmVyIG9mIHBhZ2VzCj4+IMKgwqAgKiBAcGFnZXM6IHBhZ2VzIHRvIHJldHVy
bgo+PiDCoMKgICovCj4+IC12b2lkIGZyZWVfeGVuYmFsbG9vbmVkX3BhZ2VzKGludCBucl9wYWdl
cywgc3RydWN0IHBhZ2UgKipwYWdlcykKPj4gK3ZvaWQgZnJlZV94ZW5iYWxsb29uZWRfcGFnZXMo
eGVuaG9zdF90ICp4aCwgaW50IG5yX3BhZ2VzLCBzdHJ1Y3QgcGFnZSAKPj4gKipwYWdlcykKPj4g
wqAgewo+PiDCoMKgwqDCoMKgIGludCBpOwo+PiArwqDCoMKgIGlmICh4aC0+b3BzLT5mcmVlX2Jh
bGxvb25lZF9wYWdlcykKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiB4aC0+b3BzLT5mcmVlX2Jh
bGxvb25lZF9wYWdlcyh4aCwgbnJfcGFnZXMsIHBhZ2VzKTsKPj4gKwo+IAo+IFNhbWUgYWdhaW46
IHBsZWFzZSB1c2UgYW4gaW5saW5lIHdyYXBwZXIuCj4gCj4gCj4gSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
