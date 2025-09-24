Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F0B98FDF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 10:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129178.1469246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1LGR-0003pD-Hm; Wed, 24 Sep 2025 08:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129178.1469246; Wed, 24 Sep 2025 08:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1LGR-0003mQ-E9; Wed, 24 Sep 2025 08:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1129178;
 Wed, 24 Sep 2025 08:54:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nu40=4D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1v1LGQ-0003mJ-28
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 08:54:14 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aaf4667-9924-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 10:54:12 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8665.eurprd03.prod.outlook.com (2603:10a6:20b:54b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 08:54:10 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 08:54:09 +0000
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
X-Inumbo-ID: 0aaf4667-9924-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cogcIfnzIQEh94CprxZA+S/6VV/IXnFvSydl+EcLErXW6CsGqOsOZ+jaGOzCUpVmJCiQ/oLv1dxu5F7f0DpM/QA30cqpM5Sgp3VeCxOZScuyuw0+meNhp7WivvUvpniNQ2Q6ioRxjJv7dEQ1kbZKj2sVFoQTrh/yv1iX5wkcYsUkBla/G3bG0agmRHwIbFBbwlHGj9MUrDXGKbOaWr5PvUyWGHGds1tloAOay9mQwneSYkpz8GPIped/ONnM8fWlDWbtWKICZ1dTYvkD1XOQbQ/ACJAwZ6nhIN2DOVQnWbCqVAfL8x2RnSfNEHbbJ+ZZBzX23e3ddr/Uhnbfj6+Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPzWaI8ECtuovcPkRp2gxC7xqQHeV5oSsCr7QsGxeF0=;
 b=FM+try783nuSHXD92h4514AHvap4L2nJcx6N7v0vqTSvuFizi25Hqa/pfiBHm8niz2vWRCC80yrjw/cnxWZvVycwjDj6JV4e3bBHB4JjD8ew5w5noInkEbztuIMLtpTWhEU3j6Ur8IajUtJ5fXCmAaVZuHEg+U1anms63aDUKKQjYtkZMvJScOS9eD0f+QIVjb9WdTm2YUWL7xsAkBU8/QRmWIpH+LJm/GktkvytNnjymrlDMcrkFMFueV/xfaDYwUJSQ4vZqIsPeLhsemVMzU2TTxz+qPmUTaMfuuJoFatnPK8iy0rnA6FLMUqvm3gmBquDAZcgzYLSpuFtefxjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPzWaI8ECtuovcPkRp2gxC7xqQHeV5oSsCr7QsGxeF0=;
 b=aVSpOy750GQ6DdQmesR7msK+4aRlDSHK2E95PD7DuVxVlt+bVXt0UKIRpo1RtqXZ6FofSoixNTZerKlRw2ulBOM+12/Pj4AzLr0eFE77HF6hpUnC6XotUmYAThne4bPy1D16mb4MM4sTVOWtYE3TjwQ+by2OInV8mDQQRfNvMmRiY3GUBmubA5WJpQojdJ+3L/JFpxL+mz3YBLNEESXwsnfqEp8JQ8a8wbdVQ4SrxSa1lBuh0iCJOj9/pJoAOV6tWfpHWmANbquhalPssD7BWmF7xHcqzSutsbGaQNwDumuvI/qYGnIwBC811hMN5vSeXTWcHWmTTT6HpAGdEJepUg==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Thread-Topic: [PATCH v2] xen/arm: Reorder SCI resource cleanup in domain
 destruction
Thread-Index: AQHcJXs1K3LqZ5+aqE65C1kspBdxM7SfhaoAgAKQ8gA=
Date: Wed, 24 Sep 2025 08:54:09 +0000
Message-ID: <4b1cab53-e2dc-4cd4-86b5-1d1be974d089@epam.com>
References:
 <20ec9d9a8533417489a95543c1b72f7f55865c9c.1757856381.git.oleksii_moisieiev@epam.com>
 <6476dc12-1f9f-4b37-b569-e994bde6bcdb@xen.org>
In-Reply-To: <6476dc12-1f9f-4b37-b569-e994bde6bcdb@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8665:EE_
x-ms-office365-filtering-correlation-id: 0eed37ac-4d9b-406a-0247-08ddfb47ed2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QlpjUTZsOThHd3hEWmlQcjE1UU1KeTRIZ21xQTJpM0Z2NDN5ZDdJa09MeStW?=
 =?utf-8?B?RmZaZnFHVVBoajZ4NFpFYzhsUlZpaHNVaDF0RlFCZzNzMFcrR3FOdUwwUW9Z?=
 =?utf-8?B?KzJueTQweHpOZitudUYvU1gyNzk0YVBxbnJSNHBZMmhaVTJyK0NtdkRVZnlO?=
 =?utf-8?B?a0ExQUlhdjY3V3MwUUlieDdzNkpucG8vdklZRGpvOW85Zi9xazVrSzhPcEI4?=
 =?utf-8?B?b2RONEl2Q00zQ0N4NC9kVFk4Z0hOZGxCZUcyZ1RkbDRWblZOVExWSVJuaDhN?=
 =?utf-8?B?RWx6L3RJYkR6WWpEUUl6WW50eGQ1aFAycjVsMnRCQlUvNkJyRU4yTHZPak42?=
 =?utf-8?B?VVh5dTROVFdwbE5URnlYSFVlOE1Bb0t6U0w3YmxRQTVyMkZHRkVzdnZXcW1E?=
 =?utf-8?B?TGdCNFBkRERDS3A3Y0pxMStUUnZiUWp0dFczSlpidVdoOXRKcnA4UWcxd05w?=
 =?utf-8?B?NkdPSUYyWFloN1R0UGRvQ0hzYTRYUnh3SlluVGhkaWh4QlpNeGZEekRwa2Nq?=
 =?utf-8?B?THZKTW9NNzdXZEZTeVpjMlNzczF3YW9UZVpCcGkyemg5bHZ5OE5EaGtUdWdX?=
 =?utf-8?B?U3hqemh0K2t3N1g3V2EzL0hJd0xtMDRLWThMZHQ2cWE4NlNzRTJHUHVZemVv?=
 =?utf-8?B?dThxcldvY0k3ZXF2MlMxY3V3WUM5aUJQSUcvOWtRdjk4aStpR2lwRUg1STF6?=
 =?utf-8?B?T2JFOGNUaFhlMHRGMTBKVjQ1YTYrMHcvVDYrdnJVaEkvZitJZVBJcVo5ckg2?=
 =?utf-8?B?L1lVYTFaTzFLQjdqZDBVUmwwcXRCQ1lxUzQwQVpVY3RKamVBTXBRbXg2K0N4?=
 =?utf-8?B?dlR1RnJ3cWdXaCtjZk44aHFqZWJTOUJPQ3hucVdrSlFkYjZFT2RtTDZqN29S?=
 =?utf-8?B?WkNPQXUxWWpxMVB5WkdqMHZCNEx2bXRTU1Blb3RUWkxEbHBhclBScU93MVky?=
 =?utf-8?B?WkEvS01ta1lXb3ZOdVR6RU5LRlZWRkE5WXdoSGdZWnhrRWpUUHppN3JVcXBV?=
 =?utf-8?B?bkw4Q0d6WW04NTRCd1FaZXdxQTlWMm45OVZEYVRIVXVBN3UzNUdCTVVvb3M4?=
 =?utf-8?B?ZTRocUtndStDWTR3RlU4ZXQwbE5Ca0pqN1VNK3l1SERzdVhYMkREKzhQU1Q5?=
 =?utf-8?B?TG04RVBXbjZLWEl2cS80a1hsVGN3dC83UFV6WitXeEZ3dE9QdHJIR1lTYnFi?=
 =?utf-8?B?eThtUEp6NXNucDhRWnJwZzNuK0JRcFVGZVlmOXpncWxBWUI0Q2hBYzd0cDBB?=
 =?utf-8?B?eWp1aHNtTHhvUGV0djFrLzlySFJXMEZsVlE5UldQd1lWWDFIa0ZnckdVMkEv?=
 =?utf-8?B?c05ONXNwZ0tocE9adHpqNU1BVWFwK20rd1Y5QXllNHN0cEplMmEzdktDOXN3?=
 =?utf-8?B?cXk1cURHMEU4dGpjM2lKanpnbVp4a2lXQTIyUGdwT3dOM3pUUWd6TFV2Ym56?=
 =?utf-8?B?NGxUbHNXVG0vbng1YVQ3YzRXUUpPTkQrK2xHRGZYdFFYZW1NVitTbXFLOXBZ?=
 =?utf-8?B?empRTjdwR0JESHg3ZU5aOFJZYnh2MjFNK1ptWVZGL2t5dDJ2a2FHajZGemxV?=
 =?utf-8?B?RmJOSGJGL21RNEVtUE11NC9PZGhHTVhYcytPQXEyaC94cVpLN0I2eFdhRk4w?=
 =?utf-8?B?VEovZ1dRWVlCY1JhVGlVcStYQ2lVRlRIM1pyU3k1czBsQURqdHRNenpSa1Fv?=
 =?utf-8?B?WFpoVlFCWExnLzk3REZCVWtua3lvK0gyZklrVk9XSFBRenFpcVo4Q2RVK2tu?=
 =?utf-8?B?Mlc4UkdTT0QyTEdMTHBBQUVNWC9mNjMwZ3BTSXR6TFFMaWxWUFhLZ3V1SkNU?=
 =?utf-8?B?TTF1dzBReFRvdFVyMWkxV2FWNHZiUzlWaGFwcWdBcCtReWZ0WEs4M0VWbVR0?=
 =?utf-8?B?NGQ3ZnVDYzI0NUM5dktEWmVoaUtFYk9VL3hFa2RHYzc0ZnIxdWhzclBLUlNN?=
 =?utf-8?B?MHorbEM2clVUUFZOdUFmYk9OdDB3L1F5NHowRXF2ZCs2bDFLSmZmcWdoN0to?=
 =?utf-8?Q?Dw1JfcnL6cxMXmBsPFgb8hvvrLYj9w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVY0aXdTZXBjanBqTnVZT3dlNlZuUkVMaDdSKzZ1dkdPbm5pbVFtRlpnckdO?=
 =?utf-8?B?eUlHWnFBMUt4VlZvMEZvQjVzZ3QrVUxlNTdJYmtrN09GNmxleEs4eTcyaDRC?=
 =?utf-8?B?UVpWOUVsZUlneFkzL2tzUkxSbENYSXFzeDdhZ0hDQ1hGRmwvc0Nvam1hZkEr?=
 =?utf-8?B?aElwa2NTemhqTXZsSC92N2tLQkpFT3VRUHFKZGtHSVBBMFB6VGVJVlZCaVZr?=
 =?utf-8?B?R05ickM2d1JsZ2hLd1IrRytwc1htNTlYd2xOQlcwU2pMVjFZWGJ4UnlvekYw?=
 =?utf-8?B?WnFHTzY3RE5UeS9PZHpuanBJMHk0czdURnFLMEcvalpCSVoycVJKWWJtMTFM?=
 =?utf-8?B?UFVGQTF6UlduNzdncDdYQXJ1RHpIU3o3WWZQSlhscHhISVFBeThFUENxNklO?=
 =?utf-8?B?blBKNzF5ejNlUzhSQU5BQURWNFkzcnVra2srempRK1pkVzVsSVBmUy9ZUWVW?=
 =?utf-8?B?WTI3RnM1WktKeitCNkJoc3NkeHhmeTM0UzA5ME53dkZDT2lZNHhRS3BMaitS?=
 =?utf-8?B?bWt0K2pML2xwSnBKUUFGemVFbVdSbzVjTWgzYjNMSTBabGpUVFhvdjIwT3RV?=
 =?utf-8?B?aHdSK3B0TEVLZlVBYjJHeXZ0SjVNclE3VzdFNEl1SEI4bXVLZXQ5aDh5ZUxB?=
 =?utf-8?B?bitERVdrNDh6WWtGcWMxNVN4VFZxWW4wOS96Mi9sczBBbFJ4MmZkT2czVTd0?=
 =?utf-8?B?ZmoyejQrdkl6N1pKWEFJc2E0RU1aTFVCNGluRVkvcW12bmY4cHJtQUE5WFhx?=
 =?utf-8?B?QzhUNHNnOHBFUU9nVU1CVitwL21zNG5HWGxnVmw1Ylc5T3czMVRNVFEwZ2dx?=
 =?utf-8?B?dlo4c3lvY1kweVFhSjJEUkRSMDFINVdSUzhGbkxXV0xtREQxS2JkQlBKd09S?=
 =?utf-8?B?UVlPR3VVM3ZIQTAwVUJIZWdMMHZ3b3VxU0FWeW9xTjVHa3AyMzV4YzJUTXcx?=
 =?utf-8?B?Z3NsTjdVKytTcE9xKy81TmMwZzJCNCtvT2pxWXdJZ1N5a29taGdDbjJpR2ZF?=
 =?utf-8?B?S2dZLytJUTNxZU9DeGVGaEJvdlhsYUo2QzFzbnJxQm5NbTRGYWhmWVRHUGtn?=
 =?utf-8?B?OSs0OFhlU0puTUlpVVdVeXNpakZscllVL1JCNnhnbDJtZ084Qmo3Rmk1dis3?=
 =?utf-8?B?REdiclVUY0FNT1d5TWJIK2RpVVk4d0VPWmxSNW8vdTFGL2lqNWRLb0p1Tnls?=
 =?utf-8?B?RzZqbGp2QVhGMzVHN2FPeDNPSjRQMksxTFVDYnZGeFJEbExPOEdIYWd0bDNj?=
 =?utf-8?B?djlMdytXeXNUQTd5QXJTemh6RUg3SFZMd0VlejBucStYQW1YcmFjdTFUN2s2?=
 =?utf-8?B?QUV3N3N1M2xQZmp3c2NXNVB5cUJGbXVJbEhHcGtWeVRiOHFzRmtVWXRud2cv?=
 =?utf-8?B?SWExVHlJb3VEZTVGTW9ObG1iQ1BTTUc4TzFNWmt1SXJyRm81dlZwRWRucFM0?=
 =?utf-8?B?YWExN2JBeEJJdVNqVU41dGxPWkdNdWtuNUpEUzFDTk0vUUlmeDFOOUQwQ0lt?=
 =?utf-8?B?SURQVEdOOW81V0hGYURVOENZY1pHL2p3emxVNW5jWWRsalJoU2VFcG42Qjl4?=
 =?utf-8?B?S1VsOFU5UVdXaTllUkExUmhFdmYzL1ZJdElTUGZveVJwb0VNdGRCek5CMlZu?=
 =?utf-8?B?OWc2MmZZQjJkQzByajY0NFZreUdFWGVjK0U5ZGdTcDZJc2dhOWppRTNhQ1ZN?=
 =?utf-8?B?NkVTYUZGZXVDZXVMb2VPRVZHNTZpcmJzNzZIMUN5VFZtYnIvQ1oyQVkrcVgv?=
 =?utf-8?B?N01tVlBqNjVDdUpsK1JndW0zVVdpTEQxRkR0K0JDVHdQWC90SkJIVTB6cmdh?=
 =?utf-8?B?RXpYSzdlbXlIRFdXK2ViQnd0RWkyL0twWW9wOXltN3V5MUxIMUZJcU9qUzA3?=
 =?utf-8?B?ZVJKeDZOUzlvZEFZakJhalBqTVN0bzJsaXhLdjNncWZvL2VoMzVmUDc5Y0c3?=
 =?utf-8?B?cDU5cUxad3VrOFFWTGtmOW5oYXhEb3lhZEtKejE5bzBoSngyNjFIOWh5RWtD?=
 =?utf-8?B?dHNrK0haS1lzNjNuRW5oWUxweGtmUlFkZEhnLzRTZ0dwOHNZU1lIeDc5Vi9D?=
 =?utf-8?B?Y3B4RGtsbi92NjVCazlPRnlMMTZyNzdSb3c4NVFaZVV1eFZoQTU5THdUZHlh?=
 =?utf-8?B?ZDhzbU1wYkJwWmxlRldVbGVwc0FoeWV2NWFOUzZ3Q0dPeDJZNXc3QVlzV3E2?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB48DD9A15B6C648BD7E8E76F4C4A04C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eed37ac-4d9b-406a-0247-08ddfb47ed2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 08:54:09.6493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IW0VbJ6QhZYvh8uXgIM/60g4Fmvk6Ap25h5NuqTltjCWxwNfmLfVFJopfM+nPy3IbP/UyXdZOa650hvRZIOoBzUbkE6q8R3LzLPRa4dwzfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8665

SGkgSnVsaWVuLA0KDQpPbiAyMi8wOS8yMDI1IDIwOjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
ICgrIFJlbGVhc2UgbWFuYWdlcikNCj4NCj4gSGksDQo+DQo+IE9uIDE0LzA5LzIwMjUgMTQ6MjYs
IE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPj4gTW92ZSB0aGUgU0NJIChTeXN0ZW0gQ29udHJv
bCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UpIHJlc291cmNlIGNsZWFudXANCj4+IGVhcmxpZXIg
aW4gdGhlIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIHNlcXVlbmNlIHRvIGVuc3VyZSBw
cm9wZXINCj4+IGNsZWFudXAgb3JkZXJpbmcgZHVyaW5nIGRvbWFpbiBkZXN0cnVjdGlvbi4NCj4+
DQo+PiBUaGUgU0NJIGNsZWFudXAgaXMgbm93IHBlcmZvcm1lZCBiZWZvcmUgVEVFIChUcnVzdGVk
IEV4ZWN1dGlvbiANCj4+IEVudmlyb25tZW50KQ0KPj4gY2xlYW51cCByYXRoZXIgdGhhbiBhZnRl
ciBQMk0gbWFwcGluZyBjbGVhbnVwLiBUaGlzIHJlb3JkZXJpbmcgDQo+PiBlbnN1cmVzIHRoYXQN
Cj4+IFNDSSByZXNvdXJjZXMgYXJlIHByb3Blcmx5IHJlbGVhc2VkIGJlZm9yZSBvdGhlciBzdWJz
eXN0ZW1zIHRoYXQgbWlnaHQNCj4+IGRlcGVuZCBvbiB0aGVtIGFyZSB0b3JuIGRvd24uDQo+Pg0K
Pj4gVGhpcyBjaGFuZ2UgYWRkcmVzc2VzIHBvdGVudGlhbCByZXNvdXJjZSBjbGVhbnVwIGRlcGVu
ZGVuY2llcyB3aGVyZSBTQ0kNCj4+IHJlc291cmNlcyBuZWVkIHRvIGJlIHJlbGVhc2VkIGJlZm9y
ZSBQMk0gbWFwcGluZ3MgYXJlIGNsZWFuZWQgdXAsIA0KPj4gcHJldmVudGluZw0KPj4gcG90ZW50
aWFsIGlzc3VlcyBkdXJpbmcgZG9tYWluIGRlc3RydWN0aW9uIG9uIEFSTSBwbGF0Zm9ybXMgd2l0
aCBTQ0kgDQo+PiBzdXBwb3J0Lg0KPj4NCj4+IEZpeGVzOiBlMmNjMTA4NjdiICh4ZW4vYXJtOiBh
ZGQgZ2VuZXJpYyBTQ0kgc3Vic3lzdGVtLCAyMDI1LTA5LTA0KQ0KPg0KPiBJIGFtIG5vdCBzdXJl
IHdoZXJlIHlvdSBmb3VuZCB0aGlzIHN5bnRheC4gVGhpcyBpcyBub3QgdGhlIG9uZSB3ZSB1c2Ug
DQo+IGZvciBYZW4uIEl0IHNob3VsZCBiZToNCj4NCj4gRml4ZXM6IDxjb21taXQtaWQ+ICgiPHBh
dGNoLXN1YmplY3Q+IikNCj4NCj4gV2hlcmUgdGhlIGNvbW1pdC1pZCBpcyAxMiBjaGFyYWN0ZXJz
LiBGb3IgdGhpcyBwYXRjaCBpdCBzaG91bGQgYmU6DQo+DQo+IEZpeGVzOiBlMmNjMTA4NjdiNjMg
KCJ4ZW4vYXJtOiBhZGQgZ2VuZXJpYyBTQ0kgc3Vic3lzdGVtIikNCj4NCkdvdCB0aGlzIGJ5IHVz
aW5nIGNvbW1hbmQgZ2l0IHNob3cgLXMgLS1wcmV0dHk9cmVmZXJlbmNlIDxzaGE+DQpXaWxsIGZp
eC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIE1vaXNpZWlldiA8b2xla3NpaV9tb2lz
aWVpZXZAZXBhbS5jb20+DQo+ID4gLS0tPg0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gcmVhcnJh
bmdlIGVudW0gYnkgcGxhY2luZyBQUk9HX3NjaSBiZWZvcmUgUFJPR190ZWUNCj4+IC0gYWRkICJG
aXhlczoiIHRhZw0KPj4NCj4+IMKgIHhlbi9hcmNoL2FybS9kb21haW4uYyB8IDExICsrKysrKy0t
LS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMgYi94ZW4vYXJjaC9h
cm0vZG9tYWluLmMNCj4+IGluZGV4IDFhODU4NWQwMmIuLmUzNjcxOWJjZTQgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4u
Yw0KPj4gQEAgLTEwNDIsNiArMTA0Miw3IEBAIHN0YXRpYyBpbnQgcmVsaW5xdWlzaF9tZW1vcnko
c3RydWN0IGRvbWFpbiAqZCwgDQo+PiBzdHJ1Y3QgcGFnZV9saXN0X2hlYWQgKmxpc3QpDQo+PiDC
oMKgICovDQo+PiDCoCBlbnVtIHsNCj4+IMKgwqDCoMKgwqAgUFJPR19wY2kgPSAxLA0KPj4gK8Kg
wqDCoCBQUk9HX3NjaSwNCj4NCj4gQ2FuIHlvdSBjb25maXJtIHRoaXMgaXMgZmluZSB0byByZWxl
YXNlIHRoZSBTQ0kgcmVzb3VyY2VzICphZnRlciogd2UgDQo+IHJlbGVhc2VzIHRoZSBkZXZpY2Vz
PyBEb2VzIHRoaXMgbWVhbiB0aGV5IGFyZSBub3QgbGlua2VkIHNvbWVob3c/IEZvciANCj4gaW5z
dGFuY2UsIGlmIGEgZGV2aWNlIGlzIHJlLWFzc2lnbmVkIHRvIGFub3RoZXIgVk0sIGNvdWxkIGl0
IGZhaWwgDQo+IGJlY2F1c2UgdGhlIGFzc29jaWF0ZWQgKD8pIFNDSSByZXNvdXJjZXMgd2VyZSBu
b3QgeWV0IHJlbGVhc2VkPw0KPg0KPiBDaGVlcnMsDQo+DQpUaGlzIGlzIG5vdCBhbiBpc3N1ZSBm
b3IgYSBzaW5nbGUtYWdlbnQuIFRoaXMgaXMgYmVjYXVzZSBzaW5nbGUtYWdlbnQgDQpkb2Vzbid0
IGltcGxlbWVudCByZWxpbnF1aXNoX3Jlc291cmNlcyBjYWxsYmFjay4NCkZvciBtdWx0aWFnZW50
IGltcGxlbWVudGF0aW9uIHJlbGlucXVpc2hfcmVzb3VyY2VzIGlzIGRvbmUgYnkgc2VuZGluZyAN
ClNDTUlfQkFTRV9SRVNFVF9BR0VOVF9DT05GSUdVUkFUSU9OIG1lc3NhZ2UgdG8gdGhlIGZpcm13
YXJlIHdoaWNoIHNob3VsZCANCmRyb3AgYWxsIGFnZW50IGNvbmZpZ3VyYXRpb24gcHJldmlvdXNs
eSBkb25lLg0KSWYgd2Ugc3RhcnQgYW5vdGhlciBWTSB3aXRoIGFzc2lnbmVkIGRldmljZSBzeXN0
ZW0gd2lsbCBhc2sgZGV2aWNlIA0KcGVybWlzc2lvbiBmcm9tIHRoZSBmaXJtd2FyZS4gQW5kIGlm
IGRldmljZSBpcyBhc3NpZ25lZCB0byBhbm90aGVyIGFnZW50IA0KLSBlcnJvciBzaG91bGQgYmUg
cmV0dXJuZWQuDQoNCi0tDQpPbGVrc2lpDQo=

