Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77711092FB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:41:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZIIw-0003jD-Hw; Mon, 25 Nov 2019 17:37:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tOGM=ZR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iZIIu-0003j7-GH
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:37:40 +0000
X-Inumbo-ID: 4673592f-0faa-11ea-a393-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4673592f-0faa-11ea-a393-12813bfff9fa;
 Mon, 25 Nov 2019 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574703459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p1dmU8jkjJSAMXZHfiTR8zL6fIVWsSYgqkB+6YqrJZY=;
 b=JK6cJGlEBYWKI0i0m1E3yL4ggd7UR0mUvUhVSUBJvxu01SzJX85b6itr
 h/TA1xc/d7ybsXqGh5lUqyN76FOVy6AvxWjb9ytA/o8fuM5qk8q2S2qEc
 pBP+mUtdfa/DFsuZQFD2Vj4Gh3b1f8reJoDrNv6C2MG6d8r6S/R/Rn4St Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vKADAnLGm1fiLvRIC6oVqo2nXeLWOQAwneldN3QSr0nNKz1zx7ZJY62uNar/peXdMQuiTFrYmT
 ZbuvxBFF9wCJUUXpWztMqYavddWYramXa2e1tcKY2GKEbCTkkJBoVC+I0Bc/oKEwitA7gFdhLy
 XJQ6FJ+LIA6qJFZjb/a0XlsOc70EFZ9NKr4iqvK5yGNgj1NFZp57KlBAG1Z6ggGCqngSJXqFUv
 GkIvqLOs7iHincUxujwJpw02yY/4WsicGH0+YBDmlXvwJSEzn/QsWdZJE0cej9h6wXDoBUunMS
 3kI=
X-SBRS: 2.7
X-MesageID: 8928326
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="8928326"
Date: Mon, 25 Nov 2019 17:37:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191125173736.GB1155@perard.uk.xensource.com>
References: <20191125145915.106589-1-anthony.perard@citrix.com>
 <166a5c3f-a096-9d35-670f-e7f50da847ef@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166a5c3f-a096-9d35-670f-e7f50da847ef@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2] x86/domctl: have
 XEN_DOMCTL_getpageframeinfo3 preemptible
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDU6MjI6MTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMTEuMjAxOSAxNTo1OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBUaGlz
IGh5cGVyY2FsbCBjYW4gdGFrZSBhIGxvbmcgdGltZSB0byBmaW5pc2ggYmVjYXVzZSBpdCBhdHRl
bXB0cyB0bwo+ID4gZ3JhYiB0aGUgYGhvc3RwMm0nIGxvY2sgdXAgdG8gMTAyNCB0aW1lcy4gVGhl
IGFjY3VtdWxhdGVkIHdhaXQgZm9yIHRoZQo+ID4gbG9jayBjYW4gdGFrZSBzZXZlcmFsIHNlY29u
ZHMuCj4gPiAKPiA+IFRoaXMgY2FuIGVhc2lseSBoYXBwZW4gd2l0aCBhIGd1ZXN0IHdpdGggMzIg
dmNwdXMgYW5kIHBsZW50eSBvZiBSQU0sCj4gPiBkdXJpbmcgbG9jYWxob3N0IG1pZ3JhdGlvbi4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Cj4gCj4gQXMgaW5kaWNhdGVkIG9uIHYxIGFscmVhZHksIHRoaXMgYmVpbmcgYSB3
b3JrYXJvdW5kIHJhdGhlciB0aGFuIGEgZml4Cj4gc2hvdWxkIGJlIHN0YXRlZCBjbGVhcmx5IGlu
IHRoZSBkZXNjcmlwdGlvbi4gRXNwZWNpYWxseSBpZiBtb3JlIHN1Y2gKPiBvcGVyYXRpb25zIHR1
cm4gdXAsIGl0J2xsIGJlY29tZSBpbmNyZWFzaW5nbHkgb2J2aW91cyB0aGF0IHRoZSByb290Cj4g
b2YgdGhlIHByb2JsZW0gd2lsbCBuZWVkIGRlYWxpbmcgd2l0aCByYXRoZXIgdGhhbiBwYXBlcmlu
ZyBvdmVyIHNvbWUKPiBvZiB0aGUgc3ltcHRvbXMuIFdpdGggdGhpcyB0YWtlbiBjYXJlIG9mIEkn
ZCBiZSAoc3RpbGwgaGVzaXRhbnRseSkKPiB3aWxsaW5nIHRvIGdpdmUgbXkgYWNrIGZvciB0aGlz
IGFzIGEgc2hvcnQgdGVybSAic29sdXRpb24iLgoKU29ycnkgdG8gaGF2ZSBsZWFkIHlvdSB0byBi
ZWxpZXZlIHRoYXQgdGhlIHBhdGNoIHdhcyAqdGhlKiBzb2x1dGlvbiB0bwp0aGUgcHJvYmxlbSBk
ZXNjcmliZWQuIEkgZG9uJ3QgdGhpbmsgdGhlIHBhdGNoIGl0c2VsZiBpcyBhIHdvcmthcm91bmQg
b3IKYSBmaXgsIGl0IGlzIHNpbXBseSBhbiBpbXByb3ZlbWVudCB0byB0aGUgaHlwZXJjYWxsLiBU
aGF0IGltcHJvdmVtZW50CmNvdWxkIGJlIHVzZWQgdG8gcmVtb3ZlIHRoZSBsaW1pdCBvbiBgbnVt
JyAoc29tZXRoaW5nIHRoYXQgSSd2ZSByZWFkIG9uCnhlbi1kZXZlbCBhcyBhIHBvc3NpYmxlIGlt
cHJvdmVtZW50KS4KCldvdWxkIGl0IGJlIGVub3VnaCB0byBhZGQgdGhpcyBmb2xsb3dpbmcgcGFy
YWdyYXBoIHRvIHRoZSBjb21taXQgZGVzY3JpcHRpb24/CgogICAgV2hpbGUgdGhlIHBhdGNoIGRv
ZXNuJ3QgZml4IHRoZSBwcm9ibGVtIHdpdGggdGhlIGxvY2sgY29udGVudGlvbiBhbmQKICAgIHRo
ZSBmYWN0IHRoYXQgdGhlIGBob3N0cDJtJyBsb2NrIGlzIGN1cnJlbnRseSBnbG9iYWwgKGFuZCBu
b3Qgb24gYQogICAgc2luZ2xlIHBhZ2UpLCBpdCBpcyBzdGlsbCBhbiBpbXByb3ZlbWVudCB0byB0
aGUgaHlwZXJjYWxsLgoKCkkgZG9uJ3QgbGlrZSB0aGUgdGVybXMgIndvcmthcm91bmQiIG9yICJz
aG9ydCB0ZXJtIHNvbHV0aW9uIiBhcyBhCmRlc2NyaXB0aW9uIGZvciB0aGlzIHBhdGNoLiBCb3Ro
IGltcGxpZXMgdGhhdCB0aGUgcGF0Y2ggY291bGQgYmUKcmV2ZXJ0ZWQgb25jZSB0aGUgcm9vdCBp
c3N1ZSBpcyB0YWtpbmcgY2FyZSBvZi4KCkknbGwga2VlcCB3b3JraW5nIHRvIHRyeSB0byBpbXBy
b3ZlIHRoZSB1c2Ugb2YgdGhlIGhvc3RwMm0gbG9jaywgYXQKbGVhc3Qgd2l0aCB0aGF0IGh5cGVy
Y2FsbCwgYnV0IEkgZG9uJ3QgaGF2ZSBhIHNvbHV0aW9uIHlldCBhbmQgaXQgd291bGQKYmUgbmlj
ZSB0byBoYXZlIHRoaXMgcGF0Y2ggaW4gdGhlIHJlbGVhc2UuCgo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+
ID4gaW5kZXggYTAzZTgwZTU5ODRhLi4xYjY5ZWI3NWNiMjAgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaAo+ID4gQEAgLTE2Myw2ICsxNjMsMTAgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVu
X2RvbWN0bF9nZXRkb21haW5pbmZvX3QpOwo+ID4gICNkZWZpbmUgWEVOX0RPTUNUTF9QRklORk9f
TFRBQl9NQVNLICgweGZVPDwyOCkKPiA+ICAKPiA+ICAvKiBYRU5fRE9NQ1RMX2dldHBhZ2VmcmFt
ZWluZm8zICovCj4gPiArLyoKPiA+ICsgKiBCb3RoIHZhbHVlIGBudW0nIGFuZCBgYXJyYXknIGFy
ZSBtb2RpZmllZCBieSB0aGUgaHlwZXJjYWxsIHRvIGFsbG93Cj4gPiArICogcHJlZW1wdGlvbi4K
PiAKPiBzL2FyZS9tYXkgYmUvID8KCkkgZG9uJ3QgdGhpbmsgdGhlIGRpc3RpbmN0aW9uIGlzIG5l
Y2Vzc2FyeS4gSG93IHdvdWxkIHRoYXQgYmUgdXNlZnVsIHRvCmtub3cgdGhhdCBib3RoIHZhbHVl
cyBtYXkgbm90IGJlIG1vZGlmaWVkPyBJIHRob3VnaCB0aGUgZ29hbCBvZiB0aGUKYWRkZWQgZGVz
Y3JpcHRpb24gd2FzIHRvIHdhcm4gYWdhaW5zdCByZXVzaW5nIHRoZSB2YWx1ZXMgYWZ0ZXIgY2Fs
bGluZwp0aGUgaHlwZXJjYWxsLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
