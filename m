Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C725A5EFD0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911720.1318127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsf6H-0006Ji-Jx; Thu, 13 Mar 2025 09:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911720.1318127; Thu, 13 Mar 2025 09:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsf6H-0006I9-Fg; Thu, 13 Mar 2025 09:43:37 +0000
Received: by outflank-mailman (input) for mailman id 911720;
 Thu, 13 Mar 2025 09:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsf6F-0006I3-Bo
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:43:35 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2416::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0112909-ffef-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 10:43:33 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA0PPFD7DCFAC03.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 09:43:30 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 09:43:29 +0000
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
X-Inumbo-ID: a0112909-ffef-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhzZYlzIu8upEXWeV/q1rucc+QMWS30z+jBlVTHe5M7G3S8vWgFI9kMD1glxaZeQFUf/FjHxwFs5PG8KpY91Pt1VpZcDtadBLXVh2cfOzQr45ZU3Cka4LDr3AG+fgruPRYPP3dmbVLu6OkSwNxoqL69MNURp6CseCg4zQx3QWiFGufaSrhXLBQV+IqZA+iZgZBh8dwxs77h6QEf5gkwrxjh2Dn73eBVUQqc1izF66xcMKCuz7RrJKb0p58jiyrCw1PRG8DOs3/P6E64OhEISugMiTUBwTv3kzgZBw/R7m+C+soTJRZ9iq0B6hsc229kS37w5ygKL2qxao8c386rorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MLgFIuHglnkmHeZHvk8nI94EBwsLduf7dnCxaU66Eg=;
 b=xkg8sQefUmqKHX7m7X4nXXoSp9buEfG+HTVn0hRvYAHdYoDg4d+Pqgpz3IswMt7b53W6FD83qcVtOS2RAuqlw6u26Xph1rBSWFDdNkpTZSE+9LIKlmlo1esMOVFMehpO7CdzZhNCA4sFtMoJqXIsZ31O3+TYSp0Soc2EKc4P9GFswsJcu23r5xubNPcPZ+fUrr1Is8aQS3HpjsNCi0r0vf4I4dmp2NOh7aSuQ0hhsa1hpfgD7E0K5+AuvgHx+bBvEDEVPeU+xxg4082MaS0zBXxZqZ+OzoUEOudzLCcNHyU96VALQ5W0G5wXEgt9OlsyO1LUT6nFwgkUAT/3vmZZ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MLgFIuHglnkmHeZHvk8nI94EBwsLduf7dnCxaU66Eg=;
 b=Ayj0wZgEMaMomAdRO7wLI2FPh+6FwXptBOXU2v1DXtNGospRyHNG98qkrjgTpwG8+msB5D4HE6gmRj81jZw5pfttMO8GZO4GK2VbRsEfz8zXGX5r4/HACTrhcgK3qw2D2HaUZNUcmP6RP/Rbjk570445adbXWNnHo34clArUwog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6a372989-e51c-4165-8f03-41da8e3a9bdd@amd.com>
Date: Thu, 13 Mar 2025 10:43:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] arm/mpu: Kconfig symbols for MPU build
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-7-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA0PPFD7DCFAC03:EE_
X-MS-Office365-Filtering-Correlation-Id: 71dffad7-3d45-4632-1699-08dd621382dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3d4U2N4RmpLWG9QQ2hIWmRXb2dFcE93enhDeU1BK3hTekdCQ1VwMFNldWZ1?=
 =?utf-8?B?RTNRbXdPTnp3clJCOFNzc2tDWms1UmJtR3M0YlA5WlNOMkRvc096R1d4eHVq?=
 =?utf-8?B?b0g2bHFWTitrQWo0YlZIb1NFSmcrbkxQZzJVUGZJbTVCdjVKMnZwNUhkd3hB?=
 =?utf-8?B?TGY2MUF4VjRURE41OUx3cHlwVnM4RGp1NjNSTzJiNG0ySVhGVlc3b25NMW9y?=
 =?utf-8?B?TW1jUHV1S3RiczM5U1ZxbmE0RU9hS0Q1a3p6WTlLVjd1ZzViL28xRUNJL00r?=
 =?utf-8?B?cXBLMWdqQWhLTitqSDBvdS8vNitLS2RsWExIVzI3MDNXVURsMTFBR1RzWkRq?=
 =?utf-8?B?QVkrMEJjT3F0UmJkWm5DWnJhWVhTVzZpQ0VITDJPcm0wNFRTaHpGdGVtR1hC?=
 =?utf-8?B?K09RamtGTGIxVG50czdjQkNHdVdlK1V6cXFlNDk2NUpGL1dxTTdUN3RuaHZX?=
 =?utf-8?B?L09zK2NIZitLTURqazZwWTEyNzNGY1poR1FvVEVQRy94R085WUNHS21aY3hv?=
 =?utf-8?B?WEt3aER0T1ZOZ0NjWUZMdjRTM05GUTNucTRLY1QwV1VnYThOQ29tWWxxT0Vi?=
 =?utf-8?B?a25qNVlBanR5Z2dBZXdHNnpwRWorVGtyUVQ1YW9aRi9tSjRZUDB4Zyt4aEVB?=
 =?utf-8?B?dDJ2YTBYWnpXVVIxSE4zbHNzT2VheDFSWm9BNy8yWlRNRE90ZkpUQXVVS2Ft?=
 =?utf-8?B?WmtpZEpVVTROSHBrVnd4cnBLSEhuY2d6aitUdUVyZ3M1NGt6NU1aQ3RNNXJi?=
 =?utf-8?B?TDhmZHVaeW1ndlA3WUtHa21iT3JkTnk0bmc5MTVjWnpuNlpDd3BudkVkcHJJ?=
 =?utf-8?B?NDdtNTIrWWh5enB5Zkw0VWpLc0lqWUxFL29ycGtIVXRBNHNuOGlPUW9WT1Ew?=
 =?utf-8?B?bU1VQXlkWkh4Vld5VjZkZGxUN3JTSVRWWnpxcFZjM0RLUGVrOHhjMHFHcThC?=
 =?utf-8?B?OHRiMFA0NmROV3g0czFMTHlqY1l2eGVJK05tQTJjOGxwQWl6SXlFNXFLRWVF?=
 =?utf-8?B?TzZhdlZvSE9heG5QdEtXUnFaS1hGekZ0eDQyYkFZS280YjRoU0lYYjRWTTla?=
 =?utf-8?B?Yjlmend2V3lMK1lOVEl3NFNsVEhIaFNNalBlN3pOTG9HQXY2NURLa1dMbHg0?=
 =?utf-8?B?UW0xYWpiSk9KbkVIUmFoQ0QxTEx4eGdnM2xJTDNtUWNaeDRqT29mN3duUmdt?=
 =?utf-8?B?RFhvdzA3dXMxMDFzdzBhZklYeTdMR2RIRysxUUNXWUJFK255ejRZM2FBVTBy?=
 =?utf-8?B?QVZ1Rk1aYWo0K0RFM1l2TzlFdG90QUpEaTZOK3FTOXB3WVdzeklhKyt6Z3BS?=
 =?utf-8?B?Tmp0MW9WV2hmdHZLbXRvYkg5c3BPQVN4K1g2ajNuczNIblRFYjZRVGtmaVIz?=
 =?utf-8?B?dVpkOW1vZ1FNK2QrY2x0V3NzbjhXQXZWT2g1MHZUbU1aa2ZXRTJjc3NaN3Y1?=
 =?utf-8?B?NW9VMEVtV3FObTFad1p2c0duUUZ0S0xhS0FMczlyald0Mm9kWXhSUlFDWWJ4?=
 =?utf-8?B?SVZ2UWNrSkVMQ1JtM05HUzJ6cXFtS1p5dnVLY1dUVzBpNEpoQkpyK1VMVmg3?=
 =?utf-8?B?Y0Q2aFpwM013bTVMYlQxZ2tMekR2U2RTdTVJV29memxTMDcwT2QyWjhEWXRH?=
 =?utf-8?B?YVA2Y2ZyMHFGYi9ocHVKTWlnM0xBU0krTjNkdlgrR3ZYenRjQldSSnlzakNM?=
 =?utf-8?B?Q3E3ZmJxR2NEaU5yMm1jVU54dzRBc2x5RnRMc0lHSytzYldnaEZnWllkbStL?=
 =?utf-8?B?N1Z0NXhsM2dHVUVUNVYzQ05JN0JYd2gwbHBaNlBxbWtzL1NOL0hZY0hZbnc4?=
 =?utf-8?B?RXI5emxFKzcyZzJKc3pWMHJlQXR4L1d6UDZBK2x1MUVqMFJaemNPNWhicnVH?=
 =?utf-8?Q?+q8SaKOtpLmBi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alFqOUMrbXhGR0ZFbDkyYmwrSkliVzRkUmgzMGdMeGxKdnRUaHUyZDFEbmtH?=
 =?utf-8?B?RmhIQUFpSTZzK3dtVVpBVy9PWStBRlZjZkl3ODJkNENVMzBDcHRuRUx6anZu?=
 =?utf-8?B?VmZWN1BBZGxLNXJ1enpjaVduQXMrWnBDaVpSTWQ0WTNjQU52MkFmMzQ0bCto?=
 =?utf-8?B?U3J4WkVQS1FBR3Z1NC9IUzhkbnJwYVVaa3ppQ3lSK2MvZVhQeUlFS1RYYVph?=
 =?utf-8?B?MGhORzJsNUF2bEQzVXpHcTBDdHJaN3IzOEhQUjlYMXBJSlhDdUdxTkNRaHVR?=
 =?utf-8?B?VWQvd2RCOWk2Qmk4UXNySnBuQzZFaDhhalJHVG9LYVhtaXFtd0tId2RNeWJR?=
 =?utf-8?B?TzVoMlM2SzBOVmlPSWY2dGdxRGNlZTFRcGs5R2pKSXJLek9ndy8yMXdUUXJi?=
 =?utf-8?B?akp3WG5FUDZNbjlQY0NGN3F4RzN5M1NUQ00yRGIxaGdBUVBScm83SDVvZHpk?=
 =?utf-8?B?UGVwMm8xZFgxbDNsVEZOTkZocjBMaVNvdHRBU3Z6enB0Ris5Q0VnN0Y0Nzlo?=
 =?utf-8?B?cW5rWFF3YmQzN2J1UXRYd1Y2cVpYeTkydTBPbTlBRHphODlYeDQ1cjN5MWNR?=
 =?utf-8?B?OGd4aVY2blRyc2RVRHdjTm5ONEhmMEVxS0RyZENtZDBRS1pUalNDcTlVQjJ3?=
 =?utf-8?B?L0dTMzJKeFJoVkwvTzh3eDBBbitqWHJxTEF3Nm1NaklQQVdvQU93WlJUNysz?=
 =?utf-8?B?S3BhY2R0OHJuU3JEeHJ4M09KY1ppWU5MZHJaNFJXeHJyMFJVQTk2UVpaRStu?=
 =?utf-8?B?K1VzK2FDNDZDSkVDRHh6MGJlR1Y1UGh0VnhQaUhhbWY2YW85Z05VNDNLRkFT?=
 =?utf-8?B?WmMzOWRiODROcENqSXYvZ2xsRkY1aTlJb0pKNEZMdFVKaFpldjYwdWZ2dW15?=
 =?utf-8?B?Mkl6aE5SNlFuMTFqZWF4aFZNMlFnc2N5STBkOWtCOUhMajlyRjF1d2ZFOVBX?=
 =?utf-8?B?aEhLYnY4K0NJZWliVGdYV3NrY003SlZFaFRNbnhsUk5BNlZKRmhGaTdkcHRh?=
 =?utf-8?B?WXlMWFcxTHFEUlkzR2wveGc5NHcwNFphb0RWek1Wb0lDb2V4RU05T2lDUlBk?=
 =?utf-8?B?dXllbURWNVRsbSt0MTVCQWcxbGtXbkhuSXhraEVFMXF0M0RXU09WYnZUcGJz?=
 =?utf-8?B?U29VbVkxd0k2aFBmRmhNNDI5eDkwYVUwSUdEUDNXRWI5d095R0EyVkV5eGFY?=
 =?utf-8?B?Q1pUNlJPVFhpL0FiL2N3bTg4N1FJb1R1bHlqS09FbFp4UHdqbU96c0J2emRM?=
 =?utf-8?B?bjFMNGZadCtDUkdVQlgzb2RwcFE3NE44dkkrR3FBbzdQN0d3LzZvTnFkQU1B?=
 =?utf-8?B?Ulg3aDNZcnFVV0lybittNGFVWjFGb01Sa3pwaDliSjFPck5qNkRZdUJYQTZJ?=
 =?utf-8?B?K0dWTUNpb3BLM0RFR2d2QnJrbkFQaHFTZEtTOGVzbC92RTdkM0VpaHBEU1hF?=
 =?utf-8?B?Z1pkb0l1OGF0M3hjUDhQV2xZckhHKzBJSU9jTWVLQXAwV0hWSUxvbXpsUmNG?=
 =?utf-8?B?Y005aDQ0ZitmSlliV3NCS2hSZ0p1Tmx0VWlzK1hGNGlTcmFNQkppVzNMRC9a?=
 =?utf-8?B?ajFaVlhXWmxTTDFqUG5WZml1czNoOXBNNDgxVE16OEFlUU1rU0ZzbDd5WHRk?=
 =?utf-8?B?RkpjNVdLRW04VGY4SGpQYThreUl6M2s1VUFibGEvaXFGbFlteUUxcEtoNlJ4?=
 =?utf-8?B?VTJFNDliS1NZVlo2ejNUT1Y4L21EQnp0RmlranFldkNEWEE0ZEEybnRWdi9X?=
 =?utf-8?B?WW5mZUNDTE5ObXJHYU5oNFVpRDdmWHFudGl3ZVV2Wjlpa2hMOFNvYmFLY044?=
 =?utf-8?B?ZS9jNzl0SHVhNWh3Ym4xeTd5UVozYzlOTkpUcndrZ09qNEV1cE53K0FDRWh3?=
 =?utf-8?B?M1NSbmhPVWFGbkxOT2ZQSjh3YmlDMjBnSWcwbVBMcXdzWjdsZ2pvWmVaK2JM?=
 =?utf-8?B?dGQvdjRWS0MzbnN0MEozalBtTkExanphRitPNzRyODJuUkNWZDV0UUFWNzBV?=
 =?utf-8?B?alZwWnR3UlBqeWJrcW1pTDV1Y0NlQ0RRSFM5WWRUdHdxaXZOL3c5dE1BbU8w?=
 =?utf-8?B?dms5MFR2TEhXRkREZnFPelJpSi90S3pVWEkxN0xHMzZwcW5rcEFiSFRLanFa?=
 =?utf-8?Q?Rih0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71dffad7-3d45-4632-1699-08dd621382dd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 09:43:29.7549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wc2MGxrindVVUgyOy7YJGnQxksk4F1b7iDAMgVNcJKTn3EKa/dcTajdcnNkiJubk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD7DCFAC03



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> Currently the MPU system requires static memory to work,
Currently, meaning in the future it might not be needed?
Also, I don't see how is this change required to enable compilation (the main
goal of this series) for MPU but because we will have to enable it anyway...

> select that when building this memory management subsystem.
> 
> While there, provide a restriction for the ARM_EFI Kconfig
> parameter to be built only when !MPU, the EFI stub is not
> used as there are no implementation of UEFI services for
> armv8-r.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


