Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB4DA87AA2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 10:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949409.1345954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4FNx-0003cY-Bi; Mon, 14 Apr 2025 08:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949409.1345954; Mon, 14 Apr 2025 08:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4FNx-0003Zz-8l; Mon, 14 Apr 2025 08:41:45 +0000
Received: by outflank-mailman (input) for mailman id 949409;
 Mon, 14 Apr 2025 08:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6tK=XA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4FNw-0003Zt-8c
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 08:41:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48b42d17-190c-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 10:41:40 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:41:36 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:41:36 +0000
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
X-Inumbo-ID: 48b42d17-190c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOIo9FCXH9vAaGgPrPyVKDjQNfuiJoz+BdqROyOB8jcliZKvIHkv5XMKalDDDYHfwJSW2SRjanl3FNyqTJE4mZSCeZdtHL/cGrRsInjULx7CPAojR6jJT+K+A7aRbFnpL3bheYhvWbPWojePHov8PJ+TxYFv5Kv5PVwinIVSqlZ5BHU73hU4Tb1Xw1P2Rk3I94o9MuGIMAlwjPiDbWdA6ckHA+SftyPfupzHEsHnl5lQ1+r9kgtC0yVZwtW28sD1lSJ3r+RMuT6Z0f8lBDYO0SdY6O4IYIkiKnT84kIZqvxg0ZCNnShsqJkG+mSkKdFOUe9Xtl0ToTptWSSIZiAFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3+/Xz+dp/vwGjfe6XdW8wKB82orV7LONtNNkQciFAI=;
 b=SzCbrW0SzHH8g3Twl0SUcuhFf1VXkbYMD5+1N/PdMYGjpb+MiBw6kA87/QSQAa6ZfYgt3B7m84H9ERnFmh86WMJ+XRtYRv1yp5UvWCxxtTnQ4EdoTNEoOrWD3TVpZOUZERbNOODUGrhHm9cQnE1lSdZGTKyPdMQ4M8qk66E34fGno7aYYoBqJF6SzJlFlQvH+xEnIuWTo7/if5sIETMFw4zVDnWE/Ox7/mNyN7+O1l5JJM27VsF6ow8SOawxFYPJj2nhyIuTVm7frRmEL+rVXk2fhplliT42jWyYEOWdMES8H/rF4ac1yBGkul5FM31JFcLawPTJ4AChkRKG3jeM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3+/Xz+dp/vwGjfe6XdW8wKB82orV7LONtNNkQciFAI=;
 b=VSymWHonIlbkoSQQ59WwIYeWC50S+0Y5yGT80gRhWYPz0F5DV1CAyNpV4FYtjCO9VKQiake59EIkujHTilcXQvr5I5brigD2KlhJxYmTltlgaTQwroaoM76r+F2Lk6wEKlX1bUF0Bd1rPra1Od+PMsYNlAt+1XXsf9cr26rvtAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e1fce6bb-6a45-4862-8989-f7bebfc0dc17@amd.com>
Date: Mon, 14 Apr 2025 10:41:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-4-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250411110452.3748186-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: d33a9817-11df-489c-e747-08dd7b302ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDYzdWtpNU1peTc3U3dSampDZlcyNmpGL2JibGZ4eEpxVVJZUnI0UkliQkNS?=
 =?utf-8?B?OFZwamFqRkxwcG9ROFhNN3BTcG5kNUkvd0hzV3NOTERDVE5JMHZsK05QaElX?=
 =?utf-8?B?MDJwdThiY09oOXJBSHhYVzgzYWlsNHBjbUdrTE4yU1g0ME1xRzFOVVN4dTMy?=
 =?utf-8?B?Q3NQeldqdHpjaW9Cano1TjZTdmlBTVJUdjZlZlhYUzNuMWJxUDV4ZXFDR3RF?=
 =?utf-8?B?VHMyZ2phQmM3QzA2cEJpMjA0SXJFQng5QjlTeFpuWDltZTBGMCt2ZGpZUWtu?=
 =?utf-8?B?VWdsOWZ1N0U2WXBWRXFVbG1PL0l4WmFMS1ZkVHBGb0tzTHp0TmdZZXIzV0E0?=
 =?utf-8?B?SGNkWUQ4b3ZsNE5WcEdxRzFES3pyWW1IeUlpa29lOG4zT1hrdmRtVjNDNGVn?=
 =?utf-8?B?ckRSQWRrcjdzME51ZDRMU2Z0NnUvUFJUZXgxNUlqeFpnV1M5Y1pkQjd5d2JG?=
 =?utf-8?B?MlI0cTVkaTVqbzEvN1JMNGVGTjRUcjBPWW1QaDN3am5tNFAvaWdoOXk1enZz?=
 =?utf-8?B?NmpDZU9KN254MytqSzdBT2pES1N3SjNTb1FFRTlCMG5SanNMa0MydWttN0d2?=
 =?utf-8?B?Q0RrUE1VOGlzU2RyM1ppaWU2ejdvUWdQOStGeXowTFhQMDIvZ1FMeVpRZnhi?=
 =?utf-8?B?ZDFFbXFqWE9rdXVVRCt4b1RhTkhLWEV6d0tlN01FZkFkSEtiaFZYV2ptMHMr?=
 =?utf-8?B?OHdWaGt2RTV0WktLdWU4Y1pPSkR2Q09yZC80WWZLV2Urb0p6NWtBbkRkOUlV?=
 =?utf-8?B?SWJGY3BjRzVWQnRFWVNqTU5zcklTczRhQ2prVElDVXdVcFpsMzVNMWRjN01R?=
 =?utf-8?B?WU1VYXQrNkhybnNrV2FXRXg4N1o4UTZ6NGJ6cXpDalBHUUdjTmhHeWM4dElU?=
 =?utf-8?B?ZnlzaUFWTGVOMU0wZmZiK0FhYnZZRTRRbjNMcnUrZmo1bGdsVFdldEZ2d3hL?=
 =?utf-8?B?MmRGYVhWb2pFTHlCOW5PUFlVZUF0bVRKQXJ0M3V0K2xBSmdHem1BZGt5MHB0?=
 =?utf-8?B?QTBzUFdKcWN1bkRTaEt4d05pdFlLRGNzWi9MWm1nMDlQTUJNNGYwakFnOTFH?=
 =?utf-8?B?azhwRTlJTEpnZGVsZUpEb2RRcEtxN25naCtDa2x6bmkwa3NmQUw1OVdlRjZD?=
 =?utf-8?B?NGhUM3ZOK0I0Y1V6MGhhYTJ6RG84TDlJeWtNOHhURW1EUjMwc0JMTFB2RzdC?=
 =?utf-8?B?UjlJNElCWGMvb3lBUlJZcmg1TXR5dVkxV052TTB6cDhteXpaVzhJTldObmh0?=
 =?utf-8?B?dUM2RDhtZFc0QmJrRlZjemNIN1pJTW11MFVGVzNkalJtYUlaZC9nbi80OWhZ?=
 =?utf-8?B?ZCtxWlpjaFFFNDE1K0dWZWYrRTU3R2Y1NWFtSUJPcnV5OUhVd3RrY0drZCtD?=
 =?utf-8?B?SUJoczNoRVozdXVqajlNWDhhb2xacDhUZE5rTHdyZ2dPMHFLY2xaWks0NDRQ?=
 =?utf-8?B?QVQxRjRCbnRwWFJTVllKM1Q5b1o2eFRIV1Y4dklReWk0TmhvYnFQRSt4QVdC?=
 =?utf-8?B?YlV2KzR3aGFURUZTNEtPQ1J0VXNPRGVrS2dKNFB2NDVXUXBLVTByYlE3NHFW?=
 =?utf-8?B?OVBoVG5CU2IxTHc2MzV3VEdBWkhEdWNmRyswVHkzMm4xQWpHR2ZBYXNvS240?=
 =?utf-8?B?MHlMN1J2NDB4Z01tWlFNMHNaQ2FWUTBINVh4RWtxU3VtUVVXTm5MczB3RUZj?=
 =?utf-8?B?MmxOSCtLdmhXWklQSE43T3N6Z0JiZWhWOFlta2pwa0lNNndBUGhrY2E3cjFM?=
 =?utf-8?B?QUYrbWh4azl3WGdzVi8zcE12WmovRlpxQzhBTVBUcmpGL1JpQWpydm80T01I?=
 =?utf-8?B?RmdzbytmRWVGN3dSVXNxNmM5Z1lhbWJCM09DUW1sZzFXWDdqc1ZMSGtqcFhV?=
 =?utf-8?B?aEt4MUY5N0ZIUnBWRllOTzlwVlRtd2JPTFpySWRQYTgwZG1laGhNdC9ZVjZm?=
 =?utf-8?Q?O16EmaheTw0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UktGZjUwaFFVSEZMR1NpS05sT2VvZFpBcHpmSWRDVjBpMzdNVkZwc1BLN3h1?=
 =?utf-8?B?U3NQQy82ZmQ0UUhWZ3ZiQjVZejlkVkJ5amhUWUdEQzR5WXBkVENUQ1FRd1d4?=
 =?utf-8?B?ZDQ3RCt3dStTbXRZaS9aMXh0UjRKa2dmR3FJK0NkbFhtQ004cnVDazJZckox?=
 =?utf-8?B?dzFkMnJ1blBTUHFuK0hudG1sbVhkOWtWc3RMcE9tK1J5d0dDMlRxMU1uTWs0?=
 =?utf-8?B?alF6SjR4SDgyc3dOditSTnBtQ2trU0NSWUxpb2hMUHZIcm9SNFlueWV0cGZx?=
 =?utf-8?B?eU5uaDJma1BpdnVnNXl5KzNvMU1NdWpGUUtucnpKUGh3TlZsRTc2YVpPK1Vo?=
 =?utf-8?B?ejNBWWpwbERhenphcDJRT1FvN0FpUGZ0b2R5K0dQYXI3aVJ3VUNFTGdnamNW?=
 =?utf-8?B?SUdlVUhVSE9jK2NOQ25QSmtxajlHWE9TNmc3MklhT3g1VU14RlBmTVR2cnVV?=
 =?utf-8?B?anJKeVhtanArZDlHTDMrR05tYWVlWDVNdU9xYU45bG0yZ0EvbUNGME80dCti?=
 =?utf-8?B?bGFwSS9EL29vTTRKZldTYldRMDV6cWxvSlFNRkVrM1owd1ErOGgxQnNkMlY0?=
 =?utf-8?B?QnFsNWFwOTRyTU1pWXplRWNVbTNXa2p0c0c1dXJwZ0JPV1ZQSE44OTFTWWVP?=
 =?utf-8?B?cGRqNi9YczRtRi9aQzZKRkhBK3gzUENDWDR1REN1bnl1L2duVE9oRjRjbjNJ?=
 =?utf-8?B?YXZJMkw5R3VrYzNLczRZRURWL2luMWRMRHM5N0p6MnNETnpnelJwN1hyZlJy?=
 =?utf-8?B?d1Z4Z2NBZXZTZ3RhNU9aTWVQNWZFTTFjZ1NpakZUZ2E3QjdzN3ByTXNvcUE3?=
 =?utf-8?B?bWFlY3hsbmtSWDdPbWtDZk1oRThEWVU3cnI5emloRmg3ZjBicU5oOElRYUNU?=
 =?utf-8?B?RlNDNHBLRGs2QUR6STVpcUZibnNPamNSakpUSG5xRXUwY3hCOEJjWC9Fd1By?=
 =?utf-8?B?czFDOHdaV2dKSm1TTzNUaGplRytxekVlRUJlN0kvNWNrV09uc3lHbWtzejlx?=
 =?utf-8?B?UFowME1IeFNneVFRZk5HcnEveDVncHdmUGQxWmNWeWZaME5zV0R3dytBOUt4?=
 =?utf-8?B?TWc5bU9sbHdkazhQQWx6d2ZTUW0wUVRJSXV3dCsrSk56QXJCZ3FFK1hycWZ5?=
 =?utf-8?B?allIb1Fkc01VK0thbmV2SmlCblNzNFEyWnkwNlZxcjR5MG9rWWttMzR0Sklh?=
 =?utf-8?B?SXVGL1M3a2x3L2JoRmxsVU1oVXNnSVVjeUFMSnF4QlZYZDkxUy9HclhQM2d3?=
 =?utf-8?B?VUJWbFZQWjAvVjJaa2ZEdW9TcWxkanNzeUtQMkJiRmRJM01QdnJJSk5XSU5Q?=
 =?utf-8?B?WWFUYjNPV1RzVFJ3emUybkZLbDFKdFJ3TnNuMXIxQTZLc1JTT1h0Rm5zQXVS?=
 =?utf-8?B?RHpwSXVUN0RIN0FTbXNzaHZITWQwaUZ6ZE5EOTY1d1N0NDQ1WThpamh5TU13?=
 =?utf-8?B?ZXlESW9HZHhyeVRreHpGVklicnZxaGM3T2E0SjdVUVI3eGdGbWJJS0Q0Y1RI?=
 =?utf-8?B?bGFnaitaUVF3Vy92UUZYNzVSMTFrai9FRXBFdEplaHFUZ0tKVlRwblBxckFN?=
 =?utf-8?B?TGdLcUlyQm82UldtUHNQQWpQNzJHTHFiNngrNk1zYmdocWVadmJRZ1l1VXVH?=
 =?utf-8?B?Zllpc0pHeGFmSk9oL3hONEZ0UVROZEFCdVFmTENjQTVtTmxoK2xXQmVGZlkv?=
 =?utf-8?B?djVCempaZlJ0akNPcjN5ZzF2MnVFS3lqWG0weDJkTjU5R0c4UVZiVlJQSnNL?=
 =?utf-8?B?bFd0cXNVQkIrS3RHR21VSDBScUVwMGs3YlJpc29SZzdmRmpDU1JmNStFWTdG?=
 =?utf-8?B?S0srZzVxUGhaUE5udUVKNU42UVBtejIrS05meGVBOUtzSGpCalJmR0dYam5a?=
 =?utf-8?B?ZDZodFplMGIzV2psTU1TS01BUVZQcDkxT0hYOXd6YlBadlQyRnU0SGVjOGJP?=
 =?utf-8?B?NGdMRE1rMGdGSVB3cTZnYVArekI4b3MxdTZvYmNnUFN3U1ZSUVcxcmJxL21x?=
 =?utf-8?B?OUVzZEtXNHRBVVBQQSt5TGlyRXhPNjY4WVgwT3QxZ3B0N3FzOG1wQy85SVQr?=
 =?utf-8?B?REhMZ1IyYjVRZVd6c1VmWHc1bE5zazEwUWtWNW1uanJqLzN2cmowV2RoQVB4?=
 =?utf-8?Q?uKg0vU5oy3T3hVPVI6TMskMxs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33a9817-11df-489c-e747-08dd7b302ad0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:41:36.5890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEQ0/RHFRIrwgFLlAPNl775OqHRsVwvXHCOnI+2t6LaU0c2RcHALOoBDRzlLy2BL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320



On 11/04/2025 13:04, Ayan Kumar Halder wrote:
> Add stubs to enable compilation.
> 
> is_xen_heap_page() and is_xen_heap_mfn() are not implemented for arm32 MPU.
> Thus, introduce the stubs for these functions in asm/mpu/mm.h and move the
> original code to asm/mmu/mm.h (as it is used for arm32 MMU based system).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


