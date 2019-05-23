Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B434E27993
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 11:44:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkEV-0000RH-F2; Thu, 23 May 2019 09:41:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWVI=TX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hTkET-0000R4-MH
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 09:41:53 +0000
X-Inumbo-ID: fd64c068-7d3e-11e9-89de-e35432bac094
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd64c068-7d3e-11e9-89de-e35432bac094;
 Thu, 23 May 2019 09:41:51 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: XOXDYCHA9Mba6G3vk0U1HOZKWZL+2GxqZAxlR9eE+cRK+fQv+23xfsQPZH5pp+R1NX+NDx0md0
 qwUrQ4Ih8FUNk1e1doPbUFPP4geO8xE1p0eTC8zI3/lFnbH2H3+CXbEGwmHzWp5C1PD1TMKiUa
 Ysrqu5cR+dck12YfFxwI3zdnbeuP0LHsAhSUEgSsFYRB35zOhqNHR9bz3PMp6E0KiG7Fh0vJ4U
 T9tQxzIeUfcZ38TjGolFtk3Q7M11248yW6xPXEierP40gKFB74N7YzoUWdHoPc9AA19IOo2rsl
 nws=
X-SBRS: 2.7
X-MesageID: 799789
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="799789"
Date: Thu, 23 May 2019 10:41:48 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190523094148.GB2126@perard.uk.xensource.com>
References: <20190522145140.12943-1-anthony.perard@citrix.com>
 <20190522195442.5bf116ff.olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522195442.5bf116ff.olaf@aepfle.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDc6NTQ6NDJQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gV2VkLCAyMiBNYXkgMjAxOSAxNTo1MTo0MCArMDEwMAo+IHNjaHJpZWIgQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ogo+IAo+ID4gQ2FuIHlvdSBnaXZl
IGl0IGEgdHJ5IHdpdGggb25lIG9mIHRoZSBhZmZlY3RlZCBxZW11PyAocWVtdS14ZW4tNC4xMCBv
cgo+ID4gcWVtdS14ZW4tNC4xMSkKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4gVW5mb3J0dW5h
dGVseSB0aGVyZSBpcyBubyBlYXN5IHdheSB0byB0cmlnZ2VyIHRoZSByYWNlLgo+IElzIHRoZSBj
aGFuZ2VkIGNvZGUgcGF0aCBhbHNvIGV4ZXJjaXNlZCBmb3IgUFYgZG9tVXM/CgpZZXMhIFRoZSBj
b2RlIHBhdGggaXMgZXhlY3V0ZWQgZXZlcnkgdGltZSBhIGRpc2sgaXMgYXR0YWNoZWQgdmlhIHRo
ZQpxZGlzayBiYWNrZW5kLiBTbyBhcyBsb25nIGFzIGd1ZXN0IGNhbiBhY2Nlc3MgdGhlIHB2IGRp
c2ssIHRoZW4gaXQncwpmaW5lIChmb3IgYm90aCBIVk0gYW5kIFBWIGRvbVVzLCBhbmQgUFZIKS4K
CkFub3RoZXIgd2F5IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBsb2NraW5nIGlzIGRpc2FibGUgaXMg
dG8gYXR0YWNoIGEgZGlzawp0byBhIHNlY29uZCBndWVzdCwgcWVtdSBzaG91bGQgbm90IGNvbXBs
YWluIGFueW1vcmUuIEkndmUgdGVzdGVkIGJvdGgKInJhdyIgZGlzayBhbmQgInFjb3cyIiBkaXNr
IGJ1dCBJJ20gbm90IHN1cmUgaWYgb3RoZXIga2luZCBvZiBkaXNrIG5lZWRzCnRvIGJlIHRlc3Rl
ZC4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
