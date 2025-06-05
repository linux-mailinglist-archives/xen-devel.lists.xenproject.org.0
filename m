Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB514ACF099
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 15:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006871.1386123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAgx-0000Gj-T4; Thu, 05 Jun 2025 13:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006871.1386123; Thu, 05 Jun 2025 13:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAgx-0000En-Oe; Thu, 05 Jun 2025 13:31:35 +0000
Received: by outflank-mailman (input) for mailman id 1006871;
 Thu, 05 Jun 2025 13:31:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsQq=YU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNAgw-00005M-TX
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 13:31:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2009::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 641b5431-4211-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 15:31:32 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 13:31:28 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Thu, 5 Jun 2025
 13:31:27 +0000
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
X-Inumbo-ID: 641b5431-4211-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfby94nD+xuzNuZsYKFmeJ+SYplMO31SpfDn36ERJx3Qqos9Qpox1p1B7h/7uQ+5tWKrwsL8SQV6gtvM1rUmtl/eJs0sptdSLzvKMThKToquYfg8Z62YiRAR9PfOwIfO2RsUrUnlRl4IHVs0uojgwGezFTTCKi40OqL62iMgP1/WVss0MrXp3Y4jpgvr0qZ8bse72reIiaks0xHcmg/TakBYtZeibOBN0yvZINaOi+dBvUuhQ7NiF3O8Q80dxS+xQUJXYcK4x16qfj/mBw8qMGGUzmR+PXQhKakrUrVMUL5OtqlljLs80LMt4n2nT7clXsfoMf7luFLBec7a0Iew5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZL4seLeWizooK8DSDORy29joCdvoLteFXGH7nIHNwD0=;
 b=DOMVBNtDBINYbjm89RJvWxMd4lYmbPeT3Rg85tUrj7480W2HdrblEER6187rb05nnesI3StiDwUHBrNt0ZfqVW9rEwUUT8b2mpbneZHb0B42pHq6y7j3v7L+mQddPA2v57BtleCVIaye3itspbjLnaSBBwetqMeiViRNGJVIdnAztwYQcYOCegiZl8EIovNDZA2VOJNZq3ylAArbvmmsScLmsTUQfSwP259hPsW6c3kZlDnBAS59Vgi4DvzqeKQQk/SotFupeM9yVEXAUD0n86IEP0f1CePkr+3wHjD46OATqX3Y1spSPs+sRm6ds8e4pD7rW3dJpFdWwIBcR666EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZL4seLeWizooK8DSDORy29joCdvoLteFXGH7nIHNwD0=;
 b=fikVJoGYY5C3eI+CpCvEG15+int9RPfZSv/JUuMQm3G7o/2fcYOPm4j0E1nytrWIjJTIuOPDACDkW4WzqEZnoRQVxZISaxDFF85KzuowLR7EC1jSgVVgykpFxeaadMij5s8mnWJLjpFkh1mkKwfXkktJ/WxnV9txCKQgspioqIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3857c1c8-0abd-4058-a355-9c12ab08ad3c@amd.com>
Date: Thu, 5 Jun 2025 14:31:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
 <154A0263-6E4D-4855-9408-ED31F45B293F@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <154A0263-6E4D-4855-9408-ED31F45B293F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 29252b29-5ef2-4452-c548-08dda4354602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTNkYWZaOElvb2xrdWFRWHVyS09kajY5K2lBYzVZU0NJRzJzMVlnQ3M5ZW1M?=
 =?utf-8?B?TkNwakNtVTJPSFR6RG1DTlJWZHd5TThkdmdFY2dPSVYvTUh0VVRJREZtMUl5?=
 =?utf-8?B?M2k5Q2NIbXRhZ0RlREdKbUdsYWV0WnQ1VXFVR3BSN3poV1lxakhKeWh3R0JQ?=
 =?utf-8?B?a2F5cGRnRGN1Yk9zWmF6cHVkVG9UZWkxM0IxRlF2SXJhRlJVakZPdWtxbXBL?=
 =?utf-8?B?WGlJQWVaRFhZMitHNisyUnUrT2Nkc1llRjYveXhnRVVDRUxkVHJod2pWVTNT?=
 =?utf-8?B?Qi9nR1Q3eGpROGoyaU1kOHhUb0F1cVpYejJYd0ZLTmU4UmxLZXdGWGMzOTNt?=
 =?utf-8?B?MEFvWUNOQUcwbm40N005L3NtR1hFb0ljYnc3Y0JnT0t2SkNhMUN2T3dQM0Uz?=
 =?utf-8?B?SmdPYnBvSW8wTnAxeFFuOFFaNytFY0Jzd29kMlplUDRTRng2a21KMnF5RTdY?=
 =?utf-8?B?eGJPVi9RV25GTnpJUTZDWkl2dm1ySCtoM3JNeDZkS3VyWHUvdnVGb2hXejh2?=
 =?utf-8?B?TGJRZmRKNkptWTZyNTZUczlVVGdJOGtZMDFaZjkxY3hPN2hhZjNHZFBqOURE?=
 =?utf-8?B?SEk0NWg2aU56MjVnT09SUUpBVzEwaldWVzc2Wkk2SVlmRk5adW5JbldqNHpO?=
 =?utf-8?B?OHA5amNDKzVIRE1zR21HMmt2eUI5MFFmaktlVW1YeGIxV0U5c3BSWGR3Skp3?=
 =?utf-8?B?d01SSDZIbVVYRmNqMGNJeHNjd2xsZDdUQ0Urb3lXQlhxSzJPOENXOTJJNHVD?=
 =?utf-8?B?VDdxNTVVTzF4QnZia3dUMmZLN3VSQTU0OVJoZDR0OW52KzhFQUMvSjFPRGdt?=
 =?utf-8?B?bUgxdGVTU2U5aUVrMFo5Ujg5TlNZdUU4MjZ6N0xIRm5OM29oRWE5OE82dStH?=
 =?utf-8?B?WkxhZlBLdkpZeEpDRTY4cm9tVHZZWTAxZzhMUFE5VFFKMFVlRzdkQUdEenls?=
 =?utf-8?B?OC83VjZ6UGZWa2NEMVdLS29ZZzJ3VXZoR0x5VFBoVmg2TmxKQkV2TjZwUHkz?=
 =?utf-8?B?T0dpR205MWcyRGdWRE9YZDBKUjN4N1FSOXc2Q2FleEl6L244QkpVSGxFR0lP?=
 =?utf-8?B?d2oyYzJNc1lwenEvSVdiWmFwUWplY2ZmdzJ4bjVwcUdyQnBvQWpnTkRBS0Rn?=
 =?utf-8?B?OHVNVEcrbEpEYVJyWExpUnkxaEl4SEtuR3h6Q05ZQWxkc1ZhSkR3bE5mVk5H?=
 =?utf-8?B?QlBmbWNzeWZsQmN0TmFhMDlmVSs0a082Y0ZJSHVUU1FJclBGUWlBRWpTUER4?=
 =?utf-8?B?ZWd0RFJhVURxd0FuSStBU2xMc3IvMG5wU3RTM0FLQlRjM3kvR2ZVWmc4T3JG?=
 =?utf-8?B?eVlHVVBJQlFtMHBRUkphUWlUZElNaGtaUDltMldqS1B3cTA3R3pQVVNWUUdk?=
 =?utf-8?B?WDBLcXh1dTRMaitjdG0rMkhpeUlicG5DdHU0TWFFK2UyOEc3eWY0OCthR2tv?=
 =?utf-8?B?WmtwN3dIa2NjbmZoWE0zN3FBYnNkQmg2RXBLYkh3OW9SbGRPdTg0Y1h2dTJE?=
 =?utf-8?B?UVZuMUtsblRtcmkwaTUwdzlrOTczY3l3VXpFRFcrelpJY2wwVDlTcEJjd1p0?=
 =?utf-8?B?anRQanJRbTFBTE9zQkJEMEpMOFdtT2JtOU4wKzJmdlBsbnBaOWpFcDdvSVRJ?=
 =?utf-8?B?cUZQekM5TDdWRm9tWHppZHUzdjFVWk5HS05VUFFpanl5bFV2QTUvRTlWaEVz?=
 =?utf-8?B?L1MwUjV2ZlRLUm1uczQ1WGo3a0VmSUZIc0F3VXFCeUZuTVduRlBHRHFtWDBI?=
 =?utf-8?B?SnVnSzdZcXpNeTJScFFFUnVzOHZpeERDSWN4Y0pvaWt3NDZCNTYxYlFXbUpi?=
 =?utf-8?B?aFBxclB3ZlV5aSszdHVBQmQvOWJ4cSs4Wjk4blFQQmV0a01aYXI5VnJwSzRY?=
 =?utf-8?B?NWFWZXEzK2Zmd1VnVHB5d24rZUhMckQ3QUtnZUpFVFFaVXZTSldDUnhobXVl?=
 =?utf-8?Q?SUebr6fLjIY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJRTkg2QmJhblE0MnFIaEVqVHM3L3BTQlVZd3gxcVovUTRYcVU4eDl2Mk5y?=
 =?utf-8?B?WlM2d3BjUzZua2hnSlFvaGVEL1c2aUtaN001c1FlZ2lrdDdrNDI1WGVxQUcy?=
 =?utf-8?B?UkIrdWJScURoQjhmZ1dWNlZBUEROK3VsT0o3MGJTQkF4OSsrYVRRU0xFblRL?=
 =?utf-8?B?RXNESU0zc1doWHRKUjFIclRydWthWHlRNWZOU1MrWHErcTdGZ3VSbjdUTUJN?=
 =?utf-8?B?VElWNVJvM1hwVmN5ZEhwWXNJdkNoeXBPT0poU3BmVWg2TEd3dVFxb05wa0xj?=
 =?utf-8?B?SldOcTY0RVFFUzBOeTdUdW1Kcmw0UjNiNzgxZ09xcjgxNlpCN0UvQURoVzJz?=
 =?utf-8?B?d2NXMjk0cFNqTjAweWpldlVPVkh4Z0wyTDk3WW9SNHNEWUhLUk1uTGhLVnd2?=
 =?utf-8?B?SzFiZkNPU1FIZEVuZS9FTGN5dlI5UUxySGNGUTJFS2tvZGRnQzVOQUUyK2VT?=
 =?utf-8?B?S2I2dkczN2NIcUhqRVJuUC8zclRaZklQNzFLZUJCb3dPRUROd3MzYks0clB2?=
 =?utf-8?B?Y1ZVWFRieEFWYWdKUjN1NXNhc0RoS0x3K0hQUUVjTkpONGxxY3VMcE85b1lW?=
 =?utf-8?B?TXFFY0NVUVhxMFlkcTJQNWdNQ3lob2paUUM5Sm14QjZudVlCWXZCaHI0YmhD?=
 =?utf-8?B?MCs3c0I2QXd4dlVTN0VlV3ZBRzkzc25sdWd5anArMzU1UngvS3VhOERKSkQ1?=
 =?utf-8?B?QitvT3IvYjB5ZUwvcHcxRTc0OFVyc0d3dldSRFYwYkZhMCtvbjhmVDB5T0x6?=
 =?utf-8?B?YXI0U28vRmFweXRqSHViWW12dFFuMnZvNHV5Qjl4UkNiMXVIOEI5ckJjRll0?=
 =?utf-8?B?UkRLOVRiNTE0aVlXelE0TTIzV3o5aE0wbzlJSlRST0Nyb2NOM2w0Z3dSV1J4?=
 =?utf-8?B?TnN1ZU5IRllJN2dVaE5tN0xXSW8zZGdBWlc0KzdqYldqMTByazBPMVdaa25a?=
 =?utf-8?B?aERIYWN3Uk9CclI3dDFyS2JwdXo4RVUzRVJNQysxZWhpWUtQaHRIMDR4ajJp?=
 =?utf-8?B?TkM2aEsxSWpnNzltSnJkU1pIaXhpM2dVMjM4ZHZMRytwNnZOYlphaUNLbVl6?=
 =?utf-8?B?VmZCS2F4V2ZZbC96MEp6N1JRcXgwVHY4R2F1eHk0ZFZJY2hURnM1TnRaZlFC?=
 =?utf-8?B?c0c0L005amJhUEhWUUowM24xT1V1b28rVXplSStVT1dDUGRUQW5CN3VSQnp1?=
 =?utf-8?B?a1NNTmJZWklKdnFISnl4WW9QWFU5eXY0Qm5GSUNlS0NkRXQ3NEo3T00rVURM?=
 =?utf-8?B?aS9lUXVWR2srbHZ4cmxmbEdBa2dZcThYOWhBc3BHb1R4ald1N0RLaU9iRnIr?=
 =?utf-8?B?RTA2aWEzYXNKekh3aUhqYU1YVndIZ2FESzg1L2pIeXIxeXMyVzRQN1cyLzZB?=
 =?utf-8?B?LzRFMlJmaUVtYnJ5OU5samVYV0ZSdmRrYVNjMCtYaW5qYXFXSGtPRnVzdm8r?=
 =?utf-8?B?MXNHSm9LYzhET1Vod3VPVlh2WHBsbWdqS3FFWStlRFVZNzl3SE9nWEp1WW1q?=
 =?utf-8?B?RlpZZHlTSWROMU1ZOWkzOE84Qkp5Yi92Tk5DOThwZkVqL09rRGgvdW5QZm9u?=
 =?utf-8?B?d2JkaFB5M3gyM3ZrbnNjelJpN0I3Z2QvVFNsNEhwNE10bElhbllLYzNaQmY3?=
 =?utf-8?B?N21GaUdWOGY5dVhaSEl6T01KZXhHK1VRQldtOEF4c2E3NXBlT1RLUXJXb0pH?=
 =?utf-8?B?VWJoYi9tT2swamtaeVBYdnp4d21vK1MzL3hZR1Q4UW5GRVNOWDNuZlVFNHI0?=
 =?utf-8?B?bTFUUWFlNDM3UHRWQ216K2x6ckdFUURLeDE5ei8vNHYxOExQZWg4eEVMUmVs?=
 =?utf-8?B?NXV6Skd1L0tLdWJ2dE5OUGMrdExEb2NtS2s5aWJtRFJQMTc5dUxJN0FneXRx?=
 =?utf-8?B?c0hzQWdyY2tqQnNWRHFHU2Zrd2EzVkVaV29jSGY5QVpaS3gzaGRqNHBVVzNy?=
 =?utf-8?B?S1h6aC9mOUczSENHQUx4OEpnaTYvUTZDWSs0TkMzWVlNdTNXclh4MnRXN2VB?=
 =?utf-8?B?aUpKV0dITWJRT0lsRHFDbHFYQ1ZEbkFzOUlSODJmQ1dNWmRzUnJZWlFwei8y?=
 =?utf-8?B?TTl5SElVbkNDT1I5RnRITmFNSzBDOUdOZW5PYW9KZ2tMbktzLzhtYmFpNEYy?=
 =?utf-8?Q?bqZJc0JwXTyq3NgRFKRnp7q9E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29252b29-5ef2-4452-c548-08dda4354602
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:31:27.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3GLBuIxjTUtYNj5D2Htq524iS+o7FsUHd11T7rgdVOr8wE/I/NQj7PLxZMRfgSLPg3fd0Z5/QFQgF6jvkTeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563


On 04/06/2025 20:19, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 4 Jun 2025, at 18:43, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Introduce pr_t typedef which is a structure having the prbar and prlar members,
>> each being structured as the registers of the AArch32 Armv8-R architecture.
>>
>> Also, define MPU_REGION_RES0 to 0 as there are no reserved 0 bits beyond the
>> BASE or LIMIT bitfields in prbar or prlar respectively.
>>
>> Move pr_t definition to common code.
>> Also, enclose xn_0 within ARM64 as it is not present for ARM32.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> xen/arch/arm/include/asm/arm32/mpu.h | 30 +++++++++++++++++++++++-----
>> xen/arch/arm/include/asm/arm64/mpu.h |  6 ------
>> xen/arch/arm/include/asm/mpu.h       |  6 ++++++
>> xen/arch/arm/mpu/mm.c                |  2 ++
>> 4 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
>> index f0d4d4055c..ae3b661fde 100644
>> --- a/xen/arch/arm/include/asm/arm32/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>> @@ -5,11 +5,31 @@
>>
>> #ifndef __ASSEMBLY__
>>
>> -/* MPU Protection Region */
>> -typedef struct {
>> -    uint32_t prbar;
>> -    uint32_t prlar;
>> -} pr_t;
>> +#define MPU_REGION_RES0       0x0
>> +
>> +/* Hypervisor Protection Region Base Address Register */
>> +typedef union {
>> +    struct {
>> +        unsigned int xn:1;       /* Execute-Never */
>> +        unsigned int ap_0:1;     /* Acess Permission */
>> +        unsigned long ro:1;      /* Access Permission AP[1] */
>> +        unsigned int sh:2;       /* Sharebility */
> Typo: Sharebility -> Shareability.
Ack
>
> Also, from the patch the comments feels not aligned, is that the case?
When you apply the patch, the comments look aligned (in the codebase). 
Does it look the same for you ?
>
>> +        unsigned int res0:1;     /* Reserved as 0 */
>> +        unsigned int base:26;    /* Base Address */
>> +    } reg;
>> +    uint32_t bits;
>> +} prbar_t;
>> +
>> +/* Hypervisor Protection Region Limit Address Register */
>> +typedef union {
>> +    struct {
>> +        unsigned int en:1;     /* Region enable */
>> +        unsigned int ai:3;     /* Memory Attribute Index */
>> +        unsigned int res0:2;   /* Reserved 0 by hardware */
>> +        unsigned int limit:26; /* Limit Address */
>> +    } reg;
>> +    uint32_t bits;
>> +} prlar_t;
>>
>> #endif /* __ASSEMBLY__ */
>>
>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
>> index f0ce344e78..df46774dcb 100644
>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>> @@ -34,12 +34,6 @@ typedef union {
>>      uint64_t bits;
>> } prlar_t;
>>
>> -/* MPU Protection Region */
>> -typedef struct {
>> -    prbar_t prbar;
>> -    prlar_t prlar;
>> -} pr_t;
> I’m not sure I would do this, at some point there will be the transient flags and p2m type
> and we know arm32 will need to store them in pr_t as additional members, instead
> arm64 will store them as part of prbar/prlar using the not used space (without writing them
> in the HW registers)

Ah I see. Ok, I will keep them separate as it is.

- Ayan

>
>> -
>> #endif /* __ASSEMBLY__ */
>>
>> #endif /* ARM_ARM64_MPU_H */
>> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
>> index 8f06ddac0f..c8573a5980 100644
>> --- a/xen/arch/arm/include/asm/mpu.h
>> +++ b/xen/arch/arm/include/asm/mpu.h
>> @@ -25,6 +25,12 @@
>>
>> #ifndef __ASSEMBLY__
>>
>> +/* MPU Protection Region */
>> +typedef struct {
>> +    prbar_t prbar;
>> +    prlar_t prlar;
>> +} pr_t;
>> +
>> #ifdef CONFIG_ARM_64
>> /*
>>   * Set base address of MPU protection region.
>> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
>> index 86fbe105af..2fb6b822c6 100644
>> --- a/xen/arch/arm/mpu/mm.c
>> +++ b/xen/arch/arm/mpu/mm.c
>> @@ -167,7 +167,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>>      /* Build up value for PRBAR_EL2. */
>>      prbar = (prbar_t) {
>>          .reg = {
>> +#ifdef CONFIG_ARM64
>>              .xn_0 = 0,
>> +#endif
>>              .xn = PAGE_XN_MASK(flags),
>>              .ap_0 = 0,
>>              .ro = PAGE_RO_MASK(flags)
>> -- 
>> 2.25.1
>>
> Cheers,
> Luca
>
>

