Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E578C642FB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163764.1490843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyi0-0002nB-OO; Mon, 17 Nov 2025 12:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163764.1490843; Mon, 17 Nov 2025 12:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyi0-0002k0-KW; Mon, 17 Nov 2025 12:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1163764;
 Mon, 17 Nov 2025 12:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/DW=5Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vKyhy-0001xJ-Mi
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:51:50 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c02a431-c3b4-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:51:45 +0100 (CET)
Received: from SJ0PR13CA0152.namprd13.prod.outlook.com (2603:10b6:a03:2c7::7)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 12:51:40 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::4b) by SJ0PR13CA0152.outlook.office365.com
 (2603:10b6:a03:2c7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Mon,
 17 Nov 2025 12:51:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 12:51:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 04:51:38 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 04:51:38 -0800
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 17 Nov 2025 04:51:36 -0800
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
X-Inumbo-ID: 2c02a431-c3b4-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnMPRtSv4NCr7m8Utrdm82tIQnGq+7E4acJjyr8KHZ5Qxz0ph7WPXOyNV5kn0hIIUOLLfjF+mBshcuJm6qXh+8ytGH1yiwuwCjyMhc39mpP/IW3nTOwWyIB2aSoxkKZjeiJ02Xp5AU0xAVQEiMuZLz5iSv+pkInINzcrNnxo/qMp4gyFfzUznNQEEXPeWDny4lJO2EWIL0jj9tAXycFHU7RDAGMAEyy/CifT1F3ago7A5oDm3wtyjKzlBz8zOvZXMR/ieZIpR7xlmQZrD0iiYtK585w0iwlfiasVqAHbJMzF2duIfpH4ZCrabYyRpTENKBgrt6JRJbER1Nf3aJvk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgIa7eJUcJy0L797JuXOlZcWIxafwc3mfLGn2Bbocrk=;
 b=d3QYYbaSoaC6Nv67HuIuAteOiYSCh3IPJzd/0LTUSzxYQbKgkgYp0HuYQUKvnyru5CoCFZLfrEVjrovoPlwZNyPwjBCM/YPzkwELVzIdL/flxwdwZ0JMOU+DL5/OvvGqmQa40lKbr1CdDCYBrY56/y9KeOkhazlzDn9Jp0ZD9ND9ZiiacW9YU8e8K54mdZRcu59EqcaU6ek53J39lry5wigT5czeyyRmYWslykJbKzow7CZI6dlh2tTZsfjuaXtPHAdo3lS82n0LCqZAVkXclhn1qZGFD+UphMI/k7PGuCU2mr11htKtAeNpff+jwNyPW+83mIWy0jDP6PsqG6sDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgIa7eJUcJy0L797JuXOlZcWIxafwc3mfLGn2Bbocrk=;
 b=GPGg0zV302/8Fnww0dlUiXnzagUKdbQgIl+riFB/CeTB4T/5IF+2yUP8Fv4rfSAZjQ59FTxxy4UFcO5cGOT2X2eFtta9JSsBHauUrOCpiGcHd1OMBULJKQl8boO50XEDyoPt//25JEzFkhIYC03U5EuoE83pPrRfG9z2OVgYugU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7261ef7c-c574-4c3f-9aa0-259386f05d05@amd.com>
Date: Mon, 17 Nov 2025 13:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm/mpu: Implement setup_mm for MPU systems
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Harry Ramsey <Harry.Ramsey@arm.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
 <20251111101601.4171120-2-harry.ramsey@arm.com>
 <80c02055-2687-4e24-8de0-8fb4dfe2af02@amd.com>
 <fe082ad9-ee55-46bd-8b93-5320649e6aca@arm.com>
 <EF7146C1-4351-49F1-A0A2-9BAE0EEFB888@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <EF7146C1-4351-49F1-A0A2-9BAE0EEFB888@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DM6PR12MB4043:EE_
X-MS-Office365-Filtering-Correlation-Id: f01f2fe6-2298-4fec-6a51-08de25d80d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1hQMFVlQkdMcS9UQWpLamhxUy9rT0NiZVBseENobHFRODhLL0lHa1daU1pU?=
 =?utf-8?B?TUcvcW5uTlpvQTIyU2M4azZzRE95QkgycTlJb1kyQ1ltR1o2Q2FWNzhxbjBm?=
 =?utf-8?B?aFpUNGM0b3EvM09KbDVhSW53MjRQWTA2RWJzaFJydU5SNkRLeHFDa0xQTGIz?=
 =?utf-8?B?UWwvYVBzMXRET0I2TmFTeE91V2hoSURmWFFWTldPbEVVTDk4M3A0RE1xNC9F?=
 =?utf-8?B?UjNtUWtIb0Q2dk9tVzB3MytDY3FvTEpJMEJQREVIS1Z5VUNub2UyNFJSY2Q4?=
 =?utf-8?B?Tkh4ODZKUVZzekl0UDlvUG1SUlY0aWJwYXhyM3IvSU9JTngrcjV1dXlQa3ht?=
 =?utf-8?B?SUdiNkQrRjlLaS8xSjNMSjFoOE1kbGtIWFhsNmlZMmdQSDZ0WUowdzZLSWRa?=
 =?utf-8?B?Ykp6aXA3WUtZbDFoUFBCL0x4VnJaZXBVL212TzRvdFc4VXNGMzZ1Ym95YTVm?=
 =?utf-8?B?NkxVcnlLb2gyMWU5OHcvK1RXWlNZWERVZXVjODRNaExGNlF5cHlSQmZDUW9l?=
 =?utf-8?B?SllpcHpaYjBmSkxNVXh4WGhab0lGMTVDcXl4QTRkMHJXdnJkdE5uQVQ3cDBG?=
 =?utf-8?B?ODR1YURzcWFJdUoweGEwRXBWNTUxRW5oVDhiQk1yRmVwV2lGclVRN2IxZlVK?=
 =?utf-8?B?VVI3cU5LdGxERnhrVE1ydGo1YVdmNkE4NUREUXRrcUJYZ2hWZUdMZFVYZ3pZ?=
 =?utf-8?B?S2FqNGFCbmEydEdsb2lrOElpRlFXR0lRRGk0cGJQU2FTVTZQM1U1OVhhaEFB?=
 =?utf-8?B?UGEzQkRNTy9oOWtuemNMcE1kcXh1VUZyVDluOUhhdFpMUGNGSDhVNlhWNm5l?=
 =?utf-8?B?UmErTHpxUUxhVW1TNFhrM2xlTEpUeEZGb2JDMDdqcjYxS1cycU9tMnFnRWJX?=
 =?utf-8?B?UktQRGg2VFBzVHRsUVdMRm0yMlRNRUEwRGM5a1lKVnRTSlAybVBwaThKMWVW?=
 =?utf-8?B?UVBYU2ZhczNQbmNsaklNOW5ZSWk4YXhwQ1JaYkk4LzBxWWxNVGdEVjRFZlM0?=
 =?utf-8?B?OFp5eWpiVkRkc2gxcE9DRHM4NUtXWkhjenhDcGR5MVEvZnhUQlRrc1Vkei82?=
 =?utf-8?B?WkV3QnRuNGwzU01nYUlFMWg1TE1HeUVBOHIzanhnbTZYbHMxblRNWUdhN0tZ?=
 =?utf-8?B?dFJ4MTZDSGd1VnIrRE5VbUhsTkNlSEVaM0R4M2t3T2g3SS9BdmZ3Ynd3OXE5?=
 =?utf-8?B?b1NqaVJLMGZJVmlENjR0U1ZGc0NjWFdiSFhPcU9QaGgyL0FSbUJjRldDSXRa?=
 =?utf-8?B?emVkTW0rSXRNdXFVRnNrZEx0U3FuQU5VM1JLV25tZUd1NSt5aExZQW9IU2Ux?=
 =?utf-8?B?WFJkcnRkd3plM1FiUGJkSXphTVd4anhXMzJNRkpIc3dVRVIxWEVyZWJId2dk?=
 =?utf-8?B?TitrbkVkZVE0OVdYTG1HWE5YZURjUC9kejlKalpWMk9lS3FHQjhOK1A5UzEv?=
 =?utf-8?B?Z0ZCZzlUMTIwd1VhejlRU3hIQndDdjdJKysyR2RoK1owZ2hsb0J5RXdMbVUr?=
 =?utf-8?B?K25XMXZPV2pFZFF3REpYVDFNZE5WaDk4RzByYWxJVjRpVVg0NklhNWs4aHBk?=
 =?utf-8?B?bU53VFFIUStRYnprUG1IMmpqYTNEY3RPcXp1U2NtY0xVQitnY2Q1UHVlQWt4?=
 =?utf-8?B?TUNGdG10ZmhRMkNWOTdwRG82aVVVVzhvdlhqQUN3S0VubGJiY0lKeEhqU3Nq?=
 =?utf-8?B?UUpwRXorK2JWNnpCL0p2SlNQZGc5R1dVZFFoNldoT3cwQlpqOWZrOU1IODg3?=
 =?utf-8?B?UTJJcnBzcWc1SGpjM05NclpqTTZSdFpRMkZxdnM2c1p5eWZvbmtnQ1FBMDV3?=
 =?utf-8?B?ZDJLeGMwZnJaWWV4ZUgydThTbFp2SjBQNE9CVDZFZjd1MTVhcFZLUlg3Vkdu?=
 =?utf-8?B?VFhrRVgrQnp1VkpLaWFGcnRxeUNuNkVHendxUzBqMHZadk5KRkZlWUtIcGlS?=
 =?utf-8?B?OGdkNTRteWlwNnF0N21iQW9Fb1NCUlZqYlJBVnJrUTlFTTFlTGZzNFRpalFk?=
 =?utf-8?B?NDNoNGVyWllXUWdOLy96MWZPQkd1MmZoU29kd0ZQZHY2a21SaVM5bWpZVTR1?=
 =?utf-8?B?NEdaamIrd1FDYXYrSjZmVVpXZ0QwdkZ5NHQvTHNVdTFhSktkNE1mMExUc3RD?=
 =?utf-8?Q?aL4M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:51:39.4313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01f2fe6-2298-4fec-6a51-08de25d80d12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043



On 12/11/2025 17:06, Luca Fancellu wrote:
> Hi Michal,
> 
>>>> +void __init setup_mm(void)
>>>> +{
>>>> +    const struct membanks *banks = bootinfo_get_mem();
>>>> +    paddr_t ram_start = INVALID_PADDR;
>>>> +    paddr_t ram_end = 0;
>>>> +    paddr_t ram_size = 0;
>>>> +    unsigned int i;
>>>> +
>>>> +    init_pdx();
>>>> +
>>>> +    for ( i = 0; i < banks->nr_banks; i++ )
>>>> +    {
>>>> +        const struct membank *bank = &banks->bank[i];
>>>> +        paddr_t bank_end = bank->start + bank->size;
>>>> +
>>>> +        ram_size = ram_size + bank->size;
>>>> +        ram_start = min(ram_start, bank->start);
>>>> +        ram_end = max(ram_end, bank_end);
>>>> +    }
>>>> +
>>>> +    total_pages = ram_size >> PAGE_SHIFT;
>>>> +
>>>> +    /*
>>>> +     * On MMU systems we need some memory to allocate the page-tables used for
>>>> +     * the directmap mappings.  But some regions may contain memory already
>>>> +     * allocated for other uses (e.g. modules, reserved-memory...).
>>>> +     *
>>>> +     * On MPU systems we need to pre-reserve regions that were allocated for
>>>> +     * other uses (e.g. modules, reserved-memory...).
>>> I'm not sure I understand this part of the comment with regards to
>>> populate_boot_allocator(). Could you please explain?
> 
> Maybe here we should just write that on MPU system we are populating the boot allocator with the
> static heap region, since static heap is mandatory for MPU.
> 
> What do you think?
The reason for the original comment was to explain why we need to call
populate_boot_allocator() that early (i.e. before setting up direct map and not
before setting up frametable). It's not about explaining why we need to populate
boot allocator because that is rather clear. In case of MPU I don't think there
is a reason for doing that early, so we might not need any reasoning.

~Michal


