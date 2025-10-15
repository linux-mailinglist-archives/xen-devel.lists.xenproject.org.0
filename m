Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF8FBDFD29
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 19:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143829.1477433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9556-0001kK-EG; Wed, 15 Oct 2025 17:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143829.1477433; Wed, 15 Oct 2025 17:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9556-0001it-BE; Wed, 15 Oct 2025 17:14:32 +0000
Received: by outflank-mailman (input) for mailman id 1143829;
 Wed, 15 Oct 2025 17:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nzz5=4Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v9554-0001in-Th
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 17:14:31 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67d06bfb-a9ea-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 19:14:28 +0200 (CEST)
Received: from SJ0PR03CA0215.namprd03.prod.outlook.com (2603:10b6:a03:39f::10)
 by CH3PR12MB8902.namprd12.prod.outlook.com (2603:10b6:610:17d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 17:14:25 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::24) by SJ0PR03CA0215.outlook.office365.com
 (2603:10b6:a03:39f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.11 via Frontend Transport; Wed,
 15 Oct 2025 17:14:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Wed, 15 Oct 2025 17:14:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Oct
 2025 10:14:24 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Oct
 2025 12:14:24 -0500
Received: from [172.18.10.234] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Oct 2025 10:14:23 -0700
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
X-Inumbo-ID: 67d06bfb-a9ea-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzWRwPC31Si1FPMxD0WZUC0EF2Wc26USVs0+kYAq/95fjX/d5+697QqAtnp74j2pUfSRahz3isOEFfgwOBdUrti9Uo9Sn0Qd7RxxWW4sD8RmyUz8ZX9kANrmJPUS0pmalAcXyb8L1HFs3oyuf/d38ywQkeIiOqgS1ozTXOuRfCocPjfRgwA6HgrE9pqHJkUWRgKjMU2q/0/cUuaVtQ4DOTpQACp1nRqbqvpbofh1733ZO9uqum6IyL3wR0NihD6r+hjZ4EzNN+TqQ/lOPrgW9nNzVcbY6VILS/i2/TADtTpJmDcqLXvvMY+jYOkqW4DCI7CFDTa09cWG6OYKOC/Mew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+fHBwsUsHRxHxzb+whFumPY0A6HjUkQ3B5uEWEf6E4=;
 b=l+6l5DsDoQARh3TUZWMs7Ta21IQCzvkJwrF+aMTDDbYXNPGnRApT9nYa8/4jrEgVKHiwD6a8hhyKLGAioVLJB5YNTp+eVDdprBPBvy7MAUivwwhfaSsq1s3IwUIcsSm7VicmtNtueBz+bYRMHPJmtvvrPi9lfYHMUr6bMUHW3yB5bnR1NoDrNzGnddeuNY6DgyEIY7E+SaVzHJDALPSMm4tdSPzxJO3WdQq9SO6uLR1JL7uQvRYvDMJs3L/69YTCghUjXO3RAGInAM6s71E0edWa3h64v0W/gaya/a9o88sYF5S33bqh/ouYoacr6oN5GFsYcrepFBjhwqRuRMHdfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+fHBwsUsHRxHxzb+whFumPY0A6HjUkQ3B5uEWEf6E4=;
 b=WwayfMDkUcu3tvLGYIO4LenHDHlgLB3XDtsB49otggv9bDP+Qkafq0gdMtghOLXyvZ4K5ERoUzV2PsZnW+deWsSOBVkNAVDsJsyIBHfyyKuiODi3lBsiWH484o0Qq2dfq+ggO11kcdlA8S9/HT3cOTSFdiITSIoIv2TDkMx39AA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a4ee443a-cf65-420f-9508-d7f34393316b@amd.com>
Date: Wed, 15 Oct 2025 13:14:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251013211106.8720-1-jason.andryuk@amd.com>
 <aO39pb3L42ktBol_@Mac.lan> <d8cb0b5b-fbf6-4db0-ba70-f5a612e63cb4@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <d8cb0b5b-fbf6-4db0-ba70-f5a612e63cb4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|CH3PR12MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ac317b-5e5c-4ee5-b902-08de0c0e4a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0JjQTJyWXhLbGhrTDZCZDJ1QjRIUWswYk51WEM2WVJNTVV6QTl3NGtaRVQv?=
 =?utf-8?B?YmxmaW40U1dSYmdrWDFmYUtQdDY0K2JBR0oyWEhNREJJZjlYRUdodG12UnY4?=
 =?utf-8?B?NmtRU2V1d0k5K1RJNVNaV0U2czYwdVpmSnQ4aVl0Y1BSbFp1NGNueE84b09I?=
 =?utf-8?B?eFpGRUY4VnUrRzdmWW5vSGtwOS81OS9hbERFMUdDZXpPVzJJeXVyVUEycmE4?=
 =?utf-8?B?M1g2bGwvY3BqdkNObFV1OC9hN1ExTE96eWlQQlZ0N0RXcDdkemQvdHlPK0Vj?=
 =?utf-8?B?ZVR1V0ZoditjWFp0b29oZmZqdWVjTzR5bVRQM0xFYlNQelNFNVlmVWc2TEZF?=
 =?utf-8?B?VUN2clpqWFY2aDJiaVBQMStwN2hIU1MvZ3QxcXpvZ1RxbFAvbk5uVDFONHBy?=
 =?utf-8?B?WUtkZ2k1TkhVS1JsWWVBY3dva25yVXhnQXdzMlZ1K0I4cVNhMGV4dzNFdkRO?=
 =?utf-8?B?YmdHZnBoMnEyUitrTTB5L0JXMFBYd3d1bzhOaEFGUmJUazhZR094WURYaklp?=
 =?utf-8?B?VkJhNXIrb3B2S0VsREg0cXllNTBjeDY5aGhVaVFyb3JCakQ0VmpTSHVnR3d0?=
 =?utf-8?B?SUhiK1BxK094bHRKRkhDbTRHTm9hdmdTdmM5T1lQYnVna0l3Y1hBYytRYnk0?=
 =?utf-8?B?eFY1bGo3UWNzazJSeS9GM0w1YUsyNm1lWmR2d1VDYVRrZzdvNW5LUlJiVHlK?=
 =?utf-8?B?MHVDZThVUGw0cmZjdlNONVN3czN4SkFwZWUwR1F6akRGUVgzYXdFR0s3aGJi?=
 =?utf-8?B?UVhhc3J0R3JpZGJ6U0MweTFPR2QvRDJ5MGZwQXFRYjVvSXoxakJ6MUJzSGdG?=
 =?utf-8?B?NXV5aE4rZmY4dE1lMGFXSTFMSHprczMwMHFQY1N3ZTVoTTdIUS9aQURrNHNW?=
 =?utf-8?B?cVdGVXFmTGhZWXlhWkphNUpieWI1N2RsdGFCRThZRU5PTmd1Vi9QZkd4bXZO?=
 =?utf-8?B?UHp2aEd2V29LbHA5dHdwU0hydDFpeHg0RXlFM0hGY290Z3p4eEJNclk0dVZl?=
 =?utf-8?B?VU54dTdDN2F0L0JoOFVFa0tscGRmMU9UcHhvMm0yWEtiTWovaWIzMDZvRXJZ?=
 =?utf-8?B?dFNTNXJ6M0FuNEtGMDVWMCt1endvdG1MNXRXZlRLWDVrODhONEptSzJhK25h?=
 =?utf-8?B?UmJVdzFhcDNQV2lWM0c5NUdUSzErekp2T2NPdUhUREJXNHN1Z0M2WEVYTHJl?=
 =?utf-8?B?WWFWQk1KTWxCZ0VyazYzMjZLSFBkSE8zNDhKN1FlbmRkVVcyUzE4blZCTXFx?=
 =?utf-8?B?RmJEZTNVaVc1VmQxaldMYjdtYXpGNUxHazQ2eENQMXM4c08xd2h2SkFPL0Ni?=
 =?utf-8?B?MGxEM1R6N3M1NjY0cWthZDcyT1lyYjRJMFhUZjBhVU9ObGFtS0tzY2EvT0Fy?=
 =?utf-8?B?clZWS1BvTmVaMzNUTi9HRDc1V0Rsais2VjA1TDZERzhKRVZ6R09RR0Nmdkli?=
 =?utf-8?B?MU1jSkJxdFV3THN2QUN5VlBxS3Zrelkyd2YwTFhwSUF4NGJkNXZZMFRrSS8x?=
 =?utf-8?B?VGRWNytLK2VscVJGL2JIckxsVm5GYUxqSkdVL0ZQK05VdGQvUWNuR3UwMDJm?=
 =?utf-8?B?bkl5S2lBQm5uZkpXdG9ocTdPUlltQTRETGxzQUh6b1dJMit2TjcwM2pyaDlz?=
 =?utf-8?B?U1JWMkpNdUoxeUhWcDRLbDhoWnZOU2pPc1F3SFltcGhicUlqYXBLKzlXM2lj?=
 =?utf-8?B?cWZJMjh5SjlZS3g2K0NvUlpLS2ozY09tNkFtejlST1ZtV1Z3Z1NWMzFXWGgx?=
 =?utf-8?B?MU9kRk96VzllME1IdVFSNk5FR3RyakduZjFaZUl1M21UNEhYS1l6dXkvQUN4?=
 =?utf-8?B?eTdzTDNrTktpVXd5dnl4YW5tVXBQY2xSczM1czlHMzl1VVIwcEdUU0R3VGZI?=
 =?utf-8?B?a3I0UU9xRk4xdEJiYUJVanlKK25VREdaZ0ExU3ZLa3FsekFxRUR3eWRTaEY5?=
 =?utf-8?B?WmRQZUwvcXRlVWd3eEtKQ2RFQmJiVlZidlNGcTFaRm5vNTkrRytHdERZVmdD?=
 =?utf-8?B?TjQ4akRhMzlVTG9ubU0ycGxITFNXaGl2ejk0WU9URmdvOGhZM0pxRjZRWWxM?=
 =?utf-8?B?ZitIMzNubEtoc2pOSGI3MStxaGw0emZPNXAwaE5IRzI0ZTVLaGtLZmFBNVNU?=
 =?utf-8?Q?EzxU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:14:24.9885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ac317b-5e5c-4ee5-b902-08de0c0e4a71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8902

On 2025-10-15 08:59, Jan Beulich wrote:
> On 14.10.2025 09:37, Roger Pau Monné wrote:
>> On Mon, Oct 13, 2025 at 05:11:06PM -0400, Jason Andryuk wrote:
>>> io_apic_level_ack_pending() will end up in an infinite loop if
>>> entry->pin == -1.  entry does not change, so it will keep reading -1.
>>
>> Do you know how you end up with an entry with pin == -1 on the
>> irq_pin_list? Are there systems with gaps in the GSI space between
>> IO-APICs?  So far everything I saw had the IO-APIC in contiguous GSI
>> space.
>>
>>> Convert to a proper for loop so that continue works.  Add a new helper,
>>> next_entry(), to handle advancing to the next irq_pin_list entry.
>>>
>>> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> v2:
>>> continue (not break) for pin == -1.
>>>
>>> I added the next_entry() helper since putting the expression in the for
>>> loop is a little cluttered.  The helper can also be re-used for other
>>> instances within the file.
> 
> Would this intention ...
> 
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
>>>   }
>>>   custom_param("ioapic_ack", setup_ioapic_ack);
>>>   
>>> +static struct irq_pin_list *next_entry(struct irq_pin_list *entry)
>>
>> I think you can make the entry parameter const?
> 
> ... possibly conflict with such a change?

I changed only the parameter to const, and the return value is still 
non-const.  So I think that will be re-usable.

I placed next_entry() immediately before its use in 
io_apic_level_ack_pending().  It would need to be earlier in the file to 
be used more.  Should I move its addition earlier?

And another Minor question.  Roger asked for ~Linux style in the for 
loop.  But in next_entry() I have Xen style:
     if ( !entry->next )

Should I switch to:
     if (!entry->next)

?

Thanks,
Jason

