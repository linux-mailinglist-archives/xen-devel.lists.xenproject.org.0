Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8BFFC74
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 17:09:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLUL2-0002av-2O; Tue, 30 Apr 2019 15:06:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLUKz-0002aq-V5
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 15:06:29 +0000
X-Inumbo-ID: 86c5f602-6b59-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 86c5f602-6b59-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 15:06:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 09:06:26 -0600
Message-Id: <5CC8646F020000780022A89E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 09:06:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
 <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
In-Reply-To: <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDE2OjQzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiA0LzMwLzE5IDk6NDQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4w
NC4xOSBhdCAxMDoyOCwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Pj4gT24gVHVlLCBB
cHIgMzAsIDIwMTkgYXQgMToxNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOgo+Pj4+IEkndmUgb3V0bGluZWQgYSBzb2x1dGlvbiBhbHJlYWR5OiBNYWtlIGEgbWVtLXNo
YXJpbmcgcHJpdmF0ZSB2YXJpYW50Cj4+Pj4gb2YgcGFnZV97LHVufWxvY2soKSwgZGVyaXZlZCBm
cm9tIHRoZSBQViBvbmVzIChidXQgd2l0aCBwaWVjZXMKPj4+PiBkcm9wcGVkIHlvdSBkb24ndCB3
YW50L25lZWQpLgo+Pj4KPj4+IFdlbGwsIHRoYXQncyB3aGF0IEkgYWxyZWFkeSBkaWQgaGVyZSBp
biB0aGlzIHBhdGNoLiBObz8KPj4gCj4+IE5vIC0geW91J3ZlIHJldGFpbmVkIGEgc2hhcmVkIF9w
YWdlX3ssdW59bG9jaygpLCB3aGVyZWFzIG15Cj4+IHN1Z2dlc3Rpb24gd2FzIHRvIGhhdmUgYSBj
b21wbGV0ZWx5IGluZGVwZW5kZW50IHBhaXIgb2YKPj4gZnVuY3Rpb25zIGluIG1lbV9zaGFyaW5n
LmMuIFRoZSBvbmx5IHRoaW5nIG5lZWRlZCBieSBib3RoIFBWCj4+IGFuZCBIVk0gd291bGQgdGhl
biBiZSB0aGUgUEdUX2xvY2tlZCBmbGFnLgo+IAo+IEJ1dCBpdCB3YXNuJ3Qgb2J2aW91cyB0byBt
ZSBob3cgdGhlIGltcGxlbWVudGF0aW9ucyBvZiB0aGUgYWN0dWFsIGxvY2sKPiBmdW5jdGlvbiB3
b3VsZCBiZSBiZSBkaWZmZXJlbnQuICBBbmQgdGhlcmUncyBubyBwb2ludCBpbiBoYXZpbmcgdHdv
Cj4gaWRlbnRpY2FsIGltcGxlbWVudGF0aW9uczsgaW4gZmFjdCwgaXQgd291bGQgYmUgaGFybWZ1
bC4KClRoZSBtYWluIGRpZmZlcmVuY2Ugd291bGQgYmUgdGhlIG9uZSB0aGF0IFRhbWFzIGlzIGFm
dGVyIC0gbm90CmRvaW5nIHRoZSBjaGVja2luZyB0aGF0IHdlIGRvIGZvciBQVi4gV2hldGhlciBv
dGhlciBiaXRzIGNvdWxkCmJlIGRyb3BwZWQgZm9yIGEgbWVtLXNoYXJpbmcgc3BlY2lhbCB2YXJp
YW50IEkgZG9uJ3Qga25vdyAoeWV0KS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
