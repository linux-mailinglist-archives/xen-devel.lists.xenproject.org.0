Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564D105CC2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 23:40:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXv4t-0000V1-NO; Thu, 21 Nov 2019 22:37:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72g7=ZN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iXv4s-0000Uw-8B
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 22:37:30 +0000
X-Inumbo-ID: 7fcb2a38-0caf-11ea-9631-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fcb2a38-0caf-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 22:37:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0415B20692;
 Thu, 21 Nov 2019 22:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574375848;
 bh=SQzHn0jrDe6xDAb3Vs6Gna0BV16Y/ciU23iFpHyMRWo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vTGh3US5yiL3RTk0Do1Yb2wkDfV5UtwzwOeKogw/cKvtbMe9I9t2PZMjOZyc8cjFL
 fczlJHGi3qobqdlM4y70NoaXZXIddfD7IVUB9Z78TPiniiXgxauGkxYiYAKlJWBVwJ
 kb9sP7lE/W4hh4pu6YVIs9bYG+e0OOS54EcXYo60=
Date: Thu, 21 Nov 2019 14:37:26 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: peng.fan@nxp.com, jgross@suse.com
In-Reply-To: <b6ca963c-277e-0c64-0a11-e58ef3ede51e@xen.org>
Message-ID: <alpine.DEB.2.21.1911211427420.26346@sstabellini-ThinkPad-T480s>
References: <20191107033709.17575-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911081123580.2677@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2QiPco5N4-P5V+hRERR05jr8VMk2jsU6HoxLMiipBKYw@mail.gmail.com>
 <alpine.DEB.2.21.1911111049000.2677@sstabellini-ThinkPad-T480s>
 <20191112124609.69f2a6a2@donnerap.cambridge.arm.com>
 <7289f75f-1ab2-2d42-cd88-1be5306b3072@xen.org>
 <alpine.DEB.2.21.1911211035350.26346@sstabellini-ThinkPad-T480s>
 <b6ca963c-277e-0c64-0a11-e58ef3ede51e@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] arch: arm: vgic-v3: fix GICD_ISACTIVER range
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
Cc: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org, Andre Przywara <andre.przywara@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMSBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBBcyBJIHNhaWQg
aW4gYSBkaWZmZXJlbnQgc3ViLXRocmVhZCwgSSB3b3VsZCByZWx1Y3Rhbmx5IGJlIG9rIHRvIHNl
ZQo+ID4gPiByZXR1cm5pbmcKPiA+ID4gMCBhcyBsb25nIGFzIHdlIGhhdmUgYWRkIGEgd2Fybmlu
ZyBmb3IgKmV2ZXJ5KiBhY2Nlc3MuIExvbmctdGVybSwgdGhlCj4gPiA+IGN1cnJlbnQKPiA+ID4g
dkdJQyBzaG91bGQgcmVhbGx5IGdldCBraWxsZWQuCgpBZnRlciBzcGVha2luZyB3aXRoIEp1bGll
biBhbmQgcmVhZGluZyBtb3JlIGFib3V0IHRoZSByZWdpc3RlcnMgaW4KcXVlc3Rpb24gYW5kIHRo
ZSBMaW51eCBjaGFuZ2VzIGluIDUuNCwgSSBjaGFuZ2VkIG15IG1pbmQgYW5kIGFncmVlIHdpdGgK
dGhlIHdhcm5pbmcuCgpQZW5nLCB3b3VsZCB5b3UgYmUgd2lsbGluZyB0byBzdWJtaXQgYSBuZXcg
dXBkYXRlIG9mIHRoZSBwYXRjaCwgYWRkaW5nIGEKd2FybmluZyBhbHNvPyBZb3UgY2FuIHJldXNl
IHRoZSB3b3JkcyB1c2VkIGluIHRoZSB3YXJuaW5nIGZyb20KdmdpY192Ml9kaXN0cl9tbWlvX3dy
aXRlLCBzb21ldGhpbmcgbGlrZToKCiAgcHJpbnRrKFhFTkxPR19HX0VSUiAiJXB2OiB2R0lDRDog
dW5oYW5kbGVkIHJlYWQgZnJvbSBJU0FDVElWRVIlZFxuIiwKICAgICAgICAgdiwgZ2ljZF9yZWcg
LSBHSUNEX0lTQUNUSVZFUik7CgoKSnVlcmdlbiwgdGhpcyBpcyBhbiBlYXN5LXRvLXVuZGVyc3Rh
bmQgdHlwbyBmaXgsIHBsdXMgYSBuZXcgd2FybmluZy4gSXQKaXMgaW1wb3J0YW50IHRvIGJlIGFi
bGUgdG8gcnVuIExpbnV4IDUuNCAoc2VlCmh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZt
PTE1NzM3MjIzNDQyOTU4OCkuIEkgdGhpbmsgaXQgc2hvdWxkIGdvCmluIDQuMTMuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
