Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E04144476
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 19:41:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ityPE-0001QE-En; Tue, 21 Jan 2020 18:37:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cram=3K=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ityPC-0001Q9-JK
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 18:37:38 +0000
X-Inumbo-ID: 1897308f-3c7d-11ea-bb33-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1897308f-3c7d-11ea-bb33-12813bfff9fa;
 Tue, 21 Jan 2020 18:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579631858;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Z9EWKR7As5fJmibDlYzN7nGGtKCrDpWHQPfM00A14M=;
 b=PrTB0SUf2o9U4VK6+76Dx7lmGSHU8a5kTZlrkDfvsbRiqJkXZdBNdlfQ
 d41LSOSBLFXYktDJ6vSegpWcsH1E5m2ztPanOzqvC6YCsGJ7iFVaoGi3K
 1q1pVyEM++toqEWH668qrBk8XZKPQ9F3M8SHUWMzuRRrIIQb8f1D4Rcaj s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GMJ1RH4DLoMZJwGIQXqAgpvfIm2aDyxCSyhc4rywWPtGlJ1gRSyxmdBQINSd2UJYVJIsekcEhI
 qe9eCnYTJSvE3B55m+m1qyCeeK+RTYqmzpzczuqb0tyc8XPxqPoP02VZk+algKr6pyEBksuIQV
 1DE/rVnIgf9ByTAs7o4AbWdXtRpvXFJq0+eAsQxcDOQYkAheTYaY7Zw33PTaAzUM2QIonPWrTJ
 8/u4xPCNess60QQyCLVMVrizrq2c9OL5cY9VMFIYgFdUqOpR1N6cRSXlZfiJDwWgMePli/3HxL
 WH4=
X-SBRS: 2.7
X-MesageID: 11216934
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11216934"
Date: Tue, 21 Jan 2020 18:37:33 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200121183733.GH1288@perard.uk.xensource.com>
References: <20191227134237.12530-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191227134237.12530-1-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Code-gen improvements for
 libxl_save_msgs_gen.pl
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMDE6NDI6MzdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBvdXIgQG1zZ3MoKSBpcyBhbiBhcnJheSBvZiAkbXNnaW5mbydzIHdoZXJlIHRoZSBm
aXJzdCBlbGVtZW50IGlzIGEKPiB1bmlxdWUgbnVtYmVyLiAgVGhlICRtc2dudW1fdXNlZCBjaGVj
ayBlbnN1cmVzIHRoZXkgYXJlIHVuaXF1ZS4gIEluc3RlYWQKPiBpZiBzcGVjaWZ5aW5nIHRoZW0g
ZXhwbGljaXRseSwgZ2VuZXJhdGUgbXNnbnVtIGxvY2FsbHkuICBUaGlzIHJlZHVjZXMKPiB0aGUg
ZGlmZiBuZWNlc3NhcnkgdG8gZWRpdCB0aGUgbWlkZGxlIG9mIHRoZSBAbXNncygpIGFycmF5Lgo+
IAo+IEFsbCBvdGhlciBodW5rcyBhcmUgYWRqdXN0aW5nIGZvcm1hdHRpbmcgaW4gdGhlIGdlbmVy
YXRlZCBDLCB0byBtYWtlIGl0Cj4gZWFzaWVyIHRvIGZvbGxvdy4KPiAKPiBObyBjaGFuZ2UgaW4g
YmVoYXZpb3VyIG9mIHRoZSBnZW5lcmF0ZWQgQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkg
UEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
