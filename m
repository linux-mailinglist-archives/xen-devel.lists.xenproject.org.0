Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9724AEAE5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:54:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fcA-0004id-HQ; Tue, 10 Sep 2019 12:51:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7fc9-0004iY-4m
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:51:21 +0000
X-Inumbo-ID: af96cb74-d3c9-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af96cb74-d3c9-11e9-978d-bc764e2007e4;
 Tue, 10 Sep 2019 12:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568119880;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ZgHPGpklV1XSvhyK67G6QMOtGn9MMzlOEculZL9KodE=;
 b=QdP23VLnMpGZrCJ29lQY2O7quldT328HmecGiE7iJmKU2+fkDiTPT7jT
 zZ20blKtSqC1nIRb2yCdyc4lxpS9PWQRxL2oDXhOhmxmjx2cnrX4Ni/fN
 1ISyuSdai8qznEbHey5h1HqJdgDW/C7v6Bpa296D1aga8xeqycRX1rV7/ U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DGRIvYgGV/9F1TARsmuwmG9fWg8Q77tDQtDlREy8wjShKYMybXsVgSGY1uZKQN9rtPuI9QZ/p+
 6ptFooS+LmgvEaChlymwP6+CfPMk4ZJmKCW7jKpWwLkcx6Bf4MjizXCDSb1lRegj4KR63Q7e7L
 vbJJxvWKsER9f2ddTOJjVmB4LtPYL0csHxN9NLZSi8BzfNzzhzI97uiaJnCjXpm2amy5PwqxnX
 UyhPjuemnYzujQKiZgOLh1/GVciOFJYlkHtHDTlXOuwwPjQsnG+5GLzObEDmhPGPsB0BD7UJSQ
 7/A=
X-SBRS: 2.7
X-MesageID: 5652475
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5652475"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23927.39975.12677.775409@mariner.uk.xensource.com>
Date: Tue, 10 Sep 2019 13:50:47 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <7ef7b11e-e463-a12d-0dfe-dd386d4f4f59@citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
 <20190910120207.10358-7-ian.jackson@eu.citrix.com>
 <7ef7b11e-e463-a12d-0dfe-dd386d4f4f59@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 06/12] tools/ocaml: abi handling: Provide
 ocaml->C conversion/check
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIIHYzIDA2LzEyXSB0b29scy9vY2FtbDog
YWJpIGhhbmRsaW5nOiBQcm92aWRlIG9jYW1sLT5DIGNvbnZlcnNpb24vY2hlY2siKToKPiBPbiAx
MC8wOS8yMDE5IDEzOjAyLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IEZyb206IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPgo+ID4gTm8gdXNlcnMgb2YgdGhpcyB5
ZXQgc28gbm8gb3ZlcmFsbCBjaGFuZ2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IAo+IEknbSBhZnJhaWQgdGhpcyBk
b2Vzbid0IGJpc2VjdC7CoCBJdCBuZWVkcyB0byBiZSBpbiB0aGUgc2FtZSBwYXRjaCBhcyBvbmUK
PiBvZiBpdHMgY2FsbGVycy4KCk9vcHMuICBJIHdpbGwgZml4IHRoaXMgd2l0aCBhIHRlbXBvcmFy
eSAjaWYgMCwgc2luY2UgSSBkb24ndCBsaWtlIHRvCm1peCB1cCB0aGUgZ2VuZXJhbCB3aXRoIHRo
ZSBzcGVjaWZpYy4KCldoaWxlIGNoZWNraW5nIGZvciBiaXNlY3RhYmlsaXR5IEkgZGlzY292ZXJl
ZCBteSBgbWFrZSBjbGVhbicgdGFyZ2V0CndhcyBub3Qgd29ya2luZyByaWdodC4gIEkgaGF2ZSBh
ZGRlZAogICBHRU5FUkFURURfRklMRVMgKz0geGVuY3RybF9hYmlfY2hlY2suaAp0byB0aGUgTWFr
ZWZpbGUgcGF0Y2guICBJIHRydXN0IHRoYXQgaXQncyBPSyB0byBrZWVwIGV2ZXJ5b25lJ3MgYWNr
cy4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
