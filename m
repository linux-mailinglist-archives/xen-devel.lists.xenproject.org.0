Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2D8BC61E
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 05:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717176.1119148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3onC-0004ky-03; Mon, 06 May 2024 03:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717176.1119148; Mon, 06 May 2024 03:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3onB-0004jT-TW; Mon, 06 May 2024 03:13:29 +0000
Received: by outflank-mailman (input) for mailman id 717176;
 Mon, 06 May 2024 03:13:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3onA-0004jN-HQ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 03:13:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98ea6420-0b56-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 05:13:24 +0200 (CEST)
Received: from PH7P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::15)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 03:13:19 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::62) by PH7P221CA0019.outlook.office365.com
 (2603:10b6:510:32a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 03:13:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 03:13:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 22:13:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 22:13:07 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 5 May 2024 22:13:05 -0500
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
X-Inumbo-ID: 98ea6420-0b56-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3ZMf/WIM3Xfs7Lo2g0thkasbpcO5J+g/wkWFWCQUh49ZDRDtYrB5uyrz5TEbsnobenHsIlWRoYCkUuFlE4jgsJSkVg/8x6dW5TTUGSkbr70yDMUUHQobs6DlQW1alUNYiBUqmyszqG2A1mUYGGkJruz7Z5cU/w2BszanymI0jrRq75zByemCVcbbpobFAsUcMDz0lSU61E64q0A7wBQKg9SfCWGob6qDeikCLQRAh0jjDZBSIweXtRqlnnR0jCFP663/8rU+523JGPn+9uK5GhDlX77cBzjpEOVWLEgPjpVfgUli8G1FP42a1TYobA9qKn2AvlVnkUHLIiZt94MBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1e21ooJqaxmkhXcun0n96GKnY1vVbBlfGXqRdJB2vo=;
 b=C8vpNqDrK/YTHmhTAmNI4/0AaNARN1DDirjzHu6xz6XbHzv2kd5LIiD53RSwled3/skgc4+KKAYIIKO667nubTB5Z7P0ZINIn2hchpyMWDiiPdRU5YJNy7WgIhB0f4ZhGkuB6h1AGYzu+SYevIDdKu+Y6QIWi5luyi6mmIidWQhBnaZXe7nzjd6VV8IEtVx22rP0IOdpezwzyTnxgprg1fPjmhlYF8V9jZIRvFXHVZdUb16T9HMP5Ns01ROXIYMqVUnvdP82+GNIKmxSAxGvXWtTByAvn2c5wskhKFI8UQFRlwpHLpcQg1JmeGQnBTTzQvnH2v7i6ipLa0d+I4rP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1e21ooJqaxmkhXcun0n96GKnY1vVbBlfGXqRdJB2vo=;
 b=UOYO1r5P7BWdxJEMposoAO2Nq9c1zGW5g7bJI/BqlMfgEnFxS44qYatPJtsCxq5nljWEwozCWqSESDoehSNnX3/vvzX02mtZPNKoacHLkIIKQVuILY9Tabbz/eh8VLFK6863DIAm9UmKWBb5vhzmYAm/eX1aFXuMe10Zd5vsADE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <eda5fd5b-87de-4da1-a785-44da563176cb@amd.com>
Date: Mon, 6 May 2024 11:13:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm/dom0less-build: Alloc magic pages for
 Dom0less DomUs from hypervisor
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Alec
 Kwapis" <alec.kwapis@medtronic.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-2-xin.wang2@amd.com>
 <ee507cf7-b5e8-4141-85b6-c81955bcc348@apertussolutions.com>
 <03357204-0308-46a2-a215-142d681d2b6a@amd.com>
 <3054018d-1ae4-43c5-b44a-2ecf1b4cdfc7@apertussolutions.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <3054018d-1ae4-43c5-b44a-2ecf1b4cdfc7@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DM4PR12MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 745825c3-bdf5-485a-9416-08dc6d7a7aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWpaQmtnZE03RkJ0SHp0eDNzcmlZdHZOY0FERnJQd0FzMEp5cW5LUzh1OTA0?=
 =?utf-8?B?cG13Sk4rV3BnQXg3aXlBTlNldXpnclNtUnFJeFNJNjNsTjVCVFF1Q0pOYWJC?=
 =?utf-8?B?dm1mUWhZRGRkM3crR1BNQ2dNV2Vja1lBa1o3YXc5cVlVeXo0d1FSV3g1MGtI?=
 =?utf-8?B?WWxNUUNqbkw5NlpGRk95VkhEZ2tnV1cveEk0UFEycHptMm5FNmp6S0VXZmZT?=
 =?utf-8?B?MUtVWGY2dXFhT2t1ZnhyRDdwS04zV1JKWVpJcmNTZFVMOEtYWjgybGtzOHh0?=
 =?utf-8?B?YWlrZ1pCSVVHeUtsdi9jOHAvNFhZM3JvYlRDanZORDhXdklUZytRMnZIc3lZ?=
 =?utf-8?B?dTBnaDNEU2FXTzhlR0JQSnJaNUhkY0pSUmEwdXhST2xPRnl1eSthRTFOU3pJ?=
 =?utf-8?B?MHozUEJjcnh1NUhMbWpEM2tsYXFFbSs0Y2hmWEZ0bkRGYXV1bmFuVEF3WmJl?=
 =?utf-8?B?U3l6UXJndC9sOHZzN0dnV3NIVFhMeENqR01DRmFSUnFnRGsyL3RyT2VBVm1J?=
 =?utf-8?B?RjdqRExWUHZWT1BNYVFKY0ZNcG5JYzhqSHZuejBUNTZVb1Y3d3NEYU9DeVBN?=
 =?utf-8?B?Ky9CeXMxT3Z4YlQ3ZFZyZVpsQU9XQTdUTVZaZUlzQzVReklmNGIyL2VZd2g2?=
 =?utf-8?B?eHE4MFVCRjhMU3cwR0VGSHpLS0xsRUc5c01ySUVEeWNuYXJUVzY0aUpLbnhU?=
 =?utf-8?B?NFNORThmQXQ5c21RTDl1ZzZDeWxESms3RCtNYlF0dlg3RldKQStFMkw0RGxR?=
 =?utf-8?B?VDkxanF1UnhFVFo0eHZGTENUcG1wNGpvTkE1NlRVcjM5SmhLYWFwTkVxdUhx?=
 =?utf-8?B?Y2xyQU9mRDZDSVFYenJmeG4xeVZVUE0rSUN1ZVU1d0ZuZWpubE4xa0QydU5W?=
 =?utf-8?B?WkxpUjRvY0hnYTV0OXNKZzRaeURNc1BaT0J2UDB0REFPTmYzVm9FbzB2WmNW?=
 =?utf-8?B?WkRxRXN0RkVzMUJCbkxGYmt5SmoyMGxZcFljOTBRTkp0bktBaUdoMFIrY0t6?=
 =?utf-8?B?OW8zU05tYVRoRFJRY044c1NEcFcrQ0IyczhlUzFPbm1aMzVFVy84Mk5DMVU1?=
 =?utf-8?B?ZEdpVXFHeHBNL1ZsdU96VmpROEZ3c1NpRDBsRFl0Z2xsdG1oazVySGI1UjRC?=
 =?utf-8?B?UWl1WG5oZ2lrWlZaNGVYS2JnV3h4cFBCcVl5QzArelExY1Rtc1djTWo4UjNE?=
 =?utf-8?B?aUVjaWJUZXhSUFJJVFFiQWR1SUxRN3FEY1psSUhlbDlpaGNseWZRRkNUaHR0?=
 =?utf-8?B?dng0Smp2NzMwQW4rUFZwS2VoWG1OUG5sTkM3b3M2TVFod3VoVWdWSFlXWEpU?=
 =?utf-8?B?S2tOTkRQQURwT0Q0dXVxOU9HVnRjZ2w2T2RQQ1ZVVEJncUtPSTIwdmFENi9U?=
 =?utf-8?B?dXdmNHRMY2ZmZlU3NG5YTC9hWjZPeWc2SUJrTVVuMC80R05wYmJDSmxhb1hN?=
 =?utf-8?B?ZzEycXZxZXdYZW1HYVhJQWd2c3JNRFIyMUhSblBnaVhnWHFYYUZBTXpMSVRE?=
 =?utf-8?B?UGppblowc2tSMFI0cHRETGVZVUROVk1wY1N5Tnk4bFRFTU5EWHQvS2hkdnF3?=
 =?utf-8?B?MDB4d0NsYVNqbVNtUVJRbGlLTjMvRnpPYUVBcVZCZXZOVW1oamkrendLTkIx?=
 =?utf-8?B?bm1LRG9QbjR6SGQ5RTVqNDNLL2tTTkkyRWZGeEs3aHMvUXlHSjVCZlgvRUNp?=
 =?utf-8?B?SzZuUHp0YUFGNGN1R0JYT1RQdXJBNGdGS3ptd0hyYVQwbDlRR2RieVdxelV3?=
 =?utf-8?B?RFpQbjZ1bDJ2eDN0bFpnY0J1Tm1aRVVoNC9wTzNOTzYzdlZjMm5WaHl2UXIz?=
 =?utf-8?B?ZDRBL2o5U0Q0Mm5odDdxYzVsTmJzQkxzNnhReklpaFVpTWdKdGd5QjFuc0NZ?=
 =?utf-8?Q?HzFPzGkf4AB0D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 03:13:19.0122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 745825c3-bdf5-485a-9416-08dc6d7a7aaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503

Hi Daniel,

On 4/30/2024 6:22 PM, Daniel P. Smith wrote:
> On 4/29/24 22:55, Henry Wang wrote:
>> Hi Daniel,
>>
>> On 4/30/2024 8:27 AM, Daniel P. Smith wrote:
>>> On 4/25/24 23:14, Henry Wang wrote:
>>>> There are use cases (for example using the PV driver) in Dom0less
>>>> setup that require Dom0less DomUs start immediately with Dom0, but
>>>> initialize XenStore later after Dom0's successful boot and call to
>>>> the init-dom0less application.
>>>>
>>>> An error message can seen from the init-dom0less application on
>>>> 1:1 direct-mapped domains:
>>>> ```
>>>> Allocating magic pages
>>>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>>>> Error on alloc magic pages
>>>> ```
>>>> This is because currently the magic pages for Dom0less DomUs are
>>>> populated by the init-dom0less app through populate_physmap(), and
>>>> populate_physmap() automatically assumes gfn == mfn for 1:1 direct
>>>> mapped domains. This cannot be true for the magic pages that are
>>>> allocated later from the init-dom0less application executed in Dom0.
>>>> For domain using statically allocated memory but not 1:1 
>>>> direct-mapped,
>>>> similar error "failed to retrieve a reserved page" can be seen as the
>>>> reserved memory list is empty at that time.
>>>>
>>>> To solve above issue, this commit allocates the magic pages for
>>>> Dom0less DomUs at the domain construction time. The base address/PFN
>>>> of the magic page region will be noted and communicated to the
>>>> init-dom0less application in Dom0.
>>>
>>> Might I suggest we not refer to these as magic pages? I would 
>>> consider them as hypervisor reserved pages for the VM to have access 
>>> to virtual platform capabilities. We may see this expand in the 
>>> future for some unforeseen, new capability.
>>
>> I think magic page is a specific terminology to refer to these pages, 
>> see alloc_magic_pages() for both x86 and Arm. I will reword the last 
>> paragraph of the commit message to refer them as "hypervisor reserved 
>> pages (currently used as magic pages on Arm)" if this sounds good to 
>> you.
>
> I would highlight that is a term used in the toolstack, while is 
> probably not the best, there is no reason to change in there, but the 
> hypervisor does not carry that terminology. IMHO we should not 
> introduce it there and be explicit about why the pages are getting 
> reserved.

Thanks for the suggestion. I will rework the commit message.

Kind regards,
Henry

>
> v/r,
> dps
>


