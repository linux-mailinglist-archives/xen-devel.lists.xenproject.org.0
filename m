Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85140B7370
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 08:52:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAqFu-0004H5-4F; Thu, 19 Sep 2019 06:49:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hJAN=XO=amazon.de=prvs=1581112ce=wipawel@srs-us1.protection.inumbo.net>)
 id 1iAqFs-0004Gn-T2
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 06:49:29 +0000
X-Inumbo-ID: 9edd72ba-daa9-11e9-964e-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9edd72ba-daa9-11e9-964e-12813bfff9fa;
 Thu, 19 Sep 2019 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568875766; x=1600411766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=QqYZkDq/MCMhJhIDfD8w54YQnqh3dagq2oFsTg0XI9k=;
 b=rr3EXjZNidjvvCvkLvgdi7tf/DHMh3W9ruBqa6mPD8vYAYas4SWHtY8Q
 cGmn3DPdV1pfzVPtG0TTSV6OUx8wivCNCJq4U2p//hSBw//Oo46gOf5p6
 Iz9axvDsnIkdpEQhhiiXCgxCuizFMOMErWX77lwSmwN26Cj+AEu0LVknf U=;
X-IronPort-AV: E=Sophos;i="5.64,522,1559520000"; d="scan'208";a="834322922"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 19 Sep 2019 06:48:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 31DDBA26FE; Thu, 19 Sep 2019 06:48:52 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Sep 2019 06:48:52 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 19 Sep 2019 06:48:51 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Thu, 19 Sep 2019 06:48:51 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Lars Kurth <lars.kurth@citrix.com>
Thread-Topic: [PATCH] create-diff-object: more precisely identify .rodata
 sections
Thread-Index: AQHVbfOz/MMBt+ID2EWJUuzwV092UacxMOkAgAAAuYCAAAoqAIAAA2sAgAAA4oCAAAnWAIAAAk0AgABB74CAAQKDAA==
Date: Thu, 19 Sep 2019 06:48:51 +0000
Message-ID: <3127EB86-D659-4976-854D-56A19F4504BA@amazon.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
 <f164b812-4b52-bf5b-d48a-57fcc1e824cf@arm.com>
 <0DDE80F8-7E7A-4A2D-B2E3-E8E7C626A608@amazon.com>
 <17F0ADCC-4CA6-4E32-BD49-D71F6C6C2991@citrix.com>
In-Reply-To: <17F0ADCC-4CA6-4E32-BD49-D71F6C6C2991@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.63]
Content-ID: <C7BCF5D33EB5FB4AA13885EE02EF6698@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTguIFNlcCAyMDE5LCBhdCAxNzoyMywgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBj
aXRyaXguY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4g77u/T24gMTgvMDkvMjAxOSwgMTI6Mjcs
ICJXaWVjem9ya2lld2ljeiwgUGF3ZWwiIDx3aXBhd2VsQGFtYXpvbi5kZT4gd3JvdGU6DQo+IA0K
PiANCj4gDQo+PiBPbiAxOC4gU2VwIDIwMTksIGF0IDEzOjE5LCBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gSGkgUGF3ZWwsDQo+PiANCj4+IE9uIDE4
LzA5LzIwMTkgMTE6NDQsIFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90ZToNCj4+Pj4gT24gMTgu
IFNlcCAyMDE5LCBhdCAxMjo0MSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+
IHdyb3RlOg0KPj4+PiANCj4+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIGNy
ZWF0ZS1kaWZmLW9iamVjdDogbW9yZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJvZGF0YSBzZWN0aW9u
cyIpOg0KPj4+Pj4gT24gMTgvMDkvMjAxOSAxMDo1MiwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdy
b3RlOg0KPj4+Pj4+ICQgc2NyaXB0cy8uL2FkZF9tYWludGFpbmVycy5wbCAtZCB+L2dpdC9saXZl
cGF0Y2gtYnVpbGQtdG9vbHMNCj4+Pj4+IA0KPj4+Pj4gJy1kJyBvbmx5IHRlbGxzIHlvdSB3aGVy
ZSB0aGUgcGF0Y2hlcyBmaWxlcyBhcmUuIFRoZSBzY3JpcHQgd2lsbCBsb29rIHVwIGZvciB0aGUN
Cj4+Pj4+IE1BSU5UQUlORVJTIGZpbGUgaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5Lg0KPj4+PiAN
Cj4+Pj4gSG1tbS4gIEkgd29uZGVyIGlmIHdlIGNvdWxkIGRldGVjdCB0aGlzIHNpdHVhdGlvbiBz
b21laG93LiAgVGhpcyB3aWxsDQo+Pj4+IGJlIGEgY29tbW9uIHVzZXIgZXJyb3IgSSB0aGluay4N
Cj4+Pj4gDQo+Pj4gSSBzaG91bGQgaGF2ZSBsb29rZWQgdHdpY2UgYmVmb3JlIHNlbmRpbmcgdGhl
IHBhdGNoIG91dC4gQnV0LCB3aGF0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCBmb3IgbWUNCj4+PiBp
cyBhZGRpdGlvbmFsIG9wdGlvbiB0byB0aGUgYWRkX21haW50YWluZXJzLnBsIHNjcmlwdCBsaWtl
OiAtbSAuL01BSU5UQUlORVJTDQo+PiANCj4+IFdlbGwgdGhlIGZpbGVuYW1lIHdpbGwgYWx3YXlz
IGJlIHRoZSBzYW1lLCBzbyBhdCBiZXN0IHlvdSB3aWxsIHByb3ZpZGUgcmVkdW5kYW50IGluZm9y
bWF0aW9uLg0KPiANCj4gICAgTm90IGlmIEkgY3JlYXRlIGEgZ2l0LWlnbm9yZWQgc3ltbGluayB0
byB0aGUgb3RoZXIgcmVwby4NCj4gDQo+IFlvdSBjb3VsZCBhbHNvIHB1dCBhZGRfbWFpbnRhaW5l
cnMucGwgb24gdGhlIHBhdGgNCj4gDQo+IFVudGlsIEkgaW1wbGVtZW50IGEgZml4LCAgSSBmaXhl
ZCB0aGUgZG9jcy4gU2VlDQo+ICogaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvU3Vi
bWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzI1VzaW5nX2FkZF9tYWludGFpbmVycy5wbF8uMjhv
cl9nZXRfbWFpbnRhaW5lci5wbC4yOV9mcm9tX291dHNpZGVfb2ZfeGVuLmdpdCANCj4gKiBodHRw
czovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNo
ZXMjU2V0dGluZ190aGF0X2hlbHBfc2F2ZV95b3VfdGltZSANCj4gDQoNClRoYW5rIHlvdSBMYXJz
LiBJIHVwZGF0ZWQgbXkgc2NyaXB0cyBhbmQgd29ya2Zsb3dzIGFjY29yZGluZ2x5Lg0KDQo+IExh
cnMNCg0KQmVzdCBSZWdhcmRzLA0KUGF3ZWwgV2llY3pvcmtpZXdpY3oNCg0KDQoNCgoKCkFtYXpv
biBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJl
cmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIFJhbGYgSGVyYnJp
Y2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0
OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
