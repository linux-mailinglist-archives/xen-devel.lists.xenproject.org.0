Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE94E20F5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJoR-0007O1-ML; Wed, 23 Oct 2019 16:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNJoQ-0007Ns-Fb
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:48:42 +0000
X-Inumbo-ID: f7956bee-f5b4-11e9-8aca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7956bee-f5b4-11e9-8aca-bc764e2007e4;
 Wed, 23 Oct 2019 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571849321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZYTzn5O48B3iY841/piidmycHXTvRCe/DVdR+RGMjkE=;
 b=bWxSLQX2fN3VfkT3sgEo2jlv7x9mVEd9UweBk6jgalV5v8ZH5jwbT7d6
 co62wvNZfQ8xLQXE46vKqpLDl9TLDIiXYMd/fHXG0713cXd8pblFc+AUL
 wQKwyPcxjePc5A/llJGJhiZvueeXDGRPXcTU6c8GORl2oq2sJjhWIij9h 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qWiFIBRKQejgETHiIT0InDgQpjmBdkj0g+LtLnd29Xy0zXsA6tHybVS+Mj2FHSwhljh0kUd94k
 uBd9ocrhYdZX/Up+PLtMLbvB2VNBwLeIuGIZkjlqYkTLXj1ATDRH8MBkglUESDKzzJGAA9JAfn
 9atfD1T6G4Hyb/BWdAJqfHKBup4fhy2gAMHw+8bvFHGtW3gsOxcuVkGdO/ambaJyj6UfS3aoZi
 1XSxYjGSrN25RYjTQLG44yDWJx1ASS2Jiqz8PURyk3mwPsDKBlbGIBORZ4Mavm53upny04vGjN
 Za4=
X-SBRS: 2.7
X-MesageID: 7778029
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7778029"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:19 +0100
Message-ID: <20191023164837.2700240-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 05/23] xen: Kbuild: Remove extra
 -include from C flags
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

S2J1aWxkIGluY2x1ZGVzIGxpbnV4L2NvbXBpbGVyX3R5cGVzLmggaW50byB0aGUgQ0ZMQUdTIGxp
c3QsIGJ1dCBYZW4KZG9uJ3QgbmVlZCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL3NjcmlwdHMvTWFrZWZpbGUu
bGliIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hl
bi9zY3JpcHRzL01ha2VmaWxlLmxpYiBiL3hlbi9zY3JpcHRzL01ha2VmaWxlLmxpYgppbmRleCA0
MWM1MGY5NDYxZTUuLmI3NDYxOTliN2Y2YiAxMDA2NDQKLS0tIGEveGVuL3NjcmlwdHMvTWFrZWZp
bGUubGliCisrKyBiL3hlbi9zY3JpcHRzL01ha2VmaWxlLmxpYgpAQCAtMTYwLDcgKzE2MCw2IEBA
IGVuZGlmCiBlbmRpZgogCiBjX2ZsYWdzICAgICAgICA9IC1XcCwtTUQsJChkZXBmaWxlKSAkKE5P
U1RESU5DX0ZMQUdTKSAkKExJTlVYSU5DTFVERSkgICAgIFwKLQkJIC1pbmNsdWRlICQoc3JjdHJl
ZSkvaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oICAgICAgIFwKIAkJICQoX2NfZmxhZ3Mp
ICQobW9ka2Vybl9jZmxhZ3MpICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogCQkgJChiYXNl
bmFtZV9mbGFncykgJChtb2RuYW1lX2ZsYWdzKQogCi0tIApBbnRob255IFBFUkFSRAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
