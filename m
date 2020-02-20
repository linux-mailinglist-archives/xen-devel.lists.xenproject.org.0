Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205F1661A3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 16:59:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oCq-0004Mf-8L; Thu, 20 Feb 2020 15:57:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOW3=4I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4oCo-0004Ma-87
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 15:57:38 +0000
X-Inumbo-ID: b6c4cdc8-53f9-11ea-bc8e-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6c4cdc8-53f9-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 15:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582214257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TXFKXEz7S/Ct+hoaYeV0PHrxWBtDJCAo4vcrrQDIi88=;
 b=G5CTHQtrdu7qGqnLCf2oTL6ePRgYXpqoGXFrzWc2laBXsJrvOjLPgneC
 DVwA6mhQDO9NPaKgKBsFoQ92fH2+nMbAW/mfZ8JDz1KJ5tTOC41LX8ojG
 nqthfASsITSY9I1V0ovHNRpEboNDxFlrYa+0GF5l6eTiW+BHZYyrjXaP5 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: thi0tjUlAZqUDW4SXH7OgIenp61O09+M2W8Vc95pyi0q/ugpUPTfGOK+MfZQOLF2rzh/AtdX6T
 VPbFYpHOZSRDNUZtBM9iPUF3it6ToorkmC1/eGHtsvHoGPFZ+iWzWBptcXzw+0rdHXc6sJ1kvb
 p6orltrT2J9GE4t9kpbdwuBDeIg3C1d2uKSy9wuPI0/9dBKoEJ+VvCSzB8T2O+Igej4BtlGdsH
 MmKG1CchqWqnhE+Y9CDSyPXNkgIHeyicNj/dcLVd6ihjWNnanAtEiMMO/ji92AuKpS48zIxMln
 moQ=
X-SBRS: 2.7
X-MesageID: 12939885
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="12939885"
Date: Thu, 20 Feb 2020 16:57:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200220155729.GP4679@Air-de-Roger>
References: <20200220120231.86907-1-roger.pau@citrix.com>
 <ecf1c47c-4cbb-c7c4-7ccf-d3620a1992b3@suse.com>
 <20200220141117.GK4679@Air-de-Roger>
 <0a3a762e-9a0d-7395-d3c4-aca07c366979@suse.com>
 <20200220151734.GM4679@Air-de-Roger>
 <9f82c3cb-862d-87bd-7a01-4812be98eedd@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f82c3cb-862d-87bd-7a01-4812be98eedd@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDQ6NTA6MjJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDIuMjAyMCAxNjoxNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFRodSwgRmViIDIwLCAyMDIwIGF0IDA0OjAyOjU1UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDIwLjAyLjIwMjAgMTU6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDAxOjQ4OjU0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gQW5vdGhlciBvcHRpb24gaXMgdG8gdXNlIHRoZSByZWN1cnNlX2NwdSBmaWVs
ZCBvZiB0aGUKPiA+Pj4+IGFzc29jaWF0ZWQgc3BpbiBsb2NrOiBUaGUgZmllbGQgaXMgdXNlZCBm
b3IgcmVjdXJzaXZlIGxvY2tzCj4gPj4+PiBvbmx5LCBhbmQgaGVuY2UgdGhlIG9ubHkgY29uZmxp
Y3Qgd291bGQgYmUgd2l0aAo+ID4+Pj4gX3NwaW5faXNfbG9ja2VkKCksIHdoaWNoIHdlIGRvbid0
IChhbmQgaW4gdGhlIGZ1dHVyZSB0aGVuCj4gPj4+PiBhbHNvIHNob3VsZG4ndCkgdXNlIG9uIHRo
aXMgbG9jay4KPiA+Pj4KPiA+Pj4gSSBsb29rZWQgaW50byB0aGF0IGFsc28sIGJ1dCB0aGluZ3Mg
Z2V0IG1vcmUgY29tcGxpY2F0ZWQgQUZBSUNULCBhcyBpdCdzCj4gPj4+IG5vdCBwb3NzaWJsZSB0
byBhdG9taWNhbGx5IGZldGNoIHRoZSBzdGF0ZSBvZiB0aGUgbG9jayBhbmQgdGhlIG93bmVyCj4g
Pj4+IENQVSBhdCB0aGUgc2FtZSB0aW1lLiBOZWl0aGVyIHlvdSBjb3VsZCBzZXQgdGhlIExPQ0tF
RCBiaXQgYW5kIHRoZSBDUFUKPiA+Pj4gYXQgdGhlIHNhbWUgdGltZS4KPiA+Pgo+ID4+IFRoZXJl
J3Mgbm8gbmVlZCB0byBhdG9taWNhbGx5IGZldGNoIGJvdGggYWZhaWNzOiBUaGUgZmllbGQgaXMK
PiA+PiB2YWxpZCBvbmx5IGlmIHRoZSBMT0NLRUQgYml0IGlzIHNldC4gQW5kIHdoZW4gcmVhZGlu
ZyB0aGUKPiA+PiBmaWVsZCB5b3Ugb25seSBjYXJlIGFib3V0IHRoZSB2YWx1ZSBiZWluZyBlcXVh
bCB0bwo+ID4+IHNtcF9wcm9jZXNzb3JfaWQoKSwgaS5lLiBpdCBpcyBmaW5lIHRvIHNldCBMT0NL
RUQgYmVmb3JlCj4gPj4gdXBkYXRpbmcgdGhlIENQVSBmaWVsZCBvbiBsb2NrLCBhbmQgdG8gcmVz
ZXQgdGhlIENQVSBmaWVsZCB0bwo+ID4+IFNQSU5MT0NLX05PX0NQVSAob3Igd2hhdGV2ZXIgaXQn
cyBjYWxsZWQpIGJlZm9yZSBjbGVhcmluZwo+ID4+IExPQ0tFRC4KPiA+IAo+ID4gWWVzIHRoYXQg
d291bGQgcmVxdWlyZSB0aGUgdXNhZ2Ugb2YgYSBzZW50aW5lbCB2YWx1ZSBhcyAwIHdvdWxkIGJl
IGEKPiA+IHZhbGlkIHByb2Nlc3NvciBJRC4KPiA+IAo+ID4gSSB3b3VsZCB0cnkgdG8gcmVmcmFp
biBmcm9tIChhYnUpc2luZyBpbnRlcm5hbCBzcGlubG9jayBmaWVsZHMsIGFzIEkKPiA+IHRoaW5r
IHdlIGNhbiBzb2x2ZSB0aGlzIGp1c3QgYnkgdXNpbmcgdGhlIGNudHMgZmllbGQgb24gdGhlIGN1
cnJlbnQKPiA+IHJ3bG9jayBpbXBsZW1lbnRhdGlvbi4KPiA+IAo+ID4gV2hhdCBpc3N1ZSBkbyB5
b3UgaGF2ZSBpbiBtaW5kIHRoYXQgd291bGQgcHJldmVudCBzdG9yaW5nIHRoZSBDUFUKPiA+IHdy
aXRlIGxvY2tlZCBpbiB0aGUgY250cyBmaWVsZD8KPiAKPiBUaGUgcmVkdWN0aW9uIG9mIHRoZSBu
dW1iZXIgb2YgYml0cyB1c2VkIGZvciBvdGhlciBwdXJwb3Nlcy4KCkkgdGhpbmsgaXQgc2hvdWxk
IGJlIGZpbmUgZm9yIG5vdywgYXMgd2Ugd291bGQgc3VwcG9ydCBzeXN0ZW1zIHdpdGggdXAKdG8g
MTYzODQgQ1BVIElEcywgYW5kIDY1NTM2IGNvbmN1cnJlbnQgcmVhZCBsb2NrZXJzLCB3aGljaCBt
ZWFuIGVhY2gKQ1BVIGNvdWxkIHRha2UgdGhlIGxvY2sgdXAgdG8gNCB0aW1lcyByZWN1cnNpdmVs
eS4gTm90ZSB0aGF0CnN1cHBvcnRpbmcgMTYzODQgQ1BVcyBpcyBzdGlsbCB2ZXJ5LCB2ZXJ5IGZh
ciBvZmYgdGhlIHJhZGFyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
