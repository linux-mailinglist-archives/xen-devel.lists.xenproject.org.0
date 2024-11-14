Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF769C89D2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 13:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836373.1252265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYro-0004X3-R9; Thu, 14 Nov 2024 12:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836373.1252265; Thu, 14 Nov 2024 12:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYro-0004VF-OJ; Thu, 14 Nov 2024 12:22:32 +0000
Received: by outflank-mailman (input) for mailman id 836373;
 Thu, 14 Nov 2024 12:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQsW=SJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tBYrm-0004V9-RP
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 12:22:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1845d248-a283-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 13:22:21 +0100 (CET)
Received: from BL0PR0102CA0060.prod.exchangelabs.com (2603:10b6:208:25::37) by
 SN7PR12MB7107.namprd12.prod.outlook.com (2603:10b6:806:2a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 12:22:17 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:25:cafe::19) by BL0PR0102CA0060.outlook.office365.com
 (2603:10b6:208:25::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Thu, 14 Nov 2024 12:22:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 12:22:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 06:22:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 06:22:16 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Nov 2024 06:22:14 -0600
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
X-Inumbo-ID: 1845d248-a283-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjFmIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjE4NDVkMjQ4LWEyODMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTg2OTQxLjcwNTczNywic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a81FQWniLP2Wfo75gdsACZQAtrcRaIcYQ5eF4tZUmEjjpiaPW3zg8uC4Vd0t65r9QldplyiCQxTKqPCkGNZkMrVFCkY2dHFiRdm98ibnT/cRbiwgkMKYQKU0nj36MfSBpW5RHycOM91EyBHp+iUCvgVq6RULRKPOUJpy80NdYrKuTPm3HIjkh68VEL4OY8MnODLxTO+HnifEO2sLJDqkBy8C56gb38BB6zKfbo1d2uEFbcknnEeYHzF/XPBuR/lX+5OZiPH12tqQd42DOgvW2hCWa2XUFk/MfBDi/T8YpaLXbOYfEn5xMBKKZ69jcOe1L2PYg+rNNzGIMzgMReqNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1r/naXYjspsWIe/YnUgVuCi6lSY47rT0QRfmq5xpr4o=;
 b=dTaK3rPd8EQQsHyyBZQwd33Sxi+tdih16cJYWvAa/+Lbs4pyXPykHpCrf0iRTeILXMdQZ7FadaYXOlUqNGab3sxzSgfJ8HX//MLXgVeS1MT7ZqeSeglQgfSqBxIh8V+GO9EAQDpmNws7PSBsQPBttHgke/ocg99qbZ2jpVV//XBSTT1StLqDlWgbBesEcWQ/RCBHZNc7MmfxvvkuZkP1vcTwZuwecBljS/bq8NKeBBH7xXUX0UtddWYF6B95sy55TLfPNyx18r91eoORRl/aMMGqrga8g7UV1DJ+M7nP6dW15fE/XvLE27GomxM3yFWhwTf92SR+e/JZdZZ3rMEQkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1r/naXYjspsWIe/YnUgVuCi6lSY47rT0QRfmq5xpr4o=;
 b=v0LZ/vqltmLXqWNrTxELqdXk09zQU/IjqcIXt02OMeWeuskQ0XuYHuHHS9F4ROtu25bpUJ4yaIb2k3YSzIObhvjs+ypHWPsU2nIdf+BvPXMyx6yCjKcRb0Iazg13HQnN+EplNv733IGzMcz4jcd/UM0JxvkiKj+KQd33W9OASj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7ba02037-05ec-491a-92c6-de7195d298ed@amd.com>
Date: Thu, 14 Nov 2024 13:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
 <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
 <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop>
 <92564de9-24f7-4259-bc45-a95680101693@xen.org>
 <e023a861-a1d6-415e-9be8-688664bf5680@amd.com>
 <8e467912-a71a-4c10-91dc-46706ed7aa1e@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8e467912-a71a-4c10-91dc-46706ed7aa1e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|SN7PR12MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: fc144c4a-d66f-4dff-3339-08dd04a6fa6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkhLcC93R2c4SC80ZHNWY2xxMVZqWldpWHB2SW1sWDUwem13OFlUWkVQZlMv?=
 =?utf-8?B?ZlgrbExzME5pOWZrMzZ0UGxSTHZDMWgwSmFLV1ZhMytRTmdFY1JmWEJ2ZHdx?=
 =?utf-8?B?NFVRbGxiRTVZWVpiTGFTSFpza2RLbkJleFYzNk8zT0VaZTJub2xYVjhldXE0?=
 =?utf-8?B?bmJqYnNmVGVlbjNWQUc1QnZ0WFFmYVFjeklnQ2FIOUVWRmllc0g4dEZtSUNQ?=
 =?utf-8?B?cFdnSjhkUjhXOHY1VkZuSk9XdmFJMG03VTF5T2NtaUc1bStWNnlzRzkyMmpH?=
 =?utf-8?B?QVV0aGZuTTZHalAzajR6NytTZm9OWlJ5dVNJZmNBZitIeW9YeWZob05ReWtS?=
 =?utf-8?B?V1hJVjVkNkViR1dMaStRaExHb3JFQkJVUkZnT081WDlVVHVBK2dPNDQyOVF4?=
 =?utf-8?B?SnpmS0ZsZVBCcHpYZXdZL2ZMY0NWU1pwT243ZXV3SGhmOVA4MWxNZGlRY013?=
 =?utf-8?B?c0NSU1hpaHI3czBYcldsK25QTGp4aFY0UG1jRUtQL2xzWXFUNzE5ejNzblJw?=
 =?utf-8?B?QmNJY01aQWl6RUZaUE5JMEdLY3Ztd0RUOEpOTmpWcGVaeEdpaGlFdzJKb2Rx?=
 =?utf-8?B?S3EzSVI5K3QrSGlabTdtY1RNZTI4c3FyaXhLUE56aG9wS0dOaVNjcVNFektq?=
 =?utf-8?B?L1ozTGtpVXozTWRkcE83TWdpM0krMGxyMHpERjRYcjl3RlVKY2xkSUJzMUZO?=
 =?utf-8?B?UU1wZUR6MmpRNG5mWkt0c0x6cnBETnZmUitLUmk5RVJoOS84V3BCZjRIQ1hK?=
 =?utf-8?B?RmxwOGJ1aW9VMk5LM0puNjZGb3F3dExzWHhPV1pHNUExbjZrOXRRQk9TNEFO?=
 =?utf-8?B?VkNaSnZkdE91cVJzbnUxcStldmJtVmRpbm5CQ0ZCd0pJbFhCS05uQVhHY3Zm?=
 =?utf-8?B?VUluY0lMN2M2YUlReXg0WTZETkQ2dzhzQko0S2FjS1BpanJrSGZFMmhoR0c2?=
 =?utf-8?B?cFJuTFhDUjJ0UjhjYVY0b0dNeXBESmloVFFXdzdnbnRxbmhVNEdUSXo3QlJQ?=
 =?utf-8?B?dVlocWFuYXB5UzBFa2FEWi9kblQyNUpwcUxOMGZaZ3ZSZ2pKK1VHc09TdEQ0?=
 =?utf-8?B?Yll6eXdBYlM0dDUwYTdOUEdTTFhLNmYyQkpTZlJ3WWorVGo2R0l3VzhqbnNl?=
 =?utf-8?B?aHEzbWt0UThlTUF1b2FaRC9NTWZSQWFIUWZPQktRemlWRVlpRlBoMjI3RVZM?=
 =?utf-8?B?OW80SmFXQ1pGQmhPNTJmRVllZEpYVmEzWVF6cm9ZYmEvMllsVFRNcFNNaG5B?=
 =?utf-8?B?eHFRSUlrNWhibGxSeW9ScEtPbXBoNWhPQ1EwUXVSMVNpS1IyQmRrWkxCZWFO?=
 =?utf-8?B?c1ZUbzhiSkVXRGRrWnlVV2lEOXhnSkdCSzdjdkN4OVkrOXFCaWVLaXV4LzRU?=
 =?utf-8?B?SGxjOFp6alg4OENLam1iMldMeU5taGNGaTJVeU9TcHVxaWt4N1QzRzRoNmNs?=
 =?utf-8?B?M1VBbXcvSGNEaDQ4ckwvOUdjTE50T0dpNkxPV3ZCWkw5QnNMMHhUa04raUpq?=
 =?utf-8?B?MHltcHFuc3JuOUxxZ3Q2YUVJUnIrZVhjTytTekVSSEpRdUNyL1l4UGdyZUJZ?=
 =?utf-8?B?cWxyb200T1lKWjg4aTBwaVVkeWtZOTVGUzFuRlV0Zll0K0pLb3pINXhOcWpy?=
 =?utf-8?B?TFA0aCs1NG1IMUFzMFlOaWpCdTEvZTZoSWsrc29SYzg5NHlVWnI1d052SmZx?=
 =?utf-8?B?bTBhQk8rRmp5T1pvcDhzYjdWUVdBdHhRVlJ5TzN5ZVBWOUkxWkM2a0ZzOGlS?=
 =?utf-8?B?YVlSOERWN0VtZHZwYndzeUFsdy91NjBmNnFTckxWVHpxSGlVWHcrZ0F4RkNZ?=
 =?utf-8?B?VlN5SkMvU2ZNNnhtY01acENVeG40N091SFVqbGpYM2pTbHR3WjF0OG91SFZj?=
 =?utf-8?B?RGJLV2VZQzAxaXhCdlVBNHNseW50YWxaNTB2UDAyWXRRbkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 12:22:16.8108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc144c4a-d66f-4dff-3339-08dd04a6fa6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7107



On 14/11/2024 13:04, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 14/11/2024 11:48, Michal Orzel wrote:
>>
>>
>> On 14/11/2024 11:31, Julien Grall wrote:
>>> Looking at the code, I think /memreserve/ and /reserved-memory are not
>>> mapped in Xen and everything in /reserved-memory is mapped to dom0.
>> Why do we forward /reserved-memory to dom0 fdt but /memreserve/ not?
> 
> I was wondering the same. The main issue I can think of with
> /memreserve/ is some of the regions will likely be for Xen own usage. So
Can you give example of regions defined as reserved for Xen usage (other than static-mem)?

> we would need to have a way to exclude them from dom0.
> 
>  >  From the discussion> we're having it seems like we should treat them
> equally. Also, looking at Luca patch,
>> we seem to special case /memreserve/ and only allow for overlap /memresrve/ with boot modules
>> and not /reserved-memory/ with boot modules. If we are going to claim that all the boot modules
>> can be marked as reserved by the bootloader, then I think we should treat them equally providing
>> the same experience to dom0.
> 
> In my mind, /memreserved/ and /reserved-memory/ are different. The
> former doesn't say what the region is for, but the latter will indicate it.
In the context of this patch, I don't agree. We're discussing overlap, and if a region A
from /memreserve/ overlaps fully with a module A, we know what is the purpose of it.
Today it's initrd, but as you say we cannot rule out other modules as well.

> 
> So I am not 100% sure how the bootmodule could end up in
> /reserved-memory/ because they are described as part of the multiboot
> modules. Do you have a scenario?
I don't same as I don't have scenario for /memreserve/ overlapping with sth else than initrd.
All of these comes from my validation of u-boot, grub, barebox code. I have a feeling that due to
U-Boot trick that is not present in any other *known* bootloader, we are trying to over-engineer the problem :)
But as Stefano and you wrote, we should follow the spec and for me we should therefore treat them equally.

> 
> Regardless that, if we decide to allow boot modules in /reserved-memory/
> then we would need need to rework how the reserved-regions are mapped
> because we don't want the boot modules to be exposed to dom0.
+1

> 
>>
>> Last thing I wanted to ask (for my clarity) is that if bootloader loads initrd at region A and marks
>> it as reserved (either in /memreserve/ or /reserved-memory/), and later on Xen copies initrd from region
>> A to B, shouldn't the reserved memory region be updated to cover new region for initrd?
> 
> If we mark the region has a reserved, then we are telling the OS it
> can't use the region. But I am not sure why it would be needed as Xen
Well, in the context of initrd, kernel uses it even though it is reserved. This is because
of the second part of the spec where other bindings come into play.

> doesn't care how the regions is going to be used by the domain. From a
> domain side, do you see any reason why we would want to mark again the
> region as reserved?
TBH I don't same as I still don't know why U-Boot does that trick. It comes from a very
old code and my initial understanding is that it is done purely for U-boot bookkeeping.

> 
> If we didn't copy the initrd, then I would have directly agreed that
> they should be marked as /memreserve/.
> 
> Cheers,
> 
> --
> Julien Grall
> 

~Michal

