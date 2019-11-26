Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB610A064
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:35:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbtq-000215-5D; Tue, 26 Nov 2019 14:33:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3zt1=ZS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iZbto-00020v-QW
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:33:04 +0000
X-Inumbo-ID: a79135be-1059-11ea-9db0-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79135be-1059-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574778784;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qRLqhCrdFkoDDbk1sd2LyKQxZ9rVARSP+1TcQQm5EcQ=;
 b=Se6rBp1xbBIm07TOIq6wAAuku64zc1KS65UOj/GomBS+yr76eJTyaAI/
 D69Esy67yaZOTSfQP73tqpFUHSlwAghbt8oqwDf1rsUs1AvXVqXKdf+zK
 Q5uDK59ltJqU+fi9zMZfYNu1u9N5yhPdP23kvMyWeHkk0yzcuzef8xcK+ I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ra/lejn67Y5z3mbI5+L4wlnSZBx7BdTVSkhRclO1a34Ssub0vfk9dD6bziuloaTARABfpvFeYc
 QMVY58PXDiPNYUnl6eIfkoVs6ncupY6zBIwVAR4r+zySPypF8lDKjVtGJ7up5Y5ytibZvVpVGW
 FsoKE5rgdL+qDKC1LIA6No5MNey1ZlzNS4uApDfHOCmjFDPQrzsKquF+yBOaDGu0zE3BgdXdDG
 uyE6cX4TsB+rOFMzkRb3Zo73RF4pZlqlRob7LQN3MPNG3leUgnafYVTo9qFjuQ/2x7GzkMHTtN
 xWw=
X-SBRS: 2.7
X-MesageID: 9261720
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="9261720"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20191126122511.7409-1-wipawel@amazon.de>
 <20191126122511.7409-7-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <dc05070e-196a-1920-f7d1-58759d0bb08d@citrix.com>
Date: Tue, 26 Nov 2019 14:33:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191126122511.7409-7-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 6/7] livepatch-build: Strip transient or
 unneeded symbols
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
Cc: mpohlack@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjYvMTkgMTI6MjUgUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IEluIHRo
ZSBwcm9jZXNzIG9mIGNyZWF0aW5nIGEgZmluYWwgaG90cGF0Y2ggbW9kdWxlIGZpbGUgbWFrZSBz
dXJlIHRvCj4gc3RyaXAgYWxsIHRyYW5zaWVudCBzeW1ib2xzIHRoYXQgaGF2ZSBub3QgYmVlbiBj
YXVnaHQgYW5kIHJlbW92ZWQgYnkKPiBjcmVhdGUtZGlmZi1vYmplY3QgcHJvY2Vzc2luZy4gRm9y
IG5vdyB0aGVzZSBhcmUgb25seSB0aGUgaG9va3MKPiBrcGF0Y2ggbG9hZC91bmxvYWQgc3ltYm9s
cy4KPiAKPiBGb3IgYWxsIG5ldyBvYmplY3QgZmlsZXMgdGhhdCBhcmUgY2FycmllZCBhbG9uZyBm
b3IgdGhlIGZpbmFsIGxpbmtpbmcKPiB0aGUgdHJhbnNpZW50IGhvb2tzIHN5bWJvbHMgYXJlIG5v
dCBzdHJpcHBlZCBhbmQgbmVpdGhlciBhcmUgYW55Cj4gdW5uZWVkZWQgc3ltYm9scy4gU3RyaXAg
dGhlIHRyYW5zaWVudCBob29rcyBzeW1ib2xzIGV4cGxpY2l0bHkgZnJvbQo+IHJlc3VsdGluZyBv
YmplY3QgZmlsZS4KPiBBZGQgYSBuZXcgb3B0aW9uICctLXN0cmlwJyB0byBhZGRpdGlvbmFsbHkg
c3RyaXAgYWxsIHVubmVlZGVkIHN5bWJvbHMKPiBmcm9tIG5ldyBvYmplY3QgZmlsZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+
IC0tLQpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
