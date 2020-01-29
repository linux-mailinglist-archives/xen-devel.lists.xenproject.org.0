Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2740514CD11
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:17:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwp3j-0002Tk-2M; Wed, 29 Jan 2020 15:15:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwp3g-0002Tb-Ob
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 15:15:12 +0000
X-Inumbo-ID: 246d9d8f-42aa-11ea-88f7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 246d9d8f-42aa-11ea-88f7-12813bfff9fa;
 Wed, 29 Jan 2020 15:15:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC399AEAF;
 Wed, 29 Jan 2020 15:15:10 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200129143831.1369-1-pdurrant@amazon.com>
 <20200129143831.1369-4-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36b4b20b-60b5-806a-ca5d-8253823427ce@suse.com>
Date: Wed, 29 Jan 2020 16:15:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129143831.1369-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/4] mm: make MEMF_no_refcount pages safe
 to assign
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxNTozOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEBAIC0yMzcxLDYgKzIz
ODMsOCBAQCB2b2lkIGZyZWVfZG9taGVhcF9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZvICpwZywgdW5z
aWduZWQgaW50IG9yZGVyKQo+ICAKPiAgICAgICAgICBpZiAoIGxpa2VseShkKSAmJiBsaWtlbHko
ZCAhPSBkb21fY293KSApCj4gICAgICAgICAgewo+ICsgICAgICAgICAgICBsb25nIHBhZ2VzID0g
MDsKPiArCj4gICAgICAgICAgICAgIC8qIE5CLiBNYXkgcmVjdXJzaXZlbHkgbG9jayBmcm9tIHJl
bGlucXVpc2hfbWVtb3J5KCkuICovCj4gICAgICAgICAgICAgIHNwaW5fbG9ja19yZWN1cnNpdmUo
JmQtPnBhZ2VfYWxsb2NfbG9jayk7Cj4gIAo+IEBAIC0yMzg2LDkgKzI0MDAsMTEgQEAgdm9pZCBm
cmVlX2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGludCBvcmRl
cikKPiAgICAgICAgICAgICAgICAgICAgICBCVUcoKTsKPiAgICAgICAgICAgICAgICAgIH0KPiAg
ICAgICAgICAgICAgICAgIGFyY2hfZnJlZV9oZWFwX3BhZ2UoZCwgJnBnW2ldKTsKPiArICAgICAg
ICAgICAgICAgIGlmICggIShwZ1tpXS5jb3VudF9pbmZvICYgUEdDX25vX3JlZmNvdW50KSApCj4g
KyAgICAgICAgICAgICAgICAgICAgcGFnZXMtLTsKPiAgICAgICAgICAgICAgfQo+ICAKPiAtICAg
ICAgICAgICAgZHJvcF9kb21fcmVmID0gIWRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGQsIC0oMSA8
PCBvcmRlcikpOwo+ICsgICAgICAgICAgICBkcm9wX2RvbV9yZWYgPSAhZG9tYWluX2FkanVzdF90
b3RfcGFnZXMoZCwgcGFnZXMpOwoKRm9sbG93aW5nIGZyb20gd2hhdCBJJ3ZlIGp1c3Qgc2FpZCBv
biB0aGUgcHJldmlvdXMgcGF0Y2gsIHRoaXMgbmVlZHMKZnVydGhlciBjaGFuZ2luZyB0aGVuIGFz
IHdlbGwuIFRoZXJlJ2xsIG5lZWQgdG8gYmUgYSBwZXItZG9tYWluCiJub24tcmVmY291bnRlZC1w
YWdlcyIgY291bnQsIHdoaWNoIC0gd2hlbiB0cmFuc2l0aW9uaW5nIGZyb20gemVybwp0byBub24t
emVybyBpcyBhY2NvbXBhbmllZCBieSBvYnRhaW5pbmcgYSBkb21haW4gcmVmLCBhbmQgd2hlbgp0
cmFuc2l0aW9uaW5nIGJhY2sgdG8gemVybyBjYXVzZXMgdGhpcyBkb21haW4gcmVmIHRvIGJlIGRy
b3BwZWQuCk90aGVyd2lzZSwgb25jZSB0aGUgbGFzdCByZWYtY291bnRlZCBwYWdlIHdhcyBmcmVl
ZCwgdGhlIGRvbWFpbgptYXkgYmVjb21lIHJlYWR5IGZvciBmaW5hbCBkZXN0cnVjdGlvbiwgbm8g
bWF0dGVyIGhvdyBtYW55IG5vbi0KcmVmY291bnRlZCBwYWdlcyB0aGVyZSBzdGlsbCBhcmUgb24g
aXRzIHBhZ2UgbGlzdHMuIChBbiBhbHRlcm5hdGl2ZQptb2RlbCBtaWdodCBiZSB0byBpbmNsdWRl
IGFsbCBwYWdlcyBpbiAtPnRvdF9wYWdlcywga2VlcCB1c2luZyBqdXN0CnRoYXQgZm9yIHRoZSBk
b21haW4gcmVmIGFjcXVpcmUvcmVsZWFzZSwgYW5kIHN1YnRyYWN0IHRoZSBuZXcKY291bnQgd2hl
biBlLmcuIGNvbXBhcmluZyBhZ2FpbnN0IC0+bWF4X3BhZ2VzLikKCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
