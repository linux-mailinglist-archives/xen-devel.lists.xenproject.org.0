Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC69182E6B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 12:00:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLXf-0003E2-8d; Thu, 12 Mar 2020 10:58:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URUF=45=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCLXe-0003Dn-3N
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 10:58:18 +0000
X-Inumbo-ID: 60b39024-6450-11ea-b34e-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60b39024-6450-11ea-b34e-bc764e2007e4;
 Thu, 12 Mar 2020 10:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584010697;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=5xlLpQS942Zp54z24NQdDEJRIbxs8FLo/9xaUKyKeXs=;
 b=Aqpz1IUKYtpv8FoWhoTTyG9h6iPilSeO7CTSd2a2QB1LgOfivA0EgP/a
 Y3L50UfZq2/BgWFxUGVdMk9VM39ZwXdAtcMju6VwbEJcvjZJWV6Us+r3s
 YGuRw81/1iekWjYfh0P25kSdKlLkgMV7/S6lhmyTAl7nfAvIbkbfJpb1Z 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sRoml9I5mVDmBpiJHyKPElypsTcRZriBHgLZPYyengMwm62BMW51sto31JyeoD1Gl4CLfuASOH
 WHVXUX/tSmNloZz7MD/CJ+WQddOS5r3Wypm99S6tsrYp5d7RdCH5pKeCwx+hBlIPRCkHP7KRdx
 /oKb2OMn3TVSlhdDljh9W6nS6QtZUdcSY/31uUmF9/wuVrmGD/OGm23U/IzqIomTJ/xMTeb9lL
 r5It2P1uZbZF9X1ePuqSz1gyqxMKXKeebdae/QAP7xsjNZjcCsFp7zHwcQxEkonF1X+vgxYhfH
 RUE=
X-SBRS: 2.7
X-MesageID: 14248345
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="14248345"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24170.5572.773410.768227@mariner.uk.xensource.com>
Date: Thu, 12 Mar 2020 10:58:12 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200311172010.7777-3-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
 <20200311172010.7777-3-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v5 3/5] ts-examine-hostprops-save:
 record hostflags also
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

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHY1IDMvNV0gdHMtZXhhbWlu
ZS1ob3N0cHJvcHMtc2F2ZTogcmVjb3JkIGhvc3RmbGFncyBhbHNvIik6Cj4gQ29tbWl0IHB1dGF0
aXZlIGhvdGZsYWdzIGludG8gdGhlIGRhdGFiYXNlIGlmIHByZXNlbnQgb24gdGhlIHJ1bnZhcnMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
