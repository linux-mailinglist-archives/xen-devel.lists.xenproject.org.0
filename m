Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D11B1BA5C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 20:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070864.1434475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMZz-00032K-SR; Tue, 05 Aug 2025 18:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070864.1434475; Tue, 05 Aug 2025 18:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujMZz-00030Y-Ob; Tue, 05 Aug 2025 18:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1070864;
 Tue, 05 Aug 2025 18:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tjfC=2R=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ujMZy-00023T-32
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 18:40:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:2408::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99dbdb29-722b-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 20:40:04 +0200 (CEST)
Received: from BY3PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:39a::19)
 by IA1PR12MB6306.namprd12.prod.outlook.com (2603:10b6:208:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Tue, 5 Aug
 2025 18:39:59 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::1d) by BY3PR03CA0014.outlook.office365.com
 (2603:10b6:a03:39a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 18:39:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 18:39:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 13:39:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Aug
 2025 13:39:58 -0500
Received: from [172.17.35.128] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Aug 2025 13:39:58 -0500
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
X-Inumbo-ID: 99dbdb29-722b-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCm8Oi2Y2+PSklQQtxhVkw5sIBcWhyDpV4W7esTsl9dOIJXRHdaMiYCBRB84pxcKzcVfeLFngE4dgkgN5FFNyyVlIYD1t64+FziiZFyYxilvjectUbvDeohpz08mGZTZvgjgDKH33F6Ek7H+St6u74dYNVE+ya5XtfYnP3PqHpXpCaJRfbBMaZYWqYb1/zUpzJb1kWza9a8c0bto4csWr5Jw2LWVWhifz7PZCIGdHRN/0ZxinrTynnguI0LfrbrYSZ1xw+Z4enHdA/X9wKBCwfFWe9gz+TCUkDKdnyG543S6MnmJK8ma6ZBYJ7I/7tPJGayt9yPb5Gew+PPCyiqNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/GFwuG11RU3d67W2B1HxqwDqa5tYO0dA83nEAnUoNE=;
 b=Qg6VvYBVFOxF8TO00GPHpaLpTFmfeXIOCvW181l9nTvrGsLD4Shf/ePp6LgyjlYa3Kew0ZuufRrRSPxyipaQx7mWuazF3PEELJvrjx7vDFh0mSKwoT8TRteCwwPs1foVsWozH2g7CbgSLZ0iG98pHDcnaWeBGtX4gvhlMfdRgbCGtvyYVT2kl+l0OWoxl/ykwtBtBDEwMyIaZNV89XrI4GVpXOfOGLT4jkrXh9WMfxgR7cC7dcxF4I394U1GnR3/6fIJYAJWuSfH7EJuH75nLcuOERWuJmpNF5SzywXPn5Lw2151LO6vNAZetOLKLyltf3LdFKx4D+j3b03HJcCTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/GFwuG11RU3d67W2B1HxqwDqa5tYO0dA83nEAnUoNE=;
 b=a7qLsWWXuOLPjeFjlcxQNCqFp6Erd7jyRWG34ilyLhFdDNlVwGp4PCIQXAVjZc1usqYBNYtBMosd6pN9BzYei4vw+PxVZYCMl4dgGyi0KVGEWqJ+nrIUq2c9AtHfmeKxq+PzRIUtyuKCkkf+PC9H4qQ9NbBY6Lz8t/cfMJo/6Lw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <bf2ce29b-c843-4a4b-be73-eb1c111abc81@amd.com>
Date: Tue, 5 Aug 2025 14:39:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/dom0less: arm: fix hwdom 1:1 low memory
 allocation
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250801155429.1402395-1-grygorii_strashko@epam.com>
 <7c867f77-3846-4b2a-a028-4dfb248a4fc2@amd.com>
 <47e51e6d-ea3a-464e-9442-fa5f4329eabc@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <47e51e6d-ea3a-464e-9442-fa5f4329eabc@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|IA1PR12MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: cd788429-93a5-4df9-b6ef-08ddd44f7b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WS9JYWdYQ25rcURKYUFpZW0wRHBUcmdMMDZvc2huVEZ6MGp0cExNU1E1Mkx3?=
 =?utf-8?B?VjlmWElwNHBFZk90TXVPQVVZSVhzOHJNTmZ0SmJCWTB4SnhtOElaWmFVcnhK?=
 =?utf-8?B?QUhlL3Z2YmlvZXA2RVZtRzBUeDFXVVJxdkhUMmNtalBSSnJPVlcxT0RHU0Rn?=
 =?utf-8?B?UThzN2JuNTFudklUSHJjTmpIMFpReDNFaGZNQllpby9HUWNzZEMwamhjTE5n?=
 =?utf-8?B?Y0RONy9iWXd2cTFlNUxTVUxwckFTeEd4ZXRDVElod01ML250YjhaNXY0L1dn?=
 =?utf-8?B?RStLOEhtaU1qU0pSZWswem5GaGlTU003Ym1zRnFrdC9mQ2pNM3JCYUdmSFEx?=
 =?utf-8?B?RFFFQ1Y0djdoQVRya2lSNGRPSlNBREcvRFJ2L1VnV09Pd3pSTldMQkRqWnA4?=
 =?utf-8?B?THRUM09McFk2WXY5SVFHZzFETlNTYVovM0k4d3VKRGZZenE1WE1ZMndoMk5P?=
 =?utf-8?B?L0ZyYU1ZTUk4ZEVxZTN0cGtBbFRXUHBKd3JiWERnUDExYk9BTWVZam9ZUCt5?=
 =?utf-8?B?Ulp1a1FaN0xpbWZLTHJrMGVNdEV0bmNZV2J5MUNvdVRhd0s4UERFakNEbWlG?=
 =?utf-8?B?OENrZzd4QkNRdVVPbkEzb3I1akZ6c3M2ZzFqNVcrRjBnUHlhMG9UeXFROFVP?=
 =?utf-8?B?Qnd0QVA0RTVyV0RobEM1ZUp3RVVRcGxxY2ExSkpjdkZnRWorOVBjR2JMNWlz?=
 =?utf-8?B?b0F0cE9hRGVGSkNkRUxzeWEwVzJnOFFoOUVVdkJ0c1VlOS9KLy9pcU5iZktM?=
 =?utf-8?B?N2xaYitJNjlhUHY1V1h2Mk8wa05qOFNVaEc0UXRFK0laOHRNZ2YyZ1NoaE9o?=
 =?utf-8?B?bHNmUk91K0FrNmtJZm1Sd1NiZmFWZ2hIWW1FY2x4Y1pLTWNkZlFhWnE0Y1Q2?=
 =?utf-8?B?eU5TYXpZcXg2aDY4MzF3UmVSMkJFOE1BT08wWWNUYy92UHJVZFdOSUZuT1g4?=
 =?utf-8?B?QXAzeHE0RnZoaXVWWkNxUDBtTGpTblBaa3JLbVVXSUtJcE8rVmpoTG9SYTZu?=
 =?utf-8?B?UUVFcGZLUThGY3lIQWkvNXdkaW9LblB3Zm1kcXJLVWFpNjFKYllwU1NJc2wz?=
 =?utf-8?B?dVNSYlJwZHlhZTJFaHhNODJFVG9tblh1bUsxV1R5RStEeU92RDVETDF0MG1a?=
 =?utf-8?B?UUM1VEtvVUNmdTlndVhFdHhIa3VVbE1SeWMyMVAwOGVOalFjN3JDK2s0OFRW?=
 =?utf-8?B?Qy9UTTJQRFgvcEhtdGlWdzhkKzRXT2MzMVJBQks2czZhTFZmZy9aUmNXazNl?=
 =?utf-8?B?QXNJMzB2WTl0V3l5aTZpODRWam5CQk5ycFE3TnhBbjhpRFNBRUJXQ3VZY0J3?=
 =?utf-8?B?TkRadExuTnIzUHUyZWFSb043bWMwL29CaTQ3STJ3WEFZTVYwWnRhYk44RGU1?=
 =?utf-8?B?SW43MUhqY1prcGFrZjNHaUM4Z3A0RlVmVU1BMEowT2V6SzZ0RUdiOGR6OUF5?=
 =?utf-8?B?VDNzbnUvVVN5Y1JJMWphOGJEMnd4TGpLYzdHM2NJU1I4RHU5YkUrY2Izd3ls?=
 =?utf-8?B?VWxGTEltSzllTm85V2pveGV0WGdPRU9KSjh1OTR2MlJ2ZXJIaDEzalVpYkhu?=
 =?utf-8?B?RklsUVkrRUluRU94MmRqOFMzWE4rSloyM1Z4TzZid3l3KzNPME8zeXhVNzZJ?=
 =?utf-8?B?V2RWYjFEbmZ5Q1ZsMUlQTE5DbWlnTUl5d1dNdDNacXVnckEvMG1ucitpbFBD?=
 =?utf-8?B?dGd5MlRvcUgyNjhxUkJjekExTkVMbGhoa29pZ25hdVlqZDZudlR4Q3FORldR?=
 =?utf-8?B?UjNsQ3JZQ0MreTFENnRhRWxIMU5TU1dvQzE3U2Z4bEtKazZ1S0tHV0JKTWwz?=
 =?utf-8?B?NUIxZDg0djZvMDYrN2VVUm1xTHZqQkdHUjVZMHY0YldEZ083aFc3aEFpK1A3?=
 =?utf-8?B?NWZQejdZc3RZbWNMY095OFpCb3hyVHhFRjdtZmhEOWcwUHhGT0R3dkwrWU5o?=
 =?utf-8?B?MlFHTzhwSVZybEpVTU9XbUw4aTVmS25KZFNIOFdJMVNiWDJhWjExQjUrRWQr?=
 =?utf-8?B?V2d1dE9HcEQ2cG1qbkVCN2NabG9sRENQNlFaWm5MWVdMOGZJbFRzTElERHl4?=
 =?utf-8?Q?anPuy8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:39:59.4412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd788429-93a5-4df9-b6ef-08ddd44f7b7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6306

On 2025-08-05 14:38, Grygorii Strashko wrote:
> Hi Jason,
> 
> On 05.08.25 20:21, Jason Andryuk wrote:
>> On 2025-08-01 11:54, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Call stack for dom0less hwdom case (1:1) memory:
>>> create_domUs
>>> |-construct_domU
>>>    |-construct_hwdom()
>>>      |-allocate_memory_11()
>>>
>>> And allocate_memory_11() uses "dom0_mem" as:
>>> min_low_order =
>>>    get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
>>>
>>> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
>>> which causes min_low_order to get high value > order and so no 
>>> allocations
>>> happens from low memory.
>>>
>>> Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has correct
>>> memory size in both cases: regular dom0 boot and dom0less boot.
>>>
>>> Fixes: 43afe6f030244 ("xen/common: dom0less: introduce common 
>>> dom0less-build.c")
>>
>> I think I introduced this bug with the dom0less hwdom support, and the 
>> correct fixes is:
>>
>> Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> dom0_mem is also mentioned in the comment on line 252.  With that 
>> changed as well:
>>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> 
> Will smth like below be ok?
> 
>    * We first allocate the largest allocation we can as low as we
>    * can. This then becomes the first bank. This bank must be at least
> - * 128MB (or dom0_mem if that is smaller).
> + * 128MB (or memory size requested for domain if that is smaller).

LGTM - Thank you.

-Jason

