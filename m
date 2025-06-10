Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67312AD311B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 11:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010622.1388768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOut2-0007nP-Mj; Tue, 10 Jun 2025 09:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010622.1388768; Tue, 10 Jun 2025 09:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOut2-0007lg-JP; Tue, 10 Jun 2025 09:03:16 +0000
Received: by outflank-mailman (input) for mailman id 1010622;
 Tue, 10 Jun 2025 09:03:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YG+S=YZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uOut0-0007la-R5
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 09:03:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2412::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b97f1550-45d9-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 11:03:08 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Tue, 10 Jun 2025 09:03:04 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 09:03:03 +0000
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
X-Inumbo-ID: b97f1550-45d9-11f0-a306-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=omTr7huueHHwmperRVGKiIZ2PdTPZt1Mb3gOynhshBV321p+oSixf1jJndhVaaMTZetc0JsfiucXjileGBokExavrRM5SBtH+t1oblD4aXH04llCxyCewhxL8AVSypGlXlOPAhpy4hErO5aZAcxwSZCkg5RaqOiKDYnCgYbCi1gkZKZzzFIZJXLbhnXdM7VUPUaY7ocDBt1Phl2es8kn5CTN3XvrOJthYjJ2Rmhiv3kPg4lVslSmC5zB87qRrMvT/FilDp0SZwzkKzM0icDXAEoSrDU6Z8LESIHdsJ6QJOxrPZRY5ieS6IgWkBHYUwv2DoDZwjwdZt1amb1fVgojIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv+5URx8pFmGch36sWFjT6ZJ6wkJTqU61KduxwJA/N0=;
 b=jNegdgpk/At2X3SR7XGaR5tHFkVqsRMez+DTJ9o4NTPvQymOAiwf0fmtNjCvuvzIBZ1vHJsoMC64ewS2stvB1yWEptkNtA2tidmPGV8aQzZUytof82ypSbPrviJblJlmcHwMR+z0ieSh4mZI8wAaDfGuQ6hJee0IZY5FcPJzO6ioauhoMIQ7WA2k+ovzi9M3DScpP1tPM6DkkY/UHo2VkIRMR0aA77FI5FTjHAzjPZEUqZesWbbWIuiIw9KQ75d2svAauee9CGZSaXCfvl3xDReoHpqTGdYXnvgOrOZAdLxw2mjyFSfFdeA7CGPEwDiO9Q04IQ+9qv3FyeAOXiWTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pv+5URx8pFmGch36sWFjT6ZJ6wkJTqU61KduxwJA/N0=;
 b=taXAEe74kj0slZsGUv7eCHTH/U/frT3qwm6Fqn8ZPageUulDTndS/nQSzln1VbXDDUMzm1JQlecGinhauFmBhtXYVzWXjwgT/EDlJCNtAKMNHiigq5RptEio9qvSQ4k3czM3aaC0SRp9A7OFszON9S6b4i6UOP5R77HM5/f0m+o=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v5 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHbziMOHCuaHG697kCTYWoBETQpzrP0lKSAgAGsWwD//4WWAIAAI9IAgAUkMwD//5c1AIAAk1OA//+AeAAANIYcgP//sryAgAClEwA=
Date: Tue, 10 Jun 2025 09:03:03 +0000
Message-ID:
 <BL1PR12MB58498C2AB9B493F96A47D698E76AA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-5-Jiqian.Chen@amd.com>
 <aEGSp-LKerGb-wIW@macbook.local>
 <BL1PR12MB58497C341C79658B7221A67FE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <752cff02-cef6-4a4c-80b9-eba3bbf9b264@suse.com>
 <aEKxWLdDDyzmNvGF@macbook.local>
 <BL1PR12MB5849CA0CBDAE1E49DE54BD03E76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEapjHyBxHkkylkh@macbook.local>
 <BL1PR12MB5849102F05BD316C0BC20F9FE76BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <aEa6JsVwyWchp04u@macbook.local>
 <PH7PR12MB5854FC2E82CD17483B6B6BCFE76AA@PH7PR12MB5854.namprd12.prod.outlook.com>
 <6a7a1ab8-aabb-465b-bd22-a2bc1597b83b@suse.com>
In-Reply-To: <6a7a1ab8-aabb-465b-bd22-a2bc1597b83b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB6192:EE_
x-ms-office365-filtering-correlation-id: c13b5b79-3812-40d6-d6c9-08dda7fd9bae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGw2OFprZ2F3VHFOQVVzeVYzallXZ2JKUWRxMHZsdk9ndTBMV200RGtLbUZh?=
 =?utf-8?B?WHpINnRTYngzR0xRTGJNckhnekl5bzR0WW1GR3VuLzNHQmFhZ2E4L2dMRTIw?=
 =?utf-8?B?RCtLY3J3ajgydW1aRGlJNHpYQmZvU2ZOb0RxS3R0WXkxZU1LQUlacTJUZm5H?=
 =?utf-8?B?QzExSkRsdVBVWHZuUGQ5a1JsVnZBSVVTZ2tqNExqYzJKN2hvNklnL1pubU9X?=
 =?utf-8?B?MkNpRzByZzNGdDV2KzlBckJYc1BJY3h2b3M1OC9jcVpGVFRxcjRvclUwWlpF?=
 =?utf-8?B?S3ZWTzBaMHVvd3VhMkcwOW81emJvdWl1NEQvZW5scWJtN2VZbWE1eHk3R3Vj?=
 =?utf-8?B?NHZkU2t5dlUvRWsrMS9HL2MxSGRSUlFINm5DdGFUMEJybmNHRElLZ0RyS3Az?=
 =?utf-8?B?aUJMdTlzcFpiRU1iejIxNmpBcTFpdCtBYzlKSzk3byttL2pvMTRNWUh1bjZE?=
 =?utf-8?B?eEhISXhuSnIzeDgzaG4zMGsyMjVHTFYzQXFZYlc5MnFWdFhQN2FoaFJrT212?=
 =?utf-8?B?ZTRJbWV0MXdSVzY3aE1rM2tubFByK1Fob1U2RTVzU3hqOG1menhieWZ3allC?=
 =?utf-8?B?TGUrekg3Ui8rNk01cVlJMEFUekMwbDRkU1ZjTDYrS0Z0NkZ3MTNZS2NqUm1r?=
 =?utf-8?B?azkvdWZ5YnVGeEx3T2tWYnBrcm1YOUZqNVZ1RjJnLzFRbFdXTTAvN05lY0l1?=
 =?utf-8?B?STNTOWhyNnAraUtPSyt3WHVVLzljTnpoSEswRjZaUDhYTExQU1dKL1YvaWRm?=
 =?utf-8?B?bnYyZXhmK0hRaloxTWlCR25ZdXhNL2grQXB5eHBHTzRiVEZkTmxWNEdBeUdX?=
 =?utf-8?B?bFRmeVRrVTl6akQ1blRxUHo5bEZVUDEzcGpBSGNzQnc2VktHRll1dU5WMU1J?=
 =?utf-8?B?SWJ1bEVmNEdXVmhxWVpKNk4zcjJtaGVobld2Y1R3K1hUdm1oRmM4V3l3Wkh1?=
 =?utf-8?B?bUNGeXVQb0hmS3ZiUW9nSEp4NGhFck9WaFJFdWRxYndSSGlsbFJBSGh1SEQ0?=
 =?utf-8?B?VTVNbHc4Y3hrU1J4aG4yZ2VKcmFld2p5ZW9lUGJQRERVVFFNaHhrM1dzUUtH?=
 =?utf-8?B?V3J4YnN4SW01c3lmK1VGUWpock02NjdlZkR0b2tZK2FyaXhrUlpBRE5MVGNB?=
 =?utf-8?B?N2JXSkxreW1hWFR5UGgrUDNOSGQyVjVmYW1iU3N2dDNwd0tOVzFGdDVtaEk1?=
 =?utf-8?B?NWY0UkIxUUpzTXB4OUFIRHpOeFF0cEROaTRLbkp5VW04bExablhaWm85bzFy?=
 =?utf-8?B?TmZjcllqS051aGZhZEcyV2dSY1ZDV3FzWnBnQWQ2N29aV3ptblpYbCtvU0ZG?=
 =?utf-8?B?VXh6WXlKbnQ5YjJkcFk1Yy9pT09Bd2NVb0VrSjZnNGlvL25NZ0tVZmFNTzFh?=
 =?utf-8?B?YmlSN3FTd2pyVi9JdWRyR3RYS2R0OURvdmx0OStEdlpUY0VCcENsdHo3OTli?=
 =?utf-8?B?U1hNbHlvOHN5YXAyZGJkV1ZpeXd6eGU4bmllQzFYQmsxQjZXU2JVS1RUVVdJ?=
 =?utf-8?B?QVZxWEI4c0hIa1RscWRqMDBTWnZDZDJ6SGVkRFZVOXh6Z3hTNGJ2VUxWSkgy?=
 =?utf-8?B?MlhxeG9VZjl4MDNvLzBvZDRkYjcydFgwc0NOMG03SW9yd01GT2Ivd2tuWS9X?=
 =?utf-8?B?eGdWT2hJV29lbk0wTnpuMjBPR3JyeFJOR1lhV2xMQkFqWGt4Mk9iUDgzbXdq?=
 =?utf-8?B?WkJUUjJGeTlwakdqalJhUkh4T2lEczhkREdoUkp4M3RjUUdiWERtNU5sZUgz?=
 =?utf-8?B?SDFvYnZ1YXRWU2FkVDJwV0Q2YW9TZmJYNFJycXhOakdia1FNSzhUTkF3K25N?=
 =?utf-8?B?U2huUEFWRVU3S3V3MmRMN0VDcVo2UU9Pd2Q5eHhJd0c4RVVqNUxVZDFLNU9S?=
 =?utf-8?B?SXdhZ0RxdGlEM3pnWFdLVHF3bmt0V1IzV3lHWmJ2QTZtZk52ODVwdk9QTHhh?=
 =?utf-8?B?MGxBdkkyMkVDOVF3cWlSUWlYUlFPY3RyTmpabnBodFh6a2QwUUVxc2FzSWxD?=
 =?utf-8?B?WXZjWThRem9BPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUVTTVpVTHNFZ1NNS25BcmV1YUF2ZXZNa2FjK01RYzkyVHIvY0oyenZ3Z0NK?=
 =?utf-8?B?Y1hjd0pVU3pqSlc4WkNaMW95bmZmc0p5NXBaRXBuYWtrRDhLZXFMZC8wTTdh?=
 =?utf-8?B?QzVCVUZOMlhFQjB4QklVKzlmRkdmRXhJdVZpR1B1UC8yb0d3TWdOVisvKzQ5?=
 =?utf-8?B?NGhYT3RMZHJ3S2JqVlZTVlRET1dCaGlwdCtUb0pmZHA3bUNRalhVT092QmM2?=
 =?utf-8?B?bVk2S1R2UlIzemp2R1VhZ2ltandKTUlrb0NZczQ4ZXNjeWVwaEhqd1dodC82?=
 =?utf-8?B?WTJDVnAzSXQzUTZOTG1jQlZYaENMOTB4TWZVU092aE01N2hUVjM1R1NWNVFl?=
 =?utf-8?B?Ui9oTEw2QnJQRE9ZY3ZFcGREZWJLUnJuRVZxRTk5Wm5laXpuMFBJcVNqQzB2?=
 =?utf-8?B?NVQxVFlvQ2IwTTE5Tzh2cGFmTDBvSEx6TTN0bXhrcGpyVVU4c1lYYytldTh2?=
 =?utf-8?B?TUl2aHhhaEJqU1M2RTh5cGMyM09wZE9HWU55SWl4K0I5bnZBcmlRTjdzQlFN?=
 =?utf-8?B?WWpkUVo4dnRFZzFZekNNdzI5emVjSWd1b0JvVGN0V0h0enJIRkNFb1dRcXpR?=
 =?utf-8?B?alB5b0pMWGZmTXlId3JLNTIwNkZsbE5YRWcxWWVFeTNUa2ZBL0U5bVVtYklz?=
 =?utf-8?B?eXJSU1Y2Z1JLRlRCNE1pcHMrWm5yOUs4QnNTYzdzT3BZQUpkRXJtNUhFazNY?=
 =?utf-8?B?Nm05aTdMb250ZHEzVVdENmNmUlZ1R2ppMzBIQXVnRkdNczNyZ2xoa1VCMGZH?=
 =?utf-8?B?ZS9NczFtOWNyTzRMbGtWbGkrTnMzZzBOMXAwbWtFaTBrdjdnTmNkYVA5cjFP?=
 =?utf-8?B?VEpIcTBla0VScWFpYk0xNU1pWDhmdm5UY1FIL3NzeCtoR1N1L2ZFNlloWEF2?=
 =?utf-8?B?dkxJQnozWlZmQ3g4akl1Umw3RjFEejNxVWUybTI2RERBQmRkblR5dkc2bysw?=
 =?utf-8?B?MTh1dzUyRzBmTWNiNmZRSnFEbmhyVElGdElBLzl3Sktacys4TmREeFdPU3ZC?=
 =?utf-8?B?V05IZjhVR1pJREYweW9pNUpKSVNLbXZyS1lEdFh4UmhlS2ViVXpYOE1XcWha?=
 =?utf-8?B?YUhEYS9YT0RSck9FRnN6MTBVN1dDT2daNnlZVGx0UHpmRXZIbTMvVHUvUWQy?=
 =?utf-8?B?L1dRSnJMUmIrbTI3dlZ3K1dqdXNXRXQxelRvWVgvOFVBVHp3aCtqTmhyTEdW?=
 =?utf-8?B?eFVyd2ZGSWhIekZSRkJ4bmpHWEF6ZmN1TW04T0lVOW13eUdmZDkrUkhWRDR0?=
 =?utf-8?B?QnYzSm1HQ2NVTEYxMWZvcG81bUwxWHJ0R2RYQWJGaEFndC9oRlpJNUw2NUFN?=
 =?utf-8?B?NTBKb1I5TFoyOWRiMEp6RzNZWXZYV3dWWisrYkRSUGludWVDM1VFL1ZPdTNB?=
 =?utf-8?B?QURsVzJmOVl1Y1Jkc0cxeXNFZC9BTE1ZZmpYNzhHc1FpZDhma2FqWC9UbFls?=
 =?utf-8?B?RmllNE43dXhKdzdxd1RjWU5kZW9RaUxhQ0lTbDY5ZUhHQnBDRHF6cU9hY2N1?=
 =?utf-8?B?c2dnS3VndWZ0V1ZOZ0U2bmxCYlkvTm1DZnU2ZWxSZ0JEQjhvTGg0ZVMwV1Zh?=
 =?utf-8?B?M0RIOXJXYllmZGg0TkF4RzhuWUJZWE5SYTdWZGFjb0dUd3ZCdGFJS1J1cFJI?=
 =?utf-8?B?WWQ0SkttWnpvM09tVlRGSjRqTTNRZERlWmVRSFZibm9ZVzNNcmVrMUxHYUUy?=
 =?utf-8?B?ZUpDWFduYjhTYm81VDdIRUxrVUE5d3ZvUGxKQVJEZloxUkpHOUFhYmNwWEVl?=
 =?utf-8?B?eFExa0ZiNU1sZDhYamkxUTEwQUQ3Qis0azBBdFJTcGdObTRjb3E5SHgxdDk1?=
 =?utf-8?B?aU5CcXV5WWZKU3NzLzE2RU9SbmNpMmUyRlc3SEF1QThiRDR5WXdpRk5KTmFo?=
 =?utf-8?B?dHMvRW9nZVVXcGkwb3RCMG5UbmJ6c3hteHh3SUdicWhyUHNGUFpIQk4yQmNY?=
 =?utf-8?B?cVhJVDdXOVBGRit4UEY4NkVGNjlmRE9yd3NFa2tiWVlUVEFtdk1pdVFJWVpV?=
 =?utf-8?B?eUd1Q3NYbEV2Nm50M3orWk9WTGFKcFlDU2hSb3BrZGhRZVI0Nks5Q3dyK2RX?=
 =?utf-8?B?dldmWlpGdkhxOTc0dkRPeXc2Rkl4cmFOek9Fa3hnYXByWW1saHRTNGVWLzg0?=
 =?utf-8?Q?M6ZA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73ABBEF95019184FBD9AC3CF61F9797E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13b5b79-3812-40d6-d6c9-08dda7fd9bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 09:03:03.6892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vYubJSfvG5P7ByuLlLMK+M4Y+S/14A2mWXCTa4I2V8Z2EokFI+n4i0ia2toS5ZUN04LPyDUDXJwlpS+GaO7Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192

T24gMjAyNS82LzEwIDE1OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTAuMDYuMjAyNSAw
NTo1MiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzkgMTg6NDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMTA6MTg6NDJBTSAr
MDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+PiBPbiAyMDI1LzYvOSAxNzoyOSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgSnVuIDA5LCAyMDI1IGF0IDA3OjUwOjIx
QU0gKzAwMDAsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+PiBPbiAyMDI1LzYvNiAxNzoxNCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4gT24gRnJpLCBKdW4gMDYsIDIwMjUgYXQg
MDk6MDU6NDhBTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+PiBPbiAwNi4wNi4y
MDI1IDA4OjI5LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gMjAyNS82LzUgMjA6
NTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+Pj4+IE9uIE1vbiwgTWF5IDI2LCAy
MDI1IGF0IDA1OjQ1OjUzUE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOiANCj4+Pj4+Pj4+Pj4+
ICsgIH07IFwNCj4+Pj4+Pj4+Pj4+ICsgIHN0YXRpYyB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3Qg
ZmluaXQjI19lbnRyeSAgXA0KPj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgIF9fdXNlZF9zZWN0
aW9uKCIuZGF0YS52cGNpIikgPSAmZmluaXQjI190DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IElN
TyB0aGlzIHNob3VsZCBiZXR0ZXIgdXNlIC5yb2RhdGEgaW5zdGVhZCBvZiAuZGF0YS4gDQo+Pj4+
Pj4+Pj4gSXMgYmVsb3cgY2hhbmdlIGNvcnJlY3Q/DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiArICAg
IHN0YXRpYyBjb25zdCB2cGNpX2NhcGFiaWxpdHlfdCAqY29uc3QgZmluaXQjI19lbnRyeSAgXA0K
Pj4+Pj4+Pj4+ICsgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIucm9kYXRhIikgPSAmZmluaXQjI190
DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gTm8sIHNwZWNpZmljYWxseSBiZWNhdXNlIC4uLg0KPj4+Pj4+
Pj4NCj4+Pj4+Pj4+Pj4gTm90IHRoYXQgaXQgbWF0dGVycyBtdWNoIGluIHByYWN0aWNlLCBhcyB3
ZSBwbGFjZSBpdCBpbiAucm9kYXRhIGFueXdheS4gIE5vdGUNCj4+Pj4+Pj4+Pj4gaG93ZXZlciB5
b3Ugd2lsbCBoYXZlIHRvIG1vdmUgdGhlIHBsYWNlbWVudCBvZiB0aGUgVlBDSV9BUlJBWSBpbiB0
aGUNCj4+Pj4+Pj4+Pj4gbGlua2VyIHNjcmlwdCBhaGVhZCBvZiAqKC5yb2RhdGEuKiksIG90aGVy
d2lzZSB0aGF0IHNlY3Rpb24gbWF0Y2ggd2lsbA0KPj4+Pj4+Pj4+PiBjb25zdW1lIHRoZSB2UENJ
IGRhdGEuDQo+Pj4+Pj4+Pj4gSSBhbSBzb3JyeSwgaG93IHRvIG1vdmUgaXQgYWhlYWQgb2YgKigu
cm9kYXRhLiopID8NCj4+Pj4+Pj4+PiBJcyBiZWxvdyBjaGFuZ2UgY29ycmVjdD8NCj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4veGVuLmxkcy5oIGIveGVu
L2luY2x1ZGUveGVuL3hlbi5sZHMuaA0KPj4+Pj4+Pj4+IGluZGV4IDc5M2QwZTExNDUwYy4uMzgx
NzY0MjEzNWFhIDEwMDY0NA0KPj4+Pj4+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi94ZW4ubGRz
LmgNCj4+Pj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4veGVuLmxkcy5oDQo+Pj4+Pj4+Pj4g
QEAgLTE4OCw3ICsxODgsNyBAQA0KPj4+Pj4+Pj4+ICAjZGVmaW5lIFZQQ0lfQVJSQVkgICAgICAg
ICAgICAgICBcDQo+Pj4+Pj4+Pj4gICAgICAgICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7IFwN
Cj4+Pj4+Pj4+PiAgICAgICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47ICAgXA0KPj4+Pj4+Pj4+
IC0gICAgICAgKihTT1JUKC5kYXRhLnZwY2kuKikpICAgICBcDQo+Pj4+Pj4+Pj4gKyAgICAgICAq
KC5yb2RhdGEpICAgICAgICAgICAgIFwNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAuLi4gdGhpcyBpc24n
dCAtIHlvdSdkIG1vdmUgX2FsbF8gb2YgLnJvZGF0YSBpbnRvIGhlcmUsIHdoaWNoIGRlZmluaXRl
bHkNCj4+Pj4+Pj4+IGlzbid0IHdoYXQgeW91IHdhbnQuIFdoYXQgSSB1bmRlcnN0YW5kIFJvZ2Vy
IG1lYW50IHdhcyBhIC5yb2RhdGEtbGlrZQ0KPj4+Pj4+Pj4gc2VjdGlvbiwgZS5nLiAucm9kYXRh
LnZwY2kuKiAobXVjaCBsaWtlIGl0IHdhcyAuZGF0YS52cGNpLiogYmVmb3JlKS4NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gSW5kZWVkLCBteSBzdWdnZXN0aW9uIHdhcyBtZXJlbHkgdG8gdXNlIC5yb2RhdGEg
aW5zdGVhZCBvZiAuZGF0YSwgYXMNCj4+Pj4+Pj4gdGhhdCdzIG1vcmUgYWNjdXJhdGUgSU1PLiAg
SSB0aGluayBpdCBzaG91bGQgYmUgKigucm9kYXRhLnZwY2kpIChhbmQNCj4+Pj4+Pj4gc2FtZSBz
ZWN0aW9uIGNoYW5nZSBmb3IgdGhlIF9fdXNlZF9zZWN0aW9uKCkgYXR0cmlidXRlLg0KPj4+Pj4+
DQo+Pj4+Pj4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgdGhlIG5leHQgdmVyc2lvbiB3aWxs
IGJlOg0KPj4+Pj4+DQo+Pj4+Pj4gKyAgICBzdGF0aWMgY29uc3QgdnBjaV9jYXBhYmlsaXR5X3Qg
KmNvbnN0IGZpbml0IyNfZW50cnkgIFwNCj4+Pj4+PiArICAgICAgICBfX3VzZWRfc2VjdGlvbigi
LnJvZGF0YS52cGNpIikgPSAmZmluaXQjI190DQo+Pj4+Pj4gKw0KPj4+Pj4+DQo+Pj4+Pj4gYW5k
DQo+Pj4+Pj4NCj4+Pj4+PiAgI2RlZmluZSBWUENJX0FSUkFZICAgICAgICAgICAgICAgXA0KPj4+
Pj4+ICAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOyBcDQo+Pj4+Pj4gICAgICAgICBf
X3N0YXJ0X3ZwY2lfYXJyYXkgPSAuOyAgIFwNCj4+Pj4+PiAtICAgICAgICooU09SVCguZGF0YS52
cGNpLiopKSAgICAgXA0KPj4+Pj4+ICsgICAgICAgKigucm9kYXRhLnZwY2kpICAgICAgICAgICBc
DQo+Pj4+Pj4gICAgICAgICBfX2VuZF92cGNpX2FycmF5ID0gLjsNCj4+Pj4+DQo+Pj4+PiBEaWQg
eW91IGFsc28gbW92ZSB0aGUgaW5zdGFuY2VzIG9mIFZQQ0lfQVJSQVkgaW4gdGhlIGxpbmtlciBz
Y3JpcHRzIHNvDQo+Pj4+PiBpdCdzIGJlZm9yZSB0aGUgY2F0Y2gtYWxsICooLnJvZGF0YS4qKT8N
Cj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBCdXQsIHRoYXQgZW5jb3VudGVyZWQgYW4gd2FybmluZyB3
aGVuIGNvbXBpbGluZy4NCj4+Pj4+PiAiIHtzdGFuZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNz
YWdlczoNCj4+Pj4+PiB7c3RhbmRhcmQgaW5wdXR9OjExNjA6IFdhcm5pbmc6IHNldHRpbmcgaW5j
b3JyZWN0IHNlY3Rpb24gYXR0cmlidXRlcyBmb3IgLnJvZGF0YS52cGNpDQo+Pj4+Pj4ge3N0YW5k
YXJkIGlucHV0fTogQXNzZW1ibGVyIG1lc3NhZ2VzOg0KPj4+Pj4+IHtzdGFuZGFyZCBpbnB1dH06
MzAzNDogV2FybmluZzogc2V0dGluZyBpbmNvcnJlY3Qgc2VjdGlvbiBhdHRyaWJ1dGVzIGZvciAu
cm9kYXRhLnZwY2kNCj4+Pj4+PiB7c3RhbmRhcmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6
DQo+Pj4+Pj4ge3N0YW5kYXJkIGlucHV0fTo2Njg2OiBXYXJuaW5nOiBzZXR0aW5nIGluY29ycmVj
dCBzZWN0aW9uIGF0dHJpYnV0ZXMgZm9yIC5yb2RhdGEudnBjaSAiDQo+Pj4+Pg0KPj4+Pj4gV2hh
dCBhcmUgdGhlIGF0dHJpYnV0ZXMgZm9yIC5yb2RhdGEudnBjaSBpbiB0aGUgb2JqZWN0IGZpbGVz
PyAgWW91IGNhbg0KPj4+Pj4gZ2V0IHRob3NlIHVzaW5nIG9iamR1bXAgb3IgcmVhZGVsZiwgZm9y
IGV4YW1wbGU6DQo+Pj4+Pg0KPj4+Pj4gJCBvYmpkdW1wIC1oIHhlbi9kcml2ZXJzL3ZwY2kvbXNp
Lm8NCj4+Pj4+IFsuLi5dDQo+Pj4+PiAgMTcgLmRhdGEudnBjaS45ICAwMDAwMDAwOCAgMDAwMDAw
MDAwMDAwMDAwMCAgMDAwMDAwMDAwMDAwMDAwMCAgMDAwMDBhNTAgIDIqKjMNCj4+Pj4+ICAgICAg
ICAgICAgICAgICAgIENPTlRFTlRTLCBBTExPQywgTE9BRCwgUkVMT0MsIERBVEENCj4+Pj4+DQo+
Pj4+PiBJdCBzaG91bGQgYmUgUkVBRE9OTFksIG90aGVyd2lzZSB5b3Ugd2lsbCBnZXQgdGhvc2Ug
bWVzc2FnZXMuDQo+Pj4+Pg0KPj4+Pj4+IEFuZCwgZHVyaW5nIGJvb3RpbmcgWGVuLCBhbGwgdmFs
dWUgb2YgX19zdGFydF92cGNpX2FycmF5IGlzIGluY29ycmVjdC4NCj4+Pj4+PiBEbyBJIG1pc3Mg
YW55dGhpbmc/DQo+Pj4+Pg0KPj4+Pj4gSSB0aGluayB0aGF0J3MgbGlrZWx5IGJlY2F1c2UgeW91
IGhhdmVuJ3QgbW92ZWQgdGhlIGluc3RhbmNlIG9mDQo+Pj4+PiBWUENJX0FSUkFZIGluIHRoZSBs
aW5rZXIgc2NyaXB0Pw0KPj4+PiBPaCwgcmlnaHQuIFNvcnJ5LCBJIGZvcmdvdCB0byBtb3ZlIGl0
Lg0KPj4+PiBBZnRlciBjaGFuZ2luZyB0aGlzLCBpdCB3b3JrcyBub3cuDQo+Pj4+DQo+Pj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMu
Uw0KPj4+PiBpbmRleCBiZjk1NmI2YzVmYzAuLmM4OGZkNjJmNGYwZCAxMDA2NDQNCj4+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYveGVuLmxk
cy5TDQo+Pj4+IEBAIC0xMzQsNiArMTM0LDcgQEAgU0VDVElPTlMNCj4+Pj4gICAgICAgICBCVUdG
UkFNRVMNCj4+Pj4NCj4+Pj4gICAgICAgICAqKC5yb2RhdGEpDQo+Pj4+ICsgICAgICAgVlBDSV9B
UlJBWQ0KPj4+PiAgICAgICAgICooLnJvZGF0YS4qKQ0KPj4+PiAgICAgICAgICooLmRhdGEucmVs
LnJvKQ0KPj4+PiAgICAgICAgICooLmRhdGEucmVsLnJvLiopDQo+Pj4+IEBAIC0xNDgsNyArMTQ5
LDYgQEAgU0VDVElPTlMNCj4+Pj4gICAgICAgICAqKC5ub3RlLmdudS5idWlsZC1pZCkNCj4+Pj4g
ICAgICAgICBfX25vdGVfZ251X2J1aWxkX2lkX2VuZCA9IC47DQo+Pj4+ICAjZW5kaWYNCj4+Pj4g
LSAgICAgICBWUENJX0FSUkFZDQo+Pj4+ICAgIH0gUEhEUih0ZXh0KQ0KPj4+DQo+Pj4gRldJVywg
SSB3b3VsZCBwdXQgaXQgYWhlYWQgb2YgKigucm9kYXRhKS4gIFJlbWVtYmVyIHRvIGFsc28gbW9k
aWZ5IHRoZQ0KPj4+IGxpbmtlciBzY3JpcHQgZm9yIGFsbCB0aGUgb3RoZXIgYXJjaGVzLCBub3Qg
anVzdCB4ODYuDQo+Pg0KPj4gV2hldGhlciBiZWZvcmUgKigucm9kYXRhLiopIG9yIGJlZm9yZSAq
KC5yb2RhdGEpLCB0aGVyZSBzdGlsbCBpcyB0aGUgd2FybmluZyAiIFdhcm5pbmc6IHNldHRpbmcg
aW5jb3JyZWN0IHNlY3Rpb24gYXR0cmlidXRlcyBmb3IgLnJvZGF0YS52cGNpICINCj4+IEFuZCB0
aGUgb2JqZHVtcCBzaG93cyAicm9kYXRhLnZwY2kiIGhhcyBubyAicmVhZG9ubHkiIHdvcmQuDQo+
IA0KPiBEaWQgeW91IGNoZWNrIHdoYXQgZ2NjIGVtaXRzPyANCkkganVzdCBzYXcgYWJvdmUgd2Fy
bmluZy4NCj4gSXQgbWF5IGJlIHJlcXVlc3RpbmcgImF3IiBpbnN0ZWFkIG9mIHRoZQ0KPiB3YW50
ZWQgImEiIGluIHRoZSBzZWN0aW9uIGF0dHJpYnV0ZXMuIFNpbmNlIHRoZXJlIGFyZSByZWxvY2F0
aW9ucyBoZXJlLA0KPiAiLnJvZGF0YS4iIG1heSBub3QgYmUgdGhlIGNvcnJlY3QgcHJlZml4IHRv
IHVzZTsgaXQgbWF5IGluc3RlYWQgbmVlZCB0bw0KPiBiZSAiLmRhdGEucmVsLnJvLiIuDQpZb3Ug
bWF5IHJpZ2h0Lg0KRnJvbSAib2JqZHVtcCAtciB4ZW4vZHJpdmVycy92cGNpL21zaS5vIg0KSSBj
YW4gZ2V0DQoNClJFTE9DQVRJT04gUkVDT1JEUyBGT1IgWy5yb2RhdGEudnBjaV06DQpPRkZTRVQg
ICAgICAgICAgIFRZUEUgICAgICAgICAgICAgIFZBTFVFDQowMDAwMDAwMDAwMDAwMDAwIFJfWDg2
XzY0XzY0ICAgICAgIC5kYXRhLnJlbC5yby5sb2NhbC5pbml0X21zaV90DQoNCg0KUkVMT0NBVElP
TiBSRUNPUkRTIEZPUiBbLmRhdGEucmVsLnJvLmxvY2FsLmluaXRfbXNpX3RdOg0KT0ZGU0VUICAg
ICAgICAgICBUWVBFICAgICAgICAgICAgICBWQUxVRQ0KMDAwMDAwMDAwMDAwMDAwOCBSX1g4Nl82
NF82NCAgICAgICAudGV4dC5pbml0X21zaQ0KMDAwMDAwMDAwMDAwMDAxMCBSX1g4Nl82NF82NCAg
ICAgICAudGV4dC5jbGVhbnVwX21zaQ0KDQpBbmQgZnJvbSAib2JqZHVtcCAtRCB4ZW4vZHJpdmVy
cy92cGNpL21zaS5vIg0KSSBjYW4gZ2V0DQoNCkRpc2Fzc2VtYmx5IG9mIHNlY3Rpb24gLnJvZGF0
YS52cGNpOg0KDQowMDAwMDAwMDAwMDAwMDAwIDxpbml0X21zaV9lbnRyeT46DQogICAgICAgIC4u
Lg0KDQpEaXNhc3NlbWJseSBvZiBzZWN0aW9uIC5kYXRhLnJlbC5yby5sb2NhbC5pbml0X21zaV90
Og0KDQowMDAwMDAwMDAwMDAwMDAwIDxpbml0X21zaV90PjoNCiAgIDA6ICAgMDUgMDAgMDAgMDAg
MDAgICAgICAgICAgYWRkICAgICQweDAsJWVheA0KICAgICAgICAuLi4NCg0KPiANCj4gSmFuDQoN
Ci0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

