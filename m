Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A5D66DA53
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479284.743041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHicO-0000Oa-T4; Tue, 17 Jan 2023 09:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479284.743041; Tue, 17 Jan 2023 09:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHicO-0000Me-QB; Tue, 17 Jan 2023 09:51:00 +0000
Received: by outflank-mailman (input) for mailman id 479284;
 Tue, 17 Jan 2023 09:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwid=5O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHicN-0008Fj-5u
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:50:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 707956f5-964c-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 10:50:57 +0100 (CET)
Received: from BN0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:408:e8::18)
 by CH3PR12MB8583.namprd12.prod.outlook.com (2603:10b6:610:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 09:50:55 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::b6) by BN0PR04CA0043.outlook.office365.com
 (2603:10b6:408:e8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 09:50:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 09:50:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 03:50:54 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 17 Jan 2023 03:50:53 -0600
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
X-Inumbo-ID: 707956f5-964c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYDd5v9JMrnN2CtU7SlCk8x3fWdiQ5BpV23ZWkUj1Jzq5094W2KSdEPiRrHsfiMXj6J6SgpsT4/GivP/6uuDGOWDNrFoGR6txYdPFQZRQeHLtycfcTZajsspBpJkR9lVsCOZwHB2bJ4F5kgQM4MYALQhCEunPWc+61S6tPQrCtSjbmVq9vm/lC7sxuskXSf37nFb+tQDSCWeAzo88eqHlqMwdXzFafMwLc2KPl5kCMzNEaMlHpJLP/8GFVPS054gt1DyVMvN5vgGpMe+8hJSa4OeODUGtSMp3cRZnsNhvh+eh9UeKoNfrM9/9tYIVr41HwyxWkm9qehqvtFTre0mMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9wkKzoKSt9RjFkmTx9EneVW25YHZ5K/J3+amcAa1ps=;
 b=FVe50hSLEysUI/wK4qLhXUb2S7/QFJeBJ6EIzKM1THRCo1gspZPMbmBNzseL5Sj9glJ3NSZVr4R9ZhOfVbbz0vcs2tGqL+YqzgGUeB0zNW2GXLfeTUnBRSxBc4+dn0DJmj1igHyN9ZsH4fSRJwBsmywYs85tKQpy5jLV4BKaiyxN+M89E75hBEagck7sTAiq9jhQJEHG04oMLaxD3Lgqo8MIQobCY4I+C+tWqn8T44ndYhCeZzF2zsuy3hdDQvqcMMY0kWyKXpXlZDbbxhhcl8cSzJIrca/1etsGkJSbBeEIfOQeEZ/St9iEpQAAIMUlX50eZLtURLMPFj7RmwTAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9wkKzoKSt9RjFkmTx9EneVW25YHZ5K/J3+amcAa1ps=;
 b=Q0cG0TuZgcS6+fhA0GJZrhp/fgHQGQZ+KmOV0XXmbIwY0dp9aa1MrfxO0Lwi03yW1WhezCEFMXpSmXFWXsK8jPkcPO6IHeN5t3mybwy/D2NvPbIn1+Mh0lWjq04qQzogg7l2TS/m3JVLCP2OqpS7Qka0NvJAhZ2neWPjzbW237w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <96964034-53b0-c391-6be1-fa5fff6842e1@amd.com>
Date: Tue, 17 Jan 2023 10:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <20230116144106.12544-2-michal.orzel@amd.com>
 <72fd8c47-d654-91d0-993c-97f2d0542cff@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <72fd8c47-d654-91d0-993c-97f2d0542cff@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT041:EE_|CH3PR12MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: be7b2785-2f7d-4d53-f8d5-08daf870535f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4b7PbK/fFqFHSOieb63W0FloZDNbjnCEp+d9PNa9XZxsXzMgxe5fT4VozprcW4V4dq53HjDawk1uKrMfDYSnricOfMiVGCPUgGjOn1LH3Km0e2wmpw6udwP56DhoIrUuqAC/mm3JeIgh8DZX/qwwVnimb2KpKRPZnIs2CJu5shREkCcvQ7oKnrSAgHWKaDEkW+KoxLVdyALoo8nqExteyFcUP+UrxmI3/9hrud0zdUXKdMnmRNutrlCzKCzVQ6fduRSydg1oC/J28M+WbginLetVmHhu5M1ddnlvEYSYDIMM9jt/YGUnufwWWDwtmiNIG6Pb4m/6Bezk0BdnWgyJUa8Lvnux+Aad7q2k/K3wXw1Ck05NMkmCslAh9ettLT5BR/skTw3vVJYOSmiLV3zysnwdlrTd2QRnLfSbjDTvL0dB0OeiqTs3RKmMeAHx/jh29b85SFF3Yaa+l8NnPqqEIJGC9zrGYxFumEdsQ146xQBQMgkXGCVBApsum/qkpnMbZbgDLOCVMSTiApr8trswEnj+zLLAx0Z953EYw7NRAlrgiNwDtmC0xMQZ8C8BALMOKAIwDD7oe1vQy8Suy27pCjWLlZwJK+3wt36ElGooEXpNaF4OQNSR4WoFreO7zVvKQgbsXRMtf+fHTi+96Q30NmrOe+gj4eOdmTxwYunhoQvRj3HIw+nCzVFEuTZo36jeUy51y9OmRfT+b5QiG9jUJ2nGYUVsQJBpsq+o6p0zkxZk/38bJ55H+gGCvu9dbHl7797n20X4mxkCx0SxpVA2eQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(40480700001)(31696002)(478600001)(40460700003)(110136005)(54906003)(26005)(44832011)(41300700001)(2906002)(53546011)(316002)(5660300002)(4326008)(16576012)(70586007)(70206006)(8936002)(8676002)(2616005)(36860700001)(186003)(356005)(86362001)(82740400003)(47076005)(426003)(336012)(81166007)(83380400001)(82310400005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:50:54.4701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be7b2785-2f7d-4d53-f8d5-08daf870535f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8583

Hi Julien,

On 17/01/2023 10:35, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> It is not clear to me why this was sent In-reply-to the other patch. If
> they are meant to form a series, then this should have a cover letter +
> each patch should be numbered.
> 
> If they are truly separate, then please don't thread them.
They were meant to be separated. I will form a series for v2 to make the commiting easier.

> 
> On 16/01/2023 14:41, Michal Orzel wrote:
>> The direct mapped area occupies L0 slots from 256 to 265 (i.e. 10 slots),
> 
> I would write "265 included"  or similar so it shows why this is a problem.
Ok.

> 
>> resulting in 5TB (512GB * 10) of virtual address space. However, due to
>> incorrect slot subtraction (we take 9 slots into account) we set
>> DIRECTMAP_SIZE to 4.5TB instead. Fix it.
> 
> I would clarify that we only support up to 2TB. So this is a latent
> issue. This would make clear that...
Ok.

> 
>>
>> Fixes: 5263507b1b4a ("xen: arm: Use a direct mapping of RAM on arm64")
> 
> ... while this is fixing a bug, it is not going to be a candidate for
> backport.
> 
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/include/asm/config.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index 0fefed1b8aa9..16213c8b677f 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -157,7 +157,7 @@
>>   #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>>
>>   #define DIRECTMAP_VIRT_START   SLOT0(256)
>> -#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
>> +#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
>>   #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
>>
>>   #define XENHEAP_VIRT_START     directmap_virt_start
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

