Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C64515802E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 17:52:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1CGl-0003Pq-JD; Mon, 10 Feb 2020 16:50:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8uky=36=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1CGk-0003Pl-V2
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:50:46 +0000
X-Inumbo-ID: 7affd5ca-4c25-11ea-b472-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7affd5ca-4c25-11ea-b472-bc764e2007e4;
 Mon, 10 Feb 2020 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581353445;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=UpaILLrxg7DxkYIHQ3fszR9NK2gxSCaddUlKsLdbTBc=;
 b=OwvYRswjaoeBYFk1cLoEbPvOZbKfcZY7j4uMXBwLtYIP08/lOgkCOxzt
 pN3lfjKEHMtEJP0bDzXzdCt9x3iC4XV3b2TEdGVZpJEuqww2wbaIoKfJZ
 ZQf2QoNIeJ+0EYftIQwgvJ9GiTsHHIs+Ed0Stih2dHbjPLyepKdT5VQqr s=;
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
IronPort-SDR: Li1ySQHxS7ERDXWLrm0qokzL9WBvW+F6JVrf121ewzT2wJcM9Py21mT5u2yfC2Z98PWp6XId25
 DIIlnXwH2jnlR7VYxEG/8ESBZ+3jR47ubic1T1MPVRpv69/l/RRZCKIRE+ifzs1uYPaJqqrRra
 VQvpCXcIjqRCmaf3VlywO2DWCmv+Q7hW0g0umn7qUoZaBH7v0mJdrCsBF7vO/i/qkUstg/Cm/I
 TCQhYW1ArnkeuSY+5KYTGgbxfrmGt3mkyQ8rTwFHW7B9eu4WGBiKiQAHxtCyPK0mAyZcHO/M6h
 nRo=
X-SBRS: 2.7
X-MesageID: 12587075
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12587075"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24129.35298.625207.191002@mariner.uk.xensource.com>
Date: Mon, 10 Feb 2020 16:50:42 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20200120100935.1003223-1-anthony.perard@citrix.com>
References: <20200120100935.1003223-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH] ts-xen-build-prep: Install
 python3-dev
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW09TU1RFU1QgUEFUQ0hdIHRzLXhlbi1idWlsZC1wcmVw
OiBJbnN0YWxsIHB5dGhvbjMtZGV2Iik6Cj4gQWxsb3cgdG8gYnVpbGQgWGVuIHdpdGggcHl0aG9u
My4KPiAKPiBBbHNvLCBRRU1VIHVwc3RyZWFtICh0byBiZSA0LjMpIG5vdyByZXF1aXJlcyBweXRo
b24gPj0gMy41LCBidXQgdGhhdAo+IGFmZmVjdCBvbmx5IHhlbi11bnN0YWJsZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCkFj
a2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkFuZCBwdXNo
ZWQgdG8gcHJldGVzdC4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
