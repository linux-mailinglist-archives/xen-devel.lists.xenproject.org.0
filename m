Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC719F67
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:37:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6bv-0003LB-6y; Fri, 10 May 2019 14:34:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP6bt-0003L6-P1
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:34:53 +0000
X-Inumbo-ID: c5487dc2-7330-11e9-8044-9f4e21642f06
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c5487dc2-7330-11e9-8044-9f4e21642f06;
 Fri, 10 May 2019 14:34:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77436A78;
 Fri, 10 May 2019 07:34:51 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 790933F73C;
 Fri, 10 May 2019 07:34:49 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
 <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
 <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
 <5CD5805F020000780022D939@prv1-mh.provo.novell.com>
 <9e696d26-0d3b-da9e-7427-f29da07dde7c@arm.com>
 <5CD58873020000780022D9FC@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <16cea000-3b02-08f6-4b0e-2df1024ed245@arm.com>
Date: Fri, 10 May 2019 15:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD58873020000780022D9FC@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTAvMDUvMjAxOSAxNToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTAuMDUuMTkgYXQgMTY6MDQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDEw
LzA1LzIwMTkgMTQ6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDUuMTkgYXQg
MTU6NDEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gVGhlIHBvaW50IGhlcmUs
IHdlIGtlZXAgd2l0aGluIHRoZSBoeXBlcnZpc29yIHRoZSBpZGVhIG9mIHdoYXQncyB2YWxpZCBv
cgo+Pj4+IGludmFsaWQuIFRoaXMgYWxsb3dzIHVzIG1vcmUgZmxleGliaWxpdHkgb24gdGhlIHZh
bHVlIGhlcmUgKGltYWdpbmUgd2UgZGVjaWRlIHRvCj4+Pj4gY2hhbmdlIHRoZSB2YWx1ZSBvZiBH
Rk5fSU5WQUxJRCBpbiB0aGUgZnV0dXJlLi4uKS4KPj4+Cj4+PiBFeGFjdGx5LCBhbmQgaGVuY2Ug
SU5WQUxJRF9HRk4gc2hvdWxkIG5vdCBiZWNvbWUgdmlzaWJsZSB0byB0aGUKPj4+IG91dHNpZGUu
IEhlbmNlIG15IHJlcXVlc3QgdG8gdXNlIGFuIGFsbC1vbmVzIHZhbHVlIGhlcmUuCj4+IEl0IGlz
IG9ubHkgdmlzaWJsZSBpZiB5b3UgcHV0IGFuIGV4YWN0IHZhbHVlIGluIHRoZSBkb2N1bWVudGF0
aW9uLiBZb3VyCj4+IHN1Z2dlc3Rpb24gaXMgdG8gcHV0IGEgZXhhY3RseSB2YWx1ZSBhbmQgSSB3
b3VsZCByYXRoZXIgbm90IHNlZSB0aGF0Lgo+IAo+IEkgZGlkIHNwZWNpZmljYWxseSBzdWdnZXN0
IHRvIF9ub3RfIHN0b3JlIElOVkFMSURfR0ZOIGhlcmUsIGJ1dCB0bwo+IHN0b3JlIDY0LWJpdCBi
aXRzIG9mIG9uZXMuIE5vdGUgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIG9uCj4gMzIt
Yml0IEFybS4KWW91ciBwb2ludCBvZiBoYXZpbmcgYW4gZXhhY3QgdmFsdWUgaXMgb25seSB1c2Vm
dWwgaWYgeW91IHdhbnQgdG8gdG9vbHN0YWNrIHRvIApzaWxlbnRseSBpZ25vcmUgdGhlIG1pc3Np
bmcgZnJhbWUgYW5kIGF2b2lkIGEgY2FsbC4KClRoZSBmb3JtZXIgaXMgcHJldHR5IG11Y2ggd3Jv
bmcgYXMgaWYgeW91IHdlcmUgdHJ5aW5nIHRvIHJlYWQgdGhlIGZyYW1lIHRoZW4gCm1vc3QgbGlr
ZWx5IHlvdSB3YW50ZWQgdG8gYWNjZXNzIGl0LiBTbyBhIG1lc3NhZ2UgbWFrZXMgc2Vuc2UgaGVy
ZS4KCkZvciB0aGUgbGF0dGVyLCBhdm9pZGluZyB0aGUgY2FsbCBpcyBvbmx5IGdvaW5nIHRvIHNh
dmUgeW91IGEgY291cGxlIG9mIGN5Y2xlcyAKaW4gYSBsaWtlbHkgY29sZCBwYXRoLgoKWW91IHJl
YWxseSBkb24ndCBuZWVkIHRvIGdpdmUgYW4gZXhhY3QgKGluY2x1ZGluZyBzYXkgYWxsIG9uZXMp
LiBZb3Ugb25seSBuZWVkIAp0byBzYXkgdGhhdCB0aGUgYWRkcmVzcyByZXR1cm4gbWF5IG5vdCBi
ZSBtYXBwYWJsZS4gVGhlIHRvb2xzdGFjayB3aWxsIHRyeSB0byAKbWFwIGl0IGFuZCBmYWlsLiBU
aGF0J3Mgbm90IGEgYmlnIGRlYWwuCgpBbnl3YXksIEkgd2lsbCB3YWl0IGFuZCBzZWUgd2hhdCdz
IHRoZSB2aWV3IGZyb20gdGhlIHRvb2xzIG1haW50YWluZXIuCgo+IAo+IFByZWZlcmFibHkgeWVz
OyBkZXBlbmRzIG9uIGhvdyBleGFjdGx5IHlvdSBjb2RlIHRoZSBhc3NlcnRpb24uCj4gSWYgeW91
IGZvbGxvdyB0aGUgaWYoKS1BU1NFUlRfVU5SRUFDSEFCTEUoKS1yZXR1cm4gc3R5bGUgd2UndmUK
PiBiZWVuIHVzaW5nIGVsc2V3aGVyZSwgdGhlbiBubyBtYXR0ZXIgaG93IHlvdSBwbGFjZSB0aGUg
I2Vsc2UKPiBvciAjZW5kaWYgdGhlIHByaW50aygpIHdpbGwgYmUgY29tcGlsZWQgb3V0LgoKSSB3
aWxsIGhhdmUgYSBsb29rLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
