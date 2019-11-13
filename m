Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A47FB540
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 17:37:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUvc7-0004I7-Pp; Wed, 13 Nov 2019 16:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PYqA=ZF=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iUvc6-0004I2-0e
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:35:26 +0000
X-Inumbo-ID: 91a4a892-0633-11ea-a238-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91a4a892-0633-11ea-a238-12813bfff9fa;
 Wed, 13 Nov 2019 16:35:15 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADGON4i180200;
 Wed, 13 Nov 2019 16:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=ViZkFUUwtX41jyhTGipRjvtm/b1fOmna08342oZ9TvQ=;
 b=COBWHBkaUQ0h8ZRfIjfIXNEoAtK2yY6bm4CB9utGr/XFMlrhujpizO8U9gG88bkviPQK
 WNXW+LTokzDqO8H7kdTH4YL4Bouo/UvAXIlk/ClRE2kHzTi4LgY1xlR7oP6REJsw/3Hr
 QO7S3NaKrDiVXtolTY85VDdvyKwq3f/77J8BYFCz2OnvAb0AILo/Lk0GhFkDQatX1HdN
 GhZiPi1dd4iu23O8OvoEI4faXEED+Pt4axxAaMQlUkj6Nn3BUDnscB4ahckpmcjhXTXU
 3sqDALmVS4DNSliLooih91rLCaOWUIQS4+ewY8jWbk+xRqld8dRwuFL1NNKmJXuY9pTz 8w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2w5p3qwjyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 16:35:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xADGQtgE155926;
 Wed, 13 Nov 2019 16:35:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2w8g17sna1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 16:35:11 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xADGYwpb007489;
 Wed, 13 Nov 2019 16:34:58 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Nov 2019 08:34:58 -0800
To: Jan Beulich <jbeulich@suse.com>
References: <a83f42ad-c380-c07f-7d22-7f19107db5d5@suse.com>
 <c1f58da4-0a05-5f77-13bd-a421582675d0@suse.com>
 <9466c080-9926-0d9f-435a-ddf0c3ec7812@oracle.com>
 <5f8bbcb2-2eb9-c9f4-622a-43a6d0814b94@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <e3409dfb-3d81-e06f-192b-bb4a3546c628@oracle.com>
Date: Wed, 13 Nov 2019 11:34:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <5f8bbcb2-2eb9-c9f4-622a-43a6d0814b94@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=832
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911130146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9440
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=902 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911130146
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTMvMTkgODo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMTEuMjAxOSAw
MToxMSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAxMS8xMS8xOSA5OjQ2IEFNLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL21zci1pbmRleC5o
Cj4+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaAo+Pj4gQEAgLTM5Myw2
ICszOTMsOCBAQAo+Pj4gICNkZWZpbmUgTVNSX0FNRF9QU1RBVEVfREVGX0JBU0UJCTB4YzAwMTAw
NjQKPj4+ICAjZGVmaW5lIE1TUl9BTUQ2NF9PU1ZXX0lEX0xFTkdUSAkweGMwMDEwMTQwCj4+PiAg
I2RlZmluZSBNU1JfQU1ENjRfT1NWV19TVEFUVVMJCTB4YzAwMTAxNDEKPj4+ICsjZGVmaW5lIE1T
Ul9BTURfUFBJTl9DVEwJCTB4YzAwMTAyZjAKPj4+ICsjZGVmaW5lIE1TUl9BTURfUFBJTgkJCTB4
YzAwMTAyZjEKPj4gV2hpY2ggcHJvY2Vzc29ycyBhcmUgdGhlc2UgZGVmaW5lZCBmb3I/IEkgbG9v
a2VkIGF0IGEgY291cGxlIChmYW0gMTVoCj4+IGFuZCAxN2gpIGFuZCBkaWRuJ3Qgc2VlIHRob3Nl
LiBBbmQgSSBkb24ndCBzZWUgdGhlbSBpbiBMaW51eC4KPiBDZXJ0YWluIEZhbTE3IG9uZXMsIFJv
bWUgaW4gcGFydGljdWxhciAod2hpY2ggaXMgd2hlcmUgSSd2ZQo+IHRlc3RlZCB0aGlzKS4KCkkg
d2FzIGxvb2tpbmcgYXQgTmFwbGVzLCBjYW4ndCBmaW5kIFJvbWUgb24gQU1EJ3MgcGFnZS4KCj4K
Pj4+IC0tLSBhL2luY2x1ZGUveGVuL2ludGVyZmFjZS94ZW4tbWNhLmgKPj4+ICsrKyBiL2luY2x1
ZGUveGVuL2ludGVyZmFjZS94ZW4tbWNhLmgKPj4+IEBAIC0zMzIsNyArMzMyLDExIEBAIHN0cnVj
dCB4ZW5fbWMgewo+Pj4gIH07Cj4+PiAgREVGSU5FX0dVRVNUX0hBTkRMRV9TVFJVQ1QoeGVuX21j
KTsKPj4+ICAKPj4+IC0vKiBGaWVsZHMgYXJlIHplcm8gd2hlbiBub3QgYXZhaWxhYmxlICovCj4+
PiArLyoKPj4+ICsgKiBGaWVsZHMgYXJlIHplcm8gd2hlbiBub3QgYXZhaWxhYmxlLiBBbHNvLCB0
aGlzIHN0cnVjdCBpcyBzaGFyZWQgd2l0aAo+Pj4gKyAqIHVzZXJzcGFjZSBtY2Vsb2cgYW5kIHRo
dXMgbXVzdCBrZWVwIGV4aXN0aW5nIGZpZWxkcyBhdCBjdXJyZW50IG9mZnNldHMuCj4+PiArICog
T25seSBhZGQgbmV3IGZpZWxkcyB0byB0aGUgZW5kIG9mIHRoZSBzdHJ1Y3R1cmUKPj4+ICsgKi8K
Pj4+ICBzdHJ1Y3QgeGVuX21jZSB7Cj4+IFdoeSBpcyB0aGlzIHN0cnVjdHVyZSBpcyBwYXJ0IG9m
IHRoZSBpbnRlcmZhY2U/Cj4gVGhhdCdzIGEgcXVlc3Rpb24gdG8gd2hvZXZlciBwdXQgaXQgdGhl
cmUuIFRoZXJlIGxvb2sgdG8gaGF2ZQo+IGJlZW4gZGVjaXNpb25zIChzZWUgYWxzbyBwYXRjaCAx
KSB0byBoYXZlIHRoZSBMaW51eCBjbG9uZXMgb2YKPiBYZW4ncyBwdWJsaWMgaGVhZGVycyBkZXZp
YXRlIGZhciBtb3JlIGZyb20gdGhlaXIgb3JpZ2luYWwKPiB0aGFuIEkgd291bGQgY29uc2lkZXIg
cmVhc29uYWJsZS4KClllcywgdGhpcyBnb2VzIGJhY2sgdG8gd2hlbiB0aGUgZmlsZSB3YXMgZmly
c3QgY3JlYXRlZC4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNr
eUBvcmFjbGUuY29tPgoKKGJ1dCBpZiB5b3Ugd2FudCB0byBtb3ZlIG5vbi1pbnRlcmZhY2UgcGFy
dHMgaW50bywgc2F5LApkcml2ZXJzL3hlbi9tY2Vsb2cuaCBJIHdvbid0IHN0YW5kIGluIHlvdXIg
d2F5IDstKSApCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
