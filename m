Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED016A056
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 09:48:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j69NY-0001wb-O6; Mon, 24 Feb 2020 08:46:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j69NX-0001wR-2q
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 08:46:15 +0000
X-Inumbo-ID: 1d2d04e6-56e2-11ea-8ad0-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d2d04e6-56e2-11ea-8ad0-12813bfff9fa;
 Mon, 24 Feb 2020 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582533975;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RMXubXKxEYeIBaEJ3Qzrk6ej1ZdwPTRYW1IgOBwfaEY=;
 b=cBc7fUGTrEEj4auKSz+ZhttBBu6pFy/kr32x8O649Tl/EFPuMDNHPnLa
 +JYb8u+INWd6EIdS4OySAc3159ac/H4XAQe59gV5/Ytudw7wy5UxPvwxN
 Vzx6u9WdEVEF5txvWnPyJLetdq9POstiNsJti/p9JChhPXWwJn7LJblOb A=;
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
IronPort-SDR: SOsCNBdC0v40kCl6OFjLK7wuhqmenORK5L+8afUXusomGgfpVU9E2ewDBAypnWrtTXjq0khPFH
 hSASyZMqoKgTSSaD6nhrv898hWUTnaIYM4Lu8Awfve588TlDHjV/NeHwoOgXj/esF7MpevU/nE
 GQNytHi22Zz3c6YpgoKxI53tTKSlTNd9dYev9wjvHoQ56tlNtlN+ksTFzfvbQFVdv41FaX8mX+
 tUqmQO3d1FfCDgG7LarNAd+6xYl9ACGF0J37Cx+b74OOe/2kH8tSauetdb7/ALvXfNOyGMbrI3
 wGA=
X-SBRS: 2.7
X-MesageID: 12876568
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="12876568"
Date: Mon, 24 Feb 2020 09:46:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200224084604.GG4679@Air-de-Roger>
References: <20200223211330.9968-1-wl@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200223211330.9968-1-wl@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/dom0_build: PVH ABI is now in
 pvh.markdown
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBGZWIgMjMsIDIwMjAgYXQgMDk6MTM6MzBQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IC0tLQo+ICB4ZW4vYXJjaC94
ODYvaHZtL2RvbTBfYnVpbGQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9t
MF9idWlsZC5jIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiBpbmRleCAzODA0MTIx
NTFiLi5mZmJiMmJkNTg0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWls
ZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiBAQCAtNjE3LDcgKzYx
Nyw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHB2aF9zZXR1cF9jcHVzKHN0cnVjdCBkb21haW4gKmQs
IHBhZGRyX3QgZW50cnksCj4gICAgICBpbnQgcmM7Cj4gICAgICAvKgo+ICAgICAgICogVGhpcyBz
ZXRzIHRoZSB2Q1BVIHN0YXRlIGFjY29yZGluZyB0byB0aGUgc3RhdGUgZGVzY3JpYmVkIGluCj4g
LSAgICAgKiBkb2NzL21pc2MvaHZtbGl0ZS5tYXJrZG93bi4KPiArICAgICAqIGRvY3MvbWlzYy9w
dmgubWFya2Rvd24uCgpJIHRoaW5rIGl0J3MgcHZoLnBhbmRvYyBub3cuIFdpdGggdGhhdDoKClJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
