Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F5128190
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 17:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTpsm-0006Nw-Vh; Thu, 23 May 2019 15:43:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTpsl-0006Nr-HD
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 15:43:51 +0000
X-Inumbo-ID: 8f1541e6-7d71-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f1541e6-7d71-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 15:43:50 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 09:43:38 -0600
Message-Id: <5CE6BC680200007800231C8F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 23 May 2019 09:29:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-2-roger.pau@citrix.com>
In-Reply-To: <20190510161056.48648-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/5] pci: use pci_sbdf_t in pci_dev
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92
bXNpLmMKPiBAQCAtNjg4LDggKzY4OCw4IEBAIHN0YXRpYyBpbnQgdnBjaV9tc2lfdXBkYXRlKGNv
bnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MzJfdCBkYXRhLAo+ICAgICAgICAgIHsKPiAg
ICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwKPiAgICAgICAgICAgICAgICAgICAgICAg
IiUwNHg6JTAyeDolMDJ4LiV1OiBmYWlsZWQgdG8gYmluZCBQSVJRICV1OiAlZFxuIiwKPiAtICAg
ICAgICAgICAgICAgICAgICAgcGRldi0+c2VnLCBwZGV2LT5idXMsIFBDSV9TTE9UKHBkZXYtPmRl
dmZuKSwKPiAtICAgICAgICAgICAgICAgICAgICAgUENJX0ZVTkMocGRldi0+ZGV2Zm4pLCBwaXJx
ICsgaSwgcmMpOwo+ICsgICAgICAgICAgICAgICAgICAgICBwZGV2LT5zYmRmLnNlZywgcGRldi0+
c2JkZi5idXMsIHBkZXYtPnNiZGYuZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICBwZGV2LT5z
YmRmLmZ1bmMsIHBpcnEgKyBpLCByYyk7CgpJIGFzc3VtZSBwYXRjaCA0IGNvdWxkIGhhdmUgYmVl
biBxdWl0ZSBhIGJpdCBzbWFsbGVyLCBhbmQgeW91IGNvdWxkIGhhdmUKYXZvaWRlZCB0b3VjaGlu
ZyB0aGUgc2FtZSBwbGFjZXMgdHdpY2UgaWYgdGhhdCBvbmUgY2FtZSBiZWZvcmUgdGhlIG9uZQpo
ZXJlLgoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfY21kLmMKPiAr
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfY21kLmMKPiBAQCAtMjg5LDIz
ICsyODksMjMgQEAgdm9pZCBhbWRfaW9tbXVfZmx1c2hfaW90bGIodTggZGV2Zm4sIGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAgICAgaWYgKCAhYXRzX2VuYWJsZWQgKQo+ICAgICAgICAg
IHJldHVybjsKPiAgCj4gLSAgICBpZiAoICFwY2lfYXRzX2VuYWJsZWQocGRldi0+c2VnLCBwZGV2
LT5idXMsIHBkZXYtPmRldmZuKSApCj4gKyAgICBpZiAoICFwY2lfYXRzX2VuYWJsZWQocGRldi0+
c2JkZi5zZWcsIHBkZXYtPnNiZGYuYnVzLCBwZGV2LT5zYmRmLmV4dGZ1bmMpICkKCldoeSBleHRm
dW5jIGFuZCBub3QgKGFzIGl0IHdhcyBiZWZvcmUpIGRldmZuIChzYW1lIGVsc2V3aGVyZSk/ClRo
ZXJlIHNob3VsZCBoYXZlIGJlZW4gYSBkZXZmbiBmaWVsZCBmcm9tIHRoZSBiZWdpbm5pbmcsIGV2
ZW4gaWYKaXQncyBzaW1pbGFybHkgdWludDhfdCBhcyBleHRmdW5jIGlzLiBBcyB0aGUgbWVhbmlu
ZyBvZiBib3RoIGlzIGRpZmZlcmVudCwKdGhlIGNvcnJlY3QgKGdpdmVuIGNvbnRleHQpIG9uZSBz
aG91bGQgYmUgdXNlZC4gRXhpc3RpbmcgdXNlcyBvZgpleHRmdW5jIHNob3VsZCBhbHNvIGJlIGlu
c3BlY3RlZCBhbmQgY2hhbmdlZCBpZiBuZWNlc3NhcnkuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9wY2kuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+IEBAIC04MCw5ICs4MCw4IEBA
IHN0cnVjdCBwY2lfZGV2IHsKPiAgICAgIHN0cnVjdCBhcmNoX21zaXggKm1zaXg7Cj4gIAo+ICAg
ICAgc3RydWN0IGRvbWFpbiAqZG9tYWluOwo+IC0gICAgY29uc3QgdTE2IHNlZzsKPiAtICAgIGNv
bnN0IHU4IGJ1czsKPiAtICAgIGNvbnN0IHU4IGRldmZuOwo+ICsKPiArICAgIGNvbnN0IHBjaV9z
YmRmX3Qgc2JkZjsKClRvIGhlbHAgdGhlIHRyYW5zaXRpb24sIGRpZCB5b3UgY29uc2lkZXIgZmly
c3QgbWFraW5nIHRoaXMgYSB1bmlvbiBvZgp0aGUgZXhpc3RpbmcgZmllbGRzIGFuZCB0aGUgbmV3
IG9uZSwgbmV4dCByZXBsYWNpbmcgdXNlZCBpbiBhIHBlcgpjb21wb25lbnQgbWFubmVyIChzbyB0
aGF0IGluZGl2aWR1YWwgbWFpbnRhaW5lcnMgd291bGQgaGF2ZSB0bwpsb29rIGF0IHNtYWxsZXIg
cGF0Y2hlcyBlYWNoIG9ubHkpLCBhbmQgZmluYWxseSBkcm9wcGluZyB0aGUgdW5pb24KYW5kIGl0
cyBvbGQgZmllbGRzPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
