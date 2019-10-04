Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A41CC1B8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 19:26:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGRJ8-0006um-PV; Fri, 04 Oct 2019 17:23:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGRJ6-0006ug-NS
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 17:23:56 +0000
X-Inumbo-ID: be33665a-e6cb-11e9-80e3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be33665a-e6cb-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570209835;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8NJRgPzwZbdgrxrueBYH/2S1e7V8cg8TR7MuY3dJ7KY=;
 b=R16DhUl351fwW2F+BLqAMhNdj3PykuqFM2hOa4PWWuw4Yq3izbBiuKkU
 R8GKX4fL4nYxc2DwjGLSnydcGffgJEr7iuQhpuU6LsW8+R0SWtMGhojEL
 41R9aKcHTOAeHJaNzh7JzeuI8UdyJvtVvt7YMOm23zqyD5wUI0NcVRjCz s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: X6dSmBN6cj0l/Wc2C/Uv8+9AvogdURIq9N+YcmNK6zGi79Zb34F5CI7c2pwjAeRdD9IBb/UPzP
 uHKl0muuSgJwIQXIl3UT4mNkMu0KZznFapezePJe0OqQc76je0l2AqlyVzs9Yb+/wA5qy04vNl
 3SpFr3Wyl0tDd5g+Oav3/3GwaxUAE4rcY6T4WigDXJt1XmMfhzqFkIRb+PTeOlUH9sfVISPNfr
 WRij6D7P1yZ83QypiibNZzw+0pCRo/ytheEfpkUfIwkWzvU8XuNkNTPCrC26VI/YkjbcQaJdpo
 to8=
X-SBRS: 2.7
X-MesageID: 6739951
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,257,1566878400"; 
   d="scan'208";a="6739951"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23959.32798.263057.440385@mariner.uk.xensource.com>
Date: Fri, 4 Oct 2019 18:23:42 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191004171928.GO1163@perard.uk.xensource.com>
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
 <20191004151707.24844-6-ian.jackson@eu.citrix.com>
 <20191004171928.GO1163@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 5/6] libxl: Move shadow_memkb
 and iommu_memkb defaulting into libxl
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYRU4gUEFUQ0ggZm9yLTQuMTMgNS82XSBsaWJ4
bDogTW92ZSBzaGFkb3dfbWVta2IgYW5kIGlvbW11X21lbWtiIGRlZmF1bHRpbmcgaW50byBsaWJ4
bCIpOgo+IE9uIEZyaSwgT2N0IDA0LCAyMDE5IGF0IDA0OjE3OjA2UE0gKzAxMDAsIElhbiBKYWNr
c29uIHdyb3RlOgo+ID4gQEAgLTg2Miw2ICs4NjQsMzAgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRl
X2Rlc3RydWN0aW9uX2NiKGxpYnhsX19lZ2MgKmVnYywKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGlieGxfX2RvbWFpbl9kZXN0cm95X3N0YXRlICpkZHMsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCByYyk7Cj4gPiAgCj4gPiAr
c3RhdGljIF9Cb29sIG9rX3RvX2RlZmF1bHRfbWVta2JfaW5fY3JlYXRlKGxpYnhsX19nYyAqZ2Mp
Cj4gCj4gSXMgdGhlcmUgYSByZWFzb24gdG8gdXNlIF9Cb29sIGluc3RlYWQgb2YgYGJvb2wnPyBJ
dCB3b3VsZCBiZSB0aGUgZmlyc3QKPiBfQm9vbCBpbiBsaWJ4bC4KCkkgaGFkIHRoZSB3cm9uZyBo
ZWFkIG9uLiAgKEkndmUgYmVlbiB3cml0aW5nIGNvZGUgcmVjZW50bHkgd2hlcmUKYGJvb2wnIHdh
c24ndCBhdmFpbGFibGUuKQoKPiA+ICsgICAgcmV0dXJuIENUWC0+bGlieGxfZG9tYWluX25lZWRf
bWVtb3J5XzB4MDQxMjAwX2NhbGxlZCAmJgo+ID4gKyAgICAgICAgICAhQ1RYLT5saWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnlfY2FsbGVkOwo+IAo+IEkgdGhpbmsgdGhlIGxvZ2ljIGhlcmUgaXMgaW52
ZXJ0ZWQuCgpZb3UgYXJlIHJpZ2h0LgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
