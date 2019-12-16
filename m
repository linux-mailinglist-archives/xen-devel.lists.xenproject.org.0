Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5901120182
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 10:51:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igmyw-0004Wc-O0; Mon, 16 Dec 2019 09:48:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1igmyu-0004WV-Qg
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 09:48:00 +0000
X-Inumbo-ID: 1fe69948-1fe9-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fe69948-1fe9-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576489671;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZVTTncY+P4FSXxqxVlyvsnNrN6CfrToM2NhImC4E9p8=;
 b=eCIE/6xsIBI8M/UT0sJcpeOgq5IMdt1VXQb8PHOepndrLlpinZ+NfNXV
 ffCGWtQxGMFFneIbTSgGNe+qjyKxNQPoj9yaFyhTR1Y5EL7zM2yDZaQy4
 WrPxVfnIgAduGgjk9RE6yQOGhMGgyH8gLsu28G6+SqrNJl6qcC3piW9q0 Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YGjQ4cE8I9lzpfWrGcjEhOszLCpfMj8k8jaPck8x6u7ty1YmRDrjM53U9br+ls4eEaFSeq92pO
 XCxGs0ytYnoPpoxrdyv52+ochgjYjFeGHYeoFFBmzykLdkmQIb6Hzla6RK5y3HySTpOwDxjVBt
 wTMGMDkAeS6gUFudzG2bcxPVt6vgjW4+Zec+J2GA8WqeJvDQ1i/aIHCtGIDTSSMU9rStas46ku
 kWCUtO6p5n7HIYd/JZi4iMlLlF0CVmF5FpewtwkGug9NPFlNUHOAQ7fNiWy33kS6YvF0WuEkoy
 HOk=
X-SBRS: 2.7
X-MesageID: 10069754
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; d="scan'208";a="10069754"
Date: Mon, 16 Dec 2019 10:47:44 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20191216094744.GL11756@Air-de-Roger>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-2-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576277282-6590-2-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/time: drop vtsc_{kern,
 user}count debug counters
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMTA6NDg6MDFQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gVGhleSBlaXRoZXIgbmVlZCB0byBiZSB0cmFuc2Zvcm1lZCB0byBhdG9taWNzIHRv
IHdvcmsgY29ycmVjdGx5Cj4gKGN1cnJlbnRseSB0aGV5IGxlZnQgdW5wcm90ZWN0ZWQgZm9yIEhW
TSBkb21haW5zKSBvciBkcm9wcGVkIGVudGlyZWx5CiAgICAgICAgICAgICAgICAgIF4gYXJlIHVz
ZWQKPiBhcyB0YWtpbmcgYSBwZXItZG9tYWluIHNwaW5sb2NrIGlzIHRvbyBleHBlbnNpdmUgZm9y
IGhpZ2gtdkNQVSBjb3VudAo+IGRvbWFpbnMgZXZlbiBmb3IgZGVidWcgYnVpbGQgZ2l2ZW4gdGhp
cyBsb2NrIGlzIHRha2VuIHRvbyBvZnRlbi4KPiAKPiBDaG9vc2UgdGhlIGxhdHRlciBhcyB0aGV5
IGFyZSBub3QgZXh0cmVtZWx5IGltcG9ydGFudCBhbnl3YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpJIGRvbid0IGZpbmQg
dGhvc2UgY291bnRlcnMgc3BlY2lhbGx5IHVzZWZ1bCBUQkgsIGJ1dCBJJ20gbm90IHN1cmUgd2hl
dGhlcgpvdGhlcnMgZmluZCB0aGVtIHVzZWZ1bC4gVGhlIGNoYW5nZSBMR1RNLCBzbzoKClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
