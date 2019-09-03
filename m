Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5EA6AF6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i59Wr-0007FQ-6G; Tue, 03 Sep 2019 14:11:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i59Wq-0007FG-2F
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:11:28 +0000
X-Inumbo-ID: b777b332-ce54-11e9-ab94-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b777b332-ce54-11e9-ab94-12813bfff9fa;
 Tue, 03 Sep 2019 14:11:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A6F67ACC6;
 Tue,  3 Sep 2019 14:11:25 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6ece6c17-362b-f2ec-eedd-6b2a57dc7d56@suse.com>
Date: Tue, 3 Sep 2019 16:11:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829101846.21369-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMjoxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc3BpbmxvY2suaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oCj4g
QEAgLTYsMTQgKzYsMjEgQEAKPiAgI2luY2x1ZGUgPGFzbS90eXBlcy5oPgo+ICAKPiAgI2lmbmRl
ZiBOREVCVUcKPiAtc3RydWN0IGxvY2tfZGVidWcgewo+IC0gICAgczE2IGlycV9zYWZlOyAvKiAr
MTogSVJRLXNhZmU7IDA6IG5vdCBJUlEtc2FmZTsgLTE6IGRvbid0IGtub3cgeWV0ICovCj4gK3Vu
aW9uIGxvY2tfZGVidWcgewo+ICsgICAgdWludDE2X3QgdmFsOwo+ICsjZGVmaW5lIExPQ0tfREVC
VUdfSU5JVFZBTCAweGZmZmYKPiArICAgIHN0cnVjdCB7Cj4gKyAgICAgICAgdWludDE2X3QgY3B1
OjEyOwoKSSdtIGFmcmFpZCBJIGhhdmUgb25lIG1vcmUgcmVxdWVzdDogVGhlIGxpdGVyYWwgMTIg
aW4gc3RydWN0IHNwaW5sb2NrIGlzCnNpdHRpbmcgcmlnaHQgbmV4dCB0byB0aGUgU1BJTkxPQ0tf
Tk9fQ1BVIGRlZmluaXRpb24sIG1ha2luZyBpdCBwcmV0dHkKdW5saWtlbHkgdGhhdCBib3RoIGF1
dGhvciBhbmQgcmV2aWV3ZXIgb2YgYSBjaGFuZ2Ugd291bGRuJ3Qgbm90aWNlIG9uZQpnZXR0aW5n
IGNoYW5nZWQgd2l0aG91dCBhZGp1c3RtZW50IHRvIHRoZSBvdGhlci4gVGhlIGxpdGVyYWwgMTIg
aGVyZSwKdGhvdWdoLCBpcyBzdWZmaWNpZW50bHkgcmVtb3RlIHRvIHRoYXQgb3RoZXIgcGxhY2Us
IHNvIHRoZXJlIG5lZWRzIHRvIGJlCmEgY29ubmVjdGlvbiBlc3RhYmxpc2hlZC4gQmVzdCBJIGNh
biB0aGluayBvZiByaWdodCBhd2F5IGlzIHRvIGhhdmUgYQojZGVmaW5lIGZvciB0aGUgMTIsIG1v
dmUgU1BJTkxPQ0tfTk9fQ1BVJ3MgZGVmaW5pdGlvbiBuZXh0IHRvIGl0LCBhbmQKdXNlIHRoZSBu
ZXcgY29uc3RhbnQgaW4gYm90aCBwbGFjZXMuCgo+ICsgICAgICAgIHVpbnQxNl90IHBhZDoyOwoK
V2hpbGUgYXQgaXQsIHdvdWxkIHlvdSBtaW5kIG1ha2luZyB0aGlzIGFuIHVubmFtZWQgZmllbGQ/
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
