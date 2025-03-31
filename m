Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B82BA763E8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 12:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932340.1334479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzC9X-0008Sj-Ad; Mon, 31 Mar 2025 10:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932340.1334479; Mon, 31 Mar 2025 10:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzC9X-0008R9-7r; Mon, 31 Mar 2025 10:13:59 +0000
Received: by outflank-mailman (input) for mailman id 932340;
 Mon, 31 Mar 2025 10:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDqH=WS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzC9V-0008R3-6r
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 10:13:57 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9745451-0e18-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 12:13:54 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Mon, 31 Mar 2025 10:13:50 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 10:13:50 +0000
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
X-Inumbo-ID: d9745451-0e18-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyI00S8lKWr9Cr1sE0XyHMuCW/X4Wr0BRVbKOa6qRg4eucAQzOY+lXX/QalX59KgzFLMivWH8BCkU7+fn7FSyHBbAyrKl89xWS1lHm3+Q7ZprzKHs13RvsMHQSAuSZz5HBskpALd78Lnz4j0FqogMMoxdMPQcm/ZX7m6LKpzsNF8kFLIagEYTFVPLNsEk0QGosubjPSbSFNEEU0dmfRn2ArJRdOP6ZW0Ex42mPZ2Mc/76mkRVdnEGFl+LH7Trc3w/GksopbNN9AYpo12XROlme0gtkOHwlGyL8Ra14Zlo0BkJU8AJ8OKkltTrWqDSlGvj6GYiU8ORtdeNWDN950Phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gnSdGMw+hEkwHuyvweyW+eCweHLS4KYY0CQgsha/2g=;
 b=tqeObmkPLq1eT9neDKDCmBxYSUE9UBcAtiRRGZCAj+fglsF3EQsUF4ESX5doQWtSMAV1fmhq3yKH0ntZirN72C3BaAvoA0iRIpaLUjGXUK2BXmiET6eFjTVvktzFMwGWQYJf1PuX/xb2HhgLqGLBeTyUDxsBZiS8KJK6yjxoF9oIEm+pDYvxiD1LyOmM6SG8UOlqMcVqKNJ9IaVdnA5B9fONsEHMm3ET158YIab3mnbQ6iZXep4dt5Xh7PnYLsjq7bBvhXgB/CKdBI2HTGnshLEJod+Swp1b6ACpBV6h5bVTxJgWj2Omfrzhag+kBLLG+C6mW+PbMLI6IQhtRThakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gnSdGMw+hEkwHuyvweyW+eCweHLS4KYY0CQgsha/2g=;
 b=LTylMvHa6VM+GKocIkdPRatetoSq6J/HDu721NUMl/xYPfTx+SncCmcwUCf6pOkNq+Wp1K2mYWlJsX6zRLWBfQ/JVa8zOR/DKdf+vAyWUgiZli4IwnuWSqTm4I49mD5ntT3HjR5RoKEZU5exmVaDHt9L3xlRQA7gKZUoGdxJDS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ad4eaef1-fb63-4eed-8024-3c234e60c3e2@amd.com>
Date: Mon, 31 Mar 2025 12:13:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Enable early bootup of Armv8-R AArch32 systems
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS7PR12MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: dea2810f-9543-45f1-10dd-08dd703cbb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjhZa1R2OW9PaWVRclZoVGNTQzhQRWxpbFI3MFNKaGpGamd4cjVzTmRQbFpi?=
 =?utf-8?B?YUhxMFdoNGtzWUg2US9JWGhXWXVFemVXTlE3WTVnaHpORnBrTm9EYURnQ2RV?=
 =?utf-8?B?MFFtMXJiVDJnSGpES0xxTjN1VndlTjRHeEtTSkQrcEI2QzE4OVBvNFJjOVFT?=
 =?utf-8?B?aGpIc01FY2JlNTFjbndhaUtUKzNLMzJTdjdXeUxxYnlnM0x6WkZSTjVGOHk5?=
 =?utf-8?B?c0dmUDBQM1g1eVFxYlpNWTdFOVBKVk44SUZ6S0RWSU9jdDdpUTFvMUJ0NGZt?=
 =?utf-8?B?UmhLMnhUdU9CVVhkR2pUZ0lEdGJVRzVQUXZhVUtjYTcrSS90VFpNL1l0eWdJ?=
 =?utf-8?B?a1BOZGsweWcwQ2ZTZllHSHNGamtKYy9LSk5ZSG9KOWQ1a1J2QkFtMHJYMnls?=
 =?utf-8?B?L0k3QjdBbEY0bVdYSGgvMGZBWG4zdi9jM1ZOTFNOa3gzeE44MnBjclU2a2N4?=
 =?utf-8?B?NnZQVHZQNHdSem41WlUzUzM2dG5MOTJYOFVZOUJKOGx6dmo0NklRdXVob0JP?=
 =?utf-8?B?Z3l0MTFGeXZuZVFDd3BQYnlsbTdlR3FsUzJvSEU1RTF3T3k2SEFXMnBxK0Mz?=
 =?utf-8?B?VEVJUGFRcjFjWEtGOTNBaVZSYU0rUWQyMnRvODFvcE92STd5NHQydHB3VE9X?=
 =?utf-8?B?cXk5TDBUd0d4RGJ4NTFOYkZ4LzhJM1lUMVV4Z1ZLUVRycXdRWFdUQUliR2xU?=
 =?utf-8?B?UXRBdmFza1pheXp3ZkpZdVlYTCtzTDVVN2VCdkJFQS84dnBCay9hSFFFd3gz?=
 =?utf-8?B?UWR6V0FraWd2VEUxdENqYUU1Sk9nZVFaTTB6MEFxQlpnbERaaHFTMjZNTVlE?=
 =?utf-8?B?T2NHemxzYVRnbllaclp4U2hiZnV0SFBRVWVFenI1MWJZazA4ckRncklyQXAx?=
 =?utf-8?B?K3d3NEtaZExBbGxIbTlyVU1idGNHc21TZVNHck1sMlZPSnUzSjJ0MnEyK0J3?=
 =?utf-8?B?V1NFa3hZM01PN3JWSTl2d1ZRWHh5aHErYVlBZC9CZmd5MndiVDFrRDBIYTJT?=
 =?utf-8?B?WkEzWlZtUlhBbUg3MVhEalRZcG9ub0d4M2VIWU9Zbk0rcExmbjdIVm1FaXl3?=
 =?utf-8?B?VVJBWnFDMm5OMkZpeGNjSE4vOUVMOVhSRlh1NS9mREluSHVEaExYOU9pcys4?=
 =?utf-8?B?NnE2aFE0Z2dUM29xZmpPaWc3ZDBhK1F5MmVNMklrdU53c2UwNDJRUE1WOWdq?=
 =?utf-8?B?aTF5WFZXVVlYMHBJbmdYZnMvaEhnYnJtRzdHYzBkYnZCYzFtM2QxV2NoQkpF?=
 =?utf-8?B?RFUrVjliVGg3dVNacDJrcHJpVDdmSXcwaXh6aVlsSjkyZlVENnVMMUREWENl?=
 =?utf-8?B?NHRGeXJTUlI0Nld6bVp5VjVCcm5ueDlSUzd6bGFqQWNJY1VxMVJyMm5WdHdF?=
 =?utf-8?B?aVVhNW0zeU1XZThBY2NDUUEvZ3hTUGVWL0pKNFcyZkZJUU4yUmtRWlIyY2RI?=
 =?utf-8?B?bzZaSHBacUwxOC8yRDN6MitoUWNDZ2k4UEVpdFFWdjB2SjhFWDBSdE9YYURi?=
 =?utf-8?B?d0RnUFdHejd4YkFkTW9sRGpUSitOSythZlhEaCthRHZUOEx0Vk5HelhUMGFz?=
 =?utf-8?B?bGRaM01reVNjcFVoaWxYY3lBK2tzYTZKd3pIZGt5RlY3TVlINXMrK1BvY1VF?=
 =?utf-8?B?UXduT3ZURFBJWHdhdjBCdlN0K09jWjdkWmFGWFYzaDNuMWRKTWhBL3hRMk1G?=
 =?utf-8?B?OUdvRWN3NjlheWtpSzZweGlDZHBoaG81OFRtVFpKYmNuQ0lONmF4cTdSREQ4?=
 =?utf-8?B?bnNmci91RGZCaGNnZHRKMjZOS1kvQ21xWko5NS83WjRYclBpbloyT0daNXpO?=
 =?utf-8?B?VTdhVDEzL1huWnloTStDaG9XTnA3d0dtNGRqM2dsV2dCd3lzQUkwMG9xNmtT?=
 =?utf-8?Q?CDvLSE8cCyXjY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUJpcHBOSGZheGVkMFRhTW53WUlKamRiU2ptKzFmSncxM1hUYWlicFJqT0NX?=
 =?utf-8?B?bGF5ZUwveGhLbXBuNGgyUzQrQ1NibE1ZdGtva0RCVUR5Qzk3cHlZUCtjcHFy?=
 =?utf-8?B?R3laZDFIQ2pwZmtURVNMYisxZGZ3bTFSRmJLSUpsWHppbzI1YW8rRENkdzFl?=
 =?utf-8?B?WHQ0VDFUNDlpaS9mbjkwQ0hJY2VYNk5MeWNPZER2aUJxcCsrUEtLWFUvakpB?=
 =?utf-8?B?VWhob3FRQ015RkUvZnBnNmFRaE5lVzNCVk9HemY5SW4xVFNRODVHOGhvajJ6?=
 =?utf-8?B?TEl3K25ESmVreko4N2hxNjc0cEhENVJvbHlvVXBKcGEzR2RrdkloNldEa3hr?=
 =?utf-8?B?ZC9rWUQyOGFPR3Z6QnBOVmxRUEI1VmNTZTdZeDB6c0pKTVZ5UUtwQkZuQnpP?=
 =?utf-8?B?TjI2ZkpDVWpsTEp5QmhGZFNIUzZoK1NMRVBRbUpqS0RIMjJnN3h6d1A4K21p?=
 =?utf-8?B?NDF2QVRKNFpSeEJTdTBtWlpodkpDTGUyQm01OGpUWlN3bXc5dkFMUko0NDM3?=
 =?utf-8?B?RnpyKzZod2thQU81U1grK21YendiaTZpRmErdlUxUjJwcm4va28vaUoxSnN1?=
 =?utf-8?B?bXd3bUIzWmU1akxGME56U0U3bUc1eEh0czNUejIxaDI2c1lOcW9PUVg0N3Yw?=
 =?utf-8?B?Mk1OWmxYUVozUUFvMmhQTkZZVDBTekJIMUlaMHp1OHZ1MzZyckx1ejNjdHhJ?=
 =?utf-8?B?SWY5clJXS3pDcm50NHluaFBtS253amtGSit6anFuV1RTRXIrRG1wTG5OdWMx?=
 =?utf-8?B?c0FqN0Z5czBuOGxvNmhzUjVnZWZLZmdKbmZWVjRka0szMlFDTzlHZUc2TWRu?=
 =?utf-8?B?QTRKeXY5L2lXUmxWcHNMb2V1clpuZ3E2MkRmTkNiWER3RXJnNFB2SVVRQXow?=
 =?utf-8?B?djg0eGRHdTl6TzZHUTgzR2pJY2NCY2NGTnVieUNXT1hDK1ZwZVVWRFlCK1Vh?=
 =?utf-8?B?M0xDbzdjZjhsVGtTeC9pU0lhVDJJQ1ZEQ1lCRk95STJuQjBZeEZKSmJMQTF1?=
 =?utf-8?B?ZWY2VERxV1d1SUliNmhLQ0k3N2lieWpzc1Zzd2sxbkJialpJYTBLZHQ5OUtz?=
 =?utf-8?B?SnZSYnA5R0NtbTNnTnVkY0pzMDQ4bTJiZ3hXTWtMVVJpZ0hCR0NHZTljcXBK?=
 =?utf-8?B?SGQrZDhjWHd3UzlkRzZwRFpKYXl5NjBnRHR3amhqYWpGSHdkYjNVZWVKRDEr?=
 =?utf-8?B?MkRTTHNPcEpvOUhXN3dFc0JIQmt2Z1lIRTlkOXlkd1lFa3MzNmZGcWtYK2Qw?=
 =?utf-8?B?RzRDNlRxbCtrUktzbVJDa1ZBWlIzajBlNiszeGJ6di9UTzJLL0p3VDlrc3Fo?=
 =?utf-8?B?TTJUelpKMTVwT2szd09icXk2dmtydU1KVERZNVV4M0krZHAzSHI1akJlZ0x5?=
 =?utf-8?B?MkFlQXhOQ3YrYzBac0ZCdExHM0x1ekFYM2ZIVFdoOFYwZmFvVWNLaElXWHdm?=
 =?utf-8?B?dytwc0U4dXJQak5EZGROdGdBQTNucHFTdXZMVFhMQktZMGszaTU5Q05DVmFq?=
 =?utf-8?B?UmNEWlFnd1hlUDdISExUSjVIemFDM3pEczdoNkx2dEJGcm9BODRNemp3QVB2?=
 =?utf-8?B?K1M0eFJqcFUxbTNmWE1NN2t2OWk0K0o1eldUdDdPYUdOc1Z2OTdBOXhLN2hG?=
 =?utf-8?B?ZkpDeU5UcUxtWHpidUQzcXNwWFp4TVFLSWxhMjV5WFRCMVV3REhiUzJTaW00?=
 =?utf-8?B?L1FKWkVKeEhwc2duaUMrMU4wWmlDTEx6Qk1FNnROMDF5aFJyRWNSdkIrb3VV?=
 =?utf-8?B?Q1FaNlpFRzc3bkRjMndNR09wd2tRdlFoMDlBZnJQS1lGT0NjS0o2b1JMdzBG?=
 =?utf-8?B?SUh5Y290NzVEK05DZXBOWW0zSCtLYmszRWtKS1dKOTdKRFNtbGQrdXZyY2NC?=
 =?utf-8?B?L3YrV0J1RjM4cjdFMDNxTnZ5YXNtZFRKZTQ5Q1E3WU1rRExSZkhGTk1SbU9B?=
 =?utf-8?B?RHoxditQUzRmN2g4ekhGTWI2WFFGK0NkbXhPMUF4L1VMM2ZJYk5sRmY1MWJE?=
 =?utf-8?B?MndsV1RrbHdCczhJNWVNYzFaVnluSWNBc3Q1dTExZi8yWjI3NmdTMHpBM0RH?=
 =?utf-8?B?YzFkMlNvVjVUczlpc0tNdnhScWhJbzdwVDNpWE9RU0ZqZWUvTzJsNGU4Nm1W?=
 =?utf-8?Q?bbX/CR00cF55BTNBtEEyUED65?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea2810f-9543-45f1-10dd-08dd703cbb2a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:13:49.8958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCejyc59AAaKrwfZplLty4wfMipowVJnKoy9TyfavvvxBPsJuHeEUfXpbFvv9Q0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862



On 30/03/2025 20:03, Ayan Kumar Halder wrote:
> Enabled early booting of Armv8-R AArch32 based systems.
> 
> This patch serie with
> https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/
> will enable build on Xen on Armv8-R AArch32 for MPU.
> 
> Patches 1-4 can be applied independently.
> Patch 5 depends on Luca's series.
> 
> Changes from :-
> 
> V1, v2 - Added "xen/arm32: mpu: Stubs to build MPU for arm32" to build Xen for
> Armv8-R AArch32 on top of Luca's series.
> 
> Ayan Kumar Halder (4):
>   xen/arm32: Move MM specific registers to enable_mmu
I committed this patch and ...

>   xen/arm: Move some of the functions to common file
>   xen/arm32: Create the same boot-time MPU regions as arm64
>   xen/arm32: mpu: Stubs to build MPU for arm32
> 
> Michal Orzel (1):
>   xen/arm32: Allow ARM_PA_BITS_40 only if !MPU
this one.

~Michal


