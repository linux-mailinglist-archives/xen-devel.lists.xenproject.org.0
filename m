Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD0CDD0D4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 20:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193146.1512128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYUj5-0007rH-Tn; Wed, 24 Dec 2025 19:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193146.1512128; Wed, 24 Dec 2025 19:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYUj5-0007pc-Qx; Wed, 24 Dec 2025 19:40:51 +0000
Received: by outflank-mailman (input) for mailman id 1193146;
 Wed, 24 Dec 2025 19:40:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdbR=66=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vYUj4-0007pC-JV
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 19:40:50 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71772e5b-e100-11f0-9cce-f158ae23cfc8;
 Wed, 24 Dec 2025 20:40:47 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA1PR03MB8045.namprd03.prod.outlook.com (2603:10b6:208:595::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 19:40:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 19:40:45 +0000
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
X-Inumbo-ID: 71772e5b-e100-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKljABgmgUiIALbTUnMz5Yg5P5BCqE3kHRPljKVn51QndLvPznKxo4XynplieoJ25eBZyXSZYWgT9FiMB2rvL+miBwU4gpySAXFa64TixU+eqUnkSA8jo1rqF2gaJI7/yxN/nN/BhgMumDCULsvsEd0Nt0C78oFg9jEvtfGSLgutr8Cda6lFaVRPZsNR4Fv090oY2opZOvB1LVj7FGcC82Qj2O0LCCrCmV2W02u+FzlQoyN2v72ZqTu8+sTmR+KtrKjvAfvriALseu84x9qz/YJyHye3m8fuNDPcoAS/nZsFdjRvo7uFFyUDELfytuXNjMfjOntosGIQYxQ8XaMObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+/OaSnO+7dubGjNm/28Rt0UT4bJsYsC3HQ9wqyEhQQ=;
 b=RpMKHJCVdB9XE4SHjy8b84lLdyNbxdBuxK8jihcpHUNOcnnldV/aVDudIq96kdzBKr7aUHjXU/F0HjXgPAdTAI42UfyoBlrYc5MDceJRhddagaOogIfsaQOkWzMq37mz1KFVCMDxZWxtDI8s39z4d76Jkg1tgFEg6RhIJuu7nK/KVwl+bKfEOTuRz2CX8/eowqUhDbTIBCct+n9UrrGo9+0dpgSDvwk/QTlgAMM7I5Cth7q9q/uGjEU/gnzmLD6QKvwcuxg1abC6Jvb7oLqWvITVxjQO2RDREzkXS4Fi8zzcqYzxuOcN6NPhWTxpfQl6rKIG5AEKrRLInrPsiNKRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+/OaSnO+7dubGjNm/28Rt0UT4bJsYsC3HQ9wqyEhQQ=;
 b=fzRf8M4D4+CbjpX6MCuzufs8jOFiAc9N55XiZ+SCvvU5DXOeUFenJc+nr0mU0b6ZYUDT4ja3CQodksUr07K7WfQ+D2BSsWrz6cbbmKDa39OCjuAHAXUdBKz2WSTLiy8w4mpRgI98G8QZw14AfbJBgQQHWVF9Ynr37sFg4VVTc7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] xen/mm: move adjustment of claimed pages counters on allocation
Date: Wed, 24 Dec 2025 20:40:34 +0100
Message-ID: <20251224194035.60173-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224194035.60173-1-roger.pau@citrix.com>
References: <20251224194035.60173-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0010.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA1PR03MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4c420f-3bb6-4374-eab8-08de432454bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c21yVm9Zc1YraU9WcUIranB5ekpRVkxaRDAxWDR3TXUrbEFPMng2UzdCcDkw?=
 =?utf-8?B?NkdpRjdub3NrbHRWdStsVVBDejAvMVpiRGxTL1FGNk1IbW5oOXhVYnJwbmxl?=
 =?utf-8?B?aFdhVTJUY0hrWXBwWW50bW5iNlBHRmovdU1mQjBWYU01aEk1SXd2ZnhVeDNJ?=
 =?utf-8?B?WVZ4NnFHWklwOGk4c3hHQkNGeHh3Umd2Mld6UVFyT2V1RjJpaENXVlhiVm5j?=
 =?utf-8?B?OUJBdDl1VFdkd1FjT2VMM0tYQS9URUkydEZvM2E4N3MrdFJtdHl3K3BGSHlW?=
 =?utf-8?B?Z2w5Y0RBL0FqRVM2TThsVmVNN3dYWmFGTlEzUzhFd0Z4RWRPbzBKbEVQQ3Vx?=
 =?utf-8?B?T2NvdDJOM0dtd3JrQ0lkZ0lYQXdpQWxLa1MrMjYwdmVlVFNuWmFhS3p3cEFp?=
 =?utf-8?B?UnFDRDBlMjhlMEV2QUVvalZLcXUxaFg0OXZvdGRXRGZEcGFpQklxT0ZJOVYy?=
 =?utf-8?B?TndiNjJEQ2RTMXNUTVNRejJET3liN3V2cVZxU3ZBcmxpUVdVOGluayt5dk1t?=
 =?utf-8?B?Z2owZUdsWHcrMmNDUW5CalNTZ0xCV0c2YXh6a1oxVEI1aHdUM1BaUE5KaVhE?=
 =?utf-8?B?cnRYZEUrakNzbmo0eENtRGpjQXBRMnkxMUxmRFZCbitWVjFRTUV4ZHZKZlZY?=
 =?utf-8?B?RWxZL1pCaHEveEJQUzNaUmRlTGRkOFVJemdyNDlMNkZad3dkTk5LQjA0L1FD?=
 =?utf-8?B?RW5IcGJ0eFkrU2xnOU9jMldCOXdUd2tGdCt3UnhiUGhTNFBBZlpPcXgzeGk1?=
 =?utf-8?B?c3JReDN3ZVh1U3BVV2JUY2U5YUl2Y0Q3UGJFNVB0MGc1bm1HbnZCMGYyUWdF?=
 =?utf-8?B?YXVCVENVVXZ6ck5SVFNXNmQ0d1pUOVJKVTNlVktVaVhGM2ZLSUJhRmRVbUkv?=
 =?utf-8?B?ekMwTFlPWHpkbHRHZ2hCaVNHcmJkSmhXOHZFb1RHQnNnTHVVdmczTEZaTFlC?=
 =?utf-8?B?dzNmQzlRV1phZEpZM3pJampmUlNzM2gzSEZlTW1SMld5cENsd1FnTlhyLzg1?=
 =?utf-8?B?N21BenNHdkVUSkRLZ3Ztd24xajd6VjdJOThicnRhcWIvdXRYQVA0Q1hkc041?=
 =?utf-8?B?RVQ0MzBJdmVZQlRXbWZBdjlUR091b0ljNmtwQUIyTnJWMnBlWmE4Y0NoL0Ew?=
 =?utf-8?B?ekJELzdLZGlFTGE4VGk1dHVDcFozQk16MHl4VzdJUkxKbkZQSjhyRkMvNmVj?=
 =?utf-8?B?QzM1aE90L3p5VHMzbzNHeUZwMEFmd0NjSEpxSGw2TFR5UzJHSkhGdS96YVpT?=
 =?utf-8?B?WG5iTm5NUWZuQktiVEI5Z2xZT3ZVazRSNUJuUzZ0ZmZ1UHZFeVl1MzM3RkdV?=
 =?utf-8?B?eXliOEVTUzdDN2JPaTFzc0ZOSnVMTFFEdzlSYktWdVVDYlR3NDQ2NVFjdVdt?=
 =?utf-8?B?RXdYTjFQUVNJaGIySjczc29PWkNKMWtndEU4ekRhY0drR21WSUlRSk93K2lJ?=
 =?utf-8?B?OGJnckoyZlprSlJybjEzYWZyTDlRcXR2MFppWWtWSnF4TzRaMjhpYTZLTEVG?=
 =?utf-8?B?VElNeDVuR24xQkJpZ2xrRFBtQklkYUZ2QUo3dUJBV1JDdWQrTDRtcFRmMmdK?=
 =?utf-8?B?dWdIUXJ2SWdaeVlGNWFKZWw1VFRHNWNIWU0rVGdWa1VTLzl5dHBMdVNyMUNi?=
 =?utf-8?B?cEFpQWF3aGYvYW13VFZDMyt3UmZXSVFYVzNTWHFOVnBmMXhIaG1NdE9TT2dH?=
 =?utf-8?B?WVpOOGErMk1XRUJNL09jTjQ0UFlVa3pvS2dXeTU4cXR0dVQ3bGp3RWlPdGo5?=
 =?utf-8?B?TktzL1YrT3MrZ1ZWbEhvOEJva0RwS25SVlFhMzVKWVIwY0l3akk2am5idGcw?=
 =?utf-8?B?dFlkbUQ2YlF1K04vdFlDeXNTM0ZkbWpxblRiZ0tvSHpubTNXV3RBdk56cGFH?=
 =?utf-8?B?WHNTUjB1am5ONlg2ODFjakxhMmZxOTRycW15ZzRVZUpOTGpHZ2NDRVFIdnhS?=
 =?utf-8?Q?PXW9WrNK2pTz4xU04i2PpI9wC/kqm3B+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNGZ3R0aXN0QXRoZ240TFpiZ00rblRYeUk0THpPOUx4WHFyREk2eU9HK2ww?=
 =?utf-8?B?d0NPUG9wa2t2SDBOOVZFL0tDaGdaM0U3SFp1Z1ZZV0pLa0RIajdpYXZNWVRN?=
 =?utf-8?B?VXFHeDRtYVNmL0JMVGQ1K0NwR1p4T0dSRHBsQjhsVFd0WFF4OVA1OXN3OVls?=
 =?utf-8?B?Vi81VVJhRHlFMThVNktWNHd0dlZNWWdyd2V0djVxRkZtNHU2Yi8wb3VYVFlY?=
 =?utf-8?B?Ri9SMk9hQTRYSkNOSjZ0djN5QnBZcWpUZ3RmaWoySlc2TXRqVTdRcFRsdXpm?=
 =?utf-8?B?ZFRxVjhMS2VtM1VzbnZIdlF1RUhKVFg0UGFTU2NZY251NmdCZFlSNU1oMEN1?=
 =?utf-8?B?QzREMFJhWWpPWFd5MFR0SlF4Um80NHhHaVQ3d2J5K0Q2RU42RlZES1hwbHdZ?=
 =?utf-8?B?NHVpR1RkZlhXZGxDQitsYXB0eDhPdmN3SWxITHNuYmVDY1VrSS9GWDhPRVcw?=
 =?utf-8?B?d1hYZm4yQzRvY1ZFRk8vNzdhNWFPRDhXY01KMkFOL1h0Mmd3d3NpcGsrR3pq?=
 =?utf-8?B?cStqY1JQQS9XbTYyNmJPbzY4ZUNzNzhKNWdTSmp5M3hHTUc0OUdPZzZQb25B?=
 =?utf-8?B?SURNYStFT2YzU3c1azNXV2VZQ0EwY1ZNSk83STJVUmhBUVg2SWJRUXhoYWts?=
 =?utf-8?B?NHgrdDdqalZRSjBsTGFwYW1XOFBtcGxrU1g5V01JRWRjMERBNHhBTmpBR0E4?=
 =?utf-8?B?NmpUcnFId3lWaE5RSTZZcVhhRjVsdllkcGloUU5Bb3pBUDRSOGlUTFNmdEYw?=
 =?utf-8?B?elhldyt6TmFUL09KUjZMWFEzSnpBM2oreTNWQ0tRTDc4b0pDTFFndWhnMi9R?=
 =?utf-8?B?RGRLaGFENHV6TTFROWtKYjlNUXRCQnRpQXNycmxsNDJRckJtZEI4T0l4dTZP?=
 =?utf-8?B?RzV4djNJMzZibWNUWSt1ZTMwQWZoQXBCU2p2b0FWTkpKZ1plUmVyM2VZWUNs?=
 =?utf-8?B?MkgzY3p3VTRkY3c4c1FnNksxbi95N0pmbWhrd1ZvMXdFSGgremJTa3l0K3R5?=
 =?utf-8?B?VWt4akg4bU9VSms2ZzJqRTdTa3RJSUpwOXkzcUpuckhEQ3pWVjNKblF1VmdO?=
 =?utf-8?B?MjM3NmpYVnJwNFFKdFg2aFJFREFiQTFNQkk3eTdFdi85TksrUVRGY3hNbkJt?=
 =?utf-8?B?a3JGYm9KOU00ck5tdUMrTHpwRWJsSHdxc0U4S1A2TUZzeVpiYzAwSlp1SUVo?=
 =?utf-8?B?ODNTTG1BYUxjWjh6V2Mvb01DVzNubTQ3ODhXWFRBaWtTaFJLOTZWR24yUUxM?=
 =?utf-8?B?Qm9hbkVCY1g3NFVFamJOS0VrSlJCdkdoblVGKzlSUWhJcjRNVEJWc3VSaEUx?=
 =?utf-8?B?czl1L2gzM01CbWVtQUk1QWdOU1kxZVdhNjJ4NWV0YWtNRmRxeHM0empSOTNG?=
 =?utf-8?B?bHdFeHVJa1g5aHUwZm9jRXV4TklCL1kyc05XVkY4SWYwTW5RVWRobmN2TjFV?=
 =?utf-8?B?cTJaV0s5d3FSajh5Z1hMT2c4dFY2cm9uVnNHbGhjdVJSWWViaFArdmROSkow?=
 =?utf-8?B?K2VmL2dIdjYxOS93cWtRNUdEbERBNmlvV3JEcmxnTm1Dd2E1K05OOGJuOE1a?=
 =?utf-8?B?RU1yQTJOUy9jK3o0NFhUWDFNOU5WUDROYzZybGlzb2QrcUhIbU94SHp6QVRS?=
 =?utf-8?B?MjBmcVdwcFdhdC9XV2NURUlkNHN3Z1NaV1pGSW4vWFNjVnlKYjEyTWg2TUll?=
 =?utf-8?B?NThsT0trOU9hbGFiR3VNNkM1dXRLcUZBM0M0NWdsUnVUM3FhRVcrT0N0Mkdk?=
 =?utf-8?B?ZTVSUTY4cGR3Rm4xYk9nU0NKVXRKbWtXOXZjeTZTL0F1NmNXdm9NemxaLy9P?=
 =?utf-8?B?S1Ntd2tnTUtNTENGWldOdkEwNnVuc2ZISTJBbnBPbGVWSGhoVGkva1NRTTJQ?=
 =?utf-8?B?MzJ0OWE5aThjUkVVbGozeWk5dWFrZExnQjgwYkM5ZW1vMjZ0bUJqejBadWJK?=
 =?utf-8?B?WlZtV0lVWlhHODNqaGZGOERPcjhIZC9nN1ljaHRkdHk5UnYvcTM0VTVmeEVV?=
 =?utf-8?B?TlRuWEk5TUM0RlRXend2UkQ3Yy9CdTFveE9sRHc4SzZIc1FIWXhBM0FiYUo2?=
 =?utf-8?B?TzVsd2k0THlvdU01V3pLWnJPZ0FhL29tWFR3cGZCUEM1Y21VSjFFb2YzVWs5?=
 =?utf-8?B?TVVpcmZMOWZoaG9oRmJoY1ZiVk10M0t6eHhySHVFSTJqTVZqQ1o1UlVzVjdO?=
 =?utf-8?B?MVM4bWtGZEpTeEVNTXlSeWt0NUtQNjFNV0hkWmdYM3ZZVFptUGsvNDE1aU9x?=
 =?utf-8?B?WjlIbWVXK3NpZnlESVZkSDY3RjMrM0RUWUZGT0Rhc2FsODVVU0pyM3p3c25B?=
 =?utf-8?B?bmJPNUxlWlpOeHJwVlBOZHpEMjVWVUxLN0tkTEl1d3pJZ08xUG9MQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4c420f-3bb6-4374-eab8-08de432454bb
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 19:40:45.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JftJmo69iOimiHvpQ357kOW3PT8iQHJAlBMbca75rFD1GcWjbonUWauPKf78SOOYbUQuqRApNlsTy1kX0f9+hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8045

The current logic splits the update of the amount of available memory in
the system (total_avail_pages) and pending claims into two separately
locked regions.  This leads to a window between counters adjustments where
the result of total_avail_pages - outstanding_claims doesn't reflect the
real amount of free memory available, and can return a negative value due
to total_avail_pages having been updated ahead of outstanding_claims.

Fix by adjusting outstanding_claims and d->outstanding_pages in the same
place where total_avail_pages is updated.  Note that accesses to
d->outstanding_pages is protected by the global heap_lock, just like
total_avail_pages or outstanding_claims.  Add a comment to the field
declaration, and also adjust the comment at the top of
domain_set_outstanding_pages() to be clearer in that regard.

Finally, due to claims being adjusted ahead of pages having been assigned
to the domain, add logic to re-gain the claim in case assign_page() fails.
Otherwise the page is freed and the claimed amount would be lost.

Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Regain the claim if allocated page cannot be assigned to the domain.
 - Adjust comments regarding d->outstanding_pages being protected by the
   heap_lock (instead of the d->page_alloc_lock).
---
 xen/common/page_alloc.c | 88 ++++++++++++++++++++++-------------------
 xen/include/xen/sched.h |  3 +-
 2 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1f67b88a8933..b73f6e264514 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -515,30 +515,6 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
-    /*
-     * can test d->outstanding_pages race-free because it can only change
-     * if d->page_alloc_lock and heap_lock are both held, see also
-     * domain_set_outstanding_pages below
-     */
-    if ( !d->outstanding_pages || pages <= 0 )
-        goto out;
-
-    spin_lock(&heap_lock);
-    BUG_ON(outstanding_claims < d->outstanding_pages);
-    if ( d->outstanding_pages < pages )
-    {
-        /* `pages` exceeds the domain's outstanding count. Zero it out. */
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
-    }
-    else
-    {
-        outstanding_claims -= pages;
-        d->outstanding_pages -= pages;
-    }
-    spin_unlock(&heap_lock);
-
-out:
     return d->tot_pages;
 }
 
@@ -548,9 +524,10 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     unsigned long claim, avail_pages;
 
     /*
-     * take the domain's page_alloc_lock, else all d->tot_page adjustments
-     * must always take the global heap_lock rather than only in the much
-     * rarer case that d->outstanding_pages is non-zero
+     * Two locks are needed here:
+     *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
+     *  - heap_lock: protects accesses to d->outstanding_pages, total_avail_pages
+     *    and outstanding_claims.
      */
     nrspin_lock(&d->page_alloc_lock);
     spin_lock(&heap_lock);
@@ -995,11 +972,11 @@ static void init_free_page_fields(struct page_info *pg)
 static struct page_info *alloc_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi,
     unsigned int order, unsigned int memflags,
-    struct domain *d)
+    struct domain *d, unsigned int *claimed)
 {
     nodeid_t node;
     unsigned int i, buddy_order, zone, first_dirty;
-    unsigned long request = 1UL << order;
+    unsigned int request = 1UL << order;
     struct page_info *pg;
     bool need_tlbflush = false;
     uint32_t tlbflush_timestamp = 0;
@@ -1012,6 +989,7 @@ static struct page_info *alloc_heap_pages(
     ASSERT(zone_lo <= zone_hi);
     ASSERT(zone_hi < NR_ZONES);
 
+    BUILD_BUG_ON(MAX_ORDER >= sizeof(request) * 8);
     if ( unlikely(order > MAX_ORDER) )
         return NULL;
 
@@ -1071,6 +1049,28 @@ static struct page_info *alloc_heap_pages(
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
+    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
+    {
+        /*
+         * Adjust claims in the same locked region where total_avail_pages is
+         * adjusted, not doing so would lead to a window where the amount of
+         * free memory (avail - claimed) would be incorrect.
+         *
+         * Note that by adjusting the claimed amount here it's possible for
+         * pages to fail to be assigned to the claiming domain while already
+         * having been subtracted from d->outstanding_pages.  Such claimed
+         * amount is then lost, as the pages that fail to be assigned to the
+         * domain are freed without replenishing the claim.
+         */
+        unsigned int outstanding = min(d->outstanding_pages, request);
+
+        BUG_ON(outstanding > outstanding_claims);
+        outstanding_claims -= outstanding;
+        d->outstanding_pages -= outstanding;
+        ASSERT(claimed);
+        *claimed = outstanding;
+    }
+
     check_low_mem_virq();
 
     if ( d != NULL )
@@ -1518,7 +1518,8 @@ static void free_color_heap_page(struct page_info *pg, bool need_scrub);
 
 /* Free 2^@order set of pages. */
 static void free_heap_pages(
-    struct page_info *pg, unsigned int order, bool need_scrub)
+    struct domain *d, struct page_info *pg, unsigned int order, bool need_scrub,
+    unsigned int claim)
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
@@ -1553,6 +1554,12 @@ static void free_heap_pages(
 
     avail[node][zone] += 1 << order;
     total_avail_pages += 1 << order;
+    if ( d && claim )
+    {
+        outstanding_claims += claim;
+        d->outstanding_pages += claim;
+    }
+
     if ( need_scrub )
     {
         node_need_scrub[node] += 1 << order;
@@ -1842,7 +1849,7 @@ int online_page(mfn_t mfn, uint32_t *status)
     spin_unlock(&heap_lock);
 
     if ( (y & PGC_state) == PGC_state_offlined )
-        free_heap_pages(pg, 0, false);
+        free_heap_pages(NULL, pg, 0, false, 0);
 
     return ret;
 }
@@ -1918,7 +1925,7 @@ static void _init_heap_pages(const struct page_info *pg,
 
         if ( s )
             inc_order = min(inc_order, ffsl(s) - 1U);
-        free_heap_pages(mfn_to_page(_mfn(s)), inc_order, need_scrub);
+        free_heap_pages(NULL, mfn_to_page(_mfn(s)), inc_order, need_scrub, 0);
         s += (1UL << inc_order);
     }
 }
@@ -2452,7 +2459,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     ASSERT_ALLOC_CONTEXT();
 
     pg = alloc_heap_pages(MEMZONE_XEN, MEMZONE_XEN,
-                          order, memflags | MEMF_no_scrub, NULL);
+                          order, memflags | MEMF_no_scrub, NULL, NULL);
     if ( unlikely(pg == NULL) )
         return NULL;
 
@@ -2467,7 +2474,7 @@ void free_xenheap_pages(void *v, unsigned int order)
     if ( v == NULL )
         return;
 
-    free_heap_pages(virt_to_page(v), order, false);
+    free_heap_pages(NULL, virt_to_page(v), order, false, 0);
 }
 
 #else  /* !CONFIG_SEPARATE_XENHEAP */
@@ -2523,7 +2530,7 @@ void free_xenheap_pages(void *v, unsigned int order)
     for ( i = 0; i < (1u << order); i++ )
         pg[i].count_info &= ~PGC_xen_heap;
 
-    free_heap_pages(pg, order, true);
+    free_heap_pages(NULL, pg, order, true, 0);
 }
 
 #endif  /* CONFIG_SEPARATE_XENHEAP */
@@ -2656,7 +2663,7 @@ struct page_info *alloc_domheap_pages(
 {
     struct page_info *pg = NULL;
     unsigned int bits = memflags >> _MEMF_bits, zone_hi = NR_ZONES - 1;
-    unsigned int dma_zone;
+    unsigned int dma_zone, claimed = 0;
 
     ASSERT_ALLOC_CONTEXT();
 
@@ -2679,12 +2686,13 @@ struct page_info *alloc_domheap_pages(
     else if ( !dma_bitsize )
         memflags &= ~MEMF_no_dma;
     else if ( (dma_zone = bits_to_zone(dma_bitsize)) < zone_hi )
-        pg = alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags, d);
+        pg = alloc_heap_pages(dma_zone + 1, zone_hi, order, memflags, d,
+                              &claimed);
 
     if ( (pg == NULL) &&
          ((memflags & MEMF_no_dma) ||
           ((pg = alloc_heap_pages(MEMZONE_XEN + 1, zone_hi, order,
-                                  memflags, d)) == NULL)) )
+                                  memflags, d, &claimed)) == NULL)) )
          return NULL;
 
     if ( d && !(memflags & MEMF_no_owner) )
@@ -2701,7 +2709,7 @@ struct page_info *alloc_domheap_pages(
         }
         if ( assign_page(pg, order, d, memflags) )
         {
-            free_heap_pages(pg, order, memflags & MEMF_no_scrub);
+            free_heap_pages(d, pg, order, memflags & MEMF_no_scrub, claimed);
             return NULL;
         }
     }
@@ -2786,7 +2794,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
             scrub = 1;
         }
 
-        free_heap_pages(pg, order, scrub);
+        free_heap_pages(NULL, pg, order, scrub, 0);
     }
 
     if ( drop_dom_ref )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1f77e0869b5d..d922c908c29f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -413,7 +413,8 @@ struct domain
     unsigned int     tot_pages;
 
     unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
-    unsigned int     outstanding_pages; /* pages claimed but not possessed */
+    /* Pages claimed but not possessed, protected by global heap_lock. */
+    unsigned int     outstanding_pages;
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
 
-- 
2.51.0


