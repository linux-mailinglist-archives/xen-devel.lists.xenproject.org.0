Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BBAB51CD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 17:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAFjW-0005Ie-SH; Tue, 17 Sep 2019 15:49:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAFjU-0005IT-PU
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 15:49:36 +0000
X-Inumbo-ID: bfa90100-d962-11e9-9619-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfa90100-d962-11e9-9619-12813bfff9fa;
 Tue, 17 Sep 2019 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568735376;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=JSQtwZaHMthRHejeE5roK1JwAXWEiweoZzdKOVunYU0=;
 b=FtUpDTrgv+72R9Lkn0HAgloTWYxEMSkfiBraCKQ0RDL2oec14TNUnzoE
 S/TPKbHn8MSjBvGYiR/EHKp5wwOCmlX3d8PaogvOLYL2aDqmYwXonkFxd
 aqyHcZTq+YAw8FJns92NZJFAjYecEQYjPO0OitOnSN/kD6FJTFo+2DkOr M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 19QZ6osgKLwvlvW7ukea17oznn1rsKb8kkQV8hEc56mn8toe3eDdgFwADzq5JajjHdl2pRgaqX
 w7EvOoz38N1vjEZtVpnt4OutxOr5KUbt5DzWFLCbUKco2glSd83OdpSGMfzBxAn+7UBpXavJMf
 fTQIGKfv6usn4VK7jriUZ/90GcTibUYcgvmgGft/Rb0X5FkZLotdYUvLtJwolYICUp+5JImMva
 F2TRVRo/GetZSjxL6Cf9dBdf2hUCmsT58XYdFWMfwO9MDk2g2LU4n2ltkWhQ7XWJrMNik3sm36
 EiY=
X-SBRS: 2.7
X-MesageID: 5931733
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5931733"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.111.256134.571464@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 16:49:03 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614103801.22619-5-anthony.perard@citrix.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
 <20190614103801.22619-5-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 4/9] libxl: Add optimisation to ev_lock
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDQvOV0gbGlieGw6IEFkZCBvcHRpbWlz
YXRpb24gdG8gZXZfbG9jayIpOgo+IEl0IHdpbGwgb2Z0ZW4gYmUgdGhlIGNhc2UgdGhhdCB0aGUg
bG9jayBpcyBmcmVlIHRvIGdyYWIuIFNvIHdlIGZpcnN0Cj4gdHJ5IHRvIGdyYWIgaXQgYmVmb3Jl
IHdlIGhhdmUgdG8gZm9yay4gRXZlbiB0aG91Z2ggaW4gdGhpcyBjYXNlIHRoZQo+IGxvY2tzIGFy
ZSBncmFiYmVkIGluIHRoZSB3cm9uZyBvcmRlciBpbiB0aGUgbG9jayBoaWVyYXJjaHkgKGV2X2xv
Y2sKPiBzaG91bGQgYmUgb3V0c2lkZSBvZiBDVFhfTE9DSyksIGl0IGlzIGZpbmUgdG8gdHJ5IHdp
dGhvdXQgYmxvY2tpbmcuIElmCj4gdGhhdCBmYWlsZWQsIHdlIHdpbGwgcmVsZWFzZSBDVFhfTE9D
SyBhbmQgdHJ5IHRvIGdyYWIgYm90aCBsb2NrIGFnYWluCj4gaW4gdGhlIHJpZ2h0IG9yZGVyLgo+
IAo+IFRoYXQgb3B0aW1pc2F0aW9uIGlzIG9ubHkgZW5hYmxlZCBpbiByZWxlYXNlcyAoZGVidWc9
bikgc28gdGhlIG1vcmUKPiBjb21wbGljYXRlZCBjb2RlIHdpdGggZm9yayBpcyBhY3R1YWxseSBl
eGVyY2lzZWQuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
