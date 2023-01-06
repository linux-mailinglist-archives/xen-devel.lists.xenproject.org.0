Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1200565FF17
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:42:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472464.732696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkBO-0000at-6m; Fri, 06 Jan 2023 10:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472464.732696; Fri, 06 Jan 2023 10:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkBO-0000Xh-3H; Fri, 06 Jan 2023 10:42:42 +0000
Received: by outflank-mailman (input) for mailman id 472464;
 Fri, 06 Jan 2023 10:42:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NPe1=5D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pDkBM-0000XJ-FA
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:42:40 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7d06d31-8dae-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 11:41:48 +0100 (CET)
Received: from DM6PR21CA0003.namprd21.prod.outlook.com (2603:10b6:5:174::13)
 by PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 10:41:43 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::f1) by DM6PR21CA0003.outlook.office365.com
 (2603:10b6:5:174::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.6 via Frontend
 Transport; Fri, 6 Jan 2023 10:41:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.17 via Frontend Transport; Fri, 6 Jan 2023 10:41:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 04:41:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 6 Jan
 2023 04:41:42 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 6 Jan 2023 04:41:41 -0600
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
X-Inumbo-ID: b7d06d31-8dae-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiYab2Jg0ZKuKIhxBACtNp6p8PwuoRkBPzMs39OmGEJUIdmkHkgWdxLRnxfTJGMzBfWjEzH9PqGH1lTkKZ8df3rQSELr5Nr/WUNctnSP34t34849Rclu1PnDy5nnqsnvjRSbGwbq+VlodgEVsJjOWHuOU9V7Fa33qZ8DNJKI0qN43lZ7oaka+q+nB53H1rVWnYwo1GgYlhZh3qkTJrCMAQCR9YVLt+Y1Kxh8zA6m+gljoWWH6BbtatKzfzAbi07XCVWE+2eJvhfhvIGvHk9fWGA1Acp/pFszu0zqVlbwd8NWbbnQJ2XzaKxDlOulJ5wJDVZnoYlD3RlkHem+oCaCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wHK6HK99xoJCu9Ih3KlJHciWVIQHNeLO/b5S8q4/KI=;
 b=AcGRnSMe4L9Azub3tL8sbY61HtQ+wzx7S85knTYuBqC/C+NZMEFF7L9cib2LsRv2/c9ayt8tPuwfavTkAU9HgZeTJ9XubknK6X6m4RpTtUD06lgOqpzRtQL0TRo63qxe121qGGHq9PFIuIHikTz39ZVQAZC79+8iBieEpMaX7e9CjVhKNm/zqW2c6nV3gSM7mcAcUdoQlKtkLxcuHzoEGPTUr+aVdBma6obTXDn+ybQtbEWWZ91TuTLGl5blweM7BI7lseqaiohmJKgY3QAmW0PPnPphhsb5AhUrHZ+FE7U/h3byq5/PajOoD/hhplV/NcMdpZYCUlpFvU67z/et0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wHK6HK99xoJCu9Ih3KlJHciWVIQHNeLO/b5S8q4/KI=;
 b=wENSy1xT8swSrvQMsJ354Si5OIDmGRlTvcqdTTUplA7ZfC5AI2/DREFiFruMGIqHprrRvkgeW1zJyW7h+Y2Dzh40f3w/cRkULgOjRYIHTA0e77fhgCRtM5jMEpUjsB1DDW3sulwsrAkNJRwD1gw39nmeI6J0VgkXwDQOSiCSNjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <383485e0-37ac-9b0c-f0c5-18e50cf7905b@amd.com>
Date: Fri, 6 Jan 2023 11:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Ayan Kumar Halder <ayankuma@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <20230103102519.26224-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2301041546230.4079@ubuntu-linux-20-04-desktop>
 <1264e5cc-1960-95d3-5ecb-d6f23d194aa4@xen.org>
 <29460d07-cd43-7415-7125-6ed01f3c2920@amd.com>
 <c80f90d7-d3b5-1b13-d809-9506ff5414e4@xen.org>
 <35d590fb-4b96-70dd-a60b-1c8d7cc8f2d6@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <35d590fb-4b96-70dd-a60b-1c8d7cc8f2d6@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT055:EE_|PH7PR12MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 2326ee58-65f2-4a1d-90cc-08daefd299dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LQ7bU/l0aR8396jR9E4VLOGtrrjq18ZKAKvrzojzguor9zwgX5DLPjk53dlt2rr5ghmvFjfzbIVpQUMJYK04zFqP5meexxXrSlA1T0ipnB/r4nqhi7bn09oMfId9jiEKyjnW0Rn1WMz9450NZJCcNpk27JzUSo1APvaKLIQdo61R5vzE5LXRqr6NxasRBihWPNB264M4YeLfhaEaG2gaWzUzq3Ni4f2f6/fTkaX6+mnzIY15Uyz3JvC+3FrHu6jX8NH9Fkw5S7FTJIDW9UE7uv10yrSTM6pl4SOVAa6Z+qv2OwV1xYMd4MCiFmdVZ1LAGVj+TlJ3N9KEkPAUsB4FcdtWgQk495dYkMq8RKBJq77B1aCfnZPJkMdGMSLDDgX8pEx0Ag6YV8pmFuTFliMFxdWCkYoKvkLA952kQONue5hhAXJix8crjnc0xRVudAlbIEMIPAPplbR/H7mgKnfCqkFdvYvioYw42C3Lsvg5U3aTt78HJafiexDFinujZo+5zXyr/CHFGeNMcUosWlMPnCofxFilIBtpT1XC6e2KWq8aA7aNBmrd220oqqytdoEcX4e4dteAecnsGe+k2GfyboxXLQ0CgNl+Dt/unABRCxSfMl0L0MPpQht0wtL2RSpTp97SB7V0i0mDntzhI9PIFI9aj2MKPjPh2jVIkzd9k//O8TGU1YUGnjzzLh6F2eejJDBGtJXkBeFiERVQfpNN8vQNTyxLBw5UX2jstchUfJ4JwD4uMGq11ObJsfmTn1D2U28roCx+WAKeXHg6oKsxzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(31686004)(36756003)(82740400003)(81166007)(70206006)(70586007)(8676002)(356005)(2906002)(44832011)(5660300002)(336012)(31696002)(86362001)(83380400001)(36860700001)(316002)(16576012)(478600001)(110136005)(41300700001)(82310400005)(8936002)(40460700003)(426003)(2616005)(53546011)(186003)(47076005)(26005)(40480700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 10:41:42.9104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2326ee58-65f2-4a1d-90cc-08daefd299dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879



On 05/01/2023 13:15, Andrew Cooper wrote:
> 
> 
> On 05/01/2023 11:19 am, Julien Grall wrote:
>> On 05/01/2023 09:59, Ayan Kumar Halder wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>> I have a clarification.
>>>
>>> On 05/01/2023 09:26, Julien Grall wrote:
>>>> CAUTION: This message has originated from an External Source. Please
>>>> use proper judgment and caution when opening attachments, clicking
>>>> links, or responding to this email.
>>>>
>>>>
>>>> Hi Stefano,
>>>>
>>>> On 04/01/2023 23:47, Stefano Stabellini wrote:
>>>>> On Tue, 3 Jan 2023, Michal Orzel wrote:
>>>>>> Printing memory size in hex without 0x prefix can be misleading, so
>>>>>> add it. Also, take the opportunity to adhere to 80 chars line length
>>>>>> limit by moving the printk arguments to the next line.
>>>>>>
>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>>   - was: "Print memory size in decimal in construct_domU"
>>>>>>   - stick to hex but add a 0x prefix
>>>>>>   - adhere to 80 chars line length limit
>>>>>
>>>>> Honestly I prefer decimal but also hex is fine.
>>>>
>>>> decimal is perfect for very small values, but as we print the amount in
>>>> KB it will become a big mess. Here some examples (decimal first, then
>>>> hexadecimal):
>>>>
>>>>   512MB: 524288 vs 0x80000
>>>>   555MB: 568320 vs 0x8ac00
>>>>   1GB: 1048576 vs 0x100000
>>>>   512GB: 536870912 vs 0x20000000
>>>>   1TB: 1073741824 vs 0x40000000
>>>>
>>>> For power of two values, you might be able to find your way with
>>>> decimal. It is more difficult for non power of two unless you have a
>>>> calculator in hand.
>>>>
>>>> The other option I suggested in v1 is to print the amount in KB/GB/MB.
>>>> Would that be better?
>>>>
>>>> That said, to be honest, I am not entirely sure why we are actually
>>>> printing in KB. It would seems strange that someone would create a
>>>> guest
>>>> with memory not aligned to 1MB.
>>>
>>> For RTOS (Zephyr and FreeRTOS), it should be possible for guests to
>>> have memory less than 1 MB, isn't it ?
>>
>> Yes. So does XTF. But most of the users are likely going allocate at
>> least 1MB (or even 2MB to reduce the TLB pressure).
>>
>> So it would be better to print the value in a way that is more
>> meaningful for the majority of the users.
>>
>>>> So I would consider to check the size is 1MB-aligned and then print the
>>
>> I will retract my suggestion to check the size. There are technically
>> no restriction to run a guest with a size not aligned to 1MB.
>> Although, it would still seem strange.
> 
> I have a need to extend tools/tests/tsx with a VM that is a single 4k
> page.  Something which can execute CPUID in the context of a VM and
> cross-check the results with what the "toolstack" (test) tried to configure.
> 
> Xen is buggy if it cannot operate a VM which looks like that, and a
> bonus of explicitly testing like this is that it helps to remove
> inappropriate checks.
I can see we are all settled that it is fully ok to boot guests with memory size less than 1MB.
The 'memory' dt parameter for dom0less domUs requires being specified in KB and this is the
smallest common multiple so it makes the process of cross-checking easier. Stefano is ok with
either decimal or hex, Julien wanted hex (hence my v2), I'm more towards printing in hex as well.
Let's not forget that this patch aims to fix a misleading print that was missing 0x and can cause
someone to take it as a decimal value.

> 
> ~Andrew

~Michal

