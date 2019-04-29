Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E195ADCA9
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 09:12:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL0Np-0003ax-TD; Mon, 29 Apr 2019 07:07:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL0Nn-0003ao-Gx
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 07:07:23 +0000
X-Inumbo-ID: 6e253971-6a4d-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e253971-6a4d-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 07:07:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 01:07:19 -0600
Message-Id: <5CC6A2A10200007800229D56@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 01:07:13 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
In-Reply-To: <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 206497@studenti.unimore.it,
 xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI2LjA0LjE5IGF0IDIzOjMxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDQvMjYvMTkgNDo0OCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI2LjA0LjE5
IGF0IDE3OjM4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4gTWF5IEkgYXNrIHdo
eSBpdCBpcyBjdXJyZW50bHkgbm90IGJlIGFuIGlzc3VlIG9uIHg4Nj8gRG8geW91IGFsd2F5cyBw
YXNzIGEgcG93ZXIKPj4+IG9mIDIgdG8gaW5pdF94ZW5oZWFwX3BhZ2VzPwo+PiAKPj4gTm8sIGl0
J3MgYmVjYXVzZSBDT05GSUdfU0VQQVJBVEVfWEVOSEVBUCBpcyB1bmRlZmluZWQgb24KPj4gKDY0
LWJpdCkgeDg2LCBpLmUuIHRoZXJlIHNpbXBseSBpcyBubyBib3VuZGFyeSBiZXR3ZWVuIGJvdGgg
aGVhcHMuCj4gCj4gT2gsIHNvbWVob3cgSSB0aG91Z2h0IGl0IHdhcyBzZXBhcmF0ZWQuIE9rLCBz
byBJIHdvdWxkIGtlZXAgdGhlIGNvZGUgYXMgCj4gaXMgaW4gaW5pdF94ZW5oZWFwX3BhZ2VzIHRo
ZW4uCj4gCj4gQnV0IGl0IG9jY3VyZWQgdG8gbWUgdGhhdCB3ZSBtYXkgd2FudCB0byBwdXQgdGhl
IGNoZWNrIGluIAo+IGluaXRfaGVhcF9wYWdlcygpIHJhdGhlciB0aGFuIGluaXRfeGVuaGVhcF9w
YWdlcygpIGFzIHdlIGFsc28gd2FudCB0byAKPiBjb3ZlciBkb21oZWFwLgoKSW5kZWVkLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
