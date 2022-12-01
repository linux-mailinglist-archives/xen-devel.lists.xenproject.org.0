Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97F63EE5C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450479.707766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h7k-0000cy-OG; Thu, 01 Dec 2022 10:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450479.707766; Thu, 01 Dec 2022 10:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h7k-0000a0-Kg; Thu, 01 Dec 2022 10:49:00 +0000
Received: by outflank-mailman (input) for mailman id 450479;
 Thu, 01 Dec 2022 10:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPp1=37=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p0h7i-0000ZW-Dc
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:48:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfb455f9-7164-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 11:42:38 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM8PR08MB5555.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 10:48:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 10:48:53 +0000
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
X-Inumbo-ID: dfb455f9-7164-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jM6SHU9xGLfbm2E7j9Z/uqiM5SET+FjdVPMYa3163rZP5g3rImTMk0jppgYZ6tnetLWWwhFN7ya/JGcQ8Tk3+IqtmCC3rUb9PnYjZFkpFRyBJGjjzIuyxi8MTtjx/HYhxJVZJ1EAHM8r5o00dxNjYOaG9dHIQD7R5OFdG9NssCb45C54a0HR4rmmvWye+AhqigkqlkBiHwH1h7kE9u9DlRsu8LQPU5/MsCzqOhrJv5VcxgGH3+S1SARVH86JQ0vhVC1XTyNC6dufcLJqs8Qqyz+y6V0QXe5JnUsIoQSB0Ri3bUYscJYpcWNZq0EWkx8gsvretuWhGUunuhb2kLmUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJgbn/OfsoSxZLP08cdFBMVko5YHIMUG/63e/pLLhEs=;
 b=CmXBLpGIRQjeUBqT1tIPLSGRiSKdAHQTv99TDC3J1WTFMWbH0TNW0b72rQOzIiHlgLoNbccYToteDOeW9NpIY9pE+sn/+RtUw5VMCSanEHFZgxl/ae2ESHMB4+iXBE7xuiG6JTPQ1VAs5M5/ta1+Q8PuM4NIhgUSrEhCfu+WXkhtE4AZ/8ClHrFBJPDTcuGeLKnRBasKYXsz3z/ty2jUNqYDt8CgGkHYIZyIQ67Fzh5ZYizqVh0+PP/5alzD3+I35xC9Xy74cyBYd0Gqkob8ennOBJ009Svae0zZE7XUc5HCM1ecCBHtlCk5fT4ZPrbphEDlTaSbvAKk8zCce7ajYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJgbn/OfsoSxZLP08cdFBMVko5YHIMUG/63e/pLLhEs=;
 b=RlJczsZCH4QPu0icC5C2I/lDgW1k5AYYpS1idK1AybcsNphL1L9OeUpaRfKagghG8PM0zjExbuQ9WjXibdBDdx5lVnx2lJAAvzqonjxIOGN15B/hzrTgXE3h9tgQJB16ggQObS8C+x0Iu8qF7Ax/34kqNa0McuX25rE0+upAgSY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>
CC: Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Subject: RE: [XEN PATCH maybe for-4.17] tools/include: Fix clean and rework
 COPYING for installed Xen public header
Thread-Topic: [XEN PATCH maybe for-4.17] tools/include: Fix clean and rework
 COPYING for installed Xen public header
Thread-Index: AQHZACPfEf1QBbGukEOhjAs3RngERq5PYGEAgAmEPHA=
Date: Thu, 1 Dec 2022 10:48:52 +0000
Message-ID:
 <AS8PR08MB79916C4575526E489AEA11B592149@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221124164254.33476-1-anthony.perard@citrix.com>
 <c84ff394-cb16-937a-c2dc-d535d3887f4b@suse.com>
In-Reply-To: <c84ff394-cb16-937a-c2dc-d535d3887f4b@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D00247993EFB664ABA2500F888E346FC.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|AM8PR08MB5555:EE_
x-ms-office365-filtering-correlation-id: bcbbefeb-868a-4137-1045-08dad389a346
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RGKq+d9e9gszWiQ5eVoE34Cl5G6qM8pIDotDgbTgMxtHruRhlwGlmGA2pkgu4cVwxGSHOI+1FxKIcmm5ZAVcSTAosXS2kRrUpylELUuao/U4CfFiMDvuMSSstnn6uCfSl8a9BsvMbnK3U/qKmh8G/TAIVmPnONN7n2gGpRZjd9BZAsAoFitcczC6wIF/N+03DswnxGihzDnKJAkKBdOMuF+t57TbiYHGG6y73ko65JGPOqqaHhub4lX+pCxCFSd2j8hj1CBXc/s/c7zAi86fZy5HGaC9tXlCyRIUL45Kq54xxcXbKLWuPorswutTl7Jew9X0eJeIQ0N/Ra/ljrkxIpVM3aTzz47Er0QbPWC2AeR85CkTZWHN8S+9nSyo4hoFroplNHjeAaip9oUirNF8aYUp+0zP3ZsaQgWUUmDwVjW9II1RDMItZYw2oqUzRqnW4sFvVK7rsg7PEd9TUH2Ud3BYfYiUgf4spx2yJlT2ZYrqRTiDE776DRvB4wTMq8JfuVshcilvwySOasHXc+AIJ+WsR7/enYaHMK8jKoCzk6F/rk6zVN5hsCQB7RY0RULLRVnSHXmTZAPflDdyHM3FLUSgVbcDXqbDZicm+EK8rR1/A9EIKzNRobxLmKoytlXVSLF31whH6ActQIWDy96/Z+ulXFqxR09dXMQruJncPg7hW7IbkEnDPs/8ROSlIMX2XTlkThfSypo3rcDdxoqwh8T/GsFmifP/Py+lFyfU/PvZrRS7koIbc1IfI0wdHehS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(186003)(9686003)(7696005)(122000001)(5660300002)(86362001)(4744005)(64756008)(66476007)(66946007)(26005)(66446008)(66556008)(38070700005)(33656002)(8676002)(6506007)(55016003)(38100700002)(52536014)(8936002)(53546011)(478600001)(83380400001)(71200400001)(4326008)(54906003)(41300700001)(76116006)(2906002)(316002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3QwY1BnQzFUR0ovd0FnSllseWR2S2NIaU02ckl4YmpVWmRMOHN6VVJqY1N6?=
 =?utf-8?B?bUxTd29mZnRIRFdWVnloVVV1OFZOYWNDYXErVGpORDhzQUoxWDdCZ25VM2JZ?=
 =?utf-8?B?a0tVTDRUdWkrUlNIQWo0cG83K2lXWlFpZnJCMHR3S3JXZjJxNjBOSFZmWWYw?=
 =?utf-8?B?T0R6Uks0dExFOTJRRE9zQTYybFdLOWZMeHJQemYvZERHOTd2VnJKNTdGdk0y?=
 =?utf-8?B?YzBaaGwvd3ROcHF1Y21EbXhsTTljTHVOR0Zsc2xlb1J1YnprNGM4UDZ2c0tS?=
 =?utf-8?B?ZVNaazlsM2p1WUhZMEZMQzlHM3JmWGhwWEszc1J1YTdzSVA3U1hqSkJVdjZD?=
 =?utf-8?B?V1lGSlBiZkIyRG1JSit4ZUNpQi91WGZyNExDdGdETkhsV1Bjb2pnbGloRDJl?=
 =?utf-8?B?aU5JU3pJcUN3TlRmM1JZM1YwWFZtNkMvSTdIalNRcGRlTTN3b2w0eXFQM0tH?=
 =?utf-8?B?ai9ac0NIemFFQVI3SncrYWtReGFDT2lCSS9VZXJlc1dxY0RtSFFqZngyZi8x?=
 =?utf-8?B?TjllSnNjKzBOZmhiWmhIV1NoQTBFd2g2YklHeThEL1VqTlhrcXZOTSs0UWRS?=
 =?utf-8?B?YmE0dXEvTnBOb1ZmUVk2SGdYZ283VVJWdUNvU2pVLzVFajQ5YitBQlJac2l3?=
 =?utf-8?B?MWhCVFU1OVpCVlZiRGhlSGFaUUFSVEQ0VWRSeHRpKzgzZlVzRDdTQWthSGNO?=
 =?utf-8?B?M012WlpyUjIvU21EL0t3OUN6ckdTVUJ5QXlkSkJjWFBTU2RhbjdTZnUwQ3d4?=
 =?utf-8?B?UUVMN28zNG4zSEV3SE1GR2Rmb1Njc2x3eVcvRUxnMWtzSnhPR2t1RzVtcEJC?=
 =?utf-8?B?UEJUYmhVc2kyU3RaQzZVT1QxNGc5djV2T25iWWFhenBFbUY3ZHFVVU1jK2tB?=
 =?utf-8?B?R2c5dDRjeGI4ZG1ZSEZxTzYrMlJiU0xuaEQ3SmRrNXN3dmpzdG4vNWpHazQ2?=
 =?utf-8?B?Z1NDenNiNG5DbERZQVEyOTFlVm13cG40WmNwZWZFeGdjcFptTEhHeFNLOGZP?=
 =?utf-8?B?bjB2dDdNcW1lU3lNUktla0h3MmsycndpQThsTzN3MGhmMnV2djJoK3Zhcnk3?=
 =?utf-8?B?RHluS0RGeUhZV3pwVmNnWWlDMDFDczk2SmRUaXJYaUlTc1pmTHNkb2xRWERX?=
 =?utf-8?B?Sk5Xb21GdUhJU1ZBV1ljM29pdUlmWFhqN0ZidkRvMVcrdDRENUhKK29XSXRI?=
 =?utf-8?B?WUVHMGxrc1FFYXQ1MEdGMVBxbzhHTE5DVm9lTEVOMmNGTUhiNHFIUGdvMTIr?=
 =?utf-8?B?M3hxcUpuMmlocnBFMkpTMnZTZWUwVzJKVFZkVldPTy9wejM2NmdqYThGMWtQ?=
 =?utf-8?B?bm5GTUNhYTJ1WmwvMjBwZmZXVEw4ay8zb0RLVHZmVFBFZzZLV0pWL1pvUmRJ?=
 =?utf-8?B?bGQvVVEvSEliOUt4MEhQUXI4TDI3RTdMa1ZtSzhzYXhxSWFsRWwrNTdrVGZ2?=
 =?utf-8?B?TUlWbHlMUERLVm14c1U0V3F4SHBvT0JWWlhESFVkVmZHZTE2RCt2dnE1ajhD?=
 =?utf-8?B?VStycDlqMmpNc2FLdURtZkhxVHBLQzBwZVdQT0hheXFxV1VONlh1TFB1WUhX?=
 =?utf-8?B?QUliOVBldDdmLzhMV2R1RDQyc0ZIb2lDb0w1OHF5RWc1NGNrNCsyV1JDRDhR?=
 =?utf-8?B?L0U3VUdZcE1OaXB2RDNyYnRsdTNXOWM1ZVhYMHZFbVQxT3J5c3Q1SGFSVjcr?=
 =?utf-8?B?bHdrVHZTNnIrd29XeFkvQUdIUzJhVGRCcm5GcGhjaHpCNm1YZFFLLzJYRUk4?=
 =?utf-8?B?WjRBNGxuN2ZXUjQ5d2JmYlJ5RTc0VHB4cHJtM3FsL0FFNS85T3JEK1hmaXBj?=
 =?utf-8?B?NlRldWtiblVEK3ZJeHY3YmR6eGg2Z3djdDRXWklLY0xYSmlrT210eGxVL1Nm?=
 =?utf-8?B?dExjaXREZ1BRTVNZa0VqbUxUTDdieG1mK3JLYlZRVUFpbWZuRVVoWWNzUUFG?=
 =?utf-8?B?bUFKNGxDMzhZQjZmU2tYYlhiQU83VFI0TDhONTRHQVBwbXJiZjRldTJ2TWlL?=
 =?utf-8?B?alByV09yeUpaWmY3K1lPVkRoRm4zb0RwUkNsMmx5QmlJZjlPMlMzaTZHYytN?=
 =?utf-8?B?VFVrbTh5TXpCdWJBaDhnRXpxYldlb2lzdVlzcG05YlpnMHl2cTVFcklON0Jv?=
 =?utf-8?Q?Y3FEVl6DIBEstIJeZfPbIFa8M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbbefeb-868a-4137-1045-08dad389a346
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 10:48:52.9448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Q2JfjpL3f4keSEVg6vE1X54EZzV5cpCf0V63549uOkPl+cIYqWC/ynFqdGAREoR+fUdg5vkIy4azOgSqLKHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5555

SGkgDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gU3ViamVjdDogUmU6IFtYRU4g
UEFUQ0ggbWF5YmUgZm9yLTQuMTddIHRvb2xzL2luY2x1ZGU6IEZpeCBjbGVhbiBhbmQgcmV3b3Jr
DQo+IENPUFlJTkcgZm9yIGluc3RhbGxlZCBYZW4gcHVibGljIGhlYWRlcg0KPiANCj4gT24gMjQu
MTEuMjAyMiAxNzo0MiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+ID4gVXNlIGFjdHVhbCBpbmNs
dWRlIGRpcmVjdG9yeSB1c2VkIHRvIGluc3RhbGwgdGhlIHB1YmxpYyBoZWFkZXIgaW4NCj4gPiBD
T1BZSU5HIGZpbGUuDQo+ID4NCj4gPiBBbHNvLCBtb3ZlIHRoZSBpbnB1dCBmaWxlIG91dCBvZiAi
dG9vbHMvaW5jbHVkZS94ZW4vIiBiZWNhdXNlIHRoYXQNCj4gPiBkaXJlY3RvcnkgaXMgcmVtb3Zl
ZCBvbiBgbWFrZSBjbGVhbmAuDQo+ID4NCj4gPiBXZSBjYW4ndCB1c2VkIC4vY29uZmlndXJlIGJl
Y2F1c2UgJGluY2x1ZGVkaXIgY29udGFpbiBhbm90aGVyDQo+ID4gdmFyaWFibGUsIHNvIHRoZSBj
aGFuZ2UgaXMgZG9uZSBpbiBNYWtlZmlsZS4NCj4gPg0KPiA+IEZpeGVzOiA0ZWE3NWU5YTkwNTgg
KCJSZXdvcmsgQ09QWUlORyBpbnN0YWxsZWQgaW4gL3Vzci9pbmNsdWRlL3hlbi8sIGR1ZQ0KPiB0
byBzZXZlcmFsIGxpY2VuY2VzIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhl
bnJ5LldhbmdAYXJtLmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg==

