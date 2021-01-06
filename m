Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ECE2EBFB2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 15:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62508.110747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA0r-0006t1-M1; Wed, 06 Jan 2021 14:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62508.110747; Wed, 06 Jan 2021 14:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxA0r-0006sc-Iv; Wed, 06 Jan 2021 14:42:13 +0000
Received: by outflank-mailman (input) for mailman id 62508;
 Wed, 06 Jan 2021 14:42:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9426=GJ=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kxA0q-0006sX-Bi
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 14:42:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a32e989-33ed-484d-8ef7-b6c10c246e95;
 Wed, 06 Jan 2021 14:42:10 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2a32e989-33ed-484d-8ef7-b6c10c246e95
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609944130;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8dMb9EJaOWVqqPPxP4lqTFSV/+mSoUIq+yV8BMS3F34=;
  b=FU72HpATvVRX5vi5JIbKooSxbCXnE+Td2lYDW22032l8I5HATELzcv0E
   bJiTMH1JN89dYBNt60q3UZ5Y2DITrlyg36G66N5nWqehlYzuOCv9NzQ1J
   g1dxpxwYkmMwUXzPLoLW3cbuq750mfmIy+gH4gZVlFo8uKYs2ZVr7ZexG
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DsGA/0Gpvef2Ct1vFUGdi7bcpg/SnaA6SsAif0ffwib8XpgaDoNGkFG+1rrR5TjJ/52zdyDYZF
 35y68aiNXdvlu7gGm3L4StOc3FT1HofF01jhZ2HMjGifN3SOa2UJVDzjRTbZeHMe3eUxW/hY3S
 dGHw2CND+NSIssgo+QOMa3DgQEtTDNuXDvrEiLGktE1hqM8QKzzMns2T053eBJ5xU3bC1n54Tx
 Thwdj6ZwBtqAKpgueV3J/kfjtl7PGpbWacZLqs34dA0IAM0GjYPc5+kJxqildNXjTn/SNdjMok
 4qU=
X-SBRS: 5.2
X-MesageID: 34729759
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,480,1599537600"; 
   d="scan'208";a="34729759"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW8shd+qy1zF4Gvsc8SLfarmng5gg5RGnN6+6A+J8JWV2jS1bFxu4QoZFLa2qDNI1A1EFlf4FECL41kA60Q9K8kpvSOLkgvaxthr/Anc/D+FHslP8e2udcH7xqjFqqRhAYoC6JTgTYqL4B5MSjUYJ2AOZeaFmioxS0936sjMEjxXf07JGHSSekXH/MqaS5AmtF5s+5lY+6fJDUq9ndv54Z5rNlC9d5dF70BT0BwCeul7WbnYMNpia6OibHo1mKbvZVPrfpru1NA4GHGhzz//MmrQ41lrGTrmw2abBZpeHEoLjQiHP2HrRQgGrb/K+LbQauN5vXuFipfPETVd+uHLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dMb9EJaOWVqqPPxP4lqTFSV/+mSoUIq+yV8BMS3F34=;
 b=oWszoN74hY8ySe77YTLfGg/Vh307hSp1ioXCXp5Vx1QMKJBcC+wF+ixmbVVzdfGvJuVmX0uemv8R21GvJUMEd9wk49B5mUcB0a4/NrCzPGdwzjqwHZgtOdggvws+lLlTDqpH2C6HHRc0TnZryaaXBVfM+e74Yz5GPQF4dIdY4kA4lbfHNZt2/9bt5CRSPlKFRO96c/TVdoman8LpRzXl9YALNoylnAnn5+T0Yu0/R7YOF5iqXP9TgBGkFOVqvt9IeuMdcwNzmK9fnizXEFW+8I2lCWJis+StA87fL1q041OGsW5cVsHnmAIyCD0EMR7TYToP1VJWfJxc3X0d5IFj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dMb9EJaOWVqqPPxP4lqTFSV/+mSoUIq+yV8BMS3F34=;
 b=A0GJLs1jh1rVGbIyrG+27LsosKT156kXqMOOK8diK+27vNFeMh+AGUBbjqTKUx40DP6OzTFvBjPX4iF+1eJDd5mCiQXWudQx0+YilnX1T/56NPetiNOSABNACApGn8O+chYXNq0gcJaQxKcHKpGRVVN8ndG96fT6c9TDwtUGpik=
From: Edwin Torok <edvin.torok@citrix.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
	<julien@xen.org>, "wl@xen.org" <wl@xen.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"jgrall@amazon.com" <jgrall@amazon.com>, George Dunlap
	<George.Dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v10 06/25] tools/xenstore: add live update command to
 xenstore-control
Thread-Topic: [PATCH v10 06/25] tools/xenstore: add live update command to
 xenstore-control
Thread-Index: AQHW5DasU1BxCsIJ+UqM32f3+7Ll9aoaq8UA
Date: Wed, 6 Jan 2021 14:42:05 +0000
Message-ID: <d2d7ff33b2d255517a90cbf649761fb23385aefb.camel@citrix.com>
References: <20201215163603.21700-1-jgross@suse.com>
	 <20201215163603.21700-7-jgross@suse.com>
In-Reply-To: <20201215163603.21700-7-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.38.1-1 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23c6a316-167b-44ef-803c-08d8b2513d26
x-ms-traffictypediagnostic: CO2PR03MB2151:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR03MB2151BDB0C7D41254E1C658929BD00@CO2PR03MB2151.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4L1kcqK5+ifbqwJFPrdZSJsq62ZO5Dp7GAwqr23DoW0HLp+/51BDPzKRof0/hAmK6QfAbXPzDA65hY+zcWaZR90KTLn36/XqlfTnypLbTAIRLqAMwjisfxWCcigrRX1OBLppl7a4zy8xpi/OtBdzkjLQu8gM0+KUv3wLr/wrqyf7NqyeFhUOSbxHDluMfqhxYlS9ysC7mD1yX2WSeZ1mauyCx+jUoReB9d5rtW8vuV6uFikR2fwdIepmS5su+mNzp+yPNEOa+9Dg9nJBHgRO0cdnTSuOI+bdnGR/Uamab8GkcJm71RwsHbPJdD6NvjoFPjNlMNgFp4xGbUlzjytmjuWDwZ9F9Pw0edSdlzTz9DYNJZq+YB2QfGds2RTrmcLV0b+ExIEB/Q7Hezy0zFeYWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5873.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(8676002)(6486002)(8936002)(2616005)(91956017)(71200400001)(5660300002)(107886003)(6512007)(66446008)(186003)(26005)(83380400001)(6506007)(4001150100001)(86362001)(66946007)(316002)(15650500001)(2906002)(76116006)(36756003)(478600001)(66476007)(66556008)(64756008)(54906003)(4326008)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZDB4ZnRYelEwUjVERmpwcG9HczlnV0VCYnl6S2tvSERtcFJtN1hDdGR5SmJi?=
 =?utf-8?B?ZG95eTZEaytpL1l5b2dPT1ZHVlRNVUxyN0g5dDRSby8xbXlZQzA2aTdqMkY4?=
 =?utf-8?B?S0M0d1B3cWNjMGZ0NEN1ZktFUHQrYzVsYytyamNBQi9RRVR5WEFGNEZIcWFx?=
 =?utf-8?B?MnJDREJJVVVsUE03M2RzUEFyckdSYnZXVEpTaXlFYldkT0ZlYjJpU1N0clZr?=
 =?utf-8?B?eS9ENDIrVDg5S2N2VjlVZUdHTFpJQ01qM0paQjU1WVhsUEVScm5jOEM3YXhl?=
 =?utf-8?B?QkpyQmFMd2EyZGR0QWlQcUZGUDRjZ3ZqNXlJbXB3N1NCeVphaUZLLzZCVFcy?=
 =?utf-8?B?aWd1M25HSTZuZ3ZvVGFFeHl1UkZHTjhLUTBzZy9sTWNxaDlMUVVwSVgyTGhP?=
 =?utf-8?B?cXdFeHh4YWVEdE95MzZUWlZVamE2QXZLWUgwU2Zkd3F2MkFjell6eDVkakx0?=
 =?utf-8?B?VHJDdmt2OU5EUURpNUpYRDM5cldFS3pHVjNzZkRRbTlrMUZNS3FEazNZOVhx?=
 =?utf-8?B?bTNKdFY2d0pQcjZjMUNmL1NOYUd4Umo1RURCNFR4Q3oxbUo5bFFOYUN1cEVh?=
 =?utf-8?B?akNWalJwdjgzTEVUQm9SbUhSS2h5MzJEanVFRndiaFRXa1QxU0pKbGdiY0Fy?=
 =?utf-8?B?WDhKZ0xqV0tsY01PRUhqelgrZ1JhNFlxWis4OThVL0dCcWNXQjhhRTVZclBa?=
 =?utf-8?B?dS9nU2VqYXJLS1BtdFlTelZLbDdYRTFOVkJUWVY2RWYvd2ZUNDhYay83bnNk?=
 =?utf-8?B?elVTV2pwUWF5SHBhQlhEVTcyL1FlVUc1eEl4K2UvRjBpWjdYUFROSjZYOER1?=
 =?utf-8?B?WWg2K1lEZ1hrN1Y5RFJTekYvRTgxa1ZZSEZwMHU1NVU2djBxOXE2Y0E5YjV4?=
 =?utf-8?B?cjh4WFBtS05TTUhqZTZ6c1pva2IvQ3FTU0tmZTkrcVlnSGRQOG5uQ1F0MENL?=
 =?utf-8?B?M2lvNmdIUDV3ak1XTzQrYm9EYklEYVErNFdrRVF3eCsya0w2MDNScm9HVjcx?=
 =?utf-8?B?MnRwSG81cUZWUmhSOFVmVUhPaGRPK0d0eDBzdG13SVUyUEoxUFhlbURicm40?=
 =?utf-8?B?RTlCMWtjSVRJaHl2VWxndEFMM09EczRCSXlPMHptZkVWL2NXMThUbE5tM1I2?=
 =?utf-8?B?SVh0eGRsZ1ZCTlBVakw4RklNUHpMRnp4WmNvTE11ZWVNeUN4Z0VsbU5YTUJX?=
 =?utf-8?B?SEFTbDBJNi9STjcrN3hoTmNLSHRrU3creG40djVDN05zQXA3dUpHU3FMa2l4?=
 =?utf-8?B?cTJ6Q0VJWXExRE16cGQ4SHZ5eEZWVG9RbWNjcHNhR2ZYSHNoNWtBVHZIZkFO?=
 =?utf-8?Q?tHFhBR9Ew4Q1yl0uRNLWsAVX3YusvK9l8M?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D823496431F6874A98AA3FA51B63ECDD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5873.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c6a316-167b-44ef-803c-08d8b2513d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 14:42:05.9709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsGPK0Uz+EPAEqb9BNkS+TYpHbt7QYi3gXwLkvfHh9t0hLXPNjKQb0SG2IcrDVYx4EJ961OA8350Qr0jezoRrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR03MB2151
X-OriginatorOrg: citrix.com

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDE3OjM1ICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
DQo+IFsuLi5dIA0KPiArc3RhdGljIGludCBsaXZlX3VwZGF0ZV9zdGFydChzdHJ1Y3QgeHNfaGFu
ZGxlICp4c2gsIGJvb2wgZm9yY2UsDQo+IHVuc2lnbmVkIGludCB0bykNCj4gK3sNCj4gK8KgwqDC
oCBpbnQgbGVuID0gMDsNCj4gK8KgwqDCoCBjaGFyICpidWYgPSBOVUxMLCAqcmV0Ow0KPiArwqDC
oMKgIHRpbWVfdCB0aW1lX3N0YXJ0Ow0KPiArDQo+ICvCoMKgwqAgaWYgKGFzcHJpbnRmKCZyZXQs
ICIldSIsIHRvKSA8IDApDQo+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsNCj4gK8KgwqDCoCBs
ZW4gPSBhZGRfdG9fYnVmKCZidWYsICItcyIsIGxlbik7DQo+ICvCoMKgwqAgbGVuID0gYWRkX3Rv
X2J1ZigmYnVmLCAiLXQiLCBsZW4pOw0KPiArwqDCoMKgIGxlbiA9IGFkZF90b19idWYoJmJ1Ziwg
cmV0LCBsZW4pOw0KPiArwqDCoMKgIGZyZWUocmV0KTsNCj4gK8KgwqDCoCBpZiAoZm9yY2UpDQo+
ICvCoMKgwqDCoMKgwqDCoCBsZW4gPSBhZGRfdG9fYnVmKCZidWYsICItRiIsIGxlbik7DQo+ICvC
oMKgwqAgaWYgKGxlbiA8IDApDQo+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMTsNCj4gKw0KPiAr
wqDCoMKgIGZvciAodGltZV9zdGFydCA9IHRpbWUoTlVMTCk7IHRpbWUoTlVMTCkgLSB0aW1lX3N0
YXJ0IDwgdG87KSB7DQo+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSB4c19jb250cm9sX2NvbW1hbmQo
eHNoLCAibGl2ZS11cGRhdGUiLCBidWYsIGxlbik7DQo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXJl
dCkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7DQo+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoc3RyY21wKHJldCwgIkJVU1kiKSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJl
YWs7DQo+ICvCoMKgwqAgfQ0KDQpXZSd2ZSBkaXNjb3ZlcmVkIGlzc3VlcyB3aXRoIHRoaXMgZHVy
aW5nIHRlc3Rpbmc6IHdoZW4gYSBsaXZlLXVwZGF0ZSBpcw0Kbm90IHBvc3NpYmxlIChlLmcuIGd1
ZXN0IHdpdGggYWN0aXZlIHRyYW5zYWN0aW9uIGhlbGQgb3BlbiBvbiBwdXJwb3NlKQ0KeGVuc3Rv
cmVkIGdldHMgZmxvb2RlZCB3aXRoIGxpdmUtdXBkYXRlIHJlcXVlc3RzIHVudGlsIHRoZSB0aW1l
b3V0IGlzDQpyZWFjaGVkLg0KDQpUaGlzIGlzIHByb2JsZW1hdGljIGZvciBtdWx0aXBsZSByZWFz
b25zOg0KKiBmbG9vZGluZyB4ZW5zdG9yZWQgcmVkdWNlcyBpdHMgdGhyb3VnaHB1dCwgYW5kIG1h
a2VzIGl0IHVzZSAxMDAlIENQVS4NCkRlcGVuZGluZyBvbiB0aGUgaW1wbGVtZW50YXRpb24gYW5k
IGNvbmZpZ3VyYXRpb24gaXQgbWF5IGFsc28gZmxvb2QgdGhlDQpsb2dzICh3aGljaCBpc24ndCBm
YXRhbCwgdGhlIHN5c3RlbSBzdGlsbCBzdGF5cyBhbGl2ZSBpZiB5b3UgRU5PU1BDIG9uDQovdmFy
L2xvZywgYnV0IGl0IG1ha2VzIGl0IGRpZmZpY3VsdCB0byBkZWJ1ZyBpc3N1ZXMgaWYgYSBsaXZl
IHVwZGF0ZQ0KZ2V0cyB5b3UgdG8gRU5PU1BDIGFzIHlvdSBtYXkgbm90IHNlZSBhY3R1YWwgZmFp
bHVyZXMgZnJvbSBhZnRlciB0aGUNCmxpdmUgdXBkYXRlKS4NCiogZmxvb2RpbmcgeGVuc3RvcmVk
IGNhdXNlcyB0aGUgZXZ0Y2huIHRvIG92ZXJmbG93IGFuZCBBRkFJQ1QgbmVpdGhlcg0KeGVuc3Rv
cmVkIG9yIG94ZW5zdG9yZWQgaXMgY2FwYWJsZSBvZiBjb3Bpbmcgd2l0aCB0aGF0IChveGVuc3Rv
cmVkDQppbmZpbml0ZSBsb29wcyB3aGVuIHRoYXQgaGFwcGVucykuIElJVUMgdGhpcyBuZWVkcyB0
byBiZSBmaXhlZCBpbiB0aGUNCmtlcm5lbCwgc28gaXQgZG9lc24ndCByZXR1cm4gRUZCSUcgaW4g
dGhlIGZpcnN0IHBsYWNlLiBBcyBhIHdvcmthcm91bmQNCkkgYWRkZWQgYSBzbGVlcCgxKSBpbiB0
aGlzIGxvb3ANCiogdGhlIHRpbWVvdXQgaXMgaGl0IG9uIGJvdGggY2xpZW50IGFuZCBzZXJ2ZXIg
c2lkZXMsIGJ1dCBkZXBlbmRpbmcgb24NCnJvdW5kaW5nIGFsbW9zdCBhbHdheXMgaGFwcGVucyBv
biB0aGUgY2xpZW50IHNpZGUgZmlyc3Qgd2hpY2ggcHJldmVudHMNCnVzIGZyb20gZGlzcGxheWlu
ZyBhIG1vcmUgaW5mb3JtYXRpdmUgZXJyb3IgbWVzc2FnZSBmcm9tIHRoZSBzZXJ2ZXIuIEFzDQph
IHdvcmthcm91bmQgSSBpbmNyZWFzZWQgdGhlIGNsaWVudCBzaWRlIHRpbWVvdXQgYnkgMnMgdG8g
Y29wZSB3aXRoDQpyb3VuZGluZyBhbmQgZ2l2ZSB0aGUgc2VydmVyIGEgY2hhbmNlIHRvIHJlcGx5
LiBPeGVuc3RvcmVkIGNhbiByZXBseQ0Kd2l0aCBhIGxpc3Qgb2YgZG9tYWlucyBwcmV2ZW50aW5n
IHRoZSBsaXZlLXVwZGF0ZSBmb3IgZXhhbXBsZS4NCg0KTXkgd29ya2Fyb3VuZHMgbG9va2VkIGxp
a2UgdGhpczoNCkBAIC00Miw2ICs0Myw5IEBAIHN0YXRpYyBpbnQgbGl2ZV91cGRhdGVfc3RhcnQo
c3RydWN0IHhzX2hhbmRsZSAqeHNoLA0KYm9vbCBmb3JjZSwgdW5zaWduZWQgaW50IHRvKQ0KICAg
ICAgICAgbGVuID0gYWRkX3RvX2J1ZigmYnVmLCAiLUYiLCBsZW4pOw0KICAgICBpZiAobGVuIDwg
MCkNCiAgICAgICAgIHJldHVybiAxOw0KKyAgICAvKiArMSBmb3Igcm91bmRpbmcgaXNzdWVzDQor
ICAgICAqICsxIHRvIGdpdmUgb3hlbnN0b3JlZCBhIGNoYW5jZSB0byB0aW1lb3V0IGFuZCByZXBv
cnQgYmFjayBmaXJzdA0KKi8NCisgICAgdG8gKz0gMjsNCiANCiAgICAgZm9yICh0aW1lX3N0YXJ0
ID0gdGltZShOVUxMKTsgdGltZShOVUxMKSAtIHRpbWVfc3RhcnQgPCB0bzspIHsNCiAgICAgICAg
IHJldCA9IHhzX2NvbnRyb2xfY29tbWFuZCh4c2gsICJsaXZlLXVwZGF0ZSIsIGJ1ZiwgbGVuKTsN
CkBAIC00OSw2ICs1MywxMiBAQCBzdGF0aWMgaW50IGxpdmVfdXBkYXRlX3N0YXJ0KHN0cnVjdCB4
c19oYW5kbGUgKnhzaCwNCmJvb2wgZm9yY2UsIHVuc2lnbmVkIGludCB0bykNCiAgICAgICAgICAg
ICBnb3RvIGVycjsNCiAgICAgICAgIGlmIChzdHJjbXAocmV0LCAiQlVTWSIpKQ0KICAgICAgICAg
ICAgIGJyZWFrOw0KKyAgICAgICAgLyogVE9ETzogdXNlIHRhc2sgSUQgZm9yIGNvbW1hbmRzLCBh
dm9pZCBidXN5IGxvb3AgcG9sbGluZw0KaGVyZQ0KKyAgICAgICAgICogb3hlbnN0b3JlZCBjaGVj
a3MgQlVTWSBjb25kaXRpb24gaW50ZXJuYWxseSBvbiBldmVyeSBtYWluDQpsb29wIGl0ZXJhdGlv
biBhbnl3YXkuDQorICAgICAgICAgKiBBdm9pZCBmbG9vZGluZyB4ZW5zdG9yZWQgd2l0aCBsaXZl
LXVwZGF0ZSByZXF1ZXN0cy4NCisgICAgICAgICAqIFRoZSBmbG9vZGluZyBjYW4gYWxzbyBjYXVz
ZSB0aGUgZXZ0Y2huIHRvIG92ZXJmbG93IGluDQp4ZW5zdG9yZWQgd2hpY2ggbWFrZXMNCisgICAg
ICAgICAqIHhlbnN0b3JlZCBlbnRlciBhbiBpbmZpbml0ZSBsb29wICovDQorICAgICAgICBzbGVl
cCgxKTsNCiAgICAgfQ0KDQpUaGlzIGFsc28gcmVxdWlyZWQgdmFyaW91cyBoZXVyaXN0aWNzIGlu
IG94ZW5zdG9yZWQgdG8gZGlmZmVyZW50aWF0ZQ0KYmV0d2VlbiBhIG5ldyBsaXZlLXVwZGF0ZSBj
b21tYW5kIGFuZCBxdWVyeWluZyB0aGUgc3RhdHVzIG9mIGFuIGFscmVhZHkNCmNvbXBsZXRlZCBs
aXZlLXVwZGF0ZSBjb21tYW5kLCBvdGhlcndpc2UgSSBhbG1vc3QgYWx3YXlzIGVuZGVkIHVwIGRv
aW5nDQoyIGxpdmUtdXBkYXRlcyBpbiBhIHJvdyAoZmlyc3Qgb25lIHF1ZXVlZCB1cCwgcmV0dXJu
ZWQgQlVTWSwgY29tcGxldGVkDQphZnRlciBhIHdoaWxlLCBhbmQgdGhlbiBhbm90aGVyIG9uZSBm
cm9tIGFsbCB0aGUgcmVwZWF0ZWQgbGl2ZS11cGRhdGUNCnJlcXVlc3RzKS4NCg0KSSdkIHByZWZl
ciBpdCBpZiB0aGVyZSB3YXMgYSBtb3JlIGFzeW5jaHJvbm91cyBwcm90b2NvbCBhdmFpbGFibGUg
Zm9yDQpsaXZlLXVwZGF0ZToNCiogdGhlIGxpdmUtdXBkYXRlIG9uIGl0cyBvd24gcXVldWVzIHVw
IHRoZSBsaXZlIHVwZGF0ZSByZXF1ZXN0IGFuZA0KcmV0dXJucyBhIGdlbmVyYXRpb24gSUQuIHhl
bnN0b3JlZCByZXRyaWVzIG9uIGl0cyBvd24gZHVyaW5nIGVhY2ggb2YNCml0cyBtYWluIGxvb3Ag
aXRlcmF0aW9ucyB3aGV0aGVyIHRoZSBjb25kaXRpb25zIGZvciBsaXZlLXVwZGF0ZSBhcmUgbm93
DQptZXQNCiogd2hlbiBhIGdlbmVyYXRpb24gSUQgaXMgc3BlY2lmaWVkIHdpdGggdGhlIGxpdmUt
dXBkYXRlIGNvbW1hbmQgaXQNCmFjdHMgYXMgYSBxdWVyeSB0byByZXR1cm4gdGhlIHN0YXR1cy4g
QSBxdWVyeSBmb3IgZ2VuZXJhdGlvbiBJRCA8DQpjdXJyZW50IElEIHJldHVybiBzdWNjZXNzLCBh
bmQgZm9yIGdlbmVyYXRpb24gSUQgPSBjdXJyZW50IElEIGl0DQpyZXR1cm5zIGVpdGhlciBCVVNZ
LCBvciBhIHNwZWNpZmljIGVycm9yIGlmIGtub3duIChlLmcuIHRpbWVvdXQgcmVhY2hlZA0KYW5k
IGxpc3Qgb2YgZG9tYWlucyBwcmV2ZW50aW5nIGxpdmUgdXBkYXRlKQ0KKiB0aGUgZ2VuZXJhdGlv
biBJRCBnZXRzIGluY3JlbWVudGVkIGV2ZXJ5IHRpbWUgYSBsaXZlIHVwZGF0ZSBzdWNjZWVkcw0K
IA0KVGhpcyB3b3VsZCBlbGltaW5pYXRlIHRoZSBuZWVkIGZvciBhIGNsaWVudC1zaWRlIHRpbWVv
dXQsIHNpbmNlIGVhY2ggb2YNCnRoZXNlIGNvbW1hbmRzIHdvdWxkIGJlIG5vbi1ibG9ja2luZy4N
Ckl0J2QgYWxzbyBhdm9pZCB0aGUgYnVzeS1wb2xsIGZsb29kLg0KDQpPYnZpb3VzbHkgYW55IGNo
YW5nZSBoZXJlIGhhcyB0byBiZSBiYWNrd2FyZHMgY29tcGF0aWJsZSB3aXRoIHRoZQ0KYWxyZWFk
eSBkZXBsb3llZCB4ZW5zdG9yZWQgYW5kIG94ZW5zdG9yZWQgd2hpY2ggZG9lc24ndCBrbm93IGFi
b3V0DQpnZW5lcmF0aW9uIElEcywgYnV0IHlvdSBjYW4gdGVsbCB0aGVtIGFwYXJ0IGJhc2VkIG9u
IHRoZSByZXBseTogaWYgeW91DQpnZXQgYmFjayBPSy9CVVNZL3NvbWUgZXJyb3IgaXQgaXMgdGhl
IG9sZCB2ZXJzaW9uLCBpZiB5b3UgZ2V0IGJhY2sgYQ0KZ2VuZXJhdGlvbiBJRCBpdCBpcyB0aGUg
bmV3IHZlcnNpb24uDQoNCkkgcmFuIG91dCBvZiB0aW1lIHRvIGltcGxlbWVudCB0aGlzIGJlZm9y
ZSB0aGUgZW1iYXJnbyB3YXMgdXAsIHNob3VsZCBJDQpnbyBhaGVhZCB3aXRoIHByb3RvdHlwaW5n
IGEgcGF0Y2ggZm9yIHRoaXMgbm93LCBvciBkbyB5b3Ugc2VlIGFuDQphbHRlcm5hdGl2ZSB3YXkg
dG8gbWFrZSB0aGUgbGl2ZS11cGRhdGUgY29tbWFuZCBtb3JlIHJvYnVzdD8NCg0KDQpCZXN0IHJl
Z2FyZHMsDQotLUVkd2luDQo=

