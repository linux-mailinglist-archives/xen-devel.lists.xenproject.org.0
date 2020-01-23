Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C000B1468C6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 14:12:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iucEu-00037h-Kw; Thu, 23 Jan 2020 13:09:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iucEt-00037c-BS
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 13:09:39 +0000
X-Inumbo-ID: 9c1359d2-3de1-11ea-be19-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c1359d2-3de1-11ea-be19-12813bfff9fa;
 Thu, 23 Jan 2020 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579784978; x=1611320978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tIfEaDxazhwnWBPSLxRSKH/TkxMeeQWkXyLF/jMIUoU=;
 b=JSJLbNbfkmTEdQHQP0iAL/dOzh5VxLPjnSUhWh0vJHMTduxHBZG26rqq
 BRKF4u9DhjIcUnpCqRHozMkHIfkkgyv2np7H7OlfrJlP+YahNx0ubyCHV
 S5WAL3pteSXv8irMwQBf95Dt4ymQ0C/ReZ2Gd+66Gxq07HosKw88eThJ7 A=;
IronPort-SDR: 3M8O0F9SuBnebhaAle2XOXYK51SvTWRYXE/vG6K6TJvSHlV4H1kB8YqGoohitBqVaDpxx4tBy8
 bL+1ZgEGSj9A==
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; d="scan'208";a="12933286"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 23 Jan 2020 13:09:37 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3567DA3752; Thu, 23 Jan 2020 13:09:36 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 13:09:35 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 13:09:35 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 23 Jan 2020 13:09:34 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v2 1/3] x86 / vmx: make apic_access_mfn
 type-safe
Thread-Index: AQHV0eeygwZJzIxz1k+tX/LcQMzUpqf4MeoAgAAGW6A=
Date: Thu, 23 Jan 2020 13:09:34 +0000
Message-ID: <d01a743d24624e7caf8d0cb19b7184e2@EX13D32EUC003.ant.amazon.com>
References: <20200123122141.1419-1-pdurrant@amazon.com>
 <20200123122141.1419-2-pdurrant@amazon.com>
 <7143d805-b9ae-1bd2-f357-84a3529464cc@suse.com>
In-Reply-To: <7143d805-b9ae-1bd2-f357-84a3529464cc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.130]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86 / vmx: make apic_access_mfn
 type-safe
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMjMgSmFudWFyeSAyMDIwIDEyOjQ1DQo+IFRvOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsg
eGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIg
MS8zXSB4ODYgLyB2bXg6IG1ha2UgYXBpY19hY2Nlc3NfbWZuDQo+IHR5cGUtc2FmZQ0KPiANCj4g
T24gMjMuMDEuMjAyMCAxMzoyMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFVzZSBtZm5fdCBy
YXRoZXIgdGhhbiB1bnNpZ25lZCBsb25nIGFuZCBjaGFuZ2UgcHJldmlvdXMgdGVzdHMgYWdhaW5z
dCAwDQo+IHRvDQo+ID4gdGVzdHMgYWdhaW5zdCBJTlZBTElEX01GTiAoYWxzbyBpbnRyb2R1Y2lu
ZyBpbml0aWFsaXphdGlvbiB0byB0aGF0DQo+IHZhbHVlKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPiBBY2tlZC1ieTogS2V2
aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IE5vLCB0aGlzIGlzbid0IHdoYXQgdGhlIFIt
YiB3YXMgZ2l2ZW4gZm9yLg0KDQpPaCwgc29ycnksIEkgbWlzdW5kZXJzdG9vZDsgSSB0aG91Z2h0
IHRoZSBSLWIgd2FzIGdvb2QgYXMgbG9uZyBhcyBpZGVtcG90ZW5jeSB3YXMgZW5zdXJlZC4NCg0K
PiANCj4gPiB2MjoNCj4gPiAgLSBTZXQgYXBpY19hY2Nlc3NfbWZuIHRvIElOVkFMSURfTUZOIGlu
IHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkgdG8NCj4gbWFrZQ0KPiA+ICAgIHRoZSBmdW5jdGlv
biBpZGVtcG90ZW50DQo+IA0KPiBBbmRyZXcgaGFkIHN1Z2dlc3RlZCB0byB1c2UgMCBpbnN0ZWFk
IG9mIElOVkFMSURfTUZOLiBJIGRvbid0IHNlZQ0KPiBob3cgeW91IGFjaGlldmVkIGlkZW1wb3Rl
bmN5IHdpdGggdGhpcyBhZGp1c3RtZW50LiBBaXVpDQo+IHZteF9mcmVlX3ZsYXBpY19tYXBwaW5n
KCkgaXMgc3VwcG9zZWQgdG8gYWxzbyBydW4gY29ycmVjdGx5IGlmDQo+IHZteF9hbGxvY192bGFw
aWNfbWFwcGluZygpIHdhcyBuZXZlciBjYWxsZWQuDQoNCkl0IHdpbGwuIHZteF9kb21haW5faW5p
dGlhbGlzZSgpIHdpbGwgc2V0IGFwaWNfYWNjZXNzX21mbiB0byBJTlZBTElEX01GTiBzbyB2bXhf
ZnJlZV92bGFwaWNfbWFwcGluZygpIHdpbGwgZG8gbm90aGluZy4NCg0KICBQYXVsDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
