Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F8B21384
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 19:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077904.1438928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWW1-0000Yc-0b; Mon, 11 Aug 2025 17:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077904.1438928; Mon, 11 Aug 2025 17:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulWW0-0000WB-Tr; Mon, 11 Aug 2025 17:40:56 +0000
Received: by outflank-mailman (input) for mailman id 1077904;
 Mon, 11 Aug 2025 17:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UdnH=2X=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ulWVz-0000Vf-D3
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 17:40:55 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5306fed8-76da-11f0-a326-13f23c93f187;
 Mon, 11 Aug 2025 19:40:51 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB7929.eurprd03.prod.outlook.com (2603:10a6:20b:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 17:40:50 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 17:40:50 +0000
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
X-Inumbo-ID: 5306fed8-76da-11f0-a326-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZO3r65F8jTyiRwCa4mUW4QUS2IiYlgaG58xj4ZidrxVUi7t/RtZ3xmROTp+DPULeXqUmezachJj71t1fPU0XkUT3EV2iY2XoV1Tz3HrCMsNCiWfZq6TJn5l8JD3ZqEGHhBe6WZmOjhYpj8UGcrnUP9efC8uLnJ/4K/1kR80/e9Ubi14Sc87T92h+x1mim48acTcxuVPO8CzGKu/HBvg8y8GfukMxW76a5U74n5X3/EVsMb8U/ropwAcs6+aWEQw7Eui222KBeq3dJG/Y3QhAuH/0KC0zsY2CUS+u0xLL3BYaUsbJI1sA3E/YmZxJEyYKgch0f+4du8q0YsPOWciFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMT11yhLGrg7/X3gQ6X9PvpFzu0i8EZHmhhHbOF/Yds=;
 b=ul6knWDdPvDCJjbOnf/GYT9SRq+5UZZSW+Ln14ohUvKOHK+5+jykO3k1nzGUiM+tFNWetVacM6GY4y+NVbObukHY8yu5Inq+5Koc+y4TO1rfQ0Smae13qWY1XMe6/O/HAsA2Mygo+DQiKh4ZWz7/5RRANrC4xHhl3RouuRcGhKNjlArkaJOFLugJ4LVVmnFCmWX/B6RUHpAzP1KaERSR4tpNLcwwQueAXPKgQdi0sDwLMCNVU2rJ/yk7URzA9yqIDsVmeG0EKWjZQU+Mszqlbbdp+amn5tWlIVxbPO+xpHBFt+Vg46MoS/P+Eci00Xi71t+uF+2I/ZztBh/8cuCPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMT11yhLGrg7/X3gQ6X9PvpFzu0i8EZHmhhHbOF/Yds=;
 b=FnF/Z7O2S9bCv1bLvLuwtqpubhyZuUJyWxtxjl0BmLi9MRbqsx3NclAzi8E96V+MozonStoXfieUi/zRAb3QhU7SgkDeg/VdkHrr+lLHyrgnm2VtqHooa6BXBDCQcq0N56AEnzh3AgZjfRw2Nsqhbblq2I8CCTfgPtUXpcwWRit2IQT4e2M74aYl5SIqrfLFM1SDCTwSCYdRQH8Uao3kRMiMhQaTTrHVA2SkGmoVBvzF76tDGgVdMLTEchLQjVbUhddzyv17w8mxkRx/ltT0q9rNM9n94rZS8p3OK6zDU0TXPqWr5V8T6Ye7o3GfKnq7+3GoYZtnh9yZW/8zuTYvVA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] misra: comment default case in single-clause switch
Thread-Topic: [PATCH] misra: comment default case in single-clause switch
Thread-Index: AQHcCuaGmRofUvvSEEWe+78HEkEpW7RduFmA
Date: Mon, 11 Aug 2025 17:40:50 +0000
Message-ID: <d6d0ad87-df11-4dce-83f1-5a38e7120672@epam.com>
References:
 <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
In-Reply-To:
 <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB7929:EE_
x-ms-office365-filtering-correlation-id: a075783c-345d-4673-cad1-08ddd8fe367c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YjRLMFFDTWdvbXBHenFHMHRHOW1YekIyays3bVZlZWpaN3FZL1VUWEpQcWhM?=
 =?utf-8?B?SHVuTm5BQmVELzM0Zlo0enhOV3c0aXo4VWFUdm5EaXU1aGdQL0FsVTBRcm5V?=
 =?utf-8?B?eXhUS1llTTlRbGFOeFFvL0thT2xwL0pWKzZrbHhnbStoRTdUWGgzQnpyVkR1?=
 =?utf-8?B?YzBYSGs0b2V2NExKMTE4RStsZ3d5a0ZaQjhaM1R2MzZlMExrQS9mWUh0RCtQ?=
 =?utf-8?B?dUk5RWk0Mkt3dmZXU3dtUm03Z054T210Z3R5SGxUc0U2VDFBQWtlU2hGQ0tr?=
 =?utf-8?B?NHNVOVVUSVZDYXFsMFBCSFNCZnhxVi9iekF3Uzd5WXhONUZlMkI3cEV3bWZL?=
 =?utf-8?B?bXNTSUNiN2FTa0xqT1FaUG8zSHhJNG92dWlQeEFQL3Z1Rnh0bXBXRlBBWWNX?=
 =?utf-8?B?Ty9nTkFhbUM0VEhEWlNaNUNUbnBoQU8rOVpiTk03clRqZEVFY2w1dHMvdFhr?=
 =?utf-8?B?eHkrR0ZFQ3d4ZCtqZUlqN045MkZMUVBaeXRmOEVIUHhCbUxmVGpSUHFWNFIr?=
 =?utf-8?B?VVFqTkFLWWZXMEtMTUUxdktGbDhtWGFmNW92MXZlTjR2UzdkL2Exb2QyNkwz?=
 =?utf-8?B?NnE1KzBpSHV5VXRwczl6L0pZeG5Md0F4SjA0WVJGb0NpMnBvWk9Rb3NDRDRp?=
 =?utf-8?B?VVp4YjFlWnY3a0UrUVRNaUpIaDA4Y0xDWXF6Y2VIK05WYmJHV2FTUTh1blZ3?=
 =?utf-8?B?VkZUMmtRUTc0eGQxZm53OUVYS3QyZ2hyRzlndExuZzdyUG5xRGcrNlVaR25k?=
 =?utf-8?B?aHZNOGFJdkhZS2wzNkpNSEwxODQwU2tvcVJVYmxxZFNleUZiQlBMRDkxbEJv?=
 =?utf-8?B?ZkNsOEFJZHFLRGswNXkzVDBvUno3ellwekRubmdpUnNFZXdMWWV5RHhzY0x2?=
 =?utf-8?B?SHJUZUNSZ2lQUzRNWFdsMkhPQkw1T2dDcGkxRUFhVVhKdnhTSVFNYnFtMmJZ?=
 =?utf-8?B?TklNS25jSEptMlk2ZjdENGltU1AxclFUMkpUTE11RDlmVG9yWERqOGwzL0Fz?=
 =?utf-8?B?V0tzUDdXM1JZdUpjdlJrUFlwVno5aGx2Y09sL0Z3ZHRWeDNTMlE0T1Y5a25i?=
 =?utf-8?B?S29GTDREa20zTGVsSlJJSzYzL3hleDJjY2xqeFNycG9YRXNqcnJqc0lWcjl3?=
 =?utf-8?B?d0VPTkpoWll0d2JVQ3BNTG9CejU0SVgwVlREOGRDT21LS21RTnh5R2M2YmRl?=
 =?utf-8?B?TVptclcrQVZoaXA3a3ZWaXV0RHd1NGFKWDhFUkFEZm5UVVBmTTYwTVkzYUZF?=
 =?utf-8?B?NitBMmwwK0NCNDBFWnlCMUhsbVRydmNXTTRrNzV0WjdhUXEyZ01IaXVCZGFD?=
 =?utf-8?B?M3Nmak5mOFJVTTVzS0lJc2Y0OG9RQ2dzTk9BaXJPcFNlWitIb0ZuK1hLY3BI?=
 =?utf-8?B?a0gzZDB5SkVVajRwYlQwdUpubzBMM2hZV1ZpY1ZvL2svZTlmekgxM1pFZHJl?=
 =?utf-8?B?VWxyak5EQjNaSTRKWTZUNnczam93T0ttZGhHOTFLbi9UWFEyL0NEdTEvUnBJ?=
 =?utf-8?B?alVYb3gzVGYxS1VzTU4rWmFVcFoyUkFnNlR6YTVFT3FjNVowaVkzSlhPZXlB?=
 =?utf-8?B?Z2VDdExxejRPY0NETk5mTElkWUwvck1MKytjNlpKUm1EVU0wdDhtejJ6QU16?=
 =?utf-8?B?YTZ1TGdWMjBMa0IvZlZUY09wYVpNSzF0VVhJU3hhTlcrUEZNSm9mcVIvNmZY?=
 =?utf-8?B?V3luOW1qQmlLcUU5dENVRDJISVhuMFp5UnVWSFhENUJ0dklVQWhveWU3cStT?=
 =?utf-8?B?eTBjR3hHU3hHeXNvdzh0NEkwL0RDdDVUMkJCeWludmF0SmNsazB3OEVnTEEr?=
 =?utf-8?B?ZDdiaTlLZ3dwMCsrTG04UDNsRVp4YTh6VWptT3lkQ1pQUFBRcmhQRUNXaE9q?=
 =?utf-8?B?bG5XRllaUEZCbmRSTGhzdCtydW5MaEozOEx0Z0x4K3h3cE1sSEE1dUV4RjVa?=
 =?utf-8?Q?R6ZYY5ObNEw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEloWkhscG83K01MRmxmcVU2aEVWeXVjb0tZTFVmSW1mWmNhZHNQS0RvQ00z?=
 =?utf-8?B?WU16L1BaZlJPSXFkN3hldnZDV0tndTJ0dHY4NFg1cXRQN1Zvc2N4aDFVOUZ5?=
 =?utf-8?B?UFJnZjl6RnBKZWdaL1hmaHBGT0Z6Y1QyN3pCNG1FK1BGV3orYzhtclkvMjFI?=
 =?utf-8?B?RmFYb1Rvd1RCSjJ4TmhnRTM2NWlNbFNOSXFCVWFlcVF6WXVXN2pSVXBpU3lQ?=
 =?utf-8?B?Y2VVS2Jyc09vbWVyRUpTU2ptcDZ4eUt1aFVxNE9teDZqdHRaZ3haSWlDajgz?=
 =?utf-8?B?SGtaVm9raFkvOWFESW5PcDh3bzdiLzZKUWdjeUtXTHczM3BIbzMwcm1ZU2pU?=
 =?utf-8?B?RVgzemNmNHpzck1rRW4xcW5KRlpvZU9wazMxQ3dYSkNDU0lYVkpZOW5pdUhq?=
 =?utf-8?B?a2NRcHZib1RjSVJrbnIzVGU1RkN1OXRRV05ZSlorb2lqTkFCKzBGSldDUDVL?=
 =?utf-8?B?Z2l1MVk1ZlJiZ3BjL2NwSFEzUmVZVUJRaitmeVk0SEhNdDdwdHlVNHhLakV1?=
 =?utf-8?B?YWN5dndrZk5UcnFFdEtUOUlNeW1ZNTBHWlpoZndwVHM5Q2J6NlJWUmVsS0t0?=
 =?utf-8?B?MDlqM2hnR3UrZWlSTk5wYmYybjNIYmp2emdUUXNmTTdrODUvZmI2Y1JteE1M?=
 =?utf-8?B?V3FqNTdGS3ZwazhEUmhSakNxa1hwajRJUXlNNzZmYlBCaHFUL3ZLTktGc1ZB?=
 =?utf-8?B?QTJzWnNBV2szMTRDUHJ0d3I5K2dUWVoydHVqSFpVOHA3dVhSbmpBRnV6U29Q?=
 =?utf-8?B?YnNvSUxROG9LMXZYMXNyUnFXUGZHNE5LdVJpaDQ2ZHdCVURqWktEbnlYbUNr?=
 =?utf-8?B?TUlZNUNKS0Q4N1o0RkhwUGY1dnlITWd4WHRkNXNDd0VXaTBZU3VmY3JFZGF4?=
 =?utf-8?B?TGx3Q0thMHpyRG9XUGd6QkpWN283czZCaGNzSVZMd3FGZjB5YzNyNnNpU0xH?=
 =?utf-8?B?a05wRkhiQkRBM24yY0YxbXZJNkUxTDY1cjdzM0xYU3ViQ0RKZ3dvVnduNkhK?=
 =?utf-8?B?TkhJT0xMTXhUY00rK1MwdTlvcTFhTnlGdVV2WWJLNXBpUC9tVlNDeVArZUJ6?=
 =?utf-8?B?cm5SK25MdW1SOERlMkxtWFY2SkY3bjR6SEszdERNZnJSR3VOb0RPWGQwT2pp?=
 =?utf-8?B?SytnTDlLL2JqeEFRanpUd3Fidnp2c2F4ZTZTVGJ2TkdzRmhyV0g4NlFvcWY5?=
 =?utf-8?B?a1FCMmhSOEdZbGZNNHhTUXpsOUNpMi9UWTJoSSswZXNtVTFXOExrMHYxdm8y?=
 =?utf-8?B?ZDlKbTRNNjAwcjhIZ0p1QUVDMENtdytzOXJ2cWdoQ1NnT05IWjZWOFh2Sm83?=
 =?utf-8?B?Z05PNC9MQzZOMXN5YzRvckU0TlNTNzQwcGJPMXJpTjI4aWJZUVNaM0lUdmlS?=
 =?utf-8?B?N1pOYzRZV3ZkRzgvdDhWYmhTdk1ialFYVkFjZ0FqUzRnSWJXNWRTWFFLRERI?=
 =?utf-8?B?TmZBK1phMy9pQ2I1L1FuOU5yYmMvdWdBbFN2RVUxNlhNeDVQejIxWVlTc25J?=
 =?utf-8?B?RTJ4cHZQY0tjOERDMUdnSUd4bG1vb1ZoMmllMFFhVVROVmZvbnNHUDE1bGpX?=
 =?utf-8?B?OTBHR1VzZGRwdVc3aGJIQXdtM1FtbFQwUytkVEFObkZmMmNsRW9ZYmY1d0pu?=
 =?utf-8?B?MVNZMU5WanVXMEV4M3pjVWYyeWorUGhNb0tBN3E2VkpOZUFOaDRISW5tOUxp?=
 =?utf-8?B?RVNOc1hFUnVUOEQ2MDY5cURhQmN5RnhOQjZwZFc1SlM0KytmY2V2czZUYUZD?=
 =?utf-8?B?dGZZZU5lK0FVdWJ5eFh5SUx0K1BsbFJubnBaQ0tKUzFDOVJRNEVYblZScVQ2?=
 =?utf-8?B?eDJ2QlJkODN5Uyt1bmtpbTB6WUhHZTkvS1dYRGNXOHpOTjJvbGhBdytpWHZR?=
 =?utf-8?B?V0lFaWVsUHlHRzRDYUt2VS9FRFBacWF5UDIxUWlzRFlVNHQwcUtVOXQrcGIz?=
 =?utf-8?B?YVk5OTZWMEk3TkNtbnQ2YTc1eDNuSTMrVnd4RFNVeVdlMS84eUl5by95U2dR?=
 =?utf-8?B?M2ZoZG1JUTZxMStnekVOZkdlWjZZUEVKYmI3c1h6dEVhLzZvdTkwL29qa0dE?=
 =?utf-8?B?ZEJ6R3BMQVUwNmk1THE4OUdIYmgzYjJyNTVJeXpOamYzYmcrajBSeVpZRHo2?=
 =?utf-8?B?TVB0cmh2dDE5UE5hMXhwbnFnd1h5OWtEc3BGMytWUHdCUWhYa3U4WUM5OFNR?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8A11EB374CA7E4F96FF3BD98CD3B756@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a075783c-345d-4673-cad1-08ddd8fe367c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 17:40:50.3717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h2nS7GzGX/7JSQW9Uw9Tqnrh9HM8oDlrUVRpp47fLusPXSSq7J8mzKHe2myAUhUjU2yQpowo8rCoHZ3dgSleOdHsM48Us6haIR2Yqvbdxsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7929

DQoNCk9uIDgvMTEvMjUgMjA6MzYsIERteXRybyBQcm9rb3BjaHVrMSB3cm90ZToNCj4gTUlTUkEg
UnVsZSAxNi40OiBFdmVyeSBzd2l0Y2ggc3RhdGVtZW50IHNoYWxsIGhhdmUgYSBkZWZhdWx0IGxh
YmVsLiBUaGUNCj4gZGVmYXVsdCBjbGF1c2UgbXVzdCBjb250YWluIGVpdGhlciBhIHN0YXRlbWVu
dCBvciBhIGNvbW1lbnQgcHJpb3IgdG8gaXRzDQo+IHRlcm1pbmF0aW5nIGJyZWFrIHN0YXRlbWVu
dC4NCj4gDQo+IFRoaXMgY2hhbmdlIGFkZHMgY29tbWVudHMgaW4gZGVmYXVsdCBjYXNlcyBpbiBz
aW5nbGUtY2xhdXNlIHN3aXRjaGVzIHRvDQo+IGF2b2lkIHZpb2xhdGlvbnMgb2YgdGhlIHJ1bGUg
d2hlcmUgdGhlIGBkZWZhdWx0YCBjbGF1c2UgbGFja3MgYSBzdWl0YWJsZQ0KPiBjb21tZW50IG9y
IHN0YXRlbWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERteXRybyBQcm9rb3BjaHVrIDxkbXl0
cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL2FybS9jcHVlcnJh
dGEuYyB8IDUgKysrKysNCj4gICB4ZW4vYXJjaC9hcm0vZ2ljLmMgICAgICAgfCA2ICsrKysrKw0K
PiAgIHhlbi9hcmNoL2FybS9tbXUvcDJtLmMgICB8IDYgKysrKysrDQo+ICAgeGVuL2FyY2gvYXJt
L3RpbWUuYyAgICAgIHwgNiArKysrKysNCj4gICB4ZW4vY29tbW9uL2tleGVjLmMgICAgICAgfCA2
ICsrKysrKw0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyBiL3hlbi9hcmNoL2FybS9jcHVlcnJh
dGEuYw0KPiBpbmRleCAxN2NmMTM0ZjFiLi5lMzFjNzI2OTRiIDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC9hcm0vY3B1ZXJyYXRhLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jDQo+
IEBAIC03MzUsNiArNzM1LDExIEBAIHN0YXRpYyBpbnQgY3B1X2VycmF0YV9jYWxsYmFjayhzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgKm5mYiwNCj4gICAgICAgICAgIHJjID0gZW5hYmxlX25vbmJvb3Rf
Y3B1X2NhcHMoYXJtX2VycmF0YSk7DQo+ICAgICAgICAgICBicmVhazsNCj4gICAgICAgZGVmYXVs
dDoNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogRGVmYXVsdCBjYXNlIGxlZnQgZW1wdHkg
YXMgb3RoZXIgbm90aWZpZXIgYWN0aW9ucyBkbyBub3QgcmVxdWlyZSBoYW5kbGluZyBoZXJlLg0K
PiArICAgICAgICAgKiBUaGUgc2luZ2xlIENQVV9TVEFSVElORyBhY3Rpb24gaW4gdGhlIHN3aXRj
aCBpcyBzdWZmaWNpZW50IGJlY2F1c2UgdGhpcyBmdW5jdGlvbg0KPiArICAgICAgICAgKiBzcGVj
aWZpY2FsbHkgaGFuZGxlcyBlbmFibGluZyBlcnJhdGEgd29ya2Fyb3VuZHMgZHVyaW5nIENQVSBz
dGFydHVwLg0KPiArICAgICAgICAgKi8NCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICB9DQo+
ICAgDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2lj
LmMNCj4gaW5kZXggZTgwZmUwY2EyNC4uZGZiYjBkZmUwOCAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2dpYy5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9naWMuYw0KPiBAQCAtNDM2LDYgKzQz
NiwxMiBAQCBzdGF0aWMgaW50IGNwdV9naWNfY2FsbGJhY2soc3RydWN0IG5vdGlmaWVyX2Jsb2Nr
ICpuZmIsDQo+ICAgICAgICAgICByZWxlYXNlX2lycShnaWNfaHdfb3BzLT5pbmZvLT5tYWludGVu
YW5jZV9pcnEsIE5VTEwpOw0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIGRlZmF1bHQ6DQo+
ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIERlZmF1bHQgY2FzZSBsZWZ0IGVtcHR5IGFzIG90
aGVyIG5vdGlmaWVyIGFjdGlvbnMgZG8gbm90IHJlcXVpcmUgaGFuZGxpbmcgaGVyZS4NCj4gKyAg
ICAgICAgICogVGhlIENQVV9EWUlORyBhY3Rpb24gc3BlY2lmaWNhbGx5IGhhbmRsZXMgcmVsZWFz
aW5nIHJlc291cmNlcyBhY3F1aXJlZCBieQ0KPiArICAgICAgICAgKiBpbml0X21haW50ZW5hbmNl
X2ludGVycnVwdCgpLCB3aGVuIHRoZSBDUFUgaXMgYmVpbmcgdGFrZW4gb2ZmbGluZS4gT3RoZXIg
Q1BVDQo+ICsgICAgICAgICAqIGFjdGlvbnMgZG8gbm90IHJlcXVpcmUgR0lDLXNwZWNpZmljIGhh
bmRsaW5nLg0KPiArICAgICAgICAgKi8NCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICB9DQo+
ICAgDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW11L3AybS5jIGIveGVuL2FyY2gvYXJt
L21tdS9wMm0uYw0KPiBpbmRleCA1MWFiZjM1MDRmLi5kMWYwYWUwMjI2IDEwMDY0NA0KPiAtLS0g
YS94ZW4vYXJjaC9hcm0vbW11L3AybS5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbXUvcDJtLmMN
Cj4gQEAgLTE4MjgsNiArMTgyOCwxMiBAQCBzdGF0aWMgaW50IGNwdV92aXJ0X3BhZ2luZ19jYWxs
YmFjayhzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5mYiwNCj4gICAgICAgICAgIHNldHVwX3ZpcnRf
cGFnaW5nX29uZShOVUxMKTsNCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICBkZWZhdWx0Og0K
PiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBEZWZhdWx0IGNhc2UgbGVmdCBlbXB0eSBhcyBv
dGhlciBub3RpZmllciBhY3Rpb25zIGRvIG5vdCByZXF1aXJlIGhhbmRsaW5nIGhlcmUuDQo+ICsg
ICAgICAgICAqIFRoZSBDUFVfU1RBUlRJTkcgYWN0aW9uIGlzIHNwZWNpZmljYWxseSBoYW5kbGVk
IGJlY2F1c2UgdGhpcyBmdW5jdGlvbiBzZXRzIHVwDQo+ICsgICAgICAgICAqIHZpcnR1YWwgcGFn
aW5nIGZvciBDUFVzLCBwYXJ0aWN1bGFybHkgZm9yIG5vbi1ib290IENQVXMgZHVyaW5nIGhvdHBs
dWcuIE90aGVyDQo+ICsgICAgICAgICAqIGFjdGlvbnMgZG8gbm90IGludm9sdmUgdmlydHVhbCBw
YWdpbmcgc2V0dXAuDQo+ICsgICAgICAgICAqLw0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAg
IH0NCj4gICANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90aW1lLmMgYi94ZW4vYXJjaC9h
cm0vdGltZS5jDQo+IGluZGV4IGU3NGQzMGQyNTguLjQ3NzYxMTBkOTcgMTAwNjQ0DQo+IC0tLSBh
L3hlbi9hcmNoL2FybS90aW1lLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL3RpbWUuYw0KPiBAQCAt
MzgyLDYgKzM4MiwxMiBAQCBzdGF0aWMgaW50IGNwdV90aW1lX2NhbGxiYWNrKHN0cnVjdCBub3Rp
Zmllcl9ibG9jayAqbmZiLA0KPiAgICAgICAgICAgZGVpbml0X3RpbWVyX2ludGVycnVwdCgpOw0K
PiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIGRlZmF1bHQ6DQo+ICsgICAgICAgIC8qDQo+ICsg
ICAgICAgICAqIERlZmF1bHQgY2FzZSBsZWZ0IGVtcHR5IGFzIG90aGVyIG5vdGlmaWVyIGFjdGlv
bnMgZG8gbm90IHJlcXVpcmUgaGFuZGxpbmcgaGVyZS4NCj4gKyAgICAgICAgICogVGhlIENQVV9E
WUlORyBhY3Rpb24gaXMgc3BlY2lmaWNhbGx5IGhhbmRsZWQgdG8gcmV2ZXJ0IGFjdGlvbnMgZG9u
ZSBpbg0KPiArICAgICAgICAgKiBpbml0X3RpbWVyX2ludGVycnVwdCgpIGFuZCBwcm9wZXJseSBk
aXNhYmxlIHRpbWVyIGludGVycnVwdHMgb24gdGhlIENQVSBiZWluZw0KPiArICAgICAgICAgKiB0
YWtlbiBvZmZsaW5lLiBPdGhlciBhY3Rpb25zIGRvIG5vdCBpbnZvbHZlIHRpbWVyIGRlaW5pdGlh
bGl6YXRpb24uDQo+ICsgICAgICAgICAqLw0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIH0N
Cj4gICANCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24va2V4ZWMuYyBiL3hlbi9jb21tb24va2V4
ZWMuYw0KPiBpbmRleCA4NGZlOGMzNTk3Li4wZjc4MDg3YTRhIDEwMDY0NA0KPiAtLS0gYS94ZW4v
Y29tbW9uL2tleGVjLmMNCj4gKysrIGIveGVuL2NvbW1vbi9rZXhlYy5jDQo+IEBAIC01NDksNiAr
NTQ5LDEyIEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgY3B1X2NhbGxiYWNrKA0KPiAgICAgICAgICAg
a2V4ZWNfaW5pdF9jcHVfbm90ZXMoY3B1KTsNCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICBk
ZWZhdWx0Og0KPiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBEZWZhdWx0IGNhc2UgbGVmdCBl
bXB0eSBhcyBvdGhlciBub3RpZmllciBhY3Rpb25zIGRvIG5vdCByZXF1aXJlIGhhbmRsaW5nIGhl
cmUuDQo+ICsgICAgICAgICAqIFRoZSBDUFVfVVBfUFJFUEFSRSBhY3Rpb24gaXMgc3BlY2lmaWNh
bGx5IGhhbmRsZWQgdG8gYWxsb2NhdGUgY3Jhc2ggbm90ZSBidWZmZXJzDQo+ICsgICAgICAgICAq
IGZvciBhIG5ld2x5IG9ubGluZWQgQ1BVLiBPdGhlciBhY3Rpb25zIGRvIG5vdCBwZXJ0YWluIHRv
IGNyYXNoIG5vdGUgYWxsb2NhdGlvbg0KPiArICAgICAgICAgKiBvciBtZW1vcnkgcHJlc2VydmF0
aW9uIGZvciBrZXhlYy4NCj4gKyAgICAgICAgICovDQo+ICAgICAgICAgICBicmVhazsNCj4gICAg
ICAgfQ0KPiAgICAgICByZXR1cm4gTk9USUZZX0RPTkU7DQoNCk15IGFwb2xvZ2llcywgZm9yZ290
IHRvIGluY2x1ZGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBsaW5rOg0KaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9YZW4vNzI1ZWM4NmFjMWFhODgzYzM1ZmIzMGI4ZjIyNmM5NWNiZTA5MzRlOS4xNzU0MzIyMjk5
LmdpdC5kbXl0cm8uXzVGcHJva29wY2h1azFAZXBhbS5jb20vDQoNCkRteXRybw==

