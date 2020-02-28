Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2839173CC2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:22:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iNk-0006Wp-RC; Fri, 28 Feb 2020 16:20:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7iNj-0006Wh-H9
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:20:55 +0000
X-Inumbo-ID: 4ad9edde-5a46-11ea-99a0-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ad9edde-5a46-11ea-99a0-12813bfff9fa;
 Fri, 28 Feb 2020 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582906854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jrpup4g/lRGJ7xYYrfEDnFLzwRT+7AkHxh3SAz81kHw=;
 b=PxyQnbL6WLm35GqxQg5rHqCmLXl0lj+3c+iLB5RSL/DEgga12V3MKvTM
 aS6C3do5MbEdOybSxdWulARmkybS8NWNwBhjwTX7TqF+MsF+dhzxlOg/x
 TVbQ9JUyQpArQAwCKJ2mks2Es1TYFWe9ejNL01LWEemaH3Jzsr5g50dcY 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DWk0Plt7s1WceukixiDWRdmgxwSxgbQOI1lWPG3063ZUi5IGIKOCNTLF3ZiCjDhIb9gLJyauUT
 qDFH/boaTy+ng1oXAA57OfLdgww5NZD3FOCQOiyVZJ5YC0kj8ALBT2suwgL5k/HcDHJeJiI7BU
 tH2aBdgvegjTIB/w16zQRh5KNpzhwb7JBqXUgWBvirK1uzcEbAmLCak/+yNibQlv/jbCRWNff9
 SDNFUJ78WUBiFgruo/cS189wmESrYjqXlUONYu84JNvMLuXVpjrrO8vp62rFr24tucJeTsIjc6
 n7Q=
X-SBRS: 2.7
X-MesageID: 13807039
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13807039"
Date: Fri, 28 Feb 2020 17:20:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228162046.GC24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-2-roger.pau@citrix.com>
 <7df3df82-c6c3-37ab-3123-cd2894268b4d@suse.com>
 <20200228152728.GA24458@Air-de-Roger.citrite.net>
 <87d7fb0c-550d-e399-7a3d-f48cfbbcd53e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d7fb0c-550d-e399-7a3d-f48cfbbcd53e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 1/7] x86/hvm: allow ASID flush when v !=
 current
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDQ6NDc6NTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxNjoyNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDAyOjI5OjA5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE5LjAyLjIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
Q3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBodm1fYXNpZF9mbHVzaF92Y3B1IGlzIG5vdCBzYWZl
IHRvIHVzZQo+ID4+PiB1bmxlc3MgdGhlIHRhcmdldCB2Q1BVIGlzIGVpdGhlciBwYXVzZWQgb3Ig
dGhlIGN1cnJlbnRseSBydW5uaW5nIG9uZSwKPiA+Pj4gYXMgaXQgbW9kaWZpZXMgdGhlIGdlbmVy
YXRpb24gd2l0aG91dCBhbnkgbG9ja2luZy4KPiA+Pgo+ID4+IEluZGVlZCwgYnV0IHRoZSBpc3N1
ZSB5b3UncmUgdGFraW5nIGNhcmUgb2YgaXMgaGlnaGx5IHRoZW9yZXRpY2FsOgo+ID4+IEkgZG9u
J3QgdGhpbmsgYW55IHNhbmUgY29tcGlsZXIgd2lsbCBzcGxpdCB3cml0ZXMgb2YgdGhlIGZpZWxk
cwo+ID4+IHRvIG11bHRpcGxlIGluc25zLiBJdCB3b3VsZCBiZSBuaWNlIGlmIHRoaXMgd2FzIG1h
ZGUgY2xlYXIgaGVyZS4KPiA+IAo+ID4gV2hhdCBhYm91dCBhZGRpbmc6Cj4gPiAKPiA+Pj4gRml4
IHRoaXMgYnkgdXNpbmcgYXRvbWljIG9wZXJhdGlvbnMgd2hlbiBhY2Nlc3NpbmcgdGhlIGdlbmVy
YXRpb24KPiA+Pj4gZmllbGQsIGJvdGggaW4gaHZtX2FzaWRfZmx1c2hfdmNwdV9hc2lkIGFuZCBv
dGhlciBBU0lEIGZ1bmN0aW9ucy4gVGhpcwo+ID4+PiBhbGxvd3MgdG8gc2FmZWx5IGZsdXNoIHRo
ZSBjdXJyZW50IEFTSUQgZ2VuZXJhdGlvbi4gTm90ZSB0aGF0IGZvciB0aGUKPiA+Pj4gZmx1c2gg
dG8gdGFrZSBlZmZlY3QgaWYgdGhlIHZDUFUgaXMgY3VycmVudGx5IHJ1bm5pbmcgYSB2bWV4aXQg
aXMKPiA+Pj4gcmVxdWlyZWQuCj4gPiAKPiA+ICJNb3N0IGNvbXBpbGVycyB3aWxsIGFscmVhZHkg
ZG8gc3VjaCB3cml0ZXMgYW5kIHJlYWRzIGFzIGEgc2luZ2xlCj4gPiBpbnN0cnVjdGlvbiwgc28g
dGhlIHVzYWdlIG9mIGF0b21pYyBvcGVyYXRpb25zIGlzIG1vc3RseSB1c2VkIGFzIGEKPiA+IHNh
ZmV0eSBtZWFzdXJlLiIKPiA+IAo+ID4gSGVyZT8KPiAKPiBDb3VsZCB5b3UgcGVyaGFwcyBzdGFy
dCB3aXRoICJDb21waWxlcnMgd2lsbCBub3JtYWxseSAuLi4iIEknbSBmaW5lCj4gd2l0aCB0aGUg
cmVzdCwgaXQncyBqdXN0IHRoYXQgIm1vc3QgY29tcGlsZXJzIiBzdGlsbCBmZWVscyBsaWtlCj4g
YW4gdW5kZXJzdGF0ZW1lbnQuCgpTdXJlLCB0aGF0J3MgZmluZS4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
