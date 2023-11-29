Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6547FDE8F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 18:42:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644140.1004765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OZL-0000uh-NT; Wed, 29 Nov 2023 17:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644140.1004765; Wed, 29 Nov 2023 17:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OZL-0000rv-KE; Wed, 29 Nov 2023 17:41:51 +0000
Received: by outflank-mailman (input) for mailman id 644140;
 Wed, 29 Nov 2023 17:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rgXt=HK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r8OZK-0000rp-DQ
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 17:41:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 917c6870-8ede-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 18:41:47 +0100 (CET)
Received: from DM6PR07CA0127.namprd07.prod.outlook.com (2603:10b6:5:330::28)
 by DS0PR12MB8785.namprd12.prod.outlook.com (2603:10b6:8:14c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 17:41:44 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::fb) by DM6PR07CA0127.outlook.office365.com
 (2603:10b6:5:330::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Wed, 29 Nov 2023 17:41:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 17:41:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 11:41:42 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 29 Nov 2023 11:41:41 -0600
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
X-Inumbo-ID: 917c6870-8ede-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DliP1s5SMekwAonz5/SWDvOr/RsO3fDcoC8eDfXIbq4i2mE8BDK6b+lY0TO4svNv7pDJvfrFn9pMFmvwsHLLFOQrZIblB9P2Y3PmoqfNAY9IPdhSoYvduudRFxJgSrWNMzPnBF4AUONvPvZu8qvQ6pvqgpKsQObAIQsclR7taRZ74GzTcAjsy970QEX+LCkNh9N/cEWSSh7PmGwO5EA3pOmcrZBBATUVKNNkrcZluYqkxYgTE6uaym86efDF2aGN7ocSzbzfR02h8XHHjZgfrwOeolK5iwqnTGqOY+3f/EwKbBPpyWP5cmhSRpV4FNNzSrBawzVmVvVua+u/egVtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQP+IWU0LRPAnxHMIF6ux3j/NrHaaJ1QsdLr/6q8EtA=;
 b=W0mCdtiLRsNhovuJqzdnaKKkhF6Svq1+8/hYy8rp7MMeD3ROG9AM6EfbmwHY1KoP0PfFv5HWCN0P3PLQBthYHHDAJI7S8ty41id1uba0hiOhwp6K+uDNY1RT2rOZw7fCwiH3gREA9eQXT2XeTgpQjkro26Y5Eh8+lJ8j0Aj7ma6WY0XiVJOlYl9nOc3kLnR8xZ41kUrjnki3vw/jBpO1mK1dbRNW/8bWxqc9BiRH5XYmthxmMoBU5h4XrEV4NmrlbUF9rZIPemzV0lnsyN7XOp1gn7dD5Qs7xtwgHjojd4jE2+fvJHPRtONk8PInJwTuY3N4K0Q9vFmlQshnR11J4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQP+IWU0LRPAnxHMIF6ux3j/NrHaaJ1QsdLr/6q8EtA=;
 b=SHlNg40fc1TRPaF2dnVzC9p+PSM3MXBN9smm9XvTOuCovFjCpFEidph0UzF8wPXySJyytNiyfe1uGm4Qiu20sBRykbqdCCPpCHhj834NrVQsLOodIQqNVTwUhMvW49nPNCvsik1sJmNZi/6i72o8+/SQZur1ZLMM71OOklDrCoM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9685bc21-9d57-4f64-bd2f-70b9d0b0168a@amd.com>
Date: Wed, 29 Nov 2023 18:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Move static event channel feature to a separate
 module
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231129153417.84421-1-michal.orzel@amd.com>
 <c51e40ed-0cd7-4562-921f-d2dc67b9e4e6@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <c51e40ed-0cd7-4562-921f-d2dc67b9e4e6@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DS0PR12MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 9783baa8-f9c4-4a28-0528-08dbf10273fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dkgA503MpLY6tR9bU4Vpcj2vOs+FG5YiR8FVFxNivkRCnOIeHajSCuSZMlU2k/TnwrI2vFK732RevuVhHvBPrwzz/W1BDA+yp6sbpTEejoVudSJfQ1YauWrYC0crHJhHRowrzOT8gFc+2UX7MpSzPGDgFX2dn7x1SUkAkxiQUQX1PGsEIRSRyFSH4C6ZudUcMQiXZaozoCnwlSv/EyR/2OI6P6skQa0yVkzyqmfM6ruHb62pEw+wAsI2AWe2tseh+2cxMJYf/h+jsSePwmozlimvGWE+8SzTv12WoRjxAQOalxPos6Mm4uOOH0RR/6+XTZWObzACOnurdudKHqgPdb2ks/hxogTE9IBm2IM8AqBPpJD9aTd3xO0aYtVhhec4JqS6+qMXkC4TJFScxuE0KwQ0VHgd5iY2279a3BAjpAqPIGbFyfERrXRhuoMo2HAohRx+2FKVH3xOS1QIUvj97ZEuFhDeKeJSKSqm6prr5Qol2E/B1jH1W6oww3oaLtRf89bJumTbZm/O31q9GAI6d762IrA56w0GyRF3XCb1hxVyqL+OqZMmHi6s/uDEKlCxgWf+BCtm5hkAiqC0EPYlEING3FiiQAUwphdhavbsd7Q09EN5oveiPT2/aoDPbq+fCJ492X+Lr1xl6s72a/FX549F5qTsYsmV55+6nWaHqG+WihUo2WSsk0VHFHztOw9FPuAQdrBGsQ4nbXHNMxopUTNzvwNGIOg4f6QuQP5+eMkLwu4iOzyanP5SDrO9yoD0CPHRiAAMei71y2I8BeR4B4w+XTnXWhpBdUBjVAZVrFO1uxq1HXLcZgIFzq6jwa7VZF27mouHnanqItO90HhPaKYBL5lKGVttDA6uTwZLFD0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(230273577357003)(230173577357003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(82740400003)(81166007)(356005)(5660300002)(40460700003)(2906002)(36756003)(41300700001)(31696002)(86362001)(54906003)(336012)(16576012)(426003)(110136005)(70206006)(70586007)(26005)(2616005)(83380400001)(316002)(40480700001)(53546011)(478600001)(31686004)(47076005)(8936002)(8676002)(44832011)(36860700001)(4326008)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 17:41:44.0022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9783baa8-f9c4-4a28-0528-08dbf10273fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8785

Hi Julien,

On 29/11/2023 18:17, Julien Grall wrote:
> 
> 
> Hi Michal
> 
> On 29/11/2023 16:34, Michal Orzel wrote:
>> Move static event channel feature related code to a separate module
>> (static-evtchn.{c,h}) in the spirit of fine granular configuration, so
>> that the feature can be disabled if not needed.
>>
>> Introduce Kconfig option CONFIG_STATIC_EVTCHN, enabled by default (to
>> keep the current behavior) dependent on CONFIG_DOM0LESS. While it could
>> be possible to create a loopback connection for dom0 only, this use case
>> does not really need this feature and all the docs and commit messages
>> refer explicitly to the use in dom0less system.
>>
>> The only function visible externally is alloc_static_evtchn(), so move
>> the prototype to static-evtchn.h and provide a stub in case a feature
>> is disabled. Guard static_evtchn_created in struct dt_device_node and
>> move its helpers to static-evtchn.h.
> 
> I guess this is a matter of taste, but I think
> dt_device_set_static_evtchn_created() and
> dt_device_static_evtchn_created() are better suited in device_tree.h
> because they are touching a field in the device tree structure.
> 
> This would stay consistent with the helper dt_device_set_protected()
> which is only used by the IOMMU code yet is defined in device_tree.h.
Good point about consistency. I will keep the helpers in device_tree.h + add guards.

> 
> That said, I could settle on defining the two helpers in the *.c
> directly because they are not meant to be used outside of a single *.c.
> 
> Simarly...
> 
>> diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/arch/arm/include/asm/static-evtchn.h
>> new file mode 100644
>> index 000000000000..472673fae345
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/static-evtchn.h
>> @@ -0,0 +1,41 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_STATIC_EVTCHN_H_
>> +#define __ASM_STATIC_EVTCHN_H_
>> +
>> +#ifdef CONFIG_STATIC_EVTCHN
>> +
>> +#include <xen/device_tree.h>
>> +
>> +#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
> 
> ... this used to be defined in domain_build.c. AFAICT the only use is
> now in static-evtchn.c. So why is it defined in the header?
> 
> If this is moved in the *.c, then the header static-evtchn.h would only
> contain alloc_static_evtchn(). This could be moved in domain_build.h or
> setup.h (I don't have any preference).
Apart from a prototype, we still need a stub. Therefore I would prefer to still have a header (will
be needed for future upgrades e.g. port exposure in fdt) and move the prototype and a stub there (the macro
I can move to *.c). It just looks better for me + we reduce ifdefery in domain_build/setup.h.
Would you be ok with that?

~Michal


