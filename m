Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BFF5A5FCA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 11:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394924.634519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSxrc-0007mA-I4; Tue, 30 Aug 2022 09:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394924.634519; Tue, 30 Aug 2022 09:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSxrc-0007jL-FG; Tue, 30 Aug 2022 09:48:56 +0000
Received: by outflank-mailman (input) for mailman id 394924;
 Tue, 30 Aug 2022 09:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSYc=ZC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oSxra-0007jF-M8
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 09:48:54 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2064.outbound.protection.outlook.com [40.107.212.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4353f38-2848-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 11:48:52 +0200 (CEST)
Received: from DS7P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::11) by
 CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.21; Tue, 30 Aug 2022 09:48:48 +0000
Received: from DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::35) by DS7P222CA0009.outlook.office365.com
 (2603:10b6:8:2e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 09:48:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT102.mail.protection.outlook.com (10.13.173.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 09:48:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 04:48:47 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 30 Aug 2022 04:48:46 -0500
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
X-Inumbo-ID: f4353f38-2848-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6rZDBkpec6AanfOVIRGe8FMLGh0iBSRPUSNpMgc/iNkbNrvISHRStv64GW5HF/o8JW4dVnyiM7UYEJhdGqGt157D5Yf/uv/eHKT5OnMp7c//mNAj4oC1xW4zf2Z3ylF5N2NRwmout6loSSJy8jFydKqwFqr6GPlA6pc3/pG2adZ4Cohbn4Zu1NnewFYNyP/sr8I1KguHMExD+dFp9896F1AydjH1ysxSrk7mCaNQsccVoWB+gGiR9z4ZcXES4EgauFsY7FCARDkwn06zcwfCEdElwR+hHIQheeVmJZpSbdwg3qA2+F1sVWLAXEHunlGtFmioNYWOlnXNQKsz/NIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofcfttb8+Pa2a7ub3k0u3yB3GduxZw7r79l28QaPOsw=;
 b=W6jQ6y52WFwUuBeX+SMZ0ZbWtFRIsiStAQ0S8jFooZHIGqlWoyuxuf7IeXjI4VtIW88BUaLjGc0p34BN21+qSnSOrlVuapZqBZkdQB5GCKijlbbYcfeIOYG86LiLfoItzU2NhgUoBy7u4vGZkZIt2DUHzvaEgY/zWSj7ZFBy1Wp8jq/OwggpunVfGyn48m4zVWGbvlDx+n0GrSeh8umsugtq6L2gJ1OrLI5R2Wd0etPBOzGNW17a/r0xhQ6nV3r5Kpu5Wl9BtARRwtZYbMuHxCDzR3zL035jqsnYeYfOHxxy66mUzwYb8eYn+XNCw7BFfo0ntXqaExy2Wun8riVumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofcfttb8+Pa2a7ub3k0u3yB3GduxZw7r79l28QaPOsw=;
 b=M+NogL14d6TwswUvKr6ke1bP0daVaT8sar9sH6Flx8zy5tDRILceNrnQPFcfgcWqTfvMOKrw4fVbJwYnND03pETuC/spe0lNw/d5pmlYNDLJAEQIALUERI2wNS7qGNm8lEY4ZCdjOpjGkQ1/L9KepVTn/5Gsfe6Ne4Ex37hGPIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c749e3aa-39a2-a4a8-9a21-77a65881dca5@amd.com>
Date: Tue, 30 Aug 2022 11:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <536cad9e-53b5-2eae-0cd4-06f899229470@amd.com>
 <AS8PR08MB7991C3859BA3BAF913D50E1C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <AS8PR08MB7991C3859BA3BAF913D50E1C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cf1c219-ba65-4240-1361-08da8a6cd636
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Amw3nDrGixlcB4MHf4L7DqHBAe0s9TFkVudHVhf9y9OXAkOs5TbAJay6SODv82NaJ0B+k7sLjrybdyw0VS1FgKCB5Th6nWjztHkzEDJJlghW8QMuYAD+qyebCPjx7NilQvZ4vda3gkozLVsSbkgAuKxpekSvJSSGW4N74EI8dOlYroqEH/i9z/iHSUc5VfGAu3OwvGaHUhrg1BQUHgL8ul60X3Ap2z5cbnF38hFndvRruIQ448Ua4EK8QcGzOT4S3UvLWPZKdQ6jYUdFgYoX4cKn9I0XoyZ/Hk2QishSAVZrF8i+UiO9Zh4O00cTD9bHgHXb7V3bcfU/j7c9zoTrBbVGjRv2S3NmHF774AHJO0A+TVdvykHS626znBANePPCIPYSoKfk4s9NJ1JM1uql9YheD4lb4ZZj5fU1P5fk3mUzQDM/1SDCiq8VDN7pk01TazusUMR3LunBqMoDpXdJjzQnk+99AvaCIGPjFuCdM5dO2zLhP8v0SS1VBTWiwrfv3wVNY6tdBX1vGC/lPoEYzz1YB9tWaVKMSgVvF2svAmt8VkQlzl0FsTmErLvtls8+fxfz2VtzLhNR4gMFd+b/AxvNCdrgcVt6DDkAyZasCQHRif1o1AbzDuldNJYTaow4iYhvN16m9Ei2vuEFOhr6lbkrYmxIee2rd71FADYbx/bsdMS2X0aPxOIBjNSfvyUQnNASVJ5ynwfGp6qxzrEv8A3DtWE9a3ZjgogS22G1KWtmkHjYsiK92akv9BN2PZWQbeOsLWnt+edrsymjYjOhvbN1qJJrn4jQDyROcGNTxp9HCI6zDuugDgbs/9HkfZzUV+KsXwmNjkpx5tyupDOz4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(40470700004)(36840700001)(46966006)(316002)(47076005)(83380400001)(36756003)(31686004)(2616005)(16576012)(426003)(2906002)(44832011)(26005)(336012)(186003)(53546011)(82740400003)(31696002)(86362001)(356005)(40460700003)(40480700001)(82310400005)(36860700001)(110136005)(5660300002)(54906003)(478600001)(81166007)(70206006)(41300700001)(8936002)(4326008)(70586007)(8676002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 09:48:48.0378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf1c219-ba65-4240-1361-08da8a6cd636
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT102.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405



On 30/08/2022 11:17, Henry Wang wrote:
> 
> Hi Michal,
> 
>> -----Original Message-----
>> From: Michal Orzel <michal.orzel@amd.com>
>>>> This is totally fine. What I mean is that the check you introduced does not
>>>> correspond
>>>> to the panic message below. In case of reserved heap, its size is selected
>> by
>>>> the user.
>>>> "Not enough space for xenheap" means that there is not enough space to
>> be
>>>> reserved for heap,
>>>> meaning its size is too large. But your check is about size being too small.
>>>
>>> Actually my understanding of "Not enough space for xenheap" is xenheap
>>> is too large so we need to reserve more space, which is slightly different
>> than
>>> your opinion. But I am not the native speaker so it is highly likely that I am
>>> making mistakes...
>> My understanding is exactly the same as yours :),
>> meaning heap is too large.
> 
> Oh I think get your point. Let me try to explain myself and thanks for your
> patience :))
> 
> The reserved heap region defined in the device tree should be used for both
> Xenheap and domain heap, so if we reserved a too small region (<32M),
> an error should pop because the reserved region is not enough for xenheap,
> and user should reserve more.
> [...]
> 
>> But your check is against heap being to small (less than 32M).
>> So basically if the following check fails:
>> "( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )"
>> it means that the heap region defined by a user is too small (not too large),
>> because according to requirements it should be at least 32M.
> 
> [...]
> So in that case, printing "Not enough space for xenheap" means the reserved
> region cannot satisfy the minimal requirement of the space of xenheap (at least
> 32M), and this is in consistent with the check.

Ok, it clearly depends on the way someone understands this sentence.
Currently this panic can be triggered if the heap size is too large and
should be read as "heap is too large to fit in because there is not enough space
within RAM considering modules (e - s < size)". Usually (and also in this case)
space refers to a region to contain another one.

You are reusing the same message for different meaning, that is "user defined too
small heap and this space (read as size) is not enough".

Let's leave it to someone else to decide.

~Michal

