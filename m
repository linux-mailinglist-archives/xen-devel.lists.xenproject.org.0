Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4BD2C17
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 16:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIYz6-0007F7-PT; Thu, 10 Oct 2019 14:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ljdo=YD=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1iIYz4-00077Q-TW
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 14:00:02 +0000
X-Inumbo-ID: 4071bb32-eb66-11e9-bbab-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4071bb32-eb66-11e9-bbab-bc764e2007e4;
 Thu, 10 Oct 2019 14:00:01 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9ADxAdc030650;
 Thu, 10 Oct 2019 13:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=y2rwgqYe3SSkpJw3Li2BKZl3YZdi4e5AxSucpXkNttE=;
 b=r2Scdq0O81IUeVM2Vrbg6flWFlrDp9xiA8Cg3BHA2FiB+MI6I2jZDY6BMIfpBUr0oHj/
 T2riF3Crl8QJABAOcQJZDarh+uIHm9ScYc8KKb9BK9YYAVegdUbrcTwzb6R40WA3jmOQ
 9J6me2Az2DnpZ34QLy4HFKTjbKUtYeb6w7R5LqrkQJf72QcXHN+uhKdCzhRP/zipGCCH
 uX31eRL/U5gT6sTdMR1V227LEktBj5Ry64m+07TafQbHDuKhMl29BIc3dhgSAgugbbbO
 lb31EiT4XBzXjOSm1nzgqq6XAuVydzKEaPfcf0h/RnKUX1Oxr2fKFKJCwIVU3KpekNj2 HQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2vektru3n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 13:59:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9ADwXlS153156;
 Thu, 10 Oct 2019 13:59:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2vh8k2wrmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 13:59:54 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9ADxivY031341;
 Thu, 10 Oct 2019 13:59:44 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Oct 2019 06:59:44 -0700
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Rob Herring <robh@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191008194155.4810-1-robh@kernel.org>
 <fd2f61bb-1ff8-f90b-9514-e662db2ff19f@epam.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <362d1eac-e352-d8de-1b6f-586acc0007ce@oracle.com>
Date: Thu, 10 Oct 2019 09:59:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fd2f61bb-1ff8-f90b-9514-e662db2ff19f@epam.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910100132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9405
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910100132
Subject: Re: [Xen-devel] [PATCH v2] xen: Stop abusing DT of_dma_configure API
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julien Grall <julien.grall@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvOS8xOSA3OjQyIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiBPbiAx
MC84LzE5IDEwOjQxIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPj4gQXMgdGhlIHJlbW92ZWQgY29t
bWVudHMgc2F5LCB0aGVzZSBhcmVuJ3QgRFQgYmFzZWQgZGV2aWNlcy4KPj4gb2ZfZG1hX2NvbmZp
Z3VyZSgpIGlzIGdvaW5nIHRvIHN0b3AgYWxsb3dpbmcgYSBOVUxMIERUIG5vZGUgYW5kIGNhbGxp
bmcKPj4gaXQgd2lsbCBubyBsb25nZXIgd29yay4KPj4KPj4gVGhlIGNvbW1lbnQgaXMgYWxzbyBu
b3cgb3V0IG9mIGRhdGUgYXMgb2YgY29tbWl0IDlhYjkxZTdjNWM1MSAoImFybTY0Ogo+PiBkZWZh
dWx0IHRvIHRoZSBkaXJlY3QgbWFwcGluZyBpbiBnZXRfYXJjaF9kbWFfb3BzIikuIERpcmVjdCBt
YXBwaW5nCj4+IGlzIG5vdyB0aGUgZGVmYXVsdCByYXRoZXIgdGhhbiBkbWFfZHVtbXlfb3BzLgo+
Pgo+PiBBY2NvcmRpbmcgdG8gU3RlZmFubyBhbmQgT2xla3NhbmRyLCB0aGUgb25seSBvdGhlciBw
YXJ0IG5lZWRlZCBpcwo+PiBzZXR0aW5nIHRoZSBETUEgbWFza3MgYW5kIHRoZXJlJ3Mgbm8gcmVh
c29uIHRvIHJlc3RyaWN0IHRoZSBtYXNrcyB0bwo+PiAzMi1iaXRzLiBTbyBzZXQgdGhlIG1hc2tz
IHRvIDY0IGJpdHMuCj4+Cj4+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29t
Pgo+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gQ2M6IE5pY29s
YXMgU2FlbnogSnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Cj4+IENjOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+IENj
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+PiBDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Cj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4gU2lnbmVkLW9mZi1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiBBY2tlZC1ieTogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgoKCklzIHRoaXMg
Z29pbmcgdG8gZ28gdmlhIGRybSB0cmVlIG9yIHNob3VsZCBJIHBpY2sgaXQgdXAgZm9yIFhlbiB0
cmVlPwoKLWJvcmlzCgoKCj4KPiBVbmZvcnR1bmF0ZWx5IEkgY2Fubm90IHRlc3QgdGhpcyBwYXRj
aCB3aXRoIHJlYWwgSFcgcnVubmluZyBYZW46Cj4gSSBhbSBzdGlsbCBvbiA0LjE0IGtlcm5lbCB3
aGljaCBpcyBkaWN0YXRlZCBieSB0aGUgYm9hcmQncyBCU1AgYW5kCj4gaXQgaXMgbm90IHBvc3Np
YmxlIHRvIGhhdmUgbW9yZSByZWNlbnQgb25lIGF0IHRoZSBtb21lbnQuCj4gU28sIEkgaG9wZSB0
aGUgcGF0Y2ggd2lsbCB3b3JrIGFzIGludGVuZGVkLgo+Cj4gVGhhbmsgeW91LAo+IE9sZWtzYW5k
cgo+PiAtLS0KPj4gdjI6Cj4+ICAgLSBTZXR1cCBkbWEgbWFza3MKPj4gICAtIEFsc28gZml4IHhl
bl9kcm1fZnJvbnQuYwo+PiAgIAo+PiBUaGlzIGNhbiBub3cgYmUgYXBwbGllZCB0byB0aGUgWGVu
IHRyZWUgaW5kZXBlbmRlbnQgb2YgdGhlIGNvbWluZwo+PiBvZl9kbWFfY29uZmlndXJlKCkgY2hh
bmdlcy4KPj4KPj4gUm9iCj4+Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
LmMgfCAxMiArKy0tLS0tLS0tLS0KPj4gICBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAgICAg
ICAgICB8IDEzICsrLS0tLS0tLS0tLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMjEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGVuL3hlbl9kcm1fZnJvbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5j
Cj4+IGluZGV4IGJhMTgyOGFjZDhjOS4uNGJlNDljMWFlZjUxIDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGVuL3hlbl9kcm1fZnJvbnQuYwo+PiBAQCAtNzE4LDE3ICs3MTgsOSBAQCBzdGF0aWMgaW50IHhl
bl9kcnZfcHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKnhiX2RldiwKPj4gICAJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnhiX2Rldi0+ZGV2Owo+PiAgIAlpbnQgcmV0Owo+PiAgIAo+PiAtCS8qCj4+
IC0JICogVGhlIGRldmljZSBpcyBub3Qgc3Bhd24gZnJvbSBhIGRldmljZSB0cmVlLCBzbyBhcmNo
X3NldHVwX2RtYV9vcHMKPj4gLQkgKiBpcyBub3QgY2FsbGVkLCB0aHVzIGxlYXZpbmcgdGhlIGRl
dmljZSB3aXRoIGR1bW15IERNQSBvcHMuCj4+IC0JICogVGhpcyBtYWtlcyB0aGUgZGV2aWNlIHJl
dHVybiBlcnJvciBvbiBQUklNRSBidWZmZXIgaW1wb3J0LCB3aGljaAo+PiAtCSAqIGlzIG5vdCBj
b3JyZWN0OiB0byBmaXggdGhpcyBjYWxsIG9mX2RtYV9jb25maWd1cmUoKSB3aXRoIGEgTlVMTAo+
PiAtCSAqIG5vZGUgdG8gc2V0IGRlZmF1bHQgRE1BIG9wcy4KPj4gLQkgKi8KPj4gLQlkZXYtPmNv
aGVyZW50X2RtYV9tYXNrID0gRE1BX0JJVF9NQVNLKDMyKTsKPj4gLQlyZXQgPSBvZl9kbWFfY29u
ZmlndXJlKGRldiwgTlVMTCwgdHJ1ZSk7Cj4+ICsJcmV0ID0gZG1hX2NvZXJjZV9tYXNrX2FuZF9j
b2hlcmVudChkZXYsIERNQV9CSVRfTUFTSyg2NCkpOwo+PiAgIAlpZiAocmV0IDwgMCkgewo+PiAt
CQlEUk1fRVJST1IoIkNhbm5vdCBzZXR1cCBETUEgb3BzLCByZXQgJWQiLCByZXQpOwo+PiArCQlE
Uk1fRVJST1IoIkNhbm5vdCBzZXR1cCBETUEgbWFzaywgcmV0ICVkIiwgcmV0KTsKPj4gICAJCXJl
dHVybiByZXQ7Cj4+ICAgCX0KPj4gICAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRl
di5jIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPj4gaW5kZXggYTQ0NmE3MjIxZTEzLi44MTQwMWYz
ODZjOWMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMveGVuL2dudGRldi5jCj4+ICsrKyBiL2RyaXZl
cnMveGVuL2dudGRldi5jCj4+IEBAIC0yMiw2ICsyMiw3IEBACj4+ICAgCj4+ICAgI2RlZmluZSBw
cl9mbXQoZm10KSAieGVuOiIgS0JVSUxEX01PRE5BTUUgIjogIiBmbXQKPj4gICAKPj4gKyNpbmNs
dWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
Pj4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L2luaXQu
aD4KPj4gQEAgLTM0LDkgKzM1LDYgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+PiAg
ICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L3JlZmNvdW50
Lmg+Cj4+IC0jaWZkZWYgQ09ORklHX1hFTl9HUkFOVF9ETUFfQUxMT0MKPj4gLSNpbmNsdWRlIDxs
aW51eC9vZl9kZXZpY2UuaD4KPj4gLSNlbmRpZgo+PiAgIAo+PiAgICNpbmNsdWRlIDx4ZW4veGVu
Lmg+Cj4+ICAgI2luY2x1ZGUgPHhlbi9ncmFudF90YWJsZS5oPgo+PiBAQCAtNjI1LDE0ICs2MjMs
NyBAQCBzdGF0aWMgaW50IGdudGRldl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBm
aWxlICpmbGlwKQo+PiAgIAlmbGlwLT5wcml2YXRlX2RhdGEgPSBwcml2Owo+PiAgICNpZmRlZiBD
T05GSUdfWEVOX0dSQU5UX0RNQV9BTExPQwo+PiAgIAlwcml2LT5kbWFfZGV2ID0gZ250ZGV2X21p
c2NkZXYudGhpc19kZXZpY2U7Cj4+IC0KPj4gLQkvKgo+PiAtCSAqIFRoZSBkZXZpY2UgaXMgbm90
IHNwYXduIGZyb20gYSBkZXZpY2UgdHJlZSwgc28gYXJjaF9zZXR1cF9kbWFfb3BzCj4+IC0JICog
aXMgbm90IGNhbGxlZCwgdGh1cyBsZWF2aW5nIHRoZSBkZXZpY2Ugd2l0aCBkdW1teSBETUEgb3Bz
Lgo+PiAtCSAqIEZpeCB0aGlzIGJ5IGNhbGxpbmcgb2ZfZG1hX2NvbmZpZ3VyZSgpIHdpdGggYSBO
VUxMIG5vZGUgdG8gc2V0Cj4+IC0JICogZGVmYXVsdCBETUEgb3BzLgo+PiAtCSAqLwo+PiAtCW9m
X2RtYV9jb25maWd1cmUocHJpdi0+ZG1hX2RldiwgTlVMTCwgdHJ1ZSk7Cj4+ICsJZG1hX2NvZXJj
ZV9tYXNrX2FuZF9jb2hlcmVudChwcml2LT5kbWFfZGV2LCBETUFfQklUX01BU0soNjQpKTsKPj4g
ICAjZW5kaWYKPj4gICAJcHJfZGVidWcoInByaXYgJXBcbiIsIHByaXYpOwo+PiAgIAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
