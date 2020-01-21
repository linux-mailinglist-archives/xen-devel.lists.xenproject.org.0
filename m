Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334FC143EF5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 15:10:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ituCY-0000no-Se; Tue, 21 Jan 2020 14:08:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cram=3K=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ituCW-0000ng-PP
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 14:08:16 +0000
X-Inumbo-ID: 775199c8-3c57-11ea-baae-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 775199c8-3c57-11ea-baae-12813bfff9fa;
 Tue, 21 Jan 2020 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579615695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wfWRuDf0o1/unno7ZA/++MhxfnLE6GnUMflcrIyiSsQ=;
 b=cq6/7b4kCpBu4jOZ2OhbShJCgPf73joEmjY2Ub95tyw0jAt96OY0qrG6
 E5EAeAYkGuNi+gudshoO/xmUXx246PsvrJOor3s5DaLnTUCu5T90PeZHw
 p/sMCR9JtkQiBPSV0QovBLw1GNR3YvcGFxMUyFwOg6WCqgpJzZVMUG6pg Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1uhUYbqJpt6SHj7t1xafetCk8ckj//YZQoeKxaqtp3vUOgPyQjjN3VtGkzTJHX9Z8eOwVcIK+g
 9Vtv3t/r7Epxdxspi05hFd7mbsB+w4d79vZcVaKFhsHhvRPcPe3UyKRRlWiTvLWoHBvcZy38uO
 jNdgHbM5FHfwTrpS1SFzKjOQTVtVakPaRxrXN3I5mjGCGeOH7qMdEw5uCBRh5qvR2zES1yIKK+
 olrK39Saj5m0O5SPuVLtreFMslGOemPzGRZlIRBfEzjkUb4ryQKQpVVA2UqeE+HvaTbmBocZiY
 sfM=
X-SBRS: 2.7
X-MesageID: 11574596
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11574596"
Date: Tue, 21 Jan 2020 14:08:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20200121140812.GG1288@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117105358.607910-1-anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 00/12] xen: Build system improvements
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KEFjdHVhbGx5IENDaW5nIGFsbCB0aGF0IGFyZSBDQ2VkIG9uIHBhdGNoZXMpCgpPbiBGcmksIEph
biAxNywgMjAyMCBhdCAxMDo1Mzo0NkFNICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBQ
YXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoKPiBodHRwczovL3hlbmJp
dHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmJ1
aWxkLXN5c3RlbS14ZW4tdjIKPiAKPiBzZXJpZXMgaXMgYmFzZWQgb24gIltYRU4gUEFUQ0ggdjMg
MC82XSB4ZW46IEtjb25maWcgdXBkYXRlIHdpdGggZmV3IGV4dHJhIgo+IAo+IHYyOgo+IFJhdGhl
ciB0aGFuIHRha2luZyBLYnVpbGQgYW5kIG1ha2luZyBpdCB3b3JrIHdpdGggWGVuLCB0aGUgdjIg
dGFrZXMgdGhlIG9wcG9zaXRlCj4gYXBwcm9hY2ggb2Ygc2xvd2x5IHRyYW5zZm9ybWluZyBvdXIg
Y3VycmVudCBidWlsZCBzeXN0ZW0gaW50byBLYnVpbGQuIFRoYXQgaGF2ZQo+IHRoZSBhZHZhbnRh
Z2Ugb2Yga2VlcGluZyBhbGwgdGhlIGZlYXR1cmUgd2UgaGF2ZSBhbmQgbWFraW5nIHRoZSBwYXRj
aGVzIG11Y2gKPiBlYXNpZXIgdG8gcmV2aWV3LiBLY29uZmlnIHVwZGF0ZSBpcyBkb25lIGluIGFu
IG90aGVyIHBhdGNoIHNlcmllcy4KPiAKPiB2MToKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDE2MDkuaHRtbAo+IAo+IEhp
LAo+IAo+IEkgaGF2ZSB3b3JrIHRvd2FyZCBidWlsZGluZyBYZW4gKHRoZSBoeXBlcnZpc29yKSB3
aXRoIExpbnV4J3MgYnVpbGQgc3lzdGVtLAo+IEtidWlsZC4KPiAKPiBUaGUgbWFpbiByZWFzb24g
Zm9yIHRoYXQgaXMgdG8gYmUgYWJsZSB0byBoYXZlIG91dC1vZi10cmVlIGJ1aWxkLiBJdCdzIGFu
bm95aW5nCj4gd2hlbiBhIGJ1aWxkIGZhaWwgYmVjYXVzZSBvZiB0aGUgcHZzaGltLiBPdGhlciBi
ZW5lZml0IGlzIGEgbXVjaCBmYXN0ZXIKPiByZWJ1aWxkLCBhbmQgYG1ha2UgY2xlYW5gIGRvZXNu
J3QgdGFrZSBhZ2VzLCBhbmQgYmV0dGVyIGRlcGVuZGVuY2llcyB0byBmaWd1cmUKPiBvdXQgd2hh
dCBuZWVkcyB0byBiZSByZWJ1aWxkLgo+IAo+IFNvLCB3ZSBhcmUgbm90IHRoZXJlIHlldCwgYnV0
IHRoZSBzZXJpZXMgYWxyZWFkeSBjb250YWluIHF1aXRlIGEgZmV3Cj4gaW1wcm92ZW1lbnQgYW5k
IGNsZWFudXAuIE1vcmUgcGF0Y2hlcyBhcmUgZ29pbmcgdG8gYmUgYWRkZWQgdG8gdGhlIHNlcmll
cy4KPiAKPiBYWFggS25vd24gaXNzdWUKPiAtIG1ha2UgZGlzdC10ZXN0cyBpcyBicm9rZW4uIEkn
bGwgZml4IHRoYXQgbGF0dGVyLgo+IC0gZWZpIGJ1aWxkIG1heWJlIGJyb2tlbiAoeGVuIGRvZXNu
J3QgYm9vdCBvbiBhbGJhbmEgd2hpY2ggbG9va3MgbGlrZSB0byBiZSBvbmUKPiAgIG9mIHRoZSB1
ZWZpIGhvc3QpCgpXaXRoIHRoZSBuZXcgcGF0Y2gsIGFuZCBib3RoIHNxdWFzaCEgb2YgdjIuMSwg
dGhvc2UgdHdvIGlzc3VlcyBhcmUgZml4ZWQuCiAgICBNYWtlZmlsZTogRml4IGluc3RhbGwtdGVz
dHMKICAgIHNxdWFzaCEgeGVuL2J1aWxkOiBpbnRyb2R1Y2UgY2NmbGFncy15IGFuZCBDRkxBR1Nf
JEAKICAgIHNxdWFzaCEgeGVuL2J1aWxkOiBoYXZlIHRoZSByb290IE1ha2VmaWxlIGdlbmVyYXRl
cyB0aGUgQ0ZMQUdTCgpJJ3ZlIGNyZWF0ZWQgYSBuZXcgYnJhbmNoOgpodHRwczovL3hlbmJpdHMu
eGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmJ1aWxk
LXN5c3RlbS14ZW4tdjIuMQoKQW5kIGEgbGluayB0byBhbiBvc3N0ZXN0IHJ1bjoKaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NjMzOC8KCkNoZWVycywK
Ci0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
