Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C89E7EA549
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 22:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632010.985854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2eCk-00080P-2g; Mon, 13 Nov 2023 21:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632010.985854; Mon, 13 Nov 2023 21:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2eCj-0007xk-VY; Mon, 13 Nov 2023 21:10:45 +0000
Received: by outflank-mailman (input) for mailman id 632010;
 Mon, 13 Nov 2023 21:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2eCi-0007xe-9r
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 21:10:44 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a0b30e2-8269-11ee-98db-6d05b1d4d9a1;
 Mon, 13 Nov 2023 22:10:42 +0100 (CET)
Received: from DS7PR03CA0076.namprd03.prod.outlook.com (2603:10b6:5:3bb::21)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 21:10:39 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:3bb:cafe::d4) by DS7PR03CA0076.outlook.office365.com
 (2603:10b6:5:3bb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 21:10:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.17 via Frontend Transport; Mon, 13 Nov 2023 21:10:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 15:10:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 15:10:38 -0600
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 15:10:36 -0600
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
X-Inumbo-ID: 1a0b30e2-8269-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmJACO+7ozQUDefe31FRQrwQZaouYUdqUvNLv3OjCDp7v8wBd1FCTRLrNY/4iQP4pUDltS7eP59QwXwJtHfVOLI4CsTGJWf4xFGESEYKCK/0iy583vYZwlRslM9JQbF4E6Htdj1GPskBMUD4jaDY1kdPeQ5ahsEDZF74j2hd0mB35b3/V+yGYj9k+uzMMyTRnsBoqDxZMJXLS+yL+x7cOzIp73zdoO4fHX8F6P/xilhDuAvQgy9yn1+mJfStExet+lZcSsRwnsvTszbsC3vY87mTx7UWj4rrtZ1KkVqLK5YlqDSYzcG31HZXiiboL/fHEvK/IVjcWRPNiOF5mZk20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1BwwMCrX3zZeK2ry3Zu5Y5Nz7sZjmcAyzm0oAA1wO0=;
 b=GW1nxZ9Xx4XD8eFyYP4vl38H8pap2DMk1/jhru3SU1LdjWpXzo5YCymmJUHKil8lO8PKE9jAVeCN7ex1u1nd0v9wSNNWnxOuBPOJxCVB3BT1x0Ln1ptRG8Vk1cH/KU2/a6qSs0vFkQBJr2GODrJoNT9SK2USI6BbS1p17pVv2TU4ToksdOec2tBLE7nPSdn1D0olGx9av1x5zk2urqR346V/pxwZQ6dGZOvtj20MlTyqCOduNIG3PMIJSYviL2+fQXg4K5jVrtYHQUVN+HunvACadrJY289Tt3YO7V7m82Hq56NiculHpfq2EDmM7iPw4qrowWUuQOEI6wEHHfaoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1BwwMCrX3zZeK2ry3Zu5Y5Nz7sZjmcAyzm0oAA1wO0=;
 b=yTL2gq6OD5rOvQa7L5kFBS564B2TV4c3+IRvPIF6GEapUqTwnbsPhigeKGtFGUQv2d3EeHVkP9/h4LBFT0E1L6uEf9jw65RT8X4VEbqPPcTJpbiegCiyHcnwVq08vQBTjVHiE4bGJhowRQG/YvxQI9Q6fI2ZJbdL9SY2/BahSh0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <356283b2-063f-4bd7-b6d4-c45f001f824f@amd.com>
Date: Mon, 13 Nov 2023 16:10:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] [FUTURE] xen/arm: enable vPCI for domUs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
 <20231102195938.1254489-5-stewart.hildebrand@amd.com>
 <72bb9f75-66a2-1452-40af-a90430cf7eca@suse.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <72bb9f75-66a2-1452-40af-a90430cf7eca@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: dea78db9-432d-48f0-fc1e-08dbe48cfcaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rLRsQeRPAxVZ5WwRTHTRzmgdcbP9aaJaITLrAYpQ5FCu+O6lk7eUw4D/yQrUFMyIWrDs6mR95uijvcymbIG3Bf61tpI0EEfyiGSHIeuRaw6gusiw1w6wXfNvQF+yXbY9Uxu6iWFgy24b2+GC0VpU5l8pY3h4LR42b5ydLTbkyz87eOECMygDeXQxqRlIX7ODG4WfhUZB0Ffg7nRy+EKc1mqd0gAyIl2NLoMbTifBpuEuKT1OQ976S9sAUDgzhrcRTTWTCwNPTsOPxbjIP60WSv3P/XLwPmVHNw3vaYCmBuqg8I8eUIZZV/FaYkXcfIBaiDnKvoGOJ6TDB6kqEQUZobZ+QI7SB7CYd7MNnmJlk8TZLKDDBVF4hjyoIx+02B9DhKKRPAGNsN6sfXW8JopXHkS/HEZHtLocnSVUJ/bMfWSIXdSmCtMxfX28IUMTp01JzDG8eX7sKl2wO9PJs5ShfhQ78H5aJjOHBJccpLrCDHj4oHEIu9qDEqqmGhRkQac0OX/Fjrf69xQWYdRbZxbov+Ugmr7Oipp+BqFkj3ejIsmcv0fwWsQytvEdcnMOfamMeRj2on3duDsMwdTrEn6BghcyDiGInxQjj9Vf7RbzQ2Nb3zxvzBuT4y4VmZEUbTmREsjoLnF+iyyVarRo2o1CwuLzCL6VX959JP46vZm5U/jDzDbMzpeah3CvObiv5pmOGtvSLrpjtRaR5LnC16Kzezcc4Ii89D0K5OldBjhJNZ+aXyu6g5bFIC1B9WuJZG1mXKD/7bJlWLT4RhkelDTOihgrorZ2Tk8FE5x8sO2Oei6TKjL0TTS+9yjn8yQWziPn
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(40470700004)(36840700001)(46966006)(44832011)(31696002)(40460700003)(4326008)(8676002)(8936002)(36860700001)(26005)(2906002)(5660300002)(2616005)(86362001)(7416002)(82740400003)(66899024)(356005)(426003)(336012)(53546011)(47076005)(81166007)(36756003)(478600001)(41300700001)(31686004)(83380400001)(40480700001)(316002)(6916009)(16576012)(70586007)(70206006)(54906003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 21:10:38.7894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea78db9-432d-48f0-fc1e-08dbe48cfcaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283

On 11/6/23 04:26, Jan Beulich wrote:
> On 02.11.2023 20:59, Stewart Hildebrand wrote:
>> --- a/xen/arch/x86/include/asm/domain.h
>> +++ b/xen/arch/x86/include/asm/domain.h
>> @@ -503,6 +503,15 @@ struct arch_domain
>>  #define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
>>  #define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIRQ))
>>  
>> +#define is_pvh_domain(d) ({                                  \
>> +    unsigned int _emflags = (d)->arch.emulation_flags;       \
>> +    IS_ENABLED(CONFIG_HVM) &&                                \
>> +        ((_emflags == X86_EMU_LAPIC) ||                      \
>> +         (_emflags == (X86_EMU_LAPIC | X86_EMU_IOAPIC))); })
> 
> I'm not convinced we want to re-introduce such a predicate; it'll be at
> risk of going stale when the boundary between HVM and PVH becomes more
> "fuzzy".

OK, I'll drop it

> 
>> +/* PCI passthrough may be backed by qemu for non-PVH domains */
>> +#define arch_needs_vpci(d) is_pvh_domain(d)
> 
> Wouldn't we want to check for exactly what the comment alludes to then,
> i.e. whether the domain has any (specific?) device model attached?

This patch is primarily dealing with Arm, so I'm considering simply making it return false for now:

#define arch_needs_vpci(d) ({ (void)(d); false; })

If it needs to be changed in the future when we enable vPCI for PVH domUs, we can deal with it at that time.

> 
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -51,8 +51,17 @@ void arch_get_domain_info(const struct domain *d,
>>  
>>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>  
>> -#define has_vpci(d) (((d)->options & XEN_DOMCTL_CDF_vpci) && \
>> -                     IS_ENABLED(CONFIG_HAS_VPCI))
>> +#define has_vpci(d) ({                                                        \
>> +    const struct domain *_d = (d);                                            \
>> +    bool _has_vpci = false;                                                   \
>> +    if ( (_d->options & XEN_DOMCTL_CDF_vpci) && IS_ENABLED(CONFIG_HAS_VPCI) ) \
>> +    {                                                                         \
>> +        if ( is_hardware_domain(_d) )                                         \
>> +            _has_vpci = true;                                                 \
>> +        else if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )                 \
>> +            _has_vpci = true;                                                 \
>> +    }                                                                         \
>> +    _has_vpci; })
> 
> This is a commonly executed check, and as such wants to remain as simple as
> possible. Wouldn't it be better anyway to prevent XEN_DOMCTL_CDF_vpci getting
> set for a domain which cannot possibly have vPCI?

Yes, agreed, I'll leave has_vpci alone

> 
> Jan

