Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC36125D0A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 09:55:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihrY4-00085G-Vx; Thu, 19 Dec 2019 08:52:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiZr=2J=amazon.com=prvs=249f004f8=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihrY3-00085B-9x
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 08:52:43 +0000
X-Inumbo-ID: eae30277-223c-11ea-916c-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eae30277-223c-11ea-916c-12813bfff9fa;
 Thu, 19 Dec 2019 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576745562; x=1608281562;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rtplmxScSRBrVknP+HFbzs43DDlm5WaVY3PyFFDfR5g=;
 b=OKR79SHZ1ly4dU8JBj/Nh6NjMysdZjcLNH+M/CZA+cgIQHSXZ6xe2Hsy
 SB6uAEHJxECj5MvS99trxyEFIu4qkYOnuPcacknwI3rnVkh+rg1bXIbic
 i5adqhDQjjPDm98TpxyrYSpEHeEuOb+YtWwr10267Amu6pcc4Gp5Zuvrw A=;
IronPort-SDR: uEhVZnyT4GQUrNWf2X2+9tXXliZ2MqHlEEApgr06okigkUKw0Z0lbMAfCDyHj3nOZlKabw5KF6
 hK4aVSftDSWw==
X-IronPort-AV: E=Sophos;i="5.69,330,1571702400"; 
   d="scan'208";a="6013696"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 19 Dec 2019 08:52:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 5E95AA1D37; Thu, 19 Dec 2019 08:52:29 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 19 Dec 2019 08:52:28 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Dec 2019 08:52:28 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 19 Dec 2019 08:52:27 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
Thread-Index: AQHVtb2HD8UZZLEQMEaUpPbPmxeuyqfAS8OAgADZnRA=
Date: Thu, 19 Dec 2019 08:52:27 +0000
Message-ID: <671333aff34f4e92bded1ad705264e02@EX13D32EUC003.ant.amazon.com>
References: <20191218160926.12538-1-pdurrant@amazon.com>
 <f72c26d5-ba96-5804-126a-865af62ceff1@citrix.com>
In-Reply-To: <f72c26d5-ba96-5804-126a-865af62ceff1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gQW5kcmV3IENv
b3Blcg0KPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5IDE5OjQ1DQo+IFRvOiBEdXJyYW50LCBQYXVs
IDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+
IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0hdIHg4Ni9zYXZlOiByZXNlcnZlIEhWTSBzYXZlIHJlY29y
ZCBudW1iZXJzDQo+IHRoYXQgaGF2ZSBiZWVuIGNvbnN1bWVkLi4uDQo+IA0KPiBPbiAxOC8xMi8y
MDE5IDE2OjA5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLi4uZm9yIHBhdGNoZXMgbm90ICh5
ZXQpIHVwc3RyZWFtLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBpcyBzaW1wbHkgcmVzZXJ2aW5nIHNh
dmUgcmVjb3JkIG51bWJlciBzcGFjZSB0byBhdm9pZCB0aGUNCj4gPiByaXNrIG9mIGNsYXNoZXMg
YmV0d2VlbiBleGlzdGVudCBkb3duc3RyZWFtIGNoYW5nZXMgbWFkZSBieSBBbWF6b24gYW5kDQo+
ID4gZnV0dXJlIHVwc3RyZWFtIGNoYW5nZXMgd2hpY2ggbWF5IGJlIGluY29tcGF0aWJsZS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4N
Cj4gDQo+IElzIHRoaXMgInlvdSd2ZSBhbHJlYWR5IHVzZWQgc29tZSBvZiB0aGVzZSIsIG9yIHlv
dSBwbGFuIHRvPw0KDQpBbHJlYWR5IHVzZWQgaW4gY29kZSB0aGF0IGhhcyBiZWVuIGRlcGxveWVk
LCBhbHRob3VnaCBJIGhhdmUgbGVmdCBzb21lIGhlYWRyb29tIGJlY2F1c2UgSSBrbm93IHRoZXJl
IGlzIGNvZGUgaW4gZGV2ZWxvcG1lbnQgd2hpY2ggaXMgdXNpbmcgbmV3IG9uZXMuDQoNCldoZXJl
IHJlY29yZHMgY2FuIGJlIHVwc3RyZWFtZWQgaW4gYSB3YXkgdGhhdCBpcyBjb21wYXRpYmxlIHdp
dGggZG93bnN0cmVhbSB1c2UsIHdlIHdpbGwga2VlcCB0aGUgZXhpc3RpbmcgbnVtYmVyLiBJZiBp
bmNvbXBhdGlibGUgY2hhbmdlcyBhcmUgbmVjZXNzYXJ5IHRvIGdldCB0aGUgY29kZSB1cHN0cmVh
bSB0aGVuIHdlIHdpbGwgaGF2ZSB0byB1c2UgYSBuZXcgbnVtYmVyIGFuZCBtYWludGFpbiBkb3du
c3RyZWFtIGNvbXBhdGliaWxpdHkgcGF0Y2hlcy4NCg0KICBQYXVsDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
