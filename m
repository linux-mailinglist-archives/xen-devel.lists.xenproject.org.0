Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50069C3740
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:27:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJ4d-0000mB-AR; Tue, 01 Oct 2019 14:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFJ4b-0000m6-FL
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:24:17 +0000
X-Inumbo-ID: 250aa176-e457-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 250aa176-e457-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 14:24:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10977AFC3;
 Tue,  1 Oct 2019 14:24:13 +0000 (UTC)
To: Paul Durrant <pdurrant@gmail.com>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
 <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
 <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
 <0e45cdd1-7f52-0e31-e732-9351d498f13a@citrix.com>
 <c2dff4f9265543629288d6cd64a6ddce@AMSPEX02CL03.citrite.net>
 <ba2b9cc4-bd80-6049-d759-c0a9400c295f@citrix.com>
 <CACCGGhCqaxkYY90Nsvcg2yxjsRvdBXEN+cwPBhLVOdJKscS1pg@mail.gmail.com>
 <ead796d4-a531-7f23-04c8-a60c3aa142d6@citrix.com>
 <CACCGGhDGsc3izYWbHzM9cGN1S5w8kgTw6Ny9pRuCp8vudpdLSQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <742ce14b-d57a-4ad3-ce50-5d939ba89e15@suse.com>
Date: Tue, 1 Oct 2019 16:24:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACCGGhDGsc3izYWbHzM9cGN1S5w8kgTw6Ny9pRuCp8vudpdLSQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNToyOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZSBjaGFuZ2VzIGlu
IFhBUEkgYXJlIG5vdCB2YXN0OyB0aGUgbWFpbiBjb21wbGV4aXR5IGlzIGluIHRoZSBkZXZpY2UK
PiBlbXVsYXRvciAodG8gcHJvdmlkZSBpbmZvcm1hdGlvbiBkdXJpbmcgdGhlIGxpdmUgcGhhc2Ug
b2YgbWlncmF0aW9uKQo+IGJ1dCBJIHN0aWxsIGRvbid0IHNlZSB3aHkgQ2l0cml4J3MgY2hvaWNl
IG9mIGNsb3NlZCB2cy4gb3BlbiBzb3VyY2UKPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZW11bGF0
b3IgcmVhbGx5IGhhcyBhbnl0aGluZyB0byBkbyB3aXRoIHRoaXMuIEl0Cj4gaXMgc3RpbGwgbXkg
b3BpbmlvbiB0aGF0IFhlbidzIG9ubHkgdmFsaWQgcmVhc29uIGZvciByZWZ1c2luZyB0bwo+IGVu
YWJsZSBsb2dkaXJ0eSBmb3IgYSBkb21haW4gaXMgb25lIG9mIGhvc3Qgc2FmZXR5IGFuZCBJIHN0
aWxsIGhhdmVuJ3QKPiBoZWFyZCBhbiBhcmd1bWVudCBhcyB0byB3aHkgWGVuICppcyogcmlnaHQg
dG8gcmVmdXNlIGluIG90aGVyCj4gY2lyY3Vtc3RhbmNlcy4KCkxldCBtZSB0YWtlIGEgY29tcGxl
dGVseSBkaWZmZXJlbnQgZXhhbXBsZSBmb3IgY29tcGFyaXNvbjoKVGhlcmUncyBubyByaXNrIHRv
IHRoZSBob3N0IGluIGFzc2lnbmluZyB0aGUgc2FtZSwgc2F5LCBVU0IKY29udHJvbGxlciB0byB0
d28gZ3Vlc3RzLiBZZXQgWGVuIHJlZnVzZXMgdG8gZG8gc28sIGV2ZW4gaWYgdGhlCnRvb2wgc3Rh
Y2sgZGlkbid0IGFscmVhZHkgZmlsdGVyIHN1Y2ggYXR0ZW1wdHMsIGFuZCBldmVuIGlmIHRoZQph
ZG1pbiBtYXkga25vdyB0aGF0IHRoZSB0d28gZG9tYWlucyBhcmUgY29vcGVyYXRpbmcsIGFuZCBo
ZW5jZQp3b3VsZG4ndCBnZXQgaW4gdGhlIHdheSBvZiBvbmUgYW5vdGhlci4gKFRoZXJlIGFyZSwg
SSB0aGluaywKbWFueSBvdGhlciBzaW1pbGFyIGV4YW1wbGVzLikKClRoYXQgc2FpZCBJIGNhbiBj
ZXJ0YWlubHkgc2VlIHRoZSB2YWxpZGl0eSBvZiB5b3VyIGFuZCBBbmRyZXcncwphcmd1bWVudGF0
aW9uLiBJdCdzIGp1c3QgdGhhdCwgYXMgaW4gdmFyaW91cyBvdGhlciBjYXNlcywgSQpkb24ndCB0
aGluayB0aGF0J3MgdGhlIG9ubHkgcmVhc29uYWJsZSB3YXkgb2YgYXJyYW5naW5nIHRoaW5ncy4K
SGVuY2UgYXQgdGhlIHZlcnkgbGVhc3QgeW91ciBjaGFuZ2Ugd291bGQgaW1vIG5lZWQgdG8gY29t
ZSB3aXRoCmFuIGV4dGVuZGVkIGRlc2NyaXB0aW9uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
