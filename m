Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB5C0873
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:21:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDs1U-0002y9-4a; Fri, 27 Sep 2019 15:19:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fvvD=XW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iDs1S-0002y4-IF
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:19:06 +0000
X-Inumbo-ID: 245924c1-e13a-11e9-967d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 245924c1-e13a-11e9-967d-12813bfff9fa;
 Fri, 27 Sep 2019 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569597545;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Ih6OhykguXuiH2uVmK/gf3nT3EQ/z25+0K4c6BmTmEs=;
 b=gxUh6e9YTWGXWHw8ijE124twy7HZ7PaAvaBLnCH2E506WZPvN4hZ6iq6
 1GTz9LXr59WEowtR8RwDq+st13BPnMjA50YjO8aA7kpn3tDu5tp9bQzhd
 fuwHU/tk6bUgzfjcFXaYPp4bQ4XMS8d9alpRdko9KLGgrO3RTNk5rPa0l U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fAlB4wwdXo6mhY/sf2xjvFNEqQWT/wxPy2L/SL3RZczctRSP4SUWbCB9GmEkHeeQvwiG/2caV+
 UqlxZXGKBMHdeE0+bIIRUwDFaPA6pfS0hkMQpn9e0d+a3nMZ9zBY+B+2IECWfxuqz1zxkUL2p4
 37Zis4e0VsXyGCSTOfcp3oI5jKQ/7cLFX1BVlJV3LPCczjSzbwD40fUG7N98gGnMD0LVVzEW2m
 sqn31rF/oPFDMrzdnq9n5VQxAtVOeDG1zHu2k0YOFXEwUr8/4lmglg/tpXQ+hJwH7TDG48hJiF
 tl4=
X-SBRS: 2.7
X-MesageID: 6523451
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6523451"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23950.10341.746130.616131@mariner.uk.xensource.com>
Date: Fri, 27 Sep 2019 16:19:01 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
 <23949.58956.637645.181431@mariner.uk.xensource.com>
 <05b68d90-0fb9-6415-61f3-56881ca428c0@suse.com>
 <23950.4274.238406.524438@mariner.uk.xensource.com>
 <1d8dda0e-0fbe-04b4-0b11-41844089cf90@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/6] docs: add feature document for Xen
 hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1BBVENIIHYxIDEvNl0gZG9jczogYWRkIGZlYXR1
cmUgZG9jdW1lbnQgZm9yIFhlbiBoeXBlcnZpc29yIHN5c2ZzLWxpa2Ugc3VwcG9ydCIpOgo+IE9u
IDI3LjA5LjE5IDE1OjM3LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEkgdGhpbmsgdGhpcyBpcyBB
U0NJSSBwcmludGluZyBjaGFyYWN0ZXJzIHdpdGggdGhlIGV4Y2VwdGlvbiBvZgo+ID4gICAgISAi
IGAgJCAlIF4gJiAqID0gKyB7IH0gJyB+IDwgPiAvIFwgfAo+ID4gCj4gPiBJIHN0cnVnZ2xlIHRv
IGZpbmQgYSBwcmluY2lwbGVkIGV4cGxhbmF0aW9uIGZvciB0aGlzIHBhcnRpY3VsYXIKPiA+IGV4
Y2x1c2lvbiBzZXQgKGFwYXJ0IGZyb20gLyksIGNvbnNpZGVyaW5nIHRoYXQgZm9sbG93aW5nIGFy
ZQo+ID4gaW5jbHVkZWQ6Cj4gPiAgICAtIEAgXyAuIDogKCApIFsgXSAjICwgOwo+ID4gCj4gPiBD
b3VsZCB3ZSBib3Jyb3cgc29tZSBleGlzdGluZyBwZXJtaXR0ZWQgY2hhcmFjdGVyIHNldCA/ICBJ
ZiB3ZSBhcmUKPiA+IHBlcm1pdHRpbmcgc2hlbGwgbWV0YWNoYXJhY3RlcnMgd2h5IG5vdCBqdXN0
IHBlcm1pdCBhbGwgcHJpbnRhYmxlCj4gPiBBU0NJSSBleGNlcHQgLyA/Cj4gCj4gSG1tLCBtYXli
ZSB3ZSBzaG91bGQgYWxsb3cganVzdCB0aGUgIlBvc2l4IHBvcnRhYmxlIGZpbGUgbmFtZSBjaGFy
YWN0ZXIKPiBzZXQiPyBUaGF0IHdvdWxkIGJlIFstLl8wLTlBLVphLXpdLiBBbmQgd2Ugc2hvdWxk
IGV4cGxpY2l0bHkgbm90IGFsbG93Cj4gdGhlIGtleSBuYW1lcyAiLiIgYW5kICIuLiIuCgpJIGFn
cmVlIGFib3V0ICIuIiBhbmQgIi4uIi4KCkknbSBub3Qgc3VyZSB0aGUgIlBvc2l4IHBvcnRhYmxl
IGZpbGUgbmFtZSBjaGFyYWN0ZXIgc2V0IiBpcyBhIHZlcnkKZ29vZCBndWlkZS4gIFBvc2l4IHdp
bGwgYmUgcHJldHR5IHJlc3RyaWN0ZWQgdGhlcmUuICBXaGF0IGlzIHRoZSBsZWdhbApzZXQgaW4g
YSBMaW51eCBzeXNmcyBmaWxlbmFtZSA/Cgo+ID4gRG8geW91IG1lYW4gImFueSA3LWJpdCBieXRl
Iiwgb3Igb2N0ZXQgdmFsdWVzIDMyLTEyNiAoMHgyMC0weDdlKQo+ID4gaW5jbHVzaXZlLCBvciBz
b21ldGhpbmcgZWxzZSA/Cj4gCj4gOi0pCj4gCj4gQXMgSSdkIGxpa2UgdG8gc3VwcG9ydCBlLmcu
IHRoZSAuY29uZmlnIGZpbGUgY29udGVudHMgb2YgdGhlIGh5cGVydmlzb3IKPiBidWlsZCBJIGd1
ZXNzIEkgbmVlZCAoMHgwMS0weGZmKSBpbmNsdXNpdmUsIHJpZ2h0PwoKVGhlIC5jb25maWcgZmls
ZSBJIGhhdmUgaGVyZSBkb2VzIG5vdCBzZWVtIHRvIGNvbnRhaW4gYW55IGNvbnRyb2wKY2hhcmFj
dGVycy4gIElmIGl0IGRpZCBzdXJlbHkgdGhhdCB3b3VsZCBiZSBhIGJ1Zz8gIElmIHlvdSB3YW50
IHRoaXMKeW91IG9idmlvdXNseSBkbyBuZWVkIHRvIHBlcm1pdCBuZXdsaW5lcyBhbmQgc3BhY2Vz
IGFuZCBwZXJoYXBzIHRhYnMKdG9vLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
