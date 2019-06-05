Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55B35B53
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:34:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYU9a-0004ce-MW; Wed, 05 Jun 2019 11:32:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgCu=UE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYU9Y-0004cU-Vg
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:32:25 +0000
X-Inumbo-ID: 9613e009-8785-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9613e009-8785-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 11:32:23 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DDqL8zWhvXRVhvElaUho8g8KJNWbGMX9r3hYLAE/ocyp5Bm0aeBKh3MRzTuzN7fahyOXCe0uBo
 ZgfwAoYBQo7x3Zjy9tAjeOhfJXwfvATmrjk9TwbiScZdVlN6SIY2QAyrrthWmdFkbOBIB54KtX
 +hJoMZVkd6gNRuBvz0ABIdKAIWa98kU+9PDb6Hcj85Nq+yP+GaHUoOSx67+UYwvTMOq6NBR7v3
 9oQX0s/1cCikENf4/XPQz3DG/C0h2HiW3aDGefyxR+9bKjL267AXXcGZWXblkNvV030aouCuYw
 exU=
X-SBRS: 2.7
X-MesageID: 1349535
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1349535"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23799.43045.610265.697616@mariner.uk.xensource.com>
Date: Wed, 5 Jun 2019 12:31:49 +0100
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
In-Reply-To: <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>,
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
 <20190605111356.10429-2-ian.jackson@eu.citrix.com>
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] RFC: enable CONFIG_LIVEPATCH in
 all relevant arm64 builds [and 1 more messages]
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAyLzJdIFJGQzogZW5hYmxl
IENPTkZJR19MSVZFUEFUQ0ggaW4gYWxsIHJlbGV2YW50IGFybTY0IGJ1aWxkcyIpOgo+IE9uIDA1
LzA2LzIwMTkgMTI6MTMsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gU3dpdGNoaW5nIG9uIENPTkZJ
R19MSVZFUEFUQ0ggZm9yIHRoZSBhZmZlY3RlZCB0ZXN0cyB3aWxsLCBob3BlZnVsbHksCj4gPiBt
YWtlIHRoaXMgcHJvYmxlbSAiZ28gYXdheSIgYWdhaW4uICBUaGlzIGlzIGNsZWFybHkgYSBib2Rn
ZS4gIEJ1dCBpdAo+ID4gaXMgYmV0dGVyIHRoYW4gc2ltcGx5IGZvcmNlIHB1c2hpbmc6IGlmIHdl
IGNhbiBnZXQgaXQgdG8gYm9vdCwgd2Ugd2lsbAo+ID4gYmUgYWJsZSB0byBydW4gdGhlIG90aGVy
IHRlc3RzLgo+IAo+IEhvdyBhYm91dCBkaXNhYmxpbmcgdGhlIHRlc3Qgb24gcm9jaGVzdGVyPwoK
SSBjb3VsZCBpbnZlbnQgYSBuZXcgaG9zdGZsYWcKICB4ZW4tNC4xMS1hcm02NC1zZWVtcy10by1i
b290LW9rCmJ1dCB0aGF0IHNlZW1zIHJpZGljdWxvdXMuCgpBbmQsIHdlIHByZXN1bWFibHkgd2Fu
dCB0byBhY3R1YWxseSB0ZXN0IG90aGVyIHRoaW5ncyBvbiByb2NoZXN0ZXIhCgpKYW4gQmV1bGlj
aCB3cml0ZXMgKCJSZTogW09TU1RFU1QgUEFUQ0ggMi8yXSBSRkM6IGVuYWJsZSBDT05GSUdfTElW
RVBBVENIIGluIGFsbCByZWxldmFudCBhcm02NCBidWlsZHMiKToKPiBPbiAwNS4wNi4xOSBhdCAx
MzoxMywgPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+IHdyb3RlOgo+ID4gLS0tIGEvbWZpLWNv
bW1vbgo+ID4gKysrIGIvbWZpLWNvbW1vbgo+ID4gQEAgLTM3Myw3ICszNzMsOCBAQCBjcmVhdGVf
YnVpbGRfam9icyAoKSB7Cj4gPiAgICAgICAgICBmaQo+ID4gICAgICBmaQo+ID4gIAo+ID4gLSAg
ICBpZiBicmFuY2hfd2FudHNfbGl2ZXBhdGNoOyB0aGVuCj4gPiArICAgIGlmIGJyYW5jaF93YW50
c19saXZlcGF0Y2ggfHwKPiA+ICsgICAgICAgICAgWyAkYXJjaCA9IGFybTY0IC1hICIkeGVuYnJh
bmNoIiA9IHhlbi00LjExLXRlc3RpbmcgXTsgdGhlbgo+ID4gICAgICAgICBsaXZlcGF0Y2hfcnVu
dmFycz0nZW5hYmxlX2xpdmVwYXRjaD10cnVlJwo+ID4gICAgICBmaQo+IAo+IElzbid0IHRoaXMg
b3Zlcmx5IHJlc3RyaWN0aXZlLCBpLmUuIHdvdWxkbid0IHRoaXMgYmV0dGVyIGJlIGRvbmUgdW5p
Zm9ybWx5Cj4gZm9yIGFsbCBicmFuY2hlcz8KCk5vLiAgQmVjYXVzZSB0aGUgYnVnIGlzIGEgcmFu
ZG9tIGZhaWx1cmUsIEkgZG9uJ3Qgd2FudCB0byBwZXJtdXRlIGFsbAp0aGUgb3RoZXIgYnJhbmNo
ZXMgYW5kIG1heWJlIGNhdXNlIHRoZW0gdG8gZXhwZXJpZW5jZSBpdC4KCkkgc3RpbGwgdGhpbmsg
aXQgd291bGQgYmUgYmV0dGVyIHRvIGZpeCB0aGlzIGluIHRoZSBYZW4gY29kZS4KCldvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIG1ha2Ugd2hldGhlciB0byBkbyAid3JvbmcgdGhpbmcgQSIgKHdoaWNo
IGRvZXMKbm90IGJvb3Qgb24gcm9jaHN0ZXIpIG9yICJ3cm9uZyB0aGluZyBCIiAod2hpY2ggYm9v
dHMgb24gcm9jaGVzdGVyIGJ1dApub3Qgb24gc29tZSBvdGhlciB1bmtub3duIG1hY2hpbmUocykp
IGEgY29uZmlnIG9yIGJvb3QtdGltZSBvcHRpb24gPwoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
