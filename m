Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AE140922
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:38:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPuo-0001ti-Du; Fri, 17 Jan 2020 11:35:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isPum-0001tY-6D
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:35:48 +0000
X-Inumbo-ID: 7ea1760e-391d-11ea-b4d8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ea1760e-391d-11ea-b4d8-12813bfff9fa;
 Fri, 17 Jan 2020 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579260944;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=E8XuCc0K4QSESiHaCvEZOH+GgqywDqUScLrnNKPVhaU=;
 b=aImNXfLR2utLJ9t5udxbEkHJmY+mtPxlAr692js0m4e5tIBFGlRI3Yan
 gZEz0qBtZu/pncfnuTNKZ7XCW12QaLbIc6vzIdLxJwsxep0uG0vUjyzqG
 DHkrJzGWNUzA/viSVtHs2UWqqBAU9pibd7cmhMpdGRWcPkZViBDF42zrO Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L/GZtzVQWuL0bqudClWBGyFO3D1tKlo6S8Z8Zz+O6NMuN3TL9MQAJAbViOplMl3sBsxHNjyMYT
 3EBgTxRCvRU7B8ilKICOe5Gdqjvb5q9uv4HIf7AnxiyzUrZ4T0zOMRpwMDbXeCpPqSa2d4oQF6
 wAQsWJ9CXMiaw//Yl9UQMPTtq8r39relPC3Tt4jhfFgIxLkXr1lZ2hhKDdo0aq4aOgACSLqJaS
 cDZVkf+c7CSgzXNY+t0JvyxefFKdZOdbIMebS7nKZcAJZq/jg7ZKgqAYlQCfdgN64VL82gnO2h
 cuE=
X-SBRS: 2.7
X-MesageID: 11061288
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11061288"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.39947.159860.741920@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 11:35:39 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <402866798e2a40e192fd8052548374c5@EX13D32EUC003.ant.amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
 <20200116093602.4203-5-pdurrant@amazon.com>
 <24096.44311.441643.264877@mariner.uk.xensource.com>
 <402866798e2a40e192fd8052548374c5@EX13D32EUC003.ant.amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 4/6] libxl: allow creation of domains
 with a specified or random domid
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "jandryuk@gmail.com" <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVycmFudCwgUGF1bCB3cml0ZXMgKCJSRTogW1BBVENIIHYzIDQvNl0gbGlieGw6IGFsbG93IGNy
ZWF0aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQiKToKPiBb
SWFuOl0KPiA+IEkgdGhpbmsgdGhlcmUgYXJlIG9ubHkgdHdvIHBvc3NpYmxlIHNvbHV0aW9uczoK
PiA+IAo+ID4gICAtIENoZWNrIHRoZSBkb21haW4ncyBlbnRyeSBpbiB0aGUgcmVjZW50IGxpc3Qg
KmFmdGVyKiBjcmVhdGluZwo+ID4gICAgIHRoZSBkb21haW4gaW4gWGVuLiAgVGhpcyBpbnZvbHZl
cyBhY2NlcHRpbmcgdGhhdCB3ZSB3aWxsCj4gPiAgICAgcmV1c2UgdGhlIGRvbWlkIGJ1dCBvbmx5
IGZvciBhIGRvbWFpbiB3ZSBhcmUgaW4gdGhlIGVhcmx5Cj4gPiAgICAgc3RhZ2VzIG9mIGNvbnN0
cnVjdGluZywgc28gaG9wZWZ1bGx5IHdpdGhvdXQgYmFkIGNvbnNlcXVlbmNlPwo+ID4gCj4gPiAg
IC0gVGFrZSB0aGUgcmVjZW50IGRvbWlkIGxvY2suCj4gPiAKPiAKPiBPciB0YWtlIGEgZ2xvYmFs
IGZpbGUgbG9jayBpbiBsaWJ4bCBhcm91bmQgZG9tYWluIGNyZWF0aW9uIGFuZCBkZXN0cnVjdGlv
bj8KCldlIHdhbnQgZG9tYWluIGNvbnN0cnVjdGlvbiB0byBiZSBjb25jdXJyZW50LCB3aGVuIGl0
IGNhbiBiZS4gIFNvIEkKdGhpbmsgYSBsb2NrIGFyb3VuZCBqdXN0IHhjX2RvbWFpbl9jcmVhdGUg
aXMgT0sgYnV0IGEgbG9jayBhcm91bmQgdGhlCndob2xlIG9wZXJhdGlvbiBpcyBub3QuCgo+ID4g
QWxzbywgaXQgc2VlbXMgdG8gbWUgdGhhdCB3ZSBzaG91bGQgY2hlY2sgdGhlIHJlY2VudCBkb21p
ZCBsaXN0IGlmIHdlCj4gPiBsZXQgWGVuIGNob29zZSB0aGUgZG9taWQuICBNYXliZSB0aGF0IGNh
biBiZSBpbiBhIHN1YnNlcXVlbnQgcGF0Y2guLi4KPiAKPiBXZWxsLCB3ZSBjb3VsZCBzb2x2ZSBh
bGwgdGhpcywgcmVtb3ZlIHRoZSBuZWVkIGZvciBhIGZpbGUgYW5kIGFsbCB0aGUgYXNzb2NpYXRl
ZCBjb21wbGV4aXR5IGJ5IHNpbXBseSBrZWVwaW5nIGhpc3RvcnkgaW5zaWRlIHRoZSBoeXBlcnZp
c29yLiBJIGRvbid0IGtub3cgaG93IHRoZSBYZW4gbWFpbnRhaW5lcnMgd2lsbCBmZWVsIGFib3V0
IHRoYXQgdGhvdWdoLCBhcyBYZW4gaXRzZWxmIHNob3VsZG4ndCBoYXZlIGEgcHJvYmxlbSB3aXRo
IGVhZ2VyIGRvbWlkIHJlLXVzZS4KCkkgdGhpbmsgdGhpcyBkb2Vzbid0IG5lZWQgdG8gYmUgZG9u
ZSBpbiB0aGUgaHlwZXJ2aXNvciBzbyBJIGFtCmluY2xpbmVkIHRvIHNheSBpdCBzaG91bGRuJ3Qg
YmUuICBBbHNvLCB0aGVyZSBpcyBhIGxvdCBvZiBwb2xpY3kgaGVyZS4uLgoKSWFuLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
