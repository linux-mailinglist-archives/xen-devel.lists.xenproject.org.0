Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A877B1709F3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:43:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73UJ-0006GR-O9; Wed, 26 Feb 2020 20:40:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73UI-0006GM-0K
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:40:58 +0000
X-Inumbo-ID: 4a39c80a-58d8-11ea-aba8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a39c80a-58d8-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 20:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582749658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3A6C+slDIap39lOyKntHKT/oQQ4U44jo7cKANNasDaU=;
 b=hBp3eyK5JDGqe7ibsJ7tg6WZ/aFmjkVuv7Fx2PEZMw+YnSFmWp6/TJPh
 EIhtUFhZDLP3VtRyysEbCgryc1jHM6v3xuvrCaAsa451AD+U9UGDxCs3I
 jK0CLoUnoNcYNzkKJp6/tdZ8j76TdWDKcctraB5Po7SH5YqwH0UBEg0Zv E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: acbNF4Ih7r8GpkE1RZd8C6ijdRokbYvYOcT1rG1bnjL/4luuE88b6SoMvFAreaZdGGkXfOOcUn
 gblpcZyoIoug4lqr8A4xm12KnbDm9OvZBWPC3eUTs3Tbp3utGj5IhEEAeoxOPKHALbqh/4Im29
 7UENCrvPVnAn1aYllBhErFLQCAI7F3S604NOlgt0xEk8iGOj9CZ26W4JsYAnboPxM9hZ01EyRa
 93QKjOtIHCI7F62s5R/pnceidfbczrXUiZFX0rxhiBeSZYyJ2vm2ZD5e5P1RwXRK4QooY4gQfC
 FM0=
X-SBRS: 2.7
X-MesageID: 13072842
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13072842"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:21 +0000
Message-ID: <20200226202221.6555-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 10/10] x86/hvm: Do not enable MPX by default
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWVtb3J5IFByb3RlY3Rpb24gZVh0ZW5zaW9uIHN1cHBvcnQgaGFzIGJlZW4gZHJvcHBlZCBmcm9t
IEdDQyBhbmQgTGludXgsIGFuZAp3aWxsIGJlIGRyb3BwZWQgZnJvbSBmdXR1cmUgSW50ZWwgQ1BV
cy4KCldpdGggYWxsIG90aGVyIGRlZmF1bHQvbWF4IHBpZWNlcyBpbiBwbGFjZSwgbW92ZSBNUFgg
ZnJvbSBkZWZhdWx0IHRvIG1heC4KVGhpcyBtZWFucyB0aGF0IFZNcyB3b24ndCBiZSBvZmZlcmVk
IGl0IGJ5IGRlZmF1bHQsIGJ1dCBjYW4gZXhwbGljaXRseSBvcHQKaW50byB1c2luZyBpdCB2aWEg
Y3B1aWQ9Imhvc3QsbXB4PTEiIGluIHRoZWlyIHZtLmNmZyBmaWxlLgoKVGhlIGRpZmZlcmVuY2Ug
YXMgdmlzaWJsZSB0byB0aGUgZ3Vlc3QgaXM6CgogIGRpZmYgLS1naXQgYS9kZWZhdWx0IGIvbXB4
CiAgaW5kZXggMGU5MTc2NWQ2Yi4uYzhjMzNjZDU4NCAxMDA2NDQKICAtLS0gYS9kZWZhdWx0CiAg
KysrIGIvbXB4CiAgQEAgLTEzLDE1ICsxMywxNyBAQCBOYXRpdmUgY3B1aWQ6CiAgICAgMDAwMDAw
MDQ6MDAwMDAwMDQgLT4gMDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDAKICAgICAw
MDAwMDAwNTpmZmZmZmZmZiAtPiAwMDAwMDAwMDowMDAwMDAwMDowMDAwMDAwMDowMDAwMDAwMAog
ICAgIDAwMDAwMDA2OmZmZmZmZmZmIC0+IDAwMDAwMDAwOjAwMDAwMDAwOjAwMDAwMDAwOjAwMDAw
MDAwCiAgLSAgMDAwMDAwMDc6MDAwMDAwMDAgLT4gMDAwMDAwMDA6MDA5YzJmYmI6MDAwMDAwMDA6
OWMwMDA0MDAKICArICAwMDAwMDAwNzowMDAwMDAwMCAtPiAwMDAwMDAwMDowMDljNmZiYjowMDAw
MDAwMDo5YzAwMDQwMAogICAgIDAwMDAwMDA4OmZmZmZmZmZmIC0+IDAwMDAwMDAwOjAwMDAwMDAw
OjAwMDAwMDAwOjAwMDAwMDAwCiAgICAgMDAwMDAwMDk6ZmZmZmZmZmYgLT4gMDAwMDAwMDA6MDAw
MDAwMDA6MDAwMDAwMDA6MDAwMDAwMDAKICAgICAwMDAwMDAwYTpmZmZmZmZmZiAtPiAwMDAwMDAw
MDowMDAwMDAwMDowMDAwMDAwMDowMDAwMDAwMAogICAgIDAwMDAwMDBiOmZmZmZmZmZmIC0+IDAw
MDAwMDAwOjAwMDAwMDAwOjAwMDAwMDAwOjAwMDAwMDAwCiAgICAgMDAwMDAwMGM6ZmZmZmZmZmYg
LT4gMDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDAKICAtICAwMDAwMDAwZDowMDAw
MDAwMCAtPiAwMDAwMDAwNzowMDAwMDI0MDowMDAwMDM0MDowMDAwMDAwMAogICsgIDAwMDAwMDBk
OjAwMDAwMDAwIC0+IDAwMDAwMDFmOjAwMDAwMjQwOjAwMDAwNDQwOjAwMDAwMDAwCiAgICAgMDAw
MDAwMGQ6MDAwMDAwMDEgLT4gMDAwMDAwMGY6MDAwMDAyNDA6MDAwMDAwMDA6MDAwMDAwMDAKICAg
ICAwMDAwMDAwZDowMDAwMDAwMiAtPiAwMDAwMDEwMDowMDAwMDI0MDowMDAwMDAwMDowMDAwMDAw
MAogICsgIDAwMDAwMDBkOjAwMDAwMDAzIC0+IDAwMDAwMDQwOjAwMDAwM2MwOjAwMDAwMDAwOjAw
MDAwMDAwCiAgKyAgMDAwMDAwMGQ6MDAwMDAwMDQgLT4gMDAwMDAwNDA6MDAwMDA0MDA6MDAwMDAw
MDA6MDAwMDAwMDAKICAgICA0MDAwMDAwMDpmZmZmZmZmZiAtPiA0MDAwMDAwNTo1NjZlNjU1ODo2
NTU4NGQ0ZDo0ZDRkNTY2ZQogICAgIDQwMDAwMDAxOmZmZmZmZmZmIC0+IDAwMDQwMDBlOjAwMDAw
MDAwOjAwMDAwMDAwOjAwMDAwMDAwCiAgICAgNDAwMDAwMDI6ZmZmZmZmZmYgLT4gMDAwMDAwMDE6
NDAwMDAwMDA6MDAwMDAwMDA6MDAwMDAwMDAKClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNo
QHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKWFhYIC0gT25lIG1vdmluZyBwaWVjZSAodGhlIG1pZ3Jh
dGlvbiBzZXJpZXMpIGlzIHN0aWxsIGluIHJldmlldyBvbiB4ZW4tZGV2ZWwuCkkgd29uJ3QgY29t
bWl0IHRoaXMgY2hhbmdlIHVudGlsIHRoYXQgaXMgc29ydGVkLCBhbmQgSSBjYW4gZG91YmxlIGNo
ZWNrIHRoZQpiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBmb3IgVk1zIGZyb20gcHJldmlvdXMgdmVy
c2lvbnMgb2YgWGVuLgoKVGhlIG1haW4gcHVycG9zZSBvZiBwb3N0aW5nIHRoaXMgcGF0Y2ggbm93
IGlzIHRvIGlsbHVzdHJhdGUgdGhlIGVmZmVjdHMgb2YgdGhlCnByZXZpb3VzIHBhdGNoZXMgaW4g
dGhlIHNlcmllcy4KLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNl
dC5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQu
aCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgKaW5kZXggZDc5
YTUzYmVmZS4uODFlNGMyOTUwZiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
eDg2L2NwdWZlYXR1cmVzZXQuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1
ZmVhdHVyZXNldC5oCkBAIC0yMDcsNyArMjA3LDcgQEAgWEVOX0NQVUZFQVRVUkUoSU5WUENJRCwg
ICAgICAgNSozMisxMCkgLypIICBJbnZhbGlkYXRlIFByb2Nlc3MgQ29udGV4dCBJRCAqLwogWEVO
X0NQVUZFQVRVUkUoUlRNLCAgICAgICAgICAgNSozMisxMSkgLypBICBSZXN0cmljdGVkIFRyYW5z
YWN0aW9uYWwgTWVtb3J5ICovCiBYRU5fQ1BVRkVBVFVSRShQUU0sICAgICAgICAgICA1KjMyKzEy
KSAvKiAgIFBsYXRmb3JtIFFvUyBNb25pdG9yaW5nICovCiBYRU5fQ1BVRkVBVFVSRShOT19GUFVf
U0VMLCAgICA1KjMyKzEzKSAvKiEgIEZQVSBDUy9EUyBzdG9yZWQgYXMgemVybyAqLwotWEVOX0NQ
VUZFQVRVUkUoTVBYLCAgICAgICAgICAgNSozMisxNCkgLypTICBNZW1vcnkgUHJvdGVjdGlvbiBF
eHRlbnNpb25zICovCitYRU5fQ1BVRkVBVFVSRShNUFgsICAgICAgICAgICA1KjMyKzE0KSAvKnMg
IE1lbW9yeSBQcm90ZWN0aW9uIEV4dGVuc2lvbnMgKi8KIFhFTl9DUFVGRUFUVVJFKFBRRSwgICAg
ICAgICAgIDUqMzIrMTUpIC8qICAgUGxhdGZvcm0gUW9TIEVuZm9yY2VtZW50ICovCiBYRU5fQ1BV
RkVBVFVSRShBVlg1MTJGLCAgICAgICA1KjMyKzE2KSAvKkEgIEFWWC01MTIgRm91bmRhdGlvbiBJ
bnN0cnVjdGlvbnMgKi8KIFhFTl9DUFVGRUFUVVJFKEFWWDUxMkRRLCAgICAgIDUqMzIrMTcpIC8q
QSAgQVZYLTUxMiBEb3VibGV3b3JkICYgUXVhZHdvcmQgSW5zdHJzICovCi0tIAoyLjExLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
