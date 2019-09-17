Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB273B535D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:52:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGgG-0008Lk-TE; Tue, 17 Sep 2019 16:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGgF-0008Lb-TO
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:50:19 +0000
X-Inumbo-ID: 34e6d5c0-d96b-11e9-961b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34e6d5c0-d96b-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739010;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=h5MLGSFDZE3XKUpiENIdkcE5ucB0GrSYg/VzC7cNPK0=;
 b=C3JdA4dfmGTJUJJvDiCJIS4Owcl/0Fqv2P1i71JH9TZ5QqpHDWqjruq3
 oay20cLtKdahpgVUMGxE9WlBb4Mf+bi80NHP8pOf7Bd85Ilb2V/TrmMc/
 874oEslRh/sX9Oci8Q+zdGcBUVdmuoNrhMtyfDdFNlinsaUotSvrrWHzm k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kLifpW8aipwuY46uMHtDAEk4KpzxlHxckUd3XHvTdfFaP7IP1VfX+fxyZvKy4ZYsKrDljpg5Ky
 0nLL3J0qfwiOg3WD2ofI0B2elPs4qsk7mctR28/RY9RsDYdzbnY85BCr6Wj49IBqFelYWWhceU
 gVrOIQ4q2+ICAAToYft3Ty9Ja4mhbbbUcpq2WIdcb3ritTwtl20h1qU2MyfdEWu10N/r7FRgXZ
 EQ798mCu98kT8a0CP43sbNVN7tr38u0+XgZDW378YtJedHxjdcE8G48OlEHO9w/wakdhzA0V6I
 +98=
X-SBRS: 2.7
X-MesageID: 5684569
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5684569"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3773.593680.268445@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:50:05 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-2-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-2-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 01/35] libxl: Make libxl_domain_unpause async
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDAxLzM1XSBsaWJ4bDogTWFrZSBsaWJ4bF9k
b21haW5fdW5wYXVzZSBhc3luYyIpOgo+IGxpYnhsX2RvbWFpbl91bnBhdXNlIG5lZWRzIHRvIG1h
a2UgUU1QIGNhbGxzLCB3aGljaCBhcmUgYXN5bmNocm9ub3VzLAo+IGNoYW5nZSB0aGUgQVBJIHRv
IHJlZmxlY3QgdGhhdC4KPiAKPiBEbyB0aGUgc2FtZSB3aXRoIGxpYnhsX2RvbWFpbl9wYXVzZSBh
c3luYywgZXZlbiBpZiBpdCB3aWxsIGtlZXAKPiBjb21wbGV0aW5nIHN5bmNocm9ub3VzbHkuCgpK
b2xseSBnb29kLiAgSSB0aGluaywgdGhvdWdoLCB0aGF0IHRoZXJlIHNob3VsZCBiZSBhIEhBVkVf
Li4uICBmb3IKdGhpcyBzZXQgb2YgQVBJIGNoYW5nZXMuICBJIGRvbid0IG1pbmQgaWYgaXQgZ29l
cyBpbnRvIHRoZSBsYXN0IHBhdGNoCm9yIHRoZSBmaXJzdCBvbmUuICBBc3N1bWluZyB5b3UgYWRk
IHRoYXQgdG8gdGhlIHNlcmllcyBpbiB2MjoKCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
