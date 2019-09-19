Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C735B8154
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 21:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB1xA-0006h6-IL; Thu, 19 Sep 2019 19:18:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iB1x8-0006gs-Ic
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 19:18:54 +0000
X-Inumbo-ID: 516c754e-db12-11e9-b76c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 516c754e-db12-11e9-b76c-bc764e2007e4;
 Thu, 19 Sep 2019 19:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568920734;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=X3cGIEWVw2qigUGjHGp+RoAohDTIAaMLiMmqeDzCtg0=;
 b=LhMB/W3l9FApYLbFgtXiZ/ytGG4wmwtfGduKRYPJ+vhB2L9xkKVs53ZT
 YnZQZzubAXRcNhD58eAx2qanwc0j3qXepLnpsCJvYregb7AHhjPAWGl9f
 q/KGYXEsepziG7eYCHc4mXXH6CfMy0DL2bmb8srpXQ+7shHu8JU485SUZ M=;
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
IronPort-SDR: enMMS958SDGU3rXPDoKiO8JgPsX0S7hD8b5Y9qvGZvt2U8eUw3tj1q0yJnVwi9l/0VDd5viLVE
 UZuVOBVNfFMV6yR0hhYXcu6sDcgG40RMXiSYgrlg9aC2d6KMwPalFRsnSO8or/NSITvrTJDtYy
 PPaJLiZlxssLFuCf5H67UkQuC/QPf3Rp1QhHUr2m78TfqYO8+IXXX+lmXPDWfHlWM0h5vVu2F4
 qYbUo9hsXEcvGfqS8AG38cB/MGWJepkgIu99j26crHHZGNiD63/Tqsn6uJ6CUmChmOys8s3VP1
 8as=
X-SBRS: 2.7
X-MesageID: 5807231
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5807231"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.54426.477531.925283@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 20:18:50 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919171656.899649-36-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
 <20190919171656.899649-36-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 35/35] libxl_pci: Extract common part of
 *qemu_trad_watch_state_cb
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDM1LzM1XSBsaWJ4bF9wY2k6IEV4dHJh
Y3QgY29tbW9uIHBhcnQgb2YgKnFlbXVfdHJhZF93YXRjaF9zdGF0ZV9jYiIpOgo+IEZ1bmN0aW9u
cyBwY2lfYWRkX3FlbXVfdHJhZF93YXRjaF9zdGF0ZV9jYiBhbmQKPiBwY2lfcmVtb3ZlX3FlbXVf
dHJhZF93YXRjaF9zdGF0ZV9jYiBhcmUgc2ltaWxhciBzbyB0aGUgY29tbW9uIHBhcnQgaXMKPiBl
eHRyYWN0ZWQgaW4gYSBkaWZmZXJlbnQgZnVuY3Rpb24uCgpPSyAodGhvdWdoIG5vdCBxdWl0ZSBo
b3cgSSB3b3VsZCBoYXZlIGRvbmUgaXQ7IG1heWJlIHNpbXBsZXIgdGhhbiB3aGF0CkkgaGFkIGlu
IG1pbmQpLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
