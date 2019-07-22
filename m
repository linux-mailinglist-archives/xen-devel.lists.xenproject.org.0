Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF2A6FC00
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 11:18:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpURA-0006Qm-PR; Mon, 22 Jul 2019 09:16:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpUR8-0006QP-TE
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 09:16:50 +0000
X-Inumbo-ID: 6f2356af-ac61-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6f2356af-ac61-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 09:16:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9179328;
 Mon, 22 Jul 2019 02:16:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3BAD3F694;
 Mon, 22 Jul 2019 02:16:46 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <bf64e46ec03145da1887cfff4c632c86784792f6.1563325215.git-series.marmarek@invisiblethingslab.com>
 <49a30043-1dd1-0069-1e3b-c593542f425c@arm.com>
 <20190720212102.GC1250@mail-itl>
 <29595834-4c39-b806-e54d-c73968dd65a9@arm.com>
 <20190722084533.a2tq7qzpunepiguv@Air-de-Roger>
 <a1175232-a742-8a09-cda4-922009440257@arm.com>
Message-ID: <745b6a78-6a92-0b62-224b-8f07ab7a5cc0@arm.com>
Date: Mon, 22 Jul 2019 10:16:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <a1175232-a742-8a09-cda4-922009440257@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/6] xen/x86: Allow stubdom access to irq
 created for msi.
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Tim Deegan <tim@xen.org>, Simon Gaiser <simon@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Brian Woods <brian.woods@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMi8wNy8yMDE5IDEwOjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgUm9nZXIsCj4g
Cj4gT24gMjIvMDcvMjAxOSAwOTo0NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gU3Vu
LCBKdWwgMjEsIDIwMTkgYXQgMDc6MDU6MTZQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
Pj4gSGksCj4+Pgo+Pj4gT24gNy8yMC8xOSAxMDoyMSBQTSwgTWFyZWsgTWFyY3p5a293c2tpLUfD
s3JlY2tpIHdyb3RlOgo+Pj4+IE9uIFNhdCwgSnVsIDIwLCAyMDE5IGF0IDA1OjQ4OjU2UE0gKzAx
MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4gSGksCj4+Pj4+Cj4+Pj4+IFNvcnJ5IGZvciBq
dW1waW5nIGxhdGUgaW4gdGhlIGRpc2N1c3Npb24uCj4+Pj4+Cj4+Pj4+IE9uIDcvMTcvMTkgMjow
MCBBTSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+Pj4+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi9pcnEuaCBiL3hlbi9pbmNsdWRlL3hlbi9pcnEuaAo+Pj4+Pj4g
aW5kZXggNTg2Yjc4My4uYzdhNmE4MyAxMDA2NDQKPj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9pcnEuaAo+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2lycS5oCj4+Pj4+PiBAQCAtOTEs
NiArOTEsNyBAQCB0eXBlZGVmIHN0cnVjdCBpcnFfZGVzYyB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oCBzcGlubG9ja190IGxvY2s7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYXJjaF9pcnFf
ZGVzYyBhcmNoOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgY3B1bWFza192YXJfdCBhZmZpbml0eTsK
Pj4+Pj4+ICvCoMKgwqAgZG9taWRfdCBjcmVhdG9yX2RvbWlkOyAvKiB3ZWFrIHJlZmVyZW5jZSB0
byBkb21haW4gaGFuZGxpbmcgdGhpcyBJUlEgKi8KPj4+Pj4KPj4+Pj4gVGhpcyB4ODYgb25seS4g
Q2FuIHRoaXMgYmUgbW92ZWQgaW4gYXJjaF9pcnFfZGVzYyB0byBhdm9pZCBpbmNyZWFzaW5nIHRo
ZQo+Pj4+PiBzdHJ1Y3R1cmUgb24gQXJtPwo+Pj4+Cj4+Pj4gSG93IChpZiBhdCBhbGwpIFBDSSBw
YXNzdGhyb3VnaCBpcyBzdXBwb3J0ZWQgb24gQVJNPyBJcyBxZW11IGludm9sdmVkPwo+Pj4+IElm
IHNvLCBhbmQgaWYgdGhhdCBxZW11IHdvdWxkIGJlIGlzb2xhdGVkIGluIHN0dWJkb21haW4sIEkg
dGhpbmsgQVJNCj4+Pj4gd291bGQgbmVlZCBhIHNpbWlsYXIgZmVhdHVyZS4gSWYgaXQgbm90IHRo
ZSBjYXNlIHJpZ2h0IG5vdywgYnV0IGl0IGlzCj4+Pj4gcGxhbm5lZCwgZG8geW91IHRoaW5rIGl0
J3Mgd29ydGggbW92aW5nIGl0IHRvIGFyY2hfaXJxX2Rlc2MgYW5kIHBvc3NpYmx5Cj4+Pj4gbW92
ZSBiYWNrIGxhdGVyPwo+Pj4KPj4+IFBDSSBwYXNzdGhyb3VnaCBpcyBub3QgeWV0IHN1cHBvcnRl
ZCBvbiBBcm0uIEhvd2V2ZXIsIEkgd291bGQgbm90IGV4cGVjdAo+Pj4gUUVNVSB0byBiZSBpbnZv
bHZlZCBhdCBhbGwgZm9yIEFybS4KPj4+Cj4+PiBJbiBhbnkgY2FzZSwgSSB3b3VsZCBzdGlsbCBw
cmVmZXIgdG8ga2VlcCBmaWVsZCBpbiBhcmNoX2lycV9kZXNjIHVudGlsIHdlCj4+PiBzZWUgYW55
IHVzYWdlIG9uIEFybS4KPj4KPj4gSSdtIGZpbmUgd2l0aCBwdXR0aW5nIGl0IGluc2lkZSBvZiB0
aGUgYXJjaCBzdHJ1Y3QsIGJ1dCB0aGVyZSdzCj4+IG5vdGhpbmcgeDg2IHNwZWNpZmljIGFib3V0
IHRoaXMgZmllbGQuCj4gCj4gSW4gdGhlb3J5IHllcywgaW4gcHJhY3RpY2UgdGhpcyBpcyBvbmx5
IHVzZWQgYnkgeDg2IHRvZGF5LiBJIGRvbid0IHdhbnQgdG8gCj4gaW5jcmVhc2UgdGhlIHNpemUg
b2YgaXJxX2Rlc2MgZm9yIHVudXNlZCBmaWVsZC4KPiAKPiBXZSBjYW4gbW92ZSBiZWNhdXNlIHRo
ZSBmaWVsZCBpbiBpcnFfZGVzYyBpZiB0aGVyZSBhcmUgYSBuZWVkIG9uIEFybS4KCnMvYmVjYXVz
ZS9sYXRlci8KCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
