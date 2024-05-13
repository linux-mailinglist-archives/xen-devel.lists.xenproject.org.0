Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344098C3A85
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 05:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720672.1123584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6MZv-0007Kh-Tp; Mon, 13 May 2024 03:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720672.1123584; Mon, 13 May 2024 03:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6MZv-0007Hw-QI; Mon, 13 May 2024 03:42:19 +0000
Received: by outflank-mailman (input) for mailman id 720672;
 Mon, 13 May 2024 03:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A6re=MQ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s6MZu-0007Hq-Do
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 03:42:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca150923-10da-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 05:42:16 +0200 (CEST)
Received: from CH0PR03CA0211.namprd03.prod.outlook.com (2603:10b6:610:e7::6)
 by SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 03:42:13 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::29) by CH0PR03CA0211.outlook.office365.com
 (2603:10b6:610:e7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Mon, 13 May 2024 03:42:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Mon, 13 May 2024 03:42:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 12 May
 2024 22:42:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 12 May
 2024 22:42:05 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 12 May 2024 22:42:02 -0500
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
X-Inumbo-ID: ca150923-10da-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMySr3I2YBydBi7ozd2MjjHNtOfQm4n81gJYRRfWHZF6KKacl+UvjrZVk+xY1X11e1DbHCOVxO4we+Vs/lg5mlnuv5/UzK+8bciInx7X+IZxzDLfHKkogdvwOEbIbra94/HcbnzHKpMRzUFsv8YswdzSLo9tsF1mPn/bwEu1Gz/VpWWjaDPiKLzhtP6vVadYzM5dcF2560dpHk86RnVKnj31pNgIJYIoKI19LUs76InpaO5Hgz08+FyzikO5Pz0bWimcFyi4vudEuFqro4ZijH3FLzHTyFZEcq8dYfybmw6ec6YaMph7QTslTysbQGPNscqqL/ZfOgUnWQN3jk5NZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpVhZr3pJ/2KnxJu5+W/8YpRxSFTY/qNwTc7kC3HGOs=;
 b=V68Ml4Rgdg99TL+hEgzoH5DjxbvYJ5bFSdw+VSiJfaL7x+Bm60Z1ijaMyeivU2SG+D0w+UK+3x2tc25WBmqu4KIsB5VtrS5Xjv0ggeME4EJg/jJZqLn8MjpS1ONURhnd0MXX8TW2Ao/+CXUFy5b92WoEn6+X/UPS20qAqHo4LbOrMvF/hw3e8oC8vN+9u9NJ2yvvZu59/OXto/Ns5HRbZCORtD8NAPgIXxSBHV4dAgqKtE9sHzt9GEJj8QulYw+z6ledn8cfSKxGgbF6sVjnmmi4fHST/mRLUlJldVU1VXtGd3cAApyqP6wM/0qPBhY6CtM7LIZ5E0pLHsFkFj7JYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpVhZr3pJ/2KnxJu5+W/8YpRxSFTY/qNwTc7kC3HGOs=;
 b=fRE/IA9cVNzuU/vfhBs4PQc2Rzf67hxx76RyUXTxuC5FA8JxFmQYozvPl1EDwAVQivLjuukdK47s/mGgNKgaVUXmAcaq+C2em+bY9LMHbyNEezV1OW/CeF4OO2FzYEqXvcamra8Kcg8QCpbaY0i2RyMiRU0ScFjjAKqV21owZ4s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fad20165-ad8a-4bc4-be5f-e95061a57a2d@amd.com>
Date: Mon, 13 May 2024 11:42:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: Alloc hypervisor reserved pages as magic
 pages for Dom0less DomUs
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
 <20240511005611.83125-2-xin.wang2@amd.com>
 <686ba256-f8bf-47e7-872f-d277bf7df0aa@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <686ba256-f8bf-47e7-872f-d277bf7df0aa@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc9c830-ffa8-4b42-517f-08dc72feaccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlU3S1FCRDdoY0E1Vlp0RldtT0ZQOGxHaE9lNFpJNHJBTXp1ZFVTa1FZbjhZ?=
 =?utf-8?B?L3hrOHZTYXdyT1hoQWRJQk5NZGhoSXBtR21QelhOVEx6ZHhaakpDb3dlcG01?=
 =?utf-8?B?OHBFbHA5RzRJUGlsZjU4OUJUVXNQeWFISVM1aE9hYzk5N1htRWI5Q01YeVBn?=
 =?utf-8?B?ZWFOMkhJTm80OENPb3BkSHZkSC9ZTVpSSjlRUGxTYWRabmc0bWMwM21MbXBQ?=
 =?utf-8?B?VUJCL3Uyckl5WkpNeUpsSzc3ckNId3B3d3RCMXVuSTNWbEZmMmVrK0ZrVzZT?=
 =?utf-8?B?YXFzSU5RSStwZXhyb0N0a2djWVZSVGN1d0xSV29IMzNzeWR6SENXTGZOdnpP?=
 =?utf-8?B?emxzNGJTRElhUk9JMmNOQnp2Qm5IWXZEMHd4RWNWVjFGREJ3TWZXMjRleTFp?=
 =?utf-8?B?NHNkaUdFM3QzQmFraXk1Qk5KdkZQM09vdVJKRG5qMCtWV1BYYWhML1R5a21U?=
 =?utf-8?B?c0RPVlBIbE12bENuL3NXb3N3QVN2OWFRejNTems5SnZTVnI4M1VnSHpQTTMr?=
 =?utf-8?B?bjR3QTNHc3hhNWwwYlFRT09WMEFua3V4aE56amVEV0w1ZExWVW5Nb201Q1Fs?=
 =?utf-8?B?VVM4QXdRRHlDSW5FOGdXcnZTTVBPRWFKVUllTUVvazlPT3B3czkyZTV2RERF?=
 =?utf-8?B?ZlByUXMrWWF2d0N1dDZzWW5TenhNNDRmM0NaVGpiSVc3cFJvdnlpd0Y0Qk1Q?=
 =?utf-8?B?WlVzbGhYOEJrSzB6SVhwWklhamg2UU50dU9Gc0VJUGZZZExYS1Y4M0NhR3lt?=
 =?utf-8?B?RHo5MzBaMG1rWGFmQ2UwRG9IeXUvcGF1dTVsZklURjdkdzhGNk5GeVdkOEtz?=
 =?utf-8?B?bFFhR09mV1RvYWNENUxzd08wWFVxSExtb1h1Rm1GK3BPeUR4a2VObkpjRWkw?=
 =?utf-8?B?R0VYa1dzS0gxTGFJcThCT2MyQ1d4TkxJL0kzY3AzZkRiRGc0Rkt5bjVTN0R3?=
 =?utf-8?B?bnN6dnA4L25QUEMyLzBYeHFobm1aMWh0dHRqM2d0bXRTeWE0N3IxcjVsbThK?=
 =?utf-8?B?VzZ0RllVQ05aUlpxR004dDRNMXdLWkk2Y3ZETGFENmVkVjhEbUl5OEJ3Y0FH?=
 =?utf-8?B?S2hDc1pSUFVrMXZ5SW9RQWZRVWlwdFFVOUt5VVZYVG04Q0lySzlTRnA0cDlu?=
 =?utf-8?B?YnloU1ZPZElBSEVNaldCNUpUU1ljd1VMeGRGR1poc0tuLzYyY1lORU8xQlVF?=
 =?utf-8?B?c0VPdE40YlR5UEtjTWxrSi9iL1BwT2JOVXpjZ0tjNDBGUFBGVTA4SFV1Zmhx?=
 =?utf-8?B?cHhURm42alpwVGRGUFNtNlphZHpFUWhjZDk5ckMrMVVMVVpUQ2NwaW41Zjkw?=
 =?utf-8?B?Z2Q1ZDhvNE43VllHcWhUdDlzdFFiTkh5cDNLM2NyaER5T0pzL1E4d3BROGZX?=
 =?utf-8?B?Uk5XWmNpR2JFdW13QTk1MVdrYWg1QVZ4Z0xjRW5UMjJiM1VMUngrN1VUSVJs?=
 =?utf-8?B?WVRTeEFBd2p3cGZVdHIwVkdZdTN4am1YY1Q3Q2VFakVMUjdIWFlxMWZSdktK?=
 =?utf-8?B?OWtQQnNiSUlobnRYaEpRcFdWclVqbTJpT2F3M2l2TFIwcXQ2VTVEWjBPRFhG?=
 =?utf-8?B?V2JSWnVQNWNzOWpUT2w5QXF6VythZG9YM1ZZcmRCSGxYTkdqblNoS3pnMDNK?=
 =?utf-8?B?MG0rY1VQRW1ERjR3U1pLS1VVQ0xzQ3J4NWNUU21YVVpCNk5aNXZCS3dXa1NS?=
 =?utf-8?B?NlErLzdJTEl2eDVqcjV0OU0zc3NDcGhHMnQ4UXZZSW0xUmE0QkozclZtTDlq?=
 =?utf-8?B?NXRUdG9HRTRYTjNFaFhkb09XTmQrSzVPZUl3SklDQ1RzV3hqejdQMUFXTzV5?=
 =?utf-8?B?dCt5SWRkK2h1VUNlSnRZeGUvNHFkZ004bnppSXliQ3NXN2JBcnQ3TmwyTnB6?=
 =?utf-8?Q?K0s2J7Ien6ZaO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 03:42:12.5514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc9c830-ffa8-4b42-517f-08dc72feaccf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023

Hi Julien,

On 5/11/2024 7:03 PM, Julien Grall wrote:
> Hi Henry,
>
> On 11/05/2024 01:56, Henry Wang wrote:
>>   +static int __init alloc_magic_pages(struct domain *d)
>> +{
>> +    struct page_info *magic_pg;
>> +    mfn_t mfn;
>> +    gfn_t gfn;
>> +    int rc;
>> +
>> +    d->max_pages += NR_MAGIC_PAGES;
>> +    magic_pg = alloc_domheap_pages(d, 
>> get_order_from_pages(NR_MAGIC_PAGES), 0);
>> +    if ( magic_pg == NULL )
>> +        return -ENOMEM;
>> +
>> +    mfn = page_to_mfn(magic_pg);
>> +    if ( !is_domain_direct_mapped(d) )
>> +        gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
>> +    else
>> +        gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
>
> Summarizing the discussion we had on Matrix. Regions like the extend 
> area and shared memory may not be direct mapped. So unfortunately, I 
> think it is possible that the GFN could clash with one of those.
>
> At least in the shared memory case, the user can provide the address. 
> But as you use the domheap allocator, the address returned could 
> easily change if you tweak your setup.
>
> I am not entirely sure what's the best solution. We could ask the user 
> to provide the information for reserved region. But it feels like we 
> are exposing a bit too much to the user.
>
> So possibly we would want to use the same approach as extended 
> regions. Once we processed all the mappings, find some space for the 
> hypervisor regions.

One thing that I noticed when I re-visit the extended region finding 
code from the hypervisor side is:
When the domain is direct-mapped, when we find extended region for the 
domain, we either use find_unallocated_memory() or find_memory_holes(). 
It looks like the removal of shared memory regions in both functions 
uses the paddr parsed from the device tree to remove the regions, which 
indicates there is an assumption that when a domain is direct-mapped, 
the shared memory should also be direct-mapped. I might be wrong, but 
otherwise I don't think the extended region finding logic will carve out 
the correct shared memory region gpaddr range for guests.

So I think we are missing the documentation (and the corresponding 
checking when we parse the device tree) for above assumption for the 
static shared memory, i.e., when the domain is direct-mapped, the static 
shared memory should also be direct-mapped, and user should make sure 
this is satisfied in the device tree otherwise Xen should complain.

If we add this assumption and related checking code, I think your 
concern of clashing with static shared memory can be addressed. Do you 
agree?

Kind regards,
Henry

>
> Any other suggestions?
>
> Cheers,
>


