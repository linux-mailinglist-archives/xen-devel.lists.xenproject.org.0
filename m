Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89221F9F22
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 01:15:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUgG7-0007Jj-DH; Wed, 13 Nov 2019 00:11:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PYqA=ZF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iUgG6-0007Je-4U
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 00:11:42 +0000
X-Inumbo-ID: 2a78b8ea-05aa-11ea-a221-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a78b8ea-05aa-11ea-a221-12813bfff9fa;
 Wed, 13 Nov 2019 00:11:40 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACNXZ7E135906;
 Wed, 13 Nov 2019 00:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=cSoz0KVfyiiHhh/05ISHWBrXs+nwUxXvSwhNf/31BhY=;
 b=QRR5yLMCEPRMnh21mJi5yLP72DFVjn485N0Dn9j8h2mkk/Wo3+ipxPJTnWUAG2dPsCs6
 jalPLjhjRd14fQuEXs2WHPe1eFzQYAXbvgYVOaE2syaZiCZ1xT5PeD5RSxf80j/X9Uxr
 vMoQnUjhCmS1QuYf3fk7WXk0xoyMvo+kWh8zSFRZ6Geq1ZIkhAvgxc6MmaYmsRj6awUY
 0sDg37ElECNlU2HBJdqDi8ig7luRgWvr7yj0LrDCZtxgjlUkgl1VnxVqFFhdndYxYjHu
 AolkyjdBSFOF7ZS3xjZpvsnUGrODFNxdaoaG1hgVPDvyXe1Zxg0+bOPYx761EUlc1MKj 9Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2w5mvtrf65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 00:11:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACNXF3T176212;
 Wed, 13 Nov 2019 00:11:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2w7j03rqgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 00:11:37 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAD0Bale008024;
 Wed, 13 Nov 2019 00:11:36 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 16:11:36 -0800
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
 <c1f58da4-0a05-5f77-13bd-a421582675d0@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <9466c080-9926-0d9f-435a-ddf0c3ec7812@oracle.com>
Date: Tue, 12 Nov 2019 19:11:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <c1f58da4-0a05-5f77-13bd-a421582675d0@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=944
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120201
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120201
Subject: Re: [Xen-devel] [PATCH 2/3] xen/mcelog: add PPIN to record when
 available
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTEvMTkgOTo0NiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBpcyB0byBhdWdt
ZW50IGNvbW1pdCAzZjVhNzg5NmE1ICgieDg2L21jZTogSW5jbHVkZSB0aGUgUFBJTiBpbiBNQ0UK
PiByZWNvcmRzIHdoZW4gYXZhaWxhYmxlIikuCj4KPiBJJ20gYWxzbyBhZGRpbmcgInN5bmQiIGFu
ZCAiaXBpZCIgZmllbGRzIHRvIHN0cnVjdCB4ZW5fbWNlLCBpbiBhbgo+IGF0dGVtcHQgdG8ga2Vl
cCBmaWVsZCBvZmZzZXRzIGluIHN5bmMgd2l0aCBzdHJ1Y3QgbWNlLiBUaGVzZSB0d28gZmllbGRz
Cj4gd29uJ3QgZ2V0IHBvcHVsYXRlZCBmb3Igbm93LCB0aG91Z2guCj4KPiBTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9tc3ItaW5kZXguaAo+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci1pbmRl
eC5oCj4gQEAgLTM5Myw2ICszOTMsOCBAQAo+ICAjZGVmaW5lIE1TUl9BTURfUFNUQVRFX0RFRl9C
QVNFCQkweGMwMDEwMDY0Cj4gICNkZWZpbmUgTVNSX0FNRDY0X09TVldfSURfTEVOR1RICTB4YzAw
MTAxNDAKPiAgI2RlZmluZSBNU1JfQU1ENjRfT1NWV19TVEFUVVMJCTB4YzAwMTAxNDEKPiArI2Rl
ZmluZSBNU1JfQU1EX1BQSU5fQ1RMCQkweGMwMDEwMmYwCj4gKyNkZWZpbmUgTVNSX0FNRF9QUElO
CQkJMHhjMDAxMDJmMQoKV2hpY2ggcHJvY2Vzc29ycyBhcmUgdGhlc2UgZGVmaW5lZCBmb3I/IEkg
bG9va2VkIGF0IGEgY291cGxlIChmYW0gMTVoCmFuZCAxN2gpIGFuZCBkaWRuJ3Qgc2VlIHRob3Nl
LiBBbmQgSSBkb24ndCBzZWUgdGhlbSBpbiBMaW51eC4KCj4gICNkZWZpbmUgTVNSX0FNRDY0X0xT
X0NGRwkJMHhjMDAxMTAyMAo+ICAjZGVmaW5lIE1TUl9BTUQ2NF9EQ19DRkcJCTB4YzAwMTEwMjIK
PiAgI2RlZmluZSBNU1JfQU1ENjRfQlVfQ0ZHMgkJMHhjMDAxMTAyYQo+IC0tLSBhL2RyaXZlcnMv
eGVuL21jZWxvZy5jCj4gKysrIGIvZHJpdmVycy94ZW4vbWNlbG9nLmMKPiBAQCAtMjUzLDYgKzI1
MywxMSBAQCBzdGF0aWMgaW50IGNvbnZlcnRfbG9nKHN0cnVjdCBtY19pbmZvICptCj4gIAkJY2Fz
ZSBNU1JfSUEzMl9NQ0dfQ0FQOgo+ICAJCQltLm1jZ2NhcCA9IGdfcGh5c2luZm9baV0ubWNfbXNy
dmFsdWVzW2pdLnZhbHVlOwo+ICAJCQlicmVhazsKPiArCj4gKwkJY2FzZSBNU1JfUFBJTjoKPiAr
CQljYXNlIE1TUl9BTURfUFBJTjoKPiArCQkJbS5wcGluID0gZ19waHlzaW5mb1tpXS5tY19tc3J2
YWx1ZXNbal0udmFsdWU7Cj4gKwkJCWJyZWFrOwo+ICAJCX0KPiAgCj4gIAltaWMgPSBOVUxMOwo+
IC0tLSBhL2luY2x1ZGUveGVuL2ludGVyZmFjZS94ZW4tbWNhLmgKPiArKysgYi9pbmNsdWRlL3hl
bi9pbnRlcmZhY2UveGVuLW1jYS5oCj4gQEAgLTMzMiw3ICszMzIsMTEgQEAgc3RydWN0IHhlbl9t
YyB7Cj4gIH07Cj4gIERFRklORV9HVUVTVF9IQU5ETEVfU1RSVUNUKHhlbl9tYyk7Cj4gIAo+IC0v
KiBGaWVsZHMgYXJlIHplcm8gd2hlbiBub3QgYXZhaWxhYmxlICovCj4gKy8qCj4gKyAqIEZpZWxk
cyBhcmUgemVybyB3aGVuIG5vdCBhdmFpbGFibGUuIEFsc28sIHRoaXMgc3RydWN0IGlzIHNoYXJl
ZCB3aXRoCj4gKyAqIHVzZXJzcGFjZSBtY2Vsb2cgYW5kIHRodXMgbXVzdCBrZWVwIGV4aXN0aW5n
IGZpZWxkcyBhdCBjdXJyZW50IG9mZnNldHMuCj4gKyAqIE9ubHkgYWRkIG5ldyBmaWVsZHMgdG8g
dGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlCj4gKyAqLwo+ICBzdHJ1Y3QgeGVuX21jZSB7CgoKV2h5
IGlzIHRoaXMgc3RydWN0dXJlIGlzIHBhcnQgb2YgdGhlIGludGVyZmFjZT8KCgotYm9yaXMKCj4g
IAlfX3U2NCBzdGF0dXM7Cj4gIAlfX3U2NCBtaXNjOwo+IEBAIC0zNTMsNiArMzU3LDkgQEAgc3Ry
dWN0IHhlbl9tY2Ugewo+ICAJX191MzIgc29ja2V0aWQ7CS8qIENQVSBzb2NrZXQgSUQgKi8KPiAg
CV9fdTMyIGFwaWNpZDsJLyogQ1BVIGluaXRpYWwgYXBpYyBJRCAqLwo+ICAJX191NjQgbWNnY2Fw
OwkvKiBNQ0dDQVAgTVNSOiBtYWNoaW5lIGNoZWNrIGNhcGFiaWxpdGllcyBvZiBDUFUgKi8KPiAr
CV9fdTY0IHN5bmQ7CS8qIE1DQV9TWU5EIE1TUjogb25seSB2YWxpZCBvbiBTTUNBIHN5c3RlbXMg
Ki8KPiArCV9fdTY0IGlwaWQ7CS8qIE1DQV9JUElEIE1TUjogb25seSB2YWxpZCBvbiBTTUNBIHN5
c3RlbXMgKi8KPiArCV9fdTY0IHBwaW47CS8qIFByb3RlY3RlZCBQcm9jZXNzb3IgSW52ZW50b3J5
IE51bWJlciAqLwo+ICB9Owo+ICAKPiAgLyoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
