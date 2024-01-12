Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF582BF31
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 12:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666845.1037764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFfT-0006Jq-Vl; Fri, 12 Jan 2024 11:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666845.1037764; Fri, 12 Jan 2024 11:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOFfT-0006IG-T8; Fri, 12 Jan 2024 11:25:43 +0000
Received: by outflank-mailman (input) for mailman id 666845;
 Fri, 12 Jan 2024 11:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12w8=IW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rOFfS-0006IA-QT
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 11:25:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50a4dd8b-b13d-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 12:25:41 +0100 (CET)
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by CY8PR12MB7364.namprd12.prod.outlook.com (2603:10b6:930:50::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Fri, 12 Jan
 2024 11:25:37 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:88:cafe::ba) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 11:25:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.4 via Frontend Transport; Fri, 12 Jan 2024 11:25:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 05:25:35 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 05:25:34 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 12 Jan 2024 05:25:32 -0600
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
X-Inumbo-ID: 50a4dd8b-b13d-11ee-98f0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Po4NJN5GcH4D12RICatAa72u6kazovCU0CVV4tTSHrOGBISC7FqvsEicXUuJaN10zoqGmAHGC/GXT0eHLbAEn7xS66iZBPn3Rm6AdR+7hPyG7xONPDH13z5is93TVR8fI12+dltm9wESjw5kroQqw1Jn1GanCQJ3hSLg0i/ZsvAVxiraPRf6PoFfxY0Ktvm6CRVcxbwGbe3fBHImriU2zidSXrZQUTgE3X1UZKUvCVNhcS0LjKMp+fDLUz/ceuhsW7VoXz7uIrKS3pc63dJW3mAonfp0nTr4HyV7I9pOgDO12qnNmACpMExx3Ozmcsw8ETg+xdICfhWxMAxcEinfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsDre6F0jXp/nVBwmuF/N0dFA525Ew6TBX8RCdgMuks=;
 b=Ody8VE/pHo3w8sQO+5L5b7xT5NQrDn1c7GVDMgLO6V2QokdSQAGiXMhenlWGbz8htfIXHz2J97NCLJGVkWtXHJEvPKNKKBGz4FoxGclt9Foev3YRfGmwqrlrUigu9q77SY2X2zAAJmyHMZOIOVIP49+7NNmESfhbJ9UvjGIhYZijN2eTWiPT5sFG805osahC8rjscrseA4qz2mn16z8E+txf4ugNLcXo6vbDsh4meNBsxYJfwrZJmT2zGH25U6+Pf/liWC4Tq+vj7d5m7tK9Zt/FupTooBS+y7JTYqeNBrw5S8+j3VK3HSFsT8zWwO2LBiiA9EjiuqCvQzNXmeyqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsDre6F0jXp/nVBwmuF/N0dFA525Ew6TBX8RCdgMuks=;
 b=5JT8fDgDDoinMRQtfW/Fj9EPOLO9IanZApDYWMd+9b+Th2/Eudodd/J9gjUNqtYbKMzEYelSDgYEmBBvDucO1pnHuiliWDYzCCZg7jMz+5EdYVEn85sGtojFFzljXI2rDXuGxPR82wCujZUifUWeup3fi4APhIqxiZQeDV5lK8c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a154f9c4-6905-4f51-a8fd-36f3ca652f1d@amd.com>
Date: Fri, 12 Jan 2024 12:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/arm32: head: Improve logging in head.S
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240111183410.45566-1-julien@xen.org>
 <20240111183410.45566-3-julien@xen.org>
 <58d2e455-2894-4b1f-948a-3b486bb84499@amd.com>
 <bb7d0581-6e47-4dce-afa3-0f3d55db9ebf@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <bb7d0581-6e47-4dce-afa3-0f3d55db9ebf@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CY8PR12MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9e805c-ab24-4553-48b4-08dc136132fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V9e6vGMmjtHJpSULG1GOxvD3gtqIu1pzMJaafiDEF08hAzm0Mr5fuUezzLzoKMg762N336EvF93eZxoA0KS8KQ25V2PuGhZBFKMAlRXTZqZh8YKgf3+oNecYidqYopC5sCqR7Eh0yWp8QFDKW/dB7cmDnzbv0OjhdWKMmfOpb9IuwQ/7pKw3PGkJwpUbNeORvyM6NoCsWw/WH0TUWJV55ZNE1OXcfARPwSacGKHgW7UfJH+jideujn0UKhsNbdGT88A67KcM/SNVXu7/Y5UtOqDhzF/wyqgj//BkTJxbPmt3gBsRy/CZamBELPkaY1HADdegFdyTSMN3WYQVDrXcXMEVDsfgcj0ShPYvciF0na1wyXKcnBUZZDWNWG8Yl5qZ5xPNnJADxtMnd7PFxm1jKg6/AnTpp+/Xi81EquCPi4TqRgSlzaridx1okMBdMZMXv/GbvwDNmVJrL9ksR1TgnfL4pdQlXkI4KuWb9DRNasRTAKrUVBjryafcp+B44RQDFIKp+QU0mY0e4J/NbHJF66zHHZ8ZIFscZsSLegFRpMfjJ/mWr2GgKHehcNkkedQfZJnsLPzy1bcgGPn5jFUMX+vD+tCc/NPpkRTzPb6Hn4ikoTarufnMPHuPQnI8ZXE+6wrha+Q3pgsipBfm0PS+W6y6IpuW8ZVu7wPKvsJFIfMs5Xjgr//Rg0Nw9NdtqDCOIrEIlkE4c+GkyYxYp8OxpvgFERwSUCvuDJqU/8f39BTvC9Rcvm+NjtKKPYCYUoU+jaekMxF1hKxr8LyeIerfKH3RLY9NwgJ88W33aEJWPA0KmwEkB+f9L5X4W0MdK6ti
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(46966006)(40470700004)(36840700001)(86362001)(36756003)(8676002)(83380400001)(26005)(356005)(81166007)(82740400003)(336012)(2616005)(4326008)(8936002)(316002)(54906003)(16576012)(110136005)(2906002)(44832011)(5660300002)(45080400002)(41300700001)(426003)(6666004)(70586007)(70206006)(53546011)(36860700001)(47076005)(31696002)(478600001)(40480700001)(31686004)(40460700003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 11:25:36.6577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9e805c-ab24-4553-48b4-08dc136132fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7364



On 12/01/2024 11:58, Julien Grall wrote:
> 
> 
> On 12/01/2024 08:49, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 11/01/2024 19:34, Julien Grall wrote:
>>>
>>>
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> The sequence to enable the MMU on arm32 is quite complex as we may need
>>> to jump to a temporary mapping to map Xen.
>>>
>>> Recently, we had one bug in the logic (see f5a49eb7f8b3 ("xen/arm32:
>>> head: Add mising isb in switch_to_runtime_mapping()") and it was
>>> a pain to debug because there are no logging.
>>>
>>> In order to improve the logging in the MMU switch we need to add
>>> support for early printk while running on the identity mapping
>>> and also on the temporary mapping.
>>>
>>> For the identity mapping, we have only the first page of Xen mapped.
>>> So all the strings should reside in the first page. For that purpose
>>> a new macro PRINT_ID is introduced.
>>>
>>> For the temporary mapping, the fixmap is already linked in the temporary
>>> area (and so does the UART). So we just need to update the register
>>> storing the UART address (i.e. r11) to point to the UART temporary
>>> mapping.
>>>
>>> Take the opportunity to introduce mov_w_on_cond in order to
>>> conditionally execute mov_w and avoid branches.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> Thanks!
> 
>>>   /*
>>> @@ -29,16 +33,26 @@
>>>
>>>   #ifdef CONFIG_EARLY_PRINTK
>>>   /*
>>> - * Macro to print a string to the UART, if there is one.
>>> + * Macros to print a string to the UART, if there is one.
>>> + *
>>> + * There are multiple flavors:
>>> + *  - PRINT_SECT(section, string): The @string will be located in @section
>>> + *  - PRINT(): The string will be located in .rodata.str.
>>> + *  - PRINT_ID(): When Xen is running on the Identity Mapping, it is
>>> + *    only possible to have a limited amount of Xen. This will create
>>> + *    the string in .rodata.idmap which will always be mapped.
>>>    *
>>>    * Clobbers r0 - r3
>>>    */
>>> -#define PRINT(_s)           \
>>> -        mov   r3, lr       ;\
>>> -        adr_l r0, 98f      ;\
>>> -        bl    asm_puts     ;\
>>> -        mov   lr, r3       ;\
>>> -        RODATA_STR(98, _s)
>>> +#define PRINT_SECT(section, string)         \
>>> +        mov   r3, lr                       ;\
>>> +        adr_l r0, 98f                      ;\
>>> +        bl    asm_puts                     ;\
>>> +        mov   lr, r3                       ;\
>>> +        RODATA_SECT(section, 98, string)
>>> +
>>> +#define PRINT(string) PRINT_SECT(.rodata.str, string)
>>> +#define PRINT_ID(string) PRINT_SECT(.rodata.idmap, string)
>> I know this is just a macro but does it make sense to have something MMU specific in common header?
>> I don't expect MPU to use it.
> For cache coloring, I would like secondary boot CPUs to start directly
> on the colored Xen. This means that any message used before enabling the
> MMU will need to be part of the .rodata.idmap.
> 
> I know that 32-bit is not in scope for the cache coloring series. But I
> would like to keep 32-bit and 64-bit boot logic fairly similar.
> 
> With that in mind, would you be happy if I keep PRINT_ID() in macros.h?
> Note that I would be ok to move in mmu/head.S and move back in macros.h
> later on. I just wanted to avoid code movement :).
With the above explanation it does not make sense to move it back and forth, so let's keep it as is.

~Michal

