Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE1135C5F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 16:13:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipZS0-0003VV-EE; Thu, 09 Jan 2020 15:10:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yNyl=26=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipZRz-0003Ul-By
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 15:10:19 +0000
X-Inumbo-ID: 253bee5e-32f2-11ea-b9f1-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 253bee5e-32f2-11ea-b9f1-12813bfff9fa;
 Thu, 09 Jan 2020 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578582618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0VnFg2ZSAdQqENtGRn+5iszIr75iJeobkMQRWwJ3MSU=;
 b=F9XfB5Nwh0+AXoFljTl2cAf6cP8Q3ZEPuHmSdIAsBfl9GlFBTDNun9+r
 l1yAaihe367W3R/dLqy39fPUFfn0l7mbG5ESpGb0WMhLcE0gun98vFaNI
 XJiUNLeaQsJRi01B3BodpxL4uxrgGw7l0Zib1sV4vgPouVOIPB5DVh2E+ o=;
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
IronPort-SDR: EHG5+4D9VKiOR4pt7gFXs5mEWqYSnc/39TtGf79vUYM4eODO5SfRysfCFXJgX5RhsX9JjedQyE
 PTABbOk/QTNtZocawAzbLfoI/Rhd3WTSofrww1tG5IW++Aeb8j51RYB6l6MTSxrLlivBAB0a3d
 +myK+0Uckkh1ksq/rq/29sh4YKX3Z3ZlE7sy9G1SFuIN9+Uaz08jBcwgguHjNKyNFQq6Ds5rrk
 ZWMlUjkJqK7KRGISStKl+iPFi1Gig3YpKNTN9fP3ajp9fsptpNAd6pnJDXPaU/MCL6/bhbwkQn
 MrU=
X-SBRS: 2.7
X-MesageID: 11275700
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,414,1571716800"; d="scan'208";a="11275700"
Date: Thu, 9 Jan 2020 16:10:10 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200109151010.GC11756@Air-de-Roger>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
 <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
 <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDY6NDE6MTJBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IE9uIFRodSwgSmFuIDksIDIwMjAgYXQgMzoyOSBBTSBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBUYW1hcywKPiA+Cj4gPiBPbiAwOC8wMS8y
MDIwIDE3OjE0LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ICtzdGF0aWMgaW50IG1lbV9z
aGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqY2QpCj4gPiA+ICt7
Cj4gPiA+ICsgICAgaW50IHJjOwo+ID4gPiArCj4gPiA+ICsgICAgaWYgKCAhZC0+Y29udHJvbGxl
cl9wYXVzZV9jb3VudCAmJgo+ID4gPiArICAgICAgICAgKHJjID0gZG9tYWluX3BhdXNlX2J5X3N5
c3RlbWNvbnRyb2xsZXIoZCkpICkKPiA+Cj4gPiBBRkFJVSwgdGhlIHBhcmVudCBkb21haW4gd2ls
bCBiZSBwYXVzZWQgaWYgaXQgd2Fzbid0IHBhdXNlZCBiZWZvcmUgYW5kCj4gPiB0aGlzIHdpbGwg
bm90IGJlIHVucGF1c2VkIGJ5IHRoZSBzYW1lIGh5cGVyY2FsbC4gUmlnaHQ/Cj4gCj4gWWVzLCBp
dCBuZWVkcyB0byByZW1haW4gcGF1c2VkIGFzIGxvbmcgYXMgdGhlcmUgYXJlIGZvcmtzIGFjdGl2
ZSBmcm9tCj4gaXQuIEFmdGVyd2FyZHMgaXQgY2FuIGJlIHVucGF1c2VkLgoKSWYgeW91IHdhbnQg
dGhlIHBhcmVudCBkb21haW4gdG8gcmVtYWluIHBhdXNlZCBmb3IgYXMgbG9uZyBhcyB0aGUKZm9y
a3MgYXJlIGFjdGl2ZSwgc2hvdWxkbid0IGVhY2ggZm9yayBpbmNyZW1lbnQgdGhlIHBhdXNlIGNv
dW50IG9uCmNyZWF0aW9uIGFuZCBkZWNyZW1lbnQgaXQgd2hlbiB0aGUgZm9yayBpcyBkZXN0cm95
ZWQ/CgpIb3cgY2FuIHlvdSBhc3N1cmUgbm8gb3RoZXIgb3BlcmF0aW9uIG9yIGVudGl0eSBoYXMg
aW5jcmVtZW50ZWQKY29udHJvbGxlcl9wYXVzZV9jb3VudCB0ZW1wb3JhcnkgYW5kIGlzIGxpa2Vs
eSB0byBkZWNyZW1lbnQgaXQgYXQgc29tZQpwb2ludCB3aGlsZSBmb3JrcyBhcmUgc3RpbGwgYWN0
aXZlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
