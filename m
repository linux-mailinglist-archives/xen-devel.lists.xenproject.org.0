Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD81408CF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 12:21:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isPe3-0008V6-6G; Fri, 17 Jan 2020 11:18:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isPe2-0008V1-CH
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 11:18:30 +0000
X-Inumbo-ID: 11b38e58-391b-11ea-9fd7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11b38e58-391b-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 11:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579259902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mD3e+NfJGdQn2RKqNlI+BWWcq0/m77+wduFlyszw6mM=;
 b=fe4e2x3mwGOel642KCiCVulsyNxEiD3hCe/l4/zX3bQV2NOsw0soP7H5
 UY47oLUjTi2/nKSsVSjqqDUeDxzW7rN3TvxlrYwq7i7qojyUjyKJWxTkg
 P8ZeXeHMADI6GHgdsHd84shVxeEUm7/si1urcjyrxGvejg5DneJVpZox4 w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ssNoMDsmvIO9eNS8kVGrE6TCHBsHd+55QLPaxXy9jJW19lMTKVkfoaTL2blZCqzjv6O7jdPJ/M
 CNP5SgmTjjgPcgZM4sO3IGT7v6+AFtDyixj1zr6E9FT3vbB5Q5r3rp45wJjXrY7ky+h5DVqDIR
 E+4fJS7vwMfb7UKd7+B7JsG/pD+/7IkC0Upu/mCnoIzi8BuImlrbfBErwx3971J/pZ3ncwbCmm
 aLOJPP5mT4HZdQrZ8ArvrIbyiWS1lAw0S4G0PK4oWXCGnUsPR/9pN+5knYtxLzmhAHClIhqViR
 HaU=
X-SBRS: 2.7
X-MesageID: 11236395
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11236395"
Date: Fri, 17 Jan 2020 11:18:18 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20200117111818.GC1288@perard.uk.xensource.com>
References: <20200116184527.16193-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116184527.16193-1-ian.jackson@eu.citrix.com>
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Make tools/xl part of
 LIBXENLIGHT stanza
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMDY6NDU6MjdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4geGwgaXMgbWFpbnRhaW5lZCBpbiBwcmFjdGljZSBieSB0aGUgbGlieGwgbWFpbnRhaW5l
cnMuICBUaGUgZWZmZWN0IGlzCj4gc2ltcGx5IHRvIGdyYW50IG1haW50YWluZXJzaGlwIHRvIEFu
dGhvbnkuCj4gCj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IEFudGhvbnkgUEVSQVJE
IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
