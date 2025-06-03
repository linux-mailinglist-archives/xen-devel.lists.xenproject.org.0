Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D23ACCE5D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 22:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004854.1384541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMYYJ-0006Kh-B4; Tue, 03 Jun 2025 20:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004854.1384541; Tue, 03 Jun 2025 20:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMYYJ-0006IP-7r; Tue, 03 Jun 2025 20:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1004854;
 Tue, 03 Jun 2025 20:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Dwk=YS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uMYYH-0006IJ-Ks
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 20:48:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2418::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ab50794-40bc-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 22:48:02 +0200 (CEST)
Received: from SN7PR04CA0236.namprd04.prod.outlook.com (2603:10b6:806:127::31)
 by SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 20:47:58 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:127:cafe::9b) by SN7PR04CA0236.outlook.office365.com
 (2603:10b6:806:127::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Tue,
 3 Jun 2025 20:47:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 20:47:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 15:47:54 -0500
Received: from [172.31.138.29] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Jun 2025 15:47:53 -0500
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
X-Inumbo-ID: 0ab50794-40bc-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqTjlKgLNsk8zRZTddCHhOpDpQ3zu6DTaFIsl3DcgdT+SLHvIE0M5nBplS8xMhEQGVfrfhGRcOg4Z5EW6311XYRHjZ1OdJ2ei1kBsG7fEFArOZPJSfYi5CSBUCrOALk6LOIO9Ks2D77jERHRQik5rx1PhBNlDnMleH73y9orMzGO90sGeQlmVt9mb7lS25CMMqFKTM10uBoLvbOJC5GWmoK2EmV99RyTE7gi3+dQxq45k02LPg9cYcrfUyF0/Q1PDFgXCfisQ5vKSDGGECQ4U9dxWE4myyC5jQeHP76kd0YNOtxNbSipQPiYSyY0D2iKO67A2dXY6kbaw7MWHKcLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auvcygLBSRlC2nO2N4ZqD++PYsSu95L6zPf6TAUUoJE=;
 b=DaYKGW3Vc4syTLlA49P0iG/2BD5/TB7k/gZB3j1RjFW1Sc0BIYMxiSZxAyPTiRBHsKdFdGYvhPgQRTOtX/OWMx/FDvk/SzgRU0yPt8xwzxCdajQ9HeMMt9ZIG8AkEfCAFhm8tNJH4wR5sb7za2eKNS1BHRtZjRvHqwOmhq+h3KotyD3//t4f+AcQfBMFd54AZoF77rSAppYDgeUazgj2IoUO79DieREYs4+ae9qWLfZZ8O8BLL/amvgxFlHdYTO3CrNbDhAJpkN+FI3GhJwcUAIAZzDBM03k86JCq2Ywv/sGv5FZWsRp/F9ogl1mF0Db6QGCnBYqAbILpx4bECBRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auvcygLBSRlC2nO2N4ZqD++PYsSu95L6zPf6TAUUoJE=;
 b=j+I7+RJvk2nkUWrx21Hl/XADZJtdgQMadMYXlDwWQNFGsBQUryp9NUAvft2JYn4z5v9abDquw+3KRwIRYPH4LFr/AIq5J2Zl81fDe4zDt0an6F1xpIbjcfclHh+0mIr6OCliUqBHldqzNQ/Y8lY3D5hVAm0rTnZylI7e5SI/W24=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <198b21fd-ec37-4edd-9419-37bde034149f@amd.com>
Date: Tue, 3 Jun 2025 16:47:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/vpci: refuse to map BARs at position 0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-3-roger.pau@citrix.com>
 <3f274948-92bb-40c4-bcaf-7b538300140a@suse.com>
 <aa1105d7-758d-416e-84e7-c7492f4bd177@amd.com>
 <aC9P1T4hCKbAdTVB@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aC9P1T4hCKbAdTVB@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|SN7PR12MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5b020f-b077-4cf0-e0c9-08dda2dfeb6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkpmMGlJamhQS3k1ZjR6SXFWSXRjWkpyc1M3YS9ueWFFQmZFT2VTMG5kcm9Z?=
 =?utf-8?B?YU0vR3dNYkdwblpscjZWV0FvOTNTVGhVcWFReHlFK2ExZUd3bHlSUmRKMCtR?=
 =?utf-8?B?WUliaGlLUEc5c3lyZFZlaDBEWHJHc3RlRk0wUVJnTk9Gd1R1eWVCTFdFL2V3?=
 =?utf-8?B?ZEp2cXpTUmQ4Z3Zuek40ekxYamJOenMxZzFOMGRtR0xaWUpwdjYrQ0d4SERV?=
 =?utf-8?B?QStvV3FNMko5OWZxNVpIMlI4YUllc09lNlNEbitQa2ZtZHNhZE96eEFjQlVE?=
 =?utf-8?B?b3p5dXFMMkpTZ1VYWnhuWmVVblkzeEF3NzRLbGIvR3ozM3kvSTc2NFRrd1BP?=
 =?utf-8?B?ZEw2OHA4U1E3S3VEK083VFRYdC91NGtqaXp4S1Bsa2lHMnZ4NGxyRjA2TlZZ?=
 =?utf-8?B?dWU5cnRjQkRTUnVLQU5yNlJyamZ6Mk91THBwVmx4dk5IaFdkMmJDaVNnZzFj?=
 =?utf-8?B?SW5RZUJldDJrb3huTC9STE5mMU1SSGJ5UndnUWxUMkk5d3FoaXl3cGdWdmp2?=
 =?utf-8?B?RXdBMnBFcXNwYlh6L0FnV25vdHA4MklKNHFNdFFRaVRycUZvb09GV2UxWG9r?=
 =?utf-8?B?TFNzT092MUtJQTE5UEV3Q21RdG4zSEg2T2NIMlM1VmQ2ZTEzVjQySXNtNWsx?=
 =?utf-8?B?UEhtTVpTS1k3ZFQweVQyaTZiRGF0REtBMjh5dlB6dHUvUU5Jc1d4UzZIYWVV?=
 =?utf-8?B?TENXbTk4aGRFd0ZzWkY1eFlmaEtFOHJYdXlCUDJjSG5BUmVHR1paZGtaUlR1?=
 =?utf-8?B?K05hWjQ2dTM4T0hLNDNISXlDaVFsd1FQMzlwZ21WbE9SbkFybWRNWFMxcUx1?=
 =?utf-8?B?NVlnNG9yKzJ0b3BpOWw0QmlKMzdKRkZ3NG9LVkZSVDRlR3VZdWI1eE1mc3Qx?=
 =?utf-8?B?QTVPOUM4N1lrdHNUL2o1dmpDSDRzbThUZ3c4RmRLcjh0dVlUOWVaaTJUWS9v?=
 =?utf-8?B?NDYvVXZFbkZ6KzZZVVRhd2NrSlBwbWxwdlpnY2EvMitCa0xYdHJLZ0JmbGJJ?=
 =?utf-8?B?UFo1KzkyZDVqZmVNY250V0hlSTE1cUxKNGM0Ry91UGgwOHltQlpBNzdBSTRF?=
 =?utf-8?B?dzZhaWs2U1RrRkRSdjNHZVJWblErTCtTdExMMXVMWlQxL1QrdmkrejNWUnIr?=
 =?utf-8?B?Qmh0UUdjVDY2WUlidFFZK2MwV3F3SnZzSWVjdEJNcGZvTU0yTWdNR3BxSUc2?=
 =?utf-8?B?d05KOCtsTmt0L2ZqaWNSa0NaUjZGaGkyMjNZbWd2VGs1Qm51dnBwZk1sUzFY?=
 =?utf-8?B?UWNNR2pubThCQ1Y5cU12T1RMbG9PYnNPKytMeW5ZZWJScU1VTjljYjk5aW8v?=
 =?utf-8?B?Uzd2aXBkN283SklRdmhQVEFwZE0xNFVFd1h2YnQ5RlBBR0FiTlMzd1lJTmJM?=
 =?utf-8?B?Zm9rcGhQSXMwTjcrME43N01WSmtzNk44QnFORjBrMXBnYVJUUG90VFdkNzJv?=
 =?utf-8?B?OGh0bWZkb1krR1l6Y3BSN2JONHhEWXlpK0VQTUV3MHdMdmZRNXNoZEZnZTB0?=
 =?utf-8?B?UURtUWpHWExYVXZUMUEyRmFFTnFGV1hRMWlWUE1MM0ZWMk9UMlVqUGs2YXdq?=
 =?utf-8?B?UnpOb0VhdkJTeHpnOUVRNlBGV2MrakFZRGEyRnJsMkhlU3hVb1FSaE5yVnlt?=
 =?utf-8?B?U3VKMDZSYmQ0dnNKbEx2YXQya3cyTThrUzhPNERGcXgyTEl3RnZVWTZjbVgz?=
 =?utf-8?B?eGVRMEt5R3NOWVZmRy95d1l2NVE2ZTNReHo2cXE2dzMzaUVuNlJWRWxydHE5?=
 =?utf-8?B?YlQzR0NVRFRjVzNUN0UzYlNuSithT2Y5SmFVNUt6M0V5d1U0MTFaZHBsOVhn?=
 =?utf-8?B?SWV5eDd6WkI3QnVPeEpLaUJJV1VKS3ZZVjRNT2NjQXFycFFnMHA1eWlMQm1R?=
 =?utf-8?B?dXFoZVZuYnlzQ3pXd0VGWmhXb2w2OFd6anBuZ3hsK3RhM1VkclhCTmVuVzNm?=
 =?utf-8?B?M29aSk1zL2N2QnhiWjNLa1YxR01MLzNHTzBRMzJPVFJhWTJPMWZjUnJ2VThP?=
 =?utf-8?B?cTBnMnZmVWsvaEdTTU80MTZkVU5wYldpUUhQcXFVcjAvKzBtVXF3TWUxSWMv?=
 =?utf-8?Q?pkSioj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 20:47:56.7078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5b020f-b077-4cf0-e0c9-08dda2dfeb6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227

On 5/22/25 12:24, Roger Pau Monné wrote:
> On Thu, May 22, 2025 at 11:44:24AM -0400, Stewart Hildebrand wrote:
>> On 5/22/25 10:59, Jan Beulich wrote:
>>> On 22.05.2025 16:03, Roger Pau Monne wrote:
>>>> diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
>>>> index 26bb7f6a3c3a..39fd5a16a4aa 100644
>>>> --- a/xen/arch/x86/pci.c
>>>> +++ b/xen/arch/x86/pci.c
>>>> @@ -101,6 +101,15 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>>>>  
>>>>  bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>>>>  {
>>>> +    /*
>>>> +     * Refuse to map BARs at position 0, those are not initialized.  This might
>>>> +     * be required by Linux, that can reposition BARs with memory decoding
>>>> +     * enabled.  By returning false here bar->enabled will be set to false, and
>>>> +     * bar_write() will work as expected.
>>>> +     */
>>>> +    if ( mfn_eq(start, _mfn(0)) )
>>>> +        return false;
>>>
>>> Is this really x86-specific?
>>
>> No, I think Arm would benefit from this check too. I'm in favor of
>> moving the check to common.
> 
> I think on ARM pci_check_bar() is more strict, and doesn't really need
> this check since it explicitly checks whether the BAR falls inside of
> a bridge window.
> 
> So unless you have a bridge window at mfn 0 this won't make a
> difference.  And if you have a bridge window at mfn 0 you really want
> to be able to position BARs at address 0.
> 
> Thanks, Roger.

True, but I was thinking more generally: if a BAR is not initialized,
don't map it. On Arm, it seems to be hit or miss whether BARs have been
initialized or not. I guess the difficulty lies in whether comparing to
zero is a reliable test to determine if the BAR is uninitialized.

