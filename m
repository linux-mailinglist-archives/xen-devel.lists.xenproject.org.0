Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 396521805A9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:58:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBj6U-0001Gy-Qr; Tue, 10 Mar 2020 17:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GfWC=43=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jBj6T-0001Gt-4U
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:55:41 +0000
X-Inumbo-ID: 5a9171a6-62f8-11ea-a6c1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a9171a6-62f8-11ea-a6c1-bc764e2007e4;
 Tue, 10 Mar 2020 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583862940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=73wzhnLGHlaASvGZc5mbaJXzQ45NEu+N+uBdrtDZ/wQ=;
 b=SjC5KilOxMq+B31pCtTx3zJOvemMHsr77J3d3rLXBTyludPZ+lA3b70C
 PTrHJCAbSoczEoJ7I08rIpzwlsOWhqYViskU6hWBGtjYCtRJkFViea1n7
 VJpg4rTk20dOTYizSTtkl4dUFZJihQsQzsw2rYH8rdtMs2wtaIFt8MeZh Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8gz7zcOn2kyE3dnOrXzA+r56G75Khh+vvpUdvp4lS9xsG46WaXCNZdsMIu1EYaPnGRz2RDRMjh
 0f6kg30bKsjZt1WXdBqw9bwxHoIvauMO1blN0rHQQuv7aHrS6TJ3FHJabwJTTCxzlm5orCj+bB
 rNt5ZSv11UxSeBSr8VZuhXH8afXLa7jVd9IBfCZuI87F7tGtf44FT3GOFMX9q483XSstwOLE0I
 jwjcplrZGV+b3fJpMCW67cnHjp9rmzNVbmA4x1y4bEigaep07BmSX0WBUZYzx4BYFqjEB7V5Ni
 y0Y=
X-SBRS: 2.7
X-MesageID: 14345448
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="14345448"
Date: Tue, 10 Mar 2020 17:55:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200310175535.GG2152@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-15-anthony.perard@citrix.com>
 <20200227102238.GM24458@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227102238.GM24458@Air-de-Roger.citrite.net>
Subject: Re: [Xen-devel] [XEN PATCH v3 14/23] xen/build: use new $(c_flags)
 and $(a_flags) instead of $(CFLAGS)
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@gmail.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMTE6MjI6MzhBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEZlYiAyNiwgMjAyMCBhdCAxMTozMzo0NkFNICswMDAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBnbWFpbC5jb20+Cj4gPiAKPiA+IEluIGEgbGF0ZXIgcGF0Y2ggKCJ4ZW4vYnVpbGQ6IGhhdmUg
dGhlIHJvb3QgTWFrZWZpbGUgZ2VuZXJhdGVzIHRoZQo+ID4gQ0ZMQUdTKSwgd2Ugd2FudCB0byBn
ZW5lcmF0ZSB0aGUgQ0ZMQUdTIGluIHhlbi9NYWtlZmlsZSwgdGhlbiBleHBvcnQKPiA+IGl0IGFu
ZCBoYXZlIFJ1bGVzLm1rIHVzZSBhIENGTEFHUyBmcm9tIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMuIFRoYXQKPiA+IGNoYW5nZXMgdGhlIGZsYXZvciBvZiB0aGUgQ0ZMQUdTIGFuZCBmbGFncyBp
bnRlbmRlZCBmb3Igb25lIHRhcmdldAo+ID4gKGxpa2UgLURfX09CSkVDVF9GSUxFX18gYW5kIC1N
JSkgZ2V0cyBwcm9wYWdhdGVkIGFuZCBkdXBsaWNhdGVkLiBTbyB3ZQo+ID4gc3RhcnQgYnkgbW92
aW5nIHN1Y2ggZmxhZ3Mgb3V0IG9mICQoQ0ZMQUdTKSBhbmQgaW50byAkKGNfZmxhZ3MpIHdoaWNo
Cj4gPiBpcyB0byBiZSBtb2RpZmllZCBieSBvbmx5IFJ1bGVzLm1rLgo+ID4gCj4gPiBfX09CSkVD
VF9GSUxFX18gaXMgb25seSB1c2VkIGJ5IGFyY2gveDg2L21tLyouYyBmaWxlcywgc28gaGF2aW5n
IGl0IGluCj4gPiAkKGNfZmxhZ3MpIGlzIGVub3VnaCwgd2UgZG9uJ3QgbmVlZCBpdCBpbiAkKGFf
ZmxhZ3MpLgo+IAo+IFRoaXMgc2VlbSB0byBiZSB1c2VkIG9ubHkgYnkgc291cmNlIGZpbGVzIHRo
YXQgYXJlIGJ1aWxkIG11bHRpcGxlCj4gdGltZXMgd2l0aCBkaWZmZXJlbnQgcGFyYW1ldGVycyBp
biBvcmRlciB0byBnZW5lcmF0ZSBkaWZmZXJlbnQgb2JqZWN0Cj4gZmlsZXMuCj4gCj4gSXMgdGhl
cmUgYW55IGhhcm0gaW4gaGF2aW5nIGl0IGFsc28gaW4gdGhlIGFzc2VtYmxlciBmbGFncz8gKGlu
IGNhc2UKPiB3ZSByZXF1aXJlIHN1Y2ggdXNhZ2UgaW4gdGhlIGZ1dHVyZSkKCk5vdCByZWFsbHkg
YW55IGhhcm0sIG5vLCBidXQgdGhhdCBjYW4gYmUgZG9uZSBsYXRlciB3aGVuIG5lZWRlZCBJIHRo
aW5rLgoKPiBPciBtYXliZSB3ZSBjb3VsZCBldmVuIGxpbWl0IF9fT0JKRUNUX0ZJTEVfXyB0byBt
bS8gZmlsZXMgdGhhdCByZXF1aXJlCj4gaXQgb25seT8KClRoYXQncyBhIHBvc3NpYmlsaXR5LCB5
ZXMuIEknbGwgYmUgYWRkaW5nIGZsYWdzIHRvIHRob3NlIHNwZWNpZmljIGZpbGVzCmFueXdheSAo
R1VFU1RfUEFHSU5HX0xFVkVMUywgZG9uZSBpbiBhIGxhdGVyIHBhdGNoKSwgSSBjb3VsZCBhZGQK
X19PQkpFQ1RfRklMRV9fIHRvIHRoZSBsaXN0LgoKPiA+IAo+ID4gRm9yIGluY2x1ZGUvTWFrZWZp
bGUgYW5kIGFzLWluc24gd2UgY2FuIGtlZXAgdXNpbmcgQ0ZMQUdTLCBidXQgc2luY2UKPiA+IGl0
IGRvZXNuJ3QgaGF2ZSAtTSogZmxhZ3MgYW55bW9yZSB0aGVyZSBpcyBubyBuZWVkIHRvIGZpbHRl
ciB0aGVtIG91dC4KPiA+IAo+ID4gVGhlIFhFTl9CVUlMRF9FRkkgdGVzdHMgaW4gYXJjaC94ODYv
TWFrZWZpbGUgd2FzIGZpbHRlcmluZyBvdXQKPiA+IENGTEFHUy15LCBidXQgYWNjb3JkaW5nIHRv
IGRkNDAxNzdjMWJjOCAoIng4Ni02NC9FRkk6IGFkZCBDRkxBR1MgdG8KPiA+IGNoZWNrIGNvbXBp
bGUiKSwgaXQgd2FzIGRvbmUgdG8gZmlsdGVyIG91dCAtTUYuIENGTEFHUyBkb2Vzbid0Cj4gPiBo
YXZlIHRob3NlIGZsYWdzIGFueW1vcmUsIHNvIG5vIGZpbHRlcmluZyBpcyBuZWVkZWQuCj4gPiAK
PiA+IFRoaXMgaXMgaW5zcGlyZWQgYnkgdGhlIHdheSBLYnVpbGQgZ2VuZXJhdGVzIENGTEFHUyBm
b3IgZWFjaCB0YXJnZXRzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
