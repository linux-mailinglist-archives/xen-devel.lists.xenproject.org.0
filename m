Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D7B12B5E5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 17:35:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iksXn-0001cN-09; Fri, 27 Dec 2019 16:32:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFv7=2R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iksXm-0001bx-32
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 16:32:54 +0000
X-Inumbo-ID: 7c819ee3-28c6-11ea-9c5f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c819ee3-28c6-11ea-9c5f-12813bfff9fa;
 Fri, 27 Dec 2019 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577464355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KpXSVE5BD9xL0ESmBCruHN0JZhx3S2/cBBvZyKeM778=;
 b=dSXVELGFWg9iqaPnFC434R4KfqNlfzorcSuul05/KC6WTd5bDEAfKWJ5
 EFEd/qe/ZPlvohxpBVONYJoCjOO3bjymmpkTKfMJwYuy2aUG6jyTBVreq
 mLnzB/lvfBPi7KgD/fN4lptwGq0d5xmN7hTf7cojPv9Sf+t9J5eSgbcy9 I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lFqdGYZRAkWx2v2MYHXHE5zWQZx9wjcwHgKU17dShv9N2UhcBOuw77MXTusC18FzaePFgQMIDQ
 ZkJHJZofRZ2drx9L0f49c4R6PoZNT6STiFx1lQbIb2DTVP9xuv/YqA9Uqa4vWDnEgaTRrOw1Fc
 BGBxW+8qL7V5rtlDzgQ6i+DrFcrnARXyGxV7Tg4+vSPp9eHbNam1/0M9bidkfkPQquTREWbi1s
 EhpBWyrFCuV4vJnoJKxAspU97OLKZ7Ktjhu2TUfwhX95hKUdOMPxS3ugozAyNhwkkzHXxkDKzp
 /Xo=
X-SBRS: 2.7
X-MesageID: 10626143
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10626143"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 16:32:22 +0000
Message-ID: <20191227163224.4113837-7-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227163224.4113837-1-george.dunlap@citrix.com>
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 7/9] golang/xenlight: Default loglevel to DEBUG
 until we get everything working
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgot
LS0KClRoZSBvdGhlciBvcHRpb24gd291bGQgYmUgdG8gZXhwb3NlIHRoZSBYVEwgbG9nZ2luZyBs
ZXZlbHMgYW5kIGxldCB0aGUKY2FsbGVyIHNldCB0aGVtIHNvbWVob3cuCgpDQzogTmljayBSb3Ni
cm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28g
Yi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggYzgwZjYyMmU2Yi4uZTEx
NTU5MjI1NyAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCisr
KyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODUsNyArODUsNyBAQCB0
eXBlIENvbnRleHQgc3RydWN0IHsKIGZ1bmMgTmV3Q29udGV4dCgpICgqQ29udGV4dCwgZXJyb3Ip
IHsKIAl2YXIgY3R4IENvbnRleHQKIAotCWN0eC5sb2dnZXIgPSBDLnh0bF9jcmVhdGVsb2dnZXJf
c3RkaW9zdHJlYW0oQy5zdGRlcnIsIEMuWFRMX0VSUk9SLCAwKQorCWN0eC5sb2dnZXIgPSBDLnh0
bF9jcmVhdGVsb2dnZXJfc3RkaW9zdHJlYW0oQy5zdGRlcnIsIEMuWFRMX0RFQlVHLCAwKQogCiAJ
cmV0IDo9IEMubGlieGxfY3R4X2FsbG9jKCZjdHguY3R4LCBDLkxJQlhMX1ZFUlNJT04sIDAsCiAJ
CSgqQy54ZW50b29sbG9nX2xvZ2dlcikodW5zYWZlLlBvaW50ZXIoY3R4LmxvZ2dlcikpKQotLSAK
Mi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
