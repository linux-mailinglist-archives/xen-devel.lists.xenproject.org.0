Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D418BE54
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 18:42:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEz7t-00083w-HG; Thu, 19 Mar 2020 17:38:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jEz7r-00083r-Un
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 17:38:35 +0000
X-Inumbo-ID: 7537b35a-6a08-11ea-bc4c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7537b35a-6a08-11ea-bc4c-12813bfff9fa;
 Thu, 19 Mar 2020 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584639515;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8xHomZDyNnT0V6qC8g4IzPShg0NOWFRE5bFNvJE64C0=;
 b=Cam/DSLmFPFGmtkSpvmKthGWSYEx8MqqeJ/dZPqvlDX6fqgCqwIZfAja
 AQiOlYGWbgAG1H6FOHZremTyErTp3qk6bSnSFaSdJOZX5UmjalUaRNVPd
 IqVOsLZe9bNNthn7aX6EIKtm6Dj7FK6QRGCrAjNMt7ExtSj93PS/cmgP1 8=;
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
IronPort-SDR: 8zpIPE7U+3SoDgE8lMeB516th+RVZ0FzGcWoP4yXktdVsxXcOzz4StWxFEZohk53m+RK+B9wha
 pGZETHepeTxttIrHmVkUnmGFJueLQCqPC2hbyD20OD30v4mdk4j+m7Wl7v42X3ji3dCwO4vZCn
 Awo1VlpHJivhGlBvde/uwueTAWQiks6d7yHblKiSKYy5ol6XrJenT+QYP4I/6NASfzzdwmngJw
 yx7I7+b+jCFIVVl6crFkY7zv+h64yZKGUnPiq6wjd1WDLE1db6NesI0pYKau53m/IKgfmIpYEQ
 iJ4=
X-SBRS: 2.7
X-MesageID: 14278945
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14278945"
Date: Thu, 19 Mar 2020 18:38:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200319173825.GQ24458@Air-de-Roger.citrite.net>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDQ6MjE6MjNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDE5LzAzLzIwMjAgMTU6NDcsIFJvZ2VyIFBhdSBNb25uZSB3cm90
ZToKPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbW0uaCBiL3hlbi9pbmNsdWRlL3hl
bi9tbS5oCj4gPiBpbmRleCBkMGQwOTVkOWM3Li4wMmFhZDQzMDQyIDEwMDY0NAo+ID4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL21tLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4gPiBA
QCAtNjQ0LDcgKzY0NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmaWx0ZXJlZF9mbHVzaF90bGJf
bWFzayh1aW50MzJfdCB0bGJmbHVzaF90aW1lc3RhbXApCj4gPiAgICAgICBpZiAoICFjcHVtYXNr
X2VtcHR5KCZtYXNrKSApCj4gPiAgICAgICB7Cj4gPiAgICAgICAgICAgcGVyZmNfaW5jcihuZWVk
X2ZsdXNoX3RsYl9mbHVzaCk7Cj4gPiAtICAgICAgICBmbHVzaF90bGJfbWFzaygmbWFzayk7Cj4g
PiArICAgICAgICBmbHVzaF9tYXNrKCZtYXNrLCBGTFVTSF9UTEIgfCBGTFVTSF9IVk1fQVNJRF9D
T1JFKTsKPiAKPiBBIHJ1bGUgb2YgdGh1bWIgaXMgYW55IG1vZGlmaWNhdGlvbiBpbiBjb21tb24g
Y29kZSBtYXkgaW1wYWN0IEFybS4gVGhpcyBpcyBhCj4gY2FzZSBoZXJlIGJlY2F1c2UgdGhlIGZs
YWcgYW5kIHRoZSAibmV3IiBmdW5jdGlvbiBhcmUgbm90IGRlZmluZWQgb24gQXJtIGFuZAo+IHRo
ZXJlZm9yZSBnb2luZyB0byBicmVhayB0aGUgYnVpbGQuCgpmbHVzaF9tYXNrIGlzIG5vdCBhIG5l
dyBmdW5jdGlvbiwgaXQncyBqdXN0IG5vdCBpbXBsZW1lbnRlZCBvbiBBUk0gSQpndWVzcy4KCj4g
V2h5IGNhbid0IHlvdSBrZWVwIGZsdXNoX3RsYl9tYXNrKCkgaGVyZT8KCkJlY2F1c2UgZmlsdGVy
ZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0ZV9waHlzbWFwLCBhbmQKY2hhbmdl
cyB0byB0aGUgcGh5bWFwIHJlcXVpcmUgYW4gQVNJRCBmbHVzaCBvbiBBTUQgaGFyZHdhcmUuCgpJ
IHdpbGwgc2VuZCBhbiB1cGRhdGVkIHZlcnNpb24uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
