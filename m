Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B7A8B70E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 12:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955504.1349264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50Fi-0008C5-4x; Wed, 16 Apr 2025 10:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955504.1349264; Wed, 16 Apr 2025 10:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u50Fi-0008Ad-27; Wed, 16 Apr 2025 10:44:22 +0000
Received: by outflank-mailman (input) for mailman id 955504;
 Wed, 16 Apr 2025 10:44:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsD+=XC=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1u50Fg-0008AX-I8
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 10:44:20 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfd844ca-1aaf-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 12:44:19 +0200 (CEST)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by AM9PR03MB8009.eurprd03.prod.outlook.com
 (2603:10a6:20b:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Wed, 16 Apr
 2025 10:44:17 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 10:44:17 +0000
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
X-Inumbo-ID: bfd844ca-1aaf-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Grsy6YyQ5cT8pE0PlQVDXT+VBFFBoaPKsLlAmyjt6Va2siQDWmpSjo34FhFqtpCK1IXW7lRLJjKqcam5v2UaFO0RiCWGKWgqhDjKCYV84tP5F1wNZC6+ti+Mzfg/Yb102mlOysONDbmz65Yd/WLQJjkecVBkeuTFz8BX1LWRLuyqq93c7FAAfs5fTx53/G2B/dJk2qGCGfp235TPuPwY6pg23dz+faEbPj4fxLHhzvPZ20/Y+SE6p4R/5l5SyuHBPjiKIiCcGjOaqJGOGstyo/IrFFr9Fz7zwV/XZ7P3g3q64biczdBjeRTRQI64eA+3ZDX+qby4Y4SB3C5N2XK70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6O72mmPpn6wz0QsBJK+VKv7oc9K5Gdtio31aQecTo4=;
 b=HObTeuOF9njo3GMkuRzwevXBGLOzTuIIGIiyfeo+zLHe8eTVJliue02ig/afpr2Bd+G7mGhX2m38k98y9PMtdzj1oHB/Q0HI+TSif4sDnjT2NL7TP+nthrtuIKS3d8JQGYlWu2BBqMqJZl1NmHiE27dpYz7BXzy/gklqkLER4qoixOD4i9jKJ2UjNHTXU0TmqQkUjTuHiAUjkzcKEedIdUYUVvXMD0rbxYeMuOCUpAjht9rnCQvm8akHcmIKorvK9Ec7FtNXPfyVfVvurgCbLbg1WDXrOYjyfdsFbAz9Nw6ny7i9DWWYbcZQxTgSFP+YQvG3MezB57H21iDAKdtjjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6O72mmPpn6wz0QsBJK+VKv7oc9K5Gdtio31aQecTo4=;
 b=ccyeWoyqVNX/FoaN1WpGClycqPF6LFKx92F7lMbgWntwGcuIqaZ0j8xxdUsTXLfJaulpF42f0b241Pt3cuYoyxrL/e32/WQtzTEfN/tPr9xyM6A00Bdy9xDgl7o2cBg2j+k+YhfOSlmYzDmeaNEhaC/aOsQgign92A+BwpNvw3hcyAkrhdMemZYn7ZGZPw+27PVC7H7L0GdshkiMYZYs0Ti7QoRnT39BS0qeI3R1+/M7Dh1BE8qTNRaONiHCzlTO5nELXUUado1MsSNNbLbt+lE1v8vXis4JKUs+5xKgx4319DtGNYc+v45EVaApM8KdcY8zTBMSg1kLxTkvBY/diQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <c0a5ca22-fc42-47fc-b1b0-358992014454@epam.com>
Date: Wed, 16 Apr 2025 13:44:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] uboot-script-gen: fix arm64 xen u-boot image
 generation
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414081223.1763630-1-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2504151758170.8008@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <alpine.DEB.2.22.394.2504151758170.8008@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB8919:EE_|AM9PR03MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: f92367ae-a405-4d66-2071-08dd7cd3a315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXBuYUNIKy9DUS9XWFUweGJvRUxrMSs1L0RUUG5zcnloSmQ0Z25rQ2FrNHRm?=
 =?utf-8?B?UDkyem5kQzFqR2F2eUJiOHVHVHZDeTBDc09Ma3FOblpjbGlZZlhaVDRJa3dL?=
 =?utf-8?B?UVJEZWdrVFhaVzdFYVlpTmxZY3oxUEhVYllGV3pncWVic292QTIyYTNLaWZi?=
 =?utf-8?B?TFA2cVo2MGRSNGtDc0UzZmJlU3V2TGVJcDFnUXJkU2VmdEdETjMrYWFwYk5s?=
 =?utf-8?B?VFhyWEprdGN3Wi9ZamxZaktwZisxMVNGLzduQTJXejNmVG85WlBrRzgvb3M2?=
 =?utf-8?B?YmRtbVBIWEFDemV2MHdlZGZVa0hNQy9SeVRtcGgvcEVtcUhHVnNnMHg0L1Mx?=
 =?utf-8?B?SFRKeVZCdkFlbjVhd1lpUlllUTY0cVJzdDJja0JzU3dUTzkwYVpDVFNKbzdU?=
 =?utf-8?B?UVFtMnEwMmtsWHZTbWRxdE03anQ2QXNVMnBXUDhNdktYUlRZVjlxeDJIYXkw?=
 =?utf-8?B?UktITlZBcE55Z0Rad3BYU1kvcGhiek45cmtFTXA5MDNNeFJxYVhrVHprM3FO?=
 =?utf-8?B?Uk1VOE1jajZYMmJFSDhrWno3NmhpWllDUmk1OWhsUkVVZTcyeDJnYTZPQ2ZD?=
 =?utf-8?B?cjdmWFo2L3FvWVVtRjFrT0pQOVc0Q1ZTTXNYSEF1RmhlZE5oYzNxVTlyZHRT?=
 =?utf-8?B?MGljL0Y1MXAva1BvN2NDUi9EMDZLTDJ2blpISkxRTmE1b1ltajhub2lLKzJK?=
 =?utf-8?B?QjBPWS9za0lZNS9BcU5XWGlCNUFsRE1ZQlpYZDNrZkR5VHU3cFVUaXduMzZP?=
 =?utf-8?B?ckRwaGtVb1gycit3dVgya1FXWUN2OTF1MFBkeUt1V0JTRHMzTXZhcmlXQkc5?=
 =?utf-8?B?aVhPaThPK3NKUWV3OXFIZklmcUJrSHBpZ0U2dXpNWGU4aTZJOVNUZ2dxSnlm?=
 =?utf-8?B?VFpDNE5PVWIzQXFPalhpcFNCUDZ2b0dJTHF3M2R0ajFHY0kyb0dRMU1LK2xt?=
 =?utf-8?B?b2paT1lGRkl0d2RsakpjSEFoYzU2bTdSemF1SmRDSDNjTGJrcHdKQ1E2V0xE?=
 =?utf-8?B?amR2dUU4SDd5c1hpUGcvR0JWZUVaNjRiMWtCenZNcUNwdk44MnkrU2xGR3ZP?=
 =?utf-8?B?SElZY3BYdjRCRjl5K3YySk8raG43aHI5eE9WendZb2VTRXlBbHhHNml0SFZz?=
 =?utf-8?B?UEcwT1FHOXF4UUh0QzVwdnZDWGFwMVpMcDBOTE9wTkM5NFA4SElIc0dBdGQ0?=
 =?utf-8?B?Sy9GV09EQ3l2eXVzNStWaTk1d2ZuMGNPSHovMTZGeXdLN2hxcjZGUDBiTEg1?=
 =?utf-8?B?bVc5WkRpeGlKdmpITmpsZ0RwRjlSMkt1djdYV1RnVSt4R1dQdVNoQWRxZHo4?=
 =?utf-8?B?WGVzYXk2ZndXU3MzWUl4bnB5MnhnZTUwZWU1eC9qdUpKczJjZ3BMeDBZa1FD?=
 =?utf-8?B?cGFOMExlNDB2dEZ6elNlcEFNZmk4T0tMbkdpN281d0ZHRmZvenA3R09FdXBy?=
 =?utf-8?B?Yml5aEZOdEx1b1pKRFU3bEdBbVh0VkZlYkx1eGdTd2RhUDM0S1YrZUw5Unls?=
 =?utf-8?B?aW12MHJ1cUtTM3p5dUtWV3pMUzgxSDRiMzNKQkQ5Qm5ETG55MCszTEIvQ2Zl?=
 =?utf-8?B?N0ZSMEVWbVJyaU5SSXVZeWx2NisrR1ZITzMybDdWeHp2R0hRdG0yaU1wQ1pG?=
 =?utf-8?B?dzN4dHZueEg4L25CcWRjQjVsWjFQQWFieGtDdENnTTdlaU9pQ01SbGRwN2Zl?=
 =?utf-8?B?ZGlrUTd6MlhEaUxhTGc4RzFGVG9PSUxBUXdLK29iUXFNWDdBdW9RZFpsNXpu?=
 =?utf-8?B?a2JKbzB6K3h4ZW5qdXkzZDEvVFhWQ2hna2hETEFZUXVuLzBBeVQ5VDhmUzhD?=
 =?utf-8?B?Z3NaNzg1UUVXOVpob01EaGJyQ0lvcDFlaGhkQWNOajIzNUtFSjlsVUU4VE1V?=
 =?utf-8?B?NVZ4ZW5WN2VYdHExZkhpSVlpZ1JUaWJuMmcwZ1l4WWxPS3ZqclJPUFkzb2k4?=
 =?utf-8?Q?pOuZLGGMyUY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHJ4WlpGR3o2dVNZZmVvVUhMTUdYelVBbmkwNHozamIxSkVNSUI2S1l2Sm8w?=
 =?utf-8?B?VC9mcnNGZUhJdjE5eG1hQ2JrdlhQaTBTc1N1QUFRUlkvSEcwWFRidkpYT1c0?=
 =?utf-8?B?WTVsdjZoYXQzLzd6RlpZV2g5dHk4NmFmZElKUmQ4ZEhUM2hjZ3BFdUdGbVhG?=
 =?utf-8?B?UkNvenhMOE05NC9Da3F1SGxvSnJUS1NCRTFrMkNsY0lFV3dCRyszbDRtYVE5?=
 =?utf-8?B?NjI0dXo4emZvb1ZKb0RmL3BQM09peTNjWnBkZHlnSm1oTGxGNmN4TVlhRW44?=
 =?utf-8?B?dXg1dEExekUxUVhCV003S09EQzZYNkZwNGN2Y2YzNURxMjBGM1kyeXA2VXJ4?=
 =?utf-8?B?YWJWN0V4TFpvTkcwdkt4UThmVERlUE5ibUYxcnRySzM1SHA0RlZ6Q3pDZ3Ry?=
 =?utf-8?B?S3piZ09XNDZXd1V5M3c1MUE0WXY1NFp3V1l0Tk5WWTh4RHBhbmpoOWZwZTQr?=
 =?utf-8?B?SnpPRGxGLzB6b1lTbTN2MDAxZStMMUNTVzF3Y2lUamo0ZVJYcFV2b3JQWmg1?=
 =?utf-8?B?aW5LQzNYQ3VFNTNrNkxMRjgrWnZhVHlpQmdoV2hKS215dHBVNXFjOWhZM0wy?=
 =?utf-8?B?RWVKeFdaa2Nqck1LVzRoQmp6UU9WcXNtS0Z0SnNkMHYzWU5jL3BNekpIM3hX?=
 =?utf-8?B?OEp0Y1JjYUkxNDFpc01MZXRVR3l1R3pQTVJWSVA5LzdHN3p6bUhpYXh3d3A1?=
 =?utf-8?B?M2t2N1NHaXZMeEVYUjhKeDRqVWh0MUtqNUJ4WFplaFJsZUVOeVhva0J3YXNr?=
 =?utf-8?B?Vlk5SWhnNGY4UXZ0enNtdlpZbm1tQk0xa0dGRVdMOTV3b0xlQXlWUDVhOFE5?=
 =?utf-8?B?bnlPV2hpYW5IVFRpNHVsS3ltTVV3TlR2dHhzT3RuKzhyRFpEK0NkZDhtSTFw?=
 =?utf-8?B?OHVVWDhyTWRTS1ZNS0V1cG42d09RMDhIcDVoaHRGbnpHK2oyV0MvYURadGxO?=
 =?utf-8?B?YUJOL2cySnBzdFpqTmRhNVBrcTZTaUJsbE1oQ0VFZnlicjU1VkIvRE90ZDgw?=
 =?utf-8?B?WW83YS9mUWx3aXZtQXFJemhjSDUzcEhIVVVBcFl5Mk1ZREgyK3JSVk5ydmRp?=
 =?utf-8?B?dVJFZEw4dFNKaHYvamdKNnVMY3ZsZVlRcWZydXdybmlidGlUeFA0dWt1M2Qw?=
 =?utf-8?B?QVVoT1NQM0FKalVhT3FabkR5V2cyTHhzVVovbFhBV3JNb0NEZUgzQ0ZUay90?=
 =?utf-8?B?TDB2V3h0ekxJS0s2VHpTWVJqczUwSy9kWnJQN1FVc2J1ZmJKZUloU0lkNUU3?=
 =?utf-8?B?RDVURUVVcmU3VFEvc2RGcHNCTzhOQmZYbS9aUlpGakdFT1h6QlZ2MUkzM1RE?=
 =?utf-8?B?NU16TjlRVmpUUU15YjRGT25KOXpJOHdVNklSeGNSOEFqcmhYd3RTQ2pOdjBN?=
 =?utf-8?B?UWtkcXkxRXpraTZuT29qdVc4RmgxOEpnSFV4VW81dHZKeXgwc1FDQnhodG1t?=
 =?utf-8?B?SlpQRTE0Q3dSRFdvNjNJdGdUazZ2ZlE4OXVWbnZCMnlMSmNJNHZCV3lxcTFB?=
 =?utf-8?B?SFcySEMrQmpNL3Z5dE1PQVNRR3NpU2lBOXo5UnVKSzkxK2hJY3ZDSVI5NE5N?=
 =?utf-8?B?b2hMUlM0NVBtTGlXSW4weFlXQjNLaGpFQVdWVjdyUnFvWldNVkhWZitVVE5Z?=
 =?utf-8?B?aGZPS0dLQ2V1bUxBNDZKTTRvSHR2OVVrRXlraGsxcWY1Vnh0dnJxbUI3Ky9h?=
 =?utf-8?B?c1VRSWtCa3hpMTBnOWdMUk9aUy9yMjJHS0lhY1BNdjhSd2lrK0NLdSt3RmVz?=
 =?utf-8?B?RkxPMlJ0QnplTHBmRFYrRURJSGRSTG1sNmk1SFNZK1BCVm8xUldTWCt4Szhi?=
 =?utf-8?B?cmJkL3dGTVVJNWZkVzRGYytJaGt2ZXJSRlJ6WE9zVHBEVE9SOTZSOU0xeU5q?=
 =?utf-8?B?NTZMTGhDb3F2bmxtU2I4Uk9Ub1p3Q29yVUV3VjZXcjZ2UTNGZHIzZ2J6ZUZv?=
 =?utf-8?B?ZkF0dmFka2piU3l4TmtsMGJIL1FmbEN6Nms4U3Bmc01oUTg0RERWOUVaT2Jy?=
 =?utf-8?B?YU52S2hCY0E1bWErYU84cEphUm1kY1FPRFlrblFTc2M1dVV2RExLd01ld2VL?=
 =?utf-8?B?VTh2d05veFhaalVKcXJjMDI5ZUF2a0dYaCsvd1BNUVlhbnhjRjcxc3NzbnlO?=
 =?utf-8?B?MnhOeWRFOXhycGZGR2JkOWo2bVd2b2NKcUZoYlZEcm1WYklRTmFBM3FUY0Ew?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92367ae-a405-4d66-2071-08dd7cd3a315
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:44:17.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5iU1R8iZUGJI2dREsXznyZ//ZEIblVkUjFnLp68pdVttMZDJHzpItL5moKIgNK02gfRTVbjbA3667HgybhZvcBbeA/4kSjvExU2P8dum2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8009



On 16.04.25 04:03, Stefano Stabellini wrote:
> On Mon, 14 Apr 2025, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The current code in generate_uboot_images() does not detect arm64 properly
>> and always generates ARM u-boot image. This causes Xen boot issues.
>>
>> Fix it by searching for "ARM64" for AArch64 binary detection.
>>
>> - mkimage -l xen.ub
>> Before:
>> Image Type:   ARM Linux Kernel Image (uncompressed)
>>
>> After:
>> Image Type:   AArch64 Linux Kernel Image (uncompressed)
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   scripts/uboot-script-gen | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
>> index a9f698f00fd1..c4d26caf5e0e 100755
>> --- a/scripts/uboot-script-gen
>> +++ b/scripts/uboot-script-gen
>> @@ -815,13 +815,13 @@ function linux_config()
>>   
>>   generate_uboot_images()
>>   {
>> -    local arch=$(file -L $XEN | grep "ARM")
>> +    local arch=$(file -L $XEN | grep -o "ARM64")
> 
> My file -L gives:
> 
> for arm32: ARM OpenFirmware [...]
> for arm64: Aarch64
> 
> So the ARM64 grep wouldn't work as intended. Is the version of `file'
> that you are using really printing ARM64?

Hm, yes.

	file -L xen
	xen: Linux kernel ARM64 boot executable Image, little-endian, 4K pages

	file -v
	file-5.41

u-boot boot command:
	 bootm 0x4EA00000 - 0x4EE00000


  If so, we can do:
> 
>    file -L $XEN | grep -E 'ARM64|Aarch64'

sure. I'll update.

> 
> 
>>       if test "$arch"
>>       then
>> -        arch=arm
>> -    else
>>           arch=arm64
>> +    else
>> +        arch=arm
>>       fi
>>   
>>       mkimage -A $arch -T kernel -C none -a $memaddr -e $memaddr -d $XEN "$XEN".ub
>> -- 
>> 2.34.1
>>

-- 
Best regards,
-grygorii

