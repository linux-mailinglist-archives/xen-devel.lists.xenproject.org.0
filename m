Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE3E70A6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:43:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3Nd-0006lt-Pv; Mon, 28 Oct 2019 11:40:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP3Nb-0006lo-Mt
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:40:11 +0000
X-Inumbo-ID: b26f7cf0-f977-11e9-94f4-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b26f7cf0-f977-11e9-94f4-12813bfff9fa;
 Mon, 28 Oct 2019 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572262811;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=/nroATV0HcUw4iUl2U/p3Kibu5oxBW7uYR9NoB1Yki4=;
 b=edm3GwMpt54QRWeU4Egdh9WS8dpmk5DI1Gy9hZYNLLyfXAujNqicriiE
 hEFuUJQByM2h/ixaYcTGoSSaevpuqjif7YgXKM9hvjDG8DU2fDNF+S6Sv
 CrntH9TNfD7XVaITBhbPngJ8TJy9xuqxUNsdRlhveNpRnc8OmqylPaUKd A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Z4n00ZlwpH5Ra8wZomp8nAhGa0LgjIeWxMQP2HkdKer3MRrwm5DwCELuaTkK/lRHGSzJ0uFBPI
 i7Vf73U+D+IhlLLJCQ4KN+05JpiZKh+pfQiXuJZXWvOS1cPrm7XS1L9AYsg362JBy+gkUCzWju
 lv4ZR5cb5ixFH7xEqZAF972mib9ukTWvT9UsZOLVXouJepdVxn4Co3nAeUnaj7n6kpHcqbiWsP
 WtproQoHRCp7yPtG0mC6wggDl4SR2A/MOYeKkMaIvGbDFZ24fPKthuYeW5xMoo2JhZwlmm1XJj
 urs=
X-SBRS: 2.7
X-MesageID: 7594949
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7594949"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23990.54167.244241.273624@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 11:40:07 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191025170505.2834957-3-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <20191025170505.2834957-3-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 2/4] libxl: Introduce
 libxl__ev_qmplock
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzLiAgSSBhcHByb3ZlIG9mIHRoZSBnZW5lcmFsIGFwcHJvYWNoLCBhbmQgdGhlIGNvZGUg
cmV1c2UsIGJ1dCBJCmhhdmUgc29tZSBxdWFsbXMgYWJvdXQgdGhlIHJlc3VsdGluZyBsYXllcmlu
ZyBzdHJ1Y3R1cmUgYW5kIHRoZQpib2lsZXJwbGF0ZSB3cmFwcGVycy4gIEkgaGF2ZSBzb21lIHN1
Z2dlc3Rpb25zIGZvciBob3cgdGhpcyBtaWdodCBsb29rCmJldHRlci4KCkFudGhvbnkgUEVSQVJE
IHdyaXRlcyAoIltSRkMgWEVOIFBBVENIIGZvci00LjEzIDIvNF0gbGlieGw6IEludHJvZHVjZSBs
aWJ4bF9fZXZfcW1wbG9jayIpOgo+IFRoaXMgbG9jayB3aWxsIGJlIHVzZWQgdG8gcHJldmVudCBj
b25jdXJyZW50IGFjY2VzcyB0aGUgUUVNVSdzIFFNUAo+IHNvY2tldC4gSXQgaXMgYmFzZWQgb24g
bGlieGxfX2V2X2RldmxvY2sgaW1wbGVtZW50YXRpb24gYW5kIGhhdmUgdGhlCj4gc2FtZSBwcm9w
ZXJ0aWVzLgouLi4KPiArdm9pZCBsaWJ4bF9fZXZfcW1wbG9ja19pbml0KGxpYnhsX19ldl9xbXBs
b2NrICpsb2NrKQo+ICt7Cj4gKyAgICBsaWJ4bF9fZXZfZGV2bG9ja19pbml0KGxvY2spOwo+ICt9
Cj4gKwo+ICt2b2lkIGxpYnhsX19ldl9xbXBsb2NrX2xvY2sobGlieGxfX2VnYyAqZWdjLCBsaWJ4
bF9fZXZfcW1wbG9jayAqbG9jaykKPiArewo+ICsgICAgZXZfbG9ja19sb2NrKGVnYywgbG9jaywg
InFtcC1zb2NrZXQtbG9jayIpOwo+ICt9CgpUaGlzIHByb2R1Y2VzIGEgbG90IG9mIHJhdGhlciBw
b2ludGxlc3MgZnVuY3Rpb25zLiAgQWxzbyB0aGUgbGF5ZXJpbmcKaXMgYW5vbWFsb3VzOiBvbmUg
b2YgdGhlc2UgbG9ja3MgaXMgcHJpbWFyeSBhbmQgbW9zdCBvZiB0aGUgY2FsbHMgZm9yCnRoZSBv
dGhlciBhcmUgaW1wbGVtZW50ZWQgaW4gdGVybXMgb2YgdGhlIG90aGVyLgoKT25lIHBvc3NpYmxl
IGFsdGVybmF0aXZlIGFwcHJvYWNoIHdvdWxkIGJlIGFzIGZvbGxvd3M6CgoxLiBSZW5hbWUgZGV2
bG9jayB0byBzbG93bG9jayBldmVyeXdoZXJlLiAgRXhwZWN0IGV2ZXJ5b25lIGluY2x1ZGluZwog
ICBxbXAgdG8gY2FsbCBsaWJ4bF9fZXZfc2xvd2xvY2tfKi4KCjIuIFBlcmhhcHMsIHB1dCBjb25z
dCBjaGFyICp1c2VyZGF0YV91c2VyaWQgaW4gdGhlIGxvY2sgc3RydWN0dXJlLgogICBIYXZlIGl0
IHNldCBieSBsaWJ4bF9fZXZfc2xvd2xvY2tfaW5pdCByYXRoZXIgdGhhbiBieSBfbG9jay4gIChU
aGlzCiAgIGNlbnRyYWxpc2VzIHRoaW5ncyBhIGJpdCBhbmQgbWF5IHJlZHVjZSBkdXBsaWNhdGlv
biBvciBpbXByb3ZlCiAgIGVycm9yIG1lc3NhZ2VzIG9yIHNvbWV0aGluZy4pCgozLiBQZXJoYXBz
IHdyYXAgdXAgbGlieGxfX2V2X3Nsb3dsb2NrX2luaXQgd2l0aCB0d28gZnVuY3Rpb25zCiAgIFts
aWJ4bF9fZXZfXWRldmxvY2tfaW5pdCBhbmQgbGlieGxfX2V2X3FtcGxvY2tfaW5pdCwgYW5kIHJl
bmFtZQogICBsaWJ4bF9fZXZfc2xvd2xvY2tfaW5pdCB0byBsaWJ4bF9fZXZfc2xvd2xvY2tfaW5p
dF9pbnRlcm5hbC4KClRoaXMgYXZvaWRzIGhhdmluZyB0byBwcm92aWRlIHRyaXZpYWwgd3JhcHBl
cnMgZm9yIGFsbCB0aGUgZnVuY3Rpb25zLgppZiB5b3UgZG8gYWxsIG9mIHRoaXMgaW5jbHVkaW5n
ICgzKSB0aGVuIHRoZSBBUEkgaXMgc2xpZ2h0bHkgYW5vbWFsb3VzCmluIHRoYXQgdGhlcmUgYXJl
IHNldmVyYWwgZGlzdGluY3QgaW5pdCBmdW5jdGlvbnMgYnV0IG9ubHkgb25lIHNldCBvZgpvcGVy
YXRpb24gZnVuY3Rpb25zIGJ1dCB0aGlzIHNlZW1zIE9LIHRvIG1lLgoKV2hhdCBkbyB5b3UgdGhp
bmsgPwoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
