Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29A178D99
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 10:38:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9QRj-0001Eu-JF; Wed, 04 Mar 2020 09:36:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B1xp=4V=amazon.co.uk=prvs=325108782=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9QRi-0001Ek-1p
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 09:36:06 +0000
X-Inumbo-ID: 915d9fb8-5dfb-11ea-b52f-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 915d9fb8-5dfb-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583314565; x=1614850565;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tR/EyUHH2HZOch5WWD8k5uacRNtABDp+X260S9sNfCI=;
 b=dQeyFFhVx7EJs52yynqFOF3lNFyoA+TZl3jPX5lasNEMWto2a6yqG1aZ
 E1i48jZkPKZe+sNZ9O+Sd/TrIGD/4QjZVsOd9umA+CE3WCkmt26VZWzV4
 BxG+CI0Fl7McFLs9P04NEFp0NgbDJI0eAzz33B9x6Djk1w+xuuiSzyF6Y 4=;
IronPort-SDR: JG4gDDZCSjtmGPGwhCFe8cIQiG4JVhyYNtHhHPfqXbeTuBOb6jGB6xgHO0lsMCA3QmZrD9a7HH
 9Vc3GIH/gbGA==
X-IronPort-AV: E=Sophos;i="5.70,513,1574121600"; d="scan'208";a="30494505"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 04 Mar 2020 09:36:03 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 78B3FA25D4; Wed,  4 Mar 2020 09:36:02 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 4 Mar 2020 09:36:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Mar 2020 09:36:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 4 Mar 2020 09:36:00 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH] tools/libxc: Reduce feature handling
 complexity in xc_cpuid_apply_policy()
Thread-Index: AQHV8YlFieUExEMPxUSsCu1SVcjNd6g4LXDg
Date: Wed, 4 Mar 2020 09:36:00 +0000
Message-ID: <ebdabb32be23448f8dd95c9a62c0ed5e@EX13D32EUC003.ant.amazon.com>
References: <20200303182326.16739-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200303182326.16739-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.41]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] tools/libxc: Reduce feature handling
 complexity in xc_cpuid_apply_policy()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgQW5kcmV3IENvb3Bl
cg0KPiBTZW50OiAwMyBNYXJjaCAyMDIwIDE4OjIzDQo+IFRvOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFdl
aSBMaXUNCj4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+OyBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1hlbi1k
ZXZlbF0gW1BBVENIXSB0b29scy9saWJ4YzogUmVkdWNlIGZlYXR1cmUgaGFuZGxpbmcgY29tcGxl
eGl0eSBpbg0KPiB4Y19jcHVpZF9hcHBseV9wb2xpY3koKQ0KPiANCj4geGNfY3B1aWRfYXBwbHlf
cG9saWN5KCkgaXMgZ2FpbmluZyBleHRyYSBwYXJhbWV0ZXJzIHRvIHVudGFuZ2xlIENQVUlEDQo+
IGNvbXBsZXhpdHkgaW4gWGVuLiAgV2hpbGUgYW4gaW1wcm92ZW1lbnQgaW4gZ2VuZXJhbCwgaXQg
ZG9lcyBoYXZlIHRoZQ0KPiB1bmZvcnR1bmF0ZSBzaWRlIGVmZmVjdCBvZiBkdXBsaWNhdGluZyBz
b21lIHNldHRpbmdzIGFjcm9zcyBtdWxpcGxlDQo+IHBhcmFtZXRlcnMuDQo+IA0KPiBSZWFycmFu
Z2UgdGhlIGxvZ2ljIHRvIG9ubHkgY29uc2lkZXIgJ3BhZScgaWYgbm8gZXhwbGljaXQgZmVhdHVy
ZXNldCBpcw0KPiBwcm92aWRlZC4gIFRoaXMgcmVkdWNlcyB0aGUgY29tcGxleGl0eSBmb3IgY2Fs
bGVycyB3aG8gaGF2ZSBhbHJlYWR5IHByb3ZpZGVkIGENCj4gcGFlIHNldHRpbmcgaW4gdGhlIGZl
YXR1cmVzZXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bXpuLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
