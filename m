Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5B8B2FB8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 07:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712402.1113066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0E30-0003xI-6u; Fri, 26 Apr 2024 05:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712402.1113066; Fri, 26 Apr 2024 05:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0E30-0003vm-3x; Fri, 26 Apr 2024 05:22:58 +0000
Received: by outflank-mailman (input) for mailman id 712402;
 Fri, 26 Apr 2024 05:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0E2z-0003vg-9q
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 05:22:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08ce4240-038d-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 07:22:54 +0200 (CEST)
Received: from MN2PR20CA0061.namprd20.prod.outlook.com (2603:10b6:208:235::30)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 05:22:50 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::33) by MN2PR20CA0061.outlook.office365.com
 (2603:10b6:208:235::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Fri, 26 Apr 2024 05:22:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 05:22:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 00:22:50 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 00:22:47 -0500
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
X-Inumbo-ID: 08ce4240-038d-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYC6MU45rgYhWaaeQbl3aYprubnLAtuYb7YujmFjiX3FN/UOpM76W8HUEMoQUJPkdoyA3b5Hpei/p2coO65poDElnTvjCqsYalkXV2LOC0Xps8VAQCq5VA89ofuGM/9crNFHp3wIAL11EDdool2P8LB72taHHSfQZjqM15bNZ1qRFMyDFZYOwFmk5nNbSqQN3Gh2SiKq7uTazvNVHDoDvV7L404qKTMqN/lnsxlSt6gXdyeiqGDEs1r66qZer6bY1ftId1L+PJBFfo9Vd0+COA6aY7uO2fi9nVEvMGNioxWgUZbPVaePIKkJ6dSiA32USqf5mMb/f6J01uPO+UtaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vytwGUy1hKWudBKRSbCfWm3aCFgq/b6/j8kTZ5XFk8=;
 b=a9KpNPj5STlfvRX5VK7Vf9bICxj6o5Zw2X/27yY+zLdZ1yve1sB/E+RpuUiCwJLU7wdTrqhP0WiuNEhji3gqxKhRayaUmFUM4clkBbBjYVXY7pZE2gr8F23itnAYjUjmXHQnkOv/H3spiZEKgIqbghcaU76Kuvl/9mLKKkc1P3A6RLxf8xjjmEEzuS5UtafxMro4zC2QlL59f2uiH3KLkHCN3tPdH++LvWYLcvoyfk/7mvqxobPJE5Ex3t0+IjlSox/+kpNIJJkuH3KdVCPmJvo/irFrd9dRJpyhufUA8qR2JS/ZqLzHFDBYC9PV8MPVvRpX5wbz9f70rrWGLAXCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vytwGUy1hKWudBKRSbCfWm3aCFgq/b6/j8kTZ5XFk8=;
 b=XHNWsh0JCOBvT6WZqSHwYEReWCUBMFLXBGedIW6YcVmxvkHyWwrENM+RbZQs0CN/PtrvhXJQ4WTK8j+Fzd8/3G3l3fi5Dgy9kWB1AtGwn9vw80AcNDASo8H7xqdzoRNdW2JMU8dAG1WVyLJtATjXW2CFerumGR0LgV2UGFj9Eqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <76b3d5ad-3b08-4d9b-8c51-6386888ad2f5@amd.com>
Date: Fri, 26 Apr 2024 13:22:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] DOMCTL-based guest magic region allocation for 11
 domUs
To: Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <c7857223-eab8-409a-b618-6ec70f6165aa@apertussolutions.com>
 <alpine.DEB.2.22.394.2404251508470.3940@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2404251508470.3940@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4ace24-0dbb-4ca3-5285-08dc65b0eaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MllQVDNrUUFnR090MjJhWWFuTk13R0J2VGVoSG1FVU51U01kUlhrcDRYYjFR?=
 =?utf-8?B?a2VJREhtK052Qm9Pb1FGaDh6MUlJZDdJN05IM0RDazAxeEpHVUVZQ2ltNkJI?=
 =?utf-8?B?VkkrVUdrbGUvakswbEtmV3hSUzdJbXorL1crQ3VpMk9zRiswVkNrNHdpOEVL?=
 =?utf-8?B?MGFjOE5BTExjL0xSb1Z3Wk1FRjVoWGZETThMQktJa1NpOXVjcUY5bVNIeVla?=
 =?utf-8?B?SmJCQm9KS1JiODdSSDV3OEViY00yV1E3a0lQeDIxTURnc0c4aGpOOW53NVpP?=
 =?utf-8?B?dVFIN3k4blJUYXBSSytqZ0JUR0dCWjJZdGtjVmZLdHpNb3RoQ05hUDByem8z?=
 =?utf-8?B?MkltV01aVG5jTGcwL3F4eGxKUWJCYmdNSlZGNy9ZamdoOU9lMmFMeStndy9D?=
 =?utf-8?B?eHg5MVlwU2tYRlNBSlF0L281c0dENTk4OS9NNjR5ZEZ4NFYzSnFmVTJERlVC?=
 =?utf-8?B?Y2tlSjZUNHZTTEhYcUYxanpmYWZ0N0I5WStTaGVkb0FUS2ZkNjlMSUQrMTZo?=
 =?utf-8?B?RFlMcm1YNGZnR0E5V2NuSC9iU3FHSWJqa1FOWVVwRm9GbTlydFlwVEo3K3Fw?=
 =?utf-8?B?YS9zd3FudExwUURlZlhkV2JIc0JQVlFGV3hBeVRjSjB2M0JvcHIzc3Y3djh2?=
 =?utf-8?B?a05SU09qL3VOZDNTY0FKbkl1SGc2a0xJZXltL0ZHY3NubmVxRmJXL0ZJL2xO?=
 =?utf-8?B?QkRhdm1mb1VWUTNXZVdWYzhBUWMzMUhnTFlHN05hVVNLSW52bzZQemgxVUhP?=
 =?utf-8?B?M2JkN1BGTzBRdm93VmZzRDFiNTJvN1lBQS9yQXF3akxnY1d4eEppaWExczdv?=
 =?utf-8?B?QkVoM094V3Y1N3F2Ykk0SU9MYk50aXNqcW9ZOWVnVkxqQWNlRCtlSUJZcnQ3?=
 =?utf-8?B?Q3hPQ29jbm11cjJsQUJ0cUl5SGgyc282TzhTVFdLeTY0UXZ4Y2lMYVRVZWFu?=
 =?utf-8?B?TEFxWWpxWGdSUEJ3bGpDeHZFenlNTjl2R2dsb3A2RDNKaDJUTGRLdjJVQzE2?=
 =?utf-8?B?TStOcWRHTzBxWFRyY096TVkrd2ZKRmhLQ0ZVUUFhSnk3YVpIeHJPTUR5M2ls?=
 =?utf-8?B?clJEMGtpMUF6MExKbTJ1N2ZFaXpxcFpGazFObXgxaWdaaXRCV20vaHZYMUhC?=
 =?utf-8?B?Q1p6ckc4aHkzbUxWbXZYTFdFU0NjTXZONzE0azFWQzJEZzRjbGNhRksvOENI?=
 =?utf-8?B?UTdZeHByNkRJQUVEY001UGR3alZjbnNuQnVVWjVFVFFMZGY4ZWM2ZDVheG5Z?=
 =?utf-8?B?VWR2TWRYTVJxZlJQcGNZQ3lEQ2hwZWJaZkNvcXpwcVhmanR5aG9zR3NDNW5U?=
 =?utf-8?B?ME84SlNIRkJBNVpJY3kzWnBxU0psaTNYOHRwaks3ZC9md1RVVUpSajNSTUN5?=
 =?utf-8?B?UUp2TlY2WldIeHZqaEdWOFllN3lyYWhvOUprRHZSQmExV3FoNjVkUUc2MU1u?=
 =?utf-8?B?akJpUmZZK2RicjIzU3U5eG4rRmhuQ3hmK3NFNTNrdVNYbjBlL0xsbU5uZGhL?=
 =?utf-8?B?UjgzcjdmamgxaEw0MVlGRnVvU2VLZWNvdGxBS2tkUTFIbDV6MG84WU1FZGRU?=
 =?utf-8?B?bmJ2cFRrcEdiRS9ZOXd5N3JCRS96TzdTSmlrRk8zVSt4WEw1dnlBRHlHcHlP?=
 =?utf-8?B?ckYycmtXS05xaDBScTlaQWlTZXhXRXIvb1lJeXlEZ0s4QlYxMVZzUElmRzRZ?=
 =?utf-8?B?NGozUGptVDgxWlozSTJ5Y0xZcTZUYktmdE5MaUgyRVhyQjR1SzRWZFBXK0Ju?=
 =?utf-8?B?aHRwQkNGZWRYNllObml4NENCOVh0VXNDbTI0L1dMRGo5eHp0QndRc0NtVUQ5?=
 =?utf-8?B?Zk9oTWkwZnVGQ0ZhMlFmTUp6Tko1cXlTNVdnZm92ZldZWmc3aFVvWkF5SElQ?=
 =?utf-8?Q?6K2U1F7sPGKrJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(7416005)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 05:22:50.6184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4ace24-0dbb-4ca3-5285-08dc65b0eaba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602

Hi Stefano, Daniel,

On 4/26/2024 6:18 AM, Stefano Stabellini wrote:
> On Thu, 18 Apr 2024, Daniel P. Smith wrote:
>> On 4/9/24 00:53, Henry Wang wrote:
>>> An error message can seen from the init-dom0less application on
>>> direct-mapped 1:1 domains:
>>> ```
>>> Allocating magic pages
>>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>>> Error on alloc magic pages
>>> ```
>>>
>>> This is because populate_physmap() automatically assumes gfn == mfn
>>> for direct mapped domains. This cannot be true for the magic pages
>>> that are allocated later for 1:1 Dom0less DomUs from the init-dom0less
>>> helper application executed in Dom0. For domain using statically
>>> allocated memory but not 1:1 direct-mapped, similar error "failed to
>>> retrieve a reserved page" can be seen as the reserved memory list
>>> is empty at that time.
>>>
>>> This series tries to fix this issue using a DOMCTL-based approach,
>>> because for 1:1 direct-mapped domUs, we need to avoid the RAM regions
>>> and inform the toolstack about the region found by hypervisor for
>>> mapping the magic pages. Patch 1 introduced a new DOMCTL to get the
>>> guest memory map, currently only used for the magic page regions.
>>> Patch 2 generalized the extended region finding logic so that it can
>>> be reused for other use cases such as finding 1:1 domU magic regions.
>>> Patch 3 uses the same approach as finding the extended regions to find
>>> the guest magic page regions for direct-mapped DomUs. Patch 4 avoids
>>> hardcoding all base addresses of guest magic region in the init-dom0less
>>> application by consuming the newly introduced DOMCTL. Patch 5 is a
>>> simple patch to do some code duplication clean-up in xc.
>> Hey Henry,
>>
>> To help provide some perspective, these issues are not experienced with
>> hyperlaunch. This is because we understood early on that you cannot move a
>> lightweight version of the toolstack into hypervisor init and not provide a
>> mechanism to communicate what it did to the runtime control plane. We
>> evaluated the possible mechanism, to include introducing a new hypercall op,
>> and ultimately settled on using hypfs. The primary reason is this information
>> is static data that, while informative later, is only necessary for the
>> control plane to understand the state of the system. As a result, hyperlaunch
>> is able to allocate any and all special pages required as part of domain
>> construction and communicate their addresses to the control plane. As for XSM,
>> hypfs is already protected and at this time we do not see any domain builder
>> information needing to be restricted separately from the data already present
>> in hypfs.
>>
>> I would like to make the suggestion that instead of continuing down this path,
>> perhaps you might consider adopting the hyperlaunch usage of hypfs. Then
>> adjust dom0less domain construction to allocate the special pages at
>> construction time. The original hyperlaunch series includes a patch that
>> provides the helper app for the xenstore announcement. And I can provide you
>> with updated versions if that would be helpful.
> I also think that the new domctl is not needed and that the dom0less
> domain builder should allocate the magic pages.

Yes this is indeed much better. Thanks Daniel for suggesting this.

> On ARM, we already
> allocate HVM_PARAM_CALLBACK_IRQ during dom0less domain build and set
> HVM_PARAM_STORE_PFN to ~0ULL. I think it would be only natural to extend
> that code to also allocate the magic pages and set HVM_PARAM_STORE_PFN
> (and others) correctly. If we do it that way it is simpler and
> consistent with the HVM_PARAM_CALLBACK_IRQ allocation, and we don't even
> need hypfs. Currently we do not enable hypfs in our safety
> certifiability configuration.

It is indeed very important to consider the safety certification (which 
I completely missed). Therefore I've sent an updated version based on 
HVMOP [1]. In the future we can switch to hypfs if needed.

[1] 
https://lore.kernel.org/xen-devel/20240426031455.579637-1-xin.wang2@amd.com/

Kind regards,
Henry


