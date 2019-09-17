Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2FB533E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:43:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGXX-0005oo-Bk; Tue, 17 Sep 2019 16:41:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGXV-0005oZ-TC
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:41:17 +0000
X-Inumbo-ID: f7f72db4-d969-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7f72db4-d969-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568738477;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=41WL0DCE7SJ0oo5D6YQQg97POmxGf3MGV2bkr7/J1bY=;
 b=XZUTLzmFaC0Cwtr2iL6Q/treHlTQ7XObA+zWl/Uk1mO1zsm9tYrHz6Ug
 U/oF6SjiTP5M7opSKQHmSarqMnXVc1gojTNTsG1MurE7fUxmlFQLKgYgL
 QqurRPKBh1aHqMkqfVgnh5UC07KxDwVk2UbIYbSJT7QKe1X61+7EEl4Zc Q=;
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
IronPort-SDR: f6uLPcJLE2A6jU0Aep6MoR8ypD8a9tiwUpEYgPjNmQvoIi9ollJfttULXy45dxIsDY9pEZmMi4
 aShDXhDTphmnaDRrm8KTC+xILZkYa/B+FpoLCsHkb+hhDWZBiRd5PsfxwtDFmcnKyOf1jLRRLj
 Qz4bDUFn5uUzEfdzKd5vnGfyAcWXNSZjdJ+yC9F/CNmhORShNDLmGAQhmN6qEtWEmwqOj/49B7
 r4TtsXpP0ygkdl6CEGSQyMj8R7B0/LeSG7LO6cFTzbzit3/J+7CArmIw2AVuybUau5OihHRHNY
 e+g=
X-SBRS: 2.7
X-MesageID: 5741089
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5741089"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3241.212872.633952@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:41:13 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190614112444.29980-5-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
 <20190614112444.29980-5-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 04/15] libxl_pci: Constify arg `pcidev' of
 libxl__device_pci_add_xenstore
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA0LzE1XSBsaWJ4bF9wY2k6IENvbnN0aWZ5
IGFyZyBgcGNpZGV2JyBvZiBsaWJ4bF9fZGV2aWNlX3BjaV9hZGRfeGVuc3RvcmUiKToKPiBsaWJ4
bF9fZGV2aWNlX3BjaV9hZGRfeGVuc3RvcmUgZG9lc24ndCBtb2RpZnkgYHBjaWRldicsIHNvIGl0
IGNhbiBiZQo+IGNvbnN0aWZpZWQuIEFsc28sIHdlIGRvbid0IG5lZWQgcGNpZGV2X3NhdmVkIGFu
eW1vcmUsIHNvIHJlbW92ZSB0aGUKPiBzYXZlZCBjb3B5LiAoZGV2aWNlX2FkZF9kb21haW5fY29u
ZmlnIGlzIGdvaW5nIHRvIG1ha2UgaXQncyBvd24gY29weQo+IGFueXdheS4pCj4gCj4gVG8gYWNo
aWV2ZSB0aGlzLCBjb25zdGlmeSBwY2lkZXYgaW4gYWxsIGZ1bmN0aW9ucyB0aGF0Cj4gbGlieGxf
X2RldmljZV9wY2lfYWRkX3hlbnN0b3JlIGNhbGxzLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
