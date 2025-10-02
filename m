Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE8BB4609
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 17:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136038.1472911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4LNP-0002BM-Te; Thu, 02 Oct 2025 15:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136038.1472911; Thu, 02 Oct 2025 15:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4LNP-00028P-Qp; Thu, 02 Oct 2025 15:37:51 +0000
Received: by outflank-mailman (input) for mailman id 1136038;
 Thu, 02 Oct 2025 15:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddTC=4L=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v4LNO-00025A-By
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 15:37:50 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf831a48-9fa5-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 17:37:49 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by PH0PR03MB6479.namprd03.prod.outlook.com (2603:10b6:510:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 15:37:42 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9182.015; Thu, 2 Oct 2025
 15:37:42 +0000
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
X-Inumbo-ID: bf831a48-9fa5-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytuLqhp5gxkhttX+srVDJ1f59U8sWWeSe1a0UFg86LyKehcCulNbdBgfusANroFmhxRBiKLrViqtVrcphdl2vmSem9Cgx1wycVAfRYNY7lVwPZqMVD+on60IvTkcitSy/6pfKApAE9b9svcaaObOdybe4Q3Bu7gQY/buj6igtK4GgpmRARDE3cOATP3pL5mOJFfTs6nov0EM6F+HNV/qQHJBstzXW8NjDd/Hhkp+VYoEhW9h3/aL4nEIAR8YNZ6vxdRnKQBklR01uErPu0CBJHMTwgspOxFAvtuDnMztyWz8yDZ7miyIDYYVKxS2NWPSJKhrP/GoIRh+UWMO09k4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1aFb/ZOGyYwPvmz472rrh2Pja0/6K1eWeKRDjo3xD4=;
 b=lXzaXsXWYOBVtUZJXJLFAC54u1zN7ufl9tm/6LcQr9aRUvToZ0OEqfVv2454t+5wrw09sp+2z/oTXoHDUWPk5CVR+3rsZyrZ8NMLxTY7TC7LFrriB/m8usdxIRkyz7etN389RFFai7JqA42XsdGo1+l3fow7TUU5C6wdvsw6qCbWEfrht3FrQV5gL+jzmlFYHEF9lnmOBJB7CyKUeE57vzcDUedYkdX6XWp23DAYoV3lsKYr7VCitjUWEUHxtvq4jhdDDPM9ca0E6IH99LefI4j+s5FIAZFesTFs/aOeowBaEFWylNKCc8uk+8nyRQ553wvh/zU38v+DFfb4l3SqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1aFb/ZOGyYwPvmz472rrh2Pja0/6K1eWeKRDjo3xD4=;
 b=FlNCliZO06l3rkCkcnhb4altuG08SyDWWXCpQL8V2f2Gx6qMCql5C9PjOYMoomKIuJbtEfvY4bJUXm26qcQF0qwgZ8Rn21XZoGf8iZ1OW+M1mYdTi/rKpL4cWrlKTLy8IUEGIbqbZ2MKlDKjq381js643VfKSBWdSjMLwJUCYjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Oct 2025 17:37:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XTF PATCH v2 2/2] x86: Allow exiting QEMU in TCG/QEMU
Message-ID: <aN6cQBwiM36q_75E@Mac.lan>
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
 <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
 <aN6KrO6LPPJFK17M@Mac.lan>
 <DD7X3QFGUK6Y.DTARYWAB2DF@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DD7X3QFGUK6Y.DTARYWAB2DF@amd.com>
X-ClientProxiedBy: MA2P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::12) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|PH0PR03MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 872502ed-005b-456d-0d43-08de01c99f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2lQM1VkL2dzZzNYZ1g4RnQrbW9nVDVSWllpdmQyS29VZXFrbzliOVFWRW05?=
 =?utf-8?B?ZlR1Uit1VUZMUXF0cUFJa01PYVlmQk9KM2ZRUDJQSXRseEY2Y0pNYU9VTnRX?=
 =?utf-8?B?NG5GMzFnWXU3emIxVkVlUDdoRFVWYktybGV6UkViRm1Pb2xKRnU2MjMzcDdq?=
 =?utf-8?B?dnB2a3RvT3VpSlFuQTJyak9hbW1xNExnQjlsZFhibXJMOEE1cXBURVVSR1BW?=
 =?utf-8?B?MXFmaFdEQzdqOW8ra0ZhUWRDM0VaZm5WQ2hvWk5vU2Z4bTNQYjJQMlVpdWxl?=
 =?utf-8?B?RHVSZG5Lb3ovR2pheXVLYzluSWVsVm8rZExFNGJLM0p4YVRSMnFhQjNCZkhv?=
 =?utf-8?B?K2VWZk9qVWVEYmZDOHczZXlteGk5S2hEK0NLc1llOGsxTHNIK1QvanVDUzg1?=
 =?utf-8?B?RXlXUWNraFRTLzk4ZThXN0lramZ3enFZalhLRThleTZqeTRDenlhS1dsd3Zr?=
 =?utf-8?B?bnV4VDM2aWRPTVI4RGtPSXFjRVpuWnlNRFJiMitOckREL0lTRVJUbG1KUHlK?=
 =?utf-8?B?eHNiczNqMUEzM2ZpQXpJZzcxaUl2SCtQUHg2dkxnNWZwTjNQUE03M21xSzh3?=
 =?utf-8?B?d0JTWGd1bXNlSXl3aDVtWklPbHFINlBGZ0dPdTJtWWhPcG5mY3RrQ2RGT2hM?=
 =?utf-8?B?MW4zQ2xGaGY1amJaTVVqT1gyNHliS2Nob3l4d2kxYm9uKzd2WUhhaG9KSGhi?=
 =?utf-8?B?OEVJN2lIQkJkd2grVUpYK2FzWHdpSWs5ckx6MHlPSXp4SWdTQTV4eHlndDYy?=
 =?utf-8?B?eElITlJNYUx6QjFocXdvcStWclIwWDJFMXVWQXpJZ3crdWoyRU8rTjMzWlB2?=
 =?utf-8?B?aGxSYmFjT3VIRmxKMnF3bHlFNGE1T3dmRFg5QUZIQmRZYVgrK3QvMGo4bHYx?=
 =?utf-8?B?eTlzVTV4SUtKMUI4V3JzbmsyYmJoUERLS2o0VGtTNmJIbkE4UXBySmhwRWNm?=
 =?utf-8?B?WDJQdGNxS3BHYUIxdVNHVXR2SU01NEpaQWVYR2VjRWRIRWtJa1JkYkRBYndF?=
 =?utf-8?B?ZFZoVWx0dkRSMnhFbzJvaXlBTE8zZTMvTkVVSUZnSjZwQmZIbzMxMGx1bGh3?=
 =?utf-8?B?RlVYUWNlWkdYZDJMbWRKNUdHQ3VWaTF1dUtrbHp6dzNXck55MEdHTnhCdXdp?=
 =?utf-8?B?NllMSHV6WmFETGJaR0VZdXNPenlidVpXNWpCUUNZTkRSeGZGSVhTNkg5RStN?=
 =?utf-8?B?blpPLzA3Ky9YZHZvSWZxWkhKaWx5cENvUmk1SDZtY2pscjJNSm1YbWFQcWE3?=
 =?utf-8?B?SEZqQ1Z2YmlNdTU1c3psaFRMdUo5d1NPRzJQeG5DR3V1ZTYyQktFbkJQNmxS?=
 =?utf-8?B?Uk9nRGZGWXlXUVhNcVZiZFlnODFwa1JhK0I0U1J4UnZrSHdOVk1BdTgrOVhq?=
 =?utf-8?B?NHFjcFp3c0FmdEJIdGp1a0oxdlhJWnlXRERxUHA0NXlWRDVoVEYrZml0QlNz?=
 =?utf-8?B?UFRWczk4elpjdzNLRWdCM2hZTGVBSDhITThBL2pDRlpua3J4NGxTRjY5VUVM?=
 =?utf-8?B?REtFVVJYTlFycmhOcmIvaVd2ZVhFQ01jVnBGSHZsZC9zbjFpejJuRVJNUThw?=
 =?utf-8?B?UVRGZVBlUFFrMVR6eUpUdVdHdVRVcDNzMTdFaUJoV1p5VnZMU2VxeU8zWHBJ?=
 =?utf-8?B?RkF3amJFMkE1M1o0UFNJTmxhM2c5ZXhnakJGaDFxUi85c3c3Ulh6L1Z0K3Ra?=
 =?utf-8?B?bGk1elZPaE1UaUhDMUNHYW5va0FrR3pyTTZ3d01obkNvemp5bHlGY05CZFBH?=
 =?utf-8?B?RllkeFpNN0pFQmZKMldEdTFYVVVCOGdIbm84TGdPOC90eUVWT21pbGQrd24v?=
 =?utf-8?B?dGU0UDFtMmVJcFI2MGJkY1RJWFJMT2kxOWNzeGprZGFyMURiamZVUFFLZ3Rz?=
 =?utf-8?B?ZUYzcW9ERkpMZlloSDAwMDlRZk12Zy9YREUzV3kwZUwyYzAzZDBCQ1drUUN5?=
 =?utf-8?Q?ruqlVngByAPIuj4XMXgPTxezSWAipqlv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0crYUNxeVBDc3Roc29vclNlSnV5SXRwcG1SM0c0Yk1Vd1dERitqL2x1dEFI?=
 =?utf-8?B?QU00cHJRVkFkL0dVWnFaYjBSSTRiOE44alNHazV5NDFPSFo1UEVHRzlNYTE2?=
 =?utf-8?B?ZFVYcVNKNGU4MlR2ZXhWSUExa0R0b3JwNUYzNzQ0WmdTb2JiVDFoM0pLTkVW?=
 =?utf-8?B?Rit2OXZYc0JXMis1a2FhQjBKY0V0Q3lieXM3TVZaY0lkT2UvMUpLSmtXZWpT?=
 =?utf-8?B?QnBPdjFNWGpmNUlmNVMwOW14d0VYMWxVcCtnakVsc093YWYvc1NTZ2hPd1VM?=
 =?utf-8?B?NlBkc3JEK3dCMWJpQlRDVUM4TnRGUURvM1Z6b2xQRTZYQlRkU2hkTVdoRlRv?=
 =?utf-8?B?ZWJKOG53RTRGTkQxL2ZycWdmTWtIbFpqYkVJZDg5RW9LRnZzUEVyeVEzYTJm?=
 =?utf-8?B?Q1ZQNTRiS1BWdGZHY2lGclF5RkFmclhGY3ZqZndOTG5NZWpqVkVJYVJKN0xK?=
 =?utf-8?B?VWJGaDhjd1lRZWJjNHZWdjdrNXFsb2kzclN0NHlpa212Y2tmeDFNbnZCUTdr?=
 =?utf-8?B?N0p5TjVvWHVkazZnRDJySEFUelRxQ2ticFlUWnZVYzd6endWNDZiVmZqQUt3?=
 =?utf-8?B?d25TaUw3aStEOFZ2aGhUQ0hOOUhCR1I4OEs5YW1yM3A2UG1Zc2JDbTlwYzNi?=
 =?utf-8?B?bkVFaE40c3cya3UrdUZHeGdLdUpzR2FTMEhaRXlncmhHNFk4cWdMYWswdnBZ?=
 =?utf-8?B?MGpsVWZCUXFOSWFHellleXg5dDB6VEhVYi81OVFudUJLQUFkZWFJam1hNmxR?=
 =?utf-8?B?bE9DUWpiUGxrREVtdG05VFVnK3BxNEdrSkZuRG5RcS9zZDc1b2tmdVQzT09F?=
 =?utf-8?B?bGJjaXRxeU5IMFZhZTNVWXNkSVcxdzlNbmlkTTkxYytEd2pDVHV2eFcyN0pz?=
 =?utf-8?B?Y0NjKytBbFhoQUVwVmtrYmdrNnNQalVVdWVtb2tQMkE1TzNMdDMvNnNPVnAr?=
 =?utf-8?B?VkVSY1FaYnk4aWJ4VFZKd1hIaTU4V25jRnZnUHRsYlMrWTIrV3ozUUx0bjVi?=
 =?utf-8?B?VUpiMVZDWnN6SmhURUxkS1Z2NU9uV1lKL0xUMmNqeFFOcWtFdEtjWllPWEpi?=
 =?utf-8?B?V3JtSmlKUU45NHVEdnBQWHJMNjlFdEtEdHB5V2JwZXo5bVoxa01jNVMxWjdF?=
 =?utf-8?B?UEE3UkJGd2RSckNEanFweWRTN05FNG1xWldQZWpCeWsyVmtvZU5YOHY1djYx?=
 =?utf-8?B?a2FPTE8yek9xNitsVC96c0FOenB2TEsvV0IxZjJTMzF0bnd5RnJyNE9yQU1x?=
 =?utf-8?B?R2pockFkTzlsT2VYMHU5R25NaGF0MTdmWlhiTXZueitIeVYxd1dxSmxFSEdQ?=
 =?utf-8?B?N3pCRTZqK1NSSjNySHVGcUtrOWllL1FwZS9SWE5sa3gvSkZST2RQQ2djS3RK?=
 =?utf-8?B?dEgvNTY2VkRQazJvYmdINFpjaW92S1BPVjd1OTRJdVcvOXBnZGN2MVlseUp5?=
 =?utf-8?B?NzJlZmIzUmxyQ3lCbE9WVUhyakMvRHlTdDVYSjFQNTRxWG5vODlTM2Q2RnhR?=
 =?utf-8?B?d3NPQlpmNEszZlppbHVwUzNVVjFya21HVE91bnJFL3JGaVM2ZncyT1l5dkJV?=
 =?utf-8?B?T3grZ0RmT2Z6TjZUWlpzZ01PR2JOejdCem4rKzNiSXJQZWh1OWxLSTdIVjBs?=
 =?utf-8?B?ekNIcStvejNGVS9XUllxTlR0MUhFZFVtUHJ0UFNVMzQ5bG10L3dtc1RCdldQ?=
 =?utf-8?B?TDVDT3Y2cGlhanRhYkVtVlNHcDNHUklrMEc3VGN3aDk3T1RSWW5ORkJpVWtx?=
 =?utf-8?B?c3czeG01Q0ZGN2xtNUtFOTNRSHVqVEdlajdWK25obzN2M1k4cmlqWVN4eTBM?=
 =?utf-8?B?aS9JK1N5OHkvY01kRjJKUVJ1SXp1WXZiMjJVcUYxWGxOOWJGUmVMck5tM3cw?=
 =?utf-8?B?bDhrZ05hK3hCUUVmb1g2TXFhZDRrYUViOW9tOTErYlpaZjk2Zm4ySFRVNy9X?=
 =?utf-8?B?YlF5Wmh6WGp5RmwxSnJ0cHpOY3pSOEt3ck1lcnIzbitEaDRSRitZSU50U0dW?=
 =?utf-8?B?WW1vaWdXZWtqcmVaN0x5M0REcTlxN1J5b1M1ZGFxa3VhUmFmTUs2cXpTM1BM?=
 =?utf-8?B?NzNzRGxlVW9FSmFGYnBlQnBBSlhmajZqN0s0c1JYU25UTi9WL3dSVXRFZklY?=
 =?utf-8?Q?Shlw7sXsFwmmHDvZwaxvasQtx?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872502ed-005b-456d-0d43-08de01c99f78
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 15:37:42.0797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ap9lbLFC1veYfenCj1I6OXdYj05nT4pFMynclyXbJYhID3oqh8nvAN0kk9xxROQ4iCNitLR2MsJ/fVfqDFBJ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6479

On Thu, Oct 02, 2025 at 04:48:38PM +0200, Alejandro Vallejo wrote:
> On Thu Oct 2, 2025 at 4:22 PM CEST, Roger Pau Monné wrote:
> > On Thu, Oct 02, 2025 at 03:55:34PM +0200, Alejandro Vallejo wrote:
> >> If QEMU has a debug isa-debug-exit device, we can simply write to it
> >> to exit rather than spinning after a failed hypercall.
> >> 
> >> While at it, reorder an out-of-order include.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> ---
> >>  arch/x86/hvm/traps.c    | 16 +++++++++++++++-
> >>  arch/x86/pv/traps.c     |  5 +++++
> >>  common/lib.c            |  2 +-
> >>  common/report.c         |  8 +++++---
> >>  include/xtf/framework.h |  3 +++
> >>  5 files changed, 29 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
> >> index ad7b8cb..b8c4d0c 100644
> >> --- a/arch/x86/hvm/traps.c
> >> +++ b/arch/x86/hvm/traps.c
> >> @@ -1,5 +1,6 @@
> >> -#include <xtf/traps.h>
> >> +#include <xtf/hypercall.h>
> >>  #include <xtf/lib.h>
> >> +#include <xtf/traps.h>
> >>  
> >>  #include <arch/idt.h>
> >>  #include <arch/lib.h>
> >> @@ -139,6 +140,19 @@ void arch_init_traps(void)
> >>                 virt_to_gfn(__end_user_bss));
> >>  }
> >>  
> >> +void arch_shutdown(unsigned int reason)
> >> +{
> >> +    hypercall_shutdown(reason);
> >
> > This relies on the hypercall page being poised with `ret`, which is
> > IMO fragile.  I would rather have it poisoned with `int3` and prevent
> > such stray accesses in the first place.
> 
> I dont' mind caching Xen presence somewhere, but that involves some code motion
> from setup.c, which I wanted to avoid.

I think it's very likely that at some point we will need to cache this?

enum {
    NATIVE,
    XEN,
    QEMU,
    ...
} hypervisor_env;

Or similar.

> At the core I just want to speed up testmaking by doing it from WSL rather than
> from a Xen host.

Right.  I was pondering whether we want a QEMU target, but
realistically QEMU should be able to run all the hvm* variants.

> >
> >> +
> >> +    /*
> >> +     * Not running under Xen. Attempt exit via the QEMU ISA debug exit device on
> >> +     * its default port.
> >> +     *
> >> +     * QEMU's rc is (reason << 1) | 1, if "-device isa-debug-exit" is set.
> >> +     */
> >> +    outb(reason, 0x501);
> >
> > That's kind of weird?  So even if we pass reason == 0, the exit code
> > from QEMU will be 1 (and error)?
> >
> > Isn't there anyway to signal a clean shutdown, and hence QEMU exit
> > code being 0?
> 
> Nope. It's hardcoded in QEMU itself.
> 
> reason=0 => rc=1
> reason=1 => rc=3
> reason=2 => rc=5
> 
> ... and so on.

Hm, OK, I think it's lacking there's no way to signal a clean exit,
but I guess QEMU had a reason for this.

> I have something like this in my harness to avoid surprises:
> 
>   set +e
>   qemu-system-x86_64 <...>
>   RC="$?"
>   printf "\n[QEMU exit] rc=${RC} reason=$(($RC / 2))\n"
> 
> On other test harness I use for personal projects I take the convention that
> rc = 1 means success and anything else means failure, but that needs changes
> to the runner to integrate the assumptions somewhere, I don't think hardcoding
> my conventions is sensible.

I see, I find it kind of lacking from QEMU, but never mind, not
something we can change.

Thanks, Roger.

