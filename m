Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E3B742104
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 09:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556673.869380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEm8A-00074s-02; Thu, 29 Jun 2023 07:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556673.869380; Thu, 29 Jun 2023 07:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEm89-00071c-Su; Thu, 29 Jun 2023 07:31:53 +0000
Received: by outflank-mailman (input) for mailman id 556673;
 Thu, 29 Jun 2023 07:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akp1=CR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qEm88-0006yw-1V
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 07:31:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe59::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa05bc3-164e-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 09:31:46 +0200 (CEST)
Received: from MW4PR03CA0095.namprd03.prod.outlook.com (2603:10b6:303:b7::10)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 07:31:43 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::70) by MW4PR03CA0095.outlook.office365.com
 (2603:10b6:303:b7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.34 via Frontend
 Transport; Thu, 29 Jun 2023 07:31:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.48 via Frontend Transport; Thu, 29 Jun 2023 07:31:41 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 29 Jun
 2023 02:31:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 29 Jun
 2023 00:31:40 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 29 Jun 2023 02:31:39 -0500
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
X-Inumbo-ID: ffa05bc3-164e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzTw1RU8rf0KIW9oMhBDosFGU6XP7LnIptZr4DunWrVNhwoOyOSVoc3xD9x5iaPKHUX7OaOQg0FTz7hKQliEFuNGUVSBui2frzP8RBMSkTHCHqE6vO/MUDYVk7WzZIFBqgk3W3NrPf5stru8RGnxHu5zsiQsn0tW/X7OhtcktMfPAgdXfdLw+npSVlMEjatlecdRS4L5DGfykLhU5I5yoROyTZr/pvEP7LYV64kgdr8A/jp+rbcYmNhYKzJfW93MCXqYgQSmJpohM8reTfUbQmmPw4mIrQOR/X+a6P9YI5IyZGQv6upbx37Tv0N2pqSapaChv0S0jqqWVSdcS2J4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxlBVyNEIaSzcOVq8vhIRM8864iDx5ELsLbz9ZJoHCU=;
 b=YW0ToHpzfkhxnW01k3CpFNkNw8kUAzJYY/t6sDPtu2YUQGaybpyfkhnToeo2GtwtGAL3QeUX4lEUbepjSoeF0tWx8ZJdbBbPQJdozHuRuRm12cdztYY9AXBgfliZ/fQpHqD8Z57y/qMcHeAJori3ixsiCi37eMxFLvrejtw2uUydCBNsWCvAvKYzyRaBAT5hogbFjCjvTRkAQL2swgsq/N5N+IEmHTExW618DD1ks5yDwYiB8OZXXFF4En+gedUEGZh/siSIUZXiwqw0aOtOA4RIdfLlLoeLkWp2ccqEs0LBAAUD4d/uY7+8ObmtyIGtEMklDrY6Isn9rM2yoO/V/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxlBVyNEIaSzcOVq8vhIRM8864iDx5ELsLbz9ZJoHCU=;
 b=Swjf4df8GPIqX6RAMukuG3V3dIv2nPZi1cebLyuq5Bvi1hzTR59oEvDcVVCuH6lGAJTFTLn8B/1ttF6Fz+GWq51jeRTqn1VbK4o5FYkDZgZc+Crd5zXQ+DKNa2CAQrgtLackq4yLjkdrhUPFaxY36ta50nuUVn/CauevKJgUcOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8c20ee15-80c4-75ee-bc4d-d0caa934318d@amd.com>
Date: Thu, 29 Jun 2023 09:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <804682ce-ad88-34dc-1501-c9ff6347fb8b@amd.com>
 <f9afb315-34f8-0e1d-de67-5024fe7f616f@xen.org>
 <bfa85ebc-74a7-e693-6392-cee24302c19e@amd.com>
 <bedaa6de-5232-d497-a886-d3626f8efb0d@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <bedaa6de-5232-d497-a886-d3626f8efb0d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: c8347292-4f90-4f1d-6a6d-08db7872e23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p92j/5mk6TN04oCWcQ1f/WlPhVa/xqVZcmfXdxVGW+tmMKlUh7PpwoBGSf7/AhcZgNQl/q6Nu1PiByTK0SYnmGS633WcmFzSeE1De4/fgzpBjWJP2X+uVL2qos9jiSHdgEALKrY0kUD7RYnij8xNMA67z6JuewckKYPwxnMl1jB/ZqWZbmIYtb99hxZspriyRyZjlIKrlnoPDheRen7ODgPYjYuiQsrZGEk0BdkmZWBbYuNy5YEwgbucFKamryWaB3H3tfZ+/HxFEIliJlTmuPAX13dZNPDvTkB/aBgrAX+V3jpvbi2E715SsRKDw/ZzmfA261IF5k46PVwcktg4whpSfem+n0HJJu3JUWoTWvmeArytKqEoBNYHANBgNkRULnPDmNMJ/DpULA1mTw5FKfx5wSdK6GC46BFIG2ln19donPoEJzufosZnW9gVcuz7agJfSm7hMCd6WP4KgNB5Zkxa55C4WrDJiHZBaDsKXmhN88F6qANeSnVKfYxxQ2pMqS/t3lAh4okxvbBbLTmtdBNLoHEsPplu8nSuvGT/szsq3NcqOsjmKt7k8jQ1SKMGwtq0Ibq0OH7eAmlvhhFzBeQJ7JX4c7KJvvfYMiQY1CQwXuwpLbK0yxkvVrpl9vlG1y2QwO7TrjVunhq/9kemfI+djOJdwp5dBrGT8R5NOSg35/IJIWMhqjqqzEJxN6iR+bOtPXCqdQBR+B2IonS0hUPJB16osaqFTeSv5YbXCl9bH2jPEYKPls2IAwIikxuZUkhnVGQjulHWVbJGAQuX/vThGBn202255p3umSw40+FyFa3jtYFXBa02NMGiJQII
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(81166007)(356005)(82740400003)(47076005)(83380400001)(31696002)(36756003)(36860700001)(86362001)(31686004)(478600001)(110136005)(54906003)(16576012)(70586007)(40460700003)(6666004)(2616005)(4326008)(41300700001)(70206006)(316002)(8936002)(8676002)(426003)(336012)(186003)(53546011)(26005)(82310400005)(40480700001)(44832011)(5660300002)(2906002)(66899021)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 07:31:41.8735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8347292-4f90-4f1d-6a6d-08db7872e23a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569



On 28/06/2023 22:39, Julien Grall wrote:
> 
> 
> On 27/06/2023 09:09, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 26/06/2023 14:56, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 26/06/2023 12:56, Michal Orzel wrote:
>>>>
>>>>
>>>> On 25/06/2023 22:49, Julien Grall wrote:
>>>>>
>>>>>
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> UBSAN has been enabled a few years ago on x86 but was never
>>>>> enabled on Arm because the final binary is bigger than 2MB (
>>>>> the maximum we can currently handled).
>>>>>
>>>>> With the recent rework, it is now possible to grow Xen over 2MB.
>>>>> So there is no more roadblock to enable Xen other than increasing
>>>>> the reserved area.
>>>>>
>>>>> On my setup, for arm32, the final binaray was very close to 4MB.
>>>>> Furthermore, one may want to enable USBAN and GCOV which would put
>>>>> the binary well-over 4MB (both features require for some space).
>>>>> Therefore, increase the size to 8MB which should us some margin.
>>>>>
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> ----
>>>>>
>>>>> The drawback with this approach is that we are adding 6 new
>>>>> page-table (3 for boot and 3 for runtime) that are statically
>>>>> allocated. So the final Xen binary will be 24KB bigger when
>>>>> neither UBSAN nor GCOV.
>>>>>
>>>>> If this is not considered acceptable, then we could make the
>>>>> size of configurable in the Kconfig and decide it based on the
>>>>> features enabled.
>>>> Both of these features are enabled only in a debug build of Xen, so
>>>> another option would be to increase Xen size only for a debug build.
>>>
>>> At least UBSAN can be selected without DEBUG. For that you need to add
>>> EXPERT.
>>>
>>> Anyway, from your comment, it is not clear to me whether you dislike the
>>> existing approach (and why) or you are OK with the increase.
>> Sorry, I was traveling and did not have time to complete review.
>> I cannot see why increasing the size would be problematic so it is ok. That said, it could be
>> a good idea to write some comment above XEN_VIRT_SIZE, that this value is somewhat exaggerated,
>> so that we are on the safe side at the time of activating features like UBSAN/GCOV.
> 
> Sure. I will add a comment in this patch. For ...
> 
>>
>> Also, it would be nice to update comments in head.S of both arm32 and arm64 above
>> GLOBAL(start) that were left stating:
>> "All of text+data+bss must fit in 2MB, or the initial pagetable code below will need adjustment."
> 
> ... this one, I am thinking to drop the comments in patch #5. They don't
> make sense anymore as we can now in theory deal with Xen up to the size
> of a L2 mapping (1GB for 4KB).
Seems right.

~Michal

