Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630B8DB0E2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 17:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL7To-0001rN-As; Thu, 17 Oct 2019 15:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zIrv=YK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iL7Tn-0001r8-CT
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 15:14:19 +0000
X-Inumbo-ID: c928cad0-f0f0-11e9-93d3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c928cad0-f0f0-11e9-93d3-12813bfff9fa;
 Thu, 17 Oct 2019 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571325257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YpxqBXqmJYgTgzUYgAeaUe+niLoE1yOzATNcH9uO9PQ=;
 b=Jm9lFdtbogSQALsWT7K+ZxX77LL+dMqh+fKukwfdoxH01x1r/N6GNUSS
 HJbp9kdrzPnooQuP0uUZEDuukYfVKHtvFWKNEJUk4Ym7BwQCGWxlzt7PC
 Tb0XhtXfGsoUGIPa/7twHPGqJz80K0+1Xj5ACtMnMa6ZdZpzn0rNRRjbi g=;
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
IronPort-SDR: BUkLyL6zY/rj9E8Jm1jwLrPbhudNNjgxchdadJaEO4M65aHzORTKnalcc4fh1F4EE5I+//Y1gE
 oYVqhhU7qEAjEKD7RotLl8i+S1TVIgU451XMNOTYckFeVgjGwSdB5JwRyxQ1Zk8KMG+8U+NIu8
 odjs+hEcF2T8gepJNwmzru7KFDnGqrTY9b7Nqt7ZaqNLqfuOvtLwoc/epoqsr/XGmzeLwoItcI
 +FtAQiCQ1i8tfMSSIsChdXcHRcCJlQ5eLkyPxLmHuyt1myYLWWa/C6YQ0dg3H7UgcgbCbArEbM
 Uxk=
X-SBRS: 2.7
X-MesageID: 7445658
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,308,1566878400"; 
   d="scan'208";a="7445658"
Date: Thu, 17 Oct 2019 17:14:07 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20191017151407.GC17494@Air-de-Roger>
References: <20191015154736.19882-1-roger.pau@citrix.com>
 <20191015154736.19882-3-roger.pau@citrix.com>
 <20191017082608.GA1410@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017082608.GA1410@mail-itl>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 2/4] x2APIC: simplify resume
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MjY6MDhBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFR1ZSwgT2N0IDE1LCAyMDE5IGF0IDA1OjQ3OjM0UE0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+IFRoZXJlJ3Mgbm8gbmVlZCB0byBzYXZl
IGFuZCByZXN0b3JlIHRoZSBJTy1BUElDIGVudHJpZXMsIHRoZSBlbnRyaWVzCj4gPiBwcmlvciB0
byBzdXNwZW5zaW9uIGhhdmUgYWxyZWFkeSBiZWVuIHNhdmVkIGJ5IGlvYXBpY19zdXNwZW5kLCBh
bmQKPiA+IHdpbGwgYmUgcmVzdG9yZWQgYnkgaW9hcGljX3Jlc3VtZS4gTm90ZSB0aGF0IGF0IHRo
ZSBwb2ludCB3aGVyZQo+ID4gcmVzdW1lX3gyYXBpYyBnZXRzIGNhbGxlZCB0aGUgSU8tQVBJQyBo
YXMgbm90IHlldCByZXN1bWVkLCBhbmQgaGVuY2UKPiA+IGFsbCBlbnRyaWVzIHNob3VsZCBiZSBt
YXNrZWQuCj4gPiAKPiA+IE5vdGUgdGhpcyBzaG91bGRuJ3QgaW50cm9kdWNlIGFueSBmdW5jdGlv
bmFsIGNoYW5nZS4KPiA+IAo+ID4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiAKPiBJJ3ZlIHRyaWVkIGhvc3Qgc3VzcGVuZCB3aXRob3V0IGFueSBkb21V
IHJ1bm5pbmcgYW5kIGl0IHdvcmtzLiBJJ3ZlIHRlc3RlZAo+IGp1c3QgdGhpcyBwYXRjaCB3aXRo
b3V0IG90aGVycyBpbiB0aGUgc2VyaWVzLCBkb2VzIGl0IG1hdHRlcj8KCk5vIHRoYXQncyBmaW5l
LgoKPiBUZXN0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52
aXNpYmxldGhpbmdzbGFiLmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
