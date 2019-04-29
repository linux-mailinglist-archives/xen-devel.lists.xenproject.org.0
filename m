Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2875EDCB7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 09:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL0VV-0004VJ-6F; Mon, 29 Apr 2019 07:15:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL0VT-0004VE-Np
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 07:15:19 +0000
X-Inumbo-ID: 8931c234-6a4e-11e9-bc2b-8ba56b8d2d47
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8931c234-6a4e-11e9-bc2b-8ba56b8d2d47;
 Mon, 29 Apr 2019 07:15:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 01:15:14 -0600
Message-Id: <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 01:15:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA0LjE5IGF0IDAxOjQ3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gVGhlIG90aGVyIGNoYW5nZSB0byBucl9wZHhzIGlzIGxlc3Mgb2J2aW91cy4gSXQgaXMgY2xl
YXIgdGhhdCBucl9wZHhzIGlzCj4gY2FsY3VsYXRlZCB3cm9uZ2x5IGluIHRoaXMgY2FzZSAobWVt
b3J5IDAtMHg4MDAwMDAwMCwKPiAweDgwMDAwMDAwMC0weDg4MDAwMDAwMCwgcHM9MCwgcGU9MHg4
ODAwMDAwMDApOiBucl9wZHhzPTUyNDI4OCB3aGljaCBpcwo+IGhhbGYgdGhlIG51bWJlciB3ZSBu
ZWVkICh0aGUgY29ycmVjdCBudW1iZXIgaXMgMTA0ODU3NSkuCj4gCj4gVGFraW5nIGEgbGluZSBm
cm9tIHRoZSB4ODYgY29kZSB4ZW4vYXJjaC94ODYvc2V0dXAuYzpzZXR1cF9tYXhfcGR4Cj4gKEp1
bGllbidzIHN1Z2dlc3Rpb24pOgo+IAo+ICAgbWF4X3BkeCA9IHBmbl90b19wZHgodG9wX3BhZ2Ug
LSAxKSArIDE7Cj4gCj4gSSBjaGFuZ2VkIG5yX3BkeHMgdG8KPiAgIAo+ICAgbnJfcGR4cyA9IHBm
bl90b19wZHgoKHBlID4+IFBBR0VfU0hJRlQpIC0gMSkgKyAxOwo+IAo+IGFuZCBpdCB3b3Jrcy4g
SSB0aGluayB0aGUgY2hhbmdlIGlzIGNvcnJlY3QgYmVjYXVzZSBsb29raW5nIGF0IHRoZQo+IGlt
cGxlbWVudGF0aW9uIG9mIHBmbl90b19wZHggaXQgaXMgY2VydGFpbmx5IG1lYW50IHRvIG9wZXJh
dGUgb24gYSBwZm4KPiBtYXNraW5nIGJpdHMgb24gaXQgdG8gY29tcGVuc2F0ZSBmb3IgdGhlIGhv
bGVzLiBJdCBpcyBub3QgbWVhbnQgdG8gd29yawo+IG9uIGEgc2l6ZS4KPiAKPiBKYW4sIGRvZXMg
aXQgbG9vayBjb3JyZWN0IHRvIHlvdSB0b28/CgpZZXMuIHBmbl90b19wZHgoKSBhbmQgZnJpZW5k
cyBtYXkgb25seSBldmVyIGJlIHBhc3NlZCBhY3R1YWwKUEZOcyAvIFBEWGVzLCBub3Qgc29tZXRo
aW5nIHRoYXQncyBvbmUgYWJvdmUgb3Igb25lIGJlbG93IGEKdmFsaWQgcmFuZ2UuIEkgc2hhcmUg
SnVsaWVuJ3MgcXVlc3Rpb24gdGhvdWdoOiBXYXMgaXQgcmVhbGx5IG1lcmUKbHVjayB0aGF0IHRo
aW5ncyBoYXZlIGJlZW4gd29ya2luZyB0byBkYXRlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
