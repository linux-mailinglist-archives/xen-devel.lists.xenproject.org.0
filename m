Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31990E4C07
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 15:24:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNzYL-0003VQ-B3; Fri, 25 Oct 2019 13:22:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lhq/=YS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iNzYK-0003VL-2z
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 13:22:52 +0000
X-Inumbo-ID: 829a1341-f72a-11e9-94c9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 829a1341-f72a-11e9-94c9-12813bfff9fa;
 Fri, 25 Oct 2019 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572009756;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U7A9vqTRnZ0P8zHVJ126ASYJ3GVIFzWnfAJtax1ZEsw=;
 b=U1F8/a3HzqXUt2pPKrg6eajZ0UX22Fu75yyRuNqryqq8GC5TaYiWj1LG
 LXEPj0+FiUWTwfrmAZeY7jT3FwS2VvpGva1c4xrFB0Yafxb8cxj2YQyND
 GSKbcRhBERezUh1SJnJdg9Is4iiKGW3L1NQquhuJjdPLKJrPx+AvKY9ax k=;
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
IronPort-SDR: IksYSTfPBUa8pTYTkI54NHvly6ABGOu7DBvVzlNVlCJqWS9XKzezK8fy+zxvhubTXbwnm9WAFe
 kXV1JgMkrm+5AOaO9+B3PqAOpJZYsVKEVyOQhTvVIy8zU8Vhk0IZJmThZPDiMJV5Tv6prCeoXp
 GMmGqEX7H2e4iI7ak11ndIcHkPjjvUbrHbP6Aicgc0NU7Z+FY89R6sRSOd147yRQkEp9TlxUYn
 EiTTMYtDfRuGBddlZttTn15SjwLXjHjeJHLbKIyDvrDOYo1HV7dwPEMf1yVUdEpTRVpTHqd3tK
 vzw=
X-SBRS: 2.7
X-MesageID: 7787959
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,228,1569297600"; 
   d="scan'208";a="7787959"
Date: Fri, 25 Oct 2019 15:22:29 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191025132229.GV17494@Air-de-Roger>
References: <20191015154736.19882-1-roger.pau@citrix.com>
 <bb278e2c-bae7-2a76-35c6-852e038eae1c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb278e2c-bae7-2a76-35c6-852e038eae1c@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 0/4] iommu: fixes for interrupt remapping
 enabling
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMDM6MTk6NTdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTUuMTAuMjAxOSAxNzo0NywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gSGVs
bG8sCj4gPiAKPiA+IFRoZSBmb2xsb3dpbmcgc2VyaWVzIGNvbnRhaW4gZml4ZXMgZm9yIGlzc3Vl
cyBmb3VuZCB3aGVuIGVuYWJsaW5nCj4gPiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGFuZCB0aGUgSU8t
QVBJQyBhbHJlYWR5IGhhcyB1bm1hc2tlZCBwaW5zLiBXaGlsZSBJJ20KPiA+IG5vdCBhd2FyZSBv
ZiBhbnkgc3lzdGVtIG1hbGZ1bmN0aW9uaW5nIChhcGFydCBmcm9tIHJlcG9ydGluZyBJT01NVQo+
ID4gaW50ZXJydXB0IHJlbWFwcGluZyBmYXVsdHMpIEkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0
byBoYXZlIHRob3NlIGluCj4gPiA0LjEzLgo+ID4gCj4gPiBUaGUgc2VyaWVzIGNhbiBhbHNvIGJl
IGZvdW5kIGF0Ogo+ID4gCj4gPiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94
ZW4uZ2l0IGlvbW11X2ludHJfdjMKPiA+IAo+ID4gVGhhbmtzLCBSb2dlci4KPiA+IAo+ID4gUm9n
ZXIgUGF1IE1vbm5lICg0KToKPiA+ICAgaW9tbXUvYW1kOiBzdXBwb3J0IGFsbCBkZWxpdmVyeSBt
b2RlcyB3aXRoIHgyQVBJQwo+ID4gICB4MkFQSUM6IHNpbXBsaWZ5IHJlc3VtZQo+ID4gICB4MkFQ
SUM6IHRyYW5zbGF0ZSBJTy1BUElDIGVudHJpZXMgd2hlbiBlbmFibGluZyB0aGUgSU9NTVUKPiA+
ICAgaW9tbXU6IHRyYW5zbGF0ZSBJTy1BUElDIHBpbnMgd2hlbiBlbmFibGluZyBpbnRlcnJ1cHQg
cmVtYXBwaW5nCj4gCj4gQXMgbWVudGlvbmVkIGluIHJlcGx5IHRvICMxLCBJIHRoaW5rIHRoYXQg
b25lIHNob3VsZCBnbyBsYXN0LiBUaGUKPiBvdGhlciB0aHJlZSBhcmUgcmVhZHkgdG8gYmUgY29t
bWl0dGVkLCBidXQgSSdkIGxpa2UgdG8gZG91YmxlIGNoZWNrCj4gdGhhdCB0aGVyZSdzIG5vIGRl
cGVuZGVuY3kgb2YgYW55IG9mIHRoZW0gb24gdGhlIDFzdC4KCkkgdGhpbmsgIzEgaXMgZnVsbHkg
aW5kZXBlbmRlbnQgb2YgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcywgYW5kIHRoZQpvdGhlciB0aHJl
ZSBjYW4gYmUgY29tbWl0dGVkIHJlZ2FyZGxlc3Mgb2YgIzEuCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
