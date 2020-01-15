Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B28113C102
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 13:31:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irhmU-0006PM-1g; Wed, 15 Jan 2020 12:28:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OV/N=3E=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1irhmS-0006PG-Or
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 12:28:16 +0000
X-Inumbo-ID: 8078f9c0-3792-11ea-8530-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8078f9c0-3792-11ea-8530-12813bfff9fa;
 Wed, 15 Jan 2020 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579091296;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+IRqELG2iUzcmgozZsn1tVfM9zQeq0jqGmACyX6fWDU=;
 b=MxztvVdSUXB5fhJjWGm8jqcgAsmEjyV5/uCcDYQhK/aSNuulHrTA+0Gy
 MWKynvThwdcFylnFKn8iPR6z7o1g0Kwrv0E60nBd5tnfLFeePF5GWjVK2
 yoAO5WZ8p2IcS2OhmAVEEttcEERA/aEPcLTqL+Lz7NgbVf8rnT1ymDEl4 Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6d9GYMWGGr2EzboFXJ9uLUrl5FXrp0NlvTLvnSzrlq99PmXilCVpn3N88pRBufLUSSG7PjydK/
 sjE9BMtRZQ5jegpIN2khK1xdNaa0H8gdfUVrGAUxYopFupmh4bLT0RiLMF1tsLIuzsJx798B3w
 v5FUKd4iN/jww/ppSxNX0Qj2yRQAktJaASS1M+GIFIXyuxtT1jhXxIzkvwUwNFoxTCHA8+SH0w
 5t2yYP66uGfAP8sHDztf259JunbAFmp+hQRz3L5hNWW97DEpSOFSysXVYoXoU6tprkeLEuoAdK
 Auw=
X-SBRS: 2.7
X-MesageID: 10954236
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10954236"
To: Jan Beulich <jbeulich@suse.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <7938484e-14a0-8edf-635b-15b05af6dace@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <6f6064f9-5400-3d85-75c5-b63ca460383d@citrix.com>
Date: Wed, 15 Jan 2020 12:28:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7938484e-14a0-8edf-635b-15b05af6dace@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDEvMjAyMCAxMTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMDEuMjAyMCAy
MDozNiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IElmIElUU0MgaXMgbm90IGF2YWlsYWJsZSBv
biBDUFUgKGUuZyBpZiBydW5uaW5nIG5lc3RlZCBhcyBQViBzaGltKQo+PiB0aGVuIFg4Nl9GRUFU
VVJFX05PTlNUT1BfVFNDIGlzIG5vdCBhZHZlcnRpc2VkIGluIGNlcnRhaW4gY2FzZXMsIGkuZS4K
Pj4gYWxsIEFNRCBhbmQgc29tZSBvbGQgSW50ZWwgcHJvY2Vzc29ycy4gSW4gd2hpY2ggY2FzZSBU
U0Mgd291bGQgbmVlZCB0bwo+PiBiZSByZXN0b3JlZCBvbiBDUFUgZnJvbSBwbGF0Zm9ybSB0aW1l
IGJ5IFhlbiB1cG9uIGV4aXRpbmcgZGVlcCBDLXN0YXRlcy4KPiAKPiBIb3cgZG9lcyB3YWtpbmcg
ZnJvbSBkZWVwIEMgc3RhdGVzIGNvcnJlc3BvbmQgdG8gdGhlIFBWIHNoaW0/IEkgbm90aWNlCj4g
dGhhdCBjc3RhdGVfcmVzdG9yZV90c2MoKSBnZXRzIGNhbGxlZCBpcnJlc3BlY3RpdmUgb2YgdGhl
IEMgc3RhdGUgYmVpbmcKPiBleGl0ZWQsIHNvIEkgd29uZGVyIHdoZXRoZXIgdGhlcmUncyByb29t
IGZvciBpbXByb3ZlbWVudCB0aGVyZQo+IGluZGVwZW5kZW50IG9mIHRoZSBpc3N1ZSBhdCBoYW5k
LiBBcyBmYXIgYXMgdGhpcyBjaGFuZ2UgaXMgY29uY2VybmVkLAo+IEkgdGhpbmsgeW91IHdhbnQg
dG8gZHJvcCB0aGUgbm90aW9uIG9mICJkZWVwIiBmcm9tIHRoZSBkZXNjcmlwdGlvbi4KCkknbSBu
b3QgZmFtaWxpYXIgd2l0aCB3aGF0IHRvIGNhbGwgImRlZXAgQy1zdGF0ZSIgc28gZm9yIG1lIGl0
IHdhcyBhbnl0aGluZwpoaWdoZXIgdGhhbiBDMS4gSWYgeW91IHByZWZlciAiZGVlcCIgdG8gYmUg
ZHJvcHBlZCAtIHNvIGJlIGl0LgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
