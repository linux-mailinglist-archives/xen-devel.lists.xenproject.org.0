Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE850FE11C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:23:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdPJ-0004F4-9m; Fri, 15 Nov 2019 15:21:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o1em=ZH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVdPH-0004Ep-23
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:21:07 +0000
X-Inumbo-ID: 8ae55982-07bb-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ae55982-07bb-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 15:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573831266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jxLr3dRvoJ0YgA3j3ttCXl5unDAnvqYdSIPwv2EFCAw=;
 b=Di8xYi8I7IiugZVYd3Y1T/YY1OmpjraV4WFtR36Y9Qz/Bojt/cZDOK4m
 M3h+pFA2b1xXR0SHwT80FLiANEj50L/GezfCy6nhe9YbV7dQKSxExp/Gt
 vwN4XzsAabccXCHGSYnSdOBefs+h+TMkm8LM3Lw2DwNfhsznh33auf1Db Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TAREgFVphBkpn8toib7zsWDexA0fWVxeuxpmFhgdciY0fSTRXltzYRUWkLhteh6T5sGCP6RZz1
 3A0Gtnfu2o+YGapVJP4WRLUJFm20voub8qw8PEcl/fg9Ns62qw/PFXd7WvBL6UNppqk/YYKtxD
 dhTMBDiGQJYpknTQ4EfVfnNp6s039p9w/TcJ9hG4YgV66upLvb61flzod/Jp2Kgw8mBW+9dzjj
 Qx1yeKmevKSLsy02qWKRl18QPs9f1LROUWpoJEYaG1d+BppM6FkVRpTazKFu9Dday9tc+Dkgy6
 pGY=
X-SBRS: 2.7
X-MesageID: 8388239
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8388239"
Date: Fri, 15 Nov 2019 16:20:58 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191115152058.GJ72134@Air-de-Roger>
References: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
 <20191115143959.GI72134@Air-de-Roger>
 <5ee086c8-3527-99e6-aad6-238f031dd41f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ee086c8-3527-99e6-aad6-238f031dd41f@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 0/2] x86: clang build check adjustments
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, JulienGrall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDQ6MDA6NDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTUuMTEuMjAxOSAxNTo0NSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBB
bHNvLCBpZgo+ID4gcG9zc2libGUsIGNvdWxkIGJvdGggcGF0Y2hlcyBoYXZlIHRoZSBzYW1lIHBy
ZWZpeD8gKHg4Ni9jbGFuZykKPiAKPiBJIGRpZCBub3RpY2UgdGhlIHByZWZpeCBkaWZmZXJlbmNl
IGJlZm9yZSBzZW5kaW5nIHRoZSBzZXJpZXMuIAo+IEkgd291bGRuJ3QgbWluZCBtYWtpbmcgYm90
aCBqdXN0IHg4NjogKG1vdmluZyAiY2xhbmciIGVsc2V3aGVyZQo+IGluIHRoZSB0aXRsZSBvZiB5
b3VycyksIGJ1dCBJIGRvbid0IHdhbnQgdG8gbWFrZSBtaW5lIGhhdmUKPiB4ODYvY2xhbmcsIGJl
Y2F1c2UgSSB0aGluayB0aGVzZSBzaG91bGQgcmVwcmVzZW50IHN1YnN5c3RlbXMgb3IKPiBhbGlr
ZS4KCk9oLCB0aGF0J3MgZmluZSB0aGVuLiBGZWVsIGZyZWUgdG8gbW92ZSB0aGUgJ2NsYW5nJyBw
YXJ0IHNvbWV3aGVyZQplbHNlLiBJZTogJ3g4NjogbW92ZSBhbmQgZml4IC5za2lwIGNsYW5nIGNo
ZWNrJyBMR1RNIGZvciBleGFtcGxlLgoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
