Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFD49945B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 14:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0mcu-0007EQ-3P; Thu, 22 Aug 2019 12:55:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng0H=WS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i0mcs-0007EL-Im
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 12:55:38 +0000
X-Inumbo-ID: 22e85cca-c4dc-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22e85cca-c4dc-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566478537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qFAK3GbGI6Df1K/W1m8iLe+ANgA3o09O5dZrCD0bVtw=;
 b=SqTWdj0IVzgUkvuRdpemg78ONBY8qGgY8pfhoN9BPDjHLr8TvoGnD6Qk
 euXWD9nZ+ZbBQZw6QjGEI96KCG4PcJFPTYsqF56RgZEeM70RqerUp70dx
 AtEuUDZ7xmel0pUDTg9iqP8/b7wSSNYNFtwZIoom/XmO/8zVcUiLjABNc 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lw8HAjDwlEE6dyq44Z4GIiAuk2LvwOHS7rVSDYwozof3mcDhc6wIw6KrCROH+WaR4uxIOEl1hr
 GGjN55I+CyeQ4nlzYm6c/l3BRP+i4ziu1p0+NWMyhVuQHIDoRAfcsiUUMyC3Cla94U/RA6O5TJ
 gTuS8M0nXAHVMveofj/gCUFd4Y060WjRErbSaOazj5JDWSAJR4qnbunShYemgfQirle6FsLC1r
 LRj+PtnV7oLdopKpBcWDB1UsZH7mxGNtHg018DYfZR2ZZINRyAeRFnHV0Vbwhy93tzFVuRfYbg
 6BU=
X-SBRS: 2.7
X-MesageID: 4798381
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4798381"
Date: Thu, 22 Aug 2019 14:55:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190822125528.fzdhu6wjtsg7v2no@Air-de-Roger>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-8-roger.pau@citrix.com>
 <fd889f4b5aad4c3c99af583043b67f2a@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd889f4b5aad4c3c99af583043b67f2a@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 7/7] ioreq: provide support for long-running
 operations...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTE6MTU6NTBBTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyMSBBdWd1c3QgMjAxOSAxNTo1
OQo+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+ID4gQ2M6IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPjsgSmFuIEJldWxpY2gKPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PjsgR2VvcmdlIER1bmxhcAo+ID4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNr
c29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT47Cj4gPiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBUaW0KPiA+
IChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Cj4gPiBTdWJqZWN0OiBbUEFUQ0ggNy83XSBpb3JlcTog
cHJvdmlkZSBzdXBwb3J0IGZvciBsb25nLXJ1bm5pbmcgb3BlcmF0aW9ucy4uLgo+ID4gCj4gPiAu
Li5hbmQgc3dpdGNoIHZQQ0kgdG8gdXNlIHRoaXMgaW5mcmFzdHJ1Y3R1cmUgZm9yIGxvbmcgcnVu
bmluZwo+ID4gcGh5c21hcCBtb2RpZmljYXRpb24gb3BlcmF0aW9ucy4KPiA+IAo+ID4gVGhpcyBh
bGxvd3MgdG8gZ2V0IHJpZCBvZiB0aGUgdlBDSSBzcGVjaWZpYyBtb2RpZmljYXRpb25zIGRvbmUg
dG8KPiA+IGhhbmRsZV9odm1faW9fY29tcGxldGlvbiBhbmQgYWxsb3dzIGdlbmVyYWxpemluZyB0
aGUgc3VwcG9ydCBmb3IKPiA+IGxvbmctcnVubmluZyBvcGVyYXRpb25zIHRvIG90aGVyIGludGVy
bmFsIGlvcmVxIHNlcnZlcnMuIFN1Y2ggc3VwcG9ydAo+ID4gaXMgaW1wbGVtZW50ZWQgYXMgYSBz
cGVjaWZpYyBoYW5kbGVyIHRoYXQgY2FuIGJlIHJlZ2lzdGVycyBieSBpbnRlcm5hbAo+ID4gaW9y
ZXEgc2VydmVycyBhbmQgdGhhdCB3aWxsIGJlIGNhbGxlZCB0byBjaGVjayBmb3IgcGVuZGluZyB3
b3JrLgo+ID4gUmV0dXJuaW5nIHRydWUgZnJvbSB0aGlzIGhhbmRsZXIgd2lsbCBwcmV2ZW50IHRo
ZSB2Y3B1IGZyb20gcnVubmluZwo+ID4gdW50aWwgdGhlIGhhbmRsZXIgcmV0dXJucyBmYWxzZS4K
PiAKPiBSYXRoZXIgdGhhbiBoYXZpbmcgYW5vdGhlciBjYWxsYmFjayBjYW4gdGhlIGhhbmRsZXIg
bm90IGJlIHJlLWNhbGxlZCB3aXRoIHNhbWUgaW9yZXE/IEl0IGNvdWxkIHJldHVybiBkaWZmZXJl
bnQgdmFsdWVzIGRlcGVuZGluZyBvbiB3aGV0aGVyIHRoZXJlIGlzIG1vcmUgd29yayB0byBkbyAo
cmVxdWlyaW5nIGFub3RoZXIgY2FsbCkgb3Igd2hldGhlciBpdCBpcyBkb25lIGFuZCB0aGUgdmNw
dSBjYW4gYmUgcmVzdW1lZC4gV291bGQgdGhhdCB3b3JrPwoKSSBndWVzcyB0aGlzIHdvdWxkIHdv
cmsgYWxzby4gVGhlIGlzc3VlIHdpdGggdGhpcyBhcHByb2FjaCBpcyB0aGF0IEkKd291bGQgaGF2
ZSB0byBmaW5kIHNvbWV3aGVyZSB0byBzdG9yZSB0aGUgaW9yZXEgd2hpbGUgdGhlIG9wZXJhdGlv
biBpcwpiZWluZyBwcm9jZXNzZWQsIHdoaWNoIGlzIG5vdCByZXF1aXJlZCB3aXRoIHRoZSBwcm9w
b3NlZCB0d28gaGFuZGxlcgphcHByb2FjaC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
