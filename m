Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C8C876F68
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 07:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690514.1076571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riqRm-0006zw-6i; Sat, 09 Mar 2024 06:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690514.1076571; Sat, 09 Mar 2024 06:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riqRm-0006y1-3w; Sat, 09 Mar 2024 06:44:42 +0000
Received: by outflank-mailman (input) for mailman id 690514;
 Sat, 09 Mar 2024 06:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RdwC=KP=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riqRk-0006xt-Nw
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 06:44:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f2b37a4-dde0-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 07:44:37 +0100 (CET)
Received: from DM6PR02CA0145.namprd02.prod.outlook.com (2603:10b6:5:332::12)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Sat, 9 Mar
 2024 06:44:33 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::98) by DM6PR02CA0145.outlook.office365.com
 (2603:10b6:5:332::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.29 via Frontend
 Transport; Sat, 9 Mar 2024 06:44:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Sat, 9 Mar 2024 06:44:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 9 Mar
 2024 00:44:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 9 Mar
 2024 00:44:32 -0600
Received: from [172.31.69.246] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sat, 9 Mar 2024 00:44:29 -0600
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
X-Inumbo-ID: 7f2b37a4-dde0-11ee-afdb-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+/PE5nEYDTuultTWUFL5vUR39hl7X+K+C9GmNg5FZ/iHRmEwRD/0I8/qilqDGWGpl9RtXOThStexzhQOoPRQlyAD17weolc3uBjCcwP4DHip3ATBah46wRXjo8ovzXU29tASbxfTTa5WQ7bg7aK/OsbWI4UX+RiWi5hYQxjpysBkVC/FV5wGNA29zExUQg1bGTAkUxQJ6ctBC5TQAl/neNZc0mrKqJfMLlhagGpg6UgSPXWHKU6pDlTQbEpLTQx3i26CPoFtR8gqdu0SGWlLOF4EoX7LnHN0z6Jj/RcK52tEUX0eoZKkyBmxFF0c4OWAhUFVI+pXWc1e8P+TQKcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCnF0ak/3FNORbw4KMWfvnU4kh709Ckgp2TgFULY740=;
 b=AynDmcFR9cHNxYzHSRsNVR76Ct3NcZUz1zjbhAyW3Elhj69qmHVaxY6y6bW24a2OzuidYZ+dv0pkdZgtIiyOn9F6QqUhkEtmnkm2z3NwiBazJ79DO5pwkNLnuaXa1RtcZiWaBVYBqf5ScRjdpk51edZ/4+rvfF/aL4PKosKdrcbid7IuZfhgFRcYbKpP/hjcMkZh9i2hXdn4YL1wZoHooV9iKzpD6mNmzcplJpBNs9TS5J31S30cz09oxswp2QkJkaPwaloRjyIWEjGL2ebE+ImAFhJQmbbZMmTNuLK7Q0qIS7GlSqcbBWC0SPGkbWwlReSeffFSuiZikOC9f2BfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCnF0ak/3FNORbw4KMWfvnU4kh709Ckgp2TgFULY740=;
 b=mxkfJsPseAM9yVVskzu05tiRWVO20JgqNeUagknUrh5RQ7YQqikNpSFk7mIr3KSih8oLc4imjXubAIFN03b6f8dTgVCbkBiM5dW8uYUQY+E/ws/kp/EFMbeInvK5JfH8GHeYoGipb2A/wvIq28fjWE6a0gyZNVd7/XwjdTBSxdE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8df22d81-ce3d-4a90-8aa9-34ec66d237c6@amd.com>
Date: Sat, 9 Mar 2024 14:44:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/15] xen/arm: make consider_modules() available for
 xen relocation
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <xin.wang2@amd.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-14-carlo.nonato@minervasys.tech>
 <1439263a-c96d-48bb-bd3c-1427071ecd17@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <1439263a-c96d-48bb-bd3c-1427071ecd17@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 34667c13-d2fe-4b04-6cb0-08dc40046119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ddn4dKUpidd78AdcOpX+v4hNyboNtJiHQA4cAWPhcMTiA5mfqvD2R0gDqdV4cZBG4oYlbyGZtRhMECg8n2AKd8igBnwJCx6lPmLIUKJ3dk4KxwvRu4NsvafVl7durPK20JpqVGxXK8L6+6VK1ZQKE1M0tDrotiGihiy0Hr7P2lPFhBcSjExu6PB+dARTq8iU/5OFA1cU87Us4dHqtKxhx6SSVQWtTW6iPPpoW5hM52AeuC28ajfsWBpNjqpxIe58cAirtULKPIuRQ6YpZyyf/2SRiYq7e5RVMH8yNWnpYyzrybA45bj56zx2oHaakMpDwJYVHtNIynXaJIEDJqI2IbzAKUkEoX5u0mwyGDXRZJXAK+QisAEMRzjNqooBYlP/zS+F/bKtTQIU0Zo+0NTAHpXTr7+8bDYwooMx818ZBi/aIkpGxwHTfFb/H2Jk1B1X8yOKyYGD0T+16vdv2EfkoOWq94rfTXuYSQv5ejkmmJwcKTsCtPO5VbeOPyZrRCLdAm0gTViA2TbK/s4jTEa0spuFBTUrs2uhIxXVS1K82SilVtjcF4f0HjflkiZGE4xwWtW6NIJy/ej5FRDeDEcWGR2C8QlwCF4vTvK+S3H5wlqKqdCjXOBgvTlEtXG/GBAqQuIh/ucO2J+7Sg2lqat7uUYFEc4pV29J5YweiubuYPm3dC21xZdW84CN6kaBQ6dXqrSdRN7sPQJVa6tQmM0t114Sol3an/G3T/m9ktc6T6SqNOymMXS5mxzHRK1W8amv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2024 06:44:33.1152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34667c13-d2fe-4b04-6cb0-08dc40046119
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423

Hi Julien,

On 3/9/2024 6:30 AM, Julien Grall wrote:
> (+ Ayan + Henry)

(- my old email address + the new one)

> Hi Carlo,
>
> On 29/01/2024 17:18, Carlo Nonato wrote:
>> Cache coloring must physically relocate Xen in order to color the 
>> hypervisor
>> and consider_modules() is a key function that is needed to find a new
>> available physical address.
>>
>> 672d67f339c0 ("xen/arm: Split MMU-specific setup_mm() and related 
>> code out")
>> moved consider_modules() under arm32. Move it back to setup.c and 
>> make it
>> non-static so that it can be used outside.
>>
>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>> ---
>> v6:
>> - new patch
>> ---
>>   xen/arch/arm/arm32/mmu/mm.c      | 93 +-------------------------------
>>   xen/arch/arm/include/asm/setup.h |  3 ++
>>   xen/arch/arm/setup.c             | 92 +++++++++++++++++++++++++++++++
>
> Ayan, Henry, will the function consider_modules() be used for the MPU 
> code?

I checked all the MPU branches (the recent arm64 implementation and an 
arm32 branch to my best knowledge), no I don't think the function will 
be used for the MPU code. However I am not sure if Ayan has a newer 
arm32 MPU branch on top of the latest staging or so using the function, 
Ayan would you like to add some comments?

> If not, then I think the function should live in arm/mmu/setup.c.

+1, arm/mmu/setup.c is a good place.

Kind regards,
Henry

>
> Cheers,
>


