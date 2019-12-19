Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676E912607D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:08:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihtcs-0003cQ-H7; Thu, 19 Dec 2019 11:05:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihtcq-0003cK-Pj
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:05:48 +0000
X-Inumbo-ID: 7d597448-224f-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d597448-224f-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 11:05:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E27BACAE;
 Thu, 19 Dec 2019 11:05:38 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <22a6cb7bd5593ed38cf6f66c26c4734a04718e1a.1576697796.git.tamas.lengyel@intel.com>
 <c6d975b9-638f-355d-79f8-1c1fae4c6007@xen.org>
 <CABfawhnVbzv4UEQFQoRwYurKOWB4Vw=OtsxXUDtFX1HRxr-sWA@mail.gmail.com>
 <5339f10e-6d93-35ac-5777-acf13ba9835f@xen.org>
 <CABfawhmzjE6c0msjpPEBTciTnCTVQGd46ovSuB_7qqXdY6BvsQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b26a1aa1-afa2-aedd-09d2-b0557fb8b339@suse.com>
Date: Thu, 19 Dec 2019 12:06:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmzjE6c0msjpPEBTciTnCTVQGd46ovSuB_7qqXdY6BvsQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 19/20] x86/mem_sharing: reset a fork
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTIuMjAxOSAwMToxNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgRGVj
IDE4LCAyMDE5IGF0IDQ6MDIgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6
Cj4+IE9uIDE4LzEyLzIwMTkgMjI6MzMsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IE9uIFdl
ZCwgRGVjIDE4LCAyMDE5IGF0IDM6MDAgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4g
d3JvdGU6Cj4+Pj4gWW91IGFsc28gaGF2ZSBtdWx0aXBsZSBsb29wIG9uIHRoZSBwYWdlX2xpc3Qg
aW4gdGhpcyBmdW5jdGlvbi4gR2l2ZW4gdGhlCj4+Pj4gbnVtYmVyIG9mIHBhZ2VfbGlzdCBjYW4g
YmUgcXVpdGUgYmlnLCB0aGlzIGlzIGEgY2FsbCBmb3IgaG9nZ2luZyB0aGUKPj4+PiBwQ1BVIGFu
ZCBhbiBSQ1UgbG9jayBvbiB0aGUgZG9tYWluIHZDUFUgcnVubmluZyB0aGlzIGNhbGwuCj4+Pgo+
Pj4gVGhlcmUgaXMganVzdCBvbmUgbG9vcCBvdmVyIHBhZ2VfbGlzdCBpdHNlbGYsIHRoZSBzZWNv
bmQgbG9vcCBpcyBvbgo+Pj4gdGhlIGludGVybmFsIGxpc3QgdGhhdCBpcyBiZWluZyBidWlsdCBo
ZXJlIHdoaWNoIHdpbGwgYmUgYSBzdWJzZXQuIFRoZQo+Pj4gbGlzdCBpdHNlbGYgaW4gZmFjdCBz
aG91bGQgYmUgc21hbGwgKGluIG91ciB0ZXN0cyB1c3VhbGx5IDwxMDApLgo+Pgo+PiBGb3IgYSBm
aXJzdCwgbm90aGluZyBpbiB0aGlzIGZ1bmN0aW9uIHRlbGxzIG1lIHRoYXQgdGhlcmUgd2lsbCBi
ZSBvbmx5Cj4+IDEwMCBwYWdlcy4gQnV0IHRoZW4sIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyByaWdo
dCB0byBpbXBsZW1lbnQgeW91cgo+PiBoeXBlcmNhbGwgYmFzZWQgb25seSB0aGUgICJub3JtYWwi
IHNjZW5hcmlvLiBZb3Ugc2hvdWxkIGFsc28gdGhpbmsgYWJvdXQKPj4gdGhlICJ3b3JzdCIgY2Fz
ZSBzY2VuYXJpby4KPj4KPj4gSW4gdGhpcyBjYXNlIHRoZSB3b3JzdCBjYXNlIHNjZW5hcmlvIGlz
IGhhdmUgaHVuZHJlZHMgb2YgcGFnZSBpbiBwYWdlX2xpc3QuCj4gCj4gV2VsbCwgdGhpcyBpcyBv
bmx5IGFuIGV4cGVyaW1lbnRhbCBzeXN0ZW0gdGhhdCdzIGNvbXBsZXRlbHkgZGlzYWJsZWQKPiBi
eSBkZWZhdWx0LiBNYWtpbmcgdGhlIGFzc3VtcHRpb24gdGhhdCBwZW9wbGUgd2hvIG1ha2UgdXNl
IG9mIGl0IHdpbGwKPiBrbm93IHdoYXQgdGhleSBhcmUgZG9pbmcgSSB0aGluayBpcyBmYWlyLgoK
RldJVyBJJ20gd2l0aCBKdWxpZW4gaGVyZTogVGhlIHByZWZlcnJlZCBjb3Vyc2Ugb2YgYWN0aW9u
IGlzIHRvIG1ha2UKdGhlIG9wZXJhdGlvbiBzYWZlIGFnYWluc3QgYWJ1c2UuIFRoZSBtaW5pbXVt
IHJlcXVpcmVtZW50IGlzIHRvCmRvY3VtZW50IG9idmlvdXMgbWlzc2luZyBwaWVjZXMgZm9yIHRo
aXMgdG8gYmVjb21lIHN1cHBvcnRlZCBjb2RlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
