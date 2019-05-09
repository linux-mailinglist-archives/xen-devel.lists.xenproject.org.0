Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25818D6C
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 17:56:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlLR-0000Sv-4f; Thu, 09 May 2019 15:52:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cqZt=TJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hOlLP-0000Sq-0m
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 15:52:27 +0000
X-Inumbo-ID: 7079e325-7272-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7079e325-7272-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 15:52:25 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: vYrRlkr8rCvfo8p8EG74PgQflG7dfgtANn+6/mjadDy+UwiH2igyO1Fr9vQm84cazomBmjmzwx
 D3pSYJxSB6IfSC2gvY0IJzLNU1OB9tqobP4VaIvVNi9bbvc3ipLzqAjytchQGaP22e4V3bRjyN
 NLeYkyVkt0HAaWpLV49GqHq0IXLBYSUoM/fJW5TvPYQTCli5oUtqYcHkPK4mqGCnTFIVs6MEoC
 PdhbirSJdOEJap2j7px8W1LowvhhlAcAqzZriSVuP3/7vV07zqNGoqBdaiwNhk33tbgjlA71Og
 lR4=
X-SBRS: 2.7
X-MesageID: 260017
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,450,1549947600"; 
   d="scan'208";a="260017"
Date: Thu, 9 May 2019 17:52:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190509155209.tjo2wchlnbkodzij@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190509155621.20698a9f.olaf@aepfle.de>
 <20190509162956.23c4d6ab.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509162956.23c4d6ab.olaf@aepfle.de>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDQ6Mjk6NTZQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCA5IE1heSAyMDE5IDE1OjU2OjIxICswMjAwCj4gc2NocmllYiBPbGFmIEhl
cmluZyA8b2xhZkBhZXBmbGUuZGU+Ogo+IAo+ID4gQW0gRnJpLCAzIE1heSAyMDE5IDEzOjA0OjEx
ICswMjAwCj4gPiBzY2hyaWViIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PjoKPiA+IAo+ID4gPiBJIHRoaW5rIHRoZSBhYm92ZSBjYWxsIGlzIHdyb25nLCBsaWJ4bF9fbmVl
ZF94ZW5wdl9xZW11IGV4cGVjdHMgdG8gZ2V0Cj4gPiA+IHRoZSBkb21pZCBvZiB0aGUgdG9vbHN0
YWNrIGRvbWFpbiAoaWU6IHRoZSBkb21haW4gcnVubmluZyB0aGlzIGNvZGUpLAo+ID4gPiBub3Qg
dGhlIGRvbWFpbiBiZWluZyBjcmVhdGVkLiAgCj4gPiAKPiA+IFNvLCBob3cgZG8gSSBhY3R1YWxs
eSB0ZXN0IHN1Y2ggc2V0dXBzPyBJdCBzZWVtcyBhIGRyaXZlciBkb21haW4gaXMKPiA+IHJlcXVp
cmVkLiBBY2NvcmRpbmcgdG8geGwtZGlzay1jb25maWd1cmF0aW9uKDUpIEkgbWF5IG5lZWQgdG8g
c3BlY2lmeQo+ID4gYmFja2VuZD0kZG9tVS4gSXMgdGhlcmUgc29tZSBndWlkZSBob3cgdG8gY29u
ZmlndXJlIHN1Y2ggdGhpbmc/CgpIbSwgSSdtIGFmcmFpZCBJJ20gbm90IGFibGUgdG8gZmluZCBh
bnl0aGluZywgSSBjb3VsZCBzd2VhciBJJ3ZlCmFkZGVkIHNvbWV0aGluZyB0byB0aGUgd2lraSB3
aGVuIHRoaXMgd2FzIGltcGxlbWVudGVkLgoKQW55d2F5LCB5b3UgbmVlZCB0byBjcmVhdGUgYSBk
b21VIGFuZCBhZGQgZHJpdmVyX2RvbWFpbj0xIHRvIHRoZQpkb21haW4geGwuY2ZnLiBJbnNpZGUg
dGhpcyBkb21VIHlvdSBuZWVkIGB4bCBkZXZkYCBydW5uaW5nLCB0aGVyZSdzIGFuCmluaXQgc2Ny
aXB0IGZvciBpdC4gTm90ZSB5b3Ugd2lsbCBoYXZlIHRvIGluc3RhbGwgdGhlIFhlbiB0b29sc3Rh
Y2sKaW5zaWRlIHRoaXMgZG9tVS4gVGhhdCB3b3VsZCBiZSB0aGUgZG9tVSBzZXJ2aW5nIHRoZSBi
YWNrZW5kcy4KClRoZW4geW91IGNyZWF0ZSBhbm90aGVyIGRvbVUgdGhhdCB3b3VsZCBoYXZlIGEg
ZGlzayBsaW5lIHdpdGgKYmFja2VuZD08YmFja2VuZCBkb21VPiBhbmQgaGF2ZSB0aGUgZGlzayBp
bWFnZSBhdmFpbGFibGUgaW4gdGhlCmJhY2tlbmQgZG9tVS4KClRoYXQgc2hvdWxkIGJlIGVub3Vn
aCB0byBnZXQgaXQgd29ya2luZyBhcyBhIHRlc3QuCgo+IFdoaWxlIG15IHF1ZXN0aW9uIHN0aWxs
IHN0YW5kcywgSSB3b25kZXIgaWYgdGhlIHN0YXRlbWVudCByZWdhcmRpbmcKPiBsaWJ4bF9fbmVl
ZF94ZW5wdl9xZW11IGlzIGNvcnJlY3QuCgpIbSwgVEJIIEknbSBub3Qgc3VyZSBsaWJ4bF9fbmVl
ZF94ZW5wdl9xZW11IGlzIHN0aWxsIHVzZWQgYnkgZHJpdmVyCmRvbWFpbnMgKGRldmQpLiBBRkFJ
Q1QgdGhlIGRlY2lzaW9uIHdoZXRoZXIgdG8gdXNlIHFkaXNrIG9yIG5vdCBzaG91bGQKYmUgc2V0
IG9uIHRoZSBkaXNrIGNvbmZpZ3VyYXRpb24gbGluZSBtYW51YWxseSwgYW5kIHRoZW4gdGhlIGRy
aXZlcgpkb21haW4ganVzdCBsYXVuY2hlcyBhIHFlbXUgaW5zdGFuY2Ugd2hlbiByZXF1aXJlZCAo
aWU6IHdoZW4gdXNpbmcKcWRpc2spLgoKPiBBcmUgeW91IHNheWluZyB0aGUgY3VycmVudCB1c2Vy
cyBvZiBsaWJ4bF9fbmVlZF94ZW5wdl9xZW11IChsaWJ4bF9fZG1fY2hlY2tfc3RhcnQsCj4gc3Bh
d25fc3R1Yl9sYXVuY2hfZG0gYW5kIGRvbWNyZWF0ZV9sYXVuY2hfZG0pIGRvIG5vdCBvbmx5IHJ1
biBpbiBkb20wLCBidXQKPiBhbHNvIHNvbWV3aGVyZSBlbHNlPwoKbGlieGxfX3NwYXduX3FkaXNr
X2JhY2tlbmQgY2FuIGluZGVlZCBiZSBjYWxsZWQgZnJvbSBkcml2ZXIgZG9tYWlucwooIT0gZG9t
MCkuIFNlZSBhZGRfZGV2aWNlIHdoaWNoIGdldHMgY2FsbGVkIGJ5IGJhY2tlbmRfd2F0Y2hfY2Fs
bGJhY2sKZnJvbSB0aGUgZmxvdyBvZiBgeGwgZGV2ZGAuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
