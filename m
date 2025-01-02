Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3271E9FFC4D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 17:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864333.1275527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOOS-0008CD-VF; Thu, 02 Jan 2025 16:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864333.1275527; Thu, 02 Jan 2025 16:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTOOS-0008AO-Se; Thu, 02 Jan 2025 16:49:56 +0000
Received: by outflank-mailman (input) for mailman id 864333;
 Thu, 02 Jan 2025 16:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJ+e=T2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tTOOS-0008AI-4U
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 16:49:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2417::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96d3291c-c929-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 17:49:54 +0100 (CET)
Received: from MW4PR03CA0185.namprd03.prod.outlook.com (2603:10b6:303:b8::10)
 by CYXPR12MB9426.namprd12.prod.outlook.com (2603:10b6:930:e3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 16:49:46 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::5d) by MW4PR03CA0185.outlook.office365.com
 (2603:10b6:303:b8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Thu,
 2 Jan 2025 16:49:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 16:49:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:49:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:49:44 -0600
Received: from [172.30.159.138] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 10:49:44 -0600
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
X-Inumbo-ID: 96d3291c-c929-11ef-a0db-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKMSFT9ayQ8iRmwM9IiWe5J1rgcMOOfKPMB5/zLICI1JK/2135p/NC+ZPNfW5LVtWYdqWHwAlgbr3iWUwHaf5tP996kl1vTXmy0qug6GQc60GvKU2EKGuIa6Tj7KP9/bBoKRNB7hJiu9ZfJFJ1mnlBUFZJO7Ee0q0+FxHD8IdR58Cs1Qhl+Ewt4pV5McJvEDGHd5Sx8l8/p6t/C0/K1271Krs6JM6EOgkzHvPzXEgQgzGUVobh72Ha0d6wRPTf86fbfVz4efa8WHSHg+VsSzRQYRe8ZRSBGWTqswcgLjOTsiRJt1VxVu6xifZbxpwyto/EN+k+c/7V1/4PWRbwTQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfGjee9kPrFZtrE6ncOKqMxGcUHSneHAi3J0TWa9F4A=;
 b=w96Nu1Aqxd6iF4GX/qtOBeqAxhQQyB1yEhGkxKsp5tSL3VH7mfX3kM25qixvSIB1ias868iCzGg7iRGeL0ZG2z9vNuhHYUFcKDp4NNKmfVWuP3i29MPnQhXCZzfp436rbOPx/CGdZ5cBNz/YkCdgQjjOgSSULq305rhipp9KZAfc2NBY5SevTPt1k21eXblxK/ddopipNmwyivkz0R0HS6+4i/v2VaCBlmH0Xu1OzHIUqUR/JEGZ4WnLVyH4EBURUv6xTMkjrlCvBIN54vxKUhklL//NZzSV6AMoA3Q9WCDbACYwE/y0Q2fYzIxZsQw4YhkzQUX6UMNqevaQzLFpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfGjee9kPrFZtrE6ncOKqMxGcUHSneHAi3J0TWa9F4A=;
 b=aA6BANxinb/+KW63Ae4tPROw6FK0teHPqcscwUDA324tEupj4DjD274dkQSTXVcnOhG/kGyCKrAj2mLdWZV7PN0MBWu+pMWmX8ou4bxBt4qM7rEfE9+kIL/hah9h7UkG9lkgqPbvsHf3omVJEIYkZkijCcTTubXLnuedh5DH9YE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1a3abd82-d3dc-4c0a-8328-a746e0b789f7@amd.com>
Date: Thu, 2 Jan 2025 11:49:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Julien Grall <julien@xen.org>, Sergiy Kibrik <sergiy_kibrik@epam.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <5246aa98-d23c-41d5-ba14-c12b0a2ee9af@epam.com>
 <baac9d61-f4bf-4de9-a58c-b354111e3c0c@xen.org>
 <16694707-ce8b-4c4e-a6ec-2190b8124735@epam.com>
 <12f210d1-e117-4b72-a168-1acf47c99a6d@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <12f210d1-e117-4b72-a168-1acf47c99a6d@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|CYXPR12MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: c77a0ae4-6a78-4f5e-771b-08dd2b4d76ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVdBQkpub3hjN1Fta1lNcEI5b1dNWXQxcmZnMnZvWWZwK3V0MEc1ZEp0MzYw?=
 =?utf-8?B?KzN1MkN1b29RaUpsZjN5cFNXcDAwZ0RZazlONW05c2doa0pFb2hwRC9ZKzYw?=
 =?utf-8?B?M21MeHl2dlZ5NDdtNDBsVUUzRFVNc3BmRk1jekEwMFhCMzRrRTJ2K1lndUVv?=
 =?utf-8?B?L3BXSXE1WWNBQ3ZTUVpCMXliMkFrODNQdWNKUUEvL0lObWc0VWs0cVRXNVlo?=
 =?utf-8?B?UWhGSUNOanV2WGdjeUJWd051NUZvOExIdXBERmlkdFRoWmJtOEdMS0pEdlpZ?=
 =?utf-8?B?Y21RNHVwTElkWFFLZnZSYll0MENuRXdiTGxBYjFCbmdSd3FnR3VweDcvYVRa?=
 =?utf-8?B?dHIyK2MvUE4yK0VlWUxGbUdPU1ptOExhUmxLdFVBZmN2eElVaENsT2RraEJQ?=
 =?utf-8?B?SmZWRW5sTUtRd20xaWIveHNCR0VKM1ZyZnZhZnkrbVk4SHh4WmZ2d082aHYx?=
 =?utf-8?B?VXBuUTQzbGJnU3NTZW9iZFVnY2hENHlaSWVhWHlXZGlhblpyN3J1WFhNZ0hC?=
 =?utf-8?B?MkxLS2NqdXpYaUR2b0Z3NVpQTTd3TGtjbE82QS9kZUNkQ25jNUtCdWZRNm5s?=
 =?utf-8?B?M2FpNXBaQlF4Ui8zZEhXVTZsa0tnT0FBY2NlMUVZVjFITHdLbE5oU1FSTGk3?=
 =?utf-8?B?RmhSN1RseUVqRWJZc0REQjNCQmRpSUlNUG9JV3lCT1V3TnUxNDNlQU9QRmJY?=
 =?utf-8?B?REEwUDIvYUQxZ1BuMkJnWXFLWm50RiszK05hcmxDMUJNRVNRMjRiQmRwRytC?=
 =?utf-8?B?dHZvM3FKZk1nRTdqbFBzSzdzemxKZWZJUTlscnpMcGRmeDNHd0VabXRrd0JO?=
 =?utf-8?B?cnFoWUdlSFJ1U2hBSVRqTzlXQno5Zk4xQkowdDM0cElWWnZXczQrZW4rbTRJ?=
 =?utf-8?B?dzVZYjhlVGJJRjl1MGtGZHNobEZjcHh2enZOeDhXbmFSTWVvb09pNjRESlZV?=
 =?utf-8?B?NHNJbEdxU2h2V0taczRqMVRZa2Q3Wmx1MjY0OVBLL0lLTWhuWXp4Nzk5TnZF?=
 =?utf-8?B?WkV1Z0NvWnhJQndFbStpMEJhU3hUZFdkckUrdzE0VnNHMG5DbVo3Z3FEQVla?=
 =?utf-8?B?K0lBRUduYSs0cC92RHZVOVZ0UDd4cTE1TkcwSDFjOUVlTHhHUEE5RVF6S0RH?=
 =?utf-8?B?TE9adjVZU2FmV0pJOHZ2UkR1Zyt1elFGUnFsbVJRSDhQN1lIcUFjcjR6am1o?=
 =?utf-8?B?KzZyNzd6V1FCRW84VkQvQkhkNHlkam5qeWJYeXlpSWFsTVlzY1Z2TEV5UmZz?=
 =?utf-8?B?TkVLQ0FvVnJsdTRkVjBFOUdQMFdLWXNCZ3B5ZHZkdWw5OGFJSmY1TjZaOXF4?=
 =?utf-8?B?akNpOHB4ZnpEdzFlM2pDMlVOS3QrSFUvdEpoWkxqYTVZNmxTYll2cEUrM2Zh?=
 =?utf-8?B?c2hveWRlUXBmVGZNUmIwdHhSbmMweDJEc21zNW9rWWI3S1ZvdkY2VDQ3RURU?=
 =?utf-8?B?enRsakdiTUhMNWlKWGpZdSsxK0tJbzhyU0x2aUZFTnpIRFlGZ2pFemFmY0xZ?=
 =?utf-8?B?MWltYkNVcm1qTnZXNUE0Zk83MHdoZTAwaVE1UEFCMCt0USttYUp6QUsxVlls?=
 =?utf-8?B?dHJHZDNteitNT2o5Z0J2SHVMR0g0dEdXTUQ4cVB3bHIvZDlURE9VVXNnWHkv?=
 =?utf-8?B?QmVKWEdpM0VwUXh3Y0l1UjVqR01McW5qN0hhZXFsS2kvZUR1a2ZyWlgzZVNC?=
 =?utf-8?B?MzV1RUlKUmFSNS9Ibzl1U1BiYkZRSHcvWUFKYnlIaUVlZFJWTUsyR3I1ekZM?=
 =?utf-8?B?NnQvZ3diVWl4YjdwMk1PRWM3cFFteS9WSXNlRVk4UlJpbXVQU25LaFYrZ2hv?=
 =?utf-8?B?bmZYelZCMnpLVXhHOWlhUDFvZWJhRzJFOE5jby94dyt1RWk1TFlnVVVpYWpl?=
 =?utf-8?B?S1YrLzFrUzFFc293cnlnSEI4aG9KQWM2eE9oTUFkN2hrR3JVMXM2TlIyZGlK?=
 =?utf-8?B?SDJidEROdjYvSElxWWttTHlqNFcxMlFiNCtMaW9qWlBSTm5lTVpQY1Rpc01h?=
 =?utf-8?Q?q64yDa1pkv4rQ0eRzEYqUjns8LpTw4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 16:49:45.8250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c77a0ae4-6a78-4f5e-771b-08dd2b4d76ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9426

On 2024-12-24 08:54, Julien Grall wrote:
> Hi,
> 
> Replying your last two replies in the same thread.
> 
> 
> On 24/12/2024 03:41, Sergiy Kibrik wrote:
>> 18.12.24 12:05, Julien Grall:
> 
>  > yes, I had to assign devices to hardware domain manually.
> 
> I think it would be easier for the user to say "This is my hardware 
> domain" and let Xen assign all the devices, generate the device-tree & co.
> 
>>>>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>>>>> Allow to build ARM configuration with support for initializing 
>>>>>> hardware domain.
>>>>>> On ARM it is only possible to start hardware domain in multiboot 
>>>>>> mode, so
>>>>>> dom0less support is required. This is reflected by dependency on 
>>>>>> DOM0LESS_BOOT
>>>>>> instead of directly depending on ARM config option.
>>>>>
>>>>> I am a bit confused with the explanation. We already have an 
>>>>> hardware domain on Arm. It is dom0. So what are you trying to 
>>>>> achieve? Is this remove some permissions from the hardware domain?
>>>>
>>>> I agree, it should have better description.
>>>> This is to split dom0 permissions into control-only and hardware- 
>>>> only domains, much like it can be done in x86.
>>>
>>> I don't believe you need the late_hwdom feature to do that on Arm. In 
>>> the case of dom0less, you are creating the domains at boot, so at the 
>>> point you can decide who does what.
>>
>> I'm not sure which mechanism to use for this. Can it be done by XSM 
>> policy management?
> 
> For hyperlaunch, Christopher and Daniel proposed to specify the domain 
> permissions (e.g. control domain, hardware domain) in the device-tree. I 
> think we could re-use a similar approach. See docs/designs/launch/ 
> hyperlaunch-devicetree.rst for more details.

This document is not in sync with Dan's latest work ...

>> Indeed, in my case it works only because there's single domain 
>> description in DT.
>> If there're many domains in DT, we can't be sure which domain ID each 
>> of them would receive at boot, right?
> 
> Correct. We don't (and should not) make any guarantee on the ordering. 
> If the domid matters, then we would need to introduce a new property 
> specifying the domain.

... a more up to date one is here (though it could still change):
https://gitlab.com/xen-project/people/dpsmith/xen/-/commit/4387d0cdc9e0c667a764043fd1474687ee626fca

It includes:

"""
domid
::

   Identifies the domid requested to assign to the domain, Optional.

   Value is an integer.

capabilities
::

   This identifies what system capabilities a domain will fulfill. 
Optional, with the default being none.

   Value is a bit field, currently defined bits are:
     1 - Control domain
     2 - Hardware domain
     3 - Xenstore domain

.. note::  All three bits must be set to have a domain function as a 
traditional dom0. If no domain has the Xenstore domain bit set, then 
none of the domains constructed will have a Xenstore event channel and 
ring buffer allocated. The domain with the Hardware domain bit set will 
be the domain that all domains constructed will have their console event 
channel as the destination domain.
"""

These are not parsed by Xen's dom0less code, but they seem 
straightforward to implement and would provide the needed configuration.

Hmmm, looking at the text, the bits are wrong.  The code uses:
#define BUILD_CAPS_NONE          (0)
#define BUILD_CAPS_CONTROL       (1 << 0)
#define BUILD_CAPS_HARDWARE      (1 << 1)
#define BUILD_CAPS_XENSTORE      (1 << 2)

Regards,
Jason

