Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DCD18978
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 12:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201523.1517143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcyx-0007NP-1E; Tue, 13 Jan 2026 11:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201523.1517143; Tue, 13 Jan 2026 11:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfcyw-0007Kz-TO; Tue, 13 Jan 2026 11:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1201523;
 Tue, 13 Jan 2026 11:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X45d=7S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vfcyu-0007Kq-HT
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 11:54:40 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2c02691-f076-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 12:54:37 +0100 (CET)
Received: from MN2PR17CA0024.namprd17.prod.outlook.com (2603:10b6:208:15e::37)
 by LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 11:54:33 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::40) by MN2PR17CA0024.outlook.office365.com
 (2603:10b6:208:15e::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 11:54:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 11:54:33 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 05:54:33 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 05:54:33 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 13 Jan 2026 05:54:31 -0600
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
X-Inumbo-ID: a2c02691-f076-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCaP90a0wJtCnN+o6vkhcnmtBK9T+iv2rR+I5phwrPWULPWru+pug0Np2MQD6Rp7d9HslcMFsVbkbaz8P1D4ghRKFSHsOiLP4p+YNdvnh3rK1TpJeMwD8EBy2FlVLR4tS5w1CUN6PrRK21z6NlCrhpnVo6BSYdQZeV06RwvkpQjPBAFqnRzUoOWy3gaekycjvyhVVp5MWcO90Erqr6KKXjDoQvxQ/ZG+o4XkY7pcOCaBWIe3Y2HqwRCEDLQfDFFvMhdOVXLKmabaf8nph477T5ydeF2d1ej1rBOEfjJzODZ0I6oTGTNAjRPui4Du9rkAxAQDVPe3ivz5qEvrPG68PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWFwnq/uGaUTjhyQQzwUypW8vL6iA0epU0MrIm4lGiM=;
 b=ykryeajqrI9xTrhL/VVUTBuMrpBbp/tp1rpofrHVzf2FC19ByLFxvx+rcV8lSA+gXI61mWRjNOY/S4J2KFrJ9c4eFxzmSs5UdUjwv6dIPfFafJfZK4D40OMHROL3L1xyATaArl+IPaNfARx0PV9jLjtu5P9Q1Th+f+kaOcIalBmIPzy4Re5Q0dIMfa5kLx3tSxT+RjAPt324omNBJO33PFzGvRrg9SB6O2xA7yHWL8XqzBkGOzXbMQ9Aub0pzeyrWx48Pkeb5uMIVXptl5m56vVWM2Ot8iipGm4VLVGFmvozEbbP0A2zbys/4YyVpF5rRrV+zEIVrpbch3T38E+2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWFwnq/uGaUTjhyQQzwUypW8vL6iA0epU0MrIm4lGiM=;
 b=QNCh3kQO9HyzE5Pplv21ef+Q5ocym2aMBQy5AAxjha8W5bX82nyMJluBWG9SzYQpzbz/DHChERVFDn/+lKhyeUtCm2++UMC+5QnSJUqhl+1+Fq/slU5xTQWZaE1ttHcqxTNkYrAKGejOvmTNC0JzrZpkQH81oYRt96NIBtIKO3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <84be01b8-9f13-4adf-8613-8658f46f3260@amd.com>
Date: Tue, 13 Jan 2026 12:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm/mpu: Implement free_init_memory for MPU
 systems
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>, Hari Limaye
	<Hari.Limaye@arm.com>
References: <20260105113503.2674777-1-harry.ramsey@arm.com>
 <20260105113503.2674777-4-harry.ramsey@arm.com>
 <d6fc338b-60ee-4d30-a69b-9da90059bbd5@amd.com>
 <BFDE011F-FFA8-411E-9459-595CA5C470F1@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <BFDE011F-FFA8-411E-9459-595CA5C470F1@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|LV5PR12MB9804:EE_
X-MS-Office365-Filtering-Correlation-Id: 5894e9f6-1cf0-424a-04f1-08de529a8493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXFUNUNmbHFaM0V4SE1wWWtBNUhQbXdQMGJ1dmZIWWw4VjZoRlcvTlRZNmpN?=
 =?utf-8?B?YitxWThwcVdRQ041K2FSaUc0VzByKzhoTHZyd1Jra0h2TjhnYXpZTzBrbGhN?=
 =?utf-8?B?Z2hSQVdEYTloQzRPLzAxWlVXeldQK3hTaWt1RlgybGJiVVZtTDdKZ2Y1SGcx?=
 =?utf-8?B?VWNXQnV0N2JFODY1a1didWZuaStDbmVwTE9McTl3R25nMTlva3FWSjF2OURQ?=
 =?utf-8?B?MDZzbFRtYjlnbFZZRmZ3dmQ0NExnMDEwR042ZXdabFAzenZmY01xbUVoL1Ur?=
 =?utf-8?B?TDVJdFgrNVhEZmRxMGF1aWgwSG9weUE1M1ZKMDRneE9haEFYbGlzQlNqNUR1?=
 =?utf-8?B?RnFrQU11MlhwNjdIdkpQSnFIaDdVdGU5YUNYNHVLMkxQLzdvdVRGNmtoSjRE?=
 =?utf-8?B?bC9sZndTWFo4RCs4ZEkwZnMxWXZyT1lRM2JLQk9SYkYzeDFtMGh3UEw5Tmpa?=
 =?utf-8?B?SHZnVGFwaWVHZ2FxaXhIanpucit3TVlmK1N1bTZKWXFXU0taZVlIRktpL0lO?=
 =?utf-8?B?ckpKblYrVm9GMSthUndEVFkyT25mMW1LcytiUmtqN0kxVHQwbWR6emNGRkNW?=
 =?utf-8?B?UmRjZjFoNW91L1B0NTIrSER4N0Y1RUdIcHZTdHRpQzd6UXcrbW5EMlE1dnRT?=
 =?utf-8?B?N0pJVG1ROXdFRGswN2RNM0Q3aGw0Z1N6T1NFNzAwTDZHZHJKM241d0ZCaTRu?=
 =?utf-8?B?L3ZuUXVoVUpOQytvUWhENXI5SzM2cmVTSGNiZUhMcmpReWVzdkJvZ2IrRVg1?=
 =?utf-8?B?L2FHY2ZhclBtcDhvZXRSYjkyTjByYVpQN0hYSTJjU2dxaWxvUWQ0RW5mMm9u?=
 =?utf-8?B?TkxwcHJvYkpSYlFjZ3hXRWtreVIzajF2Yk9ONTVuYzBpUzkrOEpKdEtuTjR6?=
 =?utf-8?B?anZ2VEFiVGlhWnR0a3JPcVNGYXNxSlVYeEhDb0lOb1VTZ3lORjNPRnkzZUw3?=
 =?utf-8?B?UVByc3pGaEV6QjcxQWcva1pBZk9zdGFoa2EwSGhIK3lHZE1wNkFCRm9NV09r?=
 =?utf-8?B?SkRDdlY5b2lHbVFodDlrV0J5RTB0UkVWU2tLWVZSK1J0K2wrcmxWTUZXS0Nm?=
 =?utf-8?B?QjhvZlMvWFRCUmh4SjRBWWhwdXVIZzhZY0kvYWVVSUVOcnJja1dScWZvaUt1?=
 =?utf-8?B?WWppSGRrelFmcW03Q2lGMGdFM0VHdjRRNWN1dEJKc3dQczVQWW8zT0NFaGJr?=
 =?utf-8?B?NmtKM0xwQXVYclZlSVd4UWp4MEJTc01TZVRDOER4OTZwbis0WWJYV092Yk1I?=
 =?utf-8?B?Y3djcjJGWWRtOTQ3dmwrUmdEeFFsYW5RUlp6TjFvQ1JFRnJGNHVtb01xNDQ4?=
 =?utf-8?B?SUlGSDNkWnJ4UjdKRlBvR2MwbzU0YWlYcXhtRDBmVzdxQ25xMzVMMzVFaDk0?=
 =?utf-8?B?cnpFc2ltK0kyZ1VTa29PeGFFQzNXcjZJOHRMYzgzNXJscXVNMkFSUXRyUXZI?=
 =?utf-8?B?a0QxZ1dVUFUwM3A4d0RGbm9jaUsxTzJJcDJmYVJBWW9qTzFYRFdiQWpzeS9n?=
 =?utf-8?B?NFpVaTBrdDJaNTdrWXhpOVQyeTFlOXE0MjJ4NGNjak5COXBWcFFzaG1Odmk2?=
 =?utf-8?B?VlFCNGpkK25HTGgwRTJRVHVPaFFPbEUyZWVhVDlZWHR5a1U1VTQ0RmhXZWw2?=
 =?utf-8?B?UTVNVytLOEpQditDemdZMTdEemZUd1Btdm9hMnl4Mk5UK0dwY3dlOTFMSUxX?=
 =?utf-8?B?YnV6cnZWd0RUOVd6RUtiUGhaSUVXVWdOTGpUUUhqd3BGakFJWUpka3NhenNY?=
 =?utf-8?B?YXdOSEp6SjZlL1VoZUZsZWI5aVVqck9uWENqbXhZOWRqZlJkdy9XUlVDejAx?=
 =?utf-8?B?VCtaY2Z0dmZTL0JrZjBTRTJqRXVvS0NOYkVCWXFGNUI0R3UvRXFxWGNUd0Nk?=
 =?utf-8?B?aEswUU9aQ0lpWHZXaUpZbkZyN0pwUUxCQUJLNjNVVUtOeklzY0xkZkFTWi9S?=
 =?utf-8?B?a3JmU3ZQMnVHM2FnRVFxRmlUVkd3SGJySjdBMTIzV0FjNC9sS0UxcThRd1Np?=
 =?utf-8?B?bjFrc0huM1BKbFNTaTFzQUowZHdiT1FPaVo3MGpCc3VSbVI0b3dzU3A2MEhm?=
 =?utf-8?B?MUQ2b0p2RXVQNldVUDNxTnJFeGQ4Q3dJd01BVnV2aUxuNTVNeVhEeVA3eVZv?=
 =?utf-8?Q?+1Ww=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 11:54:33.5428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5894e9f6-1cf0-424a-04f1-08de529a8493
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9804



On 13/01/2026 12:13, Luca Fancellu wrote:
> Hi Michal,
> 
>>>
>>> -static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
>>> +static int is_mm_attr_match(pr_t *region, unsigned int attributes)
>>> {
>>>     if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
>>> -    {
>>> -        printk(XENLOG_WARNING
>>> -               "Mismatched Access Permission attributes (%#x instead of %#x)\n",
>>> -               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
>>> -        return false;
>>> -    }
>>> +        return MPU_ATTR_RO_MISMATCH;
>>>
>>>     if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
>>> -    {
>>> -        printk(XENLOG_WARNING
>>> -               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
>>> -               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
>>> -        return false;
>>> -    }
>>> +        return MPU_ATTR_XN_MISMATCH;
>> Later below you don't seem to differentiate between MPU_ATTR_RO_MISMATCH and
>> MPU_ATTR_XN_MISMATCH. Therefore I would suggest to keep them as one to simplify
>> the code.
>>
>>>
>>>     if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
>>> -    {
>>> -        printk(XENLOG_WARNING
>>> -               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
>>> -               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
>>> -        return false;
>>> -    }
>>> +        return MPU_ATTR_AI_MISMATCH;
>>>
>>> -    return true;
>>> +    return 0;
>>> }
>>>
>>> /* Map a frame table to cover physical addresses ps through pe */
>>> @@ -357,12 +342,45 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>>>     */
>>>     if ( flags_has_page_present && (rc >= MPUMAP_REGION_FOUND) )
>>>     {
>>> -        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
>>> +        int attr_match = is_mm_attr_match(&xen_mpumap[idx], flags);
>>> +
>>> +        /* We do not support modifying AI attribute. */
>>> +        if ( MPU_ATTR_AI_MISMATCH == attr_match )
>>>         {
>>> -            printk("Modifying an existing entry is not supported\n");
>>> +            printk(XENLOG_ERR
>>> +                   "Modifying memory attribute is not supported\n");
>>>             return -EINVAL;
>>>         }
>>>
>>> +        /*
>>> +         * Permissions RO and XN can be changed only by the full region.
>>> +         * Permissions that match can continue and just increment refcount.
>>> +         */
>>> +        if ( MPU_ATTR_RO_MISMATCH == attr_match ||
>> Enlcose in brackets () || ()
>>
>>> +             MPU_ATTR_XN_MISMATCH == attr_match )
>>> +        {
>>> +            if ( rc == MPUMAP_REGION_INCLUSIVE )
>>> +            {
>>> +                printk(XENLOG_ERR
>>> +                       "Cannot modify partial region permissions\n");
>>> +                return -EINVAL;
>>> +            }
>>> +
>>> +            if ( xen_mpumap[idx].refcount != 0 )
>>> +            {
>>> +                printk(XENLOG_ERR
>>> +                       "Cannot modify memory permissions for a region mapped multiple times\n");
>> Memory permission? Here you are checking for XN/RO.
> 
> Right, is it better “memory attributes”?
Yet in a if() block for MPU_ATTR_AI_MISMATCH == attr_match you already have the
same message.

~Michal

> 
>>
>>> +                return -EINVAL;
>>> +            }
>>> +
>>> +            /* Set new permission */
>>> +            xen_mpumap[idx].prbar.reg.ro = PAGE_RO_MASK(flags);
>>> +            xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
>> Here you always change both, that's why there is no need to provide two separate
>> macros as I mentioned above.
> 
> good point.
> 
> Cheers,
> Luca
> 


