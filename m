Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6194D87FF16
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 14:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695396.1085112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZro-0005rx-QU; Tue, 19 Mar 2024 13:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695396.1085112; Tue, 19 Mar 2024 13:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmZro-0005pU-Li; Tue, 19 Mar 2024 13:51:00 +0000
Received: by outflank-mailman (input) for mailman id 695396;
 Tue, 19 Mar 2024 13:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7vt=KZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmZrn-0005pO-5z
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 13:50:59 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b545c282-e5f7-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 14:50:56 +0100 (CET)
Received: from DS7PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:3bb::22)
 by PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Tue, 19 Mar
 2024 13:50:40 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::ca) by DS7PR03CA0077.outlook.office365.com
 (2603:10b6:5:3bb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Tue, 19 Mar 2024 13:50:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 13:50:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 08:50:39 -0500
Received: from [172.21.115.105] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 08:50:38 -0500
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
X-Inumbo-ID: b545c282-e5f7-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksMnGQoHXRuTd7VJE8kSr1LiGxTbIncU0NG4Wj1YWvLtjgaFIO9kT4etf8yTzn7L2Z+tYxISa0Zb8DLy7KJQfRes2QHp4ShTMEEushJfOLTi+YSbLaJohjkPoMBsnZ20qxj6LGAYlTV7r/mwRrvQmIt3k8gFled8g/ogcSvWIJ2OCDal0SlcZjcvY2RAlavgJjvOuL2oL4T+XCgwDY/gd9c2K8AQziHodgaleWaGuPQ8kRGlrqyc85iCGAUW2FmCS/6nOaT8BgBSbAM95YCHCZFoj4ebKLRDigggmscuRh3UkR/MtOfEhCInQWCjn9ebDSdtYETOtF9cB/Eo68gDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxZJ1cpPIu3+aUkREpmAJNKOP0nGyjhxGXKT5XyKIWE=;
 b=DVndPCYxVHL+42N2fKvphUXgiNNTI4pEuvLOmpjUIhaWgOCO/FM5fVrXsZ4kAczdSmjafeJau32lP51fmoX+17WXV++LHNHkLH42vhH1XIJ43Co2XU6feQIzqtbnk5iPq7obE0Qi/Wkjzqp3uDkJKVzoX+WG7owwskuw/XaK6/mBczp3+/5TgdVWk614Myk3IIzTPSuqrP4fDxWD2ox5nu9GqnhoWdAYhvoHyN7AW3rx0P0GB5hRUSlS8zpbGrdopWbDDsJQJ1d97Mtmc6nnbP+FnhHppqKO6u7HHRbOCjkIM47h0dPGZA8QLD4Iyvx6I6p8jwgOq3qWugXDNQfYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxZJ1cpPIu3+aUkREpmAJNKOP0nGyjhxGXKT5XyKIWE=;
 b=yFl4S+OMFbUG+rP3cEBLlCz4D4Zi/++9RHGa5VkbNAe9gnD82QUXAhbeSmTHWCf4g8oVIdq0IGQBmGyVFK4CYyJf/xmdYBFi4TAfMJyq454Vzmh9WWSPu1Pt6Rbq3300alw0a3eldgbHJDcgzq0/KnMfgczv7mjVXhCYB08hq90=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3b06e858-7fb1-4f99-a235-b33ed48c0e32@amd.com>
Date: Tue, 19 Mar 2024 09:50:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <12fe48a6-6957-49d7-adf5-1a3ac8b1bfaa@suse.com>
 <7506abe0-e3d4-44f7-b54d-592ae2e3fd3e@amd.com>
 <88bd8577-42e6-4087-9888-00cd73e7f0bc@suse.com>
 <c16dcad1-5310-4e90-8045-02c0893f6814@amd.com>
 <ba2f4e13-d599-4376-933b-c23c0d6e6dbe@suse.com>
Content-Language: en-US
In-Reply-To: <ba2f4e13-d599-4376-933b-c23c0d6e6dbe@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|PH7PR12MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: f01b92e6-0506-40b1-9a8e-08dc481b9004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bimK15457pHidLw52jLhZtW1VajDrZAMz3SyXcLn1YnCOZjYhIIB0TcGS1Zm2A2S0xQfVY5uzvViGrlkD0xvmpfuagt5NSNt+fejY7muQnYc+/NVYMTLzIvobd6o2PWJjYqqr3ermYlKceAz1lP8oO6pY3U4zoAGggUdxJEZ8zCl1HQEQsLS6fFcKpbffmL8Kyap4Gu/wcAlR+Nh27L4NlI0rcyn9VASoivPq0QaBpzYwWhSbO8LKLZ89yOOZXBMuwKw01TSygZIVFlIsutMmxbROIgkSSawyZOsgNzzVGcceg3TgEdJcM6kt42BJMMkgXBBuQy7hFZ7rAykjzXDnuOksBBgHSzpBQmM8ty5hLo85aLVlgfTgQ74oPyX3SPcflCiFhlOJeKPaCJmcH21gzt/ZeGXjjiCRqmLztngodrb9ktcFF3MlrnrJyJz4Yx4Ejp72YaFzmaXoPqTEJBhYBK5jOGXP8Lf81v1CsXs8Xu9zsHlY45bv7QLUnd071DqNTEPHPQxWkKV+K6cYBL9kysKpIUDuZLH+lRkDayOHH35emrtV7wk2zAwwzSeL7r/cE6ht2Ho6RBZWMUBP8ecMiOa4ly172Q4TQRX9qO34nYJANS54/qRp3HOmbomwKEI6E0DXl1+tIomabXIdqoDXAtPZseETLBEhjfyhUaEi2HQ2cA4vm9Dzf9k67m/jsCm7SBk2/bfEoX/BXGliLfPza79EXYHKlFNCOLkkbI0Y0o07FsgK60BPBkyTkeK9Mn7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 13:50:39.6367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01b92e6-0506-40b1-9a8e-08dc481b9004
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952

On 2024-03-19 04:15, Jan Beulich wrote:
> On 18.03.2024 22:21, Jason Andryuk wrote:
>> On 2024-03-15 05:48, Jan Beulich wrote:
>>> On 14.03.2024 20:19, Jason Andryuk wrote:
>>>> On 2024-03-14 09:31, Jan Beulich wrote:
>>>>> On 13.03.2024 20:30, Jason Andryuk wrote:
>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>> @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
>>>>>>         return INVALID_PADDR;
>>>>>>     }
>>>>>>     
>>>>>> +static bool __init check_load_address(
>>>>>> +    const struct domain *d, const struct elf_binary *elf)
>>>>>> +{
>>>>>> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
>>>>>> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
>>>>>
>>>>> Both casts act on a pointer value. Such cannot legitimately be converted
>>>>> to paddr_t; it only so happens that paddr_t is effectively the same as
>>>>> uintptr_t right now. (Same issue again further down.) That said, I notice
>>>>> we have pre-existing examples of this ...
>>>>
>>>> Yes, I followed existing code.  Do you want dest_base to be switched to
>>>> a uintptr_t?
>>>
>>> I think it was deliberately switched to being a pointer at some point,
>>> maybe even in a security fix.
>>
>> commit 65808a8ed41cc7c044f588bd6cab5af0fdc0e029 "libelf: check all
>> pointer accesses", part of XSA-55, switched from a single dest pointer
>> to dest_base & dest_size.
>>
>> For libxenguest, it's a pointer to guest-mapped memory to copy in the
>> kernel.  For PV dom0 creation, it's a pointer - Xen switches to the dom0
>> page tables and performs the copy with it as-is.  For PVH dom0, it's a
>> guest physical address.
>>
>> Are you looking for this to be addressed in this series?
> 
> I'm sorry to ask, but what is "this" here? I'd like your change to leave
> all types alone. I'd further like your change to preferably avoid cloning
> questionable code (i.e. casts using the wrong type in particular). Plus,
> where technically possible, adhere to the general principle of avoiding
> casts (for typically being at least somewhat risky towards hiding
> potential bugs).

I intended "this" to refer to changing dest_base's type.  I won't do 
that.  With some of your other suggestions, most castings are gone.

Thanks,
Jason

