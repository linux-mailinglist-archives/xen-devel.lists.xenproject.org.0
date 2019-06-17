Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C8F47F09
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 12:01:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcoOR-00040o-AJ; Mon, 17 Jun 2019 09:57:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcoOQ-00040j-0R
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 09:57:38 +0000
X-Inumbo-ID: 53cde5a0-90e6-11e9-8f6a-fb291d373d8b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53cde5a0-90e6-11e9-8f6a-fb291d373d8b;
 Mon, 17 Jun 2019 09:57:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 03:57:32 -0600
Message-Id: <5D0764080200007800238BD5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 03:57:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
 <20190607092232.83179-11-roger.pau@citrix.com>
In-Reply-To: <20190607092232.83179-11-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 10/13] pci: switch pci_conf_write8 to use
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
IC0tLSBhL3hlbi9kcml2ZXJzL2FjcGkvcmVib290LmMKPiArKysgYi94ZW4vZHJpdmVycy9hY3Bp
L3JlYm9vdC5jCj4gQEAgLTIzLDkgKzIzLDkgQEAgdm9pZCBhY3BpX3JlYm9vdCh2b2lkKQo+ICAJ
Y2FzZSBBQ1BJX0FEUl9TUEFDRV9QQ0lfQ09ORklHOgo+ICAJCXByaW50aygiUmVzZXR0aW5nIHdp
dGggQUNQSSBQQ0kgUkVTRVRfUkVHLlxuIik7Cj4gIAkJLyogV3JpdGUgdGhlIHZhbHVlIHRoYXQg
cmVzZXRzIHVzLiAqLwo+IC0JCXBjaV9jb25mX3dyaXRlOCgwLCAwLAo+IC0JCQkJKHJyLT5hZGRy
ZXNzID4+IDMyKSAmIDMxLAo+IC0JCQkJKHJyLT5hZGRyZXNzID4+IDE2KSAmIDcsCj4gKwkJcGNp
X2NvbmZfd3JpdGU4KFBDSV9TQkRGKDAsIDAsCj4gKwkJCQkJIChyci0+YWRkcmVzcyA+PiAzMikg
JiAzMSwKPiArCQkJCQkgKHJyLT5hZGRyZXNzID4+IDE2KSAmIDcpLAoKSXNuJ3QgaXQgdGhlIGNh
c2UgdGhhdCB0aGUgQU5ELWluZyBieSBjb25zdGFudHMgaXMgbm93IG5vIGxvbmdlcgpuZWVkZWQ/
Cgo+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCj4gKysrIGIveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMKPiBAQCAtMjYzLDggKzI2Myw4IEBAIHN0YXRpYyB2b2lkIHZwY2lfd3JpdGVfaHco
cGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwKPiAg
ICAgICAgICAgKi8KPiAgICAgICAgICBpZiAoIHJlZyAmIDEgKQo+ICAgICAgICAgIHsKPiAtICAg
ICAgICAgICAgcGNpX2NvbmZfd3JpdGU4KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNi
ZGYuZm4sIHJlZywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEpOwo+ICsKPiAr
ICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGU4KHNiZGYsIHJlZywgZGF0YSk7Cj4gICAgICAgICAg
ICAgIHBjaV9jb25mX3dyaXRlMTYoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5m
biwgcmVnICsgMSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhID4+IDgpOwoK
UGxlYXNlIGRvbid0IGluc2VydCBhIGJsYW5rIGxpbmUgbGlrZSB0aGlzLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
