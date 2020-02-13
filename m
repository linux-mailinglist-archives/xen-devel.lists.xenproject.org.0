Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FB15C24F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 16:33:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2GRd-0004GW-4s; Thu, 13 Feb 2020 15:30:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o3LU=4B=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j2GRb-0004GQ-Om
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 15:30:23 +0000
X-Inumbo-ID: bfcd285e-4e75-11ea-ade5-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfcd285e-4e75-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581607823;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WwhVlzPT7pVfL8EgrY06I5k3vP/WAsSB+ianjicEbH8=;
 b=E0RkEPMflj+exyCYnbhwvC4X8DcrAoMcURQOoTJbJO9mzPepf1ywuT51
 cGyBHOhxF0f2f7SJ/uubiOwFbhW0k7ROCv0ieEk0IiuI5wKnS3w95QjyH
 82IaYRKtiMFxoWKPrR5NB34078FituVYQrlwYO5tC/ouhexjmGeT3eihL 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A8DbMsgfi275ld00qmyk+KZlHA3qItqHHPsF23CAvkjfdqNWy5yoPWl8AoKjM+wijPhYF/dyRv
 YhCszgs8ChQd3QBt9i2v7MxwNox7tyiE8H+WEXB99lAfgK+I6VNSe2wjL1YMC7P6pxGreAnvie
 EmvY2g6LK+ce354BjxEzKzQZoQA6IfdApgPTRG8xDEE36mJOuiM+qpwDFxX8XTCrXWTf8v00rH
 YK3gjfW+C2DXgVChhDFpxJ4+4reTh4sOo99SJJn38u5pK2PzW5FpfARlC0QywkurgW//xDYHWF
 7sg=
X-SBRS: 2.7
X-MesageID: 12414842
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,437,1574139600"; d="scan'208";a="12414842"
Date: Thu, 13 Feb 2020 15:30:19 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200213153019.GF85066@perard.uk.xensource.com>
References: <20200213152751.3837-1-wl@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213152751.3837-1-wl@xen.org>
Subject: Re: [Xen-devel] [PATCH] libxl: fix libxl__cpuid_legacy in
 libxl_nocpuid.c
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
 Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDM6Mjc6NTFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBJdHMgbGFzdCBwYXJhbWV0ZXIgc2hvdWxkIGJlIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvLgo+
IAo+IEZpeGVzOiAxYjNjZWM2OSAoInRvb2xzL2xpYnhsOiBDb21iaW5lIGxlZ2FjeSBDUFVJRCBo
YW5kbGluZyBsb2dpYyIpCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAt
LS0KPiAgdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGwvbGlieGxfbm9jcHVpZC5jIGIvdG9vbHMvbGlieGwvbGlieGxfbm9jcHVpZC5jCj4gaW5k
ZXggNzc3NjU3NGEwYy4uM2YzMGUxNDhiZSAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9saWJ4
bF9ub2NwdWlkLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9ub2NwdWlkLmMKPiBAQCAtMzUs
NyArMzUsNyBAQCBpbnQgbGlieGxfY3B1aWRfcGFyc2VfY29uZmlnX3hlbmQobGlieGxfY3B1aWRf
cG9saWN5X2xpc3QgKmNwdWlkLAo+ICB9Cj4gIAo+ICB2b2lkIGxpYnhsX19jcHVpZF9sZWdhY3ko
bGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqaW5mbykKPiAgewo+ICB9Cj4gIAoKQWNrZWQt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
