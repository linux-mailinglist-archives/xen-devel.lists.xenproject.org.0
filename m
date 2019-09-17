Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E7B5350
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:47:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGbN-0006rx-Jx; Tue, 17 Sep 2019 16:45:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGbL-0006rS-TL
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:45:15 +0000
X-Inumbo-ID: 85e6a2da-d96a-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85e6a2da-d96a-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738715;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=e403iLBAeIYQl3pJ9iq4pkhCTS4lba70fXR7bds67cE=;
 b=A1+ECAPPBeq7rYxgDMZ5kYvl0uOsJWv07Mpu53L+5icR0PZ9HEZwK8AG
 Ik7Z1EKdYTDG7o/Wmz0fg9eRTPNnaimbSm4SeXkNOYjYk6kzr4voi+PHA
 K01gkWzOVuhJ+7bY6BbABaIblD8WPV4x10rLPx5gLnIhY41iPEGSVj3TG Y=;
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
IronPort-SDR: KjTnQvVw5eSTr3j9pEUChP0xne1sfiPoUUDUJ7fTbTTMeFGeARBaetX5lkr7pzlON7c+3IyDIK
 mPkJ/Jtd8u71SUZavfaO4jUTri/xDgHIJDlkkKi3c3vuIqWkNfQHObWLFQKsCbRJZ+zUSVV4aL
 S+9vf+ADaV3AAg95RQqoN7al5HEbl/4pqlaEo5G8txlDdznTT98D1qJ7/4AofsHy+XnvzDr0x6
 nZQDI1Q8jjYDPIUXFO1l3ZpWq7AUuGTTm6D1IwjX053Wa1embSAn/42fdVv9atM/ydo2Xz4nnc
 7jc=
X-SBRS: 2.7
X-MesageID: 5681884
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5681884"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3480.14447.646020@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:45:12 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-14-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-14-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 13/15] libxl: Constify libxl_device_* param
 of *_getinfo
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDEzLzE1XSBsaWJ4bDogQ29uc3RpZnkgbGli
eGxfZGV2aWNlXyogcGFyYW0gb2YgKl9nZXRpbmZvIik6Cj4gVGhlIGxpYnhsX2RldmljZV9UWVBF
IHBhcmFtZXRlciBvZiBhbGwgdGhlIGxpYnhsX2RldmljZV9UWVBFX2dldGluZm8KPiBmdW5jdGlv
biBzZWVtcyB0byBiZSBvbmx5IHVzZWQgYXMgaW5wdXQgdG8gZmluZCBtb3JlIGluZm9ybWF0aW9u
IHRvIGJpCj4gc3RvcmVkIGluIHRoZSBsaWJ4bF9UWVBFaW5mbyBwYXJhbWV0ZXIuCj4gCj4gTWFr
ZSBzdXJlIHRoaXMgaXMgYWx3YXlzIHRydWUgYW5kIGNvbnN0aWZ5IHRoZSBpbnB1dCBwYXJhbWV0
ZXIgdG8gYXZvaWQKPiBmdXJ0aGVyIG1pc3Rha2UuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
