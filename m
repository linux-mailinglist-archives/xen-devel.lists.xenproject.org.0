Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955AE6CF40
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:56:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6rK-0003MC-Di; Thu, 18 Jul 2019 13:54:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MdgZ=VP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ho6rI-0003M2-MR
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:54:08 +0000
X-Inumbo-ID: 81a249f4-a963-11e9-9afd-9fb53385587b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81a249f4-a963-11e9-9afd-9fb53385587b;
 Thu, 18 Jul 2019 13:54:05 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ySOz1k3fKGNSjFoClSmyt6PZQtCNd6I3dSQgBeszpkQJQqCo5Ws/jLa4VRmN9nqDxkBzcizJeD
 tPgUPi45RzonNyXPIMtk3eRj64/mGZva2fGq0McUlhsa8tECJ2oyLtpEqzDozUIQXHVxGHqq9I
 /S8SAHZEuJ1VpxS6HYR7Ry2FuYIJ/RXVNMqpntOUFsL+MnZ1R5cGtClBKdtHLpEqGrBzW28Tg4
 vYTPdBlikxSYX5+h2y1fXLkUe2V8UxNGL4ol8R/15USuspSaz4iSOA6YTJWxnv/afjXgfjextQ
 zAo=
X-SBRS: 2.7
X-MesageID: 3199831
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3199831"
Date: Thu, 18 Jul 2019 15:53:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190718135349.jy55c77bl673d3nd@Air-de-Roger.citrite.net>
References: <cover.537da3804adbe71352bed871578f3e893e2210c5.1563325215.git-series.marmarek@invisiblethingslab.com>
 <5c8fb8141c0f92ccaa78cdc169b8544f7634ce65.1563325215.git-series.marmarek@invisiblethingslab.com>
 <20190717102158.y3cp34q7blfslntt@Air-de-Roger.citrite.net>
 <20190718001220.GY1250@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718001220.GY1250@mail-itl>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v5 6/6] tools/libxc: add wrapper for
 PHYSDEVOP_msi_control
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDI6MTI6MjBBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDEyOjIxOjU4UE0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBh
dCAwMzowMDo0NEFNICswMjAwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4g
PiA+IEFkZCBsaWJ4YyB3cmFwcGVyIGZvciBQSFlTREVWT1BfbXNpX2NvbnRyb2wgaW50cm9kdWNl
ZCBpbiBwcmV2aW91cwo+ID4gPiBjb21taXQuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5j
b20+Cj4gPiAKPiA+IExHVE0sIGFsYmVpdCBJIGZpbmQgdGhlIHVzYWdlIG9mIGludCBpbnN0ZWFk
IG9mIHVuc2lnbmVkIGludCBmb3IgdGhlCj4gPiBTQkRGIGtpbmQgb2Ygd2VpcmQsIGJ1dCBpdCdz
IGlubGluZSB3aXRoIHRoZSBvdGhlciBmdW5jdGlvbnMsIHNvIEkKPiA+IGd1ZXNzIHRoZXJlJ3Mg
YSByZWFzb24gZm9yIGl0Pwo+IAo+IFllcywgaXQgd2FzIGJhc2VkIG9uIGxvb2tpbmcgYXQgb3Ro
ZXIgcGxhY2VzLiBCdXQgSSBkb24ndCBrbm93IGlmIHRoZXJlCj4gaXMgYW55IHNwZWNpZmljIHJl
YXNvbiBmb3IgaXQuCgpBbnl3YXksIHNpbmNlIHVzaW5nIHVuc2lnbmVkIG9yIHNpZ25lZCBpcyBu
b3QgcmVhbGx5IHRoYXQgcmVsZXZhbnQKaGVyZSwgYW5kIHNlZWluZyBob3cgb3RoZXIgZnVuY3Rp
b25zIGFyZSBkZWZpbmVkOgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgoKV2l0aCBqdXN0IGEgY291cGxlIG9mIG5pdHM6IHlvdSBkb24ndCBhY3R1
YWxseSBuZWVkIHJjLCB5b3UgY2FuIGp1c3QgYHJldHVybgpkb19waHlzZGV2X29wLi4uYCwgYW5k
IHlvdSBjb3VsZCBhbHNvIGluaXRpYWxpemUgcGh5c2Rldl9tc2lfY29udHJvbAphdCBkZWNsYXJh
dGlvbiwgYnV0IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIG9uIGFueSBvZiB0aG9zZSwg
c28KeW91IGNhbiBrZWVwIHRoZSBSQiByZWdhcmRsZXNzLgoKVGhhbmtzIQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
