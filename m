Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559AE266088
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:45:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjMb-0005JY-Ga; Fri, 11 Sep 2020 13:45:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGjMZ-0005JT-Rv
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:45:16 +0000
X-Inumbo-ID: 5c37c172-a94a-4fa0-b66d-f1f85f26ce0e
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c37c172-a94a-4fa0-b66d-f1f85f26ce0e;
 Fri, 11 Sep 2020 13:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599831915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TS7Mczg/TxE6jici2P80uWEGchQUUNw5cBKkYvFLpec=;
 b=PalG788myHSBeLAD3/gK9BZIiEUwcGxOsTbxaOynsGTmvh/Rv5PTDrRM
 zJRUY52kp7D0jVBUSJ7HA1ipvM9zmQSfUqOyUmEFSbqVGsY9ILZTyWJts
 CqJQ74lQjWpZqpTlvbJxjAoNKlbRJwt97NP5iFAZc1vtDQEpv3ZxViy8O Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: ESrl5dGLxtRDEsiwbodAgeawbraleKXFc28SFw2vXL2C5Mf5Us814+k2bzanEk75xIkouj8zEL
 Y0OwUQ6+W6ZeW9zBgZA6CvrtwBcmcA+Aa5vsLqoWC40/5qin0ZRlX5LFdIYWmaGZNGYgYFRvY1
 1/QhVcJxX8ZSFzOmJWks0XZ08aYsP9wZNCu3uSvJmrRthEjYM3p6PMTB/om4kpFhk/7WEXa0Gc
 9av0JeNYBbasTYZF3LUsVJpEOofC2Sd3mSWs2ANB3pcmbB8/XMYtr5bSTmErvLNUfBXTvmSpiM
 RF0=
X-SBRS: 2.7
X-MesageID: 26503575
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26503575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJb9JRnPOZwEjnAnldIwM0YBSqLfAofLgFBdon4HPzKKjd0PqHagszaHo0FychbWx7ffjEKIxYTf+LsI04xMlrfJSZxN/HHqbdl54dhtKPv1EN9EDOu+Ms1nq+HeeoWilpGZfXomlI5XtG2N32z0F6e9iVzVmxxririSclPQo1qVFCbLhXlf7EA/YWMZ4DoBt5xjCqGuYKWz4HUITqCkEdQGBcP2hrPjkuZURr3kPNHXW2953WIF+crSwRHHmVHutc4zoA+Xrj/7Dd+9eL6NqdWYgQ++DEedEWSiywryVm6N8XQwDyJ/bG8AfESSnvTH8H8TBcl7+sJFo8rThR5KRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS7Mczg/TxE6jici2P80uWEGchQUUNw5cBKkYvFLpec=;
 b=fc6SLH8eoSWaF4MybEiWFNeUltX1xTJUWwH112qnhf+8gCjcG6QFrUdFkVhJuBARw+UfZ0vyjfdHIJulExPxQbrA4LO1TYlc6M5In1CSGWeJo1UgGYWM9l0vV2spjrLMJMaPzhiN+m0wC2jQjyt0aLKVeUvaUQHbbficJ/mhhgRqsJq2U0U8xxRJZ9enY8Tz5t5KgyTw2chzNfYwfqzKBxEP4PQMFFu6bUgT+GjS9bg3bWvaL35IChg/cn4s5AOGbdpYlKVel6C2ZtOMDWODWq3AkP0djaLQioTOQ74DNQGNF7dB9vKQvbyKMLviJDnxWrdqb80L+tdBLYbUSCuI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS7Mczg/TxE6jici2P80uWEGchQUUNw5cBKkYvFLpec=;
 b=F5ou2Oy3mg0Zf885ORwF7mltAwokEb2D5Go0JFSm73HACojhOIreymGwZQgQeBJNZKzdeqGEELypUMMXRsocmlhg1c2KJLv4hZ0cagdpM+Ic+zFr9WOIxD2I6B3bC6y+AFBxRaRFPNBDGU/3jusDFe7us74aLLiv4Yadij8APNg=
From: George Dunlap <George.Dunlap@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/8] Convert code-of-conduct to rst
Thread-Topic: [PATCH 3/8] Convert code-of-conduct to rst
Thread-Index: AQHWiDjClz8wC2eStESN9MqHP+Wcr6ljcYmAgAABjQA=
Date: Fri, 11 Sep 2020 13:45:11 +0000
Message-ID: <4A125962-E3A9-42A5-8EF1-432665F1E080@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
 <20200911124009.3760032-4-george.dunlap@citrix.com>
 <cdd7fad9-933b-ce81-f71a-017d839fd967@suse.com>
In-Reply-To: <cdd7fad9-933b-ce81-f71a-017d839fd967@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60b45e9c-d7d0-4c12-4402-08d85658e766
x-ms-traffictypediagnostic: BYAPR03MB3702:
x-microsoft-antispam-prvs: <BYAPR03MB3702156381FBC01ED6BA1B0C99240@BYAPR03MB3702.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oYNZk/9e2yvyVoxJlGCNeJcjYQP6ZJG92zpDH6NHrNRh6C6ppuQj8kvKb+ZsF354/+lvxDNVTFPHWW5wDJzmGOj9/oaxJZWFfGkqt4NFejS9KnKhtktZwnDSvu5LvLiyG14xMcSq5VjQwCKS+yWMzvBTixOvPSgMKJJYznOJyR2avQmdaivCBr00/cgFq+GqK63LXEtg4TJ2nMRWZpOS75cG70Cad2JoDeGjlONHVhO/WLuctKANUdhqcoYRufYNhw3cFe7g90Eq9j1x/Q4iZOT7gBe8V/fhgQtdw5xGOgNK3i36ueHaX/0M8t909KHAqGYaNEUUWF2N1K1njm4LxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB4229.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(8936002)(316002)(6486002)(6512007)(2616005)(2906002)(8676002)(71200400001)(508600001)(5660300002)(4326008)(186003)(26005)(66476007)(91956017)(76116006)(6916009)(64756008)(66556008)(66946007)(4744005)(66446008)(36756003)(33656002)(53546011)(55236004)(6506007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Qdtar+UtzvExzwtN4cEgF1wB4WmBfViN/xCweoBfkNS+k3HnZ2xugJzHVwJg16XOZIYuST5mJxrmmjtJ04yeUOcdbiK5bJIG8a9MPWXcIh+8ipEx3Kgb/e/uv2n4IKYRnfg0zEMzOdWA8RsNoesmwNQFHuuF+jBPfly+H2qurvvup02QiTVsSgyu2YBh3ecUiqff1rJDdKOJ8Eat0CwQM8KHviAhV4uo7mhsTZYO26Pp3CB/UIQ5eItZoo6Oe9UG3QhOfjzu2w8SuU/nE4IgYIF2I+YyzKZQvEU8BVq7tP71BwU6eTs5ftY3yKkrW4sw85uRvSHBqZ2KkimWkFE9f6Qsvx2D5qfFFjBM6voEGXi13tvC7sbmV2ba101JJUH41wcny4+fl/TF2LowE02FXbTHwJOBh8aUH27ZzkVL6u2HXWpZcNBO/D5nrMZtX5aVg0qWE8qG5KlK0ORnLGQsXAWxTXmtKwNaFMMnkfcTJEOwBAySHi4a2psMDK7L+LSGosYqB6VxbyGQkDX0OK5BY9+DYZHBG2lgmdHUN23V2DcBhV8AWtza5kdWQnBrQ4uaBLXU4t2zbjvLf8V5tflw0VvQDIwnqcFQ12VA9ijIIHi61HqDmFTjzXLchNbzY1UsE2sB1XRIupUiRM5nK+z/AQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC2A07791A339848B234C5E6114D7956@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4229.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b45e9c-d7d0-4c12-4402-08d85658e766
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 13:45:11.0755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unAzD2ktMEkNgpAzhBoeV8WrfD5Z0OtX4GbHp5WFMeqzqqd7xPit/+eZzfnUyQnnsGnfgiiRkuVtqwFkIqn7QeRi35rhB8RO4zreZgQKtys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3702
X-OriginatorOrg: citrix.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gU2VwIDExLCAyMDIwLCBhdCAyOjM5IFBNLCBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEuMDkuMjAgMTQ6NDAsIEdlb3JnZSBEdW5sYXAg
d3JvdGU6DQo+PiANCj4+ICtDb25kdWN0IFRlYW0gbWVtYmVycw0KPj4gKz09PT09PT09PT09PT09
PT09PT09DQo+PiArDQo+PiAgQ29uZHVjdCBUZWFtIG1lbWJlcnMgYXJlIHByb2plY3QgbGVhZGVy
c2hpcCB0ZWFtIG1lbWJlcnMgZnJvbSBhbnkNCj4+ICBzdWItcHJvamVjdC4gVGhlIGN1cnJlbnQg
bGlzdCBvZiBDb25kdWN0IFRlYW0gbWVtYmVycyBpczoNCj4+ICsNCj4+ICAqIExhcnMgS3VydGgg
PGxhcnMgZG90IGt1cnRoIGF0IHhlbnByb2plY3QgZG90IG9yZz4NCj4gDQo+IE1heSBJIHN1Z2dl
c3QgdG8gYWRkIGEgcGF0Y2ggcmVtb3ZpbmcgTGFycyBmcm9tIHRoaXMgbGlzdD8NCg0KWWVzLCB0
aGF0IHdvdWxkIGhhdmUgYmVlbiBvbiBteSBsaXN0IG9mIHRoaW5ncyB0byBkbyBhZnRlciB0aGlz
Lg0KDQpPbmUgdGhpbmcgSSBtZWFudCB0byBtZW50aW9uIGluIG15IGNvdmVyIGxldHRlciBpcyB0
aGF0IEkgdGhpbmsgd2UgbWlnaHQgd2FudCBhdCBsZWFzdCBvbmUgbW9yZSBwZXJzb24gdG8gYmUg
b24gdGhpcyBsaXN0LCBzbyBpdOKAmXMgbm90IGp1c3QgSWFuIGFuZCBJLg0KDQogLUdlb3JnZQ==

