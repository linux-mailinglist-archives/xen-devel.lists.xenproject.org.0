Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525FA5DB8C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 12:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910256.1316994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsKH9-0002d9-UD; Wed, 12 Mar 2025 11:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910256.1316994; Wed, 12 Mar 2025 11:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsKH9-0002ab-QK; Wed, 12 Mar 2025 11:29:27 +0000
Received: by outflank-mailman (input) for mailman id 910256;
 Wed, 12 Mar 2025 11:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbCM=V7=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tsKH8-0002aV-8u
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 11:29:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2613::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4046516c-ff35-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 12:29:25 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB7829.eurprd03.prod.outlook.com
 (2603:10a6:20b:34d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 11:29:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 11:29:22 +0000
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
X-Inumbo-ID: 4046516c-ff35-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOWWH6ixB+2D8mIJtofK8Qc++zt9W/9S/nX7tIh5lZjkzGYfJNLBLIVK+6ew19j0dm1lpNOmJmTt4ThQ9OCrTBusav5i8CF0rxibT5DIESh79E4abk0lbToLGmX1kHqnDT2xUV9tnNCXN+O9Kg6Rbqn0wOdW6NJo/GIgURUrMzpCKxF+u4aBWMF/ffqnf2utT/jPdO8V6yuXY517lspChG7UzVdf/0p+IGuZiknbi5NzbYdRsSZfMOnLuCKym++GemGPLBr7BKfpKzQxvVbIx9nLLkbM8qUOv6Lm6MViiHezXUqcb0AICNfgnTYzuwVhMUUmsxh1AvZrgUead9GOSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNDDTH8qzdmuqss7yRTXM86xM2fPKlepigqawWcrZ6g=;
 b=YhZa7ybyb+Y7Lzd/aoBGPvoEXtBHl8jSp9u/2rLNRF8FRgt5wAxuCWKxly8ffslYJlWb7McwuKl0160u02awkhr04Rlw4jsofNrT4cgW9BFFcVWLT4XnQECaNXwtLiSSuWYC1blJzyXk78xZ1hKRFZgtESgRxsgSYoBtdz0uoTHsQA725sir9V/5XumAjX/yu/m6qrNs82CQTXNMvbZCoPOHhfPNHBmby3RA9wEOOhAd0VacHZubql3fcJSqmLC9lPbzKPoBqAYU59Tz2NR1qkDkNG1oj7aMNSAzzHFg2lQnpeG/7A9Nc3pLD2xa9Y5P75ntVASATN7zhJhalO2nBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNDDTH8qzdmuqss7yRTXM86xM2fPKlepigqawWcrZ6g=;
 b=lduiZFTEHajBFxGuefRR1wkcxsGaZxtDfOkza/JV4C4x/jO+4hugMXqkWQa2X61+tkOkIpRnvW1jA/USYFxkaAvs5ULtq8vs0DZPhsBxLezfxmrty3PlDKAMtcHe7kobdt2yycs/bWAofrhtxgfLj+qIKLEkWcbq1Lxc95G72QV+EMNapqP8zQUQR7cHdArp9KDohKoJZIi0ZnsxI52ILksRwc6B3x47/s084o45wdO/3YGggFM9NmcPmli/QsbNMLj7Jz/H7Mr/FwMrJnWZ0KPzpk1Nusw3oJ+88ZvWBxZ0MO6jqD2tyR2B+G4UXhs8w0BIOx0pvOymUDnZ9lUfug==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 5/7] xen/arm: rcar4: add delay after programming ATU
Thread-Topic: [PATCH v2 5/7] xen/arm: rcar4: add delay after programming ATU
Thread-Index: AQHbkm/V+s7gEh8jVE2kSVeMpYb04rNvSZEAgAAVjoA=
Date: Wed, 12 Mar 2025 11:29:22 +0000
Message-ID: <c3d27279-8740-49e5-adbc-867fd85ecab5@epam.com>
References: <cover.1741596512.git.mykyta_poturai@epam.com>
 <9cd78a64dde2e0a039919a08025abaa89d63966c.1741596512.git.mykyta_poturai@epam.com>
 <0cabf89b-4c37-45d6-98d8-38a6719160b9@epam.com>
In-Reply-To: <0cabf89b-4c37-45d6-98d8-38a6719160b9@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB7829:EE_
x-ms-office365-filtering-correlation-id: d5e7d9df-a3df-4ecf-2256-08dd61592328
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TVZsVVV1YU5VSTcrNkJQMmdYUkQ1Zk1ENHNLSEoxNGhCQzA2MEswbGszNWxz?=
 =?utf-8?B?MnZJM1dsZDZRZ2pwa1ZYR3ZTRnFnbXEwNU9tVVhYWTJFclExVnhlN2srQmF0?=
 =?utf-8?B?WEFNOFhtdzhwSVN6SGtWN2VzLzFjeWVoamRVVzVxbVdmeVBBZ2hXUTE3MW5w?=
 =?utf-8?B?U1k3bGhiRWlFYnMvRWkza0o4ak5DeG53YXlmY3Z4SWJFamR0TDdnYW9USHlR?=
 =?utf-8?B?U2F3SjZ1M3BUZFlqdUgrUjZGZlhTcHdmaCsrYTlDVXVtdXZmRnE5aElybGdj?=
 =?utf-8?B?OGhuMmpuTEJRLy9OUHA3cnpZZHRvSGVWNVlUMUhRT2ErVGdVTUhTOTgxN0xP?=
 =?utf-8?B?clFMS3c5TzVQVEVNTzhqNUo4Z0V0THM2UnJrdUdKSWNxNmMyZTFWMnAvSVg0?=
 =?utf-8?B?cFE3Q3dYM0lrM2JiWXMzSU11dFY1ejA4WmcyaHdsZklLZytBbDUrTmcrdE5L?=
 =?utf-8?B?amxmc0wrS0ZUOGFUbS9palhCZUQ1WEpyajBaS2hNblhNcGlUV3pEUmRwOUcy?=
 =?utf-8?B?bXROeTZiay9FY2U5OWdJcWRWR0hFY29oWlJHU0hhRjhEQ1NIZHBaRnk1cDVn?=
 =?utf-8?B?K3NPSTlpM2ZEZFlJbHlNcmJ0VFdtZEYxaXBiZHJBRXBmVFZIVWozdFZYVU1n?=
 =?utf-8?B?T1ZtT2JEWVlXQkRSWWQrRDBtWHJJMS83Qk00VDJsRnNiSGl3YWRBRGFOTk4w?=
 =?utf-8?B?WklGTTNRQm9vcnNqc1BaeDI0N1c4UkFVU1dza2l4b0lkMVAwWW1hR2xrV1Jl?=
 =?utf-8?B?VEFyYVVxaWo1WWd6MUJVa0hEdW1MVVZLaG5LUEo3SzhSR3FuWS96S2QvbnpJ?=
 =?utf-8?B?eGFZZnMyaGcxSmwwZy83dm1MRGdTenlodHpVcXpiMUVFK3RUcjdybFgwaVdN?=
 =?utf-8?B?bGJRZUsvQ2pVbHpGLytidlZ3M2p6aDJWNXRUYzdlMXc2Q1U1amI2MU0vcTI1?=
 =?utf-8?B?WFc1U2NPb3F4dnVLZE9kam5NOGY1WUt5VHRxeXFXYUJHL2xwNU5yaUZyQ0I0?=
 =?utf-8?B?MndodEw4dm9GcjkzV3l0dFRwM0NoS1RrbW03Y21pS0xQWTdlYmphbEpTaWhG?=
 =?utf-8?B?VTZVbkszTGdCYTFOVTVLWEdXR2JRbVpMbGdmdmtxbE9ib2RhLzVvVkUrQ1Ax?=
 =?utf-8?B?d1UrTzRxL0lMcWR2a3U2RTJmdDlvaytpYnpWbzJUci9DcXRQNEQrNmhYTnVt?=
 =?utf-8?B?YnZIMDVsbkRlNjVqcG5SR2pNZDB2ZGVtZlRrL3NZS1hFRjZoKzI1aTZ2aXR1?=
 =?utf-8?B?ZUFTWkdxL3lEc016d3p3dzF6czVOWHM0L0doaEpnVFhJQUJQVkNKNjdnWHli?=
 =?utf-8?B?eVNKcjJWRHY3NzJaL3lNeFFJUnpCSTgzRzhZSnJHSEs0alRzZGZmZG1BbEdh?=
 =?utf-8?B?QmlyaDl4c0JLYnZQMHArZzFKR243ZTExd0N2dURlRjVSYmVZVzVOdXQ1WDU3?=
 =?utf-8?B?QWFxSzNZS0xxb3BSSDJPUDNLU0xVRFNTZEw5U0QzV0Fsc3ZMSWJaUEVSK3Fy?=
 =?utf-8?B?WjJLTUtMNzI0SGxNUzR3SXZRbXZ1d0hmTDRmZzY3bXZLTmRhUSs3U3poU0sz?=
 =?utf-8?B?Mi9sMWxFR3BmUEpYY3lhVTFyNFg0U2Q4WEx0cEZHZnFvZ0F6RXJMcVdGQVdR?=
 =?utf-8?B?bXlCRzd0dVdpN1ZMLzNZRHhyTzZ4SU9QMkxxYWFjRURGUDVGdmRQcXNoR0Uw?=
 =?utf-8?B?aW9yQkNCejBjUUxZOGRiWnJPMlk0THk2RkYrMitPYml3blNIS0p3NTFQSGN5?=
 =?utf-8?B?bmxjRFp5SEhjMjNwa28ya2RERG5xNCtxS0hFZUNuNzN6eG5INFZHM3IyUDhk?=
 =?utf-8?B?cGVVbzg2UHVaUHpueVN4UWdnZGVJNzRsd3BzQ2l0VVB3VUFtV2NPaVBPc1Ew?=
 =?utf-8?B?UmZyMnpralJ0ZGwvKzgwM3gzTytjbC9lNVBFVThML1ZkWWRabDhaYjRTeW44?=
 =?utf-8?Q?Ri5GCCw72ISeg1b+d1Uv8ZZ6osvYiyJl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmdFR2F0LzNVY0FIckpocjAxTHAxbTJ4eUVmOGFVR01vRFdsV0tRZHU4YmI5?=
 =?utf-8?B?a01HNXNQNzB0SjJEd05RWmdnc2tXN0ptTmtmWnlIRTNGcUxTa2F5eWJJeDRv?=
 =?utf-8?B?cTY5QmhTTnEyT2drN0o1MWpLNk9ZeUVTdWVjS3F3K29JNzZ3YnVjWHNvN3A1?=
 =?utf-8?B?Zk9raXNnTnhYdU5DYW1jSjlhSnFKeGhST2tOVVZvWnErTWRNbXpBK2FIWWJL?=
 =?utf-8?B?Z3lTRkRpUTl1OGZnbHhYQktxYzBCNzlhVThLb1NkTkwzL0hyZEtyaXpLTDB2?=
 =?utf-8?B?dG12MmgzRGg1a2c2d2RNNitKelJ0S21ZUHFKelNpY3FJaVBwQzdPWkUrenll?=
 =?utf-8?B?Y05ld0p2UEY3MTI5Qlg2M2RyUHBJRHZ4UVJsVThZV0ZjZG4yRUFUait6dzNv?=
 =?utf-8?B?MjRGOFlMZnZtelJqeXBNVkFwYmNyWEhpK1AvY05UYmw1SmxjMWhBSjUrVUpU?=
 =?utf-8?B?WEpYRHQ5K2ZPNzZZVmRIYnVsUUgvUDgxVnNIdzJ4VFowOFhMYXI1SDlhM1Nz?=
 =?utf-8?B?TnM1VkF2d3llNU1ySHQ1NlpXcjBpK1BWVHg4djFSOFR2eFQyd1d0M2xSdnRk?=
 =?utf-8?B?Rm5JbkczR2YzN3Q3dUxIUm50VzRFdi91UmR1M0tBOWhYMzhwOFE3NzVjMS9T?=
 =?utf-8?B?ZnU4RWZTWUhOZ2wrdmRYTGgwcnZjLzRGVk9CZHFHcVI3ODkvbE5pQTYreHNC?=
 =?utf-8?B?S0p5bS94V2c0V0ZHUjlEaXVIeUZLOE9OTnJYZ3grbmJQbTBlWDVsY1diMnBN?=
 =?utf-8?B?YTllS3E5R24zOTFFRTRXUnpnOVR6bTgzQ3BOaEg2NXFzR3VIcExLYStVaEZD?=
 =?utf-8?B?ZE1HS1Niejd5c2daS1R5QWhnclJWem9tZS80M0VpUExoUk5UZUJiNzdiYlh3?=
 =?utf-8?B?VTFDeFpiTlV6MldFU2RTSHp5Uzk3M0FsbjZxTit6UElzZzMvd3pFbng3VGdv?=
 =?utf-8?B?NElxWkp1QVF5WTZJUkUrYXVZemJGY3FCUGNoemFaRFBid3NtaFM5U3EvLzB0?=
 =?utf-8?B?dU51dm9JYzhOaFNqWDBORnl6RThRQ0RDeWpJUC9oOGMvS0tYN3hIdnU3Z2U4?=
 =?utf-8?B?U1pvVnZIVlFNVE53L2dNZE9kWkFmbzBRQUtJY2w5MkZQWWhPUER2c2hJSWZC?=
 =?utf-8?B?MWlVeXdxOUoxRlJKOXcwV3lmNS9JcGtBTUFJTWQwUTlpK0xTYXNzMTh3TjBK?=
 =?utf-8?B?Y0txVmdCeFQ0TjJtVXJXRXZTN1Rqb3hxU3hQZVlpeDRXQlF0SG1EZ1RtWFE2?=
 =?utf-8?B?OE9xSTNIUU83SGVobU5DbytUczBNUzNuNEE0VG5uQi9xZTZVNllndExvREJx?=
 =?utf-8?B?K1BJc0F5OHhWZmNCUUFadjR3Rll1YkczbGFkVmlBS2VJRHh6eXJmNWM3cEtY?=
 =?utf-8?B?aTZ3Z2IveUF5ejQwM1NSdFIrbFU3R05pUy9ZYUVZbVV5MzNPSWk4RnBYMWJW?=
 =?utf-8?B?eEhkUjV3cDRwUWJNTkxwa3BLY1plNGJQdU5XVkp6WW5LL1lyeFozQm4vMlQ0?=
 =?utf-8?B?WW1CL0JsUTdnUms1Vk9jRW82RXlpUW1pcFFpT3FiU2ROSjhTbjFhRG56ZElZ?=
 =?utf-8?B?T1d6dGRXc2FrMXJsZEhiV1BpaEduYnovd0MydW1Cd1dqTXY5Z2NLdlpWZVFn?=
 =?utf-8?B?clB6NGtrWUVVM2c5bVRUMmpIUk9USnB5dVhBQ1FkWndjak4wcUcvS1h0eEtR?=
 =?utf-8?B?QmswU0NOTVl2Rno3bTJBenhjcCtMNUpETWNuek1nZExUYXBpOU54bEw4bGtW?=
 =?utf-8?B?aW9iM2V0MFRaSFRaUzNNSlVwODFEQUZTN29qWFBVTmE2ZHdBS3N0WWxuWWVT?=
 =?utf-8?B?b1dwQ3l2cXR6TEJOcHpqbEUycy9wdCsvcXdLRHVjS0NnZ1FMSlJFRlFPd2gw?=
 =?utf-8?B?WlRkSHRDUDNycStSbFQwTGZNWkRoZlJYNmZvZmd6ckZBYmd6VmhBc1cvN3N4?=
 =?utf-8?B?enJwSTlDQjl1YkJuUUFKKzBzOThKNGhmdWxHYVo4VDgwd1QrdjdzaC9ydjhz?=
 =?utf-8?B?Z1lCMmlFcWtzSFpUcVdsa3haM3MvOW9rKzc2dU03SGhCWUJMdWFJUVpEbU5q?=
 =?utf-8?B?T21Rd3pPTTBSQnVKUEJndm40QTd3OGpKeVAzQXk3UFkvamlXMDR4VmFsVlZu?=
 =?utf-8?B?UEpUV1E0bUVobXNWMHB6NUhnVUlLS2Q0VFN1dVdVTUg3VnpTT29TUmZmY2o1?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54227AB127FE9240826D22D30B55E8BA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e7d9df-a3df-4ecf-2256-08dd61592328
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 11:29:22.5742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EDm1v5JzK2Czzab6GJ1+6DZ5h0Bbs7uWvBhceNd0zAjEDIbTutNDdJgo+RfJ+VGj6nQxfMtVIbo/p0cMOUSkCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7829

DQoNCk9uIDEyLjAzLjI1IDEyOjEyLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCj4gDQo+IA0K
PiBPbiAxMS4wMy4yNSAxMjoyNCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBGcm9tOiBWb2xv
ZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQo+Pg0KPj4gRm9yIHNv
bWUgcmVhc29uLCB3ZSBuZWVkIGEgZGVsYXkgYmVmb3JlIGFjY2Vzc2luZyBBVFUgcmVnaW9uIGFm
dGVyDQo+PiB3ZSBwcm9ncmFtbWVkIGl0LiBPdGhlcndpc2UsIHdlJ2xsIGdldCBlcnJvbmVvdXMg
VExQLg0KPj4NCj4+IFRoZXJlIGlzIGEgY29kZSBiZWxvdywgd2hpY2ggc2hvdWxkIGRvIHRoaXMg
aW4gcHJvcGVyIHdheSwgYnkgcG9sbGluZw0KPj4gQ1RSTDIgcmVnaXN0ZXIsIGJ1dCBhY2NvcmRp
bmcgdG8gZG9jdW1lbnRhdGlvbiwgaGFyZHdhcmUgZG9lcyBub3QNCj4+IGNoYW5nZSB0aGlzIEFU
VV9FTkFCTEUgYml0IGF0IGFsbC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFi
Y2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNeWt5
dGEgUG90dXJhaSA8bXlreXRhX3BvdHVyYWlAZXBhbS5jb20+DQo+PiAtLS0NCj4+IHYxLT52MjoN
Cj4+ICogcmViYXNlZA0KPj4gLS0tDQo+PiDCoCB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1kZXNpZ253
YXJlLmMgfCA1ICsrKysrDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWRlc2lnbndhcmUuYyANCj4+
IGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktZGVzaWdud2FyZS5jDQo+PiBpbmRleCA2YWIwM2NmOWIw
Li5kZWYyYzEyZDYzIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3BjaS9wY2ktZGVzaWdu
d2FyZS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vcGNpL3BjaS1kZXNpZ253YXJlLmMNCj4+IEBA
IC0xOTQsNiArMTk0LDExIEBAIHN0YXRpYyB2b2lkIA0KPj4gZHdfcGNpZV9wcm9nX291dGJvdW5k
X2F0dV91bnJvbGwoc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqcGNpLA0KPj4gwqDCoMKgwqDCoCBk
d19wY2llX3dyaXRlbF9vYl91bnJvbGwocGNpLCBpbmRleCwgUENJRV9BVFVfVU5SX1JFR0lPTl9D
VFJMMiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBQQ0lFX0FUVV9FTkFCTEUpOw0KPj4gK8KgwqDCoCAvKg0KPj4gK8KgwqDC
oMKgICogSEFDSzogV2UgbmVlZCB0byBkZWxheSB0aGVyZSwgYmVjYXVzZSB0aGUgbmV4dCBjb2Rl
IGRvZXMgbm90DQo+PiArwqDCoMKgwqAgKiB3b3JrIGFzIGV4cGVjdGVkIG9uIFM0DQo+PiArwqDC
oMKgwqAgKi8NCj4+ICvCoMKgwqAgbWRlbGF5KDEpOw0KPiANCj4gSXQgc2VlbXMgbGlrZSBhIEhB
Q0sgdG8gV0Egc29tZSBwbGF0Zm9ybSBpc3N1ZSwgYnV0IGluIGl0cyBjdXJyZW50IGZvcm0gaXQN
Cj4gd2lsbCBhZmZlY3QgYWxsIERXIFBDSSBjb21wYXRpYmxlIHBsYXRmb3Jtcy4NCj4gDQo+IFNv
LCBpdCBpcyByZXF1aXJlZCBhIHByb3BlciBzb2x1dGlvbiBmb3IgdGhlIGFmZmVjdGVkIHBsYXRm
b3JtIHRvIGJlIA0KPiBmb3VuZCwgb3INCj4gc29tZSBzb3J0IG9mIERXIFBDSSAicXVpcmsicyBw
cm9jZXNzaW5nIGNvZGUgYmUgaW50cm9kdWNlZC4NCj4gDQo+IEknZCByZWNvbW1lbmQgdG8gZHJv
cCB0aGlzIHBhdGNoIGZvciBub3cgZnJvbSB0aGlzIHNlcmllcy4NCj4gDQo+PiDCoMKgwqDCoMKg
IC8qDQo+PiDCoMKgwqDCoMKgwqAgKiBNYWtlIHN1cmUgQVRVIGVuYWJsZSB0YWtlcyBlZmZlY3Qg
YmVmb3JlIGFueSBzdWJzZXF1ZW50IGNvbmZpZw0KPj4gwqDCoMKgwqDCoMKgICogYW5kIEkvTyBh
Y2Nlc3Nlcy4NCj4gDQo+IEJSLA0KPiAtZ3J5Z29yaWkNCg0KSGkgR3J5Z29yaWkNCg0KQWZ0ZXIg
c29tZSBmdXJ0aGVyIGludmVzdGlnYXRpb25zIEkgaGF2ZSByZXRlc3RlZCB0aGlzIG9uIFY0SCwg
YW5kIGl0IA0Kc2VlbXMgdG8gd29yayBmaW5lIHdpdGhvdXQgZGVsYXlzLiBDb25zaWRlcmluZyB0
aGlzIGFuZCB0aGUgaXNzdWUgd2l0aCANCnN0YXRpYyB2YXJpYWJsZXMgYW5kIG11bHRpcGxlIFBD
SSBob3N0cyBJIHRoaW5rIEkgd2lsbCBkcm9wIEFUVSByZWxhdGVkIA0Kd29ya2Fyb3VuZHMgdW50
aWwgc29tZSBwcm9wZXIgcXVpcmtzIGhhbmRsaW5nIHN5c3RlbSBpcyBlc3RhYmxpc2hlZC4NCg0K
LS0gDQpNeWt5dGE=

