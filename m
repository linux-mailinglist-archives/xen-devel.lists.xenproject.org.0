Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB45C73579
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166706.1493197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RQ-0003XN-3F; Thu, 20 Nov 2025 09:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166706.1493197; Thu, 20 Nov 2025 09:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RQ-0003Tp-0O; Thu, 20 Nov 2025 09:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1166706;
 Thu, 20 Nov 2025 09:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM1RO-0002vx-Ty
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:59:03 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89894f62-c5f7-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 10:59:00 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:58:56 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:58:56 +0000
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
X-Inumbo-ID: 89894f62-c5f7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxYawzihFZGaUVANL6Uo5Q8fjKDGZf9oo8LJWUZJJ7sWtkpZWiDQS5ZNAT+qci80b53xbfHBzeGod8ggDPx+iFlixl7+wlCoYRWojBClCnZSkaY/D7mphbDIyXLmdbOwoJxkaUtOzXlrlOwzSekw1Am+/GfAjxfC9iACDlaZ0vLOvkALsN9zBeKS5iwZafpPucWxQ/APJp7Hm+TRVdua8iSXES5drUDn2FQZsQZjZey1QZvs6Clt29E5Fv3RoaJSXUVygHQ+5GepZLrewOQdyph2ptAiiy9di7wQ5JPt+YEkvjCCgA2rnn8wZ63BwkWs8NHUl2BQCyJU5Cs/7FwfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rX9f34N3RiS3RpmCEMtImbPweMHt7sIs+19N2XAhZxY=;
 b=hJ0Ir4De2vnYBQs+rfWdifSUtuyn/RAM2Fz2k+NiWNEXjyEVnIPvdlmX44iqfZCgddyPjZlEAnXi5+m27RGgmwGHrCj//LmOZG0lxdgbJ5gtbltGbktWw9wvI65gB1c7F3PWvr50K7Mnf129opKnxV1S5BLsDbznBZBJVUtIrVg0dF1Jk8ASpcpBIT/zNP8Sg1agJVCR+Ni0ETDLJbdBF9G34Z01br3I/dNTWz1mj5gMIOJARnOnuIdw9wyWHx7psxzDLewR4LpbRe+e41A+INLf7FG/c5LyOXstzAYFVmhtIN28T2iB5pJDRBNFxTkd5bIblAhzmu0fkcz09Qbx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rX9f34N3RiS3RpmCEMtImbPweMHt7sIs+19N2XAhZxY=;
 b=ClsFTwxAalCs+FHtKmkefg4f+seqAqpcAtxFNfWzjvgcKeEVB7kwwm9w7T0fh0h+GuZYQLEvdWl5C/hec2efWDQpB9eaEmmoGbgaDYs+fmukacat/Dp83N9JaP39+HlXNLm1ePoUkxaTtSvpjHgCIwTCeUU+stpqS4fYePQ91/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 10/12] x86/irq: convert irq_desc cpu_mask field to integer
Date: Thu, 20 Nov 2025 10:58:24 +0100
Message-ID: <20251120095826.25782-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120095826.25782-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0005.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::8)
 To BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY5PR03MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: f977eb64-9f6b-4805-bf63-08de281b6b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHJBTVFHMWlFcWlsR3F6RzZLanhKQTdXMFUzNjFaYitQaWd1QmZxRHlWR1VM?=
 =?utf-8?B?bWl5UE5NTVZqODhIUGJWQlNsYTBadDIvdmsrQ0hkZ2YrNEVLMmR3eitjSktX?=
 =?utf-8?B?WURWZ1pVWCtvdE5XcDNRQVdHeFIzTDdNaG1PeVAzUHhRSFdGUTA4eEJxV013?=
 =?utf-8?B?RW9sSzBkVGR5NVVNODRwRjlubUIzWGtzaFl4ZHBiWVVhTGY0WDBQWEVHbmlN?=
 =?utf-8?B?QW1CNVhPUFBETkVzLzlqOWswSkY0NE9nUFBXNlhZUjFaeUJ6Z2VQbk4raG5Z?=
 =?utf-8?B?ZG5UVE9naGwwaUlOWWM5YlJvdm9UMzFSbUxSdGFsVm5OWmpvcnBUaHVNM1RS?=
 =?utf-8?B?WldWOGxzRjBBTGhMT0xpNVBEVzVwa2c1ajRjVjgxNTFJemlDcnVYOVkzbWJZ?=
 =?utf-8?B?Nkl3U1RMcTJINWJaYk0vYk5NUDNSSS9Tc0NjYVlUSUxXczJZNkpkcXB3RlZt?=
 =?utf-8?B?QU1icWhka05IUGQ1YWtqYk01S0labHZWQWFzNW1BalB6WE93M3dtK0NkQXND?=
 =?utf-8?B?OE5nNFBHVllnR2VHSEhBazFzZDltYktjM1dSTEFaQkxjdFQzRFUySkU0d1dv?=
 =?utf-8?B?YkVIUVhyUGd4a09PSSt0OE9peWZvUVRTaFc4TTR4ZzB6dWNOZ09qaDV6bEVU?=
 =?utf-8?B?SU1YcldET2VUZWQzemZ4NjhYWjl2Nmx3L1lScUs0REhHbU5vUHRGRGE2ZzNp?=
 =?utf-8?B?eTBtMzlSaG4xSXE2alpyYXRrZDV4MGVSMTBKSnc2YlBIU0dQZm5ITElkeEdG?=
 =?utf-8?B?WU1ZZGQxUUhkNExybEdyckZ0cVdLamt1OHFrdTlHOXRpTXN1KytoUUJOZFZK?=
 =?utf-8?B?T01ORFEzQ2NIR0ovRjFoVjRwcnpoQ2t4QlBYVUlnSTMxZXVzM20vRUZGKzFS?=
 =?utf-8?B?Wk1uWG9wMWZVbHByZlVHQXduY2hJNCtNaEJtWUk5QVo2SmltRDU5MGlLdjBW?=
 =?utf-8?B?d3VrQkFHZ1RjOEI4Ui82bjE2ZXdTbmdHWDdSeGkzam9zdkVjeHhtRzFsMGZU?=
 =?utf-8?B?RXNkQ0hJZjR5UWZONVI5akdjUzRDRUtwejlZRkFreDRkb09ES3NrQ0FXL2U2?=
 =?utf-8?B?VmJCWWxDRTFxWWVLNm5QWTh2NUxQc3JGZ3d4NU1yQkFXaUIxazN6Vk9RQTVT?=
 =?utf-8?B?SjkxbXNKWTVscldpTGlPaGwxNWxHK2tBMFZEOHFoZW01b2FTT29WT0laS0hY?=
 =?utf-8?B?b1IzTU42dFo2d2tNZEUxVXlmK3pYb2tybENzUzhnV3Uxem1LZEhWV081YlNp?=
 =?utf-8?B?dDFlNENaRlkvZzgrK1BVYUE2YXJGOFQxalV2cWJuZGFGZS9qdnZpOW9pRlNr?=
 =?utf-8?B?a2Q0Zm1LK0V2SEY0UGtoVWpoVTJxVXQ3NUZiTzlvZDB4Rlh4RmdDQnlUelli?=
 =?utf-8?B?SnVkR2dLd1oySTJKbFFRa3J2bS95WHpPOXN1MVlQZTJCQzc2U2J2VVBzUXJO?=
 =?utf-8?B?TDhvenJxTnkrcjlSNWJhL3J5NWQvNkpFeTVnU1BXTExBS29EeGUrOEpCS3du?=
 =?utf-8?B?dHNzaldQRDJuOTZuaWtHeUp5aHNnV293bW9HY1VTQy9rYWIrRTdGTGNuYVZx?=
 =?utf-8?B?Wi9abk5FS2VLSldYUVlFcENxMEd2SlpKckpSazd1MkwzNXY0eXVqa0dNSWVZ?=
 =?utf-8?B?S2xXTEdJelJSS0lrUzhlVkFSUVNSdC82Z3FhUlRTNHRMYjN3U09zdjNTZThh?=
 =?utf-8?B?dnQ2RXIyMStiNWs3dWNaaEY1cStjc1gwcnhZbEgzSkZvRkREcUFvMitPOFdG?=
 =?utf-8?B?RldCL2R4Sng4QXM5MGs1cGwzMFBBQ0RHZ0dnY1F2c1kybmM1RkN6aUhuRFk0?=
 =?utf-8?B?ajJ5dVo0bDJWYUYvbit6RDl4QWpmWXpmRnB0TnZRWU1RRCtEeDdoTkFxenpC?=
 =?utf-8?B?UklFUFV3VXVZYUt4WDhEM2MzdE9QeldST01zdmthUm9CbHpHVnpnY3ZXRUw4?=
 =?utf-8?Q?ug6xtbrP/UobKbNVU5Atg+3/RkqkYqNK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGJiNXpaNDd5Y2s2RFZoU2hvSTBMU1dyd3FCVFBWNlNzNmVxUU1zMDZDZVJn?=
 =?utf-8?B?VEVqMWt5V1RuUU45Nld2K3V1VTdpaGZNTmMwZXdMajRTYittdlF3cmk0Zmh0?=
 =?utf-8?B?TlB1WjRwWVlGYWRHN3RMdFJCdGdXQmo4ZHp0d2krUUVMZWhqUW50RkdvNGRK?=
 =?utf-8?B?K05XM3FlaEQySzVtWXRQWis3Um81YWJhd3Q0Rnh3aHBWQjc1cG8yU01LVXpP?=
 =?utf-8?B?eUtrWWhwRjh5NVlLVHB2M1RUSWVPenJONXlqWnlzSXdONkJCUy9OWEIrUi9k?=
 =?utf-8?B?RW5STHdyKzdMTk10anRYSFFZeVJnUHdaM3lueWxxMTJXS3REZEoxelJMMDNX?=
 =?utf-8?B?Tm5oYlpBNEpFODg1RG5zVFVBV2tLcmJQdkhiMkliWnZEZUVtUGovQ0hTNFBK?=
 =?utf-8?B?Z1lYL0hhREhPczdGS3VXeG1BM1BYbno2dGpyeFYwa3l4b1UzMG04Kzk2bjFD?=
 =?utf-8?B?RjNtQVBzeTRSUUhOTVdCYmhEMmQrK0tSU1RvQ2YwZGdhelRxVmlvUStUQ21E?=
 =?utf-8?B?VlNPclJFTkRVYlNDSUF6ZUtZM2hPajRGbmlGUGJrL3dNNzdtbHBqTkFhM2Ev?=
 =?utf-8?B?QWZnK01WQTNtZzVwbmdiRnMzalUvalRkZDFGY213T3k3aGxBeDkwTnFPL2dp?=
 =?utf-8?B?K1hvNktWejlmd0hsS2p4blFhQkQ1YWFTUnU5d042cFp3RUtOSzFuOXY1WXcr?=
 =?utf-8?B?cXlLUStMZnFnV1V1bGIyNVcyY0NaNWVXM1FwUlZFQWZsSlpxRFRXcmZyaVdB?=
 =?utf-8?B?SU84TWp3aGRiTnhrekVlRHNweVFVbjFmRTlVRm1NZFFsVm9VVEpRVXRGL1hE?=
 =?utf-8?B?VkdLSnF0WG9JZkkvbzF6S25RMk9CNWEvTVRZazJtVFVHS3VyUDVsMEhxVlRU?=
 =?utf-8?B?RkZNMXRyZDdicDU2ekdGSERuVFZOUjVhQTNxYW0zT3JwTldXbzBzMENTOUlG?=
 =?utf-8?B?MFlmZVJNRmdSMTVhQkhzWHlVd0YyKys5WGM5bTc4THR6TWFZQVhwVVN5Vlh2?=
 =?utf-8?B?SUpkRFhYZzFoam5zaW10Nk83NUdESy9jR0Vqem5qMGQzYXpvamRlVlQ0d2Vk?=
 =?utf-8?B?QVhmUEFzNDh0ckJjcU1GbHNkZDJGZDVtNGwvZjEwRW1oMkpLV3ZYK1EySkxr?=
 =?utf-8?B?c2JHUW9MMXdIcERuYnROaFF3YVZkZm84QlJEaTFiM0ZQQUJsSXZFYlEvNmVW?=
 =?utf-8?B?NmFqRjNJR0hsSWpLQlJkTmtHTVB6S2NmdTQreDcyTmRSc0hZNEN3b09QTlhO?=
 =?utf-8?B?clRCYldXelpqS0lVWHdtREcvZDFpQ2xJNWlqekpXd09JZmduMzRTMWxIbHJM?=
 =?utf-8?B?ekhSNGFBeUhGNUxuZVBqbmRubEVOSWQvZGxRYVJ3QjY2VW0vNERrUGtQWFFz?=
 =?utf-8?B?MEFkQjlPQk9MVmE0QWVuRGk2YjlRSjQyN3JWbENUYWw2ckdiTjJ2bitBV09K?=
 =?utf-8?B?bjNURytXN1lKaWtMbllzZUZNR0JrWUR6SDdmKzA3MjdnTzFIcXBnSXk5dW9V?=
 =?utf-8?B?NkQ4andOTTVXeU5NRnBRRUt5SUxORDF6eno0Y0Z2U1RXcXRmNFNHTVRyTll3?=
 =?utf-8?B?d1orTEQwdHdOaUNqbkMwZXVqdlgzYUpFbU9lOUZDVjR3d0wwYUxhbzU0UGtG?=
 =?utf-8?B?YnRnUVhUdnNSNUllc3A1d0xwUmE4blc3OWpNWm1vQ09rMVpkKzErUW1UZWlz?=
 =?utf-8?B?QmJaNElFRmFHeUhsUVhOSUlNUDJSZkFIMjExQXJidEJWR2JtSVkrcVZvNmtH?=
 =?utf-8?B?Ryt2R01NNjA5NE1Pck5XazcxWGNnbEo4LzVSb2ExRW5lUlI4QzhwK0tWYi80?=
 =?utf-8?B?Y1ROR0hxNjJmSTR6Zmdyei9YSXp6WkNoWUFJVndHUjlyUHRzSFEyZ0xFYzVi?=
 =?utf-8?B?M2RKOWFYR2lFS01KY3BPdVFUZjVoOGc0K0Rvc0lXaDRMNUJiaEhVVnR5VlFV?=
 =?utf-8?B?YnBuMy84RU4wTjRhWU9VeS9uN0dWcmhIalEyNzZVa010aXpoNDkwcWkwWVlz?=
 =?utf-8?B?Q0s2NzVncnZGa09iRUorN3U0KzJqd0xGM2lvZW40eDk0dm5NdnkzVG8wdXpM?=
 =?utf-8?B?OHU1SFZBUW53dWFzSDRLSGEzSmJHSitBNUpzVEN0NDF0RXFmT0UyUFJ4dHlk?=
 =?utf-8?Q?MZ4sFDc3NXTjVveB0/mSz7n1l?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f977eb64-9f6b-4805-bf63-08de281b6b41
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:58:56.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMUgTMBNXQHMmfcksQQ5Mo6XA4TWO5GrfsDk5mt38WX5dxx34FwAQ25zezoX/DeZbI/4k1dveAYhmpnFEXMSFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

With the dropping of logical target mode for interrupts Xen can now
guarantee that an irq_desc can only target a single CPU.  As such, simplify
the fields and convert the cpu_mask that used to contain the set of target
CPUs into a integer that will contain the single target CPU.

No functional change intended in how interrupts are assigned or distributed
across CPUs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hpet.c                      |  9 ++-
 xen/arch/x86/i8259.c                     |  2 +-
 xen/arch/x86/include/asm/irq.h           | 10 +--
 xen/arch/x86/include/asm/msi.h           |  3 +-
 xen/arch/x86/io_apic.c                   | 27 +++----
 xen/arch/x86/irq.c                       | 97 ++++++++++--------------
 xen/arch/x86/msi.c                       | 17 +----
 xen/arch/x86/smpboot.c                   |  2 +-
 xen/common/cpu.c                         |  1 +
 xen/drivers/passthrough/amd/iommu_init.c |  2 +-
 xen/drivers/passthrough/vtd/iommu.c      |  2 +-
 xen/include/xen/cpumask.h                |  1 +
 12 files changed, 70 insertions(+), 103 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index abf4eaf86db1..168675420f06 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -310,9 +310,9 @@ static void cf_check hpet_msi_set_affinity(
     struct msi_msg msg = ch->msi.msg;
 
     /* This really is only for dump_irqs(). */
-    cpumask_copy(desc->arch.cpu_mask, mask);
+    desc->arch.cpu = cpumask_any(mask);
 
-    msg.dest32 = cpu_mask_to_apicid(mask);
+    msg.dest32 = cpu_physical_id(desc->arch.cpu);
     msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
     msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
     if ( msg.dest32 != ch->msi.msg.dest32 )
@@ -337,7 +337,8 @@ static int __hpet_setup_msi_irq(struct irq_desc *desc)
 {
     struct msi_msg msg;
 
-    msi_compose_msg(desc->arch.vector, desc->arch.cpu_mask, &msg);
+    msg.dest32 = cpu_physical_id(desc->arch.cpu);
+    msi_compose_msg(desc->arch.vector, &msg);
     return hpet_msi_write(desc->action->dev_id, &msg);
 }
 
@@ -501,7 +502,7 @@ static void set_channel_irq_affinity(struct hpet_event_channel *ch)
      * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
      * keeps setting the new deadline only afterwards).
      */
-    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
+    desc->arch.cpu = ch->cpu;
 
     spin_unlock(&desc->lock);
 
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 41f949a36531..5ad5e622c0e1 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -414,7 +414,7 @@ void __init init_IRQ(void)
          * interrupts in do_IRQ().  This behavior has only been observed
          * during AP bringup.
          */
-        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
+        desc->arch.cpu = cpu;
         desc->arch.vector = LEGACY_VECTOR(irq);
     }
     
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 73abc8323a8d..97c706acebf2 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -69,13 +69,9 @@ struct irq_desc;
 struct arch_irq_desc {
         int16_t vector;                  /* vector itself is only 8 bits, */
         int16_t old_vector;              /* but we use -1 for unassigned  */
-        /*
-         * Except for high priority interrupts @cpu_mask may have bits set for
-         * offline CPUs.  Consumers need to be careful to mask this down to
-         * online ones as necessary.  There is supposed to always be a non-
-         * empty intersection with cpu_online_map.
-         */
-        cpumask_var_t cpu_mask;
+/* Special target CPU values. */
+#define CPU_INVALID  ~0U
+        unsigned int cpu;                /* Target CPU of the interrupt. */
         cpumask_var_t old_cpu_mask;
         cpumask_var_t pending_mask;
         vmask_t *used_vectors;
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 00059d4a3a9d..2f91294105be 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -235,8 +235,7 @@ struct arch_msix {
 };
 
 void early_msi_init(void);
-void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask,
-                     struct msi_msg *msg);
+void msi_compose_msg(unsigned vector, struct msi_msg *msg);
 void __msi_set_enable(pci_sbdf_t sbdf, int pos, int enable);
 void cf_check mask_msi_irq(struct irq_desc *desc);
 void cf_check unmask_msi_irq(struct irq_desc *desc);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index dfbe27b12d54..a50f7061161a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1112,8 +1112,7 @@ static void __init setup_IO_APIC_irqs(void)
             if (platform_legacy_irq(irq))
                 disable_8259A_irq(irq_to_desc(irq));
 
-            set_entry_dest(&entry,
-                           cpu_mask_to_apicid(irq_to_desc(irq)->arch.cpu_mask));
+            set_entry_dest(&entry, cpu_physical_id(irq_to_desc(irq)->arch.cpu));
             spin_lock_irqsave(&ioapic_lock, flags);
             __ioapic_write_entry(apic, pin, false, entry);
             spin_unlock_irqrestore(&ioapic_lock, flags);
@@ -2137,14 +2136,11 @@ int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int a
         return vector;
     entry.vector = vector;
 
-    if (cpumask_intersects(desc->arch.cpu_mask, TARGET_CPUS)) {
-        cpumask_t *mask = this_cpu(scratch_cpumask);
-
-        cpumask_and(mask, desc->arch.cpu_mask, TARGET_CPUS);
-        set_entry_dest(&entry, cpu_mask_to_apicid(mask));
+    if (cpu_online(desc->arch.cpu)) {
+        set_entry_dest(&entry, cpu_physical_id(desc->arch.cpu));
     } else {
-        printk(XENLOG_ERR "IRQ%d: no target CPU (%*pb vs %*pb)\n",
-               irq, CPUMASK_PR(desc->arch.cpu_mask), CPUMASK_PR(TARGET_CPUS));
+        printk(XENLOG_ERR "IRQ%d: target CPU %u is offline\n",
+               irq, desc->arch.cpu);
         desc->status |= IRQ_DISABLED;
     }
 
@@ -2333,17 +2329,12 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
     /* Set the vector field to the real vector! */
     rte.vector = desc->arch.vector;
 
-    if ( cpumask_intersects(desc->arch.cpu_mask, TARGET_CPUS) )
-    {
-        cpumask_t *mask = this_cpu(scratch_cpumask);
-
-        cpumask_and(mask, desc->arch.cpu_mask, TARGET_CPUS);
-        set_entry_dest(&rte, cpu_mask_to_apicid(mask));
-    }
+    if ( cpu_online(desc->arch.cpu) )
+        set_entry_dest(&rte, cpu_physical_id(desc->arch.cpu));
     else
     {
-        gprintk(XENLOG_ERR, "IRQ%d: no target CPU (%*pb vs %*pb)\n",
-               irq, CPUMASK_PR(desc->arch.cpu_mask), CPUMASK_PR(TARGET_CPUS));
+        gprintk(XENLOG_ERR, "IRQ%d: target CPU %u offline\n",
+                irq, desc->arch.cpu);
         desc->status |= IRQ_DISABLED;
         rte.mask = 1;
     }
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index bfb94852a6dc..a56d1e8fc267 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -156,8 +156,7 @@ static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
 
     if ( !cpu_online(cpu) )
         return -EINVAL;
-    if ( (desc->arch.vector == vector) &&
-         cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+    if ( (desc->arch.vector == vector) && cpu == desc->arch.cpu )
         return 0;
     if ( desc->arch.vector != IRQ_VECTOR_UNASSIGNED )
         return -EBUSY;
@@ -165,8 +164,7 @@ static int __init _bind_irq_vector(struct irq_desc *desc, int vector,
     trace_irq_mask(TRC_HW_IRQ_BIND_VECTOR, desc->irq, vector, cpumask_of(cpu));
     per_cpu(vector_irq, cpu)[vector] = desc->irq;
     desc->arch.vector = vector;
-    cpumask_clear(desc->arch.cpu_mask);
-    cpumask_set_cpu(cpu, desc->arch.cpu_mask);
+    desc->arch.cpu = cpu;
     if ( desc->arch.used_vectors )
     {
         ASSERT(!test_bit(vector, desc->arch.used_vectors));
@@ -195,23 +193,21 @@ int __init bind_irq_vector(int irq, int vector, unsigned int cpu)
 
 static void _clear_irq_vector(struct irq_desc *desc)
 {
-    unsigned int cpu, old_vector, irq = desc->irq;
+    unsigned int cpu = desc->arch.cpu, old_vector, irq = desc->irq;
     unsigned int vector = desc->arch.vector;
     cpumask_t *tmp_mask = this_cpu(scratch_cpumask);
 
     BUG_ON(!valid_irq_vector(vector));
 
     /* Always clear desc->arch.vector */
-    cpumask_and(tmp_mask, desc->arch.cpu_mask, &cpu_online_map);
-
-    for_each_cpu(cpu, tmp_mask)
+    if ( cpu_online(cpu) )
     {
         ASSERT(per_cpu(vector_irq, cpu)[vector] == irq);
         per_cpu(vector_irq, cpu)[vector] = ~irq;
     }
 
     desc->arch.vector = IRQ_VECTOR_UNASSIGNED;
-    cpumask_clear(desc->arch.cpu_mask);
+    desc->arch.cpu = CPU_INVALID;
 
     if ( desc->arch.used_vectors )
     {
@@ -219,7 +215,7 @@ static void _clear_irq_vector(struct irq_desc *desc)
         clear_bit(vector, desc->arch.used_vectors);
     }
 
-    trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, tmp_mask);
+    trace_irq_mask(TRC_HW_IRQ_CLEAR_VECTOR, irq, vector, cpumask_of(cpu));
 
     if ( unlikely(desc->arch.move_in_progress) )
     {
@@ -392,22 +388,16 @@ int irq_to_vector(int irq)
 
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
-    if ( !zalloc_cpumask_var(&desc->arch.cpu_mask) )
-        return -ENOMEM;
-
     if ( !alloc_cpumask_var(&desc->arch.old_cpu_mask) )
-    {
-        free_cpumask_var(desc->arch.cpu_mask);
         return -ENOMEM;
-    }
 
     if ( !alloc_cpumask_var(&desc->arch.pending_mask) )
     {
         free_cpumask_var(desc->arch.old_cpu_mask);
-        free_cpumask_var(desc->arch.cpu_mask);
         return -ENOMEM;
     }
 
+    desc->arch.cpu = CPU_INVALID;
     desc->arch.vector = IRQ_VECTOR_UNASSIGNED;
     desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
     desc->arch.creator_domid = DOMID_INVALID;
@@ -553,12 +543,12 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
         if ( old_vector >= FIRST_HIPRIORITY_VECTOR &&
              old_vector <= LAST_HIPRIORITY_VECTOR )
         {
-            cpumask_copy(desc->arch.cpu_mask,
-                         cpumask_of(cpumask_any(&tmp_mask)));
+            desc->arch.cpu = cpumask_any(&tmp_mask);
             return 0;
         }
 
-        if (cpumask_intersects(&tmp_mask, desc->arch.cpu_mask)) {
+        if ( cpumask_test_cpu(desc->arch.cpu, &tmp_mask) )
+        {
             desc->arch.vector = old_vector;
             return 0;
         }
@@ -570,7 +560,7 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
          * If the current destination is online refuse to shuffle.  Retry after
          * the in-progress movement has finished.
          */
-        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
+        if ( cpu_online(desc->arch.cpu) )
             return -EAGAIN;
 
         /*
@@ -591,11 +581,10 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
              * in the 'mask' parameter.
              */
             desc->arch.vector = desc->arch.old_vector;
-            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
+            desc->arch.cpu = cpumask_any(desc->arch.old_cpu_mask);
 
             /* Undo any possibly done cleanup. */
-            for_each_cpu(cpu, desc->arch.cpu_mask)
-                per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
+            per_cpu(vector_irq, desc->arch.cpu)[desc->arch.vector] = irq;
 
             /* Cancel the pending move and release the current vector. */
             desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
@@ -669,7 +658,7 @@ next:
 
         if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
         {
-            ASSERT(!cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map));
+            ASSERT(!cpu_online(desc->arch.cpu));
             /*
              * Special case when evacuating an interrupt from a CPU to be
              * offlined and the interrupt was already in the process of being
@@ -684,8 +673,9 @@ next:
         }
         else if ( valid_irq_vector(old_vector) )
         {
-            cpumask_and(desc->arch.old_cpu_mask, desc->arch.cpu_mask,
-                        &cpu_online_map);
+            cpumask_clear(desc->arch.old_cpu_mask);
+            if ( cpu_online(desc->arch.cpu) )
+                cpumask_set_cpu(desc->arch.cpu, desc->arch.old_cpu_mask);
             desc->arch.old_vector = desc->arch.vector;
             if ( !cpumask_empty(desc->arch.old_cpu_mask) )
                 desc->arch.move_in_progress = 1;
@@ -698,8 +688,7 @@ next:
 
         per_cpu(vector_irq, cpu)[vector] = irq;
         desc->arch.vector = vector;
-        cpumask_clear(desc->arch.cpu_mask);
-        cpumask_set_cpu(cpu, desc->arch.cpu_mask);
+        desc->arch.cpu = cpu;
 
         desc->arch.used = IRQ_USED;
         ASSERT((desc->arch.used_vectors == NULL)
@@ -762,14 +751,14 @@ void setup_vector_irq(unsigned int cpu)
     /* Mark the inuse vectors */
     for ( irq = 0; irq < nr_irqs; ++irq )
     {
-        struct irq_desc *desc = irq_to_desc(irq);
+        const struct irq_desc *desc = irq_to_desc(irq);
 
         if ( !irq_desc_initialized(desc) )
             continue;
         vector = irq_to_vector(irq);
         if ( (vector >= FIRST_HIPRIORITY_VECTOR &&
               vector <= LAST_HIPRIORITY_VECTOR) ||
-             cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+             cpu == desc->arch.cpu )
             per_cpu(vector_irq, cpu)[vector] = irq;
     }
 }
@@ -847,8 +836,7 @@ void cf_check irq_move_cleanup_interrupt(void)
         if (!desc->arch.move_cleanup_count)
             goto unlock;
 
-        if ( vector == desc->arch.vector &&
-             cpumask_test_cpu(me, desc->arch.cpu_mask) )
+        if ( vector == desc->arch.vector && me == desc->arch.cpu )
             goto unlock;
 
         irr = apic_read(APIC_IRR + (vector / 32 * 0x10));
@@ -910,8 +898,7 @@ void cf_check irq_complete_move(struct irq_desc *desc)
     vector = (u8)get_irq_regs()->entry_vector;
     me = smp_processor_id();
 
-    if ( vector == desc->arch.vector &&
-         cpumask_test_cpu(me, desc->arch.cpu_mask) )
+    if ( vector == desc->arch.vector && me == desc->arch.cpu )
         send_cleanup_vector(desc);
 }
 
@@ -919,7 +906,6 @@ unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
     int ret;
     unsigned long flags;
-    cpumask_t dest_mask;
 
     if ( mask && !cpumask_intersects(mask, &cpu_online_map) )
         return BAD_APICID;
@@ -932,18 +918,12 @@ unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
         return BAD_APICID;
 
     if ( mask )
-    {
         cpumask_copy(desc->affinity, mask);
-        cpumask_and(&dest_mask, mask, desc->arch.cpu_mask);
-    }
     else
-    {
         cpumask_setall(desc->affinity);
-        cpumask_copy(&dest_mask, desc->arch.cpu_mask);
-    }
-    cpumask_and(&dest_mask, &dest_mask, &cpu_online_map);
 
-    return cpu_mask_to_apicid(&dest_mask);
+    ASSERT(cpu_online(desc->arch.cpu));
+    return cpu_physical_id(desc->arch.cpu);
 }
 
 /* For re-setting irq interrupt affinity for specific irq */
@@ -1687,8 +1667,7 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
                 cpumask_setall(desc->affinity);
                 affinity = &cpumask_all;
             }
-            else if ( !cpumask_intersects(desc->arch.cpu_mask,
-                                          &cpu_online_map) )
+            else if ( !cpu_online(desc->arch.cpu) )
                 affinity = desc->affinity;
             if ( affinity )
                 desc->handler->set_affinity(desc, affinity);
@@ -1966,6 +1945,15 @@ static void do_IRQ_guest(struct irq_desc *desc, unsigned int vector)
     }
 }
 
+static const cpumask_t *get_cpumask(unsigned int cpu)
+{
+    if ( cpu < nr_cpu_ids )
+        return cpumask_of(cpu);
+
+    ASSERT(cpu == CPU_INVALID);
+    return &cpumask_none;
+}
+
 void do_IRQ(struct cpu_user_regs *regs)
 {
     struct irqaction *action;
@@ -2013,7 +2001,8 @@ void do_IRQ(struct cpu_user_regs *regs)
                     spin_lock(&desc->lock);
                     printk("IRQ%d a={%*pbl}[{%*pbl},{%*pbl}] v=%02x[%02x] t=%s s=%08x\n",
                            ~irq, CPUMASK_PR(desc->affinity),
-                           CPUMASK_PR(desc->arch.cpu_mask),
+                           /* TODO: handle hipri vectors nicely. */
+                           CPUMASK_PR(get_cpumask(desc->arch.cpu)),
                            CPUMASK_PR(desc->arch.old_cpu_mask),
                            desc->arch.vector, desc->arch.old_vector,
                            desc->handler->typename, desc->status);
@@ -2545,7 +2534,8 @@ static void cf_check dump_irqs(unsigned char key)
 
         printk("   IRQ:%4d vec:%02x %-15s status=%03x aff:{%*pbl}/{%*pbl} ",
                irq, desc->arch.vector, desc->handler->typename, desc->status,
-               CPUMASK_PR(desc->affinity), CPUMASK_PR(desc->arch.cpu_mask));
+               CPUMASK_PR(desc->affinity),
+               CPUMASK_PR(get_cpumask(desc->arch.cpu)));
 
         if ( ssid )
             printk("Z=%-25s ", ssid);
@@ -2683,8 +2673,7 @@ void fixup_irqs(void)
              * interrupts.
              */
             if ( apic_irr_read(desc->arch.old_vector) )
-                send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
-                              desc->arch.vector);
+                send_IPI_mask(cpumask_of(desc->arch.cpu), desc->arch.vector);
 
             /*
              * This CPU is going offline, remove it from ->arch.old_cpu_mask
@@ -2709,8 +2698,7 @@ void fixup_irqs(void)
          * are a subset of the online mask.  What fixup_irqs() cares about is
          * evacuating interrupts from CPUs not in the online mask.
          */
-        if ( !desc->action || cpumask_subset(desc->arch.cpu_mask,
-                                             &cpu_online_map) )
+        if ( !desc->action || cpu_online(desc->arch.cpu) )
         {
             spin_unlock(&desc->lock);
             continue;
@@ -2732,7 +2720,7 @@ void fixup_irqs(void)
          * the interrupt, signal to check whether there are any pending vectors
          * to be handled in the local APIC after the interrupt has been moved.
          */
-        if ( cpumask_test_cpu(cpu, desc->arch.cpu_mask) )
+        if ( cpu == desc->arch.cpu )
             check_irr = true;
 
         if ( desc->handler->set_affinity )
@@ -2754,8 +2742,7 @@ void fixup_irqs(void)
              * desc in order for any in-flight interrupts to be delivered to
              * the lapic.
              */
-            send_IPI_mask(cpumask_of(cpumask_any(desc->arch.cpu_mask)),
-                          desc->arch.vector);
+            send_IPI_mask(cpumask_of(desc->arch.cpu), desc->arch.vector);
 
         spin_unlock(&desc->lock);
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5389bc08674a..f70abac687e4 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -154,24 +154,13 @@ static bool msix_memory_decoded(const struct pci_dev *dev, unsigned int pos)
 /*
  * MSI message composition
  */
-void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg *msg)
+void msi_compose_msg(unsigned vector, struct msi_msg *msg)
 {
     memset(msg, 0, sizeof(*msg));
 
     if ( vector < FIRST_DYNAMIC_VECTOR )
         return;
 
-    if ( cpu_mask )
-    {
-        cpumask_t *mask = this_cpu(scratch_cpumask);
-
-        if ( !cpumask_intersects(cpu_mask, &cpu_online_map) )
-            return;
-
-        cpumask_and(mask, cpu_mask, &cpu_online_map);
-        msg->dest32 = cpu_mask_to_apicid(mask);
-    }
-
     msg->address_hi = MSI_ADDR_BASE_HI;
     msg->address_lo = MSI_ADDR_BASE_LO |
                       MSI_ADDR_DESTMODE_PHYS |
@@ -531,7 +520,9 @@ int __setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc,
 
     desc->msi_desc = msidesc;
     desc->handler = handler;
-    msi_compose_msg(desc->arch.vector, desc->arch.cpu_mask, &msg);
+    msg.dest32 = cpu_physical_id(desc->arch.cpu);
+
+    msi_compose_msg(desc->arch.vector, &msg);
     ret = write_msi_msg(msidesc, &msg, true);
     if ( unlikely(ret) )
     {
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 55ea62d7d67f..3492073d5c8c 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1465,7 +1465,7 @@ void __init smp_intr_init(void)
 
         desc = irq_to_desc(irq);
         desc->arch.vector = vector;
-        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
+        desc->arch.cpu = cpu;
         cpumask_setall(desc->affinity);
     }
 
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index f09af0444b6a..f52f02e2a9d6 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -16,6 +16,7 @@ unsigned int __read_mostly nr_cpumask_bits
 const cpumask_t cpumask_all = {
     .bits[0 ... (BITS_TO_LONGS(NR_CPUS) - 1)] = ~0UL
 };
+const cpumask_t cpumask_none;
 
 /*
  * cpu_bit_bitmap[] is a special, "compressed" data structure that
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 00d2c46cbcd5..0d03b9d86254 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -507,7 +507,7 @@ static void cf_check set_x2apic_affinity(
     if ( dest == BAD_APICID )
         return;
 
-    msi_compose_msg(desc->arch.vector, NULL, &iommu->msi.msg);
+    msi_compose_msg(desc->arch.vector, &iommu->msi.msg);
     iommu->msi.msg.dest32 = dest;
 
     ctrl.dest_mode = MASK_EXTR(iommu->msi.msg.address_lo,
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 90f36ac22b8a..d2dbf74bc8bb 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1194,7 +1194,7 @@ static void cf_check dma_msi_set_affinity(
         return;
     }
 
-    msi_compose_msg(desc->arch.vector, NULL, &msg);
+    msi_compose_msg(desc->arch.vector, &msg);
     msg.dest32 = dest;
     if (x2apic_enabled)
         msg.address_hi = dest & 0xFFFFFF00;
diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
index b713bb69a9cb..1d72c179d7a4 100644
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -289,6 +289,7 @@ static inline const cpumask_t *cpumask_of(unsigned int cpu)
 #define cpumask_bits(maskp) ((maskp)->bits)
 
 extern const cpumask_t cpumask_all;
+extern const cpumask_t cpumask_none;
 
 /*
  * cpumask_var_t: struct cpumask for stack usage.
-- 
2.51.0


