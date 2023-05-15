Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A747027C7
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534655.831889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU7l-0003fc-AN; Mon, 15 May 2023 09:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534655.831889; Mon, 15 May 2023 09:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU7l-0003cK-5U; Mon, 15 May 2023 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 534655;
 Mon, 15 May 2023 09:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HQr=BE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pyU7j-0003NQ-Ks
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:04:07 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e88::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72012d6a-f2ff-11ed-b229-6b7b168915f2;
 Mon, 15 May 2023 11:04:06 +0200 (CEST)
Received: from MW4PR03CA0059.namprd03.prod.outlook.com (2603:10b6:303:8e::34)
 by BY5PR12MB4145.namprd12.prod.outlook.com (2603:10b6:a03:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:04:02 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::1) by MW4PR03CA0059.outlook.office365.com
 (2603:10b6:303:8e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 09:04:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 09:04:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 04:04:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 04:03:55 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 May 2023 04:03:54 -0500
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
X-Inumbo-ID: 72012d6a-f2ff-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrJ3ABh11Ck7Go+V5QE7ddgXTWMaOnjuPb6+4fJUee9HOqvwR2sQuRl3bpbxDB7y3R+UA2ngElscEdyWPblyZaG8VLt+tzkoCOWxVyGU8zG+Cj4bg8QOoJsSIVUnRtKbgx6cvlxDRCrOBaSA/wA1w3KnaWyxxKla/tBKkSIv12JJObBdTy0lmbpDWveDXFFEhT8lhzOYdrWX0Dd0UFcV+ygoTZoZSZXujGB2VBzAOPSPOMs4psP2bOvXUVKy/QZSaWs4SmurXugN12mnTN3EKGMSPaAgTcyxwCC7LWMrNKe3iSwX8FchSEDlHyiX/Qlydx8PT3Aqf7o8V7SpKUYPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLhLZil+UL8YExw8j+P15PD3sT2ZL5XX8PAe9m63T5Q=;
 b=nkxEmD1E0xaD4NgocxH0e6hQW5/q2M2yoEbsJvyXVkRD4ZIr+vtze0zhtYT3YsE2GP37v15aYTXolKNf47Ie7oYkPlXF2W89Ddz5NKdZFrSWmwiquDcAkCR+7TkbhSJw2qm0Z0Ludhw8KM5TsucUgVdDph3MN/6Bz6d5EAXSWfdoPP4UX1EOt1QrEF7IHnsSGeVeUJNiCzpgFxIKkXnyBJB92ZFAtCXwGqxoa3aPaB4FBkQZMw8QzCIFraRZz64HdungIv6Rr8gYtBFPOcrATcyDGUkau7ydiVUJALK9dStc9KoS6okIYRtPc6H7/bRHN08yc879/GnvIyG/csRHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLhLZil+UL8YExw8j+P15PD3sT2ZL5XX8PAe9m63T5Q=;
 b=VOtsnVysXalojZH6jIve1BI/FaS0me8zD6UFFv0voLvEpe8ol0o5JXoctEgBgTS0j1mC9KiMb9BffywLHr8Bnssi122eVLdmpFcQsbNIncWDhqG0gYUt9kD1IrTut1e+udd1PMiZ6mDO3PLRXbLr0LatVfPO7pvWEcb1y433vcc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <f043c234-eb51-126f-1a1f-610796c203e8@amd.com>
Date: Mon, 15 May 2023 11:03:53 +0200
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
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <dff8ab04-ae35-3a71-b923-abe722dcdb1c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT039:EE_|BY5PR12MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa2ebb0-9984-4e07-5915-08db552353ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WFW9bbg5ZjzbTt9EBv3Uas+PQytGd3COBjWijv/3JMa8bI7B8nIf47AhgLHW95L+1skrSTysSx+v1c0mE/hQWGStoscrxRoyHr6L4iPMrZ2zYLHyQCJ4W00tCEnhrOygdQbaB9WveI9oc7NRGhyIKJtAo2G7i97O8sz/CtSw1f9xVU2NAhYGRF8dLln4D3tQT5heM7aXMeAfIHxWnOoeineDINHY54Pg3nEBFgg/5uYPHYl/a/oW1XW8hR4gr1G4bUOUmyr0HozRnSstdj0BBDwhPgXUi0LeKUwHPgxKTvy/lgnzZxgSS3mJjq9WZZJeMIzchrLbqtna8PCpuoYcrdqkbgbx3Nt7j9g+MWhi+AuuJPoIy8PcRGEBIW/PFyilFzy90P9vbEXUjedYdm46+xuvb5VHh6PTpjmPiNi6APu0jrftpGcMrh+G51997b2z+3uiRS6fu0DVXifYgD1HicsS6Q1a9irH1Y46EOGp8+/KmDrwbu1ccGxw7O63xRCuxAzto6ImfzQrwqnbFKI7IyX/cCxy+s+Q2NUO7v0n5jYNbYW6+TdLPTNtEZiqURhIFTsIA39PBTlzB0jcO3GaO7ki7YEkJqyiG7yKzuxAN5TiGVJke5WfAc4mUjA8Oak9AKXEXpZVEaSp8aKEM3X2M9vx9JnaaFV9Ufpfi4yJvsd4tlMKitc/3wese1BiCTvSW2wcsof7tZ/3b9Vif+fLTQRxoFrRdS0uuBncxVPremepj3Nlv1NLPAUKHo4sLOArmQklUSbcSp3f3vMDXOMuDacs7F4H+yE9ZVF4QA/hECU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39850400004)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(36756003)(86362001)(110136005)(54906003)(16576012)(316002)(4326008)(70206006)(70586007)(478600001)(82310400005)(40480700001)(8936002)(8676002)(5660300002)(2906002)(44832011)(31696002)(81166007)(356005)(82740400003)(41300700001)(2616005)(26005)(186003)(53546011)(336012)(36860700001)(426003)(83380400001)(47076005)(31686004)(40460700003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 09:04:02.1749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa2ebb0-9984-4e07-5915-08db552353ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4145

Hi Julien,

On 15/05/2023 10:56, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 12/05/2023 15:35, Michal Orzel wrote:
>> At the moment, even in case of a SMMU being I/O coherent, we clean the
>> updated PT as a result of not advertising the coherency feature. SMMUv3
>> coherency feature means that page table walks, accesses to memory
>> structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).
>>
>> Follow the same steps that were done for SMMU v1,v2 driver by the commit:
>> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
>>
>> The same restrictions apply, meaning that in order to advertise coherent
>> table walk platform feature, all the SMMU devices need to report coherency
>> feature. This is because the page tables (we are sharing them with CPU)
>> are populated before any device assignment and in case of a device being
>> behind non-coherent SMMU, we would have to scan the tables and clean
>> the cache.
>>
>> It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
>> requires that all SMMUv3 devices support I/O coherency.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> There are very few platforms out there with SMMUv3 but I have never seen
>> a SMMUv3 that is not I/O coherent.
>> ---
>>   xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index bf053cdb6d5c..2adaad0fa038 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_match[] = {
>>   };
>>
>>   /* Start of Xen specific code. */
>> +
>> +/*
>> + * Platform features. It indicates the list of features supported by all
>> + * SMMUs. Actually we only care about coherent table walk, which in case of
>> + * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 0070 E.A,
>> + * section 3.15 and SMMU_IDR0.COHACC bit description).
>> + */
>> +static uint32_t platform_features = ARM_SMMU_FEAT_COHERENCY;
> 
> AFAICT, this variable is not meant to change after boot. So please add
> the attribute __ro_after_init.
Yes, that makes total sense. After probing this variable is not meant to be modified.
Is it something that can be done on commit or would you want me to respin this patch?

~Michal

