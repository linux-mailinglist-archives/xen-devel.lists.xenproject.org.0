Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833F808AB0
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649942.1015108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFSk-0006cq-0l; Thu, 07 Dec 2023 14:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649942.1015108; Thu, 07 Dec 2023 14:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFSj-0006ai-Sq; Thu, 07 Dec 2023 14:34:49 +0000
Received: by outflank-mailman (input) for mailman id 649942;
 Thu, 07 Dec 2023 14:34:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3y0a=HS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBFSj-0006ac-2b
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:34:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c513042d-950d-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 15:34:47 +0100 (CET)
Received: from DM5PR07CA0066.namprd07.prod.outlook.com (2603:10b6:4:ad::31) by
 DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Thu, 7 Dec 2023 14:34:43 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::d6) by DM5PR07CA0066.outlook.office365.com
 (2603:10b6:4:ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Thu, 7 Dec 2023 14:34:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 14:34:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 08:34:42 -0600
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 7 Dec 2023 08:34:41 -0600
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
X-Inumbo-ID: c513042d-950d-11ee-98e7-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMYYXM9r5UdD1hAY1IbTYHAV62NDeG9BeyOv7UiL4l/QK4U4heR9viTBvoLDfcfkru0YOyCzL60rClJ6bWv2Meq3kmCHeoL5/OeeSTwnX4USX4DmyGOPzrh1E6Av3cmy0jHtmPjlYehd9FXXGSN6hFjKr6OERIS/q5FBcJDJNH0GFESdAyTEaTDWeQAU6vaHCbYm2d6M4Ho6+uiQCXMidekJLFTMhf8Gpd94bVZDwSDph3DtE/OZ0MU5t4la8UHlEFKyv1CE10wh6ij+daqG6flk3rGbVVQR4RyZvZ9ULtqotQM2Yx++VDl1+P1lv0qrVcekDjCDz7imiTrqgea9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OJSWzsMJ2qf1OlMoUCQENudpQI71Sk8yuICQafUiak=;
 b=Hy48ymBtMLR4+anBEe4KKL/LhfHOjGEj7I5ERmb+k02Yj7jmB2G2CLyvuXUuxx3998RucCuugp/7IU2mGZQWvsTbLtcAcmu4pMxkgHNJDEGpnzaCyFFv3dRldXOkkH75qa2m0Kmpl29aSpuEXBsqDieCOleBCgZdT7ESk1lbh4OGYRxE6gpj66elm5DkKo46J8Aiu5dXmfaPkyHJWG93aWvB3WJIZlAkhU1W/pP4gf32lCQPa0zQ+C8pLZxYsseAvHDaoODvi7BC6sZN5sqRi7F17XZpg9etano0oGHvteX/vrP4mhGTBSpYl9216MUxKHIbpvGY9d/7gS0msdB8vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OJSWzsMJ2qf1OlMoUCQENudpQI71Sk8yuICQafUiak=;
 b=O8CwN9pqSL+PNhFgfujjhzFvnWxQ6f/RqwJj0z4rlWqCUAyD7Jnr6tqCfLoNuoNHBmVJsC5TmHNwQrjaxxHT3xUirWNOGsGPGMI3npCJ60jKqtcdFxb1njcFkXDo/BjJ7YSJxK3Tbp0223wILcTGNcuEETp5Wb3vikThoEAflqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a111fa0a-2948-4b12-8ff7-c225cca1a823@amd.com>
Date: Thu, 7 Dec 2023 15:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: bootfdt: Check return code of
 device_tree_for_each_node()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231207101432.37732-1-michal.orzel@amd.com>
 <d45f0d37-dbca-44a8-a27f-b9e709bb9cfd@xen.org>
 <30947562-9806-4bc2-8381-8ffee25b62ea@amd.com>
 <b9b41fdf-7ecf-4a5d-be9d-d49f59810678@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b9b41fdf-7ecf-4a5d-be9d-d49f59810678@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba513a1-3214-48b5-582c-08dbf731a6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CDk4NvyDa+olU73tx7xdMZdXLQQsdMpKSb2RwenlB6TTUHKtMTDaVsYC8oNnBKO9FMhF9ldC0e+KJ16WYuKrsyvOPITn0pOiM31m7q8lojuKj57lzzUF67w9sWuiRfMqwMQgGqycuc9G8YNcn2aSU2wyccusA18LbyLPuRzUVsvQgeCEAHD2saIEuWN45DXXu5xExArHHqwABMHnzHtCLzan8yMpftYvStfTxzSNB78O0LghCGNBWiNdcZZPBazzUObmviLEb9RqEEUwwqj9ca1ElHBLLMD5jyF4/lXpNtt8ehLLgpMPi1Ll0Bs9Fg5zN2FsolTeVh/NJ5dj+Xfkx4UgAs4s/4ckbEKsSIAxmFZVMadMZjDOhaATXtXQQfELwKNzHLtdOsv13R8EicNnmdaW/diYJDH07vvHfWNEVBD/f8ROeEmZec2CYMv7Tudnt6aaHFFcip7ny3rVE4PNSnF4bxjlXgc7zRKMOM0Bxfwuc9lbiS2dQqh6fNaYrtQ/+e7Qn3cyVW0plcpC/VSl8EOFd4pR7GmvltTnt0ybkusgSS96Wx9LYy4VdS4CEKKLiwkOi5B5UX3Th/bQIRuAQRFZ9DuO11wVHhcjuOFP5L0Uit4DRsKfmek46GfHtMVZNBCoCPC9+Wwle6miRfI2J+VMZ2gL2MR7e7gSWngujYiV2XuAwE9Ul4bDTOrKirf7z6TPz0HZLVjiK3MZpqkk+1itPI3m44gG+XknOBsR3mLAd36HTNMmxiZQvjhBR/A7/sQI6FURoYO5RIjnQ28qqPV59pjYf67H5bJTJ+HHd2jzQ7unyOtjlEhkT5Hgiv3B
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(31686004)(53546011)(2616005)(26005)(47076005)(478600001)(81166007)(356005)(82740400003)(31696002)(86362001)(36756003)(41300700001)(44832011)(2906002)(5660300002)(70206006)(110136005)(54906003)(336012)(36860700001)(426003)(70586007)(83380400001)(8676002)(16576012)(4326008)(8936002)(316002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 14:34:42.6879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba513a1-3214-48b5-582c-08dbf731a6dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844



On 07/12/2023 13:54, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 07/12/2023 12:39, Michal Orzel wrote:
>> On 07/12/2023 13:20, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 07/12/2023 10:14, Michal Orzel wrote:
>>>> As a result of not checking the return code of device_tree_for_each_node()
>>>> in boot_fdt_info(), any error occured during early FDT parsing does not
>>>> stop Xen from booting. This can result in an unwanted behavior in later
>>>> boot stages. Fix it by checking the return code and panicing on an error.
>>>>
>>>> Fixes: 9cf4a9a46717 ("device tree: add device_tree_for_each_node()")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> With one remark below:
>>>
>>> Acked-by: Julien Grall <jgrall@amazon.com>
>>>
>>>> ---
>>>> I've lost count how many times I had to fix missing rc check. However, I have
>>>> not yet found any checker for this (-Wunused-result is pretty useless).
>>>> ---
>>>>    xen/arch/arm/bootfdt.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>>> index b1f03eb2fcdd..f496a8cf9494 100644
>>>> --- a/xen/arch/arm/bootfdt.c
>>>> +++ b/xen/arch/arm/bootfdt.c
>>>> @@ -541,7 +541,9 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>>>
>>>>        add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>>>>
>>>> -    device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
>>>> +    ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
>>>> +    if ( ret )
>>>> +        panic("Early FDT parsing failed (%d)\n", ret);
>>>
>>> AFAIU, the parsing is done before the console is setup. This means a
>>> user would not be able to get some logs unless they are re-compiling Xen
>>> with earlyprintk.
>>>
>>> I understand this is not a new issue, but I am getting concerned of the
>>> amount of check we add before the console is up and running.
>>>
>>> What is the impact if we don't check the return here? Is it missing regions?
>> There are many things that can go wrong.
>> Quite recently, I faced an issue where I specified 2 dom0less domUs in configuration
>> and due to the error while parsing the last node of domU1, domU2 node was skipped and
>> Xen booted only domU1 without giving any errors.
>>
>> Issues with shared memory led to either Xen continue to run with improper configuration,
>> silencing overlap conditions, errors at later boot stages that were impossible to deduct
>> from the logs.
>>
>> All in all, early boot code parsing assume the error to result in a failure and the parsing
>> for domain creation makes this assumption as well (checks are more relaxed to avoid duplication).
>>
>> For now, we can't do anything better than panicing early if we want to avoid unwanted behavior.
>>
>>>
>>> I wonder whether we can either enable the console earlier, or make
>>> earlyprintk more dynamic (similar to what Linux is doing with
>>> earlyprintk=...).
>> The most imporatant part is early fdt parsing. The main console init cannot be moved that early.
> 
> I think we need to understand a bit more why because on x86
> consoel_init_preirq() is called very early. So we ought to be able to do
> the same on Arm.
But this won't cover early fdt parsing. I don't think we can get away without adding earlycon
and earlycon helpers in all the serial drivers. arm_uart_init depends on unflattening fdt which
depends on relocating fdt which is done after parsing FDT. We want to be able to print messages
after early_fdt_map. Once FDT is mapped, the only thing we need is to retrieve the bootargs to parse
for earlycon= , add the region to fixmap and register the handlers.

~Michal

