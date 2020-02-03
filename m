Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2FA15086B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:31:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycio-0004IZ-MP; Mon, 03 Feb 2020 14:29:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iycin-0004IQ-55
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:29:05 +0000
X-Inumbo-ID: 86ec497a-4691-11ea-8e66-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86ec497a-4691-11ea-8e66-12813bfff9fa;
 Mon, 03 Feb 2020 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580740143;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qTYsVXO4s935KeOp4t8bB1J++r0od/2chIv6gdKxhW0=;
 b=O480vJBjHGBep8GbfAodDxEBKSmw7mr7JFFhvKGdxA7lAKF35vbNVJFc
 akUrR+UlH3uIX0MSTQGvfLphxkEcMeg7DdqyGLk/B6vqrj8TWQMvHAOSm
 JWWBKaHE427pD+n/KPYZGGHw1uhO+z4O9kUpsFZ4/YrU3pPtIYM3OwqA0 o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yMCe454sV3g4WcXnnd8ZPRPEpSY+2ED4GR5hb8x5BnC6+NV6wkpQVjHEbQKVI8bYIAqZe2GSZH
 qRJi9imZbiOH+/DpsRQUfprqrsfU8ZlzQ7bkPrifmJ/PIe2jsSX9HuQeHmxXq6+OdCuyV/+Bq8
 6ITw0vcuINkovyGxCgzD4rV3p6zs5Vd+dV7aRy1CC366/CvEshO6ztA1B9UnYPAqruNE+S635T
 o0JUw25l3ItHOd1WkYlVLJu5GoliuPBSHgfwxbl+F9NjisM+ZbnoEhBlEyGhDEVZBjEcCuTUo7
 WRw=
X-SBRS: 2.7
X-MesageID: 12284347
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12284347"
Date: Mon, 3 Feb 2020 14:29:00 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203142900.GF2306@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200121135916.1140483-1-anthony.perard@citrix.com>
 <69ed5eba-e6ea-5b1e-20cc-d8f5a00d2cf3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69ed5eba-e6ea-5b1e-20cc-d8f5a00d2cf3@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2.1 13/12] Makefile: Fix install-tests
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTI6Mzc6MTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDEuMjAyMCAxNDo1OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBUaGUg
dG9wLWxldmVsIG1ha2VmaWxlIG1ha2UgdXNlcyBvZiBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBk
ZXRhaWwgb2YKPiA+IHRoZSB4ZW4gYnVpbGQgc3lzdGVtLiBBdm9pZCB0aGF0IGJ5IGNyZWF0aW5n
IGEgbmV3IHRhcmdldAo+ID4gImluc3RhbGwtdGVzdHMiIGluIHhlbi9NYWtlZmlsZSwgYW5kIGJ5
IGZpeGluZyB0aGUgdG9wLWxldmVsIE1ha2VmaWxlCj4gPiB0byBub3QgY2FsbCB4ZW4vUnVsZXMu
bWsgYW55bW9yZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gCj4gVGhpcyBpbiBwcmluY2lwbGUgY291bGQgaGF2ZSBt
eSBSLWIsIGJ1dCAuLi4KPiAKPiA+IC0tLSBhL3hlbi9NYWtlZmlsZQo+ID4gKysrIGIveGVuL01h
a2VmaWxlCj4gPiBAQCAtOTAsNiArOTAsOSBAQCBfaW5zdGFsbDogJChUQVJHRVQpJChDT05GSUdf
WEVOX0lOU1RBTExfU1VGRklYKQo+ID4gIC5QSE9OWTogX3Rlc3RzCj4gPiAgX3Rlc3RzOgo+ID4g
IAkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVsZXMubWsgLUMgdGVzdCB0ZXN0cwo+ID4gKy5QSE9O
WTogaW5zdGFsbC10ZXN0cwo+ID4gK2luc3RhbGwtdGVzdHM6Cj4gPiArCSQoTUFLRSkgLWYgJChC
QVNFRElSKS9SdWxlcy5tayAtQyB0ZXN0IGluc3RhbGwKPiAKPiAuLi4gSSdtIGlycml0YXRlZCBi
eSB0aGUgcGF0Y2ggY29udGV4dCBoZXJlOiBQYXRjaCA4IGNoYW5nZWQKPiBfdGVzdHMgdG8gdGVz
dHMsIGFuZCBieSB0aGUgbnVtYmVyaW5nIHRoaXMgcGF0Y2ggZ29lcyBvbiB0b3AKPiBvZiBwYXRj
aCA4LiBDb3VsZCB5b3UgY2xhcmlmeSB3aGF0J3MgZ29pbmcgb24gaGVyZSwgcGxlYXNlPwoKSSB3
YW50ZWQgdG8gaGF2ZSB0aGlzIHBhdGNoIGVhcmxpZXIgaW4gdGhlIHNlcmllcy4gSSBjb3VsZCBw
cm9iYWJseSBoYXZlCnB1dCBpbiB0aGUgc3ViamVjdCBzb21ldGhpbmcgbGlrZSAiW1BBVENIIDEu
NS8xMl0iIHRvIG1ha2UgdGhpcyBjbGVhcmVyLgoKQ2hlZXJzLAoKLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
