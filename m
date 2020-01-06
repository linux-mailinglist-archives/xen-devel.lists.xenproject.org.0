Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A441310DC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 11:52:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioPyC-0000BT-Mz; Mon, 06 Jan 2020 10:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HznK=23=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ioPyB-0000BO-SV
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 10:50:47 +0000
X-Inumbo-ID: 65047696-3072-11ea-aaec-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65047696-3072-11ea-aaec-12813bfff9fa;
 Mon, 06 Jan 2020 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578307848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HwR4LVzwwx5D4BZwZdg5MEMNyNqFZ/ojTzRGmRZWrdA=;
 b=M7VC1jfnfYrQSMSK2WU8wsR9ht5GnDUE9wdgtMnb9vXksD7P2zGPqopk
 nAzA8mdFEFtbwI4N2HJ//irJkqwJVckXGSdRr6hG6k4j/RyDI3JvfWJTD
 0Vc/JFay8iCR4lBwfn0O9NHF9EsupqrYtTA98ETrhV1EFC7GQAHwtipNn 4=;
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
IronPort-SDR: jduqzBG8xoCM2VWRbhdzhTSNUymHTOsphO4/GJcZZrXOm7xVziQZkmzhbo+ThfKG9GC51hTh2O
 dcWJOf8wq3jaHvzhozdSOYeR+O45P2VbQsKM89e7Pt3gTLGcU8DviEUOyFt0iO22ba65d73wja
 gtuZthyOhVU6W/+Cf+brhI2f6QKBUPtXh1cWUP8KROxz4M8BN7TPh7HYdDAjfXvygDAQDgDfzM
 mWSvSKfLEPSjlVoilXxkuhNDCRSZYTsazHrixAbNce2AtMjUL0eWCDyuBZRzE9vpp5heTh2uTj
 TtA=
X-SBRS: 2.7
X-MesageID: 10504996
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,402,1571716800"; d="scan'208";a="10504996"
Date: Mon, 6 Jan 2020 10:50:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200106105043.GH1267@perard.uk.xensource.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
 <6e003ed5-a19d-f759-81e5-0dee252b2b1e@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e003ed5-a19d-f759-81e5-0dee252b2b1e@xen.org>
Subject: Re: [Xen-devel] [XEN PATCH v2 0/6] xen: Kconfig update with few
 extra
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMjMsIDIwMTkgYXQgMDY6NDQ6MTFQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDE3LzEyLzIwMTkgMTE6NTgsIEFudGhvbnkgUEVSQVJEIHdyb3Rl
Ogo+ID4gUGF0Y2ggc2VyaWVzIGF2YWlsYWJsZSBpbiB0aGlzIGdpdCBicmFuY2g6Cj4gPiBodHRw
czovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUu
Z2l0IGJyLmJ1aWxkLXN5c3RlbS14ZW4ta2NvbmZpZy12Mgo+ID4gCj4gPiB2MjoKPiA+ICAgICAg
bml0IGNoYW5nZXMgaW4gcGF0Y2ggMSBhbmQgMi4KPiA+IAo+ID4gSGksCj4gPiAKPiA+IFRoaXMg
aXMgYSB1cGRhdGUgb2YgS2NvbmZpZyBhcyB1c2VkIHRvIGJ1aWxkIHRoZSBoeXBlcnZpc29yLiBU
aGlzIGlzIGFsc28gaW4KPiA+IHByZXBhcmF0aW9uIG9mIHVzaW5nIEtidWlsZC4gVGhlIGZpcnN0
IHZlcnNpb24gb2YgdGhlIHNlcmllcywgd2l0aCBhIFBPQyBvZgo+ID4gdXNpbmcgS2J1aWxkIHRv
IGJ1aWxkIHhlbiBjYW4gYmUgZm91bmQgaGVyZToKPiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMC9tc2cwMTYwOS5odG1sCj4gPiAK
PiA+IE5ldyBmZWF0dXJlcyBvZiBLY29uZmlnOgo+ID4gICAgICAtIENhbiBydW4gc2hlbGwgY29t
bWFuZHMhCj4gPiAgICAgIC0gVXBkYXRlIHRvIHRoZSBncmFwaGljYWwgbWVudWNvbmZpZywgeGNv
bmZpZy4gSXQncyBub3cgYnVpbHQgd2l0aCBRdDQvUXQ1Lgo+IAo+IFNoYWxsIHdlIHVwZGF0ZSB0
aGUgZGVwZW5kZW5jaWVzIGluIFJFQURNRT8KCk5vIG5lZWQsIGJlY2F1c2UgUXQgKGZvciB4Y29u
ZmlnKSBvciBHVEsgKGZvciBnY29uZmlnKSBhcmUgb3B0aW9uYWwsIG9uZQpjYW4gdXNlIGRlZmNv
bmZpZyBvciBtZW51Y29uZmlnIG9yIG9uZSBvZiB0aGUgb3RoZXIgKmNvbmZpZyB0byBnZW5lcmF0
ZQpYZW4ncyAuY29uZmlnLgoKPiA+IAo+ID4gVGhpcyB3aG9sZSBzZXJpZXMgc2hvdWxkIGJlICJu
byBmdW5jdGlvbmFsaXR5IGNoYW5nZXMiLCBJIHRoaW5rLgo+IAo+IFRoZSBBcm0gY2hhbmdlcyBs
b29rcyBnb29kIHRvIG1lLiBEaWQgeW91IGJ1aWxkIHRlc3Qgb24gQXJtIChlaXRoZXIgMzItYml0
Cj4gb3IgNjQtYml0KT8KCkkndmUgcnVuIHRoZSBwYXRjaCBzZXJpZXMgb24gb3VyIEdpdExhYiBD
SSBhbmQgaXQgc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZCwKSSBob3BlIHRoYXQgZG9lcyB0aGUga2lu
ZCBvZiBBcm0gYnVpbGQgeW91IGFyZSBsb29raW5nIGZvciA6LSkuCgpDaGVlcnMsCgotLSAKQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
