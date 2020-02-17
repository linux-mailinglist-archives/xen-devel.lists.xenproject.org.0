Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EB316142E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 15:08:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3h2W-0007fv-Ks; Mon, 17 Feb 2020 14:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h4oX=4F=amazon.co.uk=prvs=30915cffa=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j3h2V-0007fq-0k
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 14:06:23 +0000
X-Inumbo-ID: ad7995ea-518e-11ea-b0fd-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad7995ea-518e-11ea-b0fd-bc764e2007e4;
 Mon, 17 Feb 2020 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581948382; x=1613484382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3z+Bb65oDP2ptKmwsBXjeAufnQsjbkLPfnWQ3Jftx5w=;
 b=Vv77vM/HS24s857X2lqvlZJ0F+194ZZGx0XNhvO9ciRO/hJKObDDlNgH
 IIeMbIEN8v4E18OIz+bxMARlsYLVWOqhD9FvXNHtexahmuMKM0av2Fun0
 S0DQuomdVjYgnWVqY41mc+5dhh4dt8rXiqRuWv4Lqol/LuxE+6BpHSaSF s=;
IronPort-SDR: HJCMbkT9cazBQ5wIC7mYZV2tJx9iCFwlKRhCrUCPFjeErOl4KZu+1uKPnlH5aFYbhqXwl0329h
 G3m3Ej/gzR/g==
X-IronPort-AV: E=Sophos;i="5.70,452,1574121600"; d="scan'208";a="16646800"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 17 Feb 2020 14:06:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7E98CA2ACF; Mon, 17 Feb 2020 14:06:07 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 17 Feb 2020 14:06:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 17 Feb 2020 14:06:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 17 Feb 2020 14:06:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/3] x86/hyperv: skeleton for L0 assisted TLB flush
Thread-Index: AQHV5Zn41YAa4PIVgE6u/e0apc4JD6gfassA
Date: Mon, 17 Feb 2020 14:06:05 +0000
Message-ID: <37a3dcd83ab749f1b08e18fe06b630b3@EX13D32EUC003.ant.amazon.com>
References: <20200217135517.5826-1-liuwe@microsoft.com>
 <20200217135517.5826-3-liuwe@microsoft.com>
In-Reply-To: <20200217135517.5826-3-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.171]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXZWkgTGl1IDx3ZWkubGl1Lnhl
bkBnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBXZWkgTGl1DQo+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIw
MjAgMTM6NTUNCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc+DQo+IENjOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNv
bT47IER1cnJhbnQsIFBhdWwNCj4gPHBkdXJyYW50QGFtYXpvbi5jby51az47IFdlaSBMaXUgPGxp
dXdlQG1pY3Jvc29mdC5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaA0KPiA8amJldWxpY2hAc3Vz
ZS5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjMgMi8zXSB4ODYvaHlwZXJ2OiBza2VsZXRvbiBmb3IgTDAgYXNzaXN0ZWQg
VExCIGZsdXNoDQo+IA0KPiBJbXBsZW1lbnQgYSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBU
TEIgZmx1c2guIFRoZSBob29rIG5lZWRzIHRvDQo+IGNoZWNrIGlmIHByZXJlcXVpc2l0ZXMgYXJl
IG1ldC4gSWYgdGhleSBhcmUgbm90IG1ldCwgaXQgcmV0dXJucyBhbiBlcnJvcg0KPiBudW1iZXIg
dG8gZmFsbCBiYWNrIHRvIG5hdGl2ZSBmbHVzaGVzLg0KPiANCj4gSW50cm9kdWNlIGEgbmV3IHZh
cmlhYmxlIHRvIGluZGljYXRlIGlmIGh5cGVyY2FsbCBwYWdlIGlzIHJlYWR5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4NCj4gUmV2aWV3ZWQtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTog
UGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
