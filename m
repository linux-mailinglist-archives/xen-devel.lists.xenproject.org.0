Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B334E8A9F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:19:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSJM-0006nw-SE; Tue, 29 Oct 2019 14:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BagA=YW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iPSJL-0006nn-HG
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:17:27 +0000
X-Inumbo-ID: d521d77c-fa56-11e9-a531-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d521d77c-fa56-11e9-a531-bc764e2007e4;
 Tue, 29 Oct 2019 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572358647;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ORFT6Hruk5ZmNevoQk4Kq0f9VZ9zRCMzPkl9LxcqK9o=;
 b=DNDU2CoQoeHxArpJAHUgpKTJN1Jbzr1u3IDYKMXyC36LAd6VFz4YqTcw
 iT2/ixThl4JlE+RzMIcpCOhIXrXNo7lpTbUUnH70q6dtTjPuJYCpb6Ja0
 5ly8bMdAEzcjyXaZg1+co97roJyo03r8WMdsvMwHs3uDfHul0nQQMNhMj c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rhWcpXJk4XaMhTJqCcTKNVcilw+XKFoeDXOGcsfVqCDJOXrwFpvFZIi29iMOFHBpGwumhWtFBC
 zkbOPxYiUWkT4+OMkz3B4OtgZ7ub7+Sv9QUyBWIQ7/if6Y2XfSnTqfiPyl8RDkDL+SjihDXOOj
 iXj0QLmlVkxaissaHJ0OPpHPEoBS8ijN907CBOsj6cWXRSsfFSuHVkcqPIoA53rU/4hjYWcWiX
 qNCsZ3gR2tsskQJOUF99LAdcHjI9jmAHyAQKgPRroOPkgzDmByQeL7tTa1F1fmBAFqmjrhnMn9
 WXY=
X-SBRS: 2.7
X-MesageID: 7561387
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,244,1569297600"; 
   d="scan'208";a="7561387"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23992.18931.163311.536583@mariner.uk.xensource.com>
Date: Tue, 29 Oct 2019 14:17:23 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191028170107.GC1162@perard.uk.xensource.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <20191025170505.2834957-2-anthony.perard@citrix.com>
 <23990.53361.316758.473175@mariner.uk.xensource.com>
 <20191028170107.GC1162@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 1/4] libxl: Introduce
 libxl__ev_child_kill
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtSRkMgWEVOIFBBVENIIGZvci00LjEzIDEvNF0g
bGlieGw6IEludHJvZHVjZSBsaWJ4bF9fZXZfY2hpbGRfa2lsbCIpOgouLi4KPiA+ID4gKyAgICBp
ZiAoc3RhdHVzKSB7Cj4gPiA+ICsgICAgICAgIGxpYnhsX3JlcG9ydF9jaGlsZF9leGl0c3RhdHVz
KENUWCwgWFRMX0VSUk9SLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAia2lsbGVkIGZvcmsgKGR5aW5nIGFzIGV4cGVjdGVkKSIsCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpZCwgc3RhdHVzKTsKPiA+ID4gKyAgICB9IGVs
c2Ugewo+ID4gPiArICAgICAgICBMT0coREVCVUcsICJraWxsZWQgY2hpbGQgZXhpdCBjbGVhbmx5
LCB1bmV4cGVjdGVkIik7Cj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBlbnRpcmVseSB1
bmV4cGVjdGVkLiAgTWF5YmUgdGhlIGNoaWxkIHdhcyBqdXN0Cj4gPiBleGl0aW5nIGF0IHRoZSBw
b2ludCB3aGVyZSBsaWJ4bF9fZXZfY2hpbGRfa2lsbCB3YXMgY2FsbGVkLgo+ID4gCj4gPiBBbmQs
IHBsZWFzZSBjaGVjayBsb2cgdGhlIGFjdHVhbCB3aG9sZSBleGl0IHN0YXR1cy4gICJzdGF0dXMi
IGlzIGEKPiA+IHdhaXQgc3RhdHVzLiAgV2Ugd2FudCB0byBrbm93IHdoYXQgc2lnbmFsIGl0IGRp
ZWQgZnJvbSwgd2hldGhlciBpdAo+ID4gY29yZSBkdW1wZWQsIHRoZSBleGl0IHN0YXR1cywgZXRj
LiAgUHJvYmFibHksIHlvdSBzaG91bGQgY2FsbAo+ID4gbGlieGxfcmVwb3J0X2NoaWxkX2V4aXRz
dGF0dXMuCj4gCj4gSXQgZG9lcyA7LSkuCgpPaC4gIEVyci4gIFllcy4KCj4gICBCdXQgSSBndWVz
cyBJIGNvdWxkIGNhbGwgbGlieGxfcmVwb3J0X2NoaWxkX2V4aXRzdGF0dXMoKQo+IHVuY29uZGl0
aW9uYWxseSwgc28gZXZlbiBpZiBzdGF0dXM9MC4KCkkgdGhpbmsgdGhhdCB3b3VsZCBiZSBmaW5l
LiAgSSdtIG5vdCBzdXJlIHRoaXMgY29kZSBrbm93cyB3aGF0IHNldCBvZgpleGl0IHN0YXR1c2Vz
IGFyZSBwbGF1c2libGUgc28gSSB0aGluayBjYWxsaW5nIGFsbCBraW5kcyBvZiBleGl0CmBleHBl
Y3RlZCcgc2VlbXMgYmVzdCB0byBtZS4KCj4gPiA+IEBAIC0xODkxLDcgKzE4OTEsOCBAQCBzdGF0
aWMgYm9vbCBhb193b3JrX291dHN0YW5kaW5nKGxpYnhsX19hbyAqYW8pCj4gPiA+ICAgICAgICog
ZGVjcmVtZW50IHByb2dyZXNzX3JlcG9ydHNfb3V0c3RhbmRpbmcsIGFuZCBjYWxsCj4gPiA+ICAg
ICAgICogbGlieGxfX2FvX2NvbXBsZXRlX2NoZWNrX3Byb2dyZXNzX3JlcG9ydHMuCj4gPiA+ICAg
ICAgICovCj4gPiA+IC0gICAgcmV0dXJuICFhby0+Y29tcGxldGUgfHwgYW8tPnByb2dyZXNzX3Jl
cG9ydHNfb3V0c3RhbmRpbmc7Cj4gPiA+ICsgICAgcmV0dXJuICFhby0+Y29tcGxldGUgfHwgYW8t
PnByb2dyZXNzX3JlcG9ydHNfb3V0c3RhbmRpbmcKPiA+ID4gKyAgICAgICAgfHwgYW8tPm91dHN0
YW5kaW5nX2tpbGxlZF9jaGlsZDsKPiA+ID4gIH0KPiA+IAo+ID4gSSB3b25kZXIgaWYgdGhpcyBz
aG91bGQgZ2FpbiBhIG5ldyBkZWJ1ZyBtZXNzYWdlLiAgSWYgdGhlIGNoaWxkIGdldHMKPiA+IGxv
c3Qgb3Igc3R1Y2sgZm9yIHNvbWUgcmVhc29uLCBpdCB3aWxsIG90aGVyd2lzZSByZXF1aXJlIHNl
YXJjaGluZyB0aGUKPiA+IHBhc3QgbG9nIHRvIGZpbmQgb3V0IHdoeSB0aGUgYW8gZG9lc24ndCBy
ZXR1cm4uCj4gCj4gRG8geW91IG1lYW4gYWRkaW5nIGEgZGVidWcgbWVzc2FnZSBpbiBsaWJ4bF9f
ZXZfY2hpbGRfa2lsbF9kZXJlZ2lzdGVyKCk/Cj4gSXQncyBwcm9iYWJseSBhIGdvb2QgaWRlYS4K
Li4uCj4gT3Igc2hvdWxkIHdlIGFsc28gYWRkIGEgZGVidWcgbG9nIGluIGxpYnhsX19hb19jb21w
bGV0ZSgpID8KClRoZSBsYXR0ZXIsIHllcy4gIEJlY2F1c2UgdGhhdCBoYXBwZW5zIGF0IHRoZSBw
b2ludCB3aGVyZSB0aGUgQU8gaXMKb3RoZXJ3aXNlIGNvbXBsZXRlLiAgU28gaWYgb25lIGlzIHJl
YWRpbmcgdGhlIGxvZyB0byB0cnkgdG8gZmluZCBvdXQKd2h5IHRoZSB0aGluZyBoYXNuJ3QgY29t
cGxldGVkIHRoZSBkZWJ1ZyBsb2cgd2lsbCBhY3R1YWxseSBzYXkKc29tZXRoaW5nIGFib3V0IGl0
IHdoZXJlIHlvdSdyZSBsb29raW5nLCByYXRoZXIgdGhhbiBtaWxlcyBhd2F5CnNvbWV3aGVyZSBp
biB0aGUgc2Nyb2xsLgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
