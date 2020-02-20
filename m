Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555E4166392
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:57:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4p6P-0003OO-1X; Thu, 20 Feb 2020 16:55:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4p6N-0003OJ-TG
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:55:03 +0000
X-Inumbo-ID: bca846f4-5401-11ea-ade5-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bca846f4-5401-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582217703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0EqWSz5dvnJycyB6P0z58S6U4tG1G6uYiilmQIa8Ltk=;
 b=gd0NiryEApEImTqvj06jayu9ln7a7YU1GvkleSBVL2Ivkq+CXRke/RYd
 OzQHanD+J2knHuFqKfW4YSNSwWGZWru8BGmtJrPew3KQoDd05B1niR/EM
 netO4uaT1T3z1b11dCQFu4hXYOWGDBGlpdeaso3iEOtneo5DqWFTJrbYO 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cltJ+7AB40u4/KUCmgv10LNt/70CR6+YJF2xGhugMXGkcrgbWYzikE0iDctG1WxBXNX5rl6sYK
 d44ZnemPyItHO6BlnLaxpCW8/cuPFsRFXmgOCxXR3xrsR2zn8JfzKT/kTi8XKMfMBEMPanCrXp
 jPhOJ+b3iQPRPrLKi2y8GejKceha+BJpX/HgT6MVSibhflxdJq+8DzSGT/Fv6RdfSblMMibref
 bSR0sArzirfOUGTR1k/whdjwQuocO4PSUtQRpBft8ooPnGOTLfyyaeyLybj6DzGyNpfYfOMtAo
 v0o=
X-SBRS: 2.7
X-MesageID: 12750417
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,465,1574139600"; d="scan'208";a="12750417"
Date: Thu, 20 Feb 2020 17:54:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200220164942.GS4679@Air-de-Roger>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <0a3a762e-9a0d-7395-d3c4-aca07c366979@suse.com>
 <20200220151734.GM4679@Air-de-Roger>
 <9f82c3cb-862d-87bd-7a01-4812be98eedd@suse.com>
 <20200220155729.GP4679@Air-de-Roger>
 <01f6d0de-c36f-7506-f64a-48d8278df455@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01f6d0de-c36f-7506-f64a-48d8278df455@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] rwlock: allow recursive read locking when
 already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDU6MDA6MzdQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyMC4wMi4yMCAxNjo1NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDIwLCAyMDIwIGF0IDA0OjUwOjIyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4gPiBPbiAyMC4wMi4yMDIwIDE2OjE3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
PiA+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA0OjAyOjU1UE0gKzAxMDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+ID4gPiA+ID4gT24gMjAuMDIuMjAyMCAxNToxMSwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToKPiA+ID4gPiA+ID4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDE6NDg6NTRQTSArMDEw
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gPiA+ID4gQW5vdGhlciBvcHRpb24gaXMgdG8g
dXNlIHRoZSByZWN1cnNlX2NwdSBmaWVsZCBvZiB0aGUKPiA+ID4gPiA+ID4gPiBhc3NvY2lhdGVk
IHNwaW4gbG9jazogVGhlIGZpZWxkIGlzIHVzZWQgZm9yIHJlY3Vyc2l2ZSBsb2Nrcwo+ID4gPiA+
ID4gPiA+IG9ubHksIGFuZCBoZW5jZSB0aGUgb25seSBjb25mbGljdCB3b3VsZCBiZSB3aXRoCj4g
PiA+ID4gPiA+ID4gX3NwaW5faXNfbG9ja2VkKCksIHdoaWNoIHdlIGRvbid0IChhbmQgaW4gdGhl
IGZ1dHVyZSB0aGVuCj4gPiA+ID4gPiA+ID4gYWxzbyBzaG91bGRuJ3QpIHVzZSBvbiB0aGlzIGxv
Y2suCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIGxvb2tlZCBpbnRvIHRoYXQgYWxzbywgYnV0
IHRoaW5ncyBnZXQgbW9yZSBjb21wbGljYXRlZCBBRkFJQ1QsIGFzIGl0J3MKPiA+ID4gPiA+ID4g
bm90IHBvc3NpYmxlIHRvIGF0b21pY2FsbHkgZmV0Y2ggdGhlIHN0YXRlIG9mIHRoZSBsb2NrIGFu
ZCB0aGUgb3duZXIKPiA+ID4gPiA+ID4gQ1BVIGF0IHRoZSBzYW1lIHRpbWUuIE5laXRoZXIgeW91
IGNvdWxkIHNldCB0aGUgTE9DS0VEIGJpdCBhbmQgdGhlIENQVQo+ID4gPiA+ID4gPiBhdCB0aGUg
c2FtZSB0aW1lLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBUaGVyZSdzIG5vIG5lZWQgdG8gYXRvbWlj
YWxseSBmZXRjaCBib3RoIGFmYWljczogVGhlIGZpZWxkIGlzCj4gPiA+ID4gPiB2YWxpZCBvbmx5
IGlmIHRoZSBMT0NLRUQgYml0IGlzIHNldC4gQW5kIHdoZW4gcmVhZGluZyB0aGUKPiA+ID4gPiA+
IGZpZWxkIHlvdSBvbmx5IGNhcmUgYWJvdXQgdGhlIHZhbHVlIGJlaW5nIGVxdWFsIHRvCj4gPiA+
ID4gPiBzbXBfcHJvY2Vzc29yX2lkKCksIGkuZS4gaXQgaXMgZmluZSB0byBzZXQgTE9DS0VEIGJl
Zm9yZQo+ID4gPiA+ID4gdXBkYXRpbmcgdGhlIENQVSBmaWVsZCBvbiBsb2NrLCBhbmQgdG8gcmVz
ZXQgdGhlIENQVSBmaWVsZCB0bwo+ID4gPiA+ID4gU1BJTkxPQ0tfTk9fQ1BVIChvciB3aGF0ZXZl
ciBpdCdzIGNhbGxlZCkgYmVmb3JlIGNsZWFyaW5nCj4gPiA+ID4gPiBMT0NLRUQuCj4gPiA+ID4g
Cj4gPiA+ID4gWWVzIHRoYXQgd291bGQgcmVxdWlyZSB0aGUgdXNhZ2Ugb2YgYSBzZW50aW5lbCB2
YWx1ZSBhcyAwIHdvdWxkIGJlIGEKPiA+ID4gPiB2YWxpZCBwcm9jZXNzb3IgSUQuCj4gPiA+ID4g
Cj4gPiA+ID4gSSB3b3VsZCB0cnkgdG8gcmVmcmFpbiBmcm9tIChhYnUpc2luZyBpbnRlcm5hbCBz
cGlubG9jayBmaWVsZHMsIGFzIEkKPiA+ID4gPiB0aGluayB3ZSBjYW4gc29sdmUgdGhpcyBqdXN0
IGJ5IHVzaW5nIHRoZSBjbnRzIGZpZWxkIG9uIHRoZSBjdXJyZW50Cj4gPiA+ID4gcndsb2NrIGlt
cGxlbWVudGF0aW9uLgo+ID4gPiA+IAo+ID4gPiA+IFdoYXQgaXNzdWUgZG8geW91IGhhdmUgaW4g
bWluZCB0aGF0IHdvdWxkIHByZXZlbnQgc3RvcmluZyB0aGUgQ1BVCj4gPiA+ID4gd3JpdGUgbG9j
a2VkIGluIHRoZSBjbnRzIGZpZWxkPwo+ID4gPiAKPiA+ID4gVGhlIHJlZHVjdGlvbiBvZiB0aGUg
bnVtYmVyIG9mIGJpdHMgdXNlZCBmb3Igb3RoZXIgcHVycG9zZXMuCj4gPiAKPiA+IEkgdGhpbmsg
aXQgc2hvdWxkIGJlIGZpbmUgZm9yIG5vdywgYXMgd2Ugd291bGQgc3VwcG9ydCBzeXN0ZW1zIHdp
dGggdXAKPiA+IHRvIDE2Mzg0IENQVSBJRHMsIGFuZCA2NTUzNiBjb25jdXJyZW50IHJlYWQgbG9j
a2Vycywgd2hpY2ggbWVhbiBlYWNoCj4gPiBDUFUgY291bGQgdGFrZSB0aGUgbG9jayB1cCB0byA0
IHRpbWVzIHJlY3Vyc2l2ZWx5LiBOb3RlIHRoYXQKPiA+IHN1cHBvcnRpbmcgMTYzODQgQ1BVcyBp
cyBzdGlsbCB2ZXJ5LCB2ZXJ5IGZhciBvZmYgdGhlIHJhZGFyLgo+IAo+IEN1cnJlbnQgc3Bpbmxv
Y2sgaW1wbGVtZW50YXRpb24gbGltaXRzIE5SX0NQVVMgdG8gNDA5Ni4KClJpZ2h0LCBidXQgaGVy
ZSB3ZSBjYW4gdXNlIHVwIHRvIDE0IGJpdHMsIHNvIEkgdGhpbmsgaXQncyBiZXN0IHRvCmFzc2ln
biB0aGVtIG5vdyB0aGFuIGxlYXZlIHRoZW0gYXMgcGFkZGluZz8KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
