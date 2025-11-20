Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1ADC73577
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166708.1493208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RS-0003p3-H1; Thu, 20 Nov 2025 09:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166708.1493208; Thu, 20 Nov 2025 09:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RS-0003mX-Bh; Thu, 20 Nov 2025 09:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1166708;
 Thu, 20 Nov 2025 09:59:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM1RR-0002vx-3l
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:59:05 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b1889d1-c5f7-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 10:59:03 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:59:00 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:59:00 +0000
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
X-Inumbo-ID: 8b1889d1-c5f7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+C0Qn5mHIiXm3yBaBkfqza/XW5r98lQRcqT2DPhCYSzchDN08kDNn48auRk0Hv8P3BPkm7itp5frCvk/amnoi5/1hqYcsblRGfd/V9LoGVW+0fgNoTI4BRDK68DUJN/gJcrT87ofPSyluu5rzTOUL191qANt2L00SCulTI223OVEXTyPquZPCRWNr8FBp0WWUA5qAP5AGwZAZOtyaeFPDhIcF1v8rn6v93QPfmlqxH4PGyQ8glTds7h1ttZhOSw3nek5MbF3rcfGg9AyfaelrXRJSKxToEru1zBuSK7AUg5H2a0ft2LHizeTkDK8n4HFECtGleK1PCpsNK/dSdwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYLemCz/ejmq9i/3iHjcMi3Ukp02UqKJT5V2Wj0bREE=;
 b=BYco59qnV3GU9amhluVdFa3cLkJNgMgu+Yj5sFg/T+G6beUrAS0pHgPFcnkH8nhiS7l8TTcBUVjEkRAoccinwK2jTepP2TbLMtt1RdeYHfm5ATbtXgQR1X3Ntec3hgnxpoYQdL1fVfejG1bygdq40ibkUMFqlrCnhgOup/EdmlC7OjeZGXZZYfbkKKdGAZXUWBLhrvNn+EQ04qQQsrYcmEZvQKX/DgX/i1hMmM4a8Z2dk6jYEf5S3Ix7I1fDIKAWmYg2koO/Fokb7IYzaBP4AVkg/5aJAEfZYriRGWRANbDLgJUJICGXkdk1EHPHls65bZZNk9W9aGU4lM3FIMej5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYLemCz/ejmq9i/3iHjcMi3Ukp02UqKJT5V2Wj0bREE=;
 b=VqsF8ofaSqiUySHAXf4Co2nsJhdXiPLTlDyn07aHDB7dqAqHEaXrDU59V9RKR2tapL5/UfXfa5/T5NhmOlIsY+n/YVJTfV7/Jpt1YEo7VFlakKctm3yEbT9oJq8l0XKIbFnXjKW9yhllF+nbrFIct4gXdkrJsrR982o2nXG6YDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 11/12] x86/irq: convert irq_desc old_cpu_mask field to integer
Date: Thu, 20 Nov 2025 10:58:25 +0100
Message-ID: <20251120095826.25782-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120095826.25782-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0020.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::6) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY5PR03MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa68c29-aec6-43f0-fc29-08de281b6d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkpTOEg4bEtpR21tRjJUUTNrbG1UU09rckg4Ry8rdldjcERyYlVlWkhzY0Np?=
 =?utf-8?B?eHVCQ2xnajJkNGFlSS9lUnpaZGFJczhCMWNjQVlCYkVRMGJxTW5NVmwrS01E?=
 =?utf-8?B?MDhVZVNqU3ZQWEhKNkl3YlhFdXlZeDJDUVJ3ajh0UVdRTVh5VGJBZ2MyMkk4?=
 =?utf-8?B?QTZjaENGcFBLSUlpbjBuRHFSK3UzWnRjVCtNK1E3ODBiZ01HVTZvYWZ6WmVS?=
 =?utf-8?B?RjZYZ1dOTGtLUldxMU1CZlQ2R2xKNVFZYURDek9kRG51dS9yTE1rcGVBNGZZ?=
 =?utf-8?B?VDdmdHNFRFJZc1FNS2lKUm0zWlF6OUpBSTFaeUg4TGw4enFGbUQ2Z1NxYno5?=
 =?utf-8?B?aDB1NEYzVUFuZ2h3dWlYbmpGaXJtWWRrZ1N4OW9RQ1UrN0dPZ2UyOFRCcEdy?=
 =?utf-8?B?RFZyUFpzN3ZHTGNKcjZhRmM4aFAxbGRUZ2ZxSnBOSEZNMDFoeURwTlRpUDds?=
 =?utf-8?B?SEp4bmhkVGhMTmYwdnBhaGpHdHIxcEFMbmVnREZhbFFnVVVZL3kwTVUrT2Uv?=
 =?utf-8?B?bkZZN0hkUE5OZDhDOEg3RityRjB6RHVVSHVPWE5wbzdJVGtyclpYS09nMWRH?=
 =?utf-8?B?NzVMOHg4MGZ5S3ozbXNXUG5ZMUM2eHJON3RmYkx6aGdpZ2E3V0M0S1E2V3No?=
 =?utf-8?B?bndRV2l0MHFKUHd3SEltOXdYdHd6UFY2bmlZNk90YnJ2SjQ1R3YzVndJVkp4?=
 =?utf-8?B?ZVVFMnl4L1ZKeTlFZWZJTmhQY0JKamM0bHhVVjNOay9QalJ5MCsvT0FWRS85?=
 =?utf-8?B?NzJaYzVyb280bWV6anVRQk1wd1V1ekdEQnV1MFVISzEvS2FqaXZUUFNrc0VD?=
 =?utf-8?B?SGs4YzlYb1hBclJwT2Q4aWZjQnUvaFovdSs2S01rZHVTVHlVVkc4RS8wcEZ3?=
 =?utf-8?B?QVgydzhJbm8wdFB2b2tOUVhuNjh4aGRlam1Gb0xHWFZWS3VzVW9OcFRqN2ht?=
 =?utf-8?B?dGVvTys0R1hTTVdtMEI1dE5QODFyZGRSeWRYSlUxZWxhYUd2QWl6QUhaT3V6?=
 =?utf-8?B?NzJjU0cvcnlUY2N2M1NJeTlOVWY2bU5SV3E0UWZob1dla0NCdXRaV0dPRlJj?=
 =?utf-8?B?UCtJS2dJSkVyUnZQa2F1SERWYnQ4dFZtQ0lDeTRvVzNEbENXK1dMbkt2d1Rh?=
 =?utf-8?B?ckZkd1pVa1dReHFKYU1iSGRvTXVMSER5dklUMzl6L2J6NG9GM3d5UFMremx2?=
 =?utf-8?B?Vm1RR0FvNDBLbmtGSE4wdEJBV2x1cm43VjlRbWZMaHBDR0tFVVhUMmVCWGla?=
 =?utf-8?B?azk2YWNYaVIwaWxONlh2V2hyV3ZTZ0dWTlFDbXdTaTNVa3JRRGNwZU9iY1JC?=
 =?utf-8?B?R2JSM2x3T3RSMTFDdVpaaGs2ZzcybVZYUHRFZ0Nhd1JVL1Z0aGtJRytiUXRG?=
 =?utf-8?B?eUNuRnovRFhmWDhSWFpHaXlyL3hzcGVQQ29tN1BPTmJtTWZTc3NORy9BeVkw?=
 =?utf-8?B?R3VaYkc5Q0VMZjZDbjJLWXp1cStCSk4weTFpL2lEQ3Y0cGdxTUJEZ05XNENq?=
 =?utf-8?B?cklldWdXeHNqUk9OaDBNM3Q4M2tzZDl2aWpBeUJoaVJvWXVIbGJCQm1ac0cw?=
 =?utf-8?B?M1dtV1QyZVpsWExHaWR5VHl6ellqTjgyZi9janExbjluV0xLYTBzbnpLWDlp?=
 =?utf-8?B?UmduaXlGc3FYTnlTMTM0QnFvMGNkb2pCVGtORUkvRjVBQXRYQXpqRDY3T0VK?=
 =?utf-8?B?QU5ybE9GaTRGdWpldzlQZXRURC9pTkljMEtGQ3dwb2hmVm5ucGkzdngrRVdY?=
 =?utf-8?B?dDlndUlCcCs3SFZXM0t4cldrT2pSdndma2l6M2JqS2VGOHNpMlVScGhlcTRi?=
 =?utf-8?B?UG00VEpObVJ1Zjg5VElrNm1nd0FTUGVvUEgzOTJZMmprbW5CUUdtWk1sVkJw?=
 =?utf-8?B?dVVnNFVDUzhId25tVkUrZnNDSTVqMWNOTU1iajVnMHRnY0R2dDRHQWExWnBW?=
 =?utf-8?Q?szM6oGppsetyP1wOO32WRAQ6pMtuwloS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDF4SHZTV0dCc3g5bXRvektMMC9wdUQwbGVxa2cvZU5nUWZBak5ROTV4eEZX?=
 =?utf-8?B?aW1Oc2RsZVhYQzJrdE93ZkdxblpMeW1xVG1IY0VqRHgzY1MxS1ZldlJCSTQy?=
 =?utf-8?B?QkZKSkJsQk4vRDRkRmdhZkMrbVE4a2hFamtSMEZiNW12ZGxLbkJOWndDWjJW?=
 =?utf-8?B?VzlXR0hvM2tGNDREWmFaSWVlTWxIMUZLOU5PcEtIRGR5RldBYTJ4a3dJQVcv?=
 =?utf-8?B?OUZMcWtLUnlxRVFKSDZaUUd3VXBoL0lGRm5FanVYVVN3ekZoY3dhNThjRFky?=
 =?utf-8?B?NnIyMTJoR1R5SndxNVIzaUltOVdwMlRZYktNR25DS29LODFTUzVXTlR2Q0Nx?=
 =?utf-8?B?REprZVllOHA2MGdvbGZreC90Z0tyTlM0aEF6bmhNYVcxWkd4eWJGVjhNMXZE?=
 =?utf-8?B?NW1QdkZEbkREY28yTDh0RlBhTCtGcmhMamVpK2ErNnB3cktMY3QwSFNScVN1?=
 =?utf-8?B?ZVJOVG5Bbm9oTjZ6TFBqNnMvc1huSkxPaVpNTkxEWVZUV1VxZVRJQUk0RERp?=
 =?utf-8?B?SWkyWTd0TldHQXZ4aFJDUVNsUE1EeHdVbmdicFJabG9TRTlRSGg4ZENoazR0?=
 =?utf-8?B?SjJ5NDM1RTZORi8zck0xeE5DZkhtTk95bm5LTHRnV1l3WkwxUFVjN1FPYW9V?=
 =?utf-8?B?UGFkZkt0SGo3SnVCS0pDRmpIeFpGUG54VUdRczMyNG5jNyt0TjBIaXNmbHBO?=
 =?utf-8?B?M1RwSEkwSC9ucFRmeDFqTmJoRDBxa3VwRFdELzdzU0NKSjZsLzdSTHBKeUxB?=
 =?utf-8?B?OVNzZWpiQmVjVFNManRHUGp4cnF0cjVKdS96UHJuNW9yWmRPTUFoRE1rRXJ2?=
 =?utf-8?B?NXVHRzdzYnY2QTdUeVBKVGJpRUxGNnRiNmJ0SStWM214U0t1ZDVhQlp5N253?=
 =?utf-8?B?QnpvT2ZwZkhxSm04bHFOejhxUTU5Ri9Mdkdoa01rZjB0b2I0Wjk1SEZGci9Z?=
 =?utf-8?B?L0lBbTBlQlVudnpnM0ZsYktIT0hhVVhXWTBJZy9FNWlFbUNvaVlGTHM1cjB6?=
 =?utf-8?B?R3Z0MHJCUVhNTVFhTVJMelhndGpNZ3hJMGI0S3Y2Snk5a2R5TVRiWnF4aG1q?=
 =?utf-8?B?ZW1ZRnJlcnNuY1huNFJ1ZlZQL2ZyRU9mbkFMY2N5NXFhbXh3WVArOXlGNnpj?=
 =?utf-8?B?VXJyT0JGODN4WktWdzFucWxJaGVuelpVWUhXQlFmRys3Y1JzaS9xeFlpME5P?=
 =?utf-8?B?OHpMa3MvNTdzSDBOVm9sR1FRUFpNaFNGUEVtdExPelE0T3ZUNUNIaGtHUnBM?=
 =?utf-8?B?SHlVaXRUZStVNGk1S1VsMmhLaXdFZlVvdkZlcXhaazhIWU5wckFzaGUxWk1u?=
 =?utf-8?B?UWx6cmJhWkxoQXFnTThjOStJTER2aHIxdmNKOFdYV1k3N3dHUnpaYXU2eTVR?=
 =?utf-8?B?UmhsRXQ1bHlpSWRxUHozUUtlR2RLUm9zTW5YS1FUTGczbS9Kc3M5QkhVK05L?=
 =?utf-8?B?dW5rVU9lS1VhR3ZJTmJoemhDK3QrWmhKVXkzV3FJZkJiVkJqczlkUWhSeEdL?=
 =?utf-8?B?RlVMVkl3aVBvZGwwVU5ZUHY3RURqUzZBQjVycmhycDQrZ1JEdG9tZ08yUUpl?=
 =?utf-8?B?N0xlQVFLak50cHNHV0xGZS9MNUxrMzdNcWFDakVETXFxVVRVSDVRQXNwNlNn?=
 =?utf-8?B?SkdDbThPZ1NIT2I5TXNEZUNYc3BaZ3ZLdGhkeDJ6Rk10NDlqZFJhOEQzdTVu?=
 =?utf-8?B?Wi9GTTdoOHZGR1F5ZE9wend3Y1NGSnRwQ0k4OW50SVYwdVhDb1lrTGVnS2lr?=
 =?utf-8?B?MTJhWmZMSVEzTmdDSy9TYmZRVUViSTN0aXYrdytZTWp3UkZySnA4MEZDN2Fy?=
 =?utf-8?B?VjhPTTV5UEZtN0g0S3Rkbk9zSHUrK0p4Zm0xSTltbWhHM2xZRnplenNFYS85?=
 =?utf-8?B?cnN6clBnZWtkeDJSc2dMRlc4bkJiWThUd2JkNFVOek5nMjQ2YklqMUFqdjkw?=
 =?utf-8?B?MGdWNFJQeXk4SnVsQUNoL0NXOC9BU0VjeVlob08xb2kydDZBNWRLU2ZNM01C?=
 =?utf-8?B?UGZERFRLeTVNUk9Sa1RHbVFvYUszb2tOWTQ0ZzZISEJFU2w0NWI3ZEhleDBE?=
 =?utf-8?B?MDNSZWRmcVJDN3RtMFcyaVVRa1JNYzBCY0x5eGZWMWNoTy9KMi9jZHZMdmZ4?=
 =?utf-8?Q?AX7gn/NM48+qvcpIVXQSefvxT?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa68c29-aec6-43f0-fc29-08de281b6d60
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:58:59.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAtXHsLer6ASPaugNC9AWod+QFvDp/neRabsutYJU8LsQ1Zzss/hQsDMRDgxmEQUl9FdfHEDijmzG5cu+r9LEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

As the cpu_mask field has already been converted to an integer, propagate
such change to the field that stores the previous target CPU and convert it
to an integer.

Also convert the move_cleanup_count field into a boolean, since the
previous target will always be a single CPU.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/irq.h |  4 +-
 xen/arch/x86/irq.c             | 90 +++++++++++++---------------------
 2 files changed, 35 insertions(+), 59 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 97c706acebf2..bc59ce7c3ffb 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -72,10 +72,10 @@ struct arch_irq_desc {
 /* Special target CPU values. */
 #define CPU_INVALID  ~0U
         unsigned int cpu;                /* Target CPU of the interrupt. */
-        cpumask_var_t old_cpu_mask;
+        unsigned int old_cpu;
         cpumask_var_t pending_mask;
         vmask_t *used_vectors;
-        unsigned move_cleanup_count;
+        bool move_cleanup : 1;
         bool move_in_progress : 1;
         int8_t used;
         /*
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index a56d1e8fc267..680f190da065 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -115,7 +115,7 @@ static void release_old_vec(struct irq_desc *desc)
     unsigned int vector = desc->arch.old_vector;
 
     desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
-    cpumask_clear(desc->arch.old_cpu_mask);
+    desc->arch.old_cpu = CPU_INVALID;
 
     if ( !valid_irq_vector(vector) )
         ASSERT_UNREACHABLE();
@@ -195,7 +195,6 @@ static void _clear_irq_vector(struct irq_desc *desc)
 {
     unsigned int cpu = desc->arch.cpu, old_vector, irq = desc->irq;
     unsigned int vector = desc->arch.vector;
-    cpumask_t *tmp_mask = this_cpu(scratch_cpumask);
 
     BUG_ON(!valid_irq_vector(vector));
 
@@ -221,10 +220,10 @@ static void _clear_irq_vector(struct irq_desc *desc)
     {
         /* If we were in motion, also clear desc->arch.old_vector */
         old_vector = desc->arch.old_vector;
-        cpumask_and(tmp_mask, desc->arch.old_cpu_mask, &cpu_online_map);
 
-        for_each_cpu(cpu, tmp_mask)
+        if ( cpu_online(desc->arch.old_cpu) )
         {
+            cpu = desc->arch.old_cpu;
             ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
             TRACE_TIME(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
             per_cpu(vector_irq, cpu)[old_vector] = ~irq;
@@ -388,16 +387,11 @@ int irq_to_vector(int irq)
 
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
-    if ( !alloc_cpumask_var(&desc->arch.old_cpu_mask) )
-        return -ENOMEM;
-
     if ( !alloc_cpumask_var(&desc->arch.pending_mask) )
-    {
-        free_cpumask_var(desc->arch.old_cpu_mask);
         return -ENOMEM;
-    }
 
     desc->arch.cpu = CPU_INVALID;
+    desc->arch.old_cpu = CPU_INVALID;
     desc->arch.vector = IRQ_VECTOR_UNASSIGNED;
     desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
     desc->arch.creator_domid = DOMID_INVALID;
@@ -554,7 +548,7 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
         }
     }
 
-    if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
+    if ( desc->arch.move_in_progress || desc->arch.move_cleanup )
     {
         /*
          * If the current destination is online refuse to shuffle.  Retry after
@@ -570,9 +564,9 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
          * ->arch.old_cpu_mask.
          */
         ASSERT(valid_irq_vector(desc->arch.old_vector));
-        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
+        ASSERT(cpu_online(desc->arch.old_cpu));
 
-        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
+        if ( cpumask_test_cpu(desc->arch.old_cpu, mask) )
         {
             /*
              * Fallback to the old destination if moving is in progress and the
@@ -581,16 +575,16 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
              * in the 'mask' parameter.
              */
             desc->arch.vector = desc->arch.old_vector;
-            desc->arch.cpu = cpumask_any(desc->arch.old_cpu_mask);
+            desc->arch.cpu = desc->arch.old_cpu;
 
             /* Undo any possibly done cleanup. */
             per_cpu(vector_irq, desc->arch.cpu)[desc->arch.vector] = irq;
 
             /* Cancel the pending move and release the current vector. */
             desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
-            cpumask_clear(desc->arch.old_cpu_mask);
+            desc->arch.old_cpu = CPU_INVALID;
             desc->arch.move_in_progress = 0;
-            desc->arch.move_cleanup_count = 0;
+            desc->arch.move_cleanup =  false;
             if ( desc->arch.used_vectors )
             {
                 ASSERT(test_bit(old_vector, desc->arch.used_vectors));
@@ -656,7 +650,7 @@ next:
         current_vector = vector;
         current_offset = offset;
 
-        if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
+        if ( desc->arch.move_in_progress || desc->arch.move_cleanup )
         {
             ASSERT(!cpu_online(desc->arch.cpu));
             /*
@@ -673,12 +667,13 @@ next:
         }
         else if ( valid_irq_vector(old_vector) )
         {
-            cpumask_clear(desc->arch.old_cpu_mask);
-            if ( cpu_online(desc->arch.cpu) )
-                cpumask_set_cpu(desc->arch.cpu, desc->arch.old_cpu_mask);
+            desc->arch.old_cpu = CPU_INVALID;
             desc->arch.old_vector = desc->arch.vector;
-            if ( !cpumask_empty(desc->arch.old_cpu_mask) )
+            if ( cpu_online(desc->arch.cpu) )
+            {
+                desc->arch.old_cpu = desc->arch.cpu;
                 desc->arch.move_in_progress = 1;
+            }
             else
                 /* This can happen while offlining a CPU. */
                 release_old_vec(desc);
@@ -833,7 +828,7 @@ void cf_check irq_move_cleanup_interrupt(void)
         if (desc->handler->enable == enable_8259A_irq)
             goto unlock;
 
-        if (!desc->arch.move_cleanup_count)
+        if ( !desc->arch.move_cleanup )
             goto unlock;
 
         if ( vector == desc->arch.vector && me == desc->arch.cpu )
@@ -862,13 +857,10 @@ void cf_check irq_move_cleanup_interrupt(void)
         TRACE_TIME(TRC_HW_IRQ_MOVE_CLEANUP, irq, vector, me);
 
         per_cpu(vector_irq, me)[vector] = ~irq;
-        desc->arch.move_cleanup_count--;
+        desc->arch.move_cleanup = false;
 
-        if ( desc->arch.move_cleanup_count == 0 )
-        {
-            ASSERT(vector == desc->arch.old_vector);
-            release_old_vec(desc);
-        }
+        ASSERT(vector == desc->arch.old_vector);
+        release_old_vec(desc);
 unlock:
         spin_unlock(&desc->lock);
     }
@@ -876,12 +868,11 @@ unlock:
 
 static void send_cleanup_vector(struct irq_desc *desc)
 {
-    cpumask_and(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
-                &cpu_online_map);
-    desc->arch.move_cleanup_count = cpumask_weight(desc->arch.old_cpu_mask);
-
-    if ( desc->arch.move_cleanup_count )
-        send_IPI_mask(desc->arch.old_cpu_mask, IRQ_MOVE_CLEANUP_VECTOR);
+    if ( cpu_online(desc->arch.old_cpu) )
+    {
+        desc->arch.move_cleanup = true;
+        send_IPI_mask(cpumask_of(desc->arch.old_cpu), IRQ_MOVE_CLEANUP_VECTOR);
+    }
     else
         release_old_vec(desc);
 
@@ -2003,7 +1994,7 @@ void do_IRQ(struct cpu_user_regs *regs)
                            ~irq, CPUMASK_PR(desc->affinity),
                            /* TODO: handle hipri vectors nicely. */
                            CPUMASK_PR(get_cpumask(desc->arch.cpu)),
-                           CPUMASK_PR(desc->arch.old_cpu_mask),
+                           CPUMASK_PR(get_cpumask(desc->arch.old_cpu)),
                            desc->arch.vector, desc->arch.old_vector,
                            desc->handler->typename, desc->status);
                     spin_unlock(&desc->lock);
@@ -2636,26 +2627,14 @@ void fixup_irqs(void)
             continue;
         }
 
-        if ( desc->arch.move_cleanup_count )
+        if ( desc->arch.move_cleanup && !cpu_online(desc->arch.old_cpu) )
         {
             /* The cleanup IPI may have got sent while we were still online. */
-            cpumask_andnot(affinity, desc->arch.old_cpu_mask,
-                           &cpu_online_map);
-            desc->arch.move_cleanup_count -= cpumask_weight(affinity);
-            if ( !desc->arch.move_cleanup_count )
-                release_old_vec(desc);
-            else
-                /*
-                 * Adjust old_cpu_mask to account for the offline CPUs,
-                 * otherwise further calls to fixup_irqs() could subtract those
-                 * again and possibly underflow the counter.
-                 */
-                cpumask_andnot(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
-                               affinity);
+            desc->arch.move_cleanup = false;
+            release_old_vec(desc);
         }
 
-        if ( desc->arch.move_in_progress &&
-             cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
+        if ( desc->arch.move_in_progress && cpu == desc->arch.old_cpu )
         {
             /*
              * This to be offlined CPU was the target of an interrupt that's
@@ -2685,12 +2664,9 @@ void fixup_irqs(void)
              * per-cpu vector table will no longer have ->arch.old_vector
              * setup, and hence ->arch.old_cpu_mask would be stale.
              */
-            cpumask_clear_cpu(cpu, desc->arch.old_cpu_mask);
-            if ( cpumask_empty(desc->arch.old_cpu_mask) )
-            {
-                desc->arch.move_in_progress = 0;
-                release_old_vec(desc);
-            }
+            desc->arch.old_cpu = CPU_INVALID;
+            desc->arch.move_in_progress = 0;
+            release_old_vec(desc);
         }
 
         /*
-- 
2.51.0


