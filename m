Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFBC63EE6F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450489.707776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h9y-0002NQ-78; Thu, 01 Dec 2022 10:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450489.707776; Thu, 01 Dec 2022 10:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h9y-0002L6-4W; Thu, 01 Dec 2022 10:51:18 +0000
Received: by outflank-mailman (input) for mailman id 450489;
 Thu, 01 Dec 2022 10:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPp1=37=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p0h9x-0002Kx-3y
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:51:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33d44a89-7165-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 11:44:59 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB8942.eurprd08.prod.outlook.com (2603:10a6:102:320::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 10:50:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 10:50:46 +0000
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
X-Inumbo-ID: 33d44a89-7165-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW/nnohK1x5fbnzUHhXpSDghJ7KvLd7qgGDM0eZlcH7WBoEe/fLpUegAN6gMTas9AFiXtgUdrwuM+ygRyw/o5vcwregDm0v2w1CAu90mqQnTlJYCKIITkTgEJHc6XW8Ca9Y3MjFJhF8JVV8IIva4E+dkP81nCkPTp46i7Tyc/77+OohiLGxzL+R0ZB4azaMYLQHmSIk5YKpsIL/z3ov1wayM2r9CU/a4+2+4Ln74IS/0nVovFBXSsgtFKkRJAqcYI5PLYzZaDUTay/4IpFPNviidubhhtv0E1FLDBDzvn+0OqU5nZ9yRr/YI9NsCxQBxw+NVad8aWVZO7EfLRSf2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au/SVUP37GbPN4KtC4vztrnIPax4n84nmcvzPryxBDQ=;
 b=iY7R9ZusQIleGGbpxrZYv/NTx3p3RZnJgR870VFUA2M9Twh1/hIbKTFfGfBQFbccJ23Z14zf41cyIdb53amu1E86PYvQ2llkEa76UvKWh5KZT+3yNHqHgreHjOP0UgOJ5uI0H/4xjd6yIo+crVdFD3wrkjQyo7hKpV+SKxHWoZLjOK3R3vXUf3xmMViRJoU6AFQE902+y/p4hReezEzx95qmYrgxZ62UDeXXcAQnvrx2vXW+uP/hhA6cIcHpny7loEsNRpstdC3/a9z8jW9Yf6W5JM1/PeGeSYuwnxj4v9IUGEqkD9/NMZ+IfIPRlFl2WVSU4dCPDaJfOeemWBttEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au/SVUP37GbPN4KtC4vztrnIPax4n84nmcvzPryxBDQ=;
 b=BcuUCvG4UMqAl3wHsXg6K1ZSLE+QpHjgcNkqE0snN2ctmmL6IaLphIOJjnhCBwrVCw+N53t/ZY/K1A2VaaJG6EVNmnoUtjMeEnbwqmW1GbqJsGfMRBeTXnVydTaaJUFhYy9NVT5NfWWMI7e+TclrFcJJeZ4ideHLE1PSWY+uPLE=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Thread-Topic: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Thread-Index: AQHZADhFhRdqD5Su4EO+T+vPnuMlg65PXSeAgAmHn8A=
Date: Thu, 1 Dec 2022 10:50:45 +0000
Message-ID:
 <AS8PR08MB7991D653E57C71D2B4D4B0C992149@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221124190850.35344-1-julien@xen.org>
 <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
In-Reply-To: <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AC14B4A755B02C48944213DD3C2C820E.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|PAVPR08MB8942:EE_
x-ms-office365-filtering-correlation-id: 1ff6c485-4ef2-4ec7-7a75-08dad389e6a7
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KZTP2nv8rzsWPN3vzqQfH5DFdAoBu5AC3pPF3DM4K674hBmnylq3N4rIbzFidqOxHnOmiBPWovEBpf9TR24F57QQMPulWAn3/HVQYTKTOy9cDVmxHvHkrs3YXLHLesQMo7MdU2QJQMjiw+M6qWQUiUopsmkpaG3I0x1zpyEmiNA/kBnAj3Wd4u/ZdbYAFt/avcMmLXQxSDhUKcvLSCQx0rxTdB6KxlgPxsSMvG05SbSHxsut0nkCh2kSOgcFnDhKWftkp22+cwCsQEQuL60e7rPdZHF+h58+P1LWymX/uHl6pc28S51xaXdJ2/fz8igMT7TySfOpxObnJPNrzGA4OOalP0LU9L3gDPDDR0Z+SskoldoA85/tbwLMmnVUSuUM9RVgRDKOz6We68INYOfgTdz1Xy1/JUzsCFdxCIAgnBc8xi3tKiwaJK+XNUjYOHMYBUjWNmzlgG2CxphFejXEpKBWqDA51TYo6qOsajbdpV3jNlUbyg7hO/letA1SOtgE58tPMzemXzJQVlwPkSJ4dHB+LVEMPowTHd6peUNAItw9BtCd25nduKqPzbWuYTpPGVOq8v9bKhTZdyPvm7r1E0UskWSLfo7fx2+fmX7gz/M6g5eigLKhGPPlMD17xtXDgCvToC2cSLCYlQX46aXuQXEROxaZnfyO6DIbOmTQ8AgGoSytVahQ1CzeJDXr7fgC8E6seg2tQkOX6RQaEVK06Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199015)(9686003)(6506007)(8676002)(26005)(7696005)(53546011)(54906003)(76116006)(66946007)(110136005)(71200400001)(4326008)(66556008)(66476007)(66446008)(64756008)(41300700001)(478600001)(5660300002)(186003)(52536014)(8936002)(83380400001)(2906002)(316002)(86362001)(38070700005)(55016003)(33656002)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzBqQ2Y2Ym5ZV1BXQU02TnMxaTl1YVhIS1NneFgrUHlGM0VneTlPY2o1SkVa?=
 =?utf-8?B?QkxQMXUyVW5QejgrK09yNlVNRVBQT1hLRlZ6eUI4UldtWTFYMndmQ0tncVVx?=
 =?utf-8?B?RU51WDVmR2VjSjJmU3h3ZmI0QWVZYjNxMERISldvOVFoZExpSjF4Z01UNVcy?=
 =?utf-8?B?Z2FwelFiKzVqMHd6UXpzT2NPWHEzTDlZalVpbmpYSHhSYnVjRVd5bm9oRG1I?=
 =?utf-8?B?LytFdVdYQkhTQ0ViakQ4MmNhd1hvTldsc1BsZU1ONjBnb1Yzc3VYVHgwOFRB?=
 =?utf-8?B?NUZwS1RvNllFb21NdDl1K29zQXJjaTNTQkYyR2grNVBSVDg1aGtJemJqeW9J?=
 =?utf-8?B?eVJOc09JZUZaUFYxN3JXaVR1ZWczTEs2RGdidFBmaE1wZE5OTHpXc3h1VEl6?=
 =?utf-8?B?VDhGQ2pReCtlSFJ0aWtqQmduYzk2dnR0VGdzaDN6czROZzRzcFRrUWU1S0to?=
 =?utf-8?B?NWpYTVpaRUtnVFo3ckJCaC95cjE3RmJ3UTJRRmNLeTRjSkZvVGoxcmYvVVNM?=
 =?utf-8?B?ajdEZ0YreUIvZ054U2pWbzNpZUNiT2lKdnE4dlRqRXg3UEl1d2VOKzJvRnpX?=
 =?utf-8?B?dUZHT1J3dWlVS09LWVljUkFORlUzaE1yY1BybER2RlROSDV1Z1p5azVHcHE0?=
 =?utf-8?B?ZFJsTkVFUGNXTlN6VkQxRG55dmNKbjE1UDJwS3BtczlUeVpXRXhxVGRvMXBE?=
 =?utf-8?B?eDY2TjdqTFg2TTNnUHhtODcxUVIvdzRWVGlFN2ZvN0ZWTGNiZ0w0YXN0YTFh?=
 =?utf-8?B?Q0diMUg5QTR3U3k2VEF3WlpUK01kSUlYcXBoSmtORDhHY3pIQlBXcmxVM2dJ?=
 =?utf-8?B?TjdCd0swNW9tYkdzc2todTQwMzhsM1FnWEs4RUNKaTJNSFVUV204OWFoSFNX?=
 =?utf-8?B?eHpqcmRqNDJlYXU1dnc1eXg3TG8xMXY2ZkFRSmxDSUpSYUIzeWxBNjJYOEUz?=
 =?utf-8?B?TWgvOGRwbG1uRGQ5aEZaOFNSUHZDVWVGNXdkM2pjZ2JuQ3RXcjBHek9mRjRn?=
 =?utf-8?B?R2M3TlVhT3AvUzZROGN3RnpKVSsyZnVydUg2QlA3TmJWeG5pY3NOVTB2Z1Rl?=
 =?utf-8?B?d0pRSWM2a0EzVk1QelBsb3Z6MHRSc3MreWxlVTNrQXR2bWFnQVlNTFVSeUY1?=
 =?utf-8?B?M2VqRWE2ekJyMTRKdlg0TS9Kamp6eituLzBnVk96NVFjcHpDeUhHMm9CVjdw?=
 =?utf-8?B?SjFMSDl2MXF1RFpWYTFjcXdDUzFUcm4zdjlGTjR0L212R082dEpCdXhIZ3Jm?=
 =?utf-8?B?aUtIcmhqOFhsN2RIak1sVnJ0Zi8yMktxZW8xMm9GWjFHTENCa3JxK28xcURF?=
 =?utf-8?B?aTk3dnp3SUcyajEzUE9IaG1KSEw0RHlDV2psbFBYNVNsMHBGWEl2dWRVVUwx?=
 =?utf-8?B?bC9WWnFFcTBMNnFYU2Mxa2xNVjJaZkxDU09kK20rcXdFQUxQeWdWVEFtSXFY?=
 =?utf-8?B?bnoxd1FpSHFNNXE3TEg1aUNBc0N3NG1iWkRjMlpMRmFIbmNzSHRqUzBkNjdx?=
 =?utf-8?B?b1BwZDk3eEtrNSt6S0ljeXpaR0R1VGJxdjZORTc5QkVJUnFvSEpaYmpEWDdT?=
 =?utf-8?B?a29oKzRiZEo4S05RSWJmSFlqa3NQOFFRZHljeDNoS2FwYkJ0T3pKVUIwZ1VZ?=
 =?utf-8?B?aXNFTkVEam5uTDFzeUlNSExmVUR0dHJXSFY5NmNIbDJITVFENjBIYkV0MUhS?=
 =?utf-8?B?RVI0TDhaclN5UkxUWFZOY2JzSFRZYnN5ZzJHUDJNZU0zTWxsSm0vTUQzcVN4?=
 =?utf-8?B?cWpyTmpoaTlCZmVybzlVMEMwYnVlTHJ0YVhHRlBkS0tUZmpwNFNiTWVpOFJW?=
 =?utf-8?B?c0xsSm83QlA4a2k2QW1RcS9LOUFZNXRFdHpER1FxeG1CVCtZZUp5enBJbzUw?=
 =?utf-8?B?NDJjOEtKeDdwZ0tVa2xyM2lhclo3bUVhR25rUU0xbUFVMnpUcEpzUW1RdkhM?=
 =?utf-8?B?eVczdWU1eS9LeHNLSmZ1L2h1LzN4ZkJWaHFKN3lVbzA0eXZZMmZmOUFLWHUy?=
 =?utf-8?B?UkIrK0ZzT3B2TmVteGdrcVBnUUlVQTR2bzVvclA0MkNmN2VvUHJaaDMrVU1w?=
 =?utf-8?B?b2dmZkx1MnBTMElLZ1B0ZHlCNXJUNlltZ0Z6VFR3VlFNaExzRks4TDQ1NTlB?=
 =?utf-8?Q?sxfnZsOcli6TgoG0L6tHbXc/m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff6c485-4ef2-4ec7-7a75-08dad389e6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 10:50:45.9593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mevrFAFtZX8oN5VyBMsOzgC8eQrufHo2s03iwztqIGA28tWwoV1Ojn+F0oCm8UW0F9Ww6yYLgNNnHHM8G7Gi0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8942

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjJdIHByb2Nlc3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdDogRXhwbGFpbiBob3cg
dGhlDQo+IGJhbm5lciBpbiBSRUFETUUgaXMgZ2VuZXJhdGVkDQo+IA0KPiBPbiAyNC4xMS4yMDIy
IDIwOjA4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4gRnJvbTogSnVsaWVuIEdyYWxsIDxqZ3Jh
bGxAYW1hem9uLmNvbT4NCj4gPg0KPiA+IEV4cGxhaW4gaG93IHRoZSBiYW5uZXIgaW4gUkVBRE1F
IGlzIGdlbmVyYXRlZCBhbmQgdGFrZSB0aGUgb3Bwb3J0dW5pdHkNCj4gPiB0byBtZW50aW9uIHdo
YXQgaXQgc2hvdWxkIGxvb2sgbGlrZSBmb3IgUkMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4gQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8
SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpXaXRoIHByb2JhYmx5IEphbidzIGNvbW1lbnQgaW4gLi4u
DQoNCj4gYWxiZWl0IHdpdGggYSBjb3VwbGUgb2Ygbml0czoNCj4gDQo+ID4gLS0tIGEvZG9jcy9w
cm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0DQo+ID4gKysrIGIvZG9jcy9w
cm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0DQo+ID4gQEAgLTQ4LDcgKzQ4
LDEyIEBAIHQ9UkVMRUFTRS0kcg0KPiA+DQo+ID4gICogY29uc2lkZXIgYnVtcGluZyBzb25hbWVz
IG9mIHNobGlicw0KPiA+DQo+ID4gLSogY2hhbmdlIHhlbi11bnN0YWJsZSBSRUFETUUgKHNob3Vs
ZCBzYXkgIlhlbiA0LjUiIGluIHJlbGVhc2VzIGFuZCBvbg0KPiBzdGFibGUgYnJhbmNoZXMsICJY
ZW4gNC41LXVuc3RhYmxlIiBvbiB1bnN0YWJsZSkNCj4gPiArKiBjaGFuZ2UgeGVuLXVuc3RhYmxl
IFJFQURNRS4gU2hvdWxkIHNheToNCj4gPiArICAgIC0gIlhlbiA0LjUiIGluIHJlbGVhc2VzIGFu
ZCBvbiBzdGFibGUgYnJhbmNoZXMNCj4gPiArICAgIC0gIlhlbiA0LjUtdW5zdGFibGUiIG9uIHVu
c3RhYmxlDQo+ID4gKyAgICAtICJYZW4gNC41LXJjIiBmb3IgcmVsZWFzZSBjYW5kaWRhdGUNCj4g
PiArDQo+ID4gKyogICBUaGUgYmFubmVyIGlzIGdlbmVyYXRlZCB1c2luZyBmaWdsZXQNCj4gPiAg
KiBjaGFuZ2UgeGVuLXVuc3RhYmxlIENvbmZpZy5taw0KPiANCj4gUGVyaGFwcyBpbnNlcnQgYW5v
dGhlciBibGFuayBsaW5lIGJldHdlZW4gdGhlc2UgdHdvIGJ1bGxldCBwb2ludHM/DQo+IE9yLCBp
ZiB0aGV5J3JlIGRlZW1lZCB0byBiZWxvbmcgdG9nZXRoZXIsIHJlbW92ZSB0aGUgb25lIHlvdSBp
bnNlcnQ/DQo+IA0KPiBUaGUgbmV3IGJ1bGxldCBwb2ludCB5b3UgYWRkIGFsc28gd291bGQgbGlr
ZWx5IHdhbnQgdG8gbWF0Y2ggdGhlDQo+IG90aGVycyBpbiBzdHlsZSwgYm90aCBmb3IgdGhlIG51
bWJlciBvZiBzcGFjZXMgYWZ0ZXIgKiBhbmQgZm9yIG5vdA0KPiB1c2luZyBhIGNhcGl0YWwgZmly
c3QgbGV0dGVyIChtYXliZSAiZ2VuZXJhdGUgYmFubmVyIHVzaW5nIGZpZ2xldCIpLg0KDQouLmhl
cmUgYWRkcmVzc2VkIChjYW4gYmUgZml4IG9uIGNvbW1pdCkuDQoNCktpbmQgcmVnYXJkcywNCkhl
bnJ5DQoNCg0KPiANCj4gSmFuDQoNCg==

