Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7843314D818
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 10:05:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix5hv-0003Q2-4U; Thu, 30 Jan 2020 09:01:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix5ht-0003Px-Hk
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 09:01:49 +0000
X-Inumbo-ID: 25a37f1c-433f-11ea-b211-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25a37f1c-433f-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580374908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fmfzJl3r2uDhiCjRSSHVR9si/aMkFyvwh79V2q5pUVA=;
 b=UDNVF5cQETuZOi92mjvzYwf0iT1CbV3QXDqQlI3Ly0wP3S4XeA4j0Ud5
 oa11yGKLsXLAnHyhQHiY89tGhUz2xWtUUorlyuLenqNg79iFmmE/F4WLy
 +KLFkhNvBEw/6+iNezIlXTbzCAgOKTeqSVx/XelEaCWHpOXlTkZEEGXYd I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gUSTKiWUCL8+Gl3d/GAbP3btReAKqAEQaq8NzSQzDOdoF5L1g/n6LQjg/zyPF+ZP9z7T0P0or5
 +8jfELEJfNVTGJ7f2lOj7G0f1+g2jodHIbUH2uvQtJO96bqadwz1nq8g5qT7CjaCO8PCfheMhE
 OB/LHUheSqL/KBaWfWk6rfrtmUQ8gdciFlDt7kJnfw5EqjnLFfRVzQon0GZ329cWyCgqS3WaMC
 QP9+gn7eduLgYHSjgp/Z0a6E/ar3E14AmkkPgw9hYXpiMlYtjIFCdkcRZumv1oUPseUgOQ+NCG
 ffs=
X-SBRS: 2.7
X-MesageID: 12279565
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="12279565"
Date: Thu, 30 Jan 2020 10:01:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20200130090138.GA4679@Air-de-Roger>
References: <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
 <20200122195831.GB1314@mail-itl>
 <972998214.522226.1579818994322@mail.yahoo.com>
 <20200124102932.GF57924@desktop-tdan49n.eng.citrite.net>
 <299023995.1231830.1580157801838@mail.yahoo.com>
 <20200128101257.GJ57924@desktop-tdan49n.eng.citrite.net>
 <39893674.1202836.1580337787157@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39893674.1202836.1580337787157@mail.yahoo.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMTA6NDM6MDdQTSArMDAwMCwgdG9zaGVyIDEgd3JvdGU6
Cj4gID4gQlRXLCBhcmUgeW91IGNyZWF0aW5nIHRoZSBkcml2ZXIgZG9tYWluIHdpdGggJ2RyaXZl
cl9kb21haW49MScgaW4gdGhlIHhsIGNvbmZpZyBmaWxlPwo+IAo+IE5vLCBJIHdhc24ndCBhd2Fy
ZSBvZiB0aGUgJ2RyaXZlcl9kb21haW4nIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGJlZm9yZSwgYW5k
IHRoaXMgaXMgd2hhdCBJIHdhcyBtaXNzaW5nLiBXaXRoIHRoaXMgY29uZmlndXJhdGlvbiBvcHRp
b24sIEkgd2FzIGFibGUgdG8gbWFrZSB0aGUgSFZNIGRyaXZlciBkb21haW4gd29yay4gSG93ZXZl
ciwgdGhlIFBWIGRyaXZlciBkb21haW4gd29ya2VkIGZpbmUgd2l0aG91dCB0aGlzIG9wdGlvbiBj
b25maWd1cmVkLgo+IAo+ID4gQXJlIHlvdSBzdXJlIHRoaXMgY29tbWFuZCBpcyBydW4gb24gdGhl
IGRyaXZlciBkb21haW4/Cj4gCj4gU2luY2UgSSBoYWQgaW5zdGFsbGVkIHhlbi11dGlscyBpbiB0
aGUgZHJpdmVyIGRvbWFpbiBmb3IgdGhlIGJyaWRnZSB0byB3b3JrLCBpdCBpbnN0YWxsZWQgWGVu
IGh5cGVydmlzb3IgaW4gdGhlIGRyaXZlciBkb21haW4uIEFzIGEgcmVzdWx0LCBteSBkcml2ZXIg
ZG9tYWluIGJlY2FtZSBhbm90aGVyIERvbTAuIFJlYWxpemluZyB0aGF0IEkgcmFuIHJlZ3VsYXIg
VWJ1bnR1IGluIHRoZSBkcml2ZXIgZG9tYWluLiBUaGlzIHdhcyBhbm90aGVyIGtleSBwb2ludCB0
byBtYWtlIHRoZSBkcml2ZXIgZG9tYWluIHdvcmsuCgpSZW1vdmUgdGhlIFhlbiBlbnRyeSBmcm9t
IGdydWIgaW4gb3JkZXIgdG8gcHJldmVudCBpdCBib290aW5nIGluIGRvbTAKbW9kZSwgb3IgcmVt
b3ZlIHRoZSBwYWNrYWdlIHRoYXQgaW5zdGFsbHMgdGhlIFhlbiBrZXJuZWwgaWYgeW91cgpkaXN0
cm8gaGFzIHNlcGFyYXRlIHBhY2thZ2VzIGZvciB0aGUgWGVuIGtlcm5lbCBhbmQgdGhlIHRvb2xz
LgoKSXQncyBwb2ludGxlc3MgdG8gYm9vdCBhIGRyaXZlciBkb21haW4gYXMgYSBkb20wLCBpdCdz
IGp1c3QgZ29pbmcgdG8Kc2xvdyB0aGluZ3MgZG93bi4KCj4gVGhhbmtzIGZvciBhbGwgeW91ciBo
ZWxwLCB3aGljaCBtYWRlIGl0IHBvc3NpYmxlIGZvciBtZSB0byB0ZXN0IHRoZSBIVk0gZHJpdmVy
IGRvbWFpbi4KPiAKPiBPbmUgbGFzdCB0aGluZywgYmFja2VuZCBpbnRlcmZhY2VzIGFyZSBub3Qg
YmVpbmcgYWRkZWQgdG8gdGhlIGJyaWRnZSBhdXRvbWF0aWNhbGx5LsKgIERvIHlvdSB0aGluayBp
dCBpcyBiZWNhdXNlIHJlZ3VsYXIgVWJ1bnR1IGRvZXNuJ3QgaGF2ZSBYZW4gdmlmIHNjcmlwdHM/
IElmIHllcywgd2hhdCBpcyB0aGUgcHJvcGVyIHRoaW5nIHRvIGRvIGluIHRoaXMgY2FzZT8KCid4
bCBkZXZkJyBzaG91bGQgYWRkIHRoZSBiYWNrZW5kIGludGVyZmFjZXMgKHZpZlguWSkgdG8gdGhl
IGJyaWRnZSBpZgpwcm9wZXJseSBjb25maWd1cmVkLCBhcyBpdCBzaG91bGQgYmUgY2FsbGluZyB0
aGUgaG90cGx1ZyBzY3JpcHRzIHRvIGRvCnRoYXQuCgpDYW4geW91IHBhc3RlIHRoZSBvdXRwdXQg
eW91IGdldCBmcm9tICd4bCAtdnZ2IGRldmQgLUYnIHdoZW4gdGhhdApoYXBwZW5zPwoKQXJlIHlv
dSBzdXJlIHRoZSBicmlkZ2Ugc2V0dXAgaW4gdGhlIGd1ZXN0IGNvbmZpZyBmaWxlIGV4aXN0cyBp
biB0aGUKZHJpdmVyIGRvbWFpbj8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
