Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B2181D81
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 17:14:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3wG-0004zi-Tw; Wed, 11 Mar 2020 16:10:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ysf6=44=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jC3wF-0004zd-HW
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 16:10:31 +0000
X-Inumbo-ID: d3afbe16-63b2-11ea-b00d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3afbe16-63b2-11ea-b00d-12813bfff9fa;
 Wed, 11 Mar 2020 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583943030;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=/VVEWvKYBXKQktchZj9kVseNU4Fmf6aP+UuCqc76thg=;
 b=DKDyp7K/r9716/nF+cWo+guAJ2ZlAWgp5iBI6z14yr5oepYKo/Lqsmea
 AUUnDtz+VXDvDNJGlrBjohnhBHYBJSoi9RkyzxAPemB2oSMNx23ld5F4z
 gwAOP1s2uNv7dT8wUoqGtoSIsM1hby3R2rrmV1oqgDEyN2AcChnC6yCFf M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FYB0S/N3m0BFei9hn4WQxFzYZz3vfBDN92qj7LvfwSCs+WRtSB906FopFpTmPuSxvFnWhLBbuS
 LXDZskpxWqbkvMy9xkC2kePZoUX7CSjAcfYkWz8h6RM2a+xNwrQLIgsx4S72ISZekyUuu2g93n
 wBknGukuV8UN1bC8H6AUwzwJ/J6CBLv4JuAQU6aeY7wv1NRd+UAVVv9sZOmnPXAkqORDTquiyh
 0i9+1HULW7UlMoEI4Is4BNHFi/0pkF0jaMMeQFGVKCz7xtkckBbY+5361M+C/nESygbNdNnxOV
 eT4=
X-SBRS: 2.7
X-MesageID: 14199795
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14199795"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24169.3422.129391.913692@mariner.uk.xensource.com>
Date: Wed, 11 Mar 2020 16:10:06 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200311160021.6075-3-roger.pau@citrix.com>
References: <20200311160021.6075-1-roger.pau@citrix.com>
 <20200311160021.6075-3-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v4 3/3] make-flight: add dom0 PVH
 test
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHY0IDMvM10gbWFrZS1mbGln
aHQ6IGFkZCBkb20wIFBWSCB0ZXN0Iik6Cj4gQWRkIGEgZG9tMCBQVkggdGVzdCwgdGhlIHRlc3Qg
dG8gYmUgcnVuIGlzIGxhdW5jaGluZyBhIFBWIGd1ZXN0Cj4gKHRlc3QtZGViaWFuKS4gTm90ZSB0
aGUgUFZIIGRvbTAgdGVzdHMgYXJlIG9ubHkgZW5hYmxlZCBmb3IgWGVuID49Cj4gNC4xMy4KClJl
dmlld2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
