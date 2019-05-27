Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61A2B174
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:40:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVC3o-0003Sl-Qb; Mon, 27 May 2019 09:36:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVC3m-0003Sg-Q5
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:36:50 +0000
X-Inumbo-ID: f3917f0e-8062-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f3917f0e-8062-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 09:36:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 03:36:48 -0600
Message-Id: <5CEBAFAD0200007800232B9A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 03:36:45 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
 <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
 <98ae3d6e-7c76-f093-22b4-22568142ac82@citrix.com>
 <5CB0796A0200007800226DDA@prv1-mh.provo.novell.com>
In-Reply-To: <5CB0796A0200007800226DDA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH 1/2] core-parking: interact with runtime
 SMT-disabling
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEyLjA0LjE5IGF0IDEzOjQxLCAgd3JvdGU6Cj4+Pj4gT24gMTEuMDQuMTkgYXQgMjE6
MDYsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIDExLzA0LzIwMTkg
MTM6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IFdoZW4gZGlzYWJsaW5nIFNNVCBhdCBydW50
aW1lLCBzZWNvbmRhcnkgdGhyZWFkcyBzaG91bGQgbm8gbG9uZ2VyIGJlCj4gPj4gY2FuZGlkYXRl
cyBmb3IgYnJpbmdpbmcgYmFjayB1cCBpbiByZXNwb25zZSB0byBfUFVEIEFDUEkgZXZlbnRzLiBQ
dXJnZQo+ID4+IHRoZW0gZnJvbSB0aGUgdHJhY2tpbmcgYXJyYXkuCj4gPj4KPiA+PiBEb2luZyBz
byBpbnZvbHZlcyBhZGRpbmcgbG9ja2luZyB0byBndWFyZCBhY2NvdW50aW5nIGRhdGEgaW4gdGhl
IGNvcmUKPiA+PiBwYXJraW5nIGNvZGUuIFdoaWxlIGFkZGluZyB0aGUgZGVjbGFyYXRpb24gZm9y
IHRoZSBsb2NrIHRha2UgdGhlIGxpYmVydHkKPiA+PiB0byBkcm9wIHR3byB1bm5lY2Vzc2FyeSBm
b3J3YXJkIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IAo+ID4gSSBjYW4gY2VydGFpbmx5IGFw
cHJlY2lhdGUgdGhlc2UgYXJndW1lbnRzLCBidXQgc3VyZWx5IHRoZSBjb252ZXJzZSBpcwo+ID4g
dHJ1ZS4gIFdoZW4gU01ULWVuYWJsZSBpcyB1c2VkLCB0aGUgbmV3bHktb25saW5lZCB0aHJlYWRz
IGFyZSBub3cKPiA+IGVsaWdpYmxlIHRvIGJlIHBhcmtlZC4KPiAKPiBBbmQgbm90aGluZyB3aWxs
IGtlZXAgdGhlbSBmcm9tIGdldHRpbmcgcGFya2VkLgo+IAo+ID4gQXQgdGhlIG1vbWVudCwgdGhp
cyBsb29rcyBhc3ltZXRyaWMuCj4gCj4gSXQgZG9lcywgYnV0IHRoYXQncyBhIHJlc3VsdCBvZiBj
b3JlX3BhcmtpbmcuYyBvbmx5IHJlY29yZGluZyBDUFVzCj4gaXQgaGFzIHBhcmtlZCwgbm90IG9u
ZXMgaXQgY291bGQgcGFyay4KCkRpZCBteSByZXNwb25zZXMgYWRkcmVzcyB5b3VyIGNvbmNlcm5z
PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
