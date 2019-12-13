Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C904911E384
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 13:23:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifju9-0007Wg-Ly; Fri, 13 Dec 2019 12:18:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mOMl=2D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifju7-0007WX-T4
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 12:18:43 +0000
X-Inumbo-ID: aef76d18-1da2-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aef76d18-1da2-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576239514;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4CSBS3OjSgSnZHK97uZVmD3ZABODV0K5BhEwqjJQYLw=;
 b=PRy3aj9fFSmShWi74r3v6XtgUl/a3W6+DynWjVNxEVLj6f4BzHk+Vk2s
 JbeBU3Li5rMqS3UH/P2zuTdceAmVY84bwG8ExvGsrjUM9YNfRYENn3xSb
 fztpUuhsSMDBMsnH62uPcu0cX0hGu11pr9nEOMkkDB5otuy4gp/tpLuAv M=;
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
IronPort-SDR: bwx2tCrZg+1Iib20o6CwKELC2f1zc/8WQGWjCdDTTM1rncA0vsaPS7tq5BxQ98Mxq89x9kC/PP
 5Y8TUJMBuhqLYetVGL3CyHw1T4riXwYe0bgU+8VXWZUPSg1kirWQ0p5FmnbwxFd29MpcwzEAZo
 R1ZYS+758Wb7ctZCc445Bn5L3zQwBbOeTsvycsrqTuBj3VfxcN5329wvYVWqYviq+JZSDziJSl
 OfNRKjQeQTHFSdsLYYCPnG0y9+AkaBE/iyH+KbQvvQGYIEXmWTVsZ3lk1jx1bP3AP+Gbb2MoB8
 XBQ=
X-SBRS: 2.7
X-MesageID: 10056053
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10056053"
Date: Fri, 13 Dec 2019 12:18:32 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191213121832.GH1155@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-7-anthony.perard@citrix.com>
 <50800e04-ea99-777f-a268-e296ba18dca6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50800e04-ea99-777f-a268-e296ba18dca6@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH 6/8] xen: Move CONFIG_INDIRECT_THUNK to
 Kconfig
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMTI6MTM6NTNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMTIuMjAxOSAxOToyNywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKPiA+
IEBAIC0zMiw2ICszMiw5IEBAIGNvbmZpZyBBUkNIX0RFRkNPTkZJRwo+ID4gIAlzdHJpbmcKPiA+
ICAJZGVmYXVsdCAiYXJjaC94ODYvY29uZmlncy94ODZfNjRfZGVmY29uZmlnIgo+ID4gIAo+ID4g
K2NvbmZpZyBJTkRJUkVDVF9USFVOSwo+ID4gKwlkZWZfYm9vbCAkKGNjLW9wdGlvbiwtbWluZGly
ZWN0LWJyYW5jaC1yZWdpc3RlcikKPiAKPiBJJ20gbm90IGhhcHB5IHRvIHNlZSBjb25zdHJ1Y3Rz
IGxpa2UgdGhpcyBhcHBlYXIuIFRoZXkgbGVhdmUgYQo+ICIjIENPTkZJR18uLi4gaXMgbm90IGRl
ZmluZWQiIGluIC5jb25maWcgZm9yIG5vIHJlYXNvbiB3aGVuCj4gdGhlIGV4cHJlc3Npb24gZXZh
bHVhdGVzIHRvIG4uCgpGb3Igc29tZSByZWFzb24sIHRoaXMgZG9lc24ndCBoYXBwZW4uIElmICQo
Q0MpIGRvZXNuJ3QgdW5kZXJzdGFuZCB0aGUKb3B0aW9uLCB0aGUgQ09ORklHXyBkb2Vzbid0IGFw
cGVhciBhdCBhbGwgaW4gLmNvbmZpZy4KCkkgZ3Vlc3MgIiMgQ09ORklHXy4uLiBpcyBub3QgZGVm
aW5lZCIgY29tbWVudHMgYXJlIG9ubHkgdXNlZnVsIGZvcgpvcHRpb25zIHRoYXQgY2FuIGJlIHNl
bGVjdGVkIGJ5IHVzZXJzLCBzbyBLY29uZmlnIHdvdWxkIGtub3cgbm90IHRvIGFzawp0aGUgdXNl
cnMgYWdhaW4uIFNvLCBmb3IgIm9wdGlvbnMiIHRoYXQgYXJlbid0IGZvciB1c2VycywgdGhlIGNv
bW1lbnQKZG9lc24ndCBuZWVkIHRvIGV4aXN0LgoKPiBUaGlzIG1heSBub3QgbWF0dGVyIG11Y2gg
d2hlbgo+IGNvbnNpZGVyaW5nIGp1c3Qgb25lIHN1Y2ggbGluZSwgYnV0IGl0IHdpbGwgd2hlbiB3
ZSBnYWluCj4gZG96ZW5zIG9yIGh1bmRyZWRzLiBGb3Igb3B0aW9ucyB3aXRob3V0IHByb21wdHMg
SSB0aGluayB0aGUKPiBkZWZhdWx0IHNob3VsZCBvbmx5IGV2ZXIgYmUgc2V0IHRvIHkgKG9yIG0s
IHdoaWNoIHdlIGRvbid0Cj4gdXNlKS4gVGhlIGFib3ZlIHdvdWxkIHRoZW4gYmUgd3JpdHRlbiBh
cwoKSSB0aGluayBLY29uZmlnIGRldmVsb3BlcnMgaGF2ZSBhbHJlYWR5IGRvbmUgdGhlIHdvcmsg
Zm9yIHRoYXQgOi0pLiBTbwp0aGUgY29uc3RydWN0IGRlZl9ib29sIHkgaWYgJFggaXNuJ3QgbmVl
ZGVkLiBNYXliZSBJIHNob3VsZCByZWFkIHRvIGRvYwphYm91dCB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuICJkZWZfYm9vbCBuIiBhbmQgImRlZl9ib29sIHkgaWYgbiIsIGJ1dAp0aGVyZSBpcyBwcm9i
YWJseSBubyBkaWZmZXJlbmNlLgoKPiBjb25maWcgSU5ESVJFQ1RfVEhVTksKPiAJZGVmX2Jvb2wg
eSBpZiAkKGNjLW9wdGlvbiwtbWluZGlyZWN0LWJyYW5jaC1yZWdpc3RlcikKClRoYW5rcywKCi0t
IApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
