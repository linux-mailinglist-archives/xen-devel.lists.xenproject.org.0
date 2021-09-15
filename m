Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7BB40BF52
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 07:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187216.336006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQNVV-00015a-4O; Wed, 15 Sep 2021 05:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187216.336006; Wed, 15 Sep 2021 05:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQNVV-00012n-0K; Wed, 15 Sep 2021 05:30:53 +0000
Received: by outflank-mailman (input) for mailman id 187216;
 Wed, 15 Sep 2021 05:30:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFB7=OF=epam.com=prvs=9892afeb01=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQNVT-00012f-Jk
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 05:30:51 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bbad2bd-cda1-4014-a247-9113b253ef43;
 Wed, 15 Sep 2021 05:30:49 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F5J8gT003443; 
 Wed, 15 Sep 2021 05:30:45 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b3ajy00sk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 05:30:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7347.eurprd03.prod.outlook.com (2603:10a6:20b:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 05:30:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 05:30:41 +0000
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
X-Inumbo-ID: 3bbad2bd-cda1-4014-a247-9113b253ef43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOH3gO/KC0caIx72XxhR+ZUu6I6/zZJ5pX34lC7MeKah4ZKP+ZgAho/pZ4RbfTwBBCAfSABtkXXUhqpTX7IpBG/Bo2iXw1CpHBJf3pB7ETJgttveWxPtNzFYxAZwn6dMIh6uJm85F3bwvTKRCob+pfR5GmBQZGFox2SKlquHiVl/MUS9SVDlfA4TZhctTz161m3bmCH/aOqmta9UYBJRY9AgXwmff++qzFyF9SKq3eiL81bjrg8lxhBzAmOtFmR/78g3Vew0D8TB/EZZk66YlvN+UA5pBoictPVpt42e/0evoIWy+D72ALrnh9fFOpYieZKogOFHkCYNb3Anom7xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+Js1ULUN0xbIjgVEqSHLxfhmwuL2sC6W2PAFSur+PnA=;
 b=bZyX9739LCjkvSgQfwDoXY0vNwe7+HZLL9JQn225rR+GYup7W6kjNQCyprwQYTiOCTFUnJucqcEn9XdDr2vDp/BL0RJd4OLWX/Cpw+TkI2JQ0cecBG3t2qbkhS38oDdfyV4q4QEDm+A3ayEenaGUpzJnddI9sy/bxIPSwBIxnYujnTEgh8da58Z/GngI9hWwXHyogGcOSleSIJkZyUcG7d0/r7gNt1z3dyJr1/Y5oDNczT1lH1bmx7RdP0Nh9+kn+wdl+sowc/nlxYxpzjkC5vv8UtACV0GPCJRmzsTeDiTQZNfWiVWtLomD7wNS031LDISlfuy8lUgm+BDe3275Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Js1ULUN0xbIjgVEqSHLxfhmwuL2sC6W2PAFSur+PnA=;
 b=kdaGYcjnD4mvVhFB8A3C3/nGUUV8MsIPnlOLketTD56PDENnPREsfqmjxkDtp2hk6swuQPuXcAvNSsz7GDSadVIjRH5ordSnhgTrjSTiU7hzFyUZWscmun3vawBWPwezUHQxJQx2OPUIwjkWKxZ9mSYa7r98NfB/uvN624Cuuh1XnJ3F5BhfDXaAM7c6owRuM5edoO2EcF4Wd4/OZf2TH41VMqqrmDRP/rt6NbGmC/YmXd9cI7T7dFVd5n9ZQ4KRr4D2JyTNt7SExjyG+DYrGx2p76qnn/9qEu6FGRjHmxg2CQDyCFLnXon09fzF24P/rMeqYuVmkKIhF1SRqZF0Qg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKudvyQAgAXn/ACAAP1GAA==
Date: Wed, 15 Sep 2021 05:30:40 +0000
Message-ID: <20b0a8c0-10dc-7473-3c56-a9baeaa43e62@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
 <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com>
In-Reply-To: <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 640899f4-d5b5-41a4-c6f5-08d97809f514
x-ms-traffictypediagnostic: AM9PR03MB7347:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB73476C7EC569150D63C11041E7DB9@AM9PR03MB7347.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yV0qHo9iWYvN9XqPXgAWKKt2M2BfKzYIiqFBXCG0YtXmGxrMymMCTl1spWSLMAv7PNRXcJROIyRya/mAgDN97kKbL58HfvyZYg6O4ptG60stgyB34wEcNdw31CbfItgV3i18hDGawCeagGCmszdYwO4x7gfwO0YUJVUZXQcIAFNNqTKqt0CJRM5oDt5aCTPnQAWGYQF7lbTWWmmJvLU6aJA8XF6E4aX+0Pk3LLvMrIfNSP2a8pjqKTHmxx52SdF7o+S23NKT6T26fD470htA51YXLHhmlWh/QAJy38UL6jc1zvvpqbIaxocooSLFvd517JbHFa98Pc8rYd9url4iDqApxROM0cBAWK2bTJBpVfGki1TtAcjynPGLOSkUTNSnDsfp67kCNQyHNxuDdV6TeNrLsuoaXfVKLaLEK2kLUfDFT1ynIsqLS+pQ26XzIIj+LiFKMnCMF+WJxCJ5DXgNJ0AD/aEIgTopderSKL1h+eA5FYSMduA3n4K4AOVlVj1PmAvkmrIUm/8jr35KbqDMh4K7ywZvLbTIUUMBMZZyS+LZnQ3RFdQcZd8BLw6C+yKXb9Oce+smOgZ2+Nsj/yFGZOtz4hnje37wO/PSpxAp86+am0EnRR0SHIAIK/XYGcgnJ2EmJKL45tb5Pb1mlBQmScdOjoF5OYzgZBAPshWBt5RQFKcHkZTYkkX3OsshcpUEx94b1z3we3JH3JvUtHCu+wTa/KeMPVEpgji9ivThQ2FNLLUT5R1S8iubTWJEZcjp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(36756003)(38070700005)(6916009)(31696002)(2616005)(5660300002)(4744005)(8936002)(54906003)(6486002)(71200400001)(478600001)(122000001)(186003)(31686004)(2906002)(83380400001)(4326008)(66946007)(53546011)(91956017)(76116006)(86362001)(316002)(66556008)(6512007)(66476007)(6506007)(64756008)(38100700002)(66446008)(55236004)(26005)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QlA3SjZEQitwUEprMEwxcGFtQmJYK3VZMDg4MGh6a2xYU1JMQmh6bHpkeG13?=
 =?utf-8?B?MmNZK1k1WXBpZEZqME55V2Z0Z1dVdStyVGhQek96OUNWOGpJNEJCMWxFdVZ4?=
 =?utf-8?B?aXlMTnhLYm0wc1BRa0xqSDM5R21NcndwbENUOVBic09zVUN2ZGF2T2NVU0xG?=
 =?utf-8?B?MlZ6c1BXWnhtMVRJM2pPelE4RDBHSkZianJQdVhtMElTTXJvMHVRUWhFbGVn?=
 =?utf-8?B?Tlo2Q3VFelBpMUpFZmRqZm51TEUwZnNZMmVaa1hYQ0I5cmdRa01CbklsSTIx?=
 =?utf-8?B?b1FBMzdGS1lkNDdEZEM5OXBweklWQXNxdUZscVdIbVV1bUlvK2pKYmRvS0J0?=
 =?utf-8?B?YStXZE52TGRmRS9OOUg2anFWQUdYdk1sMm5BYUpGL1VkRDN6elE5MFNQMnF2?=
 =?utf-8?B?Q0FVb1VBUC9WcjVMSkh1V3JqMkQ4bUZ4bXlCdVpEWDVRTjFQcFJKNnlWV1BU?=
 =?utf-8?B?eHQwd1A4SW5SOFNlcTNTbFJKS2lWUVQ1RjZ1MTl3VXFJTDRoN1FQc3pKUTFB?=
 =?utf-8?B?MGpSdWVWK2xUUEhIR3ExcFQzdmlCOGx5NDE2bzJPY2Z1bGs0NmUwWWJtTUtR?=
 =?utf-8?B?WU5xQUtvK2owbWR0MUdwM2ZiV0I1NW1LMEhLalE0ZFcwTGdZYXFEYWxFUkZL?=
 =?utf-8?B?bzNodXBIZmIrcXI2aUVJeWF3U2lEeHkyNXp5K2UxTDNVcUl1ZEE3SElBeHNO?=
 =?utf-8?B?ampUbzl1RnJhRXRwcGFkWDBPRzBMSDI4eisxZFYvSDByR3NRZEp2UTFQWWRp?=
 =?utf-8?B?QjZHOXozdmFwRVpWSTRmZkhWWlhHQkZDdXA3bllXcUFFZGxsOFVyQnpscURQ?=
 =?utf-8?B?bDlhQjUwYXByZ0FLWlJPUUNiNkEyUEN1ZmdJTk5UVVAraVV0VTRZRkY5bDRW?=
 =?utf-8?B?dVNvRjg4blI5eXV5OU9CNS82bW90RnZiYlEwU0xlNWc3ZFQ4L0U1czJ5aEVS?=
 =?utf-8?B?cnpIV2pITnlRV2xGY3ZKVmZQU2FjTmZFNVZvb2xHY2k1Zi9HSjIrRUpZVjJ6?=
 =?utf-8?B?MGZRREJIN2FzUzhRN3dUSWovbzM3UXpkWGFBalNEcSszZXp1UlhlYithbUtE?=
 =?utf-8?B?T2R5TE1VNEJyVjJtREwyMW1uWU42YXE1RytZTDBKRjVLZlVIU2M1YnNDbTZS?=
 =?utf-8?B?SHhucXRHS05TVjVIcysvZmFMaVVCaW9BOWVjL0kxTzFORm02VjVlMFU0L01r?=
 =?utf-8?B?UkExalpHYWNaUjAreFJnaXR0ZUpLM000MlVjNVcveEY1M1ExdFBXRXBHQVY5?=
 =?utf-8?B?Q05wMWZmZGNCaXV0VlovQVIrWFdwM0Z1VlZIdG5Fc0h3VTFKa2FXREY4ek13?=
 =?utf-8?B?VEpaQTRvb3lLSUlKdWhQYzE2MFFFQVdVMUYvY1RFdlFwVW9rWTZDWWNOTS8v?=
 =?utf-8?B?V092dFYxd3RZeHVKT05ZY2puRTJycWJvVk45Z2J6SjRQR0ZsckYvd2ZwL2Zx?=
 =?utf-8?B?TVRySUh1eFQwNGlPSFJCdlhVMUZyUzRsUDVrQS9KYitrNjBzQ2FUMzAzRzZk?=
 =?utf-8?B?MGlSSWZHTlVTZGk2VTRDckFIU2ZOK2lYKy83ckVDcHBvU2hBYnQzUTI4T1Bs?=
 =?utf-8?B?aUloZmhJSUFpY3d4RTdJNmN2UDJrb3d4cjVDdDFWQTY4MUhqUSt5cGpZWUNj?=
 =?utf-8?B?cG9MQzk0VVF2TmxJNXhVQ0x6U1dHcHRtKzViL3pIZk44RG5vMzFkVk1xMmY3?=
 =?utf-8?B?bkIxMkM3VEJMb2M0MFJrSUhFd1JxM1VaL29wRjhRelBkMEFxVmRZTWROV3hT?=
 =?utf-8?B?ZmtxU2pwM2ZaWHBYeWdNdXNqeHZpRGZzM3AyV09ldHJ2cTRidDB4eml5eG1j?=
 =?utf-8?B?Ukd5eTcybUx6NHQ2QUxUdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3985653E616B44781E933B07CF65C39@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640899f4-d5b5-41a4-c6f5-08d97809f514
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 05:30:40.9771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jqA4yRO0srcIBkwMm7pa2N8riZfkV/PjjGcw67yDXVSJcl3TIftzjDi5ji5K2jPb4xgsfQ9Zf+zqICsFfJA6qsX6jPEeIYdltSF/PXERKX7YIHvrEFvB5Beo8az0VBq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7347
X-Proofpoint-GUID: 9PLTroHSpHmZmUcbpcFekuHXRX__9MSY
X-Proofpoint-ORIG-GUID: 9PLTroHSpHmZmUcbpcFekuHXRX__9MSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_10,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150034

SGksIFJhaHVsIQ0KDQpPbiAxNC4wOS4yMSAxNzoyNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+DQo+IH0NCj4+PiDCoCArc3RhdGljIGludCBwY2lfZWNhbV9yZWdpc3Rlcl9tbWlv
X2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY29uc3Qgc3RydWN0IG1taW9faGFuZGxlcl9vcHMgKm9wcykNCj4+PiArew0KPj4+
ICvCoMKgwqAgc3RydWN0IHBjaV9jb25maWdfd2luZG93ICpjZmcgPSBicmlkZ2UtPnN5c2RhdGE7
DQo+Pj4gKw0KPj4+ICvCoMKgwqAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsIG9wcywgY2ZnLT5w
aHlzX2FkZHIsIGNmZy0+c2l6ZSwgTlVMTCk7DQo+Pj4gK8KgwqDCoCByZXR1cm4gMDsNCj4+PiAr
fQ0KPj4gR2l2ZW4gdGhhdCBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgaXMgZ2VuZXJpYyAoaXQg
aXMgbm90IHNwZWNpZmljIHRvDQo+PiBvbmUgYnJpZGdlKSwgSSB3b25kZXIgaWYgd2UgZXZlbiBu
ZWVkIHRoZSAucmVnaXN0ZXJfbW1pb19oYW5kbGVyDQo+PiBjYWxsYmFjayBoZXJlLg0KPj4NCj4+
IEluIGZhY3QsIHBjaV9ob3N0X2JyaWRnZS0+c3lzZGF0YSBkb2Vzbid0IGV2ZW4gbmVlZCB0byBi
ZSBhIHZvaWQqLCBpdA0KPj4gY291bGQgYmUgYSBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cqLCBy
aWdodD8NCj4NCj4gUmFodWwsIHRoaXMgYWN0dWFsbHkgbWF5IGNoYW5nZSB5b3VyIHNlcmllcy4N
Cj4NCj4gRG8geW91IHRoaW5rIHdlIGNhbiBkbyB0aGF0Pw0KPg0KVGhpcyBpcyB0aGUgb25seSBj
aGFuZ2UgcmVxdWVzdGVkIHRoYXQgbGVmdCB1bmFuc3dlcmVkIGJ5IG5vdy4NCg0KV2lsbCBpdCBi
ZSBwb3NzaWJsZSB0aGF0IHlvdSBjaGFuZ2UgdGhlIEFQSSBhY2NvcmRpbmdseSwgc28gSSBjYW4N
Cg0KaW1wbGVtZW50IGFzIFN0ZWZhbm8gc3VnZ2VzdHM/DQoNClRoYW5rcywNCg0KT2xla3NhbmRy
DQo=

