Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1318111D10C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 16:31:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifQNz-0006yY-Uo; Thu, 12 Dec 2019 15:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVwC=2C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ifQNy-0006yT-5v
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 15:28:14 +0000
X-Inumbo-ID: fdc9328c-1cf3-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdc9328c-1cf3-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576164485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AvgORIxOYpFKDQliLXZpKH57CcT6Jc8jG1mpwed1XFM=;
 b=dajOOG86SYPFPdYPX+lfzIFMxFEJ7SETyG4UHO1UZRywZt22Eehyhqk3
 Og/Vavw5W1XFx3O+lkGIBG51EDvdnJ0tj7oDf+PGIqf2epNiloDLMey+9
 dn54E+RPHAOzo1nAUavJ7B9YU94+e9YJEepV24MIFDJlq+8NyunRsoBoS M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I4h8En3BXKbrUkzf/pMTjpOcz5DugWSud/TOnaQG8/yjRnCs+felomVJF9tkitwa2GXPzHR5vs
 juOU9uZdTtTY+J1T0PdISZanhZfVnRDG6WKQXXfio6eF6NfaHcOy0lz7hc9hTCg32/iW8pCEly
 aIi+YclRWsAsq5mJTNHbovUsAH+cmEnTGHrN5iMjwReVgM1tnRi1j3ZMdk/bde3QgYutvaaC6d
 pzZI/zV5aPOwH0RmSwtnO9T7Yg0vER/2SmH7/s7vTBXZ/bXZlDIX6l9xKNoY7drB58boDKtBUV
 PQE=
X-SBRS: 2.7
X-MesageID: 9588030
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9588030"
Date: Thu, 12 Dec 2019 16:27:57 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191212152757.GF11756@Air-de-Roger>
References: <20191211181016.14366-1-sjpark@amazon.de>
 <20191211181016.14366-3-sjpark@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211181016.14366-3-sjpark@amazon.de>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v7 2/3] xen/blkback: Squeeze page pools if a
 memory pressure is detected
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
Cc: jgross@suse.com, axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDY6MTA6MTVQTSArMDAwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMg
Yi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYwo+IGluZGV4IGZkMWUxOWYxYTQ5
Zi4uOTg4MjNkMTUwOTA1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
YmxrYmFjay5jCj4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMKPiBA
QCAtMTQyLDYgKzE0MiwyMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcGVyc2lzdGVudF9nbnRfdGlt
ZW91dChzdHJ1Y3QgcGVyc2lzdGVudF9nbnQgKnBlcnNpc3RlbnRfZ250KQo+ICAJCUhaICogeGVu
X2Jsa2lmX3BncmFudF90aW1lb3V0KTsKPiAgfQo+ICAKPiArLyogT25jZSBhIG1lbW9yeSBwcmVz
c3VyZSBpcyBkZXRlY3RlZCwgc3F1ZWV6ZSBmcmVlIHBhZ2UgcG9vbHMgZm9yIGEgd2hpbGUuICov
Cj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgYnVmZmVyX3NxdWVlemVfZHVyYXRpb25fbXMgPSAxMDsK
PiArbW9kdWxlX3BhcmFtX25hbWVkKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAo+ICsJCWJ1
ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLCBpbnQsIDA2NDQpOwo+ICtNT0RVTEVfUEFSTV9ERVND
KGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAo+ICsiRHVyYXRpb24gaW4gbXMgdG8gc3F1ZWV6
ZSBwYWdlcyBidWZmZXIgd2hlbiBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZCIpOwo+ICsK
PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgYnVmZmVyX3NxdWVlemVfZW5kOwo+ICsKPiArdm9pZCB4
ZW5fYmxrYmtfcmVjbGFpbV9tZW1vcnkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKPiArewo+
ICsJYnVmZmVyX3NxdWVlemVfZW5kID0gamlmZmllcyArCj4gKwkJbXNlY3NfdG9famlmZmllcyhi
dWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcyk7CgpJJ20gbm90IHN1cmUgdGhpcyBpcyBmdWxseSBj
b3JyZWN0LiBUaGlzIGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIGZvcgplYWNoIGJsa2JhY2sgaW5z
dGFuY2UsIGJ1dCB0aGUgdGltZW91dCBpcyBzdG9yZWQgaW4gYSBnbG9iYWwgdmFyaWFibGUKdGhh
dCdzIHNoYXJlZCBiZXR3ZWVuIGFsbCBibGtiYWNrIGluc3RhbmNlcy4gU2hvdWxkbid0IHRoaXMg
dGltZW91dCBiZQpzdG9yZWQgaW4geGVuX2Jsa2lmIHNvIGVhY2ggaW5zdGFuY2UgaGFzIGl0J3Mg
b3duIGxvY2FsIHZhcmlhYmxlPwoKT3IgZWxzZSBpbiB0aGUgY2FzZSB5b3UgaGF2ZSAxayBibGti
YWNrIGluc3RhbmNlcyB0aGUgdGltZW91dCBpcwpjZXJ0YWlubHkgZ29pbmcgdG8gYmUgbG9uZ2Vy
IHRoYW4gZXhwZWN0ZWQsIGJlY2F1c2UgZWFjaCBjYWxsIHRvCnhlbl9ibGtia19yZWNsYWltX21l
bW9yeSB3aWxsIG1vdmUgaXQgZm9yd2FyZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
