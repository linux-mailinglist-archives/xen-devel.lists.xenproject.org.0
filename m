Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111C737F54
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 12:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552627.862800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuqD-0001Ql-DZ; Wed, 21 Jun 2023 10:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552627.862800; Wed, 21 Jun 2023 10:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuqD-0001Ob-AA; Wed, 21 Jun 2023 10:13:33 +0000
Received: by outflank-mailman (input) for mailman id 552627;
 Wed, 21 Jun 2023 10:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YYRl=CJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qBuqB-0001OV-Pj
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 10:13:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4494192c-101c-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 12:13:30 +0200 (CEST)
Received: from CYXPR02CA0006.namprd02.prod.outlook.com (2603:10b6:930:cf::10)
 by LV3PR12MB9216.namprd12.prod.outlook.com (2603:10b6:408:1a5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 10:13:25 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:cf:cafe::7c) by CYXPR02CA0006.outlook.office365.com
 (2603:10b6:930:cf::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Wed, 21 Jun 2023 10:13:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.20 via Frontend Transport; Wed, 21 Jun 2023 10:13:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 05:13:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 21 Jun
 2023 05:13:24 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 21 Jun 2023 05:13:22 -0500
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
X-Inumbo-ID: 4494192c-101c-11ee-b236-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz4cVQYQsc0JrZWx6ggy6r97lwnTmTALmLfooEAfRHq6JaOTo1McIIwSpdIGn/UnC/9ncAlfu4INlwPkc5RUgnLUzjpEpyMoH0+8s42E773xT6bMkU5cSnpXrGGz+0EiD6N3ueLfceM+fcHzuV3Vh0L8+ajae1LfcJj94RdJzcb2jn5oY3bEp6EB8zK7Ld2NEBtqzKf7ok50mCM4+B3CQTsVamPkznvAJGAlXc/K91ii2rLD7mLO/W6xRtNJ3PiALRjWpQ+7AGwfKIhUfRg4Ko37rBPWohg0Ay1NlJE2pPRBkS3WR0w3wMzZCPSoFm6APi+IGQflNmPwONyIg1Ik+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e4c+oejmR7Hfh62Ug3MuVdOq7eSsu+gA6zYXnV8JJ8=;
 b=ghqiDbhd0CH/6IG+Otge7EIxhMTjCRWMXfWP3GCoKy1Y0R+G+bah5g+Cd0wHvZMmcuISTON7igVv5WR1apGynxrb/v+FMSkPEVD/9eD9YBGTWZd7fFLSpnjk7ATARbKD5hs4Ghp0fB7awSEP9WA9bCofSHacXd6/B3hG9F7f6zFGoSjxR6BI519Tc3c82MHosMMWnsbh6ctYr4FiVrcEzR5pK16vf9+ng5ACz2HMteW6Yg+vN7NMWKWABJoStUA91/9pGI74cq2DLef7Yev2zO0dbOIE8ECR5VU37Of+8b6SZ1MI3H6bChbXscKHzFv/K5ddXMDFaXxj9EFzjyZ4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e4c+oejmR7Hfh62Ug3MuVdOq7eSsu+gA6zYXnV8JJ8=;
 b=5Ejy88FDafJavK0AmbR0ur22Ni1mUJ64ROCxQEbjtBUBhFVY0WXflk5chnpikNn0t5Uw/NFKOitKOb7jLWalc22THJHvyOsH+l6KxNROsdUwgxBYdfO0jH1EX206eeIHJ1dE4FhA4brhgBCC3qHXDWNYXe2ZkaUFLv6Tq+t0xw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <ebb01efa-135d-f16d-2053-85d381ecadb3@amd.com>
Date: Wed, 21 Jun 2023 12:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/7] xen/arm64: head: Add missing isb in setup_fixmap()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-4-julien@xen.org>
 <eefec972-fbfe-5aeb-f2fa-c37d18c27e34@amd.com>
 <3fa4faa1-f8be-5b8a-f8ba-3c7cc7c80968@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3fa4faa1-f8be-5b8a-f8ba-3c7cc7c80968@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|LV3PR12MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a0c968-ffd6-45a9-c519-08db72402680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DYFbw2IIr3cOVahNiyUS3YEqnSjazRdGwMDO2TAGwBE4xWMvxIIDkzh167ikaxuXRofZ3Rn88SfuygnqDyvA8lrruUZrSOffinTgjlaftm0PikSAw5W7DJRDD18xNS1Je1p7FNtjj/Vb3jDXBslsZGAH1GZScIDPTuoY3e9KQqnwi68SRbkuNhqXQZkkRV8NRRgoBWBJLDx973EyBiG1TIentzETX3EvxgI0fJ6lbO7g6evpkQJvdVCl5wYNxIroodYG5/lEIcY6hv6SzkDeN4BTL3bWXqdWBKE1B8ErNV+nBEMJEP7vH7CP15MgFrGx5qo7TuVMCuRwUUHsltc3ebmnVaVDlb4Th4QEMet5woLHVIbBF55rTMRCuBTT7kSFMxSfvS6LMqPPl0q0Vvu+JHt/8WuV0N63gCY8ThQK67fhazZLPnQ7SK2AT5FhfGfMiQO0xU35KWGCp1zP6gsJgVC48bJefNgMKBaUZzbHrJj4HB0Syz+I5YiaifxoMejnWN10bE+lZ5TX4V0pwFVEKFxPT//qoUpwu7QWRGJv8+pDhoZ+UWmj23xf17Qky9VFI84i2oSbAk6qLKm/iK0uOSDMua2WfdBRNjwn8ea1fjMGFI8n2gHIGXiyU3ooUISTF0ygLeM3DYM5V3E4Bi1ATxVkxjNEA72brmNF24w2tc/IXKFy2Io/c/lWl9WnsxfFyfnCWQ3trwNAxJVaaueeBytOF08GtA/eBhWJsMb3/JClwZmxcoSRvLWnzuzODGbA0JUgMtQ2M49BHIGT9mD9KEC8/kkB+2SQkSwq3BJQFmmYVHcOaRQar5idIoboVkA8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(53546011)(83380400001)(426003)(336012)(26005)(2616005)(186003)(16576012)(110136005)(54906003)(478600001)(70206006)(6666004)(70586007)(316002)(31696002)(86362001)(4326008)(82740400003)(356005)(81166007)(36756003)(47076005)(36860700001)(40480700001)(5660300002)(44832011)(8676002)(41300700001)(40460700003)(8936002)(2906002)(31686004)(82310400005)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 10:13:25.1566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a0c968-ffd6-45a9-c519-08db72402680
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9216



On 21/06/2023 12:02, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 21/06/2023 10:33, Michal Orzel wrote:
>>
>>
>> On 19/06/2023 19:01, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> On older version of the Arm Arm (ARM DDI 0487E.a, B2-125) there were
>>> the following paragraph:
>>>
>>> "DMB and DSB instructions affect reads and writes to the memory system
>>> generated by Load/Store instructions and data or unified cache
>>> maintenance instructions being executed by the PE. Instruction fetches
>>> or accesses caused by a hardware translation table access are not
>>> explicit accesses."
>>>
>>> Newer revision (e.g. ARM DDI 0487J.a) doesn't have the second sentence
>>> (it might be somewhere else in the Arm Arm). But the interpretation is
>>> not much different.
>>>
>>> In setup_fixmap(), we write the fixmap area and may be used soon after,
>>> for instance, to write to the UART. IOW, there could be hardware
>>> translation table access. So we need to ensure the 'dsb' has completed
>>> before continuing. Therefore add an 'isb'.
>>>
>>> Fixes: 2b11c3646105 ("xen/arm64: head: Remove 1:1 mapping as soon as it is not used")
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> I'm happy with the whole series but I do not see a point in flooding each patch with my tag
>> since you already got two (from Henry and Luca).
> 
> Thanks. To clarify, shall I add it in each patch or only this one?
Whatever you prefer. If you care about my tag and want to have more than two, feel free to add it to
all the patches.

> 
>>
>> When it comes to essential isb() after dsb() in arm64 head.S, I can see that we are missing one in enable_mmu()
>> after TLB invalidation. On HW without FEAT_ETS the TLB is "guaranteed to be complete after the execution of
>> DSB by that PE, followed by a Context synchronization event", so I view isb as necessary there.
> 
> While there is no ISB directly after DSB NSH, there are one right after
> MSR. I don't think we need one before because nothing will use the TLBs
> between before the ISB.
> 
>          /*
>           * The state of the TLBs is unknown before turning on the MMU.
>           * Flush them to avoid stale one.
>           */
>          tlbi  alle2                  /* Flush hypervisor TLBs */
>          dsb   nsh
> 
>          /* Write Xen's PT's paddr into TTBR0_EL2 */
>          load_paddr x0, boot_pgtable
>          msr   TTBR0_EL2, x0
>          isb
> 
Although having isb after dsb would be clearer to the user and consistent with other TBL invalidations,
the one after msr can do the job for now, I agree.

~Michal

