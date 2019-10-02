Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DE0C4B1D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbYz-0002Sd-8G; Wed, 02 Oct 2019 10:08:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xXQL=X3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFbYy-0002SY-5A
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:08:52 +0000
X-Inumbo-ID: a19185f2-e4fc-11e9-9712-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id a19185f2-e4fc-11e9-9712-12813bfff9fa;
 Wed, 02 Oct 2019 10:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570010930;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YuJxf6Aauh5TojdYVUX3T4vGooxCY7Ml9U+5zeMcA7M=;
 b=ZTfHAl8FzCK/XFoOFTyaPmB6ljV6QlWWHt0V7E95F5/F88KL5pmXU7or
 sd7uMBm/uP2EnX7JFrvGWpp6L+yC1dOLbYiv9ZV4DjJXYD0jN1gPw3c7w
 VPbP2xh1vqKPPhGrcD0t9ceZDUrn1aIJ5oIFEn+YL6oIiEVwEzLSjOmbT U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VgSYf8PwujT2Kjqhc6jq4zZKw6x5bVssXLBFZmT5FHRy1aHvx4rGKkjbKSgO2WIood4p+T0Nzl
 xh+11+BoYADPyBVsuc92Nu6DrnuF1FcVdXVG+A745UHQUt1dq+X88r2FvtFhbCqUfbRi9jxW1P
 HjxHYpEjzIcIIv6k0tUFoxbCVs4RtcQsXnoJHIOhQOIbhEcVmKn/LZPuyhhtk13XIV7ffzvWLp
 gH2oCCmmz6Nmt7KEY4gX7Vf1NgNdSRyjjfcTaQ126shR7BKyFLE8yCeUTqqGMsBLGX4WGHTw8z
 IOo=
X-SBRS: 2.7
X-MesageID: 6713263
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,574,1559534400"; 
   d="scan'208";a="6713263"
Date: Wed, 2 Oct 2019 12:08:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20191002100843.dq3m53awg22dcrj7@Air-de-Roger>
References: <20191001152233.55491-1-roger.pau@citrix.com>
 <20191001164407.GJ1163@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001164407.GJ1163@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] libxl: wait for the ack when issuing
 power control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkaW5nIEp1ZXJnZW4gZm9yIGEgcmVsZWFzZS1hY2suCgpPbiBUdWUsIE9jdCAwMSwgMjAxOSBh
dCAwNTo0NDowN1BNICswMTAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBPbiBUdWUsIE9jdCAw
MSwgMjAxOSBhdCAwNToyMjozM1BNICswMjAwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBD
dXJyZW50bHkgb25seSBzdXNwZW5kIHBvd2VyIGNvbnRyb2wgcmVxdWVzdHMgd2FpdCBmb3IgYW4g
YWNrIGZyb20gdGhlCj4gPiBkb21haW4sIHdoaWxlIHBvd2VyIG9mZiBvciByZWJvb3QgcmVxdWVz
dHMgc2ltcGx5IHdyaXRlIHRoZSBjb21tYW5kIHRvCj4gPiB4ZW5zdG9yZSBhbmQgZXhpdC4KPiA+
IAo+ID4gSW50cm9kdWNlIGEgMSBtaW51dGUgd2FpdCBmb3IgdGhlIGRvbWFpbiB0byBhY2tub3ds
ZWRnZSB0aGUgcmVxdWVzdCwgb3IKPiA+IGVsc2UgcmV0dXJuIGFuIGVycm9yLiBUaGUgc3VzcGVu
ZCBjb2RlIGlzIHNsaWdodGx5IG1vZGlmaWVkIHRvIHVzZSB0aGUKPiA+IG5ldyBpbmZyYXN0cnVj
dHVyZSBhZGRlZCwgYnV0IHNob3VsZG4ndCBoYXZlIGFueSBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+
IAo+ID4gRml4IHRoZSBvY2FtbCBiaW5kaW5ncyBhbmQgYWxzbyBwcm92aWRlIGEgYmFja3dhcmRz
IGNvbXBhdGlibGUKPiA+IGludGVyZmFjZSBmb3IgdGhlIHJlYm9vdCBhbmQgcG93ZXJvZmYgbGli
eGwgQVBJIGZ1bmN0aW9ucy4KPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxy
b3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IFRoYW5rcywKPiAKPiAtLSAKPiBB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
