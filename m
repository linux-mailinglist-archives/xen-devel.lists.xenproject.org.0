Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D4127ADB
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 13:17:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiHBj-0007QH-Ia; Fri, 20 Dec 2019 12:15:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiHBh-0007QC-Vq
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:15:22 +0000
X-Inumbo-ID: 6426bb4c-2322-11ea-9344-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6426bb4c-2322-11ea-9344-12813bfff9fa;
 Fri, 20 Dec 2019 12:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576844120;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ttTPZ6MIFvAzHcxZ8eYi9Or/icezj84Dk2tAtBSSyZY=;
 b=WNM7fxYA7JzGdhJo0ZW9Jf++HTTaMd45v6yvA96It+VDJszDdbaWQvKu
 ICogG1i8+L0G34WzHytbAxd2v83+EfGM8ZG5Awe0wNzp1pPO6aR/6sgkh
 AubC4LsWmNOBfJDvhpsDYT/kbuWzL6DaKn/8k8IBcbiC80ApRNAP1dy2a 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pxACrvWotvmIJRFUtcCQosmRlkCD4S6AJZfbTQtjLpHn59BRv6DrcIOK1Yb8YV3wqELclueVpV
 OlFvdtFrKMbWxQZHGRsPFMf9M4AGy6p68bR9tG1kXios6oCrZKupImjY1uyd9OQyirKK5IOIqh
 i2YHLhaWqPJ5j2IHOwiFsvdKMgVaN3Dpluvse6j5DF6NywkmrkNV8WIeZHLVZQqJCNWnrGAzqn
 H3qoJFCAgCobixKt0Bf9TCo1JIF5IhWzlO0SOiPmYmqe0KtpZJEFCOvh7vZgkGJQMgfn91oFTC
 EIk=
X-SBRS: 2.7
X-MesageID: 10351013
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,335,1571716800"; d="scan'208";a="10351013"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24060.47957.650158.319649@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 12:15:17 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191219182442.7232-1-andrew.cooper3@citrix.com>
References: <20191219140656.9906-1-andrew.cooper3@citrix.com>
 <20191219182442.7232-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/1] libxc: Drop other examples of the 'goto
 x; } else if' antipattern
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMi8xXSBsaWJ4YzogRHJvcCBvdGhlciBleGFt
cGxlcyBvZiB0aGUgJ2dvdG8geDsgfSBlbHNlIGlmJyBhbnRpcGF0dGVybiIpOgo+IE5vbmUgb2Yg
dGhlc2UgYXJlIGJ1Z2d5LCBidXQgdGhlIHJlc3VsdGluZyBjb2RlIGlzIG1vcmUgcm9idXN0Lgo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
