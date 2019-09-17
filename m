Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A956FB53B7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:13:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGzd-0004pb-4f; Tue, 17 Sep 2019 17:10:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGzb-0004pQ-Q3
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:10:19 +0000
X-Inumbo-ID: 063e4e80-d96e-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 063e4e80-d96e-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740219;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=CWrvFLeTRoBIfM6nR0RTetZ/gUHvezk7HnXjka1EaH8=;
 b=Qq3kWHXo7jHkYLDcawNFKf7Hsbk+AQqExlol4jiX8yWnHnuoLE3w/BBo
 CxcbGCfGtFzM296v3ef2B0avGesSEES74B0fgrufDhxCEwiPJZ5xOyzMJ
 plxUORk7yRamRaF7mnST5Au4hHnomxXxTDjFLTJbbxbeEejwXa0XEHydh 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +T7lyMMW0zU0K21cEna6puZBzBHpwm7g0awvbdIkmMFod1/CR/tl76tB+RP8xdUohc2lRLH10B
 vb7SyYsSkuekw0BiRsX6LGnqwqV8LOkmMlI4Q336WSLFuV6oSQpPzvJxG71+ZS4qHk/Em+BIbc
 wD3xMvuWqOBawjfdVxfp7GOj+JG5JumHIE9vn9E/DptsxeHoppVvVQ0fBbtGJZ7azPqPbSRqz1
 JSoNRV69MpChOml5MMBaaeb2eiAPqpUx2O62dE+jWoQ4NZMdY+H7tjMoExuOWcDUV0xhERcbtv
 xfA=
X-SBRS: 2.7
X-MesageID: 5683234
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5683234"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4983.802967.446284@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:10:15 +0100
To: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
 <wl@xen.org>
In-Reply-To: <23937.3912.874830.653579@mariner.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-7-anthony.perard@citrix.com>
 <23937.3912.874830.653579@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 06/35] libxl: Use ev_qmp for
 switch_qemu_xen_logdirty
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCAwNi8zNV0gbGlieGw6IFVzZSBldl9xbXAg
Zm9yIHN3aXRjaF9xZW11X3hlbl9sb2dkaXJ0eSIpOgo+IEFudGhvbnkgUEVSQVJEIHdyaXRlcyAo
IltQQVRDSCAwNi8zNV0gbGlieGw6IFVzZSBldl9xbXAgZm9yIHN3aXRjaF9xZW11X3hlbl9sb2dk
aXJ0eSIpOgo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Cj4gLi4uCj4gPiArICAgIHJjID0gbGlieGxfX2V2X3RpbWVfcmVnaXN0ZXJf
cmVsKGFvLCAmbGRzLT50aW1lb3V0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzd2l0Y2hfbG9nZGlydHlfdGltZW91dCwgMTAgKiAxMDAwKTsKPiA+ICsgICAgaWYg
KHJjKSBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgcW1wLT5hbyA9IGFvOwo+ID4gKyAgICBxbXAt
PmRvbWlkID0gZG9taWQ7Cj4gPiArICAgIHFtcC0+cGF5bG9hZF9mZCA9IC0xOwo+ID4gKyAgICBx
bXAtPmNhbGxiYWNrID0gc3dpdGNoX3FlbXVfeGVuX2xvZ2RpcnR5X2RvbmU7Cj4gPiArICAgIGxp
YnhsX19xbXBfcGFyYW1fYWRkX2Jvb2woZ2MsICZhcmdzLCAiZW5hYmxlIiwgZW5hYmxlKTsKPiA+
ICsgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsIHFtcCwgInhlbi1zZXQtZ2xvYmFsLWRp
cnR5LWxvZyIsIGFyZ3MpOwo+IAo+IEkgaGF0ZSB0byBzdWdnZXN0IHRoaXMgYXQgdGhpcyBzdGFn
ZSwgYnV0OiBtYXliZSB0aGUgdGltZW91dCBjb3VsZCBiZQo+IGluY29ycG9yYXRlZCBpbnRvIGxp
YnhsX19ldl9xbXAgPwo+IAo+IEkgdGhpbmsgZXZlcnkgbGlieGxfX3FtcCBjYWxsZXIgaXMgZ29p
bmcgdG8gbmVlZCBhIHRpbWVvdXQgPwoKSWYgeW91IGFncmVlLCB0aGVuIG1heWJlIGl0IHdvdWxk
IGJlIG1vcmUgY29udmVuaWVudCB0byBkbyB0aGlzIGF0IHRoZQplbmQgb2YgdGhlIHNlcmllcywg
cmF0aGVyIHRoYW4gbWFraW5nIGEgY29tcGxldGUgcmViYXNlIG9mIGl0LgoKQW55d2F5LCBsZXQg
bWUga25vdyB3aGF0IHlvdSB0aGluay4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
