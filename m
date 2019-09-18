Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F69B6193
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:42:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXMx-0001dW-QI; Wed, 18 Sep 2019 10:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bm4j=XN=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAXMw-0001dD-6R
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:39:30 +0000
X-Inumbo-ID: 9795f080-da00-11e9-962b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9795f080-da00-11e9-962b-12813bfff9fa;
 Wed, 18 Sep 2019 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568803169;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=O2f1TIyG4EqRQB9BDqiCo0cNw/qZD4hUx+hq/DdLONQ=;
 b=Of3pnrBJhJ7pjDkC88PByc7LTO1FQ0FQQKmZJq2lHWHH0zWg0PeDkyx/
 G1jAhUuE1zvg/gfQDVk1zmeGx6X3VJ8areG7ajWzQptCrNK4FIUItkSw1
 WUHGP+rrlSqicLXgxFltMhx7PYc/V8jDwcYT5X1AnkbLq61mvt3EsC369 o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yhPbBUKsMrZXeXHysVhSzPIyMR3tJpWzoC2H8o/f0DUPzHqfRXi1l93sO2j0DcI5s12T/AE3GR
 zJAS7vo3/sWkSRBe+C7Cnc4K5a3fC+rSBsOXy+y6ldY4dt0tmrnFPua71xXEa+OtLIV+hTgdiW
 UuJpvLDb0SbSjnBOvrOO7BIqnxfwbDNHbvgWKaH+NXz5eA3ewQFVBN2fcZG6vzPUojYCYaC/Cm
 7tLbvL6fMb37J30q9pwmaJM0Rs99UBXRvWNGCoKvSAw5W+D2vhJ7a8NvimsnDwucI0afWTi0eJ
 GXs=
X-SBRS: 2.7
X-MesageID: 5777315
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="5777315"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23938.2393.151318.84429@mariner.uk.xensource.com>
Date: Wed, 18 Sep 2019 11:39:21 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190918095924.GJ1308@perard.uk.xensource.com>
References: <20190614103801.22619-1-anthony.perard@citrix.com>
 <20190614103801.22619-4-anthony.perard@citrix.com>
 <23936.65374.447070.19120@mariner.uk.xensource.com>
 <20190918095924.GJ1308@perard.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 3/9] libxl_internal: Introduce
 libxl__ev_lock for devices hotplug via QMP
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2MiAzLzldIGxpYnhsX2ludGVybmFs
OiBJbnRyb2R1Y2UgbGlieGxfX2V2X2xvY2sgZm9yIGRldmljZXMgaG90cGx1ZyB2aWEgUU1QIik6
Cj4gT24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDQ6NDQ6MzBQTSArMDEwMCwgSWFuIEphY2tzb24g
d3JvdGU6Cj4gPiBJIHdvbmRlciBpZiB0aGlzIGlzIHRoZSByaWdodCBuYW1lIGZvciB0aGlzLiAg
RWZmZWN0aXZlbHkgeW91IGhhdmUKPiA+IGNhbGxlZCB0aGlzIGxvY2sgImxvY2siLiAgTWF5YmUg
ImRsb2NrIiBvciAiZGV2bG9jayIgb3IgInNkbG9jayIgKHNsb3cKPiA+IGRldmljZSBsb2NrKSBv
ciBzb21ldGhpbmcgPyAgU29ycnkgZm9yIGJpa2VzaGVkZGluZyBidXQgaG9wZWZ1bGx5Cj4gPiBz
ZWRkZXJ5IHdpbGwgYmUgZWFzeS4KPiAKPiAiZGV2bG9jayIgc291bmRzIGZpbmUuIFNvIHdlJ2xs
IGhhdmUgImxpYnhsX19ldl9kZXZsb2NrIgo+IGFuZCAibGlieGxfX2V2X2RldmxvY2tfZ2V0Ii4K
Ck9LLgoKR3JlYXQsIHRoYW5rcy4gIEknbGwgbG9vayBmb3J3YXJkIHRvIHRoZSByZXNwaW4uCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
