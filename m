Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A418E048A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 15:09:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMtrB-00026K-Ju; Tue, 22 Oct 2019 13:05:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lkMi=YP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iMtrA-00026F-9x
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 13:05:48 +0000
X-Inumbo-ID: a98b7f94-f4cc-11e9-beca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a98b7f94-f4cc-11e9-beca-bc764e2007e4;
 Tue, 22 Oct 2019 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571749547;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=7snVrhm6fxVo5eGm7CXl2fC5Q+udvQFBDgogNDJF8Zw=;
 b=cU1qpaLqArxwRiXhIFePKT5e9PeL2az9Gbn7dsutI8JZxZDkd2lPF8Tg
 hm+hNMPBNDZL+OgcIVolCRcA+fpJq5V8yRZsu9OMA2wLgL8+9e0XMLrIS
 MQuMSzsqb4bmb/8xEcnxCmZXKGOd0EX9gplkGrNB/1uLQVdodWbxz1/yC U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ogyQgKfzsDm2prQdRST1sAVZS6ICY2/P5yJccAotx4dZfxEhsnxMRQEVRtOR8g+Wm3fnd8zvvS
 MbISfe4IwOKOjQffzZkeygqvzJvSZkI5WIFFoF+DeGuLBksmAhB9K+HCVkio1owUmMC8GhaUek
 vLMmJasWqxAaTLlOKOTMbPlcZV0vtR1Bm7PE74xvsWMFG4O+MdVxF87KBNt/iMZH1QVo7Mejoa
 CvKkkMGp8sdf6HndEswAwBP88QxYX+3vWRgGIMcubDXs5AAFCRnPOCIKBHlBBKePeQbLyF07qe
 cao=
X-SBRS: 2.7
X-MesageID: 7259304
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,327,1566878400"; 
   d="scan'208";a="7259304"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23982.65192.41629.360206@mariner.uk.xensource.com>
Date: Tue, 22 Oct 2019 14:05:44 +0100
To: <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-143010-mainreport@xen.org>
References: <osstest-143010-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] laxton0 PDU port issue blocked/broken/fail/pass
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDE0MzAxMDogcmVn
cmVzc2lvbnMgLSB0cm91YmxlOiBibG9ja2VkL2Jyb2tlbi9mYWlsL3Bhc3MiKToKPiBmbGlnaHQg
MTQzMDEwIG9zc3Rlc3QgcmVhbCBbcmVhbF0KPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9q
ZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQzMDEwLwo+IAo+IFJlZ3Jlc3Npb25zIDotKAo+IAo+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+IGluY2x1ZGluZyB0
ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ICBidWlsZC1hcm02NC14c20gICAgICAgICAg
ICAgICAgIDxqb2Igc3RhdHVzPiAgICAgICAgICAgICAgICAgYnJva2VuCj4gIGJ1aWxkLWFybTY0
LXhzbSAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpICAgICAgICBicm9rZW4gUkVHUi4g
dnMuIDE0MjIxOAoKICAyMDE5LTEwLTIxIDE4OjAzOjU3IFogcG93ZXI6IHNldHRpbmcgMCAodXNp
bmcgUERVKSBmb3IgbGF4dG9uMAogIC4uLgogIDIwMTktMTAtMjEgMTg6MDQ6MjggWiBwb3dlcjog
c2V0dGluZyAxICh1c2luZyBQRFUpIGZvciBsYXh0b24wIAoKQnV0IGluIHRoZSBzZXJpYWwgbG9n
CgogIE9jdCAyMSAxODowMjo0NS41MDQxOTMKICBJTklUOiBJZCAiVDAiIHJlc3Bhd25pbmcgdG9v
IGZhc3Q6IGRpc2FibGVkIGZvciA1IG1pbnV0ZXMKICBPY3QgMjEgMTg6MDk6MjYuODEwODkyIE9j
dCAyMSAxODoxMDoyMS4xNDI3MjkgPGNsaWVudCAweDU1ODU3ZDc1NDEwMCBjb25uZWN0ZWQgLSBu
b3cgMSBjbGllbnRzPgogIChYRU4pICoqKiBTZXJpYWwgaW5wdXQgdG8gWGVuICh0eXBlICdDVFJM
LXgnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1dCkKClRoaXMgc2VlbXMgdG8gaGF2ZSBiZWVu
IHRyYW5zaWVudDoKICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L3Jlc3VsdHMvaG9zdC9sYXh0b24wLmh0bWwKCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
