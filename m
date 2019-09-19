Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638F0B7FBC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:11:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAzul-0008Mu-Dk; Thu, 19 Sep 2019 17:08:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAzuk-0008Mp-1m
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:08:18 +0000
X-Inumbo-ID: 0eaffc2f-db00-11e9-966e-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0eaffc2f-db00-11e9-966e-12813bfff9fa;
 Thu, 19 Sep 2019 17:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568912891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7dmSscQscWNWn0+KjRmCzSI9Xjxeb0rEa3OlmFLUjGw=;
 b=TQn5N+MR+QWAN6DCsuwlee87gHiJd42s4EhdX6hyDwrfHTRgMl57L/rA
 OtPsMYKfUrbN0F6LGwYz24FaPek8HPBsR3SkVcHbVbKId1C3t5bDOxwvn
 d2g7WU4XBrOmxWBqvLgUi2Y7lBaEKfXXoiH2aSdok5WrE8y6sISjceMpC 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sMgBaxze3X7K/Z9XVjituFSl0Rjf+Pq3ZltVEpKT+dTNvS26j2B9FywitZbtE8wOamE39EjS2Q
 o4NSJG7Mi/IzzLzSMYVQi4G9V9V5FdDSBxek418d5rzAXUn1pflr0s82kISGP53d9sXnvRQJ3Y
 0ekzVALL92Smyky0QQiBsViX46MfpIM2Ikc6i2VofVQ558Abk427H5j0W5H8UcpdbUtf3Qs/zg
 +PrI2VO/9QnMkiiOIL7D7w9SJG5aqryCrMl/0h3zhdVTY8u4yCYPsSLHZDDW4IvV9t/6PTDgNl
 eSQ=
X-SBRS: 2.7
X-MesageID: 6122851
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6122851"
Date: Thu, 19 Sep 2019 18:07:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20190919170758.GV1308@perard.uk.xensource.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 00/15] Some cleanup of libxl
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTI6MjQ6MjlQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gSGksCj4gCj4gVGhpcyBzZXJpZXMgY29udGFpbnMgY2xlYW51cCBwYXRjaGVzLCBh
aGVhZCBvZiBhIHNlcmllcyB0aGF0J3MgZ29pbmcgdG8gbWFrZQo+IG1vcmUgY2hhbmdlcyB0byBs
aWJ4bC4KCnYyIHdpdGggcGF0Y2ggMTEgYWNrZWQgYW5kIHRoZSB3aG9sZSBicmFuY2ggcmViYXNl
ZCBwdXNoZWQgdG86Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVy
YXJkL3hlbi11bnN0YWJsZS5naXQgYnIubGlieGwtY2xlYW51cC12MgoKQWxsIHBhdGNoZXMgYXJl
IGFja2VkLgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
