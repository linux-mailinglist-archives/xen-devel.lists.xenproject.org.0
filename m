Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5245881
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 11:23:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbiOI-00052l-M1; Fri, 14 Jun 2019 09:20:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbiOG-00052g-OJ
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 09:20:56 +0000
X-Inumbo-ID: b645fbc3-8e85-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b645fbc3-8e85-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 09:20:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 03:20:54 -0600
Message-Id: <5D0366F30200007800238384@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 03:20:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-10-roger.pau@citrix.com>
 <5D025F630200007800237F41@prv1-mh.provo.novell.com>
 <20190614090615.ywfm45lm3qvngo64@Air-de-Roger>
In-Reply-To: <20190614090615.ywfm45lm3qvngo64@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 09/13] pci: switch pci_conf_read32 to use
 pci_sbdf_t
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
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
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

Pj4+IE9uIDE0LjA2LjE5IGF0IDExOjA2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDA4OjM2OjE5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDcuMDYuMTkgYXQgMTE6MjIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3F1aXJrcy5jCj4+
ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3F1aXJrcy5jCj4+ID4gQEAgLTEy
OCw5ICsxMjgsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IG1hcF9pZ2RfcmVnKHZvaWQpCj4+ID4g
ICAgICBpZiAoIGlnZF9yZWdfdmEgKQo+PiA+ICAgICAgICAgIHJldHVybjsKPj4gPiAgCj4+ID4g
LSAgICBpZ2RfbW1pbyAgID0gcGNpX2NvbmZfcmVhZDMyKDAsIDAsIElHRF9ERVYsIDAsIFBDSV9C
QVNFX0FERFJFU1NfMSk7Cj4+ID4gKyAgICBpZ2RfbW1pbyAgID0gcGNpX2NvbmZfcmVhZDMyKFBD
SV9TQkRGKDAsIDAsIElHRF9ERVYsIDApLAo+PiAKPj4gQWZhaWN0IGF0IHRoaXMgcG9pbnQgYWxs
IHVzZXMgb2YgSUdEX0RFViBhcmUgaW4gY29uc3RydWN0cyBsaWtlIHRoaXMgb25lLgo+PiBBcyBw
cmV2aW91c2x5IHNheSwgSSB0aGluayBJR0RfREVWIGl0c2VsZiB3b3VsZCBub3cgYmV0dGVyIGJl
Y29tZSBhbgo+PiBpbnZvY2F0aW9uIG9mIFBDSV9TQkRGKCkuIFNhbWUgZm9yIElPSF9ERVYgdGhl
bi4KPiAKPiBJcyBpdCBmaW5lIHRvIGRvIHRoaXMgYXMgYSBmb2xsb3d1cCBwYXRjaD8KCkVpdGhl
ciB3YXkgaXMgZmluZSBieSBtZSwgYWxiZWl0IEknZCAoc2xpZ2h0bHkpIHByZWZlciBpdCBnZXR0
aW5nIGZvbGRlZCBpbnRvCmhlcmUsIGlycmVzcGVjdGl2ZSAuLi4KCj4gT3IgZWxzZSBJIHdvdWxk
IGFsc28gaGF2ZSB0byBtb2RpZnkgdGhlIHBjaV9jb25mX3JlYWR7OCwxNn0gY2FsbHMgdGhhdAo+
IHVzZSBJR0RfREVWIG9yIElPSF9ERVYgaW4gdGhpcyBwYXRjaC4KCi4uLiBvZiB0aGUgbmVlZCBm
b3IgdGhlc2UgZXh0cmEgYWRqdXN0bWVudHMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
