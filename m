Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9765E7027DB
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534665.831909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUBs-0005Ev-66; Mon, 15 May 2023 09:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534665.831909; Mon, 15 May 2023 09:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUBs-0005Ba-2o; Mon, 15 May 2023 09:08:24 +0000
Received: by outflank-mailman (input) for mailman id 534665;
 Mon, 15 May 2023 09:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HQr=BE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pyUBq-0005BS-11
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:08:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07f0a910-f300-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 11:08:19 +0200 (CEST)
Received: from MW4PR03CA0005.namprd03.prod.outlook.com (2603:10b6:303:8f::10)
 by SA3PR12MB7880.namprd12.prod.outlook.com (2603:10b6:806:305::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:08:15 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::45) by MW4PR03CA0005.outlook.office365.com
 (2603:10b6:303:8f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 09:08:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 09:08:14 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 04:08:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 02:08:04 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 May 2023 04:08:03 -0500
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
X-Inumbo-ID: 07f0a910-f300-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp/e548xlBT+5bSDuFztte5ggyVz0wtyY9K3jPWRABLRCxSQxd6J5cay0mynCOoovYdZ1Ysq73j1Jh+IPgNXwDP7jw0WE2utMVfyGHauJ6dL1zcHKmbZa9WoOO6dc+iaqqlv5geizKPWOeKvlLIZ3JAOfcf2NhesTPuUOW90T08ywCQtGkt4R++vI2eFTAfKvecDwBlZ59g/3erkGmO14Zkp+Yth+QdO80nGkn1m05HFljArbtBTW3R91/RquIpezF6nlYfBYzrwLqvKcXcALjjCddmaXtsyG3p+J3e9m4gmYXbLBBTZRg+5ydPgnZkRkWpctv6RDzyHjZxzq6j+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UorGeRH2bJa9iLxYbSglBx9o6FQ1tj07XmvbncA39LA=;
 b=N58enbIV0RWIIjsUu3aMPEDUPOhzz3FcSNG6wJrORzFAl3nHt9r39VV4fe4Vork8IqalUp8Pk3DRM9kC0FMaHNKOh9gdaDn5YL3xi19HR+kX7qnTiZxHQTIcHDiTTvUZX6zROLOR3U1tFcHo5HWqXTat4GKoA+WBx34pV/pWtsApJ4ESIlrRosNsKT0AjW5W0Yg375lhQ+Ba8RxEjh2gQWQqmKqfLFtkeMJ0AHuL6ZuB7GxH24cxebURikcdsUuFeGSQ3uKzd53r9fMuB/FvcppJrzttmb1v0TB/5JbbWIbskYxFTjOI4zeGNOdMV6L1XKt2bdDcSJhRR9yDccggIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UorGeRH2bJa9iLxYbSglBx9o6FQ1tj07XmvbncA39LA=;
 b=WG/HhAjHsKE4RtAIDRZOr9UkXonhe6LK/E0qwxWAMqnpygBwYvwbNCBgzQNAxLwvHsfIQzqToiueOa7lxqf/s2Qu1xhrrOinRQvvU/1bLa8MhtXfZc63uxCOazXrxY9KgZsfxY3DTMqSNoGvX1TY+Ckml+eayQRG1cyalSR6S/s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <da9415ad-95cb-21bb-28ee-a007763a1e54@amd.com>
Date: Mon, 15 May 2023 11:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
 <dff8ab04-ae35-3a71-b923-abe722dcdb1c@xen.org>
 <f043c234-eb51-126f-1a1f-610796c203e8@amd.com>
 <bfc634ce-43f9-2617-eee7-6ce8ab15b6b1@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <bfc634ce-43f9-2617-eee7-6ce8ab15b6b1@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT023:EE_|SA3PR12MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d408fb-ca2b-42ce-3bf7-08db5523ea52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/59y9q1I4y8+BsX3Ng0RV6iARPsEF445VtV8x41NcRuR/DJ6AthGWxqYMC+uUiPmTZGFrjg7LCll25RSMVoSas9T1IihTx1vBZgunp/MYoih9gOwfghXjfn8IZdc3Uwm8be++XcT66aKwDfgICCEiwhRc3QgoqEd58nSpJTxupgibv/vszXeF7BcUbDO+gIsxUJyI8a6yuFfL5OoZQHN2dkvoy8EGheFN2kfOLYAyBC5Aqqkdl30LsIOv6Jf5IBd86ugtPL0dSCphxnYMxsAHa5wcfMJjaGqSGY9GDG3WRdvs2KqtFk+G3N2EVPI+pY4LJ1BMAbbKzBKGPwL8ayTdxqHRY7S/98gE3Y76a7ueyRG117D0t/kdFUDVit498gKmu4EnPVPunkzZwmMdrHYiMfhq76GEPfavrQ6DEvFMeK25VJ1NmAadpVHM5dYzHdKUwbkTV4I+OigBDiBH8jmmzVgugab+K07ujSm8zhz039PpDK5oYPvDUXdV7LHIcx7hzCBz3OsaqoAX1ZUlx5+TsmKMeQZY0TZXv6//E99scOR0hPn4koFXvYdWAz45OAkPwCuBKqEG+iu+u/GY6zAw3GFmaqBrcxBk1EQOqxAgCVGppaNByrX16qrSkr2p8mffX4TAyQmye7zMwaqZkQ0QOpm1zw8KoZpPn302qM5xCmdrxfprfvr9Nt0LmdRHgA6fSC6G5QRd/SZCwdE4JTiiLZvQ6BvsbFiO4MWqXPXSnOAdb2g57pHZC/UkA20rSFFmO/vN0Dtl+AxISECfedmrF4yB0jF0gmunMMmm0upYw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(31686004)(478600001)(31696002)(110136005)(70586007)(70206006)(6666004)(36756003)(40460700003)(16576012)(54906003)(316002)(4326008)(86362001)(82310400005)(426003)(36860700001)(186003)(336012)(47076005)(2616005)(356005)(81166007)(82740400003)(41300700001)(8676002)(8936002)(44832011)(2906002)(5660300002)(26005)(53546011)(40480700001)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 09:08:14.4812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d408fb-ca2b-42ce-3bf7-08db5523ea52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7880



On 15/05/2023 11:06, Julien Grall wrote:
> 
> 
> On 15/05/2023 10:03, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>
>> On 15/05/2023 10:56, Julien Grall wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 12/05/2023 15:35, Michal Orzel wrote:
>>>> At the moment, even in case of a SMMU being I/O coherent, we clean the
>>>> updated PT as a result of not advertising the coherency feature. SMMUv3
>>>> coherency feature means that page table walks, accesses to memory
>>>> structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).
>>>>
>>>> Follow the same steps that were done for SMMU v1,v2 driver by the commit:
>>>> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
>>>>
>>>> The same restrictions apply, meaning that in order to advertise coherent
>>>> table walk platform feature, all the SMMU devices need to report coherency
>>>> feature. This is because the page tables (we are sharing them with CPU)
>>>> are populated before any device assignment and in case of a device being
>>>> behind non-coherent SMMU, we would have to scan the tables and clean
>>>> the cache.
>>>>
>>>> It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
>>>> requires that all SMMUv3 devices support I/O coherency.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> There are very few platforms out there with SMMUv3 but I have never seen
>>>> a SMMUv3 that is not I/O coherent.
>>>> ---
>>>>    xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
>>>>    1 file changed, 23 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>>>> index bf053cdb6d5c..2adaad0fa038 100644
>>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>>> @@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_match[] = {
>>>>    };
>>>>
>>>>    /* Start of Xen specific code. */
>>>> +
>>>> +/*
>>>> + * Platform features. It indicates the list of features supported by all
>>>> + * SMMUs. Actually we only care about coherent table walk, which in case of
>>>> + * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 0070 E.A,
>>>> + * section 3.15 and SMMU_IDR0.COHACC bit description).
>>>> + */
>>>> +static uint32_t platform_features = ARM_SMMU_FEAT_COHERENCY;
>>>
>>> AFAICT, this variable is not meant to change after boot. So please add
>>> the attribute __ro_after_init.
>> Yes, that makes total sense. After probing this variable is not meant to be modified.
>> Is it something that can be done on commit or would you want me to respin this patch?
> 
> I can do it on commit. With that:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
Thanks,
Bare in mind that Rahul responded in HTML so there will be a <mailto when using b4.

~Michal

