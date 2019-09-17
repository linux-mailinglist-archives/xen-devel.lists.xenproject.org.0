Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E76B53DC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:19:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAH5L-0005sI-UK; Tue, 17 Sep 2019 17:16:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAH5L-0005sA-36
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:16:15 +0000
X-Inumbo-ID: da0e9ab2-d96e-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da0e9ab2-d96e-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740574;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=yWIYNgKUF0mZYoXOGc7fx2cKLFFIcHe0YFzc5ZEeX30=;
 b=b+Viu1oBP+T36g6g4GB2hlo5GkM0yEOjVv/YT8rOx0z+KDCPKYaeDZlh
 njfnCEqX74Fyu2xcTut4qKkxJiUO9edIhhMTyWhu8hYc5SB+ZvcymozFP
 S4ts1wa0j6+W4b2SW/d/+QUoAgf5/FtLRqysIfosiSagL8xWUxfUseo8e 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qSMKhPSJ1kEcGW0dgai364S0yRa93l7ugYhDGt0eEF67XIkPBiS0BsofUrtL+f+4SRyHQ9r2yb
 GVVQErPnvufKa8FtRA81Aq+6i1cSMm9o/2MKDdK1FLpIfZSr5Q8COAlBI7fcixDSPz5Pk4w+DE
 0nuVbH9bY5S0mnDasN9FBHuNX3KKpYkuxV+zeJaoHW9IkBc5PhDfv6cZxRk5cyTnpN7VfGoPDu
 OHO0CWhbhxu+u0nutZnA7NNzFAewY/aGkJuj8LAkKuRGH+M4wA80nR3U/qHR6fuxaGfzPCHy0Y
 Fis=
X-SBRS: 2.7
X-MesageID: 5992775
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5992775"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.5339.70994.453362@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:16:11 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-27-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-27-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 26/35] libxl_pci: Only check if qemu-dm is
 running in qemu-trad case
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDI2LzM1XSBsaWJ4bF9wY2k6IE9ubHkgY2hl
Y2sgaWYgcWVtdS1kbSBpcyBydW5uaW5nIGluIHFlbXUtdHJhZCBjYXNlIik6Cj4gUUVNVSB1cHN0
cmVhbSAob3IgcWVtdS14ZW4pIG1heSBub3QgaGF2ZSBzZXQgInJ1bm5pbmciIHN0YXRlIGluCj4g
eGVuc3RvcmUuICJydW5uaW5nIiB3aXRoIFFFTVUgZG9lc24ndCBtZWFuIHRoYXQgdGhlIGJpbmFy
eSBpcwo+IHJ1bm5pbmcsIGl0IG1lYW5zIHRoYXQgdGhlIGVtdWxhdGlvbiBoYXZlIHN0YXJ0ZWQu
IFdoZW4gYWRkaW5nIGEKPiBwY2ktcGFzc3Rocm91Z2ggZGV2aWNlIHRvIFFFTVUsIHdlIGRvIHNv
IHZpYSBRTVAsIHdlIGhhdmUgYSBkaXJlY3QKPiBhbnN3ZXIgdG8gd2hldGhlciBRRU1VIGlzIHJ1
bm5pbmcgb3Igbm90LCBubyBuZWVkIHRvIGNoZWNrIGFoZWFkLgo+IAo+IE1vdmluZyB0aGUgY2hl
Y2sgdG8gZG8gaXQgb25seSB3aXRoIHFlbXUtdHJhZCBtYWtlcyB1cGNvbWluZyBjaGFuZ2VzCj4g
c2ltcGxlci4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
