Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F018C97B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 10:04:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFDXd-0004ku-25; Fri, 20 Mar 2020 09:02:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFDXb-0004kp-14
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 09:02:07 +0000
X-Inumbo-ID: 78c8866c-6a89-11ea-b34e-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78c8866c-6a89-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584694925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ldnteq3EdjYR1D1a+T5uCUqHVwEW7BBI3Sh+3awZK/0=;
 b=REmiw6iHtgpc54MSI5MxODvQyVkZU9ZMeMc89yP79mWM0fvULfz+SGSk
 UxZUXa1ChtoIqrHw4oMQvcubxuNnG2IfSlBb1A+LcdbejEqVtl3S9e7u7
 eIx0caS4na143L4KeH76cANcfwnP3d2h8JILtVL0XIkk/0UjGEXTOR2UM Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mr2C45A3keMlhypZ0kTf1zCdp2piiHzkAtfYpMvg3uikIWTZr//T/cdxfAYJ8SB04Mr1XL8eAg
 X9fgj4J5Qee7j3I+CKWZbdch2aQagdkvcPeHVKVUm+H6iZE/vGDG8BMTnOVozwnlIzR6xhDIPM
 t5M+DAdSwg0dXodLiZnjyXf6Gx11eoHLU2shikdpKwoR+cdo/GyduTasOIZQ9d1O90RzlCmLP9
 +MeHeCuaU9ma4kB1KFs7kNuGnzmoekrvDM2IBoTbGFYG/Z5auVG0AmbBlkMN3/w36RaFVur2Sg
 8MY=
X-SBRS: 2.7
X-MesageID: 14755347
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14755347"
Date: Fri, 20 Mar 2020 10:01:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200320090155.GS24458@Air-de-Roger.citrite.net>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDg6MjE6MTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDMuMjAyMCAyMDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gSGksCj4g
PiAKPiA+IE9uIDE5LzAzLzIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4g
T24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDY6MDc6NDRQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ID4+Pgo+ID4+Pgo+ID4+PiBPbiAxOS8wMy8yMDIwIDE3OjM4LCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4+Pj4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDQ6MjE6MjNQTSArMDAw
MCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4+Pj4gwqAgPj4gV2h5IGNhbid0IHlvdSBrZWVwIGZs
dXNoX3RsYl9tYXNrKCkgaGVyZT8KPiA+Pj4+Cj4gPj4+PiBCZWNhdXNlIGZpbHRlcmVkX2ZsdXNo
X3RsYl9tYXNrIGlzIHVzZWQgaW4gcG9wdWxhdGVfcGh5c21hcCwgYW5kCj4gPj4+PiBjaGFuZ2Vz
IHRvIHRoZSBwaHltYXAgcmVxdWlyZSBhbiBBU0lEIGZsdXNoIG9uIEFNRCBoYXJkd2FyZS4KPiA+
Pj4KPiA+Pj4gSSBhbSBhZnJhaWQgdGhpcyBkb2VzIG5vdCB5ZXQgZXhwbGFpbiBtZSB3aHkgZmx1
c2hfdGxiX21hc2soKSBjb3VsZCBub3QgYmUKPiA+Pj4gdXBkYXRlZCBzbyBpdCBmbHVzaCB0aGUg
QVNJRCBvbiBBTUQgaGFyZHdhcmUuCj4gPj4KPiA+PiBDdXJyZW50IGJlaGF2aW9yIHByZXZpb3Vz
IHRvIHRoaXMgcGF0Y2ggaXMgdG8gZmx1c2ggdGhlIEFTSURzIG9uCj4gPj4gZXZlcnkgVExCIGZs
dXNoLgo+ID4+Cj4gPj4gZmx1c2hfdGxiX21hc2sgaXMgdG9vIHdpZGVseSB1c2VkIG9uIHg4NiBp
biBwbGFjZXMgd2hlcmUgdGhlcmUncyBubwo+ID4+IG5lZWQgdG8gZmx1c2ggdGhlIEFTSURzLiBU
aGlzIHByZXZlbnRzIHVzaW5nIGFzc2lzdGVkIGZsdXNoZXMgKGJ5IEwwKQo+ID4+IHdoZW4gcnVu
bmluZyBuZXN0ZWQsIHNpbmNlIHRob3NlIGFzc2lzdGVkIGZsdXNoZXMgcGVyZm9ybWVkIGJ5IEww
Cj4gPj4gZG9uJ3QgZmx1c2ggdGhlIEwyIGd1ZXN0cyBUTEJzLgo+ID4+Cj4gPj4gSSBjb3VsZCBr
ZWVwIGN1cnJlbnQgYmVoYXZpb3IgYW5kIGxlYXZlIGZsdXNoX3RsYl9tYXNrIGFsc28gZmx1c2hp
bmcgdGhlCj4gPj4gQVNJRHMsIGJ1dCB0aGF0IHNlZW1zIHdyb25nIGFzIHRoZSBmdW5jdGlvbiBk
b2Vzbid0IGhhdmUgYW55dGhpbmcgaW4KPiA+PiBpdCdzIG5hbWUgdGhhdCBzdWdnZXN0cyBpdCBh
bHNvIGZsdXNoZXMgdGhlIGluLWd1ZXN0IFRMQnMgZm9yIEhWTS4KPiA+IAo+ID4gSSBhZ3JlZSB0
aGUgbmFtZSBpcyBjb25mdXNpbmcsIEkgaGFkIHRvIGxvb2sgYXQgdGhlIGltcGxlbWVudGF0aW9u
IHRvIHVuZGVyc3RhbmQgd2hhdCBpdCBkb2VzLgo+ID4gCj4gPiBIb3cgYWJvdXQgcmVuYW1pbmcg
KG9yIGludHJvZHVjaW5nKSB0aGUgZnVuY3Rpb24gdG8gZmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFz
aygpIG9yIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX2NwdW1hc2soKSkgPwo+IAo+IEFuZCB0aGlzIHdv
dWxkIHRoZW4gZmx1c2ggX29ubHlfIGd1ZXN0IFRMQnM/CgpObywgSSB0aGluayBmcm9tIEp1bGll
bidzIHByb3Bvc2FsIChpZiBJIHVuZGVyc3Rvb2QgaXQgY29ycmVjdGx5KQpmbHVzaF90bGJfYWxs
X2d1ZXN0c19tYXNrIHdvdWxkIGRvIHdoYXQgZmx1c2hfdGxiX21hc2sgY3VycmVudGx5IGRvZXMK
cHJldmlvdXMgdG8gdGhpcyBwYXRjaCAoZmx1c2ggWGVuJ3MgVExCcyArIEhWTSBBU0lEcykuCgo+
ID4+IEkgd291bGQgcmF0aGVyIHByZWZlciB0aGUgZGVmYXVsdCB0byBiZSB0byBub3QgZmx1c2gg
dGhlCj4gPj4gQVNJRHMsIHNvIHRoYXQgdXNlcnMgbmVlZCB0byBzcGVjaWZ5IHNvIGJ5IHBhc3Np
bmcgdGhlIGZsYWcgdG8KPiA+PiBmbHVza19tYXNrLgo+ID4gVGhhdCdzIHg4NiBjaG9pY2UuIEZv
ciBjb21tb24sIEkgd291bGQgcmF0aGVyIG5vIGludHJvZHVjZSB0aG9zZSBmbGFncyB1bnRpbCB3
ZSBoYXZlIGFub3RoZXIgYXJjaCB0aGF0IG1ha2UgdXNlIG9mIGl0Lgo+IAo+IFRoZSBmbGFncyBz
aG91bGQgcGVyaGFwcyBpbmRlZWQgcmVtYWluIHg4Ni1zcGVjaWZpYywgYnV0IHN1aXRhYmxlCj4g
d3JhcHBlcnMgdXNhYmxlIGZyb20gY29tbW9uIGNvZGUgc2hvdWxkIGV4aXN0IChhcyB5b3Ugc3Vn
Z2VzdAo+IGJlbG93KS4KCkkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIHJlIG5hbWluZywg
YXJlIHlvdSBPSyB3aXRoIHRoZSBuYW1lcwpwcm9wb3NlZCBhYm92ZT8KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
