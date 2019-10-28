Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D44E70B3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:44:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3P0-0006sE-Fj; Mon, 28 Oct 2019 11:41:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP3Oz-0006s1-4Q
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:41:37 +0000
X-Inumbo-ID: e5905014-f977-11e9-beca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5905014-f977-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 11:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572262896;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=GEKsQbQk0bydpohVActFc1VpHzIwT/4AIz3JE473pq4=;
 b=KwnsLelFw23xJancD/QUgt8qwUyekZsS+j3gMaYAD142jfQT3T9mTyMH
 hN2/lk+BYh94DuAkJwGQrp12tnUgUlsn0IEQOOtPbY0chOkwopcIJcW/B
 7n+QYPgp5a9NRgVzNjfpLTx15ylbgsCvF+DaFxhHRDCcjLaGhjVIJXo6d k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QxYRsl5JDb8rdQZRY/mGjl551qYktY0Wjf6FPTWGsAc9DWQ/maBBw5UaaaANWIOMhmMqANWGQs
 2b9Q3ZZ8P9Bp7xSXkzqo77w34TrQAwKxZrFThAFHDdLb7ZKZhVefjifh6TpITVJsJvgKCsHJwN
 fNYv8/uPIdarZ/tz+/IoyLONrKO9TN9n7fnGWjX4VFh6oWMAsg5axNEN+5MLOIH0ew5R7Gcp6M
 9CE60kaV8iU1j2o89ySN1xWe3kypf/I9fpvo2Q4rD4qb7dlVfQSnx+UZ+yMc+P8BUirm1FCs1N
 UOA=
X-SBRS: 2.7
X-MesageID: 7595003
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7595003"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23990.54253.228867.367013@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 11:41:33 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191025170505.2834957-5-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <20191025170505.2834957-5-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 4/4] libxl_qmp: Have a lock
 for QMP socket access
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1JGQyBYRU4gUEFUQ0ggZm9yLTQuMTMgNC80XSBsaWJ4
bF9xbXA6IEhhdmUgYSBsb2NrIGZvciBRTVAgc29ja2V0IGFjY2VzcyIpOgo+IEZJWE1FOiBUaGUg
Y2FzZSB3aGVyZSBzb21ldGhpbmcgZmFpbGVkIHdoZW4gdHJ5aW5nIHRvIGFjcXVpcmVkIHRoZQo+
ICAgIGxvY2sgaXNuJ3QgaGFuZGxlZCB5ZXQuCgpUaGlzIHBhdGNoIHNlZW1zIHRvIGNvbnRhaW4g
cm91Z2hseSB0aGUga2luZCBvZiB0aGluZ3MgSSB3b3VsZCBleHBlY3QuCgpCZWNhdXNlIG9mIHRo
YXQgRklYTUUgSSB0aGluayBpdCB3b3VsZCBub3QgbWFrZSBzZW5zZSBmb3IgbWUgdG8gcmV2aWV3
Cml0IGluIGRldGFpbCwgYXMgSSB3b3VsZCBwcm9iYWJseSB0cmlwIHVwIG92ZXIgdGhhdCB0b28g
bXVjaC4KCkFsc28gd2Ugc2hvdWxkIGRlY2lkZSBpZiB5b3UgbGlrZSBhbnkgb2YgbXkgYWx0ZXJu
YXRpdmUgd29ya2Fyb3VuZApzdWdnZXN0aW9ucy4uLgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
