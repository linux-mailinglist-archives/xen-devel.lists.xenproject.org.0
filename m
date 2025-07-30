Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0153B16802
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 23:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064482.1430090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhE03-0001mG-AV; Wed, 30 Jul 2025 21:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064482.1430090; Wed, 30 Jul 2025 21:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhE03-0001kL-7p; Wed, 30 Jul 2025 21:06:11 +0000
Received: by outflank-mailman (input) for mailman id 1064482;
 Wed, 30 Jul 2025 21:06:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dkTI=2L=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uhE01-0001kF-6q
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 21:06:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0146311d-6d89-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 23:06:06 +0200 (CEST)
Received: from MW4PR03CA0073.namprd03.prod.outlook.com (2603:10b6:303:b6::18)
 by PH0PR12MB8798.namprd12.prod.outlook.com (2603:10b6:510:28d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 21:06:01 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::de) by MW4PR03CA0073.outlook.office365.com
 (2603:10b6:303:b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.25 via Frontend Transport; Wed,
 30 Jul 2025 21:06:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 21:06:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 16:06:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 16:06:00 -0500
Received: from [192.168.18.248] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Jul 2025 16:06:00 -0500
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
X-Inumbo-ID: 0146311d-6d89-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ6AHKVwajdeW1QiVIhLPEhp7LKs07Wg+3KJMUQvMNmCOzVMQqfY1R0Y17bsZlfau7Bodv4+VW9gL0tXt9mDMYdiCtGWh9EEM02Xh3ZMtlWCkP1+lJSWtzUr1Hc56OYAAVQu9CDlmq5M9MNwgh3VRHCSdZdAZdG4RTlqLVhWShSyeKR255qCsHcxUi89mpJoXNOVBtqhoD8XS/+PD3DPCCvDpfO11LCWqevYPjctJWXK+ptgBQgpxF++V5Fb3zMYYIzLEo7e9QGihnuFDqTO4D/7dK1abkD/cyuIhEat1LB8E8b8p6n1EvC+sjFpHXi6/ZPWPzwCQOdFQ0InuDwxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi9tgzhIs4miN1EK+9aVL2wZ6Sk+LH/xIyL3np/Wr8g=;
 b=Dj7iQEvtJyfWusFtUIXLB73s0Y1hbnC3M8FKvcVrniHCT6FWbSFJHu0qgZ91Z6THEU54p1TNBBP05qL6mA/GJTFzPIrj+thYLiRmV2GsU52OpyQdb44e1wQULBUWZXUoNHpsqyDxBB9ZvpcLGSYiB4DeC3LCy4tyuaiA2BtkfKmwR/S1swcNUk4TDIXQXmm5M58DRKg1JYqEgBzV5KCTVl9aOAVQwZO5+woDArXeJtK0R7t9zBbUA07ANXRSrfJN+d+I+g7zgBjaJVnXR+UM1u4MigX/X5bqfUaZd85kRSulOF1xdfp3tEBu70vmmsqdVFMwa1FC27WGuYtcHXaSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi9tgzhIs4miN1EK+9aVL2wZ6Sk+LH/xIyL3np/Wr8g=;
 b=0l9h3xJhpbjlVs6Y1xOwmOLiZxNgHazHC5pA5Nfy9GExY3o/6uSMGT2njOuxX1WwFA/+bly4HqEHpfbIAnWaI799CApVYshEEUW+lkHAhsDrcSsRTPYnNgzYTkRWHqpf4GBMJpB+XrbkpKmZOb23SzNLeuFopLwpmrypRhDVJis=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6d46aed3-6c55-4aa8-8a21-bf8b3edaa2dd@amd.com>
Date: Wed, 30 Jul 2025 17:05:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] xsm/silo: Support hardware & xenstore domains
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-3-jason.andryuk@amd.com>
 <90d5df6c-b431-4256-b39b-4567ab5bf8c9@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <90d5df6c-b431-4256-b39b-4567ab5bf8c9@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH0PR12MB8798:EE_
X-MS-Office365-Filtering-Correlation-Id: a578f53a-4a6b-4275-c932-08ddcface34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUJBcFhlWW5jS25FVHdDUUVVSUNYYWFqcmY0WitabFJXWjhxbHJPMkRscEZS?=
 =?utf-8?B?c1RqY0lmSkhsQzVDRm1UTHVZa0pyTWNRd1JmYnVjcEc3Y3VPYUZEMUVBZlpE?=
 =?utf-8?B?WVNueVRxOXhNTHNrdmZqYk9rbVdrWkY2TUpUeEUzWGlxeWcxZWp5RkorTnVz?=
 =?utf-8?B?Wm5ZQlVLM0s5alo0TEoyMm11MTFxMEpQUmdrbTN1em5ldzM0ejBqTThOZW1K?=
 =?utf-8?B?Z2F3WnBNQnhlQWxEdHZUVkVDS0tHaGxYOS8zY2gvbXYxelhBb2tPeHQvTDNX?=
 =?utf-8?B?T01hNFBDQlJKZWI4UzhTSzlWSFFCU3ovSkhyTWtLdWY2VmVBQTJqT2p5cks4?=
 =?utf-8?B?UUhDNURJdHVSWG84ckdnekU1Q2RKM3FGTDROdHBoL0NLS2V3RWpNSUJFNW1w?=
 =?utf-8?B?QmpPVjRmdDdhK3JtVHQ4UFdBYjVHUFliZEt1VFN0WGMxeG5wWGdkaC9CdDJx?=
 =?utf-8?B?UVhKSTc5Y21MdlRvZHREMVZqdFhIc2JyejdCZjhpbGdmY2pOQklIeVlHbVNp?=
 =?utf-8?B?SUNGLzdyckJacVg1N0lBOEQ4UlJsU203dUREc3l5SXJma00xOGRXL0ZjRFhE?=
 =?utf-8?B?RjU0OTFSZ04zWEI1b3Q1WnBVSDU2K2txeTV0RkIwYWozWWRuaG1hcHhSSDUr?=
 =?utf-8?B?OTFqUEZzNkwzenBIR3lDdTBRdjM2Um1FUUZzZDEzUXc5SnVFVWlaSVdUZHd1?=
 =?utf-8?B?bXFkcTBsTmRSSWtJWnJNenpzYWRpY0RJZDg0VkZqTmhYaDBGaDY2V2ZzVVln?=
 =?utf-8?B?QnFwOGw3ZjFxUWRIR0VwdEZQRHgwbDBPKzNiWVpCbUYzV2JhelRWaGg1ODVh?=
 =?utf-8?B?cjIxUTZDUnhXZFFnQlQ3b0hLcGpCeXV4cGh4Mkd4bFM1a00wbzhvT2N3bSsv?=
 =?utf-8?B?blhVUkZIY3VmQUJXZkhpbndvWUF6WnVDeitWbVZkVUxZOURpWXpNbnFxcmZ2?=
 =?utf-8?B?RnJIdUU4akNPYWlEcE9PMk9tZXFWRUdQV2ErcGZZZGlWUkthZ1BXZlZVYjdl?=
 =?utf-8?B?WE1XU2RjQkFNYXlpb0EwZVV1T1JaMlNPdTN5R3hXbE9HbzFsVWZ5ZjhjYXh6?=
 =?utf-8?B?YXpubWtpQm80cjlvN1VKTUtyZVhxK3Q5WmhJVm41TVlyRysvcFNqUDJGRXZL?=
 =?utf-8?B?dXNncHppVEdSUHNRa2VFRldUaUVxWU9mWElMN3pzOG9ERFJJNGl0SlpLS3JM?=
 =?utf-8?B?Vk9WTCt4MzU2UGwvZkNHYnNwWXhCbEtYR3BhcE4rc1E3NUp0MU9aYVF6b2pL?=
 =?utf-8?B?S0tWZUd6VGFMa2FaaFVvQ3RQcjAvMThITHlxZFZTazZObmx3VDVZajBXd2dC?=
 =?utf-8?B?djl2QlNwVVVjUzNjRXpUMHF4OFdzMGNxeU9GRlhlYU9NZmVBaU5hMCtoU2g1?=
 =?utf-8?B?dVZzVkh0RVJUd1lLby9TZ1R0enlENTlKeWlBMHJ6UU94bkQ5QTFUMDFQUW91?=
 =?utf-8?B?T0Z3WHVCNWRJTXdDcmI3eGMyaS9GWTJpUm84Uk9mTnRvWnVodnlNQmZieWNS?=
 =?utf-8?B?aklFMlA1T0Z0TE9CWHloN2J3M1Z1WUl5YkNzVEh0MXdsUy9tSzB5YWswVDZo?=
 =?utf-8?B?NWgraFNLaGlvdjFsMHYxL1ExWGw5OUoyY3c2Tkd3cEFmaEcvbjBMa1g1cmxK?=
 =?utf-8?B?cEdpNkZZZGU1eFBIRStMUWtZbDVSWnVjZlgyaGptUXhLT0M0U21jOC84T3Fq?=
 =?utf-8?B?MkF0QlVhcDlKUHo3SXI2bmlBYkZDcmladnowcjI0TG9nWTRGcXN2b2grK2l0?=
 =?utf-8?B?bi80dHBubjI0UDNPbkxiT3gweHZCTWVTVm5UWjg1OUtyaWloWVBxYlk4Tnhz?=
 =?utf-8?B?MGQ1MVdORmRDdGl5aU5pazBULzc1VHp1bUdqSDJnb0dVeHZDWGJsNEJHSy96?=
 =?utf-8?B?ZlV3V0xUSW9rdGdhUGNxK0tBYTBaTmdsdkpDUVBKdUg0U2dDYjZTd29Bb2lN?=
 =?utf-8?B?ZFgzN2ZCWGd1Y2wyd3pLZEN1UjZSNDFiME5FMmtsLzJrcDNodXBkMGh4T2lC?=
 =?utf-8?B?czltL2tHMlBmTGV3MjdqTTkwQ3QyUE0xUFRReGhVazNsVGFjQkxvS0tPQ0hM?=
 =?utf-8?Q?teJHVV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:06:01.0749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a578f53a-4a6b-4275-c932-08ddcface34e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8798

On 2025-07-30 06:17, Jan Beulich wrote:
> On 16.07.2025 23:14, Jason Andryuk wrote:
>> In a disaggregated environment, dom0 is split into Control, Hardware,
>> and Xenstore domains, along with domUs.
> 
> Here we are with terminology again. In a truly disaggregated env, yet
> more (service) domains would come into play. What you mean here is
> only coarse disaggregation, as you're trying to get away without using
> Flask.

If disaggregation only means, fine grain disaggregation, then I'm not 
sure how to differentiate coarse.  I could write "split control and 
hardware domain".

>>   The is_control_domain() check
>> is not sufficient to handle all these cases.  Add is_priv_domain() to
>> support allowing for the various domains.
>>
>> The purpose of SILO mode is to prevent domUs from interacting with each
>> other.  But dom0 was allowed to communicate with domUs to provide
>> services.
>>
>> To provide xenstore connections, the Xenstore domain must be allowed to
>> connect via grants and event channels.  Xenstore domain must also be
>> allowed to connect to Control and Hardware to provide xenstore to them.
>>
>> Hardware domain will provide PV devices to domains, so it must be
>> allowed to connect to domains.
>>
>> That leaves Control.  Xenstore and Hardware would already allow access
>> to Control, so it can obtain services that way.  Control should be
>> "privileged", which would mean it can make the connections.  But with
>> Xenstore and Hardware providing their services to domUs, there may not
>> be a reason to allow Control to use grants or event channels with domUs.
> 
> "may not be" is too weak for my taste to forbid such.

I can't come up with a concrete example of why Control needs to directly 
communicate with a domU.  Originally I allowed it, but it was your 
previous feedback which made me remove Control.

I don't have a strong opinion on the handling of Control.  I can see it 
argued either way.

>> This silo check is for grants, event channels and argo.  The dummy
>> policy handles other calls, so Hardware is prevented from foreign
>> mapping Control's memory with that.
> 
> By "foreign mapping" you only mean what would result in p2m_foreign
> entries? But grant mapping is okay?

Yes, "foreign mapping" = p2m_foreign.

Using grants requires explicit actions on both sides. 
silo_mode_dom_check() passing still requires action by both sides to 
establish a communication channel.

This is different from a foreign mapping, which is a unilateral action 
by the privileged side.

My intent was to highlight that allowing hardware domain to pass the 
silo_mode_dom_check() does not grant additional is_privilege permissions.

>> @@ -29,8 +40,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
>>   {
>>       const struct domain *currd = current->domain;
>>   
>> -    return (is_control_domain(currd) || is_control_domain(ldom) ||
>> -            is_control_domain(rdom) || ldom == rdom);
>> +    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
>> +            is_priv_domain(rdom) || ldom == rdom);
>>   }
> 
> IOW we're turning by 180°? Interesting ...

While the previous code is written "is_control_domain()" its use in silo 
mode is really "is_dom0()".

(Working on this, I've been thinking about how dom0 is like the god 
Janus with two faces.  A single entity with two faces.  We use 
is_control_domain() and is_hardware_domain(), but often it is just a 
different name for the single dom0)

As stated above, domU <-> Xenstore and domU <-> Hardware (for PV 
devices) are needed to allow those services.  So while it looks like a 
180°, maybe is_control_domain() was the wrong name for dom0?

Regards,
Jason

