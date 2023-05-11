Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAC96FF143
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533351.829933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5AZ-0004wT-Aq; Thu, 11 May 2023 12:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533351.829933; Thu, 11 May 2023 12:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5AZ-0004uN-82; Thu, 11 May 2023 12:13:15 +0000
Received: by outflank-mailman (input) for mailman id 533351;
 Thu, 11 May 2023 12:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/UO=BA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1px5AY-0004u9-07
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:13:14 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e88::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328451b1-eff5-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 14:13:12 +0200 (CEST)
Received: from MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::30)
 by SN7PR12MB7227.namprd12.prod.outlook.com (2603:10b6:806:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 12:12:56 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::6d) by MW4P221CA0025.outlook.office365.com
 (2603:10b6:303:8b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21 via Frontend
 Transport; Thu, 11 May 2023 12:12:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 12:12:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 07:12:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 07:12:55 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 07:12:54 -0500
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
X-Inumbo-ID: 328451b1-eff5-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfRj3jvK8jfiKVw+rp9F0v6zMmirsDRwJh9HkcL0LFAilKKZVXYDEq+lx9VQkskatQEs7cDLfYRfAYmoy9l5M/CSiym1L+5F+h635OzkH0nBPxI11SdInPi1w94VSRwn577ki3Gt5B/pAV+fc+m2bIFMAzqN9DRQt/id4aXT2i6mk8OCfK1PRkuA+DRiA/fm2haCRLfL2U+bWuAfM8P12L2sukfVZRruVr4+wu5cZR6XxBFqwnbBhr1dE4u0NF4U9K6kXQpETXT1RiUBtr5gyFh0FrsaGlAMo37isLAAm4mJKi1SLsd/ncwufFJAMaqEeXSqred6GZQfgpjFClqs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQ1q4ALsP4QhZ4g2KjzF7NfmUjBeIDLYWFcMqLRaQWs=;
 b=Ez6+cr6Bcy2lpwwNfHpB79RWnaov+lzbKVa9uKSyg/i4Sq9RMFGmL1r8gac+KDBlrUd5+e3I4v3mrE6uathq8U07VbcwsZ5ScwV+FiA0Hj2IhP5nLiFev1ES7aISIqB8qrTnaP1gHZOZLbf7/IqTioun3h558xC+VAN1hYpWCbyGKzXfEuLzKDo126xpjT/2v/FzYus8PPGYmpn8KhoFbf6wyIucqNpXWu1+aFhbxh2Ctg1Pk9qt/gkO5YItXRpRy2NpryO5mbWUemWyhssUzUJcWvuoIp80sHOuz/5nKeElj9DxZ12besdABpqzpIADSnrv55G19ILitOWFC70Cag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQ1q4ALsP4QhZ4g2KjzF7NfmUjBeIDLYWFcMqLRaQWs=;
 b=TcIH6z7LLpF09/Vdj6x8pvvESfxGGrEPZNoBXsNqpp89iWKmSb9d3ubdSNofCLnTU4N8/Zq7XjevNeud0B/RWllIN6yVTXOxoRVdbHrAEeamdbKzjlcnN2wDfHQgCcG8faAJBBPZ0HD2S+dMr5e7hbSQdTp4aVch3LEp98zjoWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1d9f1c3a-bd26-f44f-73d7-22492f40f7f0@amd.com>
Date: Thu, 11 May 2023 14:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] xen/arm: domain_build: Propagate return code of
 map_irq_to_domain()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230511112531.705-1-michal.orzel@amd.com>
 <09f4eef3-df60-ee90-bc5b-7e61ef9788a0@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <09f4eef3-df60-ee90-bc5b-7e61ef9788a0@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT034:EE_|SN7PR12MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: 966cf49f-d9ee-4ce5-9a31-08db52190e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OA9iat3d/p3htb1FUqpTyCKD98LOfn+58w9OOXHNFmXyZXijiSnCmslO75YTiHohZBBxDA4ZSFLOthrZXpqrT7tFoiFtJfSgkebxqNX9VLNMfQjUqRSRRA3leqL3xifqbS6RkKNqdEmddSa9EfK3XmmdT89PgPGr19EsTf1f2q/dLe8jrSBrmE2juuQ2NPtZRXnMR/TNUseBNB2vfrndMMNXkVGybKHdNhN9lEdeJlfddHjokJ064opu6VSCkiC0mbEFrkISpkDgMRDTooSkoVS/dMgndmtGTK3olnnRU8zzLxvr0EFOXaPBbUfVNgKFzeTdQadDZKPjh/+iHHRFuR9uvUkJbarj6WPVT13kCjZfMnXCEixtPraTzNfxkLHqGZDYeIgMfpXxSoJ5do/hmOAAh+fJ1af3Ww2b0Xnp3zsLTEZ95T7nTWwGxi/wYTdju5hENlUGA/24SWAnSK1JGNDKyRjxtk1R7zRf2RKLNgPIf5KV2S9F23YHlAKt27JAlnw/BKNMSl9XXNjJJVKTP7q4YeLK5mUBJ5ufiblxN/iD1cseEuiReNKIhAiQk/kI+zLO0FLH8z932kSXV91zYQY+EvY+iIPmGalcfrGxjL/SgtrsMo667tIbckNa+Q1BMlnC5w+ukZvid6ePs1WI5vdrwFPxngMemuqQM/DXW8uc+W84ew1i8Qvrw3tJ+kYyup3P27w08ZYZ7AAB2Bs6XNvbtcGp9pkZGd8RRVfr19HOSUnh/1gyeL2pcjuKYOgyXRqRC6vgewH9E1jRhCJtkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(26005)(53546011)(36860700001)(186003)(40480700001)(2616005)(426003)(47076005)(336012)(4326008)(70586007)(41300700001)(70206006)(316002)(8936002)(8676002)(36756003)(110136005)(54906003)(82310400005)(478600001)(86362001)(31686004)(31696002)(16576012)(40460700003)(83380400001)(5660300002)(44832011)(356005)(81166007)(82740400003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:12:56.4508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 966cf49f-d9ee-4ce5-9a31-08db52190e09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7227

Hi Julien,

On 11/05/2023 13:55, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 11/05/2023 12:25, Michal Orzel wrote:
>>  From map_dt_irq_to_domain() we are assigning a return code of
>> map_irq_to_domain() to a variable without checking it for an error.
>> Fix it by propagating the return code directly since this is the last
>> call.
>>
>> Take the opportunity to use the correct printk() format specifiers,
>> since both irq and domain id are of unsigned types.
> 
> I would rather prefer if this is split in a separate patch because while
> we want to backport the first part, I don't think the latter wants to be.
Sure. I will then fix specifiers in both map_dt_irq_to_domain and map_irq_to_domain.

> 
>>
>> Fixes: 467e5cbb2ffc ("xen: arm: consolidate mmio and irq mapping to dom0")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/domain_build.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index f80fdd1af206..2c14718bff87 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -2303,7 +2303,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>>
>>       if ( irq < NR_LOCAL_IRQS )
>>       {
>> -        printk(XENLOG_ERR "%s: IRQ%"PRId32" is not a SPI\n",
>> +        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n",
>>                  dt_node_name(dev), irq);
>>           return -EINVAL;
>>       }
>> @@ -2313,14 +2313,14 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>>       if ( res )
>>       {
>>           printk(XENLOG_ERR
>> -               "%s: Unable to setup IRQ%"PRId32" to dom%d\n",
>> +               "%s: Unable to setup IRQ%u to dom%u\n",
>>                  dt_node_name(dev), irq, d->domain_id);
> 
> Please switch %pd when printing the domain.
ok

~Michal

