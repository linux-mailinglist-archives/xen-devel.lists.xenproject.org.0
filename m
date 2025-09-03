Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360FB42890
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 20:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108880.1458854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uts3J-0000qO-UF; Wed, 03 Sep 2025 18:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108880.1458854; Wed, 03 Sep 2025 18:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uts3J-0000oL-R7; Wed, 03 Sep 2025 18:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1108880;
 Wed, 03 Sep 2025 18:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3qU=3O=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uts3I-0000oF-MG
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 18:17:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:2417::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49cb575e-88f2-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 20:17:46 +0200 (CEST)
Received: from BY3PR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:39b::21)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 18:17:42 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:39b:cafe::b9) by BY3PR05CA0046.outlook.office365.com
 (2603:10b6:a03:39b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.6 via Frontend Transport; Wed, 3
 Sep 2025 18:17:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 18:17:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 13:17:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 13:17:40 -0500
Received: from [172.31.134.167] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 3 Sep 2025 13:17:39 -0500
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
X-Inumbo-ID: 49cb575e-88f2-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6Nhg/ZPY0ZXFZosz4rJzzM7bquv3KbfbTzpuzJK93tVw1PAUKbKGSQettrTsk/oMi2jPn9ocDjvpCGOoVMs8MXCpM5pG+SLB1m9ABMDO2vqvcwq08Pw5aLO3/dz3bEOWRygOByZd/Q+mq1OTIjdXIqesZ8Q7GYy1w2CFCAWM7C60XTOyWjAUjT+j1gJncGGIjWcffJhHMocw/FKhBl5uZjGSl63LNNZuXhCvxxVRT8gzu+K0waah8TiCz8pPa/aGkHFbVvFNiPy3UU2z5K8oy3s1CoweZRZeNQLQ6cenp36K5X1L5ZsjhUrJfxnK7RdXXMGLyQRkZm1zPwi1PqYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVR4KN/qTSmiKDA1hftFzD4YihUfYSCWsMeEvYvgLRQ=;
 b=xf5vzeVpEblkdZtRf5jMG0j8xBOQLvJNlWVkWe7e0pStK9b02B5vRqGSnyz475E1ujU2O7BhNq4hWTgJ0g6fNT4EnFOpjmBVZplLBpXRvRAP4IU4LsofaDKGdnZBipTiIsdAx+IUfo7aXm8zWJtje1dHsjF6MPMTWyl+q+f3WJkD5UNzKF8zhDwr0ckqL40X1cHmgaAKd7XYx7CBJ2shsgL3dOjM7Gg51ahmuuiTaHjUegaP0kfq8JmldES6B7AIs644nJqjBT+t/gzzHHLt6GfKLMChtpNTt8r4WqugBhq07PdOxYIZdrCY6oTxEXOw90HTLZLPZ04jLcSTghdMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVR4KN/qTSmiKDA1hftFzD4YihUfYSCWsMeEvYvgLRQ=;
 b=WNsvp8IFfMuXo3dYG4QotasYm71501A0mlhCVhfl+AHa9tCYGf/zhFSz2/tS02iu2N4NsZNbggWKRKX4mk9cKRAzgwO1keUAzb1Bq4KsJDwDDQdUotRyMRkHiYhoR0n7abLdF9IXnKs07Y8KxmPadBmoosbdyXwDcfoL1Gi8iUA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8ab89125-4693-4d9a-b9a3-b8ab38b1908f@amd.com>
Date: Wed, 3 Sep 2025 14:17:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: "Penny, Zheng" <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250828100601.1777197-1-Penny.Zheng@amd.com>
 <a855a0b4-21dc-4f63-9849-6e5c7ec2e6b3@suse.com>
 <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <DM4PR12MB8451C7146814C9C359B078B5E101A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fb2cd8-1298-4887-91e5-08ddeb162c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTNzcG50TEJCcHFFNTdpMlVlZGxUUzdWUEx0NEMwY3M0eS9oMzRJeS83QjUw?=
 =?utf-8?B?RkI0M2F3clNMS0J3d3IxN205NlBQb1BRaEg0VFZPaGp4Slp5NU5hNHppQUJu?=
 =?utf-8?B?c0N1TjRoTU54Vyt5Yk5XaGNTUDJiNVZWckZOZy8rTVBiQU9HMlJmMDB4b0VJ?=
 =?utf-8?B?N2U1am82bDlUUVcvOU5salhSS0l4WWErYnBLZ0MwS2RGZTU4Ni9vQnR4VW1r?=
 =?utf-8?B?K2NMdUNqL0FBZkw0QzYrd3ZPa0JPdG9QbDAzWGRocVdSRENwQnVmWGVNZzRX?=
 =?utf-8?B?ZGFjT1JSWHEwaUZiWElwR1hGdFE4RkV4OGtXOUM5a3dIVDNRU0d5Vi8xeHd5?=
 =?utf-8?B?cW5pY3V0MzI1aGpxTUtSMStEcUhjbk1hTGdDRDVwV1FXcnN1SEJMdElGNi9B?=
 =?utf-8?B?SlZtRjBRQUJYdE5EMlhubDlGVE16UzNzaXk5ajlFakU4bFViSDQrVHFCOFdi?=
 =?utf-8?B?c1NnUG1ETmFDck9WUSt4MHdReEgvc0Fab1JtQ2tCRTRDWHltUkFvSllvdjJC?=
 =?utf-8?B?TG9iYVo5RU5HUHEreGpGNkRKc0VRa2UxL0NsenIyd3dOWnpkcFpHN3hmYktG?=
 =?utf-8?B?cmFuWUVoVlI4dDlySHU5b1pLZkxCTGQxcDNGNWpqUmZPOUR2NFI2VDlXSU9C?=
 =?utf-8?B?RFNBZnJwTlBJcU4rbjRzZ0w2L1BIellNczVHeldwTzAwTW5GOEdudUl5anFF?=
 =?utf-8?B?VDd2aGFKNkhSUU11MituN09FOWM1TC9DbGlzejAzbm1aRDVpUjdIdUx0UDVX?=
 =?utf-8?B?VWRRdUtnem5KVnBLWDkzNTJ3UzNKeDllcDBQVmRGQXdkZTFUODF4MW81dDBj?=
 =?utf-8?B?cjNxRHozNWh2cExNWEtYVUtZRHd2a0VEVUJXYnpQenFRVDdlL3JLL2FzU1JB?=
 =?utf-8?B?NTNrUy91M2w3VEIrdVRIWkY4eU1GNjBOaDBPM01QdXJ6bFpSMGJtQmhYemFY?=
 =?utf-8?B?N29mQWw5eDN0MHBNUnpObklWbFFTTDNWekFNU0N4ekxpNzFNb3c2TERaUEFK?=
 =?utf-8?B?SFZMeGl1SHpiaERCcXFVdEk1STQrdDdTTjF2c0JHMnhOdm5LL1pKTWR2TEJC?=
 =?utf-8?B?OWZ6aVAzZVdPYWZLSlFTWERYU0JsUTJaZjB6aXBPd1pwaVNONUFvaVVzYURm?=
 =?utf-8?B?MzVsd1BNRzlLb0tKOGtLcUdNNWFWSFZydFlIMEc3RzkzWFdvczdwa1dPdkNt?=
 =?utf-8?B?a2Z5OHN5L2tCc3RPSEdYbFhyUVZud0tDcGluMzgxSDdZS3ZMU0FWVldwZkNL?=
 =?utf-8?B?bDd6c2VkZ1IrbjdxUkpKSmdUS2xCZytucWp2ZmpXQW1QeWR0Z1duOGxWYW9n?=
 =?utf-8?B?V3hBS1VzaUd6QTJlVEJFQSt2aGpsMWhEV2ZrWmgzdmhJYUY2WVdmUzUxNEYr?=
 =?utf-8?B?c0pheU0wbjZINGswd2d1YkxuRjFlMEFUM2QyRDVCeGVNSEVrUnVzb3BCd2JD?=
 =?utf-8?B?cVNBSDVBbWVzRkxOUk5FM1JuS0ZjU21ubUtzdVRlaUdmZmNDdWxBaW05UElJ?=
 =?utf-8?B?Q1FBRk1mQlRnaXVzZ0FLV1c0VjVTWmxWSWJnZTJSVTYzaG1HWHlqM3BSSlNo?=
 =?utf-8?B?YitpL3FrU3R0V3ZoT3B2TXRPcGhEaHgzUzByWkZQZEl4d1RueXJVZyt5cVcy?=
 =?utf-8?B?NURiblpOTUhQUGdJVEtlRkdpVWtKcjBiZ0NldjdoVnNzVDZ6b1pHT1NRd29S?=
 =?utf-8?B?U25aUjEvbmtVUVJybmNkQTN6cUJxL2xrRURPaGExWGhtdnEyTUh1QS9IaEJ6?=
 =?utf-8?B?Q0ZhaWtiUUNwdk04UEpOQjNvcU1iMEdxS0grTHY5VnAzaDcwVitDZEVUUi9L?=
 =?utf-8?B?TFVPWTNJUUFWV0pyT05lSEVTQXlyTHBBcHFGZGF6RWdjMzE0UVhvT1piWGhr?=
 =?utf-8?B?SzIwalQyOHkyajRodGFFMWVES2VyUjRGWVgzOU13ckxtUGJDWTd0Y21HWEJw?=
 =?utf-8?B?dFBxVlpXUEV5Zmw0TktXY2g1cVBRZG1LRDF1a1VwaE1GVVdzQXpLU3l3V0FJ?=
 =?utf-8?B?TWNHaFgxcE5GR3FZSEhqaHJjdHhVK3FiclUvaFhESXZOLzRva0tjSUtYN3NW?=
 =?utf-8?Q?b7RDBN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 18:17:41.5638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fb2cd8-1298-4887-91e5-08ddeb162c07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163

On 2025-09-02 23:14, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, August 28, 2025 7:07 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Andrew Cooper <andrew.cooper3@citrix.com>;
>> Roger Pau Monné <roger.pau@citrix.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
>> xen_sysctl_pm_op for amd-cppc driver
>>
>> On 28.08.2025 12:06, Penny Zheng wrote:
>>> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op
>> *op)
>>>       else
>>>           strlcpy(op->u.get_para.scaling_driver, "Unknown",
>>> CPUFREQ_NAME_LEN);
>>>
>>> +    /*
>>> +     * In CPPC active mode, we are borrowing governor field to indicate
>>> +     * policy info.
>>> +     */
>>> +    if ( policy->governor->name[0] )
>>> +        strlcpy(op->u.get_para.u.s.scaling_governor,
>>> +                policy->governor->name, CPUFREQ_NAME_LEN);
>>> +    else
>>> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
>>> +                CPUFREQ_NAME_LEN);
>>
>> Isn't pulling this ...
>>
>>>       if ( !cpufreq_is_governorless(op->cpuid) )
>>>       {
>>>           if ( !(scaling_available_governors =
>>
>> ... out of this if()'s body going to affect HWP? It's not clear to me whether that would
>> be entirely benign.
>>
> 
> HWP has its own unique "hwp" governor. So, imo, it may not affect.

get_hwp_para() writes into the same union:
op->u.get_para.u.cppc_para
op->u.get_para.u.s.scaling_governor

Which is why I avoided it for hwp.

I guess writing scaling_governor first and then overwriting it still 
ends up with the same data in cppc_para.  Seems a little messy though.

Penny, I'm confused by this comment:
+    /*
+     * In CPPC active mode, we are borrowing governor field to indicate
+     * policy info.
+     */

You have CPPC active and passive modes - which uses a governor and which 
uses get_cppc?

It seems like only writing the scaling governor inside
if ( !cpufreq_is_governorless )

should be correct since it's using the union.  Am I missing something?

Thanks,
Jason

