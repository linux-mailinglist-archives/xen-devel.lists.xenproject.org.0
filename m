Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB4874FA7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:36:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdtC-0007kN-Rl; Thu, 25 Jul 2019 13:34:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqdtC-0007kG-21
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:34:34 +0000
X-Inumbo-ID: ef549808-aee0-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef549808-aee0-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 13:34:32 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: StTFkWixBFKB3djBpF6W9Wz/vTkzeIhBHvsP6huM0+dqlmHYUTlSVbFrgmzISQRzSJ6E6Szrqs
 FD2Uc3bayw5T8zgD29SlIbrSnyxfg+w7GGCWAb0CAUwvW96r7C5zKRGtKnDSTTdF0dB7NWRqH2
 qWyZLaYFlLS4rdxLD2gn7WKJPwDF8JIeDY+ee97VtD3vVqOIA2ULvUr7s/OgwsyuZU6MzX6M2X
 tCK4cRjzpB7bBCVRfPJLtW1oT9nrWBXHg8oNjmI7LRLtXwNF6bDqyCMy4Ti+fmq9dJpE1fijvm
 2ZY=
X-SBRS: 2.7
X-MesageID: 3420251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3420251"
Date: Thu, 25 Jul 2019 15:34:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190725133421.t2petgaoxrra7ks7@Air-de-Roger>
References: <20190723154851.77627-1-roger.pau@citrix.com>
 <20190723154851.77627-3-roger.pau@citrix.com>
 <5017c875-a59d-e7d1-c8fc-325b4208d15e@suse.com>
 <cade48e9-5346-b325-e06a-ee4adf2c48f0@citrix.com>
 <cb952c0d-4111-2138-660e-c9dc0dd79c11@suse.com>
 <10856269-2698-7791-3b43-3e47af14cbe7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10856269-2698-7791-3b43-3e47af14cbe7@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/iommu: avoid mapping the APIC
 configuration space for hwdom
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTI6NDc6MDFQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjQuMDcuMjAxOSAxMTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAyMy4w
Ny4yMDE5IDE4OjQ1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+IE9uIDIzLzA3LzIwMTkgMTc6
MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+PiBPbiAyMy4wNy4yMDE5IDE3OjQ4LCBSb2dlciBQ
YXUgTW9ubmUgd3JvdGU6Cj4gPj4+PiBDdXJyZW50IGNvZGUgb25seSBwcmV2ZW50cyBtYXBwaW5n
IHRoZSBpby1hcGljIHBhZ2UgaW50byB0aGUgZ3Vlc3QKPiA+Pj4+IHBoeXNpY2FsIG1lbW9yeSBt
YXAuIEV4cGFuZCB0aGUgcmFuZ2UgdG8gYmUgMHhGRUN4X3h4eHggYXMgZGVzY3JpYmVkCj4gPj4+
PiBpbiB0aGUgSW50ZWwgMyBTZXJpZXMgQ2hpcHNldCBEYXRhc2hlZXQgc2VjdGlvbiAzLjMuMSAi
QVBJQwo+ID4+Pj4gQ29uZmlndXJhdGlvbiBTcGFjZSAoRkVDMF8wMDAwaOKAk0ZFQ0ZfRkZGRmgp
Ii4KPiA+Pj4+Cj4gPj4+PiBBTUQgYWxzbyBsaXN0cyB0aGlzIGFkZHJlc3MgcmFuZ2UgaW4gdGhl
IEFNRCBTUjU2OTAgRGF0YWJvb2ssIHNlY3Rpb24KPiA+Pj4+IDIuNC4yICJOb24tU0IgSU9BUElD
IFN1cHBvcnQiLgo+ID4+PiBCdXQgdGhhdCdzIGNoaXBzZXQgc3BlY2lmaWMuIEkgZG9uJ3QgdGhp
bmsgd2UgY2FuIGJsaW5kbHkgYXNzdW1lCj4gPj4+IHRoaXMgcmFuZ2UuCj4gPj4KPiA+PiBUaGUg
SU8tQVBJQyBoYXMgYWx3YXlzIGxpdmVkIGluIHRoYXQgcmVnaW9uIHNpbmNlIGl0cyBpbnRyb2R1
Y3Rpb24sIGFuZAo+ID4+IHRoZSBsb2NhdGlvbiBpc24ndCBldmVuIGNvbmZpZ3VyYWJsZSBvbiBu
ZXdlciBjaGlwc2V0cyAoSWYgSSd2ZSByZWFkIHRoZQo+ID4+IFNBRCByb3V0aW5nIHJ1bGVzIGlu
IFNreWxha2UgY29ycmVjdGx5LsKgIEFsbCB0aGF0IGNhbiBiZSBjb25maWd1cmVkIGlzCj4gPj4g
bXVsdGlwbGUgSU8tQVBJQ3MgYmVpbmcgbWFwcGVkIGFkamFjZW50IHRvIGVhY2ggb3RoZXIuKQo+
ID4gCj4gPiBJJ20gcHJldHR5IHN1cmUgSSd2ZSBzZWVuIElPLUFQSUNzIG91dHNpZGUgdGhhdCBy
YW5nZS4KPiAKPiAgRnJvbSBteSBBTUQgRmFtMTUgc3lzdGVtOgo+IAo+IDw3PkFDUEk6IExvY2Fs
IEFQSUMgYWRkcmVzcyAweGZlZTAwMDAwCj4gPDY+SU9BUElDWzBdOiBhcGljX2lkIDAsIHZlcnNp
b24gMzMsIGFkZHJlc3MgMHhmZWMwMDAwMCwgR1NJIDAtMjMKPiA8Nj5JT0FQSUNbMV06IGFwaWNf
aWQgMSwgdmVyc2lvbiAzMywgYWRkcmVzcyAweGM4MDAwMDAwLCBHU0kgMjQtNTUKCkhtLCBJIGd1
ZXNzIHRoZSBvbmx5IG9wdGlvbiBpcyB0byB0aGVuIGJsYWNrbGlzdCB0aGUgcHJvcG9zZWQgcmFu
Z2UKcGx1cyBhbnkgb2YgdGhlIHBhZ2VzIG9mIHRoZSBpby1hcGljcyBvbiB0aGUgc3lzdGVtLiBJ
IGNhbiBzZW5kIGEgbmV3CnZlcnNpb24gd2l0aG91dCBkcm9wcGluZyB0aGUgY3VycmVudCBpby1h
cGljIGJsYWNrbGlzdGluZywgYnV0IHRoZW4KSSdtIG5vdCBzdXJlIHRoZXJlJ3MgbXVjaCB2YWx1
ZSBpbiBhZGRpbmcgdGhlIEZFQzBfMDAwMGjigJNGRUNGX0ZGRkZoCnJhbmdlLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
