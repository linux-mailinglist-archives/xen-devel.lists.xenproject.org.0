Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06041B7739
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 12:17:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAtTB-0001fT-07; Thu, 19 Sep 2019 10:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAtT9-0001fM-Tj
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 10:15:23 +0000
X-Inumbo-ID: 637d3378-dac6-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 637d3378-dac6-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 10:15:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EE66AC38;
 Thu, 19 Sep 2019 10:15:21 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
 <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
 <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
 <f8ab5e72-2475-3884-c23f-84d07eba11ba@gmail.com>
 <f243004b-9069-566c-1e8c-ba49e401c98d@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <69614adc-d2fb-ea4f-7659-3f65e40116a3@suse.com>
Date: Thu, 19 Sep 2019 12:15:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f243004b-9069-566c-1e8c-ba49e401c98d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: Oleksandr <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMjAxOSAxMjoxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE3
LzA5LzIwMTkgMTk6MTgsIE9sZWtzYW5kciB3cm90ZToKPj4KPj4gT24gMTcuMDkuMTkgMDk6MTIs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pgo+PiBIaSwgSmFuCj4+Cj4+PiBPbiAxNi4wOS4yMDE5IDIw
OjA4LCBPbGVrc2FuZHIgd3JvdGU6Cj4+Pj4gT24gMTYuMDkuMTkgMTM6NDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+Pj4+Pj4gKy8qIHBlci1kZXZpY2UgSU9NTVUgaW5zdGFuY2UgZGF0YSAqLwo+Pj4+
Pj4gK3N0cnVjdCBpb21tdV9md3NwZWMgewo+Pj4+Pj4gK8KgwqDCoCAvKiB0aGlzIGRldmljZSdz
IElPTU1VICovCj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmlvbW11X2RldjsKPj4+Pj4+
ICvCoMKgwqAgLyogSU9NTVUgZHJpdmVyIHByaXZhdGUgZGF0YSBmb3IgdGhpcyBkZXZpY2UgKi8K
Pj4+Pj4+ICvCoMKgwqAgdm9pZCAqaW9tbXVfcHJpdjsKPj4+Pj4+ICvCoMKgwqAgLyogbnVtYmVy
IG9mIGFzc29jaWF0ZWQgZGV2aWNlIElEcyAqLwo+Pj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQg
bnVtX2lkczsKPj4+Pj4+ICvCoMKgwqAgLyogSURzIHdoaWNoIHRoaXMgZGV2aWNlIG1heSBwcmVz
ZW50IHRvIHRoZSBJT01NVSAqLwo+Pj4+Pj4gK8KgwqDCoCB1aW50MzJfdCBpZHNbMV07Cj4+Pj4+
PiArfTsKPj4+Pj4gTm90ZSB0aGF0IHlvdSBhYnVzZSB4cmVhbGxvY19mbGV4X3N0cnVjdCgpIHdo
ZW4gdXNpbmcgaXQgd2l0aCBzdWNoCj4+Pj4+IGEgdHlwZTogVGhlIGxhc3QgZmllbGQgaXMgX25v
dF8gYSBmbGV4aWJsZSBhcnJheSBtZW1iZXIuIENvbXBpbGVycwo+Pj4+PiBtaWdodCBsZWdpdGlt
YXRlbHkgd2FybiBpZiB0aGV5IGNhbiBwcm92ZSB0aGF0IHlvdSBhY2Nlc3MKPj4+Pj4gcC0+aWRz
WzFdIGFueXdoZXJlLCBkZXNwaXRlIHlvdSAocHJlc3VtYWJseSkgaGF2aW5nIGFsbG9jYXRlZCBl
bm91Z2gKPj4+Pj4gc3BhY2UuIChJIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHRoaW5rIG9mIGEgd2F5
IGZvciB0aGUgbWFjcm8gdG8KPj4+Pj4gYWN0dWFsbHkgZGV0ZWN0IGFuZCBoZW5jZSByZWZ1c2Ug
c3VjaCB3cm9uZyB1c2VzLikKPj4+PiBJbmRlZWQsIHlvdSBhcmUgcmlnaHQuIEkgYW0gaW4gZG91
YnQsIHdoZXRoZXIgdG8gcmV0YWluIHBvcnRlZCBmcm9tCj4+Pj4gTGludXggY29kZSAoaWRzWzFd
KQo+Pj4+Cj4+Pj4gYW5kIG1lbnRpb24gYWJvdXQgc3VjaCBhYnVzZSBvciBjaGFuZ2UgaXQgdG8g
ZGVhbCB3aXRoIHJlYWwgZmxleGlibGUKPj4+PiBhcnJheSBtZW1iZXIgKGlkc1tdKS4gQW55IHRo
b3VnaHRzPwo+Pj4gSSdtIG9mIHRoZSBzdHJvbmcgb3BpbmlvbiB0aGF0IHlvdSBzaG91bGQgc3dp
dGNoIHRvIFtdIChvciBhdAo+Pj4gbGVhc3QgWzBdKSBub3RhdGlvbi4KPj4KPj4gSSBnb3QgaXQu
IFdlbGwsIHdpbGwgc3dpdGNoIHRvIGlkc1tdIGlmIHRoZXJlIGFyZSBubyBvYmplY3Rpb25zLgo+
IAo+IEkgc3VzcGVjdCB0aGUgcmF0aW9uYWxlIHRvIHVzZSAxIHJhdGhlciB0aGFuIDAgaXMgdG8g
YXZvaWQgdGhlIHJlLWFsbG9jYXRpb24gaW4gCj4gdGhlIGNvbW1vbiBjYXNlIHdoZXJlIGEgZGV2
aWNlIGhhcyBhIHNpbmdsZSBJRC4KPiAKPiBJIHdvdWxkIGxpa2UgdG8gcmV0YWluIHRoZSBzaW1p
bGFyIGJlaGF2aW9yLiBUaGUgaWRzWzFdIGlzIHByb2JhYmx5IHRoZSBtb3N0IAo+IHByZXR0eSB3
YXkgdG8gZG8gaXQuCj4gCj4gQW5vdGhlciBzb2x1dGlvbiB3b3VsZCB0byB1c2UgeG1hbGxvY19i
eXRlcygpIGZvciB0aGUgaW5pdGlhbCBhbGxvY2F0aW9uIG9mIAo+IHhtYWxsb2NfYnl0ZXMoKS4K
CldoeSBub3QgdXNlIHhtYWxsb2NfZmxleF88d2hhdGV2ZXI+KCkgb24gdGhlIGZpcnN0IGFsbG9j
YXRpb24sIHRvbz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
