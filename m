Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21363158D7F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 12:24:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1TZR-0000mL-O1; Tue, 11 Feb 2020 11:19:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/+1e=37=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j1TZP-0000mG-S2
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 11:19:11 +0000
X-Inumbo-ID: 531c1ae6-4cc0-11ea-ab50-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 531c1ae6-4cc0-11ea-ab50-bc764e2007e4;
 Tue, 11 Feb 2020 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581419951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=92/9c55tM2zcayhhzkto4pa7k8maxrF4TT2A+jTaOrk=;
 b=ZNzP1tLgX1QfRS/z0kJ4rAD70oqwwP0lRJZG6T/bq6P8PS6dN0GuJ7Op
 FxK7xxAw1YMDb8xkLFa/LB7adN50KAjfpmU45c59HH25j9YkGGtdOVlnJ
 tt8dIXubsrHuNhwuFP5Sbc5oZesqKEbFRG49AWYamZhqGjudeJKht9pi4 g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KkODYaIRsxr6uiaanMxK+Wecx+QRBAx7Og6dIoTxsrj4FtjcPXONXPs4X2S6B4lxdpAXbZ3gbq
 dwkWyHskXAyC1fC0GBnP4qz475TYkNBZXlgUxQohakdB9DN514E71jyqbZWiRwVBNkSZEVgLxd
 RE0rXJq4aAqB1AMFz/VFi+aPUJpeNvJo64hcuBFRAbZhh/62rZw5RJU1GzstkJdH4ELsOa3kFx
 7ttIZFuysCISCOky6OorQvsBptaSqcWub6M3IVlpdqEjGlcXHpS8KT40MfCT26pocUNUoapEqy
 1c8=
X-SBRS: 2.7
X-MesageID: 12266971
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12266971"
Date: Tue, 11 Feb 2020 11:19:02 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200211111902.GE85066@perard.uk.xensource.com>
References: <20200120115053.1010739-1-anthony.perard@citrix.com>
 <20200120115217.GF1288@perard.uk.xensource.com>
 <20200127123021.gqxdbe2vv4tylf5l@debian>
 <20200127123623.GL1288@perard.uk.xensource.com>
 <20200127144040.bqgrvcppq3xyq7cv@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127144040.bqgrvcppq3xyq7cv@debian>
Subject: Re: [Xen-devel] [XEN PATCH 0/3] Default to python3
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDI6NDA6NDBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEphbiAyNywgMjAyMCBhdCAxMjozNjoyM1BNICswMDAwLCBBbnRob255IFBFUkFS
RCB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0IDEyOjMwOjIxUE0gKzAwMDAsIFdl
aSBMaXUgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0IDExOjUyOjE3QU0gKzAw
MDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgSmFuIDIwLCAyMDIwIGF0
IDExOjUwOjUwQU0gKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+ID4gUGF0Y2gg
c2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4gPiA+ID4gPiBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJy
LnB5dGhvbjMtZGVmYXVsdC12MQo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gSSB0aGluayBpdCdzIHRpbWUgZm9yIFhlbiB0byBidWlsZCB3aXRoIHB5dGhvbjMg
YnkgZGVmYXVsdC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIG1haW4gcmVhc29uIGZvciB0aGF0
IGlzIHRoYXQgUUVNVSB1cHN0cmVhbSBkb24ndCBidWlsZCB3aXRoIHB5dGhvbiAyLngKPiA+ID4g
PiA+IGFueW1vcmUsIGFuZCB0aGUgcHl0aG9uIGJpbmFyeSBzZWxlY3RlZCBieSBYZW4gYnVpbGQg
c3lzdGVtIGlzIHRoZSBvbmUgdXNlZAo+ID4gPiA+ID4gd2hlbiBidWlsZGluZyBxZW11LXhlbi4g
U28gbm93IG9zc3Rlc3QgZmFpbGVkIHRvIGJ1aWxkIFFFTVUgdXBzdHJlYW0uCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IEFsc28sIHB5dGhvbjIgaXMgRU9MLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGWUks
IHRoZSBoeXBlcnZpc29yIGJ1aWxkIHN5c3RlbSBhbHJlYWR5IHNlbGVjdCBweXRob24zIGJ5IGRl
ZmF1bHQsIHRoaXMgY2hhbmdlCj4gPiA+ID4gPiB0aGUgdG9vbHMgc2lkZS4KPiA+ID4gPiAKPiA+
ID4gPiBJIGZvcmdvdCB0byBzYXkgdGhhdCB0aGVyZSdzIGEgb3NzdGVzdCBwYXRjaCBhcyB3ZWxs
Ogo+ID4gPiA+IFtPU1NURVNUIFBBVENIXSB0cy14ZW4tYnVpbGQtcHJlcDogSW5zdGFsbCBweXRo
b24zLWRldgo+ID4gPiAKPiA+ID4gQUlVSSBJIGRvbid0IG5lZWQgdG8gd2FpdCBmb3IgdGhhdCBw
YXRjaCB0byBiZSBhcHBsaWVkIGJlZm9yZSBhcHBseWluZwo+ID4gPiB0aGlzIHNlcmllcy4gTGV0
IG1lIGtub3cgaWYgSSdtIHdyb25nLgo+ID4gCj4gPiBJdCBqdXN0IGdvaW5nIHRvIHByZXZlbnQg
YSBwdXNoIDotKS4gQWxsIGJ1aWxkIG9mIHN0YWdpbmcgd2lsbCBmYWlsLiBTbywKPiA+IHRoZSBv
c3N0ZXN0IHBhdGNoIGlzIG5lZWRlZCBiZWZvcmUgYXBwbHlpbmcgdGhlIHBhdGNoIDMvMy4KPiAK
PiBBY2suIEkgd2lsbCBwdXNoIHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBmaXJzdC4KCm9zc3Rlc3Qg
c2hvdWxkIGJlIHJlYWR5LCBjb3VsZCB5b3UgcHVzaCB0aGF0IGxhc3QgcGF0Y2g/CgpUaGFua3Ms
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
