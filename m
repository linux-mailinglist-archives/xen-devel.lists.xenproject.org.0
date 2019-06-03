Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C2032D85
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 12:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjnU-0005wF-Eg; Mon, 03 Jun 2019 10:02:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXjnT-0005w9-2M
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:02:31 +0000
X-Inumbo-ID: b1f6f7d0-85e6-11e9-b623-9b116ea8529a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f6f7d0-85e6-11e9-b623-9b116ea8529a;
 Mon, 03 Jun 2019 10:02:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 04:02:27 -0600
Message-Id: <5CF4F02E0200007800234874@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 04:02:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9360200007800233E01@prv1-mh.provo.novell.com>
 <6c267398-fd65-1351-e100-8fdebd9986e4@citrix.com>
In-Reply-To: <6c267398-fd65-1351-e100-8fdebd9986e4@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] bitops: speed up hweight<N>()
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDIxOjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAwMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9pbmNsdWRlL3hlbi9iaXRvcHMuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmgK
Pj4gQEAgLTE1Myw0MSArMTUzLDU0IEBAIHN0YXRpYyBfX2lubGluZV9fIGludCBnZXRfY291bnRf
b3JkZXIodW4KPj4gIAo+PiAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgZ2VuZXJpY19od2Vp
Z2h0MzIodW5zaWduZWQgaW50IHcpCj4+ICB7Cj4+IC0gICAgdW5zaWduZWQgaW50IHJlcyA9ICh3
ICYgMHg1NTU1NTU1NSkgKyAoKHcgPj4gMSkgJiAweDU1NTU1NTU1KTsKPj4gLSAgICByZXMgPSAo
cmVzICYgMHgzMzMzMzMzMykgKyAoKHJlcyA+PiAyKSAmIDB4MzMzMzMzMzMpOwo+PiAtICAgIHJl
cyA9IChyZXMgJiAweDBGMEYwRjBGKSArICgocmVzID4+IDQpICYgMHgwRjBGMEYwRik7Cj4+IC0g
ICAgcmVzID0gKHJlcyAmIDB4MDBGRjAwRkYpICsgKChyZXMgPj4gOCkgJiAweDAwRkYwMEZGKTsK
Pj4gLSAgICByZXR1cm4gKHJlcyAmIDB4MDAwMEZGRkYpICsgKChyZXMgPj4gMTYpICYgMHgwMDAw
RkZGRik7Cj4+ICsgICAgdyAtPSAodyA+PiAxKSAmIDB4NTU1NTU1NTU7Cj4+ICsgICAgdyA9ICAo
dyAmIDB4MzMzMzMzMzMpICsgKCh3ID4+IDIpICYgMHgzMzMzMzMzMyk7Cj4+ICsgICAgdyA9ICAo
dyArICh3ID4+IDQpKSAmIDB4MGYwZjBmMGY7Cj4+ICsKPj4gKyNpZmRlZiBDT05GSUdfSEFTX0ZB
U1RfTVVMVElQTFkKPj4gKyAgICByZXR1cm4gKHcgKiAweDAxMDEwMTAxKSA+PiAyNDsKPj4gKyNl
bHNlCj4+ICsgICAgdyArPSB3ID4+IDg7Cj4+ICsKPj4gKyAgICByZXR1cm4gKHcgKyAodyA+PiAx
NikpICYgMHhmZjsKPj4gKyNlbmRpZgo+IAo+IFRoaXMgd291bGQgYmUgc2xpZ2h0bHkgc2hvcnRl
ciwgbGVzcyBsaWFibGUgdG8gYml0cm90LCBhbmQgSU1PIGNsZWFuZXIsCj4gdG8gZG8KPiAKPiBp
ZiAoIElTX0VOQUJMRUQoQ09ORklHX0hBU19GQVNUX01VTFRJUExZKSApCj4gICAgIHcgPSB3ICog
MHgwMTAxMDEwMSkgPj4gMjQ7Cj4gZWxzZQo+ICAgICB3ICs9IHcgPj4gODsKPiAKPiByZXR1cm4g
dzsKCldvdWxkIHlvdSBiZSBva2F5IHdpdGgKCnN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGdl
bmVyaWNfaHdlaWdodDMyKHVuc2lnbmVkIGludCB3KQp7CiAgICB3IC09ICh3ID4+IDEpICYgMHg1
NTU1NTU1NTsKICAgIHcgPSAgKHcgJiAweDMzMzMzMzMzKSArICgodyA+PiAyKSAmIDB4MzMzMzMz
MzMpOwogICAgdyA9ICAodyArICh3ID4+IDQpKSAmIDB4MGYwZjBmMGY7CgogICAgaWYgKCBJU19F
TkFCTEVEKENPTkZJR19IQVNfRkFTVF9NVUxUSVBMWSkgKQogICAgICAgIHJldHVybiAodyAqIDB4
MDEwMTAxMDEpID4+IDI0OwoKICAgIHcgKz0gdyA+PiA4OwoKICAgIHJldHVybiAodyArICh3ID4+
IDE2KSkgJiAweGZmOwp9CgpkZXNwaXRlIHRoZXJlIHRoZW4gc3RpbGwgYmVpbmcgdHdvIHJldHVy
biBzdGF0ZW1lbnRzPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
