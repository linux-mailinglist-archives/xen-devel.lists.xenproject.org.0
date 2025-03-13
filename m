Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BCA5FEC3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 19:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913277.1319365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmui-0000p8-C2; Thu, 13 Mar 2025 18:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913277.1319365; Thu, 13 Mar 2025 18:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmui-0000md-9C; Thu, 13 Mar 2025 18:04:12 +0000
Received: by outflank-mailman (input) for mailman id 913277;
 Thu, 13 Mar 2025 18:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VEl=WA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tsmuh-0000lB-BP
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:04:11 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f7955d2-0035-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 19:04:09 +0100 (CET)
Received: from DS7PR05CA0097.namprd05.prod.outlook.com (2603:10b6:8:56::26) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 18:04:00 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::c2) by DS7PR05CA0097.outlook.office365.com
 (2603:10b6:8:56::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.27 via Frontend Transport; Thu,
 13 Mar 2025 18:03:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 18:03:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:03:59 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 13 Mar 2025 13:03:57 -0500
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
X-Inumbo-ID: 8f7955d2-0035-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBvkhxpqPscEorPdzpkeVF74JjWDNuLjQ3pPLbaulDdm4NWadg13VD86iX8Aw3uQvtZweoVmhHTMe8mb0ePoMnoKRkuPtq0a7r/46U4XFeCGzVjHuYMlS1HjcKrPgQM29sjnMmUBGGZF9mg6quauuyjyoek9MT/pTsjB8qFfrKMsFbMq50SXqaZbBi2tDsF1IKiaciTCtXTAOZzTQfZP/F1dVatFXQjwk6DBwvOnvk3VTcs5uqlWx3aqA4SFws8BDIm1lRIsMzq7eGX9SSuY5ss7HN+KF6yztwExc6t/0weuvLJdhfzaJcXKDCIbXh+4z0qRxQTpIAqkq1ICqeJ/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2OA9DMKEYxTYSOiKaFyfiw7EyS3kCkKTqCcx/4PT1g=;
 b=Rh0pBNh5hBjg/cX4TDLLnxixWvIpUBb+7JpYh2zegAWRq49zhtnxkbRegkTjv5/bYFjolA2Y9H9nU6Cm0AtsRwOzhcj1pUgZcmWOHUVbQ9MeZ1M7Ii14h9wWW97cnrHUnmVjuiJxTI0gkV9fEgng+mWDvrF36hleHJ60h5Ho9/Jp+7BTVt1w26u0XbDsCut+nz0zs7irPQG2tJQ8xhGXj/pf1LCCCJgi6q08gy4/BUXh+fdSyC+EbvPP7lKoDphfn5nldAISnQZHXj5ptBddyetI6slUIifSSczJAyaSkZRpPq0EHTY0vkgNUkY43DVzzvSMuYMn2n+jdoQuwawi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2OA9DMKEYxTYSOiKaFyfiw7EyS3kCkKTqCcx/4PT1g=;
 b=Vdh0r38bCgfUlZ4Ob+7USFzQvuLNCqR/mShVWcYiuofpHq4kFbhcCdbhKWO+go2wXH99sBqJIgscndUHsYm0Jcj9VnkB9LTBhYijZJsehgsvZy2zUSHTRfpWFrRKaQB/dcUpW813aGrd6x8iQ48lqzWdXQCenMX7TShEWqPu5Q4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <555c355e-1269-4429-aa08-c2804bacc839@amd.com>
Date: Thu, 13 Mar 2025 14:03:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <1d3ac61a-1acf-46b3-91bc-1dcb8bab1559@amd.com>
 <Z9L-HPlfZhvIh8yn@macbook.local>
 <d3378c73-7185-4f9f-8e61-be12171dfc21@citrix.com>
 <5cb338cb-3e5d-4c3d-8ee6-6c0c7c76348e@suse.com>
 <818b6a3c-bf65-489b-a551-d8539f52b452@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <818b6a3c-bf65-489b-a551-d8539f52b452@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1355f3-31f3-42e4-e65c-08dd62596e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmJTbjNEa25aSHFlKzlZR1NJNlpnWU9VdEs2STE4Z2FiZEhtR1YrR2RkaGZP?=
 =?utf-8?B?Skl4NDBEMTkrNzZJcjhsKzV5dkNzUDBKOW1uL1JvTzdOTDNOYmlvTXI0UFhI?=
 =?utf-8?B?QXBIMkRFdEFqVHJjRUFHcnErNlNodGdwYVBJd2lTRVFIWHlUY1RJai96YkhI?=
 =?utf-8?B?VFZhbEg0ZjF2amsxcUM2ZEFRZnA0NDZHUllLZFFEY3NJSERJcTdJNG54LzhL?=
 =?utf-8?B?U1NpSGdZTTd6OWcvaDRhVTBiZW5OUU1rODh1U3lkWmNidnkzZERIU2RCSE04?=
 =?utf-8?B?TlA5OFlqOWV0ZnRCcmVoUDlQamdkU2pndGRIc0t5WGtaRVBFb0tuSVpOWnNu?=
 =?utf-8?B?WmF6anV0dUJ5aGt5VmFqVGxIVWxxOUlGVFhOOTRlMFFBamx5RklvQTViTWp0?=
 =?utf-8?B?ZFluY3B6TkRTdTMybU12aWd5STEzNkpiS1hZRlVJcEJ4U0ZVVFBwY3ZlK3lI?=
 =?utf-8?B?aGtKVTFzN01wbWhnN1VqNDRveklHVDE1bUswY2JTRXU0SHNvTlRpV3RtT1Jo?=
 =?utf-8?B?S3NDd0Z4a2Nxd3BoSFNkcjIyRnNnUEF1OURCVTgzMTFWWnZYWXgxNDdscktw?=
 =?utf-8?B?c0Mzd3NzS2NuWG5SRnJHYjgwVjRrQWZFV1pZbGJKRmp2aVgwUE9sT0c3TVdX?=
 =?utf-8?B?TFNUV2pBY0NCQnAvbHRJWXdtTzNNaUg1eWRpMEtvSTF1UGtaRDBTQkp1K3dp?=
 =?utf-8?B?QTBjRlI1MHNBSy8wd2xoTGtKMlRNY2MyczFpQitPa2NyQWFKSG5sbTBHb1Z5?=
 =?utf-8?B?YVFZZ0lrcUVBYnpuSStodldjd2Vkd01DUjVsMndnM2lYWm5qWFYvTmhsN0w5?=
 =?utf-8?B?Q2RXa1Q3dmZ3QVRkNWd6UXZtZnZZMVRuMDVXb1h4UlQrSlhVUm5uaVZwMHh1?=
 =?utf-8?B?OC9VdCtjKzUralcrVitaM2NqQkVWODlnQVRnVm9WMUZUZW54cGI5SnJ6NitX?=
 =?utf-8?B?ZUlDZXkrd0l1SVRHK003TjhvV28rc2lWTVdTRVI2bnZMZEt6LzFXelN1KzNu?=
 =?utf-8?B?akc0TFQyVmx3bVVPalNEaTVNY09IVnVHdmJEYVhHRE55TDlJOFJxbUw3RUtk?=
 =?utf-8?B?S1JjMVpzTFF2dXUrSGR4YlBCaDBNT1ZFcXpqTjhacjByRlVWYzZMd2lkR3BU?=
 =?utf-8?B?alorcFFqMEFzTEc1SndmVjkrdFh0Y0QwQm91MUI4ZXJTb2l1QTExOGF0eTMx?=
 =?utf-8?B?RTRyck5aUGwzZ1l6ZWM3WFlNL2JnTmFiejRma0xZRy9WS05KVTBReFpzNFha?=
 =?utf-8?B?em5EaXRjZGFZbW1uRWtkT0ZIUDlteXRrSlpkVStZcmJWQ0JOZWdoWVNJWitR?=
 =?utf-8?B?UHczQUMrS3pCVDg1cnZrOEVnVHFtWnRUMlJNQXJoMXZDRHc0ME5qb1paMFZY?=
 =?utf-8?B?UVBJSlpURDFnV1FFZGJ5RTZzQmZxRDNEWGp2L3Z3cFBxbTROeUFmNWhTaEFa?=
 =?utf-8?B?VCtXbGl0T01VTVBKWHpVclZvdUFZRldQa1RkQmt2NS90YlRNOExNTHgvL1Ix?=
 =?utf-8?B?Sm44aU9Mb3o5QWFQUXo5M080QjF4eDJySHRLcXVZVGw4SXVpNUxHR1UzeXFB?=
 =?utf-8?B?YWUyRHZQKzUzRmNyNCt2SkIzSXNycE95bS9TL1VxTk9yTnFoTXk0bWt3VHlF?=
 =?utf-8?B?aXdzZVJicGxsemt3VkVFZHJzNEJaeGtWbkRMeDA4Z0NTUi9kYkwxM3c2THYx?=
 =?utf-8?B?ZjlUQTM4Si9sV0owQTBtYU5aOGVveGtUV2NUcWdSZXljZjROZFo0Mm12RWlu?=
 =?utf-8?B?eGhCU3hNaEl2NzJOTFFoMm52aFUrWGY4UHh1S3JTcyt3dndkM09xVlBTMFhZ?=
 =?utf-8?B?QmQrZ3pqTlZvbHpvS3VNejAvTzlvV1BYN1I1TDdaNHpHS01aSG1JTURtY2hq?=
 =?utf-8?B?OXowbXcvc0R6MURvd0hvUTJ0UGFOOXl2VUpnQytqbjRIUC83bGk2d21UdzhU?=
 =?utf-8?B?N3FocWEza3RJS1ZOWlNMMWNzb1QzaXVGWXl0OXFYNmY0NU9WQUVCNmp1NGF5?=
 =?utf-8?B?aEVtWDB5d1l3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:03:59.6506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1355f3-31f3-42e4-e65c-08dd62596e3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

On 2025-03-13 12:24, Andrew Cooper wrote:
> On 13/03/2025 4:07 pm, Jan Beulich wrote:
>> On 13.03.2025 17:02, Andrew Cooper wrote:
>>> On 13/03/2025 3:47 pm, Roger Pau Monné wrote:
>>>> On Thu, Mar 13, 2025 at 11:30:28AM -0400, Jason Andryuk wrote:
>>>>> On 2025-02-27 05:23, Roger Pau Monné wrote:
>>>>>> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>>>>>>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>>>>>>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>>>>>>> all that has been tested.
>>>>>> DYK why it fails to enable 32?
>>>>> In Linux msi_capability_init()
>>>>>
>>>>>          /* Reject multi-MSI early on irq domain enabled architectures */
>>>>>          if (nvec > 1 && !pci_msi_domain_supports(dev,
>>>>> MSI_FLAG_MULTI_PCI_MSI, ALLOW_LEGACY))
>>>>>                  return 1;
>>>>>
>>>>> MSI_FLAG_MULTI_PCI_MSI is only set for AMD and Intel interrupt remapping,
>>>>> and Xen PVH and HVM don't have either of those.  They are using "VECTOR", so
>>>>> this check fails.
>>>> Oh, interesting.  So classic PV MSI domain supports
>>>> MSI_FLAG_MULTI_PCI_MSI, even when no IOMMU is exposed there either.

I was told PV dom0 used 32 MSIs, but I don' readily see 
MSI_FLAG_MULTI_PCI_MSI set anywhere.  I guess it gets to 
xen_initdom_setup_msi_irqs() which supports multiple nvecs.

>>>>
>>>> Thanks, so it's nothing specific to Xen, just how Linux works.
>>> This is something which TGLX and I have discussed in the past.  It is a
>>> mistake for any x86 system to do MSI multi-message without an IOMMU.
>> Well, with PVH there always will be an IOMMU, just that Linux can't see
>> it. Even with PV it should be the hypervisor to determine whether multi-
>> message MSI is possible. Hence how the classic (non-pvops) kernel had
>> worked in this regard.
> 
> Xen should hide (and instruct Qemu to hide) multi-message on non-IOMMU
> hardware.  The result of "supporting" them on non-IOMMU hardware is
> worse than making the driver run in single MSI mode.

FWIW, QEMU MSI support hardcodes 1 MSI.

Regards,
Jason

