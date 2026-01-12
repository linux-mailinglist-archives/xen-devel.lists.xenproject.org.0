Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52209D1210F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:55:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200060.1516073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFZX-0006Gz-4o; Mon, 12 Jan 2026 10:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200060.1516073; Mon, 12 Jan 2026 10:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFZX-0006F7-1t; Mon, 12 Jan 2026 10:54:55 +0000
Received: by outflank-mailman (input) for mailman id 1200060;
 Mon, 12 Jan 2026 10:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfFZV-0006F1-K0
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:54:53 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e9fa923-efa5-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 11:54:52 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7830.namprd03.prod.outlook.com (2603:10b6:806:42a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:54:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 10:54:48 +0000
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
X-Inumbo-ID: 1e9fa923-efa5-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb/z1CJwoU5WYGzp/oBg4gXF5zY+lHU3uDEMZNE1SrZTOuiOrHjjyAlhz5ZOxiMSLrUffds9mj/7iPju4Ar3nSnO2zxNHBWU8OexvlLhfRWnpPbCI5kUj0TfzlLtV1oYkyCgQUIxLMd7KqjI1xq1TzUFbRxpHrjIF1a8CH+U8kfY+7KsseBKOyqq286YK3blc9yhhweHl6X+NkT0du0tzNjqSTpLJpBrJapDVD+9Eq9Zsp7550SP9Pq6zJZh9yJyleqv6A92eP/FYvUDQpAQG5oJupAxT8/WLOKNWTxe1fePSYUcx/AIHa9HjcgfeOqJBTNrrEpkFtENfgEwVn2xQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F0M4p72c5SHMduF9LQk8+im1xAO5oViXJluA9ACvfA=;
 b=O7rJEACfuhbiJHaFzZypmjYQkKwQGrGaSVUkeotHAfnET9kTKKXVue4un3PeaM6fp4dAsnNQHELUapiS2K2osN6WUS/Ax72ylF2OYddppQj5G4ag9NVK6ledex/q3sqMJLk+R7NwxmRsacbQp/KjAEt2jtag6apuZ3rcsUXHHnmSCQD/bQb0R9lMtLiY9qJnenDIqbLIQMHYHBzXIbjjzO8flJICxL58KMOODikFdaUJM/jTCCzPsw+u0S8mygCOwDsh8Gw0wGiojM8TDG2atfze/UYndtVxaO9ukjtr3YICXHzqriNMgEPfh65M3AatK73USTkTzNmX0oPGWfagLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F0M4p72c5SHMduF9LQk8+im1xAO5oViXJluA9ACvfA=;
 b=KOgYeweUuof13ljpwkyg2tgu2X21n7pcNBd0tCsknVowiTkEtt9eDXURr+rSSqjykTAzkPaZqyOs4GzMXF4vlFjuCc1IDwoCVnneU2KSAQ/ekSB9r9Gy25cEX8YsOkxqduU+rcHO+7j2ENVhis9dQSzmrPJAba1PXZew2DIrWRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2b0b3c25-c504-4e5f-b995-cde41093f560@citrix.com>
Date: Mon, 12 Jan 2026 10:54:45 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Print correct domid in allocate_memory_11
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20260112104233.86482-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260112104233.86482-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0121.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 111884fd-6dea-43fe-3cde-08de51c90160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUhQRUljTDZsMEhLZEJ5eHlPK3Z6Q1p4dXFueGxqSUpncG8yTmxEb0wybUd3?=
 =?utf-8?B?blc0NE40dFh1QzlqUmpnYUJVSk14a0dRYlpEK0Q1aGI2dHVxN2UzdWhRdi9Y?=
 =?utf-8?B?VGVJRjdKYjgrUnlMTmNPNXF1clJrODFnWlRLbkZjVGFBZDdvb3VuWUtrYWN2?=
 =?utf-8?B?V3o1bEVjTEtCR2g3bmJKc1ZYSnV1UHorQTBSMlEvVVZvUFRTTml4b00xRWQ3?=
 =?utf-8?B?a1MydE5BZzZXODVwTFRoMDlsV0tSRExFUTZJYnlHUlVlVnM3dks5ODlXejNn?=
 =?utf-8?B?ZXMzRU1RdHhldnNWbGpCOS85S1dWRzBMcHFUMnYvOG92RURwNW8yUjJLZ2x3?=
 =?utf-8?B?S0J2U3lLZTZ0b1pCcGZxU3RoZ00xbmJpMmlIOUh5enZycndReE5rQ2M5RHNs?=
 =?utf-8?B?QUsxNHRFQ2tURnZaSHhvdkZFZVRxQ1FmUnQxdGpDV1Z6UGhTb3BuL0p3L1hH?=
 =?utf-8?B?bGtKcm9Yd2NuajdJZjFzaVdVTUNiZlFpLzRZSlgvMlcwaVBuTzhucWVOMU10?=
 =?utf-8?B?d0l3TGlBYkxYQllhUXJaWC9LSmRFb3NBMHQwMDZJS0dlRjNMcUNsbzZOTFNF?=
 =?utf-8?B?bGtzU2p3ZkswYWpFZjRLbFR4a2pkdG45eWtxNE0wMHNmdEFVMWVpbVFpVEt1?=
 =?utf-8?B?TndFYTFXeHN3d0lPcXNWK2NnL3lOUnhBWFBNcTlZNHdJUDBPOFFHZFVieFoy?=
 =?utf-8?B?eXVRWGVoRC9mYVBaUDFhWllVSGJmcHRDR096eFE5WURJdjI1RTRqMHpwRW1j?=
 =?utf-8?B?SlJPdDVORmRMeVJjMTd1YjRIT2RsdDJXSnVZalZrNG95cGFxVHlTODA3YzZ5?=
 =?utf-8?B?Yk10WW9ES3hoVFJYTmVUY2tZOHQ4eStEc2M2aG1NaVNZOWxGdjNodCtONXBO?=
 =?utf-8?B?NE1XaDhUVUkzL0FxaUt5S1F2Z0ZreGpMQmhXb1d2SUZ5OVJwSXVrUEJMenhu?=
 =?utf-8?B?akFnNzJmTW9zVGM1YlJOb3VEMnROdG9NbU56UCtPREFSUW5OMS8wTDVzY2Iz?=
 =?utf-8?B?azI0aVAvRk1ybGJSVDNIQXlhTTd2dWpUZ0s4T08zTUVrTXV3RCtWNHBJcmNw?=
 =?utf-8?B?ZDBnRkM4MUZXSjk3cFdPci9zZ3g2bmh5d1JwWDZaMUdrcFE2c015SW9yMW1H?=
 =?utf-8?B?T0pSRDZJVzh6b2xKM1M3YUdSMmtiQUk2ODE4TVIrRFErRVFoYWtlc2hVd0Zo?=
 =?utf-8?B?TWdwRmVJcUZ5NlJEeGpOMXR5Rm5aVjZXaE9zak9PdUk2M05QTmdqZnNsMFEy?=
 =?utf-8?B?NUdJUWdpU1ZEYVVvM2ttcXRRM251eHNncU43QnVnRWFmTldIaktudTl5TlhD?=
 =?utf-8?B?c3dCS1dPeTQ2a3V2cW1RZmRkMzNlLzlOTDJnT2pUY1dwRERRaEtuSzJvYlJJ?=
 =?utf-8?B?OTF0Smo0VGorUHF5RGFIV1NOayszMXJMc3cwTjl6dkthclJwYjRHMEdoK0Fj?=
 =?utf-8?B?WTcvS2pSSkYxZjdRYWtFQ2VMM0xIUG1SbnZhRkE2QU9Icks1eGJOZUd6U1Fi?=
 =?utf-8?B?emFKSmF1TFlaUHdXWEtvcUlhem9tNTZ3bEdiU002TE5QTkpZZHRRZ2w5NVJP?=
 =?utf-8?B?a1Y4cGFQbDZVdEl6L29ZSEtDOFQzZ2dnb3p3amJjVUppQjkzZHZhU2xzaXpJ?=
 =?utf-8?B?RlhIbTBRa1lrRUdWbTA1ZENMYVB1a0hYUzlRb3RubE1jd3UwS3dMOGk3MFJM?=
 =?utf-8?B?T3pvZlYrVFlsUzVScnZEdXRwd3YzSXJqUXVrWVM4WkEvKzJSRm5QU1RuZFhD?=
 =?utf-8?B?VmliRTJTdkxrZlNzdkRIY2hTaTIxeDdNb2NEWisyT085amIvVjV5bnZkWjNO?=
 =?utf-8?B?QithcklXSmR4bmJEbExDeE1MeGhZc1M0eC85OXRpdElPd2Q0NFdacUpSVXI3?=
 =?utf-8?B?K0x0dGpGbXlHUHFURmtwdWVuYzBoYWk2WHFsem1USVU3VEVxTUFlT01GQm9r?=
 =?utf-8?Q?1QY3AHEipvjhdY0pfgvFNOA+T9V7TkNz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVU0ZlNRWmRTMHdkMHVITk4vR29wMWRXYXVCY2VFbTA1V2lKdHNvM204emZi?=
 =?utf-8?B?M3RraENBSkdXemVLUnBCVHVpK1RlbGIzenhOZ1BudHM0ZlJERVIxTFdDNEZL?=
 =?utf-8?B?dllHMjRWbVp4YUhlOEwxRFMzUk43SVlvT3FMS2JyaHNyeTRFaENrV3puWDdn?=
 =?utf-8?B?d0F5eWFYY2xIdEJGcmF4SzBDOXg1T1pYYlBDUWo1elJWNUluaFpPamY1dVZG?=
 =?utf-8?B?ZU03N1JuU0hzMUdnNklFampkZTRERWluRVVpMm5RRk1reHJyd2FmQkpCQkg1?=
 =?utf-8?B?UFpMcG1USDVyNTkyYXFIQ3UwQmZ6aTFzNnljODZpMitKVlhzOGptM1A5UkJD?=
 =?utf-8?B?bDdHdnRTdThRMTlrQ3RFUW5PaTNiS0g2YXZHM0ZhaUI5RHF5eWQ0eE9JOFdD?=
 =?utf-8?B?VXpkZitnVTRndHFCOWJZd3ZveDlKRDB1cEg2bWJNNmFJSDcxSG9XUS9oSGpC?=
 =?utf-8?B?WURIdkUveitXTW1kYlhpeEk3ZGlYdzlpVjZFMmFBR1FUelM2a1h2UEp6RHFi?=
 =?utf-8?B?elo1QU0zdTVrZzB3bW5oSjRwQ1RtSTIwcGhlbW96VXc3SkhZUnBwUGpHakY3?=
 =?utf-8?B?aVB2NUhidnZyUEs4bmVjc2Ztbm9sTlpydmxmMGdVYVR1eEwyY1U4cmRUZENx?=
 =?utf-8?B?ZUY2OTNHWVRIdzJHd1pLWW1NNGpuWnBHdUZPUWpaZ0lRK1FoNUdzNjJHMnVG?=
 =?utf-8?B?QTZVVjJxTFdTTXEvYmtSRmpac0Z2UDBuNVdYaXlndDYzTXAwOHFOVmpPZFdZ?=
 =?utf-8?B?Q1M3WkFEYWh5b0g2ZlNIS2ZjTFNFVDdrSFY5TzNldVNzRHFrdWo0bzV4RStx?=
 =?utf-8?B?TVZ3NWlIUkpFL3NoU21hOFFlcW5GY1QydG00UWh0Q2VGTGo2WVFTYStvNitX?=
 =?utf-8?B?d2ZIMTYwL1Z1TFdVbld2Z3RsUWpZY2dzK3JwbHJOS0pseGZ4OE1BNitIKzVp?=
 =?utf-8?B?NkxvUHhLN2dndFJMakpiVy9iRXg2d3YwaStNeE1KOHdiN0RkYjZNOGk2bzlX?=
 =?utf-8?B?ODh0RmRGZG14ZGlrN010UzlhcWJORjgwZUxlV3JvY29iWHROOUdXeFk2Vjlv?=
 =?utf-8?B?OEFGMFNiNFAzMkxFMnBLOS9nSm50dFkxeTN2MnNkVWdHRWpGNWRDUHpwc2Zu?=
 =?utf-8?B?d1k1OXNYbWFtNXNNRHQrbW0wTWMrQkZsTEVNZ2E2L2E2Z0c3UkdlM2dyZkhE?=
 =?utf-8?B?UEV4VHltWk5MWVZ3OS8ra1d2VGxhU1N4cnBuNktrNzdFR3hVSElKLzIrRUYy?=
 =?utf-8?B?ZmR1bGgrcEFaUUdwaDhjRkRrS0RqZVlFV2ZKcnlSZ3lTanh1aGR3ZWJEUHpF?=
 =?utf-8?B?dWhIWkNGSGwrQWlCRjRzUGl3NUovSDRqdWU1N3paYnJkRUptaFZDaS82dzdH?=
 =?utf-8?B?cXZCNmpKMk1vZ1ZKbGM4WXdBRmVaalRyL2NyU2daNkZuQ0pPbWs3TUZKOFpW?=
 =?utf-8?B?M3NpZThNOW1ka1R2L0xYQm5mVHlmRUEwOW04TzNyTWdlelJXRXRzMWx4cGJ4?=
 =?utf-8?B?OGhOWVZuT3BwWTFFajBIYysrR1l5WCtrdGFNOVpxdld2RDJsRW1FUHNtZTVs?=
 =?utf-8?B?VWZEbUVlazhFZ0VOWUw5RGpIbU82TnpXS09OblJnQlNqUVFIcEVkc2xBb1hD?=
 =?utf-8?B?c3NBTVBXZk1jZmc5R3BZY01pdFRwekRHRVl0WUN4aEhScythVEJCVEtFbFZn?=
 =?utf-8?B?V2FvWi9nZGFjSFNLVVFVSmJ5K29hSFc5WEFWd01jS1lKZDhnMjllUmg0U0ox?=
 =?utf-8?B?YjV1SHNuWDQvTVArMWlkNG9lWkZrNmdrSXBRWGoyMGlZa0RsS2pGRXMxNkxR?=
 =?utf-8?B?VHl5dDMxWno5Zkp3NEFLSlN4VjR5NUJZdlZIQ2Y1b0xrbWJZWmJVc0dUWkVY?=
 =?utf-8?B?UzJJRURoSzRKeXZSS1Mwb3c4Tk9VOVFGeGh2REQ2UHNRd2U3L0pjVnRpdU1h?=
 =?utf-8?B?K3BKaUlleEdSZmcrYy9hZjBJWms5T1d5VTcxdGMrRjVNVnlWVUtpNUdSTkYr?=
 =?utf-8?B?Lzd2Ym1RVFRodTA2emkxZE45VERwUEprZk96TFdjM3FlQWZHU29ZWXkwZ3pq?=
 =?utf-8?B?QmU1N0g5NTBtRDU4YWRjc0NCeEFHVE90Qit5YlV1M1dzdWN4KzY3MjRpRXFk?=
 =?utf-8?B?cXdrMzEvTGIvblk4RXo3L1dHU21BR0NNNGRsa2FsQk9Ta2dqYU5NWEZPR2pw?=
 =?utf-8?B?aVltWTAwY2xOak9qK0FQa0E2Zi8rUFZmSzRwdms5NEh0SmdmS1MwQzBhNGIx?=
 =?utf-8?B?c1EzRERNTTA0ZmRXL0lQYm9zMjRnZ1lLSFFUdmZOUk02RGd3UGdjQjhvOFAr?=
 =?utf-8?B?WDVRRUc0TXgwMWJUSnVzTXY4ejRzMTcwTUE4NndKQUdDb1UzeFkrZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111884fd-6dea-43fe-3cde-08de51c90160
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:54:48.8694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: burHj8mi7X5F84VkQTEZ7T8ermqsisd0UQYJ5/k79fcRbGW75xj7qvjjz1tMMxr3Lx/nOdhoZMiMKGKnnFZm9RuYr+Sb7nuMGIUB8xiHUhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7830

On 12/01/2026 10:42 am, Michal Orzel wrote:
> allocate_memory_11() can be called for dom0 and direct-mapped hwdom
> domU. In the latter scenario, a log message would still mention dom0
> instead of the correct domid.
>
> Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

