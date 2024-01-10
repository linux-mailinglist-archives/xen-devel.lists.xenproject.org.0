Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD18294E9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 09:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665330.1035504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNTka-00065k-77; Wed, 10 Jan 2024 08:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665330.1035504; Wed, 10 Jan 2024 08:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNTka-000645-4A; Wed, 10 Jan 2024 08:15:48 +0000
Received: by outflank-mailman (input) for mailman id 665330;
 Wed, 10 Jan 2024 08:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcVA=IU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rNTkY-00063s-Sh
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 08:15:47 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7237ca77-af90-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 09:15:42 +0100 (CET)
Received: from SN7P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::14)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Wed, 10 Jan
 2024 08:15:39 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:124:cafe::ce) by SN7P222CA0002.outlook.office365.com
 (2603:10b6:806:124::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Wed, 10 Jan 2024 08:15:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 08:15:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 02:15:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 02:15:37 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 10 Jan 2024 02:15:36 -0600
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
X-Inumbo-ID: 7237ca77-af90-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzkbwPKq3d2XZdKsP3akhEAXStsU5KayofJ7AhnoHDXYRWi3Tq5ZmQ8s0k9SGL9BfifM5I6t+nAv1Yj8SpDEv2j7mTXRWY0Qk2EMTQKO2QfECXonB/PF/cW+XFIqbu44wGvZRzVP2VIEViLlS7+5pjJPO9G8IPblsqIUORRVDhjY7PEJ03/5PCp0TO1hoQvXhm0XBNw3xDqnyu1hvgTr3rDOmCkrxjDIk+O/bZi0F7Dhs62rGvQ2+v2TqvxCj+UN5m2KL1aaBEczIcvcyFAhd/FU+bYfu4QeCZP6Iu/0c8gOetgXXXoik5NLQLCcxji6lag+MEBgbk3o/EqJm3NjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJOLcC///zSSpjfavTY1zDBDUVkn+Xb8r3UJY+OGL7g=;
 b=jx4sMqXG3J42g+YxEdaM8jr8lUfdGNFjVu9JaFscgUdka0j+jKCx0gwaTl7sC0UogkDXij+Voyv4YQnnCx0AO15R+YGycLZ9eRSizlVy5snTO+nwAoGFwgro1re5Qdt6TU/CMIU2x6ULFzbk2ZKjKMXUlK4ruyZ+oFIJoWrKEElyw3BixRM5HCqOgv4Gv8/Fq+wyIXxtqRFf0fTyZhW61Skyy7jC1nTLCVFTUkmmomj+ZN4cZ6aOrLceTkLXjuEXoatKx8IbMLBWyHgvEmdm0HSpV7QK+KNrEav0LHxDyt2HEu2Wqlv+r+6grni5nDgzOx3ys7PqCtoisPnTgqSvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJOLcC///zSSpjfavTY1zDBDUVkn+Xb8r3UJY+OGL7g=;
 b=46i3o4GhpxO+lvUzM+bbDVnc5h0DpynmsIyufhX68ZbQHJGLIDkybzHPUV4uSfxZoyz2euhYvVVQ2rRzOiU2wW9xErrnIO6jQHpPoqcQAy8k7qf9bxvMS10/UZgqET4PDDMdEvZ7j88xJQhdKvjhJPEtIVwFt/G4s6JKt0DWszk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3aaaa37d-0166-4321-8d3f-38f8ec71a27a@amd.com>
Date: Wed, 10 Jan 2024 09:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen/device-tree: Fix bootfdt.c to tolerate 0
 reserved regions
To: Julien Grall <julien@xen.org>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>
CC: Timothy Pearson <tpearson@raptorengineering.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <1c6f0f94f4ea2b773f960d88bd02e2168ac28abb.1702607884.git.sanastasio@raptorengineering.com>
 <c1c6ee29-7fa1-4b39-aa7a-1b8f750cd893@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c1c6ee29-7fa1-4b39-aa7a-1b8f750cd893@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|CYYPR12MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c32c16-558f-46ad-c1c2-08dc11b4543e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L7EvP+37X0peBDrXeZ4RU8XzD5BSWdimxH74CLRpTWGl3mou5ttYXqJp06s0PygA9680ADh1fIpS59CaAHY7F01BJ3vnZRIJz79B68MSOngIxljXxrXeKZM47E6OiXWIBohNv3hj8D6WFjHKc5kuYasAuIYuaCnPJln5hTX/qn/nybwZN00jWrXdicc2wOSNYWW4gmgq0b/LAHPoMh8YMbpFKKIzFpQjkmJRGsRgBSDcBuNLbq6lyU+iNSdyulX81dAwc8obL0CtivHIYUkNOL8AgdMnXttVXCxeYYpD8yuGdQAKxS8Xhhg8+U+p0nh+5O5JVbbnucvNRiXHeyPsDb57sqQrPszsHROZ4e8J6WmEU6oGPOHdN3+CusKmo6/dmSuXmB2CfLaZUZTGsfJTTS8m368cEHpC1m5sPUgqBpyvz2dyp0QBGO6epZN/MrSz83n7OCHCIDq2EBFn/6Ha1WQ/NA24RgK39jDMx3wPlBUqGtPWNwScPkuKWw7fuOoxf0XCjZmZ1GzJLMISddDQPE2kb4YuY51kW1igfHDSIAln/lfDDl1A1K8R1SrHiqUiYQ3YUsG3h+YieUmLQ1u2Rps6pk8UebAxd+kg46X2zpDwG7ekuQZXiHjy9ozG5gcwXH2Fc+vm3eA5pLWYxd2xBnb7kOcYZMBSk6UxbpBEGwB2wRru0Iz8St/H1bF1OeDnqj2hz3y1pmhpsazBclbxSzWLCOHh4wmbHu9pgH0ZRsrLUHb+RLafbMFyQ6zOzd9xfyhb0eD56OuaTZE4vbcWqxBrPz5BJkRdWc0d/6WAPo3GOL3v0lehjbzK3NTmHTMB
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(46966006)(40470700004)(36840700001)(26005)(2616005)(478600001)(53546011)(426003)(336012)(36860700001)(83380400001)(54906003)(41300700001)(2906002)(110136005)(70206006)(316002)(16576012)(8936002)(4326008)(44832011)(8676002)(5660300002)(70586007)(356005)(86362001)(82740400003)(81166007)(31696002)(47076005)(36756003)(31686004)(40480700001)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 08:15:38.4170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c32c16-558f-46ad-c1c2-08dc11b4543e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856



On 09/01/2024 19:14, Julien Grall wrote:
> 
> 
> (+ Stefano)
> 
> Hi Shawn,
> 
> On 15/12/2023 02:43, Shawn Anastasio wrote:
>> The early_print_info routine in bootfdt.c incorrectly stores the result
>> of a call to fdt_num_mem_rsv() in an unsigned int, which results in the
>> negative error code being interpreted incorrectly in a subsequent loop
>> in the case where the device tree does not contain any memory reserve
>> map entries.
> 
> I have some trouble to reconciliate the code with your explanation.
> Looking at the implementation fdt_num_mem_rsv() should return 0 if there
> are no reserved regions. A negative value would only be returned if the
> device-tree is malformated.
I agree with Julien. The function takes an offset to reserve map and grabs blocks of type fdt_reserve_entry
from there. In case of no regions, there will be one entry with addr/size 0 which always acts as a termination region.
The only way to return < 0 is when you have a buggy FDT.

> 
> Do you have a Device-Tree where the issue occurs?
> 
> That said, I agree that the code could be hardened.
> 
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>   xen/common/device-tree/bootfdt.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>> index ae9fa1e3d6..796ac01c18 100644
>> --- a/xen/common/device-tree/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -466,7 +466,8 @@ static void __init early_print_info(void)
>>       struct meminfo *mem_resv = &bootinfo.reserved_mem;
>>       struct bootmodules *mods = &bootinfo.modules;
>>       struct bootcmdlines *cmds = &bootinfo.cmdlines;
>> -    unsigned int i, j, nr_rsvd;
>> +    unsigned int i, j;
>> +    int nr_rsvd;
>>
>>       for ( i = 0; i < mi->nr_banks; i++ )
>>           printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
>> @@ -481,7 +482,7 @@ static void __init early_print_info(void)
>>                   boot_module_kind_as_string(mods->module[i].kind));
>>
>>       nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
> 
> If I am correct above, then I think we should panic() rather than trying
> to continue with a buggy DT.
+1. Furthermore, we already call panic in such case in dt_unreserved_regions().

> 
>> -    for ( i = 0; i < nr_rsvd; i++ )
>> +    for ( i = 0; nr_rsvd > 0 && i < nr_rsvd; i++ )
>>       {
>>           paddr_t s, e;
>>
> 
> Cheers,
> 
> --
> Julien Grall
> 

~Michal

