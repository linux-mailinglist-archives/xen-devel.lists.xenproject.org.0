Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1C47F4F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 12:09:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcoWX-0004t1-5u; Mon, 17 Jun 2019 10:06:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcoWV-0004sw-5c
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 10:05:59 +0000
X-Inumbo-ID: 7ed001e2-90e7-11e9-b49a-8b76e796d27b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ed001e2-90e7-11e9-b49a-8b76e796d27b;
 Mon, 17 Jun 2019 10:05:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 04:05:54 -0600
Message-Id: <5D0765FD0200007800238BF1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 04:05:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-12-roger.pau@citrix.com>
In-Reply-To: <20190607092232.83179-12-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 11/13] pci: switch pci_conf_write16 to
 use pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDExOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2Ft
ZC5jCj4gQEAgLTcwNywxMSArNzA3LDExIEBAIHN0YXRpYyB2b2lkIGluaXRfYW1kKHN0cnVjdCBj
cHVpbmZvX3g4NiAqYykKPiAgCQkJCSAgICAgICAoaCAmIDB4MSkgPyAiY2xlYXJpbmcgRDE4RjN4
NUNbMF0iIDogIiIpOwo+ICAKPiAgCQkJaWYgKGwgJiAweDFmKQo+IC0JCQkJcGNpX2NvbmZfd3Jp
dGUzMigwLCAwLCAweDE4LCAweDMsIDB4NTgsCj4gKwkJCQlwY2lfY29uZl93cml0ZTMyKDAsIDAs
IDB4MTgsIDMsIDB4NTgsCj4gIAkJCQkJCSBsICYgfjB4MWYpOwo+ICAKPiAgCQkJaWYgKGggJiAw
eDEpCj4gLQkJCQlwY2lfY29uZl93cml0ZTMyKDAsIDAsIDB4MTgsIDB4MywgMHg1YywKPiArCQkJ
CXBjaV9jb25mX3dyaXRlMzIoMCwgMCwgMHgxOCwgMywgMHg1YywKPiAgCQkJCQkJIGggJiB+MHgx
KTsKPiAgCQl9CgpUaGVzZSBjaGFuZ2VzIGRvbid0IHNlZW0gdG8gYmVsb25nIGhlcmUuIFdpdGgg
dGhpcyB0YWtlbiBjYXJlIG9mClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
