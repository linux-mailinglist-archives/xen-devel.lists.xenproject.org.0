Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706E24BE7
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 11:43:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1Gu-0001C9-50; Tue, 21 May 2019 09:41:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hT1Gs-0001C4-KX
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 09:41:22 +0000
X-Inumbo-ID: 9729c2bf-7bac-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9729c2bf-7bac-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 09:41:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 21 May 2019 03:41:20 -0600
Message-Id: <5CE3C7BD0200007800230E3C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 21 May 2019 03:41:17 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <nmanthey@amazon.de>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
 <1552567811-5301-8-git-send-email-nmanthey@amazon.de>
 <5C9E51DE020000780022307B@prv1-mh.provo.novell.com>
 <a6454c05-48cf-f02e-e983-181859916931@amazon.de>
In-Reply-To: <a6454c05-48cf-f02e-e983-181859916931@amazon.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH L1TF v10 7/8] common/grant_table: block
 speculative out-of-bound accesses
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA1LjE5IGF0IDE2OjI3LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAzLzI5LzE5IDE4OjExLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTQuMDMuMTkgYXQg
MTM6NTAsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+Pj4gQEAgLTI0MTAsOSArMjQ0OCwx
MSBAQCBhY3F1aXJlX2dyYW50X2Zvcl9jb3B5KAo+Pj4gICAgICAgICAgUElOX0ZBSUwoZ3RfdW5s
b2NrX291dCwgR05UU1RfYmFkX2dudHJlZiwKPj4+ICAgICAgICAgICAgICAgICAgICJCYWQgZ3Jh
bnQgcmVmZXJlbmNlICUjeFxuIiwgZ3JlZik7Cj4+PiAgCj4+PiAtICAgIGFjdCA9IGFjdGl2ZV9l
bnRyeV9hY3F1aXJlKHJndCwgZ3JlZik7Cj4+PiArICAgIC8qIFRoaXMgY2FsbCBlbnN1cmVzIHRo
ZSBhYm92ZSBjaGVjayBjYW5ub3QgYmUgYnlwYXNzZWQgc3BlY3VsYXRpdmVseSAqLwo+Pj4gICAg
ICBzaGFoID0gc2hhcmVkX2VudHJ5X2hlYWRlcihyZ3QsIGdyZWYpOwo+Pj4gLSAgICBpZiAoIHJn
dC0+Z3RfdmVyc2lvbiA9PSAxICkKPj4+ICsgICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUo
cmd0LCBncmVmKTsKPj4+ICsKPj4+ICsgICAgaWYgKCBldmFsdWF0ZV9ub3NwZWMocmd0LT5ndF92
ZXJzaW9uID09IDEpICkKPj4+ICAgICAgewo+Pj4gICAgICAgICAgc2hhMiA9IE5VTEw7Cj4+PiAg
ICAgICAgICBzdGF0dXMgPSAmc2hhaC0+ZmxhZ3M7Cj4+IFdoYXQgYWJvdXQgdGhlIHNlY29uZCB2
ZXJzaW9uIGNoZWNrIGZ1cnRoZXIgZG93biBpbiB0aGlzIGZ1bmN0aW9uPwo+IFRoYXQgb25lIHNo
b3VsZCBiZSBmaW5lLCBhcyBpdCBleGlzdHMgdGhhdCBmdW5jdGlvbiBhZnRlcndhcmRzLCBhbmQK
PiByZXByZXNlbnRzIGFuIGFib3J0IHBhdGggdGhhdCBpcyB2YWxpZCBmb3IgYm90aCB2ZXJzaW9u
cy4KClRoYXQncyBub3Qgb2J2aW91cyBmcm9tIGxvb2tpbmcgYXQganVzdCB0aGUgaWYoKSBpbiBx
dWVzdGlvbi4gRm9yCmV4YW1wbGUsIGZpeHVwX3N0YXR1c19mb3JfY29weV9waW4oKSBnZXRzIGhh
bmRlZCAic3RhdHVzIiBhcwphbiBhcmd1bWVudCwgd2hpY2ggaXMgdmVyc2lvbiBkZXBlbmRlbnQu
IEl0IHNlZW1zIHF1aXRlIGxpa2VseQppbmRlZWQgdGhhdCBubyBjb2RlIGNoYW5nZXMgYXJlIGhl
cmUsIGJ1dCB0aGlzIGltbyBhZ2FpbiBuZWVkcwpkaXNjdXNzaW5nL2V4cGxhaW5pbmcgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLgoKPj4+IEBAIC0zODM4LDYgKzM4ODYsOSBAQCBzdGF0aWMgaW50IGdu
dHRhYl9nZXRfc3RhdHVzX2ZyYW1lX21mbihzdHJ1Y3QgZG9tYWluICpkLAo+Pj4gICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gICAgICB9Cj4+PiAgCj4+PiArICAgIC8qIE1ha2Ugc3Vy
ZSBpZHggaXMgYm91bmRlZCB3cnQgbnJfc3RhdHVzX2ZyYW1lcyAqLwo+Pj4gKyAgICBibG9ja19z
cGVjdWxhdGlvbigpOwo+Pj4gKwo+Pj4gICAgICAqbWZuID0gX21mbih2aXJ0X3RvX21mbihndC0+
c3RhdHVzW2lkeF0pKTsKPj4gV2h5IG5vdCBhcnJheV9hY2Nlc3Nfbm9zcGVjKCk/IEFuZCBob3cg
aXMgdGhpcyBkaWZmZXJlbnQgZnJvbQo+PiBnbnR0YWJfZ2V0X3NoYXJlZF9mcmFtZV9tZm4oKSwg
d2hpY2ggeW91IGRvbid0IGNoYW5nZT8KPiAKPiBUaGlzIGlkeCBhY2Nlc3MgaXMgdG8gYSB2ZXJz
aW9uIGRlcGVuZGVudCBzdHJ1Y3R1cmUsIGFuZCBoZW5jZQo+IGFycmF5X2luZGV4X25vc3BlYyBp
cyBub3QgZ29vZCBlbm91Z2ggdG8gY2F0Y2ggdGhlIHZlcnNpb24gZGlmZmVyZW5jZQo+IGNhc2Ug
YXMgd2VsbC4KCkJ1dCB0aGUgY29tbWVudCB0YWxrcyBhYm91dCB0aGUgYXJyYXkgYm91bmQgb25s
eS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
