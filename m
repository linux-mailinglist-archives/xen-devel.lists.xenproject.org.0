Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C36808808
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 13:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649831.1014798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDfM-0000AN-9q; Thu, 07 Dec 2023 12:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649831.1014798; Thu, 07 Dec 2023 12:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBDfM-00006f-77; Thu, 07 Dec 2023 12:39:44 +0000
Received: by outflank-mailman (input) for mailman id 649831;
 Thu, 07 Dec 2023 12:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3y0a=HS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBDfJ-00006Z-Qj
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 12:39:41 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af20b14d-94fd-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 13:39:39 +0100 (CET)
Received: from PH8PR20CA0003.namprd20.prod.outlook.com (2603:10b6:510:23c::16)
 by CY8PR12MB7147.namprd12.prod.outlook.com (2603:10b6:930:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 12:39:34 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::5d) by PH8PR20CA0003.outlook.office365.com
 (2603:10b6:510:23c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 12:39:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 12:39:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 06:39:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 06:39:33 -0600
Received: from [10.71.193.58] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 7 Dec 2023 06:39:32 -0600
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
X-Inumbo-ID: af20b14d-94fd-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRAHUznyYRWD5wnrPF+8WsA1p9zb9zNptRnalECaYw4sHAcoKP9UbmbDZ0aZr8swGmdbeYBGH2rOcwgLqPy5ZrZLI4OXI66jAOUFc7A6GstgRdS4RBs5MXNtFwypGVohs2KV3wgLWvJ99UNNU4p9nGrpup/0BV7rR8QRpqlAhsGAa70SwjCeYl+UCZ7FSbDa950OZax56ADJ3luPAufi7VpXBwN578DTRFkSr/UpkXIvN85Uh7cxjDojTPO5TN2MhCLoRr+1MlwzxaG+IFVhW7AdALXqxsDh1FYvR44wldpn/0UscR4kVuHBGzhu6PABxeOnCHVYIY3um+7Otc4LBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztymen/ZGCDTV+pCYhYRYCiQ71nGCgMziWiVMeuyH8w=;
 b=aoIejrkSczEi17+bPDwfzIjIYlFrmrD1aLdJSAyLUcnfs/P6uTZeSj+U8KRFlF30MYBCUULGb5V5txPV/9YIo72ettbBLkJQia+C/zHtEx9BsAvAR5T95JxrmDz/8Og4MVVq6TSSLPlf0KVu/Ur62G0pMq7N0J04uzHH+fjEr83ndZL36QyRQ3IyZHr00iySJRnXCpSrbCPo3PcWEvMpc1r5cMNT9N6vFIK8bLmPP8YhscfecRxMR5RMoiui9eZyMhex+hJtngBav1qLw8X6wLvWPKw5Pedsb71G2msx91XHjZIAiSWkDA0kydbzVlxYiAxeIwBwMpPVDy+2FFTXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztymen/ZGCDTV+pCYhYRYCiQ71nGCgMziWiVMeuyH8w=;
 b=crhCU6QsnWLN3HrMXt8s/mRGz9uwzdiLjVfpZOTrsEH0k+cxYEAEOKuGsmuyPb89Oxb6i0uzDcI45HHzf5Y7XRsTrVOWfsU0UjHv/A2B0HSZ6Z2kQmhhAZShni85Qct4BmrdpR8WHHox5dLgYmZUZO/cGQzaOXa+wN0zTR0+fQo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <30947562-9806-4bc2-8381-8ffee25b62ea@amd.com>
Date: Thu, 7 Dec 2023 13:39:31 +0100
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <d45f0d37-dbca-44a8-a27f-b9e709bb9cfd@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|CY8PR12MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fdc363-3938-48e4-97ad-08dbf72190da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	od1ux9qDUot5LQnCm3F5eZpNWrP2coH/S0aJlL8JWx6YrETc8s8ow1Wmh84yqEt28sOybjY39s4v4JTrni5ZzHo/hxzGpfkGWJBDGV3kryDbKhfcXGrfX+nD1bVzseyR3NHmnX0po8uZUJu+uUcC9AP6C9KkQIBZfVCJ3YgLIYZMm4gMEF5kqd9Dao6rAwwIwdAQs23v+KL3xZhOY8X1uHIj4b9+KCMZBgDBqXrzMSyDecgbEpiJJMciVtACukbzYzfBEh7N5rpSEA5Oh3OHWuyCQ1nVGRVfjTTOxb4gNvfC0lgaT+UPJhpOAdX3EL2Wp5jHkBDEKP2P60iORrZtA0pLunuWoZvc0dGn5Y65UOGNLkE+m/Dxyi+Dud+W90ONxXaftJvhxw9DxvTBJaNbWp6ewRHB7JdAUDjjNHyPcjw1Mz3sbq3ws39xKt9MBhUWirmlaetDOye1a1RAuSJFUVL+QEnxgyqqwne2NCaV5pfbs0AQYCZDQAGa/uQfZyYcCeyzbOYb5139Vn1YlRmLMDMrp7E9FbS8RXdOFJnue4kpTnV5iHv7Jk6FXw9KGbLpnmvUqLwFylqs5F1OPfU7pB3P8p1bW231etZpQIp31eGZb2sXEW3LcJgwvtgrJtb4HFP4bERMu5X0g+WHf2vHaMsalNT0GQLJnLdF0+82Y95zWx6+uGyddCNNCrO4zYg5+K8a357TwkGLiKiRvU+mNiRs004X2fFhrPfgu48W8v5mUSN5Eg8pKefzAu5diUFigQ/lCCFWoX/0Ox6Ex51ySDDzF6ztECdRAN5Ta9tU1BTisjTnf1NEU/f5KXuy7nXt
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(40470700004)(46966006)(36840700001)(83380400001)(40460700003)(2616005)(70586007)(336012)(426003)(26005)(36860700001)(82740400003)(356005)(36756003)(86362001)(31696002)(47076005)(81166007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(44832011)(70206006)(31686004)(2906002)(16576012)(53546011)(110136005)(54906003)(40480700001)(478600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 12:39:33.8814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fdc363-3938-48e4-97ad-08dbf72190da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7147

Hi Julien,

On 07/12/2023 13:20, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 07/12/2023 10:14, Michal Orzel wrote:
>> As a result of not checking the return code of device_tree_for_each_node()
>> in boot_fdt_info(), any error occured during early FDT parsing does not
>> stop Xen from booting. This can result in an unwanted behavior in later
>> boot stages. Fix it by checking the return code and panicing on an error.
>>
>> Fixes: 9cf4a9a46717 ("device tree: add device_tree_for_each_node()")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> With one remark below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
>> ---
>> I've lost count how many times I had to fix missing rc check. However, I have
>> not yet found any checker for this (-Wunused-result is pretty useless).
>> ---
>>   xen/arch/arm/bootfdt.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index b1f03eb2fcdd..f496a8cf9494 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -541,7 +541,9 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>
>>       add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>>
>> -    device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
>> +    ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
>> +    if ( ret )
>> +        panic("Early FDT parsing failed (%d)\n", ret);
> 
> AFAIU, the parsing is done before the console is setup. This means a
> user would not be able to get some logs unless they are re-compiling Xen
> with earlyprintk.
> 
> I understand this is not a new issue, but I am getting concerned of the
> amount of check we add before the console is up and running.
> 
> What is the impact if we don't check the return here? Is it missing regions?
There are many things that can go wrong.
Quite recently, I faced an issue where I specified 2 dom0less domUs in configuration
and due to the error while parsing the last node of domU1, domU2 node was skipped and
Xen booted only domU1 without giving any errors.

Issues with shared memory led to either Xen continue to run with improper configuration,
silencing overlap conditions, errors at later boot stages that were impossible to deduct
from the logs.

All in all, early boot code parsing assume the error to result in a failure and the parsing
for domain creation makes this assumption as well (checks are more relaxed to avoid duplication).

For now, we can't do anything better than panicing early if we want to avoid unwanted behavior.

> 
> I wonder whether we can either enable the console earlier, or make
> earlyprintk more dynamic (similar to what Linux is doing with
> earlyprintk=...).
The most imporatant part is early fdt parsing. The main console init cannot be moved that early.
We need to add earlycon support just like in Linux. User could then select either earlyprintk or earlycon.
(earlyprintk would also print from assembly + from everything before boot_fdt_info). I think adding support
for it is doable. But as always, no one has time for that.

~Michal

