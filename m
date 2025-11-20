Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39223C7306A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166617.1493097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fM-0000ZB-4d; Thu, 20 Nov 2025 09:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166617.1493097; Thu, 20 Nov 2025 09:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fM-0000Wt-22; Thu, 20 Nov 2025 09:09:24 +0000
Received: by outflank-mailman (input) for mailman id 1166617;
 Thu, 20 Nov 2025 09:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM0fK-0000Wn-RM
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:09:22 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 996d32ae-c5f0-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 10:09:21 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5072.namprd03.prod.outlook.com (2603:10b6:208:1a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:09:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:09:18 +0000
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
X-Inumbo-ID: 996d32ae-c5f0-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPqrXBRDgQ/IljmV6IxIFklqlw+ooFb9YA7visHe5mOUWNLL0Lb4D8FH7haStCRKSyTaqXS46D9F1ijryAweHG7a/9mRQTIDD6/QSo21IyOrzhyeZdwnpIV8w/Az2MUQ5oyp0NdZgyZ+RojDi3wPUGldLSkq/SQePgiTMjNvfkA6ygsH8JQ0hfjNsXVqOjApxbywxTXvYe4B8grXgzu79Fn4QnCjzuM88GN3shmnp65eG2q1tY/MbHcwSDFPKJfhsnWFcCdgl1QI2c5/j6VL+VOGhMC3NJ0bhFLD3BeD/+WXjwYb6zry/9lHEmpIXL/jIaHq+WlUFqgptazguzLcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJWY6M/iBPu1ECyWjTISdlhNaeScyqsFCzJbpWuPU8o=;
 b=CRKQkG1i8Vi7gMDGhJJTr0i6oi4Hc2C/I2Pby7vLhAzXg3vZPLTW2k90R9+zIQBMv/EZahHx4b82ChXZrfxCRq22FJg3WipLReY6M3VTSd4Whdc8t1CExRxxNrGbmUF+ccVYSgDm0QPpVNf0rn575jUw3znTBWeBtzPJCRMSdrM6ZfcHc0ttog0sNnOrRfj6uzzHfBs0lCUd0kqUtEsnZbjArPHKfuXf36H0jhKThv8UApHjeRe1f5euZ/ImTFgZL1SW2Dy2cMCqfpJsaTGLgQKMj+m9WG8mkcozNY+Z9nJDORj+4KLctB4RafvC2oYAsstFgS+lJMKSp+8/fptF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJWY6M/iBPu1ECyWjTISdlhNaeScyqsFCzJbpWuPU8o=;
 b=JcF3C6KtnCIdtEd9gP/uk0KtKm7b/DqRAzWx0Ky71C53X/Sv9jo9tN2PTh5n6IfMhnizleF04O4suvVz4bLHexVJM5qv7iWETnrVbgTp0eRNfp+U/6BLMOqcSuXOrx0rmLb1dIgSSQ05yl79yFkpI7oesiQEbkLva1mUgM2QXHY=
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
Subject: [PATCH 00/12] x86/irq: drop interrupt target cpumasks
Date: Thu, 20 Nov 2025 10:06:25 +0100
Message-ID: <20251120090637.25087-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 948f990f-e520-4bd2-34fc-08de28147c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3g1cVYrSDJkNHZOTEVMNTBpdEVNclUrOC8yNjBJY3hFNCtOZDBRaGpVYmdv?=
 =?utf-8?B?dUt1bzYvdjV6dWRQQ2VCMFVjRitCcE1WMTl4a1M1QWtBcEE2ZjQ4WWZ6TFRS?=
 =?utf-8?B?QnBnVHhBM2VRYy9sTEhDUEJQaTVBUjV4dUprc3ZiRytWNU1mWE9XblQvR2N4?=
 =?utf-8?B?NDBRc1N2MGRESzBOa0REVkU2YkgzSmVoNmt4RFp5QnpBSHZ1U0IyR2VVY0dI?=
 =?utf-8?B?bTBoUjR2QnRBMXlVYkxMS2JPbFZWenVhRk5aRUpWNWU5NWhNMHFTc2F5Mlhv?=
 =?utf-8?B?N0NCdlBLajd4M01od0VKdVUwZjdycXJNamRFS2JkdDluNnppNjdrQVRpOExV?=
 =?utf-8?B?S0JBejVmYS9DK3RIK2Z3cDNQUFlmNVpzMStsY1NOZGN2SDVQZmdqNFVrVEds?=
 =?utf-8?B?allha0dRQm5BWnpTZWNVTEZZN3hNSFc5ZlY3S3RSNytMem00NUFjS0MzYncz?=
 =?utf-8?B?Y2lPckZTMytXVGZMaHBheUVPQlBhdFlBSDZZUy9jUm1Cdm1FUmVOcDhZSktx?=
 =?utf-8?B?TmJBdkd2bE5ydmpHQVpwcUhHbHBrdDFEcHNYejRBTVJycFZvd0xrcGFwWDcv?=
 =?utf-8?B?VVhiNGpmcnIvSm1XOElsTEVOMDlpbjlFUVNuWDU2dHAxRXdGaEZsY0l4ejZP?=
 =?utf-8?B?SjJpZ2QrdXAvUldDdmNTVXFWZjgyK0JBSWRjbWpBUGJ6OWo4N2ptMDBGTVR3?=
 =?utf-8?B?eDBXV3B1d1A3dVJrYVlpN0QxVVhVZm1meEJhV3hDSjBaYUM4NzFtSUsxbXNm?=
 =?utf-8?B?RGw2bzZhZVBrSU80czNlVUhTZ1VMRUNTSzYyYTBQbVl5cnNZUFYyZ2tUUTk0?=
 =?utf-8?B?dnlYZTZTUDdZbUN0eVVMY2Zzb3hMYXRvTFpIZi9SeU9qQWhmcW1HL1VoMktj?=
 =?utf-8?B?NHFwUnJKTy9IT2ZRZG8xV1RqKzNkRWdZbWV5WVdYR0JuWUp1RHZtOUJZZXk0?=
 =?utf-8?B?WTFIY0d6SitDdjFiOFZCUGtaVG9wM2RMMWxnSCtyZlppanBFRkhLYitYdlBT?=
 =?utf-8?B?T0kxT2lmRHE2c28wWVpWVW9DTUwvMU9sZXE3cGw2K1hrSkZ6YWJrcmZyM0pt?=
 =?utf-8?B?clo1OUFoZTltNUZPWWtNdCtwVCtTd2hhVDRnZUQ1RGZSSWhzMHo3c0Z3bkZr?=
 =?utf-8?B?RGw3TWVrdEVQcnMzTUl2eXhKUkYzeGRsWmNMdTZPUXJiZElOb0VqaFhNQTZp?=
 =?utf-8?B?R0xmazM3SnhaYzJoV0xQZnRBeVVGWWJpZi9kbVZDR3FjNllFWkVyM2phY2dk?=
 =?utf-8?B?TnRmYWl3U0kxM3UrZG9NanY2emRoQUFiRDFLdkU3NzcxSll3Ykx4Q1ZYeUh5?=
 =?utf-8?B?bVI3REdYME9HdjR5bG9abnI5eG1YaW54b1dibDRqOHFYdWJXSDVLQitPOUZ1?=
 =?utf-8?B?a3RiM29sWjFzd3NmTEg0cm1Cb0dUcVRPbXg5bGtLSXlKR2JzSUMyRGM4R1lx?=
 =?utf-8?B?RmpsWXVnZDR3RWlzMWEyQ2V2S1ZNcy9YVEZXNUtlSlE0Y1FFOUZ6RFk3L3pN?=
 =?utf-8?B?Wm9KNWJtcVFSbHFvbXI2MG56eVJENU1VTzY3VjBDeE1USU1BRERZZlJreWFB?=
 =?utf-8?B?WDhJRlJmSWVldFhxeVF2VFprRysxeW5IcWo3WEtCQ2d6blUvcThQYy9BTytk?=
 =?utf-8?B?bXgyYmVXSUpoeWxlcHZtckdVQ3dzbHFZUDcrSnorU2ZQdy8zZlZhdlBwWGJF?=
 =?utf-8?B?MHlPSExsenROUmcvS2xLSjhuYWN5bWF1ZjR2ckV4Z1daUnFkUTlrTWdDTzZv?=
 =?utf-8?B?U1ppaWFKUFRYaDZlamFHSUF0b3FtUkVCays3M3NydHlGSTB0T1JPQkVJMEg2?=
 =?utf-8?B?Y0ZteGMrMUdYSU02K2FVZEhYeXYrN0c2emR2N3dMOHBsQUFwWXhZYituR0Uw?=
 =?utf-8?B?RVNlekdnK3IrbVlPdFlQanNPZzB1T1ZGZitob1B2QWZST3F4aUJ1bkJXamtT?=
 =?utf-8?Q?8OAD0YryYEht0m5BqIdmX+J4muP+aMtT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhXYmxJeEFsTWNkQ2VKTEJlcGxqUFhQbHpVSXpWbVE2dEhVclJnbVNFclgr?=
 =?utf-8?B?amtDamNxRWZXMko5N3hQTUhXTGRjWnRGQ20vTE1mQU1KRnUrbEFQNzM4eFd3?=
 =?utf-8?B?QTRPWGVrUStrTVVmQU52eW9SQWVqYVRxNTlwbFo4Uk5pbVpNOGxIRHRRSHp3?=
 =?utf-8?B?UW9vLzVZbWNOeXhpRzhNT1VkQnlMa2JvR0s3dGxVM0Z2elJDaWFZSDVRWTIz?=
 =?utf-8?B?L2lUUUh3YTkwbWJyRFRodVgzTFJ5R3dMdjZFYlJEMkhrb3orWWUrdXUzMmdq?=
 =?utf-8?B?SzNkVloxYzdRZnhRQ0I0RkdPUU41Nm5WalNuQnJaZVZTSm9QVXNQcU5DMnFt?=
 =?utf-8?B?R3JSeHZhNThFZkgyS1RnNkcyd20yZ01aclNoRGs2ZDltbUwrRG9vRDk4d1VY?=
 =?utf-8?B?aStISEJDYXFodzdyVlB4a3NnZGo5YlhuZ2hKZkVVVGJXZzd5R1FyNjhYcDVL?=
 =?utf-8?B?YVgwdFFCY1pkbUtRQzgyS0dlL292YXJEZHBpWjJueVhUMTNRTUxOMldGOXRZ?=
 =?utf-8?B?eXBYWTdlNVM0V0swdDZpNU5nVjRCRklCOGhBRmMybnM0WFlzNnUzcWoveGlZ?=
 =?utf-8?B?K0RteFFEclpCOE9rVjBWMTBEUC9XSG9aa05rcEJJbW9nU3IxTVF5Q3kySW5s?=
 =?utf-8?B?d0pPeEV3ZVJYQ3pveFhLZlkzd096Slo1b2RGTGgwc0ZnZ204OXlmUkt0S2d6?=
 =?utf-8?B?RVVGRm5ueDFNeFh5cHRKdjl2cjljS2dBUm1hVjRYMm5Gd1RJeTJGNXFDRzBK?=
 =?utf-8?B?VE16bWlBR3R3ZWc2VEVVZVU2R3BGQ0ZDWWlwdE9wU0g0eUM1a3p3SXNlME9X?=
 =?utf-8?B?SUJVSCt1VlJxWklXUzFWR3lkTjJ1RVFxN3VOeW1pMVpwV2NPbTd2N09LeC9z?=
 =?utf-8?B?Y1VsUnErejZxeUhVZE1ZdlBPRktua3hqaWp1M1hINVpDejE3NW8wcjFwWWVn?=
 =?utf-8?B?bGZ1Q09YZktIWGRPcDlQb0srQWJxSWl3cU1JZ3ljVFRwZGJsWWVZdTZMTjZs?=
 =?utf-8?B?RzcrbGFUd2Nld0JGcU1uaW83M0pKbUF5Qjlwdk9zRmJSc28vYlMyTU9KcDUy?=
 =?utf-8?B?bFBHOHRYZVA0UG50eE9zdHlUN2JZNEk2NDhidUZYVitwUDJLZ1BLZ1BEeERz?=
 =?utf-8?B?SCtDcmdPTzVxdXFGMnRRYjJIVkNqMGFjc05nM1FEQkJ0ZGxxOHlYbVdQRGNL?=
 =?utf-8?B?SnVFby95cVZLZUhNeXpiRlBoWGVLYndndVkxMk5peW0wUGp4TlVJOU53MThn?=
 =?utf-8?B?d2RMUzh5NmRVUWhkWU9NbVliZVFwYkdlcjFTRG1KUWVULzNmYlZSN0lyL0h1?=
 =?utf-8?B?TVZuQnA0N2t2ZmYvTG5YV2ZxbHZyUlRqcThBSytCcXVPaXVmclZKYmZENW1n?=
 =?utf-8?B?QkhlYjNJS241ejVveC9rMWN0dGZMbFdHdGlsZWxNbEp4akFJeEE1cHBUcFRD?=
 =?utf-8?B?VE9kR1drWWJkS0xMMEk5bDY5Qi8rVkhqYTN5OEk4cm5UaFlRRmgrbExBQ0Yw?=
 =?utf-8?B?aU1wMlJVZzVrK2wrK01KMjBDeitwbTBTbjlvMTZVYmNUQVBwbGx2L1gwQWF3?=
 =?utf-8?B?TTVEZU1tbzRBWFByWHUwZTdGOU8wM3RlWkw1WUlaNUcxTGNSQVJCam5pSTBz?=
 =?utf-8?B?RW42TkhWaS9YMFJ1VElJZWtwQm9yalBoQ1hlOWtKcGM5L3BrMTlPTXZ5Qng2?=
 =?utf-8?B?c1JSSGMyTktVa0hJcmZMbVdua1F1dS9UaHRHUXhWR2hZNFI4MDhSK3ZpbzJk?=
 =?utf-8?B?STZPemhvWll3OS9OUWFWTUcrNjFQL2QrNGJ3b1ZkYWljRlpMV2RJZkFkbWVr?=
 =?utf-8?B?VHZ3N1pWaVpQRFFrQUFBNWl1bHV6d0JzRWxFRllrRUErdE1NZDVGS1V3R0ow?=
 =?utf-8?B?RmwxL1pDektxeHBsaEJmYWFNOGVsdXNMRGM1ekNncmhTQXJ4Vis4WFl0RXhF?=
 =?utf-8?B?VkpvNzhpQmYwSFozbG56WjJzenF3RVFsUENnTlV3NVJEa3E3NnBiRkM1cG4v?=
 =?utf-8?B?Y05mQ1VJVStZaGYwMm1iUG9WWXBIWWVOYS9pYStycnIwbFJYdG1Ib0YvcjVu?=
 =?utf-8?B?VCt3TTltR1dSN3J6OGNPU001b3FIUTQ1QTR1OTF1VFVSM0pwUDc0bk10eHAr?=
 =?utf-8?Q?RvoG8bbSgw7VG+KJxaOzeg43P?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948f990f-e520-4bd2-34fc-08de28147c43
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:09:18.4226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvD+HdafZ1UltqOkYSQ14kczFFBhR1MlpKPt0pNV1UPJvjGYfkHYj2uO8tkaMkZan7n8yuCNYkZF/SwN8bkFBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5072

Hello,

After the adjustments that dropped logical delivery mode for all
external interrupts the Xen internal interrupt descriptors no longer
require a cpumask to store the possible targets of the interrupt.  Using
physical delivery mode only allows a single CPU to be the target of the
interrupt, and hence the field can be converted into an unsigned int.

The series contain a bit of cleanup and code adjustments ahead of the
removal of the cpumasks that's done in the last 3 patches.

A couple of notes from the series:

 * It's possible that further simplifications can be applied to
   fixup_irqs() (and other logic) after dropping the cpumasks.  I
   haven't looked closely enough, but in any case that would be a
   followup change(s) on top of this series.

 * Current code seems to confuse interrupt affinity (possible interrupt
   destinations) with the current target of the interrupt.  For example
   irq_set_affinity() doesn't set the interrupt affinity, but rather
   migrates the interrupt from one target CPU to another.

Thanks, Roger.

Roger Pau Monne (12):
  x86/apic: remove cpu_mask_to_apicid hook
  x86/apic: remove vector_allocation_cpumask hook
  x86/irq: introduce local irq_desc
  x86/irq: set accurate cpu_mask for high priority vectors used by
    external interrupts
  x86/io-apic: purge usage of logical mode
  x86/i8259: redo workaround for AMD spurious PIC interrupts
  x86/io-apic: fix usage of setup_ioapic_dest()
  x86/irq: adjust bind_irq_vector() to take a single CPU as parameter
  x86/irq: convert cpumask parameter to integer in
    {,p}irq_set_affinity()
  x86/irq: convert irq_desc cpu_mask field to integer
  x86/irq: convert irq_desc old_cpu_mask field to integer
  x86/irq: convert irq_desc pending_mask field to integer

 xen/arch/x86/genapic/bigsmp.c            |   2 -
 xen/arch/x86/genapic/default.c           |   2 -
 xen/arch/x86/genapic/delivery.c          |   7 +-
 xen/arch/x86/genapic/x2apic.c            |   9 -
 xen/arch/x86/hpet.c                      |  11 +-
 xen/arch/x86/hvm/hvm.c                   |   2 +-
 xen/arch/x86/i8259.c                     |  17 +-
 xen/arch/x86/include/asm/genapic.h       |  17 +-
 xen/arch/x86/include/asm/irq.h           |  22 +-
 xen/arch/x86/include/asm/msi.h           |   3 +-
 xen/arch/x86/io_apic.c                   |  61 +++---
 xen/arch/x86/irq.c                       | 249 ++++++++++-------------
 xen/arch/x86/msi.c                       |  17 +-
 xen/arch/x86/platform_hypercall.c        |   2 +-
 xen/arch/x86/smpboot.c                   |  12 +-
 xen/common/cpu.c                         |   1 +
 xen/common/event_channel.c               |   6 +-
 xen/drivers/passthrough/amd/iommu_init.c |   2 +-
 xen/drivers/passthrough/vtd/iommu.c      |   2 +-
 xen/include/xen/cpumask.h                |   1 +
 xen/include/xen/irq.h                    |   3 +-
 21 files changed, 179 insertions(+), 269 deletions(-)

-- 
2.51.0


