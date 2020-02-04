Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD9915221C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 22:53:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz64n-0000wA-UO; Tue, 04 Feb 2020 21:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I1tw=3Y=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iz64l-0000w5-M5
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 21:49:43 +0000
X-Inumbo-ID: 3fa3e0ca-4798-11ea-9026-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fa3e0ca-4798-11ea-9026-12813bfff9fa;
 Tue, 04 Feb 2020 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580852981;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=enOZ6QsNdoW8EkW30E453t0iz+gC477hk2nvfEPryl0=;
 b=EKvycUiMEE1NYUZ38FVGnmYpTbKBB2WGA4y6aNxswcDaSA3JAYhlq/kR
 D9zF7ARQq6JUAmUKIzwyuDbXSKGzLnNiUHkin1kd8ZC4jHM6tKX0EzF9Y
 N1orWuJLXZrL7LjOgWrbf01Q5/FaUics/oIsGHCZMF6MaveLxmcJxu9dP k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
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
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kz8I8NjO3JD/KyyWSZ3bYfq0128PrfeNs0i9CDffFJc3EbcdR5wHRVeAP/0vO4qISan81mt9Ae
 bJHSrABPHZs/f9wiTAIEfbuQKPWK5+OAdLJxb+A4QsplIVu660Fp24h3aHG8bK4A3hPGGnbzfx
 old9NFV08VcLuA9Ka0285/07WmBQDhNhhyeWEIbaILFTwbuq1alQMO1IBYGIm6098pl2kS50cA
 5oWe0IWwYys/B3Dy2lWVqURQOO53czuDqk4x+s4GREiTYiTgBVayLHLhR6M08p1U7z9671SoP8
 Cio=
X-SBRS: 2.7
X-MesageID: 12319354
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,403,1574139600"; d="scan'208";a="12319354"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 21:49:35 +0000
Message-ID: <1580852977-23866-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] PV shim timekeeping fixes
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWdvciBEcnV6aGluaW4gKDIpOgogIHg4Ni9zaGltOiBzdXNwZW5kIGFuZCByZXN1bWUgcGxhdGZv
cm0gdGltZSBjb3JyZWN0bHkKICB4ODYvdGltZTogcmVwb3J0IGNvcnJlY3QgZnJlcXVlbmN5IG9m
IFhlbiBQViBjbG9ja3NvdXJjZQoKIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgfCAgNyArKysrKyst
CiB4ZW4vYXJjaC94ODYvdGltZS5jICAgIHwgMTcgKysrKysrKysrKystLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
