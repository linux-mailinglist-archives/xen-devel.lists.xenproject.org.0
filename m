Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C90CB88F3
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 11:02:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185290.1507515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTzy7-0007c3-QK; Fri, 12 Dec 2025 10:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185290.1507515; Fri, 12 Dec 2025 10:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTzy7-0007ZR-NK; Fri, 12 Dec 2025 10:01:47 +0000
Received: by outflank-mailman (input) for mailman id 1185290;
 Fri, 12 Dec 2025 10:01:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lELV=6S=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vTzy6-0007ZL-Hw
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 10:01:46 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f95a131-d741-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 11:01:43 +0100 (CET)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DB5PR03MB10097.eurprd03.prod.outlook.com
 (2603:10a6:10:4a7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 10:01:39 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:01:39 +0000
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
X-Inumbo-ID: 8f95a131-d741-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yIJVfLFIGCnObSVbjndoEKpPEyIpSkaWEG4rtepdiGu9nzss7DtD0D/O/W6wt2SqrOlw7RjyCcrYPj7Wuf1stN97tcVP/PJIR+NA85Pwu8u6uvQRRzviQv8I7LALkQwFx1WTjMA2Knc+d5Rxf8KvDUqFVdrZz3mhIRi+dmuIMJy/Q7GDL5OOEBGPfmq/N30EeK2MZaH/jrWURoIX9V7wzPEvKUg9jLK/Onc/S0dvt2Jpi4A2BJyDQnz4Sg0osXlufPH8Xij9QTvL2rsT8a9nbB14mUuTH5CRxz3RaKvgSHsG52Now3HZKE/+dGOP22+NfSIS7/cpIDGm5GjyARBnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPuWIy/T7UiUAJC/3wAm/ckHpnwrVOgpYzB70m31Vh0=;
 b=XVsZT657sO/km6nTf90xlkaUL/TuXH0jWvkI10rdvHyy7MoLBcQENAVJy9rmIrBU50Y1VoJzqahA2dx7CkWGJmsGpp2Kpnndx170+rKkhtCKzOChJ8W7Cb5u2O2pfxzFvImAtE5k5CZkayECxeRsXNfGamWONcAuD8HmVWCeTzHAMFR51xMurGzMxizNNy4cQixjK7TpnAy8f7j3rhGcR2wCDvVtfa6fto4w81vauUHtz9zx4AK1GzsWmFq14Z6CXDqgzuMzQxHnHrKV5blccglxbXCB3mdxF3FBggQnqt5pVKbeew7uU8YUIWWfDY0Xjfw+X5ZsyeaJdpqhjpkC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPuWIy/T7UiUAJC/3wAm/ckHpnwrVOgpYzB70m31Vh0=;
 b=kLYln+qOQIG6qWme2JT5sASEcdzHrTQpzogdcuY0clfrQYf0uFEfkyd3qMlNncpHAcq2TtxO4m5VODVZNOw2N8ASRmewpeyTSy5iFFDic1a0p1E8FkQHtsAKOrJoUnBjDqnBWOlsNgNh1ryTXnD2nC877vJHOLN3SFkTUVxpF2JNGkfHcEF2XWYyaIEpHoZ4sb3zFw/TYPnVQ14ZiuekBPJnx8z7hUFiexylXuE4+IGlLpGzgX/lKD3cLGabYiUkg3CkktrvZARVdijDqO7YeETdePFAfglgPI1P7Jtnn1LAaTKNGWoCwADArs1r4LfaKGXI+9cPWwOXIfloM/jgog==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/8] arm/irq: Migrate IRQs from dyings CPUs
Thread-Topic: [PATCH v4 4/8] arm/irq: Migrate IRQs from dyings CPUs
Thread-Index: AQHcU8JYvjT2yDm5JUiekiWBeQTl27T1L7qAgCjFXQA=
Date: Fri, 12 Dec 2025 10:01:39 +0000
Message-ID: <5569161c-2edc-4409-901d-d65493f12496@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <6371ac96102f48b55ffd884656770187ed3a7f84.1762939773.git.mykyta_poturai@epam.com>
 <8099d0ed-74bd-4c98-9441-296daf76c41e@xen.org>
In-Reply-To: <8099d0ed-74bd-4c98-9441-296daf76c41e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DB5PR03MB10097:EE_
x-ms-office365-filtering-correlation-id: 3872cc3d-d264-4f3f-0e51-08de39657193
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cWYvWGVxWDRzMGMxTmRuU1pFVElhblozUFFmUnFTejV3SEdrSWN0U0NuQ0NV?=
 =?utf-8?B?bDBRSndqc1pqbGs4ajg1VDNZY1A1N2IxeE5KNUFtS3ZpQzR3cE1pTXVNRlhl?=
 =?utf-8?B?WC80Uy9xcllFRTBzNFpjOGp6cTVnUTBDUzNWcHpvTUtadDVXdEpFWXo1RUlC?=
 =?utf-8?B?MHhXckdlOXN2eGJObmJVWmgwOVpRRndyS3NTZTJjV3ZQMWdyMGJKRE5UV24z?=
 =?utf-8?B?c2tLYTVpdjZLSEJSaDJnQ0pnNWE4ZnAvSFhXMmllVFVLOHUzRjd6eVdoVHhF?=
 =?utf-8?B?eUxyT0tMSFQyVG5rU0pjd2ZlTXdnTktSQkZJNmxxKzBTR1FDSmdCTFROc2Jn?=
 =?utf-8?B?elZaSmJpazk1V1Jaa1dObitkM1RDcGVoZWNaK25QSzJlV2tYVmJYN21MVk1l?=
 =?utf-8?B?UW01aHRmMW9PWjhEUzJSK21yaU50T2xqcWhTakF4SGRqbjhWZ1pEM0l6dGlM?=
 =?utf-8?B?bG80OGZhK2tOVkIyd0pNcGxqdS9pVEYrRU9OQ3pZLzY1STZldDZJNndIb0xh?=
 =?utf-8?B?VWpNVnRpSjZxRm9QbkxCZ0RmZlBYdm81Z1N4RUIrdUlLM1NwMTg2eEEwend6?=
 =?utf-8?B?LzBkeXcvNTJqdDJFYlJtTzdNSml3NTMzeEpYUkhDVHhOcjJJT3RhQzhvcFZV?=
 =?utf-8?B?MERzVEtOcFZ4L293VmlNdHlSOGdZRjRnV05FeU00Z05qZFQ4MlMwYjUrK0ls?=
 =?utf-8?B?b3d0TWcwVWI0UVJMVng2bzU1cFI2NHY4c2xpREtUVEdJOHNwV1FIeTlqYTlt?=
 =?utf-8?B?V0doTExTY1JBZG5oR0k1Mzk2VlhWVnhMaklvMzlVSTl4anFINDFOZHlZb0FR?=
 =?utf-8?B?RGZuT0JLcysrQ0Y3TDNvaytadjhMVy84RmFZTHJkUFBGQmlObVF3NGx6KzMz?=
 =?utf-8?B?SjIrR2NrTmsvNzVqQkNpdUVYZ2tIc3BYTWF0Z1B0d2NmRmYvRzlsUk5XM3NC?=
 =?utf-8?B?M0NPOERma1ZsdEgrbldmOFYycmhGMndzWm01SXR6dm84UEtTallmbjZHZ0sv?=
 =?utf-8?B?RmJESkxNNi9seHNvemxqU3lraEh3c3NDbDQ1eEJqTE0yZU1RUXB1Rk5GeXM5?=
 =?utf-8?B?VnA0K2V0N2NjOWxJVGE4Ni9OdkdvQmJ6SWl4MDRRUXQ1K1BUbDRMWnhXZThr?=
 =?utf-8?B?bTN2anlyWm42OU1KcUVYeFBRK1BSdXloN1EwRjUvZHJPVGkzZEJiYmVha1ZI?=
 =?utf-8?B?T29OREYydmpSdlhLSGducTBrUkhqSGtxU0xEaUlVazduMHQyMUk4cXAvSWo4?=
 =?utf-8?B?WlUxUVYwenZsVVNGSmZjMW9lWDlNMFUwZngzZ0srL2RHQVRKSmxKMVNxMm9n?=
 =?utf-8?B?RmZLU2xwQ2tVSFM3MUVIc0FkOGVqby82OEcvMlNBUkhIZ1pJTFhCNGhXRVRZ?=
 =?utf-8?B?bDB1K3d5U3FDVzhPdG9mNy9KR2dqTXRRVDdYNEV3MFd6WEU4M2tWRWtDVVVP?=
 =?utf-8?B?SzIvS2lNV2tOMVY1b0hITEN6THdrUWY3UjFhcVF0RjZGVi8ybjErQytTYmUv?=
 =?utf-8?B?REhWS0piZlErSkx5aWdZTiszVURhQzIrTkpIaWlZVzdnU29HKy9oVHdpODJZ?=
 =?utf-8?B?MTE3QmwrUStUVmQzbTI4S1lLTTdGUmoyc2ozNTkwZXArT3NldXh6MUZqcFBK?=
 =?utf-8?B?UDFVYkQ0Qzl0VjJmUEtjUXBkUmh1dHY1KzZ5TnBQcWV0RlEvNU90R1B4c09i?=
 =?utf-8?B?WkNGVEY4RWxkaWhXY0tIZ0tQTkpITTZFdHF1b0FkVG4vLysrcGtFOUZiRVNQ?=
 =?utf-8?B?UVc3Yjk0cFFXTlhVdlYzZjBPUEYzU09kSkM3V1pwQUpWeW5MbkFkNjQ4NTJP?=
 =?utf-8?B?enV0emFlT1dBa0tOb0YrNG5hVW5pNldGL1JVN3JNZDNiRFVGdU5qMTVuSjU3?=
 =?utf-8?B?bGF1dlpHTU1SUzM3UW1oN1lwQjFWRG9jUFpFRDU4aXFPNnR2aGkrdTVXZnh4?=
 =?utf-8?B?QnQ2ZDBSbG0zMGU5VU1RalhCV3Q2ZzNHNHNnTXZnMWtBOTRJTEc5OUNVQXdS?=
 =?utf-8?B?SkdNemtWUzIzMXl2Y1VsR2h2dlkwYm9lcktKbWt6RnR3VWk0RHVZMkNjd0JM?=
 =?utf-8?Q?IuKjUM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEduUnFHa2pNWHYxVE1peUdiUVRhZTdkeEszSkR1RmVUaFV6MENuYjZyK0Jz?=
 =?utf-8?B?dmVicStoc2t1MXNjM0ZDL2xEamRrUytvS0dsRjFIVkFZODZrQUMwcVdTV3ox?=
 =?utf-8?B?VFNtczJ1NWM5RHJFNE9MdUxWUGkyUHk0NytLMC9naXdLc2h5WjBDYnU0ZmNn?=
 =?utf-8?B?VDJveEh5eXdFekpOMFgxQnJNaDgwUjVyd2lrUjladFpYaW9IdTFhNldYRkFI?=
 =?utf-8?B?QldFUGhQcDFvRGErWjRiUHdNNVFvN3BmYkpxQVdzOWN1eUltMkhRU2N4S1Iw?=
 =?utf-8?B?MXducCtsUi9HRHpJNTBDSTBWZVFtWDIvTXJUTFh6cE1qYVhRSUJqeXg5b3Bx?=
 =?utf-8?B?ZGg3dm00MjlVcjVzRFZjdmJCa3MvaUtzMTF0cDdGRUNkZVVDT2U0MTBIbzFO?=
 =?utf-8?B?S1pkR2VhdnFPRjRLVnN5YlY2TmFrMTlHQkViUXBaWkovQU9tOEh2bzVGRWx6?=
 =?utf-8?B?dXFBYllWVEdsYW9rUFV3WVJZOUZaM0pPU2dGTnFWMWowbmE5RUpWZEcwL3Qv?=
 =?utf-8?B?ZlJ4b3VnYjRNd29JVDZRWE5Ja1JxQUtQd211NVltR1ppS0FPRHAvYk1uc0N2?=
 =?utf-8?B?ZGpuZEwvM3EwVTJsSFEzWVozUVZDZkZZNHovSUZJQ1lONzMxM1JGa3VJM0ZE?=
 =?utf-8?B?aFQ4aG5KTlJ6d2ptb25PUFU4TDhBSkgxWmdPS2pqWGFtSmd5bUhkRTZRdkZ3?=
 =?utf-8?B?Um10ZzlydmlqelduYzZLVmFEYmU2NGFvKytIT2tSZWEweUNzdFdHMS9pVGRm?=
 =?utf-8?B?L0oyTUc5eWFTR3RDZlQ4VXpKSFZyK3RIUEZKdC9LR3JsOS9hYXFoRG1saXl1?=
 =?utf-8?B?Yy9TZno5ZzEzRHZucXVaS0kwcUxHWTRlbXdYT0w4R3FHdm1HSlNCN0ZGZlVN?=
 =?utf-8?B?MlVmbndRQ3I4cTNpcE5ZQVQrVFVEV1k2bzZWbzdxR0F6bUs5bTIySm9EdmFz?=
 =?utf-8?B?QVRjc0hnc1hyTGVmLzlPR0NOb0ErVk1pZ3ptekYwTjVoZ3Flem9zQys2QXdW?=
 =?utf-8?B?Zzc4dnVEKzI2bVpRYVRWRU9tL3JtNzNkcmZBTWVwVzJiQUIwZktNZzRwNTJO?=
 =?utf-8?B?ZmpKZ2dkbWhrUUU5dzVCZHpiZDVPQmliU3BwK2ZmUE1yYWFveDNXc3Nmb0kr?=
 =?utf-8?B?ZEh1MkFUaDhNZTZiZU9WZkRJaFdKeDJHOFJONG1RWXRzNWJCckhneWJDSGEy?=
 =?utf-8?B?L250Z3dtdEo1QmIxQVNpRStlcDFPLzd5cDhXL1R5MU1BRVhueGtocGVrM1FY?=
 =?utf-8?B?MjhacWxoK2RncUpjYjE4aEI2SXFmMGtGc3BCeWVabVF5cjYrM2p2dysyTkVC?=
 =?utf-8?B?L29oUzQ1bmtLSjgzN0ZDUDlvS3hnaisxS2NRMGoxSDk0UnhBRFQybU9JOUdQ?=
 =?utf-8?B?MFBPQ3pETkdMQzdacUp0c1lQbDAyWDVkcjgrRTBKS050RlR0SmhTM0ZnWHJj?=
 =?utf-8?B?MTVDVjB5cmhnY0ZuVVRqUmE0UWVLOEJYWEE3Z3dwcUF2SlhlZlpUZDBCRVBz?=
 =?utf-8?B?bndtZnRYTzFlazF1NHNybXFRaE5LeTNJT292VEJ4UE82Y3EvempEMGxzaVNa?=
 =?utf-8?B?L3Zsd2xWelA5OVgyTytubWtydTRseU1MTlpEaERCWFF1QW1qeFowMFVybnZp?=
 =?utf-8?B?amFTK1JZWUN1WlczYW5aY1FUVG93K2c2eDdJUndUR2VYVE5EVGQ1VjlhNWE3?=
 =?utf-8?B?UTVlYnBrWmJMU29BdXFWbTF5TjUwUXorWDcrZDdsckttbW5YSkhxdHRkeTZi?=
 =?utf-8?B?Ly9ETU1obmhlY3ZhUE1ESTJqNnNEYWY4SmdHakdZUnNiZEJGMHVaMXlBVDBP?=
 =?utf-8?B?TmZkNys2SjFDRnRUbkN6TUQyN1cvY2JZWG5oN2djNkZpdFRXL1BDRG81a1g5?=
 =?utf-8?B?V0g5MElVTGVCUVkyQjY1VnNTSVFSaDVjN3lBNWwraTAzVDB5Vks0RnZiSjl6?=
 =?utf-8?B?L2NhRDJmemxHK2FiSHFFK1JPMUpIdHpHOEM1dklyNGV4TmRMWW5zSFAycTRh?=
 =?utf-8?B?d3RyV0RWRWUvVzMwRkZVTEFVYzQrSHFxUjVmVzNZSjV6NkpMT1phWHZsUjM2?=
 =?utf-8?B?VjFMQ0hWS3JOVTRsUDV0MUhibTBpRjM4aC94L3RwdnJYZHJSSUVyUWdwQ2k0?=
 =?utf-8?B?QXA3NmRBVkZKdmNIeXVOOHY2Yk8xRjMrWTUxZjJSbVB2S3h6TGJubDk4allS?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE22B0E72ABA99489FE6F6F9E5EDBDD0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3872cc3d-d264-4f3f-0e51-08de39657193
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 10:01:39.2790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9mfsmIBbL9BlhNdMsJDDAbMT+OxIeEVExCU9+P14sseMqPByVgcHzMBLUDT/zn1sPveL/Ctd8KsWmCx4i1g32g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB10097

T24gMTYuMTEuMjUgMTM6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBPbiAx
Mi8xMS8yMDI1IDEwOjUxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE1vdmUgSVJRcyBmcm9t
IGR5aW5nIENQVSB0byB0aGUgb25saW5lIG9uZXMuDQo+PiBHdWVzdC1ib3VuZCBJUlFzIGFyZSBh
bHJlYWR5IGhhbmRsZWQgYnkgc2NoZWR1bGVyIGluIHRoZSBwcm9jZXNzIG9mDQo+PiBtb3Zpbmcg
dkNQVXMgdG8gYWN0aXZlIHBDUFVzLCBzbyB3ZSBvbmx5IG5lZWQgdG8gaGFuZGxlIElSUXMgdXNl
ZCBieSBYZW4NCj4+IGl0c2VsZi4NCj4+DQo+PiBJZiBJUlEgaXMgdG8gYmUgbWlncmF0ZWQsIGl0
J3MgYWZmaW5pdHkgaXMgc2V0IHRvIGEgbWFzayBvZiBhbGwgb25saW5lDQo+PiBDUFVzLiBXaXRo
IGN1cnJlbnQgR0lDIGltcGxlbWVudGF0aW9uLCB0aGlzIG1lYW5zIHRoZXkgYXJlIHJvdXRlZCB0
byBhDQo+PiByYW5kb20gb25saW5lIENQVS4gVGhpcyBtYXkgY2F1c2UgZXh0cmEgbW92ZXMgaWYg
bXVsdGlwbGUgY29yZXMgYXJlDQo+PiBkaXNhYmxlZCBpbiBzZXF1ZW5jZSwgYnV0IHNob3VsZCBw
cmV2ZW50IGFsbCBpbnRlcnJ1cHRzIGZyb20gcGlsaW5nIHVwDQo+PiBvbiBDUFUwIGluIGNhc2Ug
b2YgcmVwZWF0ZWQgdXAtZG93biBjeWNsZXMgb24gZGlmZmVyZW50IGNvcmVzLg0KPiANCj4gV291
bGRuJ3QgdGhleSBldmVudHVhbGx5IGFsbCBtb3ZlIHRvIENQVTAgaW4gdGhlIGNhc2Ugb2Ygc3Vz
cGVuZC9yZXN1bWUgDQo+IG9yIGlmIGFsbCB0aGUgQ1BVcyBidXQgQ1BVMCBhcmUgdHVybmVkIG9m
ZiBhbmQgdGhlbiBvZmY/IElmIHNvLCANCj4gc2hvdWxkbid0IHdlIHRyeSB0byByZWJhbGFuY2Ug
dGhlIGludGVycnVwdHM/DQo+IA0KDQpJbiBjYXNlIG9mIGRpc2FibGluZy9lbmFibGluZyBhbGwg
Y29yZXMgaW4gYSBzZXF1ZW5jZSwgeWVzLiBUaGlzIHdhcyANCmRlc2lnbmVkIHdpdGggdGhlIGlk
ZWEgb2YgYWNoaWV2aW5nIHNvbWUgYmFsYW5jaW5nIHdoZW4gDQplbmFibGluZy9kaXNhYmxpbmcg
c29tZSBjb3JlcyBmb3IgcG93ZXIgc2F2aW5nIHJlYXNvbnMuIEkgYWdyZWUgdGhhdCANCnByb3Bl
ciBiYWxhbmNpbmcgc2hvdWxkIGJlIGltcGxlbWVudGVkLCBidXQgaXQgaXMgYSBjb21wbGV4IHRh
c2sgb24gaXRzIA0Kb3duIGFuZCByZXF1aXJlcyBhIHN1YnN0YW50aWFsIGFtb3VudCBvZiB0ZXN0
aW5nIG9uIGRpZmZlcmVudCBoYXJkd2FyZSANCnRvIHByb3ZlIGl0IGlzIGNsb3NlIHRvIG9wdGlt
YWwuIFNvIEkgdGhpbmsgaW1wbGVtZW50aW5nIGl0IGlzIG91dCBvZiANCnNjb3BlIGZvciB3aGF0
IEnigJltIHRyeWluZyB0byBkbyBoZXJlLg0KDQpJZiB0aGlzIHdvdWxkIGJlIG9rYXksIEkgY2Fu
IGltcGxlbWVudCBhIHJlbGF0aXZlbHkgc2ltcGxlIHNvbHV0aW9uIG9mIA0KanVzdCBhZGRpbmcg
b25saW5lZCBDUFVzIGJhY2sgdG8gdGhlIGFmZmluaXR5IG1hc2sgZm9yIG5vdy4gSSB0aGluayBp
dCANCnNob3VsZCBpbXByb3ZlIHRoZSBzaXR1YXRpb24gZm9yIHRoZSDigJxzd2l0Y2hpbmcgYWxs
IGNvcmVz4oCdIGNhc2UuDQoNCj4+DQo+PiBJUlFzIGZyb20gQ1BVIDAgYXJlIG5ldmVyIG1pZ3Jh
dGVkLCBhcyBkeWluZyBDUFUgMCBtZWFucyB3ZSBhcmUgZWl0aGVyDQo+PiBzaHV0dGluZyBkb3du
IGNvbXBlbGV0ZWx5IG9yIGVudGVyaW5nIHN5c3RlbSBzdXNwZW5kLg0KPiANCj4gSSBjYW4ndCBm
aW5kIGEgcGxhY2Ugd2hlcmUgX19jcHVfZGlzYWJsZSgpIGlzIGNhbGxlZCBvbiBDUFUwLiBEbyB5
b3UgDQo+IGhhdmUgYW55IHBvaW50ZXI/IEluIGFueSBjYXNlLCBJIGFtIG5vdCBzdXJlIEkgd2Fu
dCB0byBiYWtlIHRoYXQgDQo+IGFzc3VtcHRpb24gaW4gbW9yZSBwbGFjZXMgb2YgdGhlIGNvZGUu
DQo+IA0KDQpJIGFzc3VtZSBpdCB3b3VsZCBiZSBjYWxsZWQgd2hlbiBzdXNwZW5kIGlzIGltcGxl
bWVudGVkLiBJbiBhbnkgY2FzZSwgSSANCndpbGwgcmV3b3JrIHRoaXMgdG8gcmVwbGFjZSB0aGUg
aGFyZCBjaGVjayBmb3IgQ1BVIDAgd2l0aCB0aGUg4oCcaXMgaXQgdGhlIA0KbGFzdCBDUFUgb25s
aW5l4oCdIG9uZS4NCg0KPj4NCj4+IENvbnNpZGVyaW5nIHRoYXQgYWxsIFhlbi11c2VkIElSUXMg
YXJlIGN1cnJlbnRseSBhbGxvY2F0ZWQgZHVyaW5nIGluaXQNCj4+IG9uIENQVSAwLCBhbmQgc2V0
dXBfaXJxIHVzZXMgc21wX3Byb2Nlc3Nvcl9pZCBmb3IgdGhlIGluaXRpYWwgYWZmaW5pdHkuDQo+
IA0KPiBMb29raW5nIGF0IHRoZSBTTU1VIGRyaXZlciwgd2Ugc2VlbXMgdG8gcmVxdWVzdCBJUlFz
IGF0IHRoZSB0aW1lIHRoZSANCj4gZGV2aWNlIGlzIGF0dGFjaGVkLiBTbyBhcmUgeW91IHN1cmUg
YWJvdXQgdGhpcz8NCj4gDQoNCkluZGVlZCwgSSBoYXZlIG1pc3NlZCB0aGF0IG9uZS4gSSB3aWxs
IHJlbW92ZSB0aG9zZSBzdGF0ZW1lbnRzIHRoZW4uDQoNCj4+IFRoaXMgY2hhbmdlIGlzIG5vdCBz
dHJpY3RseSByZXF1aXJlZCBmb3IgY29ycmVjdCBvcGVyYXRpb24gZm9yIG5vdywgYnV0DQo+PiBp
dCBzaG91bGQgZnV0dXJlLXByb29mIGNwdSBob3RwbHVnIGFuZCBzeXN0ZW0gc3VzcGVuZCBzdXBw
b3J0IGluIGNhc2UNCj4+IHNvbWUga2luZCBpZiBJUlEgYmFsYW5jaW5nIGlzIGltcGxlbWVudGVk
IGxhdGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFpIDxteWt5dGFfcG90
dXJhaUBlcGFtLmNvbT4NCj4+DQo+PiB2My0+djQ6DQo+PiAqIHBhdGNoIGludHJvZHVjZWQNCj4+
IC0tLQ0KPj4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaXJxLmggfCAgMiArKw0KPj4gICB4
ZW4vYXJjaC9hcm0vaXJxLmMgICAgICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgIHhlbi9hcmNoL2FybS9zbXBib290LmMgICAgICAgICB8ICAyICsr
DQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaXJxLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS8gDQo+PiBhc20vaXJxLmgNCj4+IGluZGV4IDA5Nzg4ZGJmZWIuLjZlNmUyN2JiODAgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaXJxLmgNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9pcnEuaA0KPj4gQEAgLTEyNiw2ICsxMjYsOCBAQCBib29sIGly
cV90eXBlX3NldF9ieV9kb21haW4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCk7DQo+PiAgIHZvaWQg
aXJxX2VuZF9ub25lKHN0cnVjdCBpcnFfZGVzYyAqaXJxKTsNCj4+ICAgI2RlZmluZSBpcnFfZW5k
X25vbmUgaXJxX2VuZF9ub25lDQo+PiArdm9pZCBldmFjdWF0ZV9pcnFzKHVuc2lnbmVkIGludCBm
cm9tKTsNCj4+ICsNCj4+ICAgI2VuZGlmIC8qIF9BU01fSFdfSVJRX0ggKi8NCj4+ICAgLyoNCj4+
ICAgICogTG9jYWwgdmFyaWFibGVzOg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEu
YyBiL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4gaW5kZXggMjhiNDAzMzFmNy4uYjM4M2Q3MTkzMCAx
MDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJt
L2lycS5jDQo+PiBAQCAtMTU4LDYgKzE1OCw0NSBAQCBzdGF0aWMgaW50IGluaXRfbG9jYWxfaXJx
X2RhdGEodW5zaWduZWQgaW50IGNwdSkNCj4+ICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+PiAr
c3RhdGljIHZvaWQgZXZhY3VhdGVfaXJxKGludCBpcnEsIHVuc2lnbmVkIGludCBmcm9tKQ0KPiAN
Cj4gQW55IHJlYXNvbiB3aHkgdGhlICdpcnEnIGlzIHNpZ25lZD8NCj4gDQo+PiArew0KPj4gKyAg
ICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhpcnEpOw0KPj4gKyAgICB1bnNp
Z25lZCBsb25nIGZsYWdzOw0KPj4gKw0KPj4gKyAgICAvKiBEb24ndCBtb3ZlIGlycXMgZnJvbSBD
UFUgMCBhcyBpdCBpcyBhbHdheXMgbGFzdCB0byBiZSBkaXNhYmxlZCAqLw0KPiANCj4gUGVyIGFi
b3ZlLCBJIGFtIG5vdCBjb252aW5jZWQgdGhhdCB3ZSBzaG91bGQgc3BlY2lhbCBjYXNlIENQVSAw
LiBCdXQgaWYgDQo+IHdlIGRvLCB0aGVuIHNob3VsZG4ndCB0aGlzIGJlIHBhcnQgb2YgZXZhY3Vh
dGVfaXJxcygpIHNvIHdlIGRvbid0IA0KPiBwb2ludGxlc3NseSBnbyB0aHJvdWdoIGFsbCB0aGUg
SVJRcz8NCj4gDQo+PiArICAgIGlmICggZnJvbSA9PSAwICkNCj4+ICsgICAgICAgIHJldHVybjsN
Cj4+ICsNCj4+ICsgICAgQVNTRVJUKCFjcHVtYXNrX2VtcHR5KCZjcHVfb25saW5lX21hcCkpOw0K
Pj4gKyAgICBBU1NFUlQoIWNwdW1hc2tfdGVzdF9jcHUoZnJvbSwgJmNwdV9vbmxpbmVfbWFwKSk7
DQo+PiArDQo+PiArICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkZXNjLT5sb2NrLCBmbGFncyk7DQo+
PiArICAgIGlmICggbGlrZWx5KCFkZXNjLT5hY3Rpb24pICkNCj4+ICsgICAgICAgIGdvdG8gb3V0
Ow0KPj4gKw0KPj4gKyAgICBpZiAoIGxpa2VseSh0ZXN0X2JpdChfSVJRX0dVRVNULCAmZGVzYy0+
c3RhdHVzKSB8fA0KPj4gKyAgICAgICAgICAgICAgICB0ZXN0X2JpdChfSVJRX01PVkVfUEVORElO
RywgJmRlc2MtPnN0YXR1cykpICkNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gKw0KPj4gKyAg
ICBpZiAoIGNwdW1hc2tfdGVzdF9jcHUoZnJvbSwgZGVzYy0+YWZmaW5pdHkpICkNCj4+ICsgICAg
ICAgIGlycV9zZXRfYWZmaW5pdHkoZGVzYywgJmNwdV9vbmxpbmVfbWFwKTsNCj4gDQo+IEkgdGhp
bmsgaXQgd291bGQgYmUgd29ydGggZXhwbGFpbmluZyB3aHkgd2UgYXJlIHJvdXRpbmcgdG8gYW55
IENQVSANCj4gb25saW5lIHJhdGhlciB0aGFuIGNoZWNraW5nIHdoZXRoZXIgdGhlIGFmZmluaXR5
IGhhcyBvdGhlciBvbmxpbmUgQ1BVcy4NCj4gDQo+IEp1c3QgdG8gbm90ZSwgSSBkb24ndCBoYXZl
IHN0cm9uZyBvcGluaW9uIGVpdGhlciB3YXkuIEl0IG1haW5seSBuZWVkcyB0byANCj4gYmUgZG9j
dW1lbnRlZC4NCj4gDQo+PiArDQo+PiArb3V0Og0KPj4gKyAgICBzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZkZXNjLT5sb2NrLCBmbGFncyk7DQo+PiArICAgIHJldHVybjsNCj4+ICt9DQo+PiArDQo+
PiArdm9pZCBldmFjdWF0ZV9pcnFzKHVuc2lnbmVkIGludCBmcm9tKQ0KPj4gK3sNCj4+ICsgICAg
aW50IGlycTsNCj4gID4gKz4gKyAgICBmb3IgKCBpcnEgPSBOUl9MT0NBTF9JUlFTOyBpcnEgPCBO
Ul9JUlFTOyBpcnErKyApDQo+PiArICAgICAgICBldmFjdWF0ZV9pcnEoaXJxLCBmcm9tKTsNCj4+
ICsNCj4+ICsgICAgZm9yICggaXJxID0gRVNQSV9CQVNFX0lOVElEOyBpcnEgPCBFU1BJX01BWF9J
TlRJRDsgaXJxKysgKQ0KPiANCj4gQUZBSUNULCBpcnFfdG9fZGVzYygpIHdvdWxkIG5vdCBiZSBh
YmxlIHRvIGNvcGUgd2l0aCBFU1BJIGludGVycnVwdHMgDQo+IHdoZW4gQ09ORklHX0dJQ1YzX0VT
UEkgaXMgbm90IHNldC4gSGFzIHRoaXMgYmVlbiB0ZXN0ZWQ/DQo+IA0KPj4gKyAgICAgICAgZXZh
Y3VhdGVfaXJxKGlycSwgZnJvbSk7DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgaW50IGNwdV9j
YWxsYmFjayhzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5mYiwgdW5zaWduZWQgbG9uZyANCj4+IGFj
dGlvbiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqaGNwdSkNCj4+ICAgew0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zbXBib290LmMgYi94ZW4vYXJjaC9hcm0vc21w
Ym9vdC5jDQo+PiBpbmRleCA3ZjNjZmE4MTJlLi40NmIyNDc4M2RkIDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0K
Pj4gQEAgLTQyNSw2ICs0MjUsOCBAQCB2b2lkIF9fY3B1X2Rpc2FibGUodm9pZCkNCj4+ICAgICAg
IHNtcF9tYigpOw0KPj4gKyAgICBldmFjdWF0ZV9pcnFzKGNwdSk7DQo+IA0KPiBJIHRoaW5rIGl0
IHdvdWxkIGJlIHdvcnRoIGV4cGxhaW5pbmcgd2h5IGV2YWN1YXRlX2lycXMoKSBpcyBjYWxsZWQg
dGhpcyANCj4gbGF0ZSBpbiB0aGUgcHJvY2Vzcy4NCj4gDQo+ICA+ICs+ICAgICAgIC8qIFJldHVy
biB0byBjYWxsZXI7IGV2ZW50dWFsbHkgdGhlIElQSSBtZWNoYW5pc20gd2lsbCANCj4gdW53aW5k
IGFuZCB0aGUNCj4+ICAgICAgICAqIHNjaGVkdWxlciB3aWxsIGRyb3AgdG8gdGhlIGlkbGUgbG9v
cCwgd2hpY2ggd2lsbCBjYWxsIA0KPj4gc3RvcF9jcHUoKS4gKi8NCj4+ICAgfQ0KPiANCj4gQ2hl
ZXJzLA0KPiANCg0KLS0gDQpNeWt5dGE=

