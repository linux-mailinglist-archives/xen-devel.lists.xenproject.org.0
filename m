Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479FA7420F5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 09:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556654.869350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEm3V-0004W0-SB; Thu, 29 Jun 2023 07:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556654.869350; Thu, 29 Jun 2023 07:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEm3V-0004UH-OD; Thu, 29 Jun 2023 07:27:05 +0000
Received: by outflank-mailman (input) for mailman id 556654;
 Thu, 29 Jun 2023 07:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akp1=CR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qEm3U-0004UB-24
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 07:27:04 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542ef73a-164e-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 09:26:58 +0200 (CEST)
Received: from BN0PR04CA0184.namprd04.prod.outlook.com (2603:10b6:408:e9::9)
 by IA1PR12MB6436.namprd12.prod.outlook.com (2603:10b6:208:3ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 07:26:51 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::d3) by BN0PR04CA0184.outlook.office365.com
 (2603:10b6:408:e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Thu, 29 Jun 2023 07:26:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Thu, 29 Jun 2023 07:26:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 29 Jun
 2023 02:26:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 29 Jun
 2023 02:26:36 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 29 Jun 2023 02:26:35 -0500
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
X-Inumbo-ID: 542ef73a-164e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mf1jJHo9tWhduqhTlvCRUweW17gGfmBXAd9tsSlU00FBYnMUMVTTsMix6sTgZ49B9cprqoNRBO2JOBT1vt5DdoToGQHfMyTirDD73fdBhJBtHJFIJT9d6PXcwLv7Viqv7eAU8GHunEn8dtTay0HiQ/LcfejCChS0QoL/CfNYUATDSLtMoyBg3o4KyfP521p4G6cW4cxPFbwz8zt+Nzt/KU7XHCYj71fWd8FhusZsUGeFLoNOcfnRSZ08L1u1j9829aaulpDs2dBDdY5l/Snh58WqrL0yFJsE4oOk98QIn3lQP4PE/KsqTCcmZ3OwqsFVcIIhRiDAnALc4oLOQ2s9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLDKqdnRlWNhSNVoWYQ5M3Fw2pisIHkWMR/OMfPZMBc=;
 b=i2zuH0IJm69KF3ycDRf3np29cYqW4hxFoQqudEBPCv00gyIJCmHYt0gTWmWMfnX7x4YytRxCfrrrYM9r3Xq4VuJc2pJVg7zkkrFEBJ8V7232DmKhbV5RD34qsuMBHKfl/Zhw5YHUCtrH6kH0sEgfi22Q+930fFfawcsEHvxjmP0u7bGuMuj4tKxr2k63CaaFNJwDf9rPZpYU6dszaLCEsRkfi4q5mlzxNk46IBIuDdFrrtyLfSh42mMQQprvKfkHQEtS8a17euPiyZ+L5Myo3wcscQPyStVrn6sDCr02mg4By25o6W9vxjy1tDX5/iLSf6809f8wYzK/aAlkYgznWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLDKqdnRlWNhSNVoWYQ5M3Fw2pisIHkWMR/OMfPZMBc=;
 b=W+jOJzHELS/KgiZkOpb5yNTkXdjVnZEDZ4/W4wAVg0tC34J27pgjApYQLuWQ4xJl9vDOU8444AsYvyKy2Ur7Ux/km5S8Z3ycpRlK6X3CGXGMz0V/nU5hs3MhBL9Yhg7KhlXsGNcnqjS2tKfRzTvrd3q434S4sWQiNlLMjWX+Zck=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ad0e9f64-949f-018b-d9f1-4553859e02fb@amd.com>
Date: Thu, 29 Jun 2023 09:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/9] xen/arm64: head: Don't map too much in boot_third
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-3-julien@xen.org>
 <38f33ede-0d55-bd47-412a-eccb3d4618f2@amd.com>
 <7877f5af-12e2-808c-b2a2-fa0e302a00c3@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7877f5af-12e2-808c-b2a2-fa0e302a00c3@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT040:EE_|IA1PR12MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: b8390c92-65b5-45ad-9e5e-08db787234ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V6+mPo3G0e5ufRaxk3Xr++SofUqVy2VH+dziY1l1gDQRTpU2VEdoWUDY/e8u+BKarLkOwTRYXKl21VICHX1C90OszYtOF8dljhBjPSFZEV2NkwQ5hfJjqO3uCu6RfLFFFq2i5hSOMtPCg66KzbEkTwi4VWBrJ52is31w7ZrnKIl48AJncRlRae+wD536YBSv8zFdtwoXICLn2SMUR6qofhn7W/trlZZZ8RSFzJUrAcXH8liHpurjXDJ75404/od132ou/pZLRCytZOsNR2jH9ex8HaJNZSZyc9Y2DqImYEBwdmBJGk+hJkQ8lB4duL296pT/e04DBuBv3CVNrKjoFJh782DHEw3VDRkzwMgLap9EgyRThYGzxrvUKL0axTsv66zlRxN82pi5m+QVD7grh58tGeZHgPX+odhlROWmY6/wzRax2KF8L1SHyY+2Pg1Ifwn/HoIVpxPaEACHAJNzFRuLPQBuH5AINKjPVtZg827gd3i9gF21vpkgMtcabGiNPUAYXHJD8yv/hBaqY8JJMnO/TodfDBniAYIidKcWWv9IXWBtW+j2u0aaxRm11XdhAbx7hYO8Y/t7QKd/5p2i80aL4+jATtOOSC7slZ+OJWCAHhfxUYialsxOsH5aMXH931UG7k/oQoReVHBzID0ZPHAm666nd2w3655LjisSsf0byIyLlMJG/faPReC0oTluBucsXr18ALo+tochXuA2LYBdBbogPZIy9kwXdAeOur5Ba8lD13QDgDQsE5s3jEVJFksRXW5REeYagcUR8++f4wWrM6GMOZjbipZdoZr0XCy7tVZvKuqCA47nLyvF8CzC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199021)(46966006)(36840700001)(40470700004)(31686004)(82310400005)(36860700001)(36756003)(356005)(5660300002)(44832011)(86362001)(41300700001)(70206006)(31696002)(8936002)(8676002)(40480700001)(40460700003)(82740400003)(81166007)(316002)(4326008)(70586007)(110136005)(478600001)(47076005)(2906002)(53546011)(426003)(26005)(16576012)(54906003)(186003)(336012)(83380400001)(2616005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 07:26:51.2312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8390c92-65b5-45ad-9e5e-08db787234ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6436


On 28/06/2023 20:21, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 26/06/2023 12:28, Michal Orzel wrote:
>> On 25/06/2023 22:49, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, we are mapping the size of the reserved area for Xen
>>> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
>>> after Xen, so it is not a good idea to map more than necessary for a
>>> couple of reasons:
>>>      * We would need to use break-before-make if the extra PTE needs to
>>>        be updated to point to another region
>>>      * The extra area mapped may be mapped again by Xen with different
>>>        memory attribute. This would result to attribue mismatch.
>> s/attribue/attribute
>>
>>>
>>> Therefore, rework the logic in create_page_tables() to map only what's
>>> necessary. To simplify the logic, we also want to make sure _end
>>> is page-aligned. So align the symbol in the linker and add an assert
>>> to catch any change.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>>   xen/arch/arm/arm64/head.S | 15 ++++++++++++++-
>>>   xen/arch/arm/xen.lds.S    |  3 +++
>>>   2 files changed, 17 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>>> index f37133cf7ccd..66bc85d4c39e 100644
>>> --- a/xen/arch/arm/arm64/head.S
>>> +++ b/xen/arch/arm/arm64/head.S
>>> @@ -572,6 +572,19 @@ create_page_tables:
>>>           create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
>>>           create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
>>>
>>> +        /*
>>> +         * Find the size of Xen in pages and multiply by the size of a
>>> +         * PTE. This will then be compared in the mapping loop below.
>>> +         *
>>> +         * Note the multiplication is just to avoid using an extra
>>> +         * register/instruction per iteration.
>>> +         */
>>> +        ldr   x0, =_start            /* x0 := vaddr(_start) */
>> x0 is already set to vaddr of _start by the first instruction of create_page_tables
>> and is preserved by create_table_entry. You could just reuse it instead of re-loading.
> 
> I agree that the load is technically redundant. However, I find this
> approach easier to read (you don't have to remember that _start equals
> XEN_VIRT_START).
Ok. As a side note not related to this patch, would it make sense to add an assert in linker
script to make sure _start equals XEN_VIRT_START, since we use them interchangeably?

~Michal

