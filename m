Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680DEBE8892
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 14:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145167.1478294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9jLS-0000lE-SR; Fri, 17 Oct 2025 12:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145167.1478294; Fri, 17 Oct 2025 12:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9jLS-0000jk-P7; Fri, 17 Oct 2025 12:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1145167;
 Fri, 17 Oct 2025 12:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9jLQ-0000je-Lq
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 12:14:04 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1ab410a-ab52-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 14:13:59 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by LV3PR03MB7381.namprd03.prod.outlook.com (2603:10b6:408:195::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 12:13:53 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 12:13:53 +0000
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
X-Inumbo-ID: c1ab410a-ab52-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysYngEHnL2R/YuXJf/+QCQNYmofcAsDoCMlBpaqFzrCx2J5k7y2t75EG4Cbgeng72Dbfjw6TEeId/bOUuiVPcBYF/mfUnSshfLxUl2EkOrROSPQlym5GKLU3IDpNxo0+aH0ovvAIy158XL+LH/vYz4A5oQrhE/AK9z13x7O1jcAMrOG7cy0gsIj+Tv5bTyeQVKcx+KtPPUK+vMZz/c6ZsLVRe4ryaovm/LMXpmsp6Qy2Pb5GWyVEOniH7D8NG7FqdZHTMmc4JT2DYkzPvzg3BhGUJAjWNGVe4A7JtHruiNBL4kfkITSB7w6QqQJGK/pMEOXSCxJb72lZJICliSbkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqdVnM9UB/NU7VlYk/QtKZ96CjsOV5qDJup6Au8WHGk=;
 b=GnbmSA2r7HhJ/YuB8tchNdO719cmW9+7XlNv728uCtbKrSBmvOPlBJk4Jj5e2jKWCj+G91xpumyyb4rpzqKPMYBQ3awlKUS2MBZt+i+Rid9QsHpLoaX5Xqj+IjQpVx7rk1M4Zw+vhUO9Rxg2gIZkgvaB8ffK3ISebvFy5JQR9M8QuMg021UWlyTeLKS0WYS5J5Seg2mH7IwI97ZdDXK4pBwHk4eoxWpvslekTDjLa1iDMo5VQeoc/crVB3WKuARLlwtm8JunJzZDjMmUVqDPhtDhObJFuVeItYUc5VApt/p+AAwuRdWxuu8Q7dm2tMyurJxluDRVvlZRx3fxh7ZLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqdVnM9UB/NU7VlYk/QtKZ96CjsOV5qDJup6Au8WHGk=;
 b=L+dJ/LnnqoW7vZqbXFfDXBhEevdVJjhe34uVaHVeIM6ZOAx5aA43mteb8u0XGMdJnlX+fhhxW24VmS7SyVncUXajGeE6TUQdfArmwXewCj7nB6UCcBs8vb1mu8ODqmBU2Gl/hLVxgFSSNlPrJR3OKAhYM6Sd72Z869qPMz1esfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Oct 2025 14:13:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 04/10] x86/HPET: ignore "stale" IRQs
Message-ID: <aPIy_ZW8uRu76iFo@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <e16e2b62-9c2b-4534-8279-daf986cf438b@suse.com>
 <aPIKJw6I8pUFngC1@Mac.lan>
 <ace51087-38f3-4cec-bc41-9fe0813ed947@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ace51087-38f3-4cec-bc41-9fe0813ed947@suse.com>
X-ClientProxiedBy: MA2P292CA0019.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::17)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|LV3PR03MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 295bad35-19c3-45c1-0b9c-08de0d76a363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1pNQ2h3MGZZL2RhYmNjMWFpMVBmVWRUOVFZNS8vclVYYXVrMk1oT3lkL2VV?=
 =?utf-8?B?WGpmRmc1eGJnRm12dEI5M0xKMitwUjA0cWJtcFVjRFp3ZWZwSVNFVWJldlZC?=
 =?utf-8?B?MjBVV2dBU0xXdXhEaDR4dFhPVDd6eDdkMU5PUGduakNxdmxKZ2IyRmhYanlP?=
 =?utf-8?B?YXI0K2gxdmg3d3pOdndoUDRoRkVzV0tTNExaM1JISHVOeW8vN2JPWkZEcjJX?=
 =?utf-8?B?ekJNS0JaT095ZEMyU2pMUUVPUTJqRXhFN1cxTXBueFY4L1ZFRVl0b3VvcE9G?=
 =?utf-8?B?WkVzRlc3dGM5SHg4OG5PNG5tVWg2cGhOM2lJUjZKRjBWRlBSQms1b1EyNzY4?=
 =?utf-8?B?b1htRFEwd3RKV2NxRU5xUVU4QWVnVTJPcGZaRXJJOEJjS2pwZ095ZlZENmNn?=
 =?utf-8?B?d2NzdVg3MW9uLytoU1pJdEhKbmQ3R1hFUVZPMkdQeHcxdHV5NmM0Vnkwb0lM?=
 =?utf-8?B?SU5WOE1mMjFZZXFLSWswaHExQXcvaUI1K0NKY09SVTBBWUNiWGR4TDJJZVo5?=
 =?utf-8?B?WkVlalVSL080aC96MHZmY2NuenVpajVjTmJnOGtoUHJYU200bS9OcFZsMVRs?=
 =?utf-8?B?di9jcStWbWNrWHZtVDBiVE9NMjEvakVCcnpVN0t1VE55b1dWbnAzQkdOcTBH?=
 =?utf-8?B?cE9hUnZteDZXZFhGNDB3MmdZczQxZlJORHY3a2xMYXFRdUE5ZXdLMXRjOGVY?=
 =?utf-8?B?TXFuR1ZZTnZwUzdNaGZXZ3paWXUvNnlSbjZZcDVacnVaV1BEZk5QTDBhamIz?=
 =?utf-8?B?RFpwa0ZmSUgyK0dTUWZ6cktGMjM4azdISjRwRnEyTWpXSFZjOUR0T2Y5TUls?=
 =?utf-8?B?c0JhaG1hZzdNcExCQ3drOW1JcTUzTGYvQlBYcldJS2laakRtMy9TeisvNUlQ?=
 =?utf-8?B?N1pldWZxbVV5c09BUXhYMm84dG9qWlhDWSt0YlRsRFVCZUNtZ1NmeklFclVH?=
 =?utf-8?B?Z3dRdmFqb1FnT1JPS2Z3enFpSjlwTVl0L2xtQlYyYlRhWi9LWDFlcldZNTVE?=
 =?utf-8?B?Q3hBckViK0lieEFDVFJmRkFkR0NLaVBKeThHdllYcm1aanRvTnVnQVgwMEZL?=
 =?utf-8?B?YnBjaWZJWVNESUpYbHl3anA3UC94MDVsaGdTZ3lqaXZVQzgvbXRjNkFQcCtN?=
 =?utf-8?B?MTNiNGFKcUhVZjdTWlhKamtLU2F6bk1sL0VWZnhnZnNhK0ZYOFBoVHRyOVJB?=
 =?utf-8?B?QmdKYXNjWTc3bTVvdCtQaDNUV1ZoaDBoRTJka3BDbzVlNTM0R1JiVkgySmNO?=
 =?utf-8?B?MW11cW5lQmZWT1RGWmFUWjhzRDFQbHg3VmlmNTFGQkF2Wnk0eEV0YncwMW8w?=
 =?utf-8?B?Rlhrc25wNVRXbTNKU1R4bnp2a1c0SFlQVUNzZDZiUTNuQURHcXp4MndUT0cx?=
 =?utf-8?B?UzFISzNldHhxTGwvSkplZnRPdklUUlZRWHlsdlRzUXpqelVFZ2JPbjBHcm1B?=
 =?utf-8?B?TlVIRE4rNXpqMllCMkZzV0xxS3ZUdnhCNjJHRER6TUN1M21NTVEzZjJHK2RK?=
 =?utf-8?B?aVBSREhKRlVpcUJwRGcycFY2eG1GeS9wTEo0UlNja0ZJckpjbUdvM0NnYWwy?=
 =?utf-8?B?cUxkK1c2ZXp3UzBjSGR2TTFNOGlhRk9ZRGtzNzVTOVVQNkl3NmJhVnVZbXAy?=
 =?utf-8?B?aUlybDQ2ZUpPaGFLRTdpQlpJL21jRXZXNHRFUUdLbzZhVWk4OHBzRVhSMDRh?=
 =?utf-8?B?L0pNNmFMN1RaZmhraVdyci9DUGJiS0R4dVIrRWpOMHQ0aGt1SktRandhbDdY?=
 =?utf-8?B?QzVYSFAvcGIyZHZwVkdwK2gxYmlSUW5lVTRadlRxYkVBLzFwSythSEhsT2t0?=
 =?utf-8?B?UVpvS2dhMWwyUExVYlFpQ2hObVR4RElIeHljT3YzMXVZNUhBL01pUDVBbUh2?=
 =?utf-8?B?a0tIZHpyQ2xBWVpFaWJXdWhFMHlmVVplNTAvTTlQMVNCY1M3K2JvcU1kc0l4?=
 =?utf-8?Q?6+Y4LfdSYYfkhV+b0+cT+lh3TXTyc7Vx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9qZDQ3LzVjQ3k0YlF0NTZzNGFidWJybFJrK2NhSG5TL1hxeVFDZmwrRWVG?=
 =?utf-8?B?RkxEdWxQbkZaMjBCSGFZbFVxcVBmZGdhVWhwVS8xK3FsTU4zOTJNeWFxeU1m?=
 =?utf-8?B?L3dsblhjY21aR0Y4d3FXbHNXcnRjeDdSWDV4Wm16MmxCeUlQcjU5RXZ4SGhK?=
 =?utf-8?B?dXZKNnVuSnhwQUQ1MzhlM3p6VmdDNkJaZENLQThZMStka3Rxdng5aW5obmp0?=
 =?utf-8?B?SXZERnpNMFlIbk5WRWt4dmZYdDRIeDFWZmJzUFA3WllDMDQxTWFmdVh6Smd3?=
 =?utf-8?B?MVFNRDhoa0hpZ2ZJb1VDakZKU0pkMWFpWlllVyszQUZ5cmdHYXVQenlGbVNB?=
 =?utf-8?B?VHZML3NzL3AvYVRRRy9DbSsxQUEydGZmT2xYQjhMS0NxdjJLK2lEdEFXRXUy?=
 =?utf-8?B?dUtZNDdlL2FDY0ZGdVB4bGdDZGNMc1ZYelRiZW90UjVLVmVhS2QwRXlOclVP?=
 =?utf-8?B?U0JDSzdLV0xNcHFRcjVVcHdxUTB2VkNtTUoxZjIxMkdjSW9IcVorSklVMUZS?=
 =?utf-8?B?RjZSbGNtSXpHZ3kzc0lMMTFIeWFwR3JzemNSTWthNTU4YTBLdXhoT1ZYTGE2?=
 =?utf-8?B?d2VONWFaUXZGUVRaRElvZWJ3RGdmWTBlVEIxN3RYT3NibmloNThIeXRZN0NR?=
 =?utf-8?B?UjlQUyt3TmhTcXZmOXRMUlBPaTc5b2t3Sk9SVFNUWndqc2I4cUdxbjNCTXZQ?=
 =?utf-8?B?VlNSb2xDSEM3QXVUb3JKS0ZGR0F2VXVoOXpxSHpYOTRjeUdPUzk1QkpaZzBD?=
 =?utf-8?B?NHNVK3FEZ2dXNy9FUWUyaVBmWHRNenhtMytYcERvMFpkMEZkRElHaEIwS01X?=
 =?utf-8?B?NEFwVlZXSVVyTU5yNVZhWnhXMmFQbHBTQlc0bXpWWkU3dUZzQjFlaXBxSkYv?=
 =?utf-8?B?enI3Zkh5SHZaUnJwdm95dHoxSUhTenF1ZEorT0V0RjJSZlIyS0p6bkRlRDgv?=
 =?utf-8?B?ck5CdlM2Njg0dTJmOGY0T3EvcE9kc242ZWxkWmEvTmFaZWFoNmt1WkRvZzlr?=
 =?utf-8?B?dEw3UUFTbmVCSS84OUpnYUtKczk5cFZtbGtWYjFOV1ZJZDAxUjJaSDJGMGNF?=
 =?utf-8?B?OTQ4TlRlRVl0ME9IUnNUaWhVSDZXL1ErR2t3aldDbGhzWS8zb3c3M1hqYlpK?=
 =?utf-8?B?aWFzMG83bW01T1hwNGkyTG00UUxOVE53V0t2eCtPTjM4OGFkd1dxMTBULzRD?=
 =?utf-8?B?WUxGOW9ObWRLK2FIbWxPMmZLMDlPeXVtRHRGczAwekZibnN1eitUcXFEcjlF?=
 =?utf-8?B?VmRPREJaem1XK2t1QVJaa3puK3ZySm5TY21lSWc4MVh0ZzBsdngvRmdjNFhE?=
 =?utf-8?B?M2NHRGtYYTBZUmFnSmprSlBiU2hKVkFtUXlBUHFiM2tiZENRZXJBTUZOdWpW?=
 =?utf-8?B?RFBTb2E3cHBZTjh2MCsvNy9JNUJBM05TN2JFVUFxaWRuNGViSmZKL2swazY2?=
 =?utf-8?B?SSttZVJ6UEswbXYxbHBzTmtSV2JCa2pVZHdueWlraGFhWksvVXlsT1ZaMmti?=
 =?utf-8?B?ZW16dWtRVTVDR3hwZUREUnVhbHEzbnVVaG1WRkVieDRaR05oTmF5TE1hNUlQ?=
 =?utf-8?B?aHFyNU5qZGtUUmlPNTRiZUUxVWlmbk9KdEhEVDY1MDJQbU5kVFhoOUFERVgx?=
 =?utf-8?B?UmVCeXZRUWdIR3NiMGt1Tnl0ZW5LSGJpWWhCYVZHRmx0d20rRFBNNzRxdzBY?=
 =?utf-8?B?a2JiYXZySTVraFZvdXVyZ1FUbm16ckVaRU1KZGRVdjUwRnhnT21aVEpSbUw5?=
 =?utf-8?B?ZUsvWXlhTjZCaTFoSW1CQnNjMHg5ZEJnV3hsQjBXRzFWckFtS2ZjeG81TFdZ?=
 =?utf-8?B?dHhsTmN6VWhJa2dma1Vta2MvYThsRXFrS2NEU1E3Mlh2WVF3b0d1TzZwdjUz?=
 =?utf-8?B?cjdFanN4cjkyOUlHNXNETzZrTnRmN2F0ai9PU1hGN2FkWStEbzNONlE5eTRh?=
 =?utf-8?B?U1FoUGYvT1AyZ3FteDBVWFZBSVF6NzdPUm1SWnlRVTR6cGxGU3IvMGhHZjVw?=
 =?utf-8?B?b1RLZGxZenpxeE9Jc2p3VWVtV2dQaTI3ckVHVGpzeVByajQ5T2hDOFZiVXBD?=
 =?utf-8?B?RzZXa09ZNUthS0Q4empmR1cyMGcvc2kzdzJBQVpKZ3RDbHR6dUQ4SzZha3cv?=
 =?utf-8?Q?lmhqU4kmptGFW96My06sILiWJ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295bad35-19c3-45c1-0b9c-08de0d76a363
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 12:13:53.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGqTZsVrgMAilYUjOrivHyG7DhCBimAfrCbwbVjwgq9hgTQZ5SgbaxrfVfYZ274PKgZTBjG//vNIxuZHFJ8n4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7381

On Fri, Oct 17, 2025 at 11:57:28AM +0200, Jan Beulich wrote:
> On 17.10.2025 11:19, Roger Pau Monné wrote:
> > On Thu, Oct 16, 2025 at 09:32:29AM +0200, Jan Beulich wrote:
> >> Following hpet_detach_channel(), IRQs may still occur: Ones may already
> >> be in flight (both from before and after the last IRQ migration, i.e. on
> >> possibly two distinct vectors targeting two different CPUs), and new ones
> >> may still be raised as long as the channel is enabled.
> > 
> > Description would need to be adjusted if nothing else, as it speaks
> > about two distinct vectors which is no longer possible after patch 3.
> 
> Oh, right - dropping the parenthesized part.
> 
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > With the above adjusted:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, but as per the RFC remark: Do you then think this is actually
> worthwhile despite what patch 3 does?

I don't think it will hurt, but I also think this can possibly wait
after the code freeze, I don't see much win from doing it, and there's
a risk we might get it wrong.

Thanks, Roger.

