Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35EA0594
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:04:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2zSd-00020i-6O; Wed, 28 Aug 2019 15:02:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0R6Y=WY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i2zSc-00020d-GF
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:02:10 +0000
X-Inumbo-ID: ce8f5732-c9a4-11e9-b95f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce8f5732-c9a4-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 15:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567004530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jvO0bjnnV1eeogf2uPBWTl/i2/Ep6GzJSNmp9cbu9W0=;
 b=ZnntGpZYkZ18/1hfr6TE1VaJpJ19aiKvs3bXTUr0o6axAhqszTwEK7N9
 +cpCzrnAoSZHxBSZNyPw4b4uz29h1yU9DRDR1S0VLZcbN/1Jvy2f6LD29
 tbAzYRw7LxzmbP7UwrDo1fErnuAC1+EOCoUtW5ayYxvN6+0EzIvJthwur E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qC3hAsqnysHm3C08qbA9hFUEzkya2/secEnki7jhcz44dJdfgsPXkNmcMr8WOOwghQn+fFZGXJ
 Vtspmuf+h0zM5RcwDoS4ZdNxkJr+9U1zFWF+ryrIal8kS4dCL2+1S4ncFKyv7Dwj5WhwUUExko
 puNxxM5/i80RVJROTP8Oo4/6SM73E2L8PAouMowfGbSkxYha2UoMOPBnOLEafgz1uytitdjulo
 c9WkFmkPrOdCW/YwoIb2djE31XdoCWqoLFuIiNwOwaqpcThyC5gcKZeQNzTiHN+aeVLPvbXgiS
 i/A=
X-SBRS: 2.7
X-MesageID: 4878713
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,441,1559534400"; 
   d="scan'208";a="4878713"
Date: Wed, 28 Aug 2019 17:01:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Message-ID: <20190828150157.4tagq4facijqxi4k@Air-de-Roger>
References: <20190828133229.86085-1-roger.pau@citrix.com>
 <c016345d-a216-9d26-fe19-59001d3cb766@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c016345d-a216-9d26-fe19-59001d3cb766@bitdefender.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] Partially revert "x86/mm: Clean IOMMU flags
 from p2m-pt code"
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDI6NTU6NThQTSArMDAwMCwgQWxleGFuZHJ1IFN0ZWZh
biBJU0FJTEEgd3JvdGU6Cj4gCj4gCj4gT24gMjguMDguMjAxOSAxNjozMiwgUm9nZXIgUGF1IE1v
bm5lIHdyb3RlOgo+ID4gVGhpcyBwYXJ0aWFsbHkgcmV2ZXJ0cyBjb21taXQKPiA+IDg1NGE0OWE3
NDg2YTAyZWRhZTViM2U1MzYxN2JhY2U1MjZlOWMxYjEgYnkgcmUtYWRkaW5nIHRoZSBsb2dpYyB0
aGF0Cj4gPiBwcm9wYWdhdGVzIGNoYW5nZXMgdG8gdGhlIGRvbWFpbiBwaHlzbWFwIGRvbmUgYnkg
cDJtX3B0X3NldF9lbnRyeSBpbnRvCj4gPiB0aGUgaW9tbXUgcGFnZSB0YWJsZXMuIFdpdGhvdXQg
dGhpcyBsb2dpYyBjaGFuZ2VzIHRvIHRoZSBndWVzdCBwaHlzbWFwCj4gPiBhcmUgbm90IHByb3Bh
Z2F0ZWQgdG8gdGhlIGlvbW11LCBsZWF2aW5nIHN0YWxlIGlvbW11IGVudHJpZXMgdGhhdCBjYW4K
PiA+IGxlYWsgZGF0YSwgb3IgZmFpbGluZyB0byBhZGQgbmV3IGVudHJpZXMuCj4gPiAKPiA+IE5v
dGUgdGhhdCB0aGlzIGNvbW1pdCBkb2Vzbid0IHJlLWludHJvZHVjZSBpb21tdSBmbGFncyB0byB0
aGUgY3B1IHBhZ2UKPiA+IHRhYmxlIGVudHJpZXMsIHNpbmNlIHRoZSBsb2dpYyB0byBhZGQvcmVt
b3ZlIGVudHJpZXMgdG8gdGhlIGlvbW11IHBhZ2UKPiA+IHRhYmxlcyBpcyBiYXNlZCBvbiB0aGUg
cDJtIHR5cGUgYW5kIHRoZSBtZm4uCj4gCj4gVGhpcyBzb3VuZHMgZ29vZCBidXQgaXMgaXQgc3Rp
bGwgc2FmZSB0byB1c2UgdGhlIElPTU1VIGZsYWcgc3BhY2Ugd2l0aCAKPiBhbm90aGVyIHB1cnBv
c2U/CgpTdXJlLCBwbGVhc2Ugbm90ZSB0aGF0IHRoaXMgcGFydGlhbCByZXZlcnQgZG9lc24ndCBh
ZGQgYW55IGV4dHJhIGZsYWdzCnRvIHRoZSBDUFUgcGFnZSB0YWJsZSBlbnRyaWVzLCBhcyBwMm1f
YWRkX2lvbW11X2ZsYWdzIGlzIG5vdApyZS1pbnRyb2R1Y2VkLgoKUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
