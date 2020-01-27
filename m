Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC714A78A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:51:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6dL-00028P-3x; Mon, 27 Jan 2020 15:49:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ksAf=3Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iw6dJ-00028K-Pl
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:49:01 +0000
X-Inumbo-ID: 8946cda0-411c-11ea-aecd-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8946cda0-411c-11ea-aecd-bc764e2007e4;
 Mon, 27 Jan 2020 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580140140;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=WtyFBh/ssX8h21kFlKH+3smOochqtHveofe5VahOFlU=;
 b=Xoo7eQmUEC2btsm74UY0VmIyOuSb1uWLqY4jHhnNJY7EUet7hSOmHHV0
 WaB8HMM0qEkA4IGSt4tORNyKqegemIUoy+iCd5pgEJ0NAeaP9pkApfe6P
 T8EPq4EKvDblSsQTUN20XJbAH6k+xLnLfP6An5ed9hmBRxtneWj40jspZ k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vLry4uvYp2GcJ9+dlvGZ/m5EbZKaJWugRKA6NDFKoWuN39MhlFJ7tkiJzunJLYiAWuFh10w+hK
 SuF3MdxyGa9IOboW2m6HWVwLupuFwMtGfl7VLhFw5Bla7blJA31H85NsD9ybaId+1zlkfmJrfT
 /2m8W1L5z+zVboHqoHOksX/X+Ii1d4D9zTiHnwtxvWlicwd2C4XZxkz5DOtKDmE7xVyHoOjUeP
 dV9b/yDQdmoLsWg/b+UqYJHF0qPJ/AN3fwx+AtsTxABCOL23sxPU5URJ0gvwcmpMF7LCEmuid1
 fFk=
X-SBRS: 2.7
X-MesageID: 12098614
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="12098614"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24111.1639.549900.153818@mariner.uk.xensource.com>
Date: Mon, 27 Jan 2020 15:48:55 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <51a28485-c692-21e9-32a2-24cbb77f7d50@suse.com>
References: <20200127151907.2877-1-pdurrant@amazon.com>
 <24111.734.509410.455377@mariner.uk.xensource.com>
 <51a28485-c692-21e9-32a2-24cbb77f7d50@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] docs: retrospectively add XS_DIRECTORY_PART
 to the xenstore protocol...
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1BBVENIXSBkb2NzOiByZXRyb3NwZWN0aXZlbHkg
YWRkIFhTX0RJUkVDVE9SWV9QQVJUIHRvIHRoZSB4ZW5zdG9yZSBwcm90b2NvbC4uLiIpOgo+IE9u
IDI3LjAxLjIwIDE2OjMzLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IFBhdWwgRHVycmFudCB3cml0
ZXMgKCJbUEFUQ0hdIGRvY3M6IHJldHJvc3BlY3RpdmVseSBhZGQgWFNfRElSRUNUT1JZX1BBUlQg
dG8gdGhlIHhlbnN0b3JlIHByb3RvY29sLi4uIik6Cj4gPj4gLi4uIHNwZWNpZmljYXRpb24uCj4g
Pj4KPiA+PiBUaGlzIHdhcyBhZGRlZCBieSBjb21taXQgMGNhNjRlZDggInhlbnN0b3JlOiBhZGQg
c3VwcG9ydCBmb3IgcmVhZGluZwo+ID4+IGRpcmVjdG9yeSB3aXRoIG1hbnkgY2hpbGRyZW4iIGJ1
dCBub3QgYWRkZWQgdG8gdGhlIHNwZWNpZmljYXRpb24gYXQgdGhhdAo+ID4+IHBvaW50LiBBIHZl
cnNpb24gb2YgeGVuc3RvcmVkIHN1cHBvcnRpbmcgdGhlIGNvbW1hbmQgd2FzIGZpcnN0IHJlbGVh
c2VkCj4gPj4gaW4gWGVuIDQuOS4KPiA+IAo+ID4gVGhhbmtzIGZvciBkb2N1bWVudGluZyB0aGlz
LiAgQSBkb2NzIGZpeCBsaWtlIHRoaXMgc2hvdWxkIGJlCj4gPiBiYWNrcG9ydGVkIGlmIGl0IGFw
cGxpZXMsIElNTy4KPiA+IAo+ID4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgo+ID4gQmFja3BvcnQ6IDQuOSsKPiA+IAo+ID4gSSB3aWxsIGNvbW1pdCBp
dCB0byBzdGFnaW5nIG1vbWVudGFyaWx5Lgo+ID4gCj4gPj4gK0RJUkVDVE9SWV9QQVJUCQk8cGF0
aD58PGluZGV4fD4JCTxjaGlsZC1sZWFmLW5hbWU+fCoKPiA+PiArCVBlcmZvcm1zIHRoZSBzYW1l
IGZ1bmN0aW9uIGFzIERJUkVDVE9SWSwgYnV0IHJldHVybnMgYQo+ID4+ICsJc3ViLWxpc3Qgb2Yg
Y2hpbGRyZW4gc3RhcnRpbmcgYXQgPGluZGV4PiBpbiB0aGUgb3ZlcmFsbAo+ID4+ICsJY2hpbGQg
bGlzdCBhbmQgbGVzcyB0aGFuIG9yIGVxdWFsIHRvIFhFTlNUT1JFX1BBWUxPQURfTUFYCj4gPj4g
KwlvY3RldHMgaW4gbGVuZ3RoLiBJZiA8aW5kZXg+IGlzIGJleW9uZCB0aGUgZW5kIG9mIHRoZQo+
ID4+ICsJb3ZlcmFsbCBjaGlsZCBsaXN0IHRoZW4gdGhlIHJldHVybmVkIHN1Yi1saXN0IHdpbGwg
YmUKPiA+PiArCWVtcHR5Lgo+ID4gCj4gPiBJIHdvbmRlciBpZiBpdCBzaG91bGQgYmUgc29tZWhv
dyBtYWRlIG1vcmUgZXhwbGljaXQgdGhhdCBgaW5kZXgnIGlzIGEKPiA+IGNvdW50IG9mIGRpcmVj
dG9yeSBlbnRyaWVzLCBub3QgYnl0ZXMuICBNYXliZSB0aGlzIGlzIG9idmlvdXMuCj4gCj4gQnV0
IHRoaXMgaXMgd3JvbmcuIEl0IGlzIGJ5dGVzLCBhbmQgdGhlIGdlbmVyYXRpb24gY291bnQgcmV0
dXJuZWQgaXMKPiBtaXNzaW5nIChzZWUgbXkgb3JpZ2luYWwgcGF0Y2ggYmFjayBpbiAyMDE3KS4K
ClNvcnJ5IGZvciBiZWluZyB0b28gcXVpY2suICBJIGhhdmUgcmV2ZXJ0ZWQgbXkgY29tbWl0LgoK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
