Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B207A7E9B6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:17:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940825.1340457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1r1n-00005s-GF; Mon, 07 Apr 2025 18:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940825.1340457; Mon, 07 Apr 2025 18:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1r1n-0008VC-DF; Mon, 07 Apr 2025 18:16:59 +0000
Received: by outflank-mailman (input) for mailman id 940825;
 Mon, 07 Apr 2025 18:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1r1l-0008V6-UR
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:16:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2415::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c8d2ce9-13dc-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 20:16:56 +0200 (CEST)
Received: from CH0PR03CA0198.namprd03.prod.outlook.com (2603:10b6:610:e4::23)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Mon, 7 Apr
 2025 18:16:48 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::5f) by CH0PR03CA0198.outlook.office365.com
 (2603:10b6:610:e4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 18:16:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 18:16:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:16:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:16:45 -0500
Received: from [172.25.231.87] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 13:16:44 -0500
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
X-Inumbo-ID: 7c8d2ce9-13dc-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSL0AbEVj4izsGUPfV9ImjyUEQvqLk7HF+0b+nyPnEc/OAZm4bL+7qTw8nPUnJpgPZOP36I8AA4FU20J64FLWzTZwnSWSgGMafeoVgbuj2vNyEQAT6aOGAzsIJYxhp1LcUoZ5dxlG50vplV88pVOHZCx/E+JIRhgjLHtEp/YKyK84UfIsO8jK7FMjk6Ggphar/AI5UGFM5ESMP9q68xkouaRt7bxhgHpswNMjAVEqFAg5sNf506NQSkH1gDetjsHOoI02p7EO9pmzw2KEcplb+p9aYv0sjK3aP16kHOHYRXxMLIolILEhtAgeWE1CsJ9QNRkdyi6zVmY8nRud+YnQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zu5/r573VL/mCk3hgJ7R6knSDglwaXrKHfEamfgfekY=;
 b=ir2Ux6F8wW6XT9n5ANoPetqua+oPsOjGgCHIFbQL5BHO3bSLYEH+hq8NAz6vpb40Z1Nzy7KnOmSXTK+X+pcNnpufALn6IWNxVUfJRKpTSg/Zvuj+mmRClNa5AcQRlzSxDLI1oqYX2R8+pmq11RbGZHUFiGDMRlkWk5JkZ8WSNqnD/8wQ7IlSU08HBq5z2c6MG5JpadvUj6DmvEZlxvPnBan2ivDV0IIp+rE7PMA+Ej5vhi4y8tXmqerZgT5zOlup2LPkZLIyzbx1g20Aqn+Uqlrg9Be102bAhTKH8AuYsurDW2UCQq2dTb5aGfgBBGSiiripONXBDNH1zTmxKOwcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu5/r573VL/mCk3hgJ7R6knSDglwaXrKHfEamfgfekY=;
 b=TdXf6CyG67uRS8grrHDdAmKzuETSRFhpjG9lUWdU5aBam7u0WVBwmdl8WCvDPl3HTl/09TX2wnaF9Ei5EDjxuNz+9U36moVSizpyzbsWVWWUd4NZQ3pHKn5h7IZIoYZjJulhhcSzqg9AKgx194BWE0WWFmY1BaL0+zIyPdGYeTw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <64f6bf18-d3e4-4392-b924-4b779dbe5d69@amd.com>
Date: Mon, 7 Apr 2025 14:16:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] xen: introduce hardware domain create flag
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
 <20250403214608.152954-2-jason.andryuk@amd.com>
 <332e0afc-9c43-4602-9bc0-dfe4ddd1b107@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <332e0afc-9c43-4602-9bc0-dfe4ddd1b107@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|DM4PR12MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f36fae1-03d4-404b-41fd-08dd76005c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0diUHZRY2daTzlZK3I5WGxzdGNQSWZscTVzV2pqRW1PQ2djZERZQ1h1NEFm?=
 =?utf-8?B?bVppdmtPYlRVdy9Nd1M4Y0ZGWlpBOFV2Qzd6T2pWWkJjUyt4aWlHRVhuK052?=
 =?utf-8?B?a2RnelY2RUVFNGptalFFOW9xOUEvL1ljKzNxcnY5UHI2VTl1KzRTTFdyUGEy?=
 =?utf-8?B?Z1RGSzJKYWZ1ZzNTVDN1b1RiQTRwLzgxZmh2dSttZjdFakhXMEFEWll0TnRh?=
 =?utf-8?B?ZllMSEdrS21ndGUyOFhPc3I1K1dYZHhzcUVzeXdvMWs1TFRjUUVwYXd0Mngz?=
 =?utf-8?B?Zy93ZWs5YnFqZHhCbFVhdm5kMzgwdjN6d3g2K3pWUWp4TUpzVEcwdFp2THhr?=
 =?utf-8?B?MDhjOW1TT0c3MXh2MlVzeTNLVlVLZHhNdDl6V1A0K0ZUemNmUHc1cWZEYXp6?=
 =?utf-8?B?V0o3V1lCTlpVZHpaRjNXRHVmbjBUNHlzMkpFZXRYQ2dqaTVsS3JwL2dSYStn?=
 =?utf-8?B?SEd4Y2tNdnBMeUJhK0F0elpsZmFlOGgzSi92WFpmZ3JGUmE2M2dEb1E2L3BY?=
 =?utf-8?B?OFJYc3NpQ3JIcDNpZmp3L0V3VkwyeHU2aWI0NGxPazhGRkpIWi95bXN0TkU0?=
 =?utf-8?B?UUI1Y1pmbWtad3lCQ0t2dHVrdkJneEExSmIzMUxEazdFYzB1MFFGWGJKOS9v?=
 =?utf-8?B?RkwrL2MxMS9IbUpqUXZoa012R1I1WXBzMVJQSCtKeG9wcnZTN0hSZnpweTc2?=
 =?utf-8?B?Z0V1V1VPci9hOUNZSWJlNWZOY3FMWW9lQnh5NUtDa1JMWXozaWh4bVE4VTlY?=
 =?utf-8?B?SW9zWk1YVExRVGpnUFVadkkzUUJLbnpLZ01GQTBhdDZpVkpYU0JoUGxBWlgz?=
 =?utf-8?B?ajNYL2RtdkJYVHNYNzVSQkdRM3djS3RvVlRzWTZSMXYydmM0d2czNkpZZlF2?=
 =?utf-8?B?b25qTEExZGh5TktPWnNPUUlRYThwcGI5emQ2Y0lSalcwbmxpbUdnUlVDMW5H?=
 =?utf-8?B?RW5Lc2RteEdwUGJwQ3FGM0lZdzU4MlFtczdZMjZpdzRiOXQ1eC84ZDM3eFlC?=
 =?utf-8?B?NXlSV3NrOUllQVBISml2cmVPc2VTQktQbW9BUmd5MlIrVDMzV2E0OWtHZStO?=
 =?utf-8?B?VU8va2NpYnJaZXQvZm01VSsxNVd5UTB0VUJpc0tXYStWdmlJRnNHNjZoOEtz?=
 =?utf-8?B?Ym02bjdkNXZMZlhVNEp1VVZXWHhLMFJ3YkdUdHJ5S1pidTYwbnAwVlRVRnRU?=
 =?utf-8?B?UFFvSGJDVVNZRHZTRmdCbE9qaUtCUXpqamxOTXpXU3RIUldlVzJqWUUrekNx?=
 =?utf-8?B?eVArZkZ0ZTFyWmtNY0VGbUIyd2R3a3A4SVp4amxGT241OE1qb3dtMkU0dCtJ?=
 =?utf-8?B?YXpYcjNVczRwUFhsdmZzaEhKT09jeTZxUXpZNWNHMytlWHNMTzNKSjIzd0RI?=
 =?utf-8?B?OUJIWlNzZ0pmN25iVUR0dTRQeFk1bGtwSGtkQmtuU0pPKzQ4Z1k5aXoyc0Fh?=
 =?utf-8?B?TlkveWxncmZZWThuMDhSVjh3SHpEQkNMZVpyMkhsRlNha0xnQXhLaHo5eUVL?=
 =?utf-8?B?bHYwSkNRZ3BjS2Y0dzN3YmJGWW41WWxZMkNMUjJuOFVHajc5Q0F0c2h5T2Mw?=
 =?utf-8?B?cTVZTmFzbWtEeXZlbWF5RHBPbEJtYW83UDJzZFFOb1B5d2gvalRBZmZEUDFI?=
 =?utf-8?B?TGlXOC9DQTh2NFA5eDhFQTJRZkNiWVREQWtYclFJeHpnak1reFZzWHREbDlu?=
 =?utf-8?B?aWdSRFc5Tm1oK2dGa1Qxa1hiMGtzYmU0SU4yTS9pM0w2UHdxL0p6VENGLzhm?=
 =?utf-8?B?Z3lVcmNTVXpvR0N3dVJKVTBWOGVXZEpPZldoNENGUUFpeXVPK0tvRHR3cWV5?=
 =?utf-8?B?UlFXcUFRM3VOd1NrN1FzUHY1R1RKNXY1eXFJMHNiN2hCNXJkajdUSVBsRjJr?=
 =?utf-8?B?anY3QkhtY1RMK3EwVUU3cUMzak4zUVZCSFVUamJyemJiUm0rdjBhaVpmL2M2?=
 =?utf-8?B?QXJoTGllTmRNM1Z1ZUw0ckZhaXk5ZUZPL1VYL1dWQkJucUsrcUcxeEhETVJp?=
 =?utf-8?Q?Idyc/+I+kP0qjO+c++VR3J4QfKfb70=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:16:47.6997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f36fae1-03d4-404b-41fd-08dd76005c57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616

On 2025-04-04 03:38, Jan Beulich wrote:
> On 03.04.2025 23:46, Jason Andryuk wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>
>> Add and use a new internal create domain flag to specify the hardware
>> domain.  This removes the hardcoding of domid 0 as the hardware domain.
>>
>> This allows more flexibility with domain creation.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v3:
>> Or-in CDF_hardware for late hwdom case
> 
> Except that ...
> 
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -820,13 +820,18 @@ struct domain *domain_create(domid_t domid,
>>       d->is_privileged = flags & CDF_privileged;
>>   
>>       /* Sort out our idea of is_hardware_domain(). */
>> -    if ( domid == 0 || domid == hardware_domid )
>> +    if ( (flags & CDF_hardware) || domid == hardware_domid )
>>       {
>>           if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
>>               panic("The value of hardware_dom must be a valid domain ID\n");
>>   
>> +        /* late_hwdom is only allowed for dom0. */
>> +        if ( hardware_domain && hardware_domain->domain_id )
>> +            return ERR_PTR(-EINVAL);
>> +
>>           old_hwdom = hardware_domain;
>>           hardware_domain = d;
>> +        flags |= CDF_hardware;
>>       }
> 
> ... this isn't quite enough. You're only modifying what will go out of scope
> when returning from the function. What's at least equally important to OR into
> is d->cdf.

Yes, thanks for catching that.

I'll move d->cdf assignment to after here instead of or-ing in a second 
time.

With that, it seems like it should also be removed from old_hwdom?

old_hwdom->cdf &= ~CDF_hardware

Regards,
Jason

