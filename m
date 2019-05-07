Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12DB1654C
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 16:00:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO0bQ-0008Vl-Ag; Tue, 07 May 2019 13:57:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hO0bP-0008Vg-Ea
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:57:51 +0000
X-Inumbo-ID: 19fb82b9-70d0-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 19fb82b9-70d0-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 13:57:50 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 07:57:50 -0600
Message-Id: <5CD18EDA020000780022C87D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 07:57:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
 <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
 <5CD1367C020000780022C597@prv1-mh.provo.novell.com>
 <f9deae17-e925-9a4f-1eb1-443b428e0525@arm.com>
 <5CD15163020000780022C68B@prv1-mh.provo.novell.com>
 <09b11a6c-84b2-259b-7d1f-975f25e18e55@arm.com>
In-Reply-To: <09b11a6c-84b2-259b-7d1f-975f25e18e55@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDE1OjIwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvNy8xOSAxMDozNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA3LjA1LjE5
IGF0IDEwOjU5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4gQXQgbGVhc3Qgb24g
QXJtLCBJIGRvbid0IHNlZSBhbnkgcmVhbCB2YWx1ZSB0byBpbml0aWFsaXplIHRoZSBQRFggbWFz
awo+Pj4gd2l0aCBhIGJhc2UgYWRkcmVzcy4gSSB3b3VsZCBiZSBtb3JlIGtlZW4gdG8gaW1wbGVt
ZW50IHBkeF9pbml0X21hc2soKSBhczoKPj4+Cj4+PiByZXR1cm4gZmlsbF9tYXNrKCgodWludDY0
X3QpUEFHRV9TSVpFIDw8IE1BWF9PUkRFUiAtIDEpOwo+PiAKPj4gQnV0IChiZXNpZGVzIHRoZSBt
aXNzaW5nIGNsb3NpbmcgcGFyZW50aGVzZSkgdGhhdCdzIG5vdCB3aGF0IHg4NiB3YW50cy4KPiAK
PiBDb3VsZCB5b3UgcmVtaW5kIG1lIHdoeT8KCkJlY2F1c2Ugd2UgZG9uJ3Qgd2FudCB0byBjb21w
cmVzcyBvbiB0aGUgbG93IDMyIGJpdHMsIGZvciB0aGVyZQpiZWluZyAiaW50ZXJlc3RpbmciIHRo
aW5ncyBiZWxvdyA0R2IuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
