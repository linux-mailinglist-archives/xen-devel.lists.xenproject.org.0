Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD1311A1C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBg8-0003qX-Gd; Thu, 02 May 2019 13:23:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMBg7-0003qS-GJ
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:23:11 +0000
X-Inumbo-ID: 6a94db22-6cdd-11e9-8356-83de8d4610ae
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a94db22-6cdd-11e9-8356-83de8d4610ae;
 Thu, 02 May 2019 13:23:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 07:23:03 -0600
Message-Id: <5CCAEF34020000780022B400@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 07:23:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
 <5CCAE08D020000780022B307@prv1-mh.provo.novell.com>
 <42621a15169c4a409efa29e3d2d7e06e@AMSPEX02CL03.citrite.net>
In-Reply-To: <42621a15169c4a409efa29e3d2d7e06e@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE1OjA3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAwMiBNYXkgMjAxOSAxMzoyMAo+PiAKPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRl
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPj4gQEAgLTIwNzIsNiArMjA3
Miw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0ZV9jcigKPj4gICAgICBIVk1UUkFDRV9MT05H
XzJEKENSX1dSSVRFLCByZWcsIFRSQ19QQVJfTE9ORyh2YWwpKTsKPj4gICAgICBzd2l0Y2ggKCBy
ZWcgKQo+PiAgICAgIHsKPj4gKyAgICAgICAgYm9vbCBub2ZsdXNoOwo+PiArCj4gCj4gV2h5IGlu
dHJvZHVjZSAnbm9mbHVzaCcgd2l0aCB0aGlzIHNjb3BlIHdoZW4gaXQgY291bGQgYmUgbGltaXRl
ZCB0byAnY2FzZSAKPiAzOicsIGFsdGhvdWdoLi4uCgpCZWNhdXNlIHRoaXMgd291bGQgZW50YWls
IGludHJvZHVjaW5nIGFub3RoZXIgc2V0IG9mIGJyYWNlcywgYW5kCkkgcHJldHR5IG11Y2ggZGlz
bGlrZSB0aGVzZSBjYXNlLWJsb2NrIGJyYWNlczogVGhleSBlaXRoZXIgZG9uJ3QKcHJvcGVybHkg
aW5kZW50IChhcyB3ZSBkbyBjb21tb25seSksIG9yIHRoZXkgbmVlZGxlc3NseSBpbmNyZWFzZQpp
bmRlbnRhdGlvbiBvZiB0aGUgZW5jbG9zZWQgYmxvY2suIEhlbmNlIG15IGdlbmVyYWwgcHJlZmVy
ZW5jZQpvZiBzd2l0Y2gtc2NvcGUgbG9jYWwgdmFyaWFibGVzLgoKPj4gQEAgLTIwODIsNyArMjA4
NCwxMCBAQCBzdGF0aWMgaW50IGh2bWVtdWxfd3JpdGVfY3IoCj4+ICAgICAgICAgIGJyZWFrOwo+
PiAKPj4gICAgICBjYXNlIDM6Cj4+IC0gICAgICAgIHJjID0gaHZtX3NldF9jcjModmFsLCB0cnVl
KTsKPj4gKyAgICAgICAgbm9mbHVzaCA9IGh2bV9wY2lkX2VuYWJsZWQoY3VycmVudCkgJiYgKHZh
bCAmIFg4Nl9DUjNfTk9GTFVTSCk7Cj4+ICsgICAgICAgIGlmICggbm9mbHVzaCApCj4+ICsgICAg
ICAgICAgICB2YWwgJj0gflg4Nl9DUjNfTk9GTFVTSDsKPiAKPiAuLi4gY2FuJ3QgeW91IGp1c3Qg
Y29kZSB0aGlzIGFzOgo+IAo+IGlmICggaHZtX3BjaWRfZW5hYmxlZChjdXJyZW50KSApCj4gICAg
IHZhbCAmPSB+WDg2X0NSM19OT0ZMVVNIOwo+IAo+ID8KCkJlY2F1c2Ugb2YgLi4uCgo+PiArICAg
ICAgICByYyA9IGh2bV9zZXRfY3IzKHZhbCwgbm9mbHVzaCwgdHJ1ZSk7CgouLi4gdGhpcyBmdXJ0
aGVyIHVzZSBvZiAibm9mbHVzaCIgKGFsb25nc2lkZSB0aGUgYWRqdXN0ZWQgInZhbCIpLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
