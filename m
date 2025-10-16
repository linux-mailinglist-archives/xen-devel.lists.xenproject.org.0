Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28513BE4351
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 17:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144583.1477946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Pr3-0002ow-7N; Thu, 16 Oct 2025 15:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144583.1477946; Thu, 16 Oct 2025 15:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Pr3-0002mQ-3r; Thu, 16 Oct 2025 15:25:25 +0000
Received: by outflank-mailman (input) for mailman id 1144583;
 Thu, 16 Oct 2025 15:25:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9Pr1-0002mK-S8
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 15:25:23 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 550ee722-aaa4-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 17:25:22 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS0PR03MB7250.namprd03.prod.outlook.com (2603:10b6:8:115::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 15:25:18 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 15:25:18 +0000
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
X-Inumbo-ID: 550ee722-aaa4-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNyhTLVHhqK0ZC39a0d2u+57FpO4AASIRDCeHBTdAA5pCNOO22BwHW/Bjg+SU8pfvDK9ZLmH9Sop/SlwZL7pKZJlEHxb2d4z21aSVp9XxjNoW9ioUjOOSvA0JmWzEB78aguwpwqIEJasEldj/VtM5g4Enrp7bsoPIN0dfOUTrZH9TodTuNCFIofWekr9YC1IzYsx3i5mJJYWGoAZp/HY0fw+UTtnT5NCXXUVlm7nIcmKm7emoqkh0peMyWJnHNGDdmRRr676XaPemsfUZ0XfunVQdlawzQtg6e8kDAGA7gQeKdcGuQhvVmt9G39Zn3yvHoUBhaUgeRVi9stIaEdREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN4Mzr5yDtMXDGBWtTYNHfHELixjqRYhn+4e+ybuMxo=;
 b=FjrPtdhCbUWFg4thS0X4b+tzwFdFEdiv3j9T1OE1JFnWBj8x44k+QcEGTCX64pcDL2KYJLjyS9i3axW2OfE/lfCAMmzCpzwl/QHEnHWBr5nxw9psDwwIP7wlwr/v7NbfhYBVDXtXq0mvtsvPzlRGh+wgQkLFKsphSjdhSPZiRfFVwaJelfLXBFiJQ3aiW96+pcAR7z9AcsneLibOf4ueeegPEUzXrMvFzSEVZIzO6cMTguhWdem8FrknovQiGC6bEwFGJ2Xzmo6cZ5NEyYYCm3xWLfjY96CC2dEbT/cwSXvZcCUOTdniwAxtbn50377X9jgieFltLIz7/fgs+Hbv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yN4Mzr5yDtMXDGBWtTYNHfHELixjqRYhn+4e+ybuMxo=;
 b=rgTzSOxRdjcZEK4UNdDziLezbghseZ1biepb4jVjeLQwbR/PffyJGN4SszTdxQ1hNmG28CPdttZd4/cvDz6muveome9HxfjnSFgm+sHDauDU7pSKz0j1MUMaFNN53L4sOELhkDIcMn5pKp/jZEa+lPIF2ePHyF6kbEyJj9ZsGjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 17:25:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 01/10] x86/HPET: limit channel changes
Message-ID: <aPEOW9Enx20wHhm6@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <494c897c-a138-4d16-93b2-67e3aa8d41e7@suse.com>
 <aPDH4-ZEfJ9LGc9J@Mac.lan>
 <14bb12b2-1a01-49a8-be9a-6a32c3729e9e@suse.com>
 <aPEKFwPe-PiHh-Ay@Mac.lan>
 <264d1497-7155-4fac-a98a-fc1d587e2889@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <264d1497-7155-4fac-a98a-fc1d587e2889@suse.com>
X-ClientProxiedBy: MA2P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::14) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS0PR03MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: a411e854-6881-4ad1-f79e-08de0cc83694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkV4N3dMRHZzY1FOd09GWVQ1eHpJdit2aERQVHV3YlhIay9nbFpZN3o1RUQ1?=
 =?utf-8?B?U0pIamxqaUVPRnRFMWxTWVJ2cUJsemFkaXkvbEhGTnBrRmJjbG96OE1lTlZo?=
 =?utf-8?B?YUZNczN0SlpTc0d2QTBubHVrQnErVGxrSTlkMXI4QjJldGUyZmtRaVllS1FZ?=
 =?utf-8?B?dkZwcXJCejFGYytiNnk3Mnp5UGtzTm5zcEhRZTVQUjlyQ3FCcFZkUjRMSExz?=
 =?utf-8?B?Z1dTb0xwUG9jTUNOcHhKNWM0alQ2MW9GdTAwYTRRTjhudTJGVXdJcHRSL3Zk?=
 =?utf-8?B?YUI2aTV0N25OQWVGV0cxTWYyQ1VKaXlHUE91dXdDRzFSQjBrMDltTmlrM2VC?=
 =?utf-8?B?UktrdHpadER6KzNsUHpSaXdwa3VkZEtVcVpkSkhpRkMxQWkyUFIrL29EK0Z2?=
 =?utf-8?B?aU5CWGcxNmJQQm9ad1NBM3pLMGpIL2dMVnBJUWhxTzY0RzFiczZTVG1lcmhn?=
 =?utf-8?B?RExIeTh2RVByU1o3ZmIwRWlZQjg2dXkycUNXTjZsKzVWZlBIQ245OGNoVFlF?=
 =?utf-8?B?Z2F3UnR3SFlCU094S1JDUEQ4WXFIcyt1LzhSN2dCYXVxM0ZFREw5UUIxdmor?=
 =?utf-8?B?SlVTTk5Ub05wV25nbXBmQWtRM1ZUWk1GdkVtV1ZOSnp2S0xWMm1qQ0ZuVVpK?=
 =?utf-8?B?SWRSMzNRRjVtZC9ZTmRrR1JFeWRIai9wWGNiQnhvTWJCL3Z4WVhxSUtXZjBt?=
 =?utf-8?B?L2R6STBFSlJqdVhMeE1XUDVYVGpMSHM5R0JmbkJZZGxmN2oxNHkzakVtUWJU?=
 =?utf-8?B?bmY2MmEvRFJUanRib21KWmJkbzJWY1NRdHpKeThVSG5ORDBxWk51anNUdlpR?=
 =?utf-8?B?Q01GbVNORGtKcS9ob2lqcXBpdFZsSnlJZFVlNlBBL1pkSHBxVWc5V3pqOWc1?=
 =?utf-8?B?Q2Z4STE5RjREQzZNMTVXZnlwVjNTd0w0Q3NVYWd0ODF1aW9US20xL3FjTXkr?=
 =?utf-8?B?b0t0V21XWWFyNk93amN3bjJCTG5GL2pRb1VLU1FRUE1FU1hIQXZNd05Nc3Uz?=
 =?utf-8?B?dmRYM25VWVQxdCtZN1F3MjlydGVUQ2hjakhneWVsOE91ajdQNjRYcmgzdU1x?=
 =?utf-8?B?S256aFlELzJMMS82RUF1NXFtRVF3dlZGMTlEMDdyVWJLREVFTUgxVFEvWjhx?=
 =?utf-8?B?bk83MC9aMVZ1YVcyOTJYMyswSmV5ZTNHc3g4KzJXREpJWWlTbElkZ3Bkc2Nz?=
 =?utf-8?B?WmdlUGs4UzJvYy9zUnYxaE0xSG9IdmsvYlBSeU1lNGVJYnkrMnlFUlozajJ4?=
 =?utf-8?B?MzdtQ0F0NVdEQ0wyVURKTFo4T3hnK1dsWGJvZ2J0bUF0Y3Jhd1cxc1l1amNR?=
 =?utf-8?B?VHlhMmdqbDZKQXdHNUk2VE9rakZFZ2JJSnY5SHB1SEhEdm0xY1d4QklVTE11?=
 =?utf-8?B?T2ZQMEQ5L1RscXZjN2FqbjhKeWs1Q3Fza0VUbDJpM3hxdXhjcGpHdENCN0NE?=
 =?utf-8?B?UGZPd0Z4YTBWRzdpRTdZelJ5YlZ6djNlQWMzZ24xeHFkUUE3NjJBeExJWmE0?=
 =?utf-8?B?Z3BueWxNZi9zRXIwOUU2bi9wWExnVFZqV1lQRWxxdC9wT0V1VkFpeG0rc3Ey?=
 =?utf-8?B?QzhWYm5lTXR1Mi9VcTZ1UTJza1RlSmh0ODFHcEQyWGZsOWhRSGc1bjRROWNE?=
 =?utf-8?B?dGRYWjNpY094WFJlL0ZQa1p1VW5Ma2dlZjhQcEdCTExvR2RMdytsTStNRTBE?=
 =?utf-8?B?Z0RYRDlFY0lZL1paRXpQWGdxc2NRYUEwK0hITFlBWWY2YXViOEZZV3pwc0Zx?=
 =?utf-8?B?bVA1WEtUbU5KcWpnTVZ3RzlScnBEWS9tNFNVRmpUMGhhajlCTmhaR2xyaTNt?=
 =?utf-8?B?QUVFTDN2WTVLbWlQL2pRRU5uanh2Tnl4b1M1YVNrdE83blJXOWhNY3hRWE43?=
 =?utf-8?B?TGxodzloYXNhSTNSc1VEMDdzWWJBYXNDc2RrZlhMdWVvbU5WRVhvMFVmRHJ6?=
 =?utf-8?Q?aJH2DDAHadMr9eCVHaKtxt6ojFmgFsYH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWhMS1FnOWU5bFJRWk1vQWRodzdGdzFQb0tRQU9IcHhxc1VQaERFcUZ1REpn?=
 =?utf-8?B?WkxzemxWNUFFU1E5NUZvZUJub0pSSGVvTnd2K3VPelNpUEVucS9KcXpqV04r?=
 =?utf-8?B?Snd0LzM3RG0vV2EwUloxbGg3Qk1uNnk4aFNkdjdycjBaVDU1SSthTXlRdTJY?=
 =?utf-8?B?aDVDdkpQV2JVMm1USHZiSmJma1BUcEFqazlqcVNPWWwwbDYraVViZ0VrdUdp?=
 =?utf-8?B?QjFCSUc2MzZUTzMybC9MenJobnRmTnJnZ1htR3ZsbWdCTzlodVVMeEJXTUND?=
 =?utf-8?B?bWZNV0E4TGhkY3FyRldYYjBMTXVQVTFuU3lSVS9EMjljeVRITFY1OFNxVUVj?=
 =?utf-8?B?MW1NK25uSVA1dGh1Q051cndjYkdQOTBPQ1kxVzZtMTFsTTNIUWQ5K0JSdEpq?=
 =?utf-8?B?dVhjRy9BZzA0cU8zQ3d3Q1c4MnNCWmhjOFI1SkZSRHpMN2NDRTNodkVjd25a?=
 =?utf-8?B?NndDM3huN0x0TTJLUkNtSGpmOE9Edm1EU24vRjJUK1QvYjd4eTA0V0E5em5F?=
 =?utf-8?B?QWxQMHNsL0gyRWpSdEdEUWF0NWdJZVdtdnZQbUhVSU9ucDYwS1hUTGlMZ1Jx?=
 =?utf-8?B?blozc1J4aHkvNlhmcmdRRVQ5dFkreENMalkyZzVpU1VwbHlTcUdtQThQWWFD?=
 =?utf-8?B?ekVGaDBYb2pkYzJzeTl0bjlDZk1FQXBqeVRPNCtWZE1PTU9xRHhaNENUc3lt?=
 =?utf-8?B?RjZscU56U2xZQkU3NW9HbmdPLzJMcXVheVl4M3hQdHF1emdiNlV6ZUJxb1Ry?=
 =?utf-8?B?Rit0ZG5mTFNkRnQ2TmUyQy9hZUhnUkxPZG1wcXpGSVRLTFNZTFpYQTJPVi81?=
 =?utf-8?B?bXg3OUo5Y282MlNFdlNMN28ySzh6SVcrY2V3WmtVYjFNcS9TMEFzdFhNVlpY?=
 =?utf-8?B?UVF4Uy9oWkdoNWJvblJJUlN3WTV2U3JQWm14dnEya29qaHUyOVdLeERKYW4x?=
 =?utf-8?B?MFhmZFhjTGNNWE9uR1BJMndQaWM3MlFvUU8xcGxGa0ZybmdRSmxWRmEranZW?=
 =?utf-8?B?QXUyU3pkQUg2d0ozQkVKS3FrQjB4QnU0U3ZxOUY2TnNBa0k3c1gvQ0tmWnll?=
 =?utf-8?B?a0haTWlRdlJCblpYVVhCM0cxWmtHMzhaZDNremFobDNvVWhOZWtXak1IYXgv?=
 =?utf-8?B?YVpFV1dld3VqakovWnNBZHRoSFViRWRoS3ByeC9Obmg1YTN5cXJiQ3NCUDQ3?=
 =?utf-8?B?d0c3T3dSMy80cExnUlF6Tkc3TURSRy82OVcycHlUTVg2VWpmeVlVbHZjRjlL?=
 =?utf-8?B?UjllYkd2UkFHL2FqSmVwUXNQcmNkbTR5cmR5YmxOS2Y3UHFUc0RHazY1KzJI?=
 =?utf-8?B?TUZJNzZ5NXYvc2RuQmxwK0R3TzhCOHJOQWtWSnpDYlV4Ukh0dWQrSzMwZTla?=
 =?utf-8?B?S1pxaWVkcVZZNGM1a0d6UG9JY0RnYllxaC9xbDZBVmNiQm5HaDZlemRQdEdD?=
 =?utf-8?B?QXZGMkdhUE5GRUZ4YzVNREdRbEZXcVBjcnpMVlhGeDk5ZlNiR2tKN0JPNzFH?=
 =?utf-8?B?dTdFcjJFcUFKUTJVRGw0ekNLcFRiWk1vazR3cUF3aGlhYmZIZjhPeUgxTHda?=
 =?utf-8?B?OWpYWXhyeE03S3VLWDg1NXlPVGo1T1JzZUVIK0MraEtNZXprRkI1TVh0SXFM?=
 =?utf-8?B?NG9xc2d1SVI5b21nelVJNE9Ia3JaVzJVMUFoY3kwbDBQWEIyWXVyV3lUcXg3?=
 =?utf-8?B?dVRoOXloMmhLbkVXb0w0VWRQeFUxUlk1RWpsbDZsTUh4cjIyeFpzb3UzNDRN?=
 =?utf-8?B?V21GWXcvdStOcy9GMHlUTWNBMTNLQTBxdnNFZXVjTWJFeWxzbmJaUTZuUmlp?=
 =?utf-8?B?b3pJdm9WNzRSY045TkdBUXViMzl4ZTZnL1htTGFCaTRJMGNzeTM1VVEvTTdq?=
 =?utf-8?B?aG4zQlNPMWhlUjRldDVCS2ZGMWNPL2ZzNjFHcjQ5Q29xVHlObkl1M1AxckVD?=
 =?utf-8?B?ZDFXeUVMaSsxWHhnT0NWcGpFUUdLRFlON0tidjExK0NVdzBwQ1UraGpvTmsr?=
 =?utf-8?B?WTd2d2MvRTRaOU5WUG53UnVUalIwdHBpeGl6bmF4ekV3eXlIVnFkU3FtSVNP?=
 =?utf-8?B?SG5tdndEMzIxTDJzUFhDQVlWdkRCSG9oMzN0MkE3M3o4czRVRVlObUVUeUND?=
 =?utf-8?Q?T70aXltwcM+bQ8e8O0BAWtdsc?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a411e854-6881-4ad1-f79e-08de0cc83694
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:25:18.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1BknfYJNYCcQiIebyZQTrL6T3iRtq0A3JmXn7bj4LL//fvjXItp6a4Otv+WcdgN95tLp02UsYAksB1MhD89nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7250

On Thu, Oct 16, 2025 at 05:16:07PM +0200, Jan Beulich wrote:
> On 16.10.2025 17:07, Roger Pau Monné wrote:
> > On Thu, Oct 16, 2025 at 01:47:38PM +0200, Jan Beulich wrote:
> >> On 16.10.2025 12:24, Roger Pau Monné wrote:
> >>> On Thu, Oct 16, 2025 at 09:31:21AM +0200, Jan Beulich wrote:
> >>>> @@ -454,9 +456,21 @@ static struct hpet_event_channel *hpet_g
> >>>>      if ( num_hpets_used >= nr_cpu_ids )
> >>>>          return &hpet_events[cpu];
> >>>>  
> >>>> +    /*
> >>>> +     * Try the least recently used channel first.  It may still have its IRQ's
> >>>> +     * affinity set to the desired CPU.  This way we also limit having multiple
> >>>> +     * of our IRQs raised on the same CPU, in possibly a nested manner.
> >>>> +     */
> >>>> +    ch = per_cpu(lru_channel, cpu);
> >>>> +    if ( ch && !test_and_set_bit(HPET_EVT_USED_BIT, &ch->flags) )
> >>>> +    {
> >>>> +        ch->cpu = cpu;
> >>>> +        return ch;
> >>>> +    }
> >>>> +
> >>>> +    /* Then look for an unused channel. */
> >>>>      next = arch_fetch_and_add(&next_channel, 1) % num_hpets_used;
> >>>>  
> >>>> -    /* try unused channel first */
> >>>>      for ( i = next; i < next + num_hpets_used; i++ )
> >>>>      {
> >>>>          ch = &hpet_events[i % num_hpets_used];
> >>>> @@ -479,6 +493,8 @@ static void set_channel_irq_affinity(str
> >>>>  {
> >>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
> >>>>  
> >>>> +    per_cpu(lru_channel, ch->cpu) = ch;
> >>>> +
> >>>>      ASSERT(!local_irq_is_enabled());
> >>>>      spin_lock(&desc->lock);
> >>>>      hpet_msi_mask(desc);
> >>>
> >>> Maybe I'm missing the point here, but you are resetting the MSI
> >>> affinity anyway here, so there isn't much point in attempting to
> >>> re-use the same channel when Xen still unconditionally goes through the
> >>> process of setting the affinity anyway?
> >>
> >> While still using normal IRQs, there's still a benefit: We can re-use the
> >> same vector (as staying on the same CPU), and hence we save an IRQ
> >> migration (being the main source of nested IRQs according to my
> >> observations).
> > 
> > Hm, I see.  You short-circuit all the logic in _assign_irq_vector().
> > 
> >> We could actually do even better, by avoiding the mask/unmask pair there,
> >> which would avoid triggering the "immediate" IRQ that I (for now) see as
> >> the only explanation of the large amount of "early" IRQs that I observe
> >> on (at least) Intel hardware. That would require doing the msg.dest32
> >> check earlier, but otherwise looks feasible. (Actually, the unmask would
> >> still be necessary, in case we're called with the channel already masked.)
> > 
> > Checking with .dest32 seems a bit crude, I would possibly prefer to
> > slightly modify hpet_attach_channel() to notice when ch->cpu == cpu
> > and avoid the call to set_channel_irq_affinity()?
> 
> That would be an always-false condition, wouldn't it? "attach" and "detach"
> are used strictly in pairs, and after "detach" ch->cpu != cpu.

I see, we set ch->cpu = -1 if the channel is really detached as
opposed to migrated to a different CPU.  I haven't looked, but I
assume leaving the previous CPU in ch->cpu would cause issues
elsewhere.

Thanks, Roger.

