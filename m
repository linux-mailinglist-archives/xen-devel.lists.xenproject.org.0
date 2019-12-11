Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA911A94E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 11:54:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iezaU-0005Ff-L7; Wed, 11 Dec 2019 10:51:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iezaT-0005Fa-N3
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 10:51:21 +0000
X-Inumbo-ID: 29fc6e32-1c04-11ea-8afa-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29fc6e32-1c04-11ea-8afa-12813bfff9fa;
 Wed, 11 Dec 2019 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576061480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J+PK3N2DJUzzO10QyyTksvnTB34xRI+UojvMhxm4WZ0=;
 b=EV/+ve2G/8QJeYLA7LaomTwiOj0IYAtOGAIBKGFg071X5xbVUgYBmx65
 shKvnZN+iup4/W8j7uTjraGKQJehgzifHUL6c7yisjlto71lW160pWKvI
 ExPZfqrvgrj63CzcCZG28I4DFpfQB6l3hGPiBcyUHezj44ZcoWIDXTvIG A=;
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
IronPort-SDR: UaTPJrU6Egt4MzstMZP2BNtNuKuboOoXdnOUwOxPyxOAurYNp5lQ953Z2Mu2RNKwSKe73nbzFX
 lmMrDjwxQ39Fpbotfj0c5eI/3u7Z15FTP0oJIu6fNh/T7r/IExQqEBAn/Y1QBC8k9Cn71eqjfu
 6YfqGztP9OeKbVnz+E3HbbZwXhwW64CuY5eujohC6K69HYCCe7EdPaQx0A0Q9xMInzohlyKGuD
 d4R+vLHwYGZbKR76cXYf3UFbIKZvb2u/q5EM4F4s23eBIRej4lYIjTk3c2euOUYeo1TFPs+q3D
 0eU=
X-SBRS: 2.7
X-MesageID: 9925700
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9925700"
Date: Wed, 11 Dec 2019 11:51:12 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191211105112.GK980@Air-de-Roger>
References: <20191210101635.GD980@Air-de-Roger>
 <20191211035058.11479-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211035058.11479-1-sj38.park@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v5 1/2] xenbus/backend: Add memory pressure
 handler callback
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
Cc: axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDQ6NTA6NThBTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBPbiBUdWUsIDEwIERlYyAyMDE5IDExOjE2OjM1ICswMTAwICJSb2dlciBQYXUgTW9u
bsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS94ZW4veGVuYnVzLmggYi9pbmNsdWRlL3hlbi94ZW5idXMuaAo+ID4gPiBpbmRleCA4Njlj
ODE2ZDVmOGMuLmNkYjA3NWU0MTgyZiAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS94ZW4veGVu
YnVzLmgKPiA+ID4gKysrIGIvaW5jbHVkZS94ZW4veGVuYnVzLmgKPiA+ID4gQEAgLTEwNCw2ICsx
MDQsNyBAQCBzdHJ1Y3QgeGVuYnVzX2RyaXZlciB7Cj4gPiA+ICAJc3RydWN0IGRldmljZV9kcml2
ZXIgZHJpdmVyOwo+ID4gPiAgCWludCAoKnJlYWRfb3RoZXJlbmRfZGV0YWlscykoc3RydWN0IHhl
bmJ1c19kZXZpY2UgKmRldik7Cj4gPiA+ICAJaW50ICgqaXNfcmVhZHkpKHN0cnVjdCB4ZW5idXNf
ZGV2aWNlICpkZXYpOwo+ID4gPiArCXVuc2lnbmVkICgqcmVjbGFpbSkoc3RydWN0IHhlbmJ1c19k
ZXZpY2UgKmRldik7Cj4gPiAKPiA+IC4uLiBoZW5jZSBJIHdvbmRlciB3aHkgaXQncyByZXR1cm5p
bmcgYW4gdW5zaWduZWQgd2hlbiBpdCdzIGp1c3QKPiA+IGlnbm9yZWQuCj4gPiAKPiA+IElNTyBp
dCBzaG91bGQgcmV0dXJuIGFuIGludCB0byBzaWduYWwgZXJyb3JzLCBhbmQgdGhlIHJldHVybiBz
aG91bGQgYmUKPiA+IGlnbm9yZWQuCj4gCj4gSSBmaXJzdCB0aG91Z2h0IHNpbWlsYXJseSBhbmQg
c2V0IHRoZSBjYWxsYmFjayB0byByZXR1cm4gc29tZXRoaW5nLiAgSG93ZXZlciwKPiBhcyB0aGlz
IGNhbGxiYWNrIGlzIGNhbGxlZCB0byBzaW1wbHkgbm90aWZ5IHRoZSBtZW1vcnkgcHJlc3N1cmUg
YW5kIGFzayB0aGUKPiBkcml2ZXIgdG8gZnJlZSBpdHMgbWVtb3J5IGFzIG1hbnkgYXMgcG9zc2li
bGUsIEkgY291bGRuJ3QgZWFzaWx5IGltYWdpbmUgd2hhdAo+IGtpbmQgb2YgZXJyb3JzIHRoYXQg
bmVlZCB0byBiZSBoYW5kbGVkIGJ5IGl0cyBjYWxsZXIgY2FuIG9jY3VyIGluIHRoZSBjYWxsYmFj
aywKPiBlc3BlY2lhbGx5IGJlY2F1c2UgY3VycmVudCBibGtiYWNrJ3MgY2FsbGJhY2sgaW1wbGVt
ZW50YXRpb24gaGFzIG5vIHN1Y2ggZXJyb3IuCj4gU28sIGlmIHlvdSBhbmQgb3RoZXJzIGFncmVl
LCBJIHdvdWxkIGxpa2UgdG8gc2ltcGx5IHNldCB0aGUgcmV0dXJuIHR5cGUgdG8KPiAndm9pZCcg
Zm9yIG5vdyBhbmQgZGVmZXIgdGhlIGVycm9yIGhhbmRsaW5nIHRvIGEgZnV0dXJlIGNoYW5nZS4K
ClllcywgSSBhbHNvIHdvbmRlcmVkIHRoZSBzYW1lLCBidXQgc2VlaW5nIHlvdSByZXR1cm5lZCBh
biBpbnRlZ2VyIEkKYXNzdW1lZCB0aGVyZSB3YXMgaW50ZXJlc3QgaW4gcmV0dXJuaW5nIHNvbWUg
a2luZCBvZiB2YWx1ZS4gSWYgdGhlcmUncwpub3RoaW5nIHRvIHJldHVybiBsZXQncyBqdXN0IG1h
a2UgaXQgdm9pZC4KCj4gPiAKPiA+IEFsc28sIEkgdGhpbmsgaXQgd291bGQgcHJlZmVyYWJsZSBm
b3IgdGhpcyBmdW5jdGlvbiB0byB0YWtlIGFuIGV4dHJhCj4gPiBwYXJhbWV0ZXIgdG8gZGVzY3Jp
YmUgdGhlIHJlc291cmNlIHRoZSBkcml2ZXIgc2hvdWxkIGF0dGVtcHQgdG8gZnJlZQo+ID4gKGll
OiBtZW1vcnkgb3IgaW50ZXJydXB0cyBmb3IgZXhhbXBsZSkuIEknbSBob3dldmVyIG5vdCBhYmxl
IHRvIGZpbmQKPiA+IGFueSBleGlzdGluZyBMaW51eCB0eXBlIHRvIGRlc2NyaWJlIHN1Y2ggcmVz
b3VyY2VzLgo+IAo+IFllcywgc3VjaCBleHRlbnRpb24gd291bGQgYmUgdGhlIHJpZ2h0IGRpcmVj
dGlvbi4gIEhvd2V2ZXIsIGJlY2F1c2UgdGhlcmUgaXMgbm8KPiBleGlzdGluZyBMaW51eCB0eXBl
IHRvIGRlc2NyaWJlIHRoZSB0eXBlIG9mIHJlc291cmNlcyB0byByZWNsYWltIGFzIHlvdSBhbHNv
Cj4gbWVudGlvbmVkLCB0aGVyZSBjb3VsZCBiZSBtYW55IGRpZmZlcmVudCBvcGluaW9ucyBhYm91
dCBpdHMgaW1wbGVtZW50YXRpb24KPiBkZXRhaWwuICBJbiBteSBvcGluaW9uLCBpdCBjb3VsZCBi
ZSBhbHNvIHBvc3NpYmxlIHRvIHNpbXBseSBhZGQgYW5vdGhlcgo+IGNhbGxiYWNrIGZvciBhbm90
aGVyIHJlc291cmNlIHR5cGUuICBUaGF0IHNhaWQsIGJlY2F1c2UgY3VycmVudGx5IHdlIGhhdmUg
YW4KPiB1c2UgY2FzZSBhbmQgYW4gaW1wbGVtZW50YXRpb24gZm9yIHRoZSBtZW1vcnkgcHJlc3N1
cmUgb25seSwgSSB3b3VsZCBsaWtlIHRvCj4gbGV0IGl0IGFzIGlzIGZvciBub3cgYW5kIGRlZmVy
IHRoZSBleHRlbnNpb24gYXMgYSBmdXR1cmUgd29yaywgaWYgeW91IGFuZAo+IG90aGVycyBoYXZl
IG5vIG9iamVjdGlvbi4KCkFjaywgY2FuIEkgcGxlYXNlIGFzayB0aGUgY2FsbGJhY2sgdG8gYmUg
bmFtZWQgcmVjbGFpbV9tZW1vcnkgb3Igc29tZQpzdWNoIHRoZW4/CgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
