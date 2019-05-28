Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30E2C1D4
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 10:54:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVXpX-0003s1-Hk; Tue, 28 May 2019 08:51:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVXpW-0003rv-5X
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 08:51:34 +0000
X-Inumbo-ID: c8fc761e-8125-11e9-a998-1317d1a0e8f6
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8fc761e-8125-11e9-a998-1317d1a0e8f6;
 Tue, 28 May 2019 08:51:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 28 May 2019 02:51:28 -0600
Message-Id: <5CECF68A0200007800232E9B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 28 May 2019 02:51:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-4-roger.pau@citrix.com>
 <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
 <20190527164419.oc75p6kmegiv3m7v@Air-de-Roger>
In-Reply-To: <20190527164419.oc75p6kmegiv3m7v@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] pci: switch pci_conf_{read/write} to
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
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

Pj4+IE9uIDI3LjA1LjE5IGF0IDE4OjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDA0OjAxOjIzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTAuMDUuMTkgYXQgMTg6MTAsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4+ID4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3BjaS5oCj4+ID4gQEAgLTU4LDYgKzU4LDExIEBAIHR5cGVkZWYgdW5pb24gewo+
PiA+ICAgICAgfTsKPj4gPiAgfSBwY2lfc2JkZl90Owo+PiA+ICAKPj4gPiArI2RlZmluZSBQQ0lf
U0JERl9UKHMsIGIsIGQsIGYpIFwKPj4gPiArICAgICgocGNpX3NiZGZfdCkgeyAuc2VnID0gKHMp
LCAuYnVzID0gKGIpLCAuZGV2ID0gKGQpLCAuZnVuYyA9IChmKSB9KQo+PiAKPj4gSSdkIHByZWZl
ciBpZiB0aGUgX1Qgc3VmZml4IGNvdWxkIGJlIG9taXR0ZWQuIEFmYWljcyB0aGVyZSdzIG5vIHVz
ZSBvZiB0aGUKPj4gZXhpc3RpbmcgUENJX1NCREYoKSBhbnl3aGVyZSBpbiB0aGUgdHJlZSwgc28g
dGhpcyBzaG91bGQgYmUgZmluZS4gRm9yCj4+IHRoZSAybmQgbWFjcm8gYmVsb3cgSSBjYW4ndCBl
YXNpbHkgdGVsbCB3aGV0aGVyIHRoZSBmZXcgZXhpc3RpbmcgdXNlZAo+PiBoYXZlIGFsbCBkaXNh
cHBlYXJlZCBieSBub3csIGJ1dCBpdCBzZWVtcyBsaWtlbHkuCj4gCj4gSSBjYW4gc2VlIGFib3V0
IGRyb3BwaW5nIHRoZSBfVCBzdWZmaXgsIGJ1dCBJIHRoaW5rIHRoZXJlJ3MgbGlrZWx5Cj4gc29t
ZSBvdmVybGFwIGJldHdlZW4gdGhlIGludHJvZHVjdGlvbiBvZiBQQ0lfU0JERl9UIGFuZCB0aGUg
bGFzdCB1c2VyCj4gb2YgdGhlIGN1cnJlbnQgUENJX1NCREYgaGVscGVycywgc28gbWF5YmUgaXQn
cyBmaW5lIHRvIHVzZSB0aGUgX1QKPiBzdWZmaXggYXQgZmlyc3QgYW5kIGhhdmUgb25lIGZpbmFs
IHBhdGNoIHRoYXQgcmVtb3ZlcyBpdD8KClRoYXQgd291bGQgYmUgYW4gb3B0aW9uIGlmIGl0IGNh
bid0IGJlIGRvbmUgaW4gb25lIGdvLCBzdXJlLgoKPj4gQWxzbyBJJ20gYWZyYWlkIGluaXRpYWxp
emVycyBvZiB0aGlzIGtpbmQgd2lsbCBicmVhayB0aGUgYnVpbGQgd2l0aCBvbGQgZ2NjLgo+IAo+
IEkgdGhvdWdodCB3ZSBkcm9wcGVkIHN1cHBvcnQgZm9yIHN1Y2ggb2xkIHZlcnNpb25zIG9mIGdj
YywgaXMgdGhhdCBub3QKPiB0aGUgY2FzZT8KCk5vIHlldCwgYXMgcGVyIC4vUkVBRE1FLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
