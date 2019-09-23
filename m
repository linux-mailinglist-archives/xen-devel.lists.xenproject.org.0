Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF7BB59D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:42:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOZH-0001jL-Rs; Mon, 23 Sep 2019 13:39:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UlS=XS=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iCOZH-0001jE-5a
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:39:55 +0000
X-Inumbo-ID: 9fd8a6c4-de07-11e9-a337-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fd8a6c4-de07-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569245994;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=uXQ53UyfR1VP7FcsJRL9wrHqT/CGNqhd5tyFhiGhI4s=;
 b=WS3tJE7Ql0AeotxX7nRigGIbpfwIlKaFffc7PXqyuSgTZZG9unL2gksE
 3/IRXiFS4GKu8BZ47GopffA6pEcYMHyuljMeI2u3Vevr4niihyY0cjOYn
 jpa1JAweB77WaMX0DxR8yJ6dwwh5taD0LyOPCJDXPH12FNtITc43Bf2Qn U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TFGn32lT09of8/bkyVJpbRqFM857bm/Msxmk1Ah/GQy8NdH7cCQ8ORmduIo2NEszGFlRxCyq0q
 3Xu1MQHz4lhWLd6/6TPBIOZGdRRUYl+GuFk2RrPH+HRs+Ft3Ba3/Z1gU1Mc3HqHPNQ7rodO2AH
 rNGMIZv7WMCr47bZ5BW4MJPAweitn/kYU1j5iI4Fm46lY2zKhappFDWd4xW60QON4vXOC/Hd6W
 5aoOKvPOZsRwc7f2fo2mIApmn/TgpWwe6iRs7sHYtcaEOOv/R89Oqp6x4KEPtjdoEQDv9wWB3+
 ptg=
X-SBRS: 2.7
X-MesageID: 6144691
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="6144691"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23944.52006.924576.833183@mariner.uk.xensource.com>
Date: Mon, 23 Sep 2019 14:39:50 +0100
To: Wei Liu <wl@xen.org>
In-Reply-To: <20190923133507.lmf5l3hnefvwn7lb@debian>
References: <20190923132652.205526-1-anthony.perard@citrix.com>
 <20190923133507.lmf5l3hnefvwn7lb@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: Fix build when LIBXL_API_VERSION is
 set
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4bDogRml4IGJ1aWxkIHdoZW4gTElCWExf
QVBJX1ZFUlNJT04gaXMgc2V0Iik6Cj4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDI6MjY6NTJQ
TSArMDEwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBUaGUgY29tcGF0aWJpbGl0eSBmdW5j
dGlvbiBtaXN0YWtlbmx5IGNhbGxlZCBpdHNlbGYuCj4gPiAKPiA+IEZpeGVzOiA5NTYyN2I4N2Mz
MTU5OTI4NDU4ZWU1ODZlOGM1YzU5M2JkZDI0OGQ4Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogV2VpIExp
dSA8d2xAeGVuLm9yZz4KClRoYW5rcwoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgoKYW5kIHB1c2hlZC4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
