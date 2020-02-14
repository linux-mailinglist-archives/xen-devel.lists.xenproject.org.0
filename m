Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC415EFB3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 18:50:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2f3p-0003Mp-T3; Fri, 14 Feb 2020 17:47:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SROB=4C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j2f3o-0003Mk-CP
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 17:47:28 +0000
X-Inumbo-ID: 0f360d8e-4f52-11ea-badd-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f360d8e-4f52-11ea-badd-12813bfff9fa;
 Fri, 14 Feb 2020 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581702446;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=0ls4xSnux4cOOnW5m/6gKlOHHR/X4j45gtAieShn018=;
 b=gv/THc/Sfqwjlqqvt6vONDe6ORvntxv1qY8H6whmIlVZrmkv7jpGD4ho
 2UpZe2X6hhmeVlA6FPn4Lu21K/4T4vKEzoSCFt5+79pXCn1zSdVRCXqGK
 m1wUgX5IeQCUwB3PBKXD9NDgMjVOWQHfJfKIAikGnvab4LdhW7UXH5XpC E=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ev2JGzV5EUt6C+yKviig96qGT1bzmnrpMOL92Rt4tvpvi9evVFniky0bNI23/eJGhVakvOjswZ
 QJYHRPtgFtJxmmiMR92IC0FWlT8kCSLrl5ArNNcVolRvTNpKdztsbhnF7UBCpqTSgTMnTDoD7Q
 UbxJpTrfOs+SkVh+GYIGXlnasW+mOhdnSjLrOq57kVxg2JitT/2VTw8oBne/hdB9+AbI2erDMf
 IH+lyIaMYDptB7TrTBlAYrfz6eT4QrF7y2koiCJf2fQZ7Gj9vNGhbNcnRJIdQaQuSoc6fPPgoL
 zM4=
X-SBRS: 2.7
X-MesageID: 12655683
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,441,1574139600"; d="scan'208";a="12655683"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24134.56617.646033.43087@mariner.uk.xensource.com>
Date: Fri, 14 Feb 2020 17:47:21 +0000
To: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <20200214155933.7048-1-jfehlig@suse.com>
References: <20200214155933.7048-1-jfehlig@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH V2] build: fix configuration of
 libvirt
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

SmltIEZlaGxpZyB3cml0ZXMgKCJbT1NTVEVTVCBQQVRDSCBWMl0gYnVpbGQ6IGZpeCBjb25maWd1
cmF0aW9uIG9mIGxpYnZpcnQiKToKPiBsaWJ2aXJ0LmdpdCBjb21taXQgMjYyMWQ0OGYwMCByZW1v
dmVkIHRoZSBsYXN0IHRyYWNlcyBvZiBnbnVsaWIsIHdoaWNoCj4gYWxzbyByZW1vdmVkIHRoZSAn
LS1uby1naXQnIG9wdGlvbiBmcm9tIGF1dG9nZW4uc2guIFVua25vd24gb3B0aW9ucyBhcmUKPiBu
b3cgcGFzc2VkIHRvIHRoZSBjb25maWd1cmUgc2NyaXB0LCB3aGljaCBxdWlja2x5IGZhaWxzIHdp
dGgKPiAKPiAgIGNvbmZpZ3VyZTogZXJyb3I6IHVucmVjb2duaXplZCBvcHRpb246IGAtLW5vLWdp
dCcKPiAKPiBSZW1vdmUgdGhlIGdudWxpYiBoYW5kbGluZyBmcm9tIHRzLWxpYnZpcnQtYnVpbGQs
IGluY2x1ZGluZyB0aGUgJy0tbm8tZ2l0Jwo+IG9wdGlvbiB0byBhdXRvZ2VuLnNoLiBXaGlsZSBh
dCBpdCByZW1vdmUgY29uZmlndXJlIG9wdGlvbnMgbm8gbG9uZ2VyCj4gc3VwcG9ydGVkIGJ5IHRo
ZSBsaWJ2aXJ0IGNvbmZpZ3VyZSBzY3JpcHQuCgpIYXJtZi4gIFRoYW5rcyBmb3IgbG9va2luZyBp
bnRvIHRoaXMgYW5kIHRyeWluZyB0byBmaXggdGhpcyBtZXNzLgoKSSB0aGluayB0aGVyZSBpcyBh
IHByb2JsZW0gd2l0aCB5b3VyIHBhdGNoLCB3aGljaCBpcyB0aGF0IDI2MjFkNDhmMDAKaXMgcmVj
ZW50IGVub3VnaCB0aGF0IHdlIG1pZ2h0IHdhbnQgc3RpbGwgdG8gYmUgYWJsZSB0byBidWlsZCB3
aXRoCmVhcmxpZXIgdmVyc2lvbnMuCgpJcyB0aGVyZSBhbiBlYXN5IHdheSB0byB0ZWxsIChieSBs
b29raW5nIGF0IHRoZSB0cmVlIGFmdGVyIGNoZWNrb3V0LAptYXliZSkgd2hldGhlciB0byBkbyB0
aGUgb2xkIG9yIHRoZSBuZXcgdGhpbmcgPwoKWW91ciBwZXJsIGNvZGUgbG9va3MgZ29vZCB0byBt
ZSBmb3Igd2hhdCBpdCBpcyB0cnlpbmcgdG8gZG8uCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
