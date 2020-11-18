Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3393F2B8217
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 17:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30119.59881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQYp-0003rI-S3; Wed, 18 Nov 2020 16:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30119.59881; Wed, 18 Nov 2020 16:43:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQYp-0003qt-Ov; Wed, 18 Nov 2020 16:43:59 +0000
Received: by outflank-mailman (input) for mailman id 30119;
 Wed, 18 Nov 2020 16:43:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qNHr=EY=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kfQYn-0003qk-Un
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:43:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24d469d3-28bc-4aec-9c21-b5b625fb08f1;
 Wed, 18 Nov 2020 16:43:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qNHr=EY=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kfQYn-0003qk-Un
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:43:58 +0000
X-Inumbo-ID: 24d469d3-28bc-4aec-9c21-b5b625fb08f1
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 24d469d3-28bc-4aec-9c21-b5b625fb08f1;
	Wed, 18 Nov 2020 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605717836;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=R6hIYOG45qFa7PRlOtL0Zgx3uECGHfegjxHCVTZ9LcE=;
  b=MF4KvfkI3u4YdCacyT4YkQGdyGWviXYYtRveKszaCHoPbO5cxtmifx6Q
   lKTfBJ9cUrCaZ0mV7wwa0KLtn33ahs/O2kE0bUx1ofSHaYRL+P3LepF7R
   SYzFcKeGzkiQo0+CEpfRI7YfJ7T/DtwPqpPhzk9WHkh3qr7azqTWPES9j
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XsbIFo28PLWqy78t02dO4uq0zrCxLKuvUjb62qSFC+kx7Tj3c2vFIuOm9JTKiZUo8WIVNGtv7g
 zWJPEeLnGql+NxVOTrPte4HdEleh5/1V5tZccwn0pzoNcyUr+CyQIXlbhIV/Y2DyATblT/LoQ0
 0uboqIQjrQx45on38tBR4+ztxV/0rpX9DFsVgU6Z7J3OHgrA8xEvkJ1EPVaT/CsQrDwL1nuGB4
 5nq0tyNetaAsagr+iU3XSJzXcLYH1f8p8MoQd/qZbFKu2WxZnId5da2AW1WvLw+9RKAAE5id6K
 JNI=
X-SBRS: None
X-MesageID: 31681163
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,488,1596513600"; 
   d="scan'208";a="31681163"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/IoTvhrXqESemEOucfchzZ8AyjXc7rpcxjak8PxrJFDg3oTHnGD0dd1Rowi6OQ1lYSEPwMWS3lY+B1wQQEI73Vmbwl07lVKdOGE1Itbw2G/A1f9XYC85YS5UNzylDeUUKoz+9mRL0G6V9GPvULvIruSPkLKIq7Nd/4DQKk2zPypTT9VpSeN9trJNwYdzzGMjNfsZe4UmgxIDxqTufjaBr8xJfqWzFwGk+MBmZrzHT698kJSlqtzBDcPr6scW7l7NOb7tRHDernBPKM5q5Sri0SUGCviCOinaq9Czi5hoVcaMTcbOJ53pbKKeTXlruPNFnAkLZzknp0+WKRRR4uo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6hIYOG45qFa7PRlOtL0Zgx3uECGHfegjxHCVTZ9LcE=;
 b=SrR4ab0Z94sne1JWY9qLs18NL1F+b84/zdwjL32mVnRNGXWzt9VfQ2Fd9V42NiBJq2TOUoDjN8KEBCyUv0Qrr3u5BK3TR5Lr1qYyx01olMwxJjkb/NFgeUgWFcKwDVtuLTIGCmr5BIZ/PxDe0aaWQBNIfU4gmSyV6+iWED8Ts3PqKekVvSUa3dcm0iTYTY6lOT716gGAngcVMPTlFa2cPYnMQkDHULJC4dZ+RGRjSTe75R+fkRasNrQyUJLKR/RL5vXJfmAJTK8uRjHNxjPhmUJEcsY1jwPJJb5NGIzmM/1mH99wDzWLRMtyRBsnMjm4s8Cqor0G0aA/8ouHiLQkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6hIYOG45qFa7PRlOtL0Zgx3uECGHfegjxHCVTZ9LcE=;
 b=K7PEkT8KUcVv6w99t8r+vRWkOAEVChWEPJ0YsHynxQ/Aj7tUQGstCj5922rpkhOo79r9+X/DYrkGiZF/u1ypvLWonajkJGJ3042X1lqA87Ayx5oytq/2Z4FY2I5oodGv1bDI7iwwIahIWOoZ+ziQOlMUy69w/Rm6HjB38OiBBgU=
From: Edwin Torok <edvin.torok@citrix.com>
To: "cardoe@cardoe.com" <cardoe@cardoe.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 2/4] automation/: add Ubuntu:focal container
Thread-Topic: [PATCH v1 2/4] automation/: add Ubuntu:focal container
Thread-Index: AQHWvQ7kTNnWBFxzmkalEKaHqdd2WKnOGPCAgAAA8YA=
Date: Wed, 18 Nov 2020 16:43:53 +0000
Message-ID: <7ae96297b3f489e5cf391b2296742c989e41378a.camel@citrix.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
	 <42b2b80779e264d60fa3daf01110fece34f00696.1605636800.git.edvin.torok@citrix.com>
	 <6d97bb1c-dce1-0813-6c8b-0f4ca223dc51@cardoe.com>
In-Reply-To: <6d97bb1c-dce1-0813-6c8b-0f4ca223dc51@cardoe.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd7dcc89-d1bc-4e6e-1179-08d88be122d3
x-ms-traffictypediagnostic: BYAPR03MB3765:
x-microsoft-antispam-prvs: <BYAPR03MB37656BB6B1167AC3F12CC1C99BE10@BYAPR03MB3765.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yjoleNu6Y959Pr5OweBOtN3WWf+SnO5ghbVXvhym07aaGK/8eVV6Y57d6owlIOpod1h5ueo0alEmFDfXvod/j3nwxx0a0qFLGl9YYdNEOxJUdDEjO+pyKCdoZOvl4iuJdtnBRKwhxCEVAckAe7+TFYT/ZF/0zA2ZJBF+5v0GuqiQdM0y5nNI7PQIeIQ1hizeJ9KGbinR6WgvrKnR1/3UzLOYZ5BavQqmStTWbpLGBNMxLz0M0RcRYE7Zy64HbIr9xx5PBka8DygKH77slK5XsUiFt14+PtjmElD1AYfXMxFv3O81MANcRd29WAatyZKsqbMY/J0EEXmBZafwHo5Bag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(2616005)(2906002)(110136005)(71200400001)(316002)(26005)(6512007)(478600001)(83380400001)(6486002)(4001150100001)(186003)(8936002)(91956017)(8676002)(6506007)(53546011)(66556008)(64756008)(4744005)(36756003)(5660300002)(66476007)(86362001)(66946007)(76116006)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NzyOqfgwtw9HKm3kq9VJIE35AApxrjITgKGw8e87oty83k69l+aNNQB4lCl/mUiJHNtE/2PtPiEotxJD13JNWg3Lm9XTZz/7UL/+tf/oOV4weuwlAXlPAX4G1TpYT2jcSRI7SETbQzEHXSrunJ5r6Jn7x0z8rqVVCe0ENkz/FjeOUZo/HP/1yKH9Is+pFCOajf6glYuQJF71wMxurzXcosRKI7MrKm7rcdS42AdLPtIt0Ob7eFKMrV3GVH5vU2FqUKN7R2NhGSF0Vo+CNNO772oRJhSdt7PnI9d1709gyA4CU0VTBRPIAp5uEy2ndu32gMGOgHvcGgmp07yFM8i7x++3x1CY8yOA/URfAXSjChqo+vsQDNHrHVwoOfWr39ymlQA6JRf3At4VUvmFWQNmssrUF2Vc/8YBCdzmbLL25MpTXbp9VzJT3X5HG1/puLLFeY2WFU/a7sbhIzkFmn+49B9C57aV1QtP2fowNPoCqdt5SssFYzJw+O+4wupa+Ehc2Su3Ao/0vgE0+Y0CXHs7+UmGdX5BvhK1O4EzO3Sq4vjueZtQaQwoCNnzobNtJ/tnjoPKH8ONu+xI7PrJYoijXfqk78a31cGgA6zFQSIaB7YjI66MraHaVFUUY2ubIOJUybBFLXFteUexezxmDyDSNKTbqNe8ozT6oOYZRNU1+iCXrPhsahPg6Ag5qEAsLbRHq1NGnb5JJAoy82K0tLZGgluSXWmXO4FGvyXoLobqXaA9uGOnE6pTQmpQrCe01PuAalpL4rKrnhzwxZEdkeZMuQH1kmYJc++YeMbqhqdJ4RfidPTJgH3nEUGTYfGL63vVxf1bN+0w5YM0YAftisgXtAv3P/Ub3caAy3EQOCZx1aKbBSol5Jl1lhX8YZLkrBFqcrn09nJ+F31GJarVuhyyOw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD9122F5782F4A4E863C4D1279754C65@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7dcc89-d1bc-4e6e-1179-08d88be122d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 16:43:54.0209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGv/91JvswMfAGPM1AEUJTxgALfe861h8BKuJUyYBlNQ3m1jiSbX0TeHMEbH84fELBnlIw5UMiDDwm8FRGJILQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3765
X-OriginatorOrg: citrix.com

T24gV2VkLCAyMDIwLTExLTE4IGF0IDEwOjQwIC0wNjAwLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToN
Cj4gDQo+IA0KPiBPbiAxMS8xNy8yMCAxMjoyNCBQTSwgRWR3aW4gVMO2csO2ayB3cm90ZToNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0K
PiANCj4gTG9va3MgZ29vZC4gRG8geW91IGhhdmUgcGVybWlzc2lvbnMgdG8gcHVzaCB0aGUgY29u
dGFpbmVyIG9yIGRvIHlvdQ0KPiBuZWVkDQo+IG1lIHRvPw0KPiANCj4gQWNrZWQtYnk6IERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4NCg0KVGhhbmtzLCBpZiB5b3UgY291bGQgcHVz
aCBpdCB0aGF0J2QgYmUgZ3JlYXQuDQpJIGRvbid0IGhhdmUgYW55IHNwZWNpYWwgcGVybWlzc2lv
bnMgb24gdGhlIGdpdGxhYiByZWdpc3RyeS4NCg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg0K

