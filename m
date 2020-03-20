Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7C418D182
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:51:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIxn-00020D-Mi; Fri, 20 Mar 2020 14:49:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFIxl-000206-Gc
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:49:29 +0000
X-Inumbo-ID: ffa1cb50-6ab9-11ea-b34e-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffa1cb50-6ab9-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584715769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8DGKgppzHNewiGZWx1Fu3bQsBj531R8txtwQgeRCoVk=;
 b=Ai7Np2e+hTgVl6T9b52hGpfu1O9qDqxAhVFg2zWYXWGnZinezS9DaXyi
 q8O5SQeDV1rqY66r+tBuRT84vP4QJQTnWRrigp2c7IypBDMaTpsohoNZv
 67JvgBctTnMLBi4iBGvpejCiQbOmUzQMRw9gnHIZenqh+dkLyp4SG0yG5 o=;
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
IronPort-SDR: 3CXcHaSta3IXElKUjAqqrC2a/vXaPN6RypYM4okp8ebEcNcahLg7m20UlqqHjGAEOMkFqFyhtA
 r3ELEf2VvLiA42d0Sfd7RjkXQQ+kTmZp7BS2s8EOL7+DH3nuPbPIiSfF6p7rSFpPnbJPyeblwj
 SNBJJ7VBseJDjFAr0TYFTQQTx0o4NnjkVhFSRXwROKCYe0ICAYMBRwmnh7jIC6CuUxCwWKOFN5
 Zywh1earEZzrpkf54Hsy+pCKgnCvHfdL1bbBUm6V4i76HsSjNX9k2cdH+/ChIcWBdqsH1EKmke
 Qyw=
X-SBRS: 2.7
X-MesageID: 14334941
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14334941"
Date: Fri, 20 Mar 2020 15:49:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200320144920.GY24458@Air-de-Roger.citrite.net>
References: <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
 <20200320142214.GX24458@Air-de-Roger.citrite.net>
 <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDI6Mjc6MzZQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDIwLzAzLzIwMjAgMTQ6MjIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBzdGF0aWMgaW5saW5lIHZvaWQgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sodWludDMyX3Qg
dGxiZmx1c2hfdGltZXN0YW1wKQo+ID4gewo+ID4gICAgICBjcHVtYXNrX3QgbWFzazsKPiA+IAo+
ID4gICAgICBjcHVtYXNrX2NvcHkoJm1hc2ssICZjcHVfb25saW5lX21hcCk7Cj4gPiAgICAgIHRs
YmZsdXNoX2ZpbHRlcigmbWFzaywgdGxiZmx1c2hfdGltZXN0YW1wKTsKPiA+ICAgICAgaWYgKCAh
Y3B1bWFza19lbXB0eSgmbWFzaykgKQo+ID4gICAgICB7Cj4gPiAgICAgICAgICBwZXJmY19pbmNy
KG5lZWRfZmx1c2hfdGxiX2ZsdXNoKTsKPiA+ICNpZiBDT05GSUdfWDg2Cj4gPiAgICAgICAgICAv
Kgo+ID4gICAgICAgICAgICogZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBhZnRlciBt
b2RpZnlpbmcgdGhlIHAybSBpbgo+ID4gICAgICAgICAgICogcG9wdWxhdGVfcGh5c21hcCwgWGVu
IG5lZWRzIHRvIHRyaWdnZXIgYW4gQVNJRCB0aWNrbGUgYXMgdGhpcyBpcyBhCj4gPiAgICAgICAg
ICAgKiByZXF1aXJlbWVudCBvbiBBTUQgaGFyZHdhcmUuCj4gPiAgICAgICAgICAgKi8KPiAKPiBJ
IGRvbid0IHRoaW5rIHRoaXMgY29tbWVudCBpcyBjb3JyZWN0LiBwb3B1bGF0ZV9waHlzbWFwKCkg
aXMgb25seSBnb2luZyB0bwo+IGFkZCBlbnRyeSBpbiB0aGUgUDJNIGFuZCB0aGVyZWZvcmUgZmx1
c2ggc2hvdWxkIG5vdCBiZSBuZWVkZWQuCgpTaW5jZSB0aGlzIGlzIHN0cmljdGx5IG9ubHkgYWRk
aW5nIGVudHJpZXMgSSB0aGluayB5b3UgYXJlIHJpZ2h0IGFuZAp0aGUgQVNJRCB0aWNrbGUgY291
bGQgYmUgYXZvaWRlZCwgYXMgbG9uZyBhcyB3ZSBjYW4gYXNzZXJ0IHRoZSBnZm4gd2FzCmVtcHR5
IChvciBkaWRuJ3QgaGF2ZSB0aGUgdmFsaWQgYml0IHNldCkgcHJldmlvdXMgdG8gYmVpbmcgcG9w
dWxhdGVkLgoKT3IgdGhhdCB0aGUgbmVzdGVkIHBhZ2UgdGFibGVzIGNvZGUgYWxyZWFkeSBoYW5k
bGVzIGFsbCB0aGlzIGFuZApwZXJmb3JtIHRoZSBuZWNlc3NhcnkgZmx1c2hlcy4KCj4gVGhlIG9u
bHkgcmVhc29uIHRoZSBmbHVzaCB3b3VsZCBoYXBwZW4gaW4gcG9wdWxhdGVfcGh5c21hcCgpIGlz
IGJlY2F1c2Ugd2UKPiBhbGxvY2F0ZWQgYSBwYWdlIHRoYXQgd2FzIHJlcXVpcmVkIHRvIGJlIGZs
dXNoIChzZWUgZnJlZS5uZWVkX3RiZmx1c2gpLgoKSSB0aGluayB0aGlzIGlzIHJlbGF0ZWQgdG8g
UFYgZ3Vlc3RzIHJhdGhlciB0aGFuIEhWTSBvbmVzPyBGb3IgSFZNIHdlCndvdWxkIGFsd2F5cyBm
bHVzaCB3aGF0ZXZlciBpcyBuZWVkZWQgYWZ0ZXIgcmVtb3ZpbmcgYW4gZW50cnkgZnJvbSB0aGUK
cGFnZSB0YWJsZXMuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
