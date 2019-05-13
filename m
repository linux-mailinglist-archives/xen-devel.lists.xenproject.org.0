Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344731BA35
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:38:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCzO-0000zk-3r; Mon, 13 May 2019 15:35:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQCzM-0000zV-A8
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:35:40 +0000
X-Inumbo-ID: c0fec74c-7594-11e9-b4f8-0bcd15bc9d88
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0fec74c-7594-11e9-b4f8-0bcd15bc9d88;
 Mon, 13 May 2019 15:35:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 09:35:35 -0600
Message-Id: <5CD98EC4020000780022E421@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 09:35:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-3-paul.durrant@citrix.com>
In-Reply-To: <20190508132403.1454-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/5] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjI0LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEl0J3Mgbm90IHZlbmRvciBzcGVjaWZpYyBzbyBpdCBzaG91bGRuJ3QgcmVhbGx5IGJlIHRo
ZXJlLgoKUGVyaGFwcywgYnV0IHRoaXMgbmVlZHMgYmV0dGVyIGp1c3RpZmljYXRpb246Cgo+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtMjM3MiwxMCArMjM3Miw2IEBAIHN0YXRp
YyBpbnQgX19pbml0IHZ0ZF9zZXR1cCh2b2lkKQo+ICAgICAgUChpb21tdV9oYXBfcHRfc2hhcmUs
ICJTaGFyZWQgRVBUIHRhYmxlcyIpOwo+ICAjdW5kZWYgUAo+ICAKPiAtICAgIHJldCA9IHNjYW5f
cGNpX2RldmljZXMoKTsKPiAtICAgIGlmICggcmV0ICkKPiAtICAgICAgICBnb3RvIGVycm9yOwo+
IC0KPiAgICAgIHJldCA9IGluaXRfdnRkX2h3KCk7CgpFdmVuIGFmdGVyIHNvbWUgbG9va2luZyBh
cm91bmQsIGl0J3Mgbm90IG9idmlvdXMgdG8gbWUgdGhhdCB0aGUgbGF0dGVyCmNhbGwgZG9lc24n
dCBkZXBlbmQgb24gUENJIGRldmljZXMgYmVpbmcga25vd24sIG1vcmUgc3BlY2lmaWNhbGx5CnNl
Z21lbnQgMCdzIGJ1czJicmlkZ2VbXSBoYXZpbmcgYmVlbiBmaWxsZWQuIE5vciBjYW4gSSB0ZWxs
IHdoZXRoZXIKdGhlcmUgd291bGQgYmUgc29tZSBub3RpY2VhYmxlIG1pc2JlaGF2aW9yIChwcmlv
ciB0byBhbnkgZ3Vlc3RzCnN0YXJ0aW5nKSBpZiB0aGVyZSB3YXMgYSBkZXBlbmRlbmN5IGFuZCBp
dCBnb3QgYnJva2VuIGJ5IHRoZSByZS0Kb3JkZXJpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
