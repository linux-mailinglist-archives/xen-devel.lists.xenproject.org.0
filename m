Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nVHgKko0Tmr9HAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:28:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC77724F92
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:28:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=oI9We4Yy;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356878.1611402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQRG-0001lE-A8; Wed, 08 Jul 2026 11:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356878.1611402; Wed, 08 Jul 2026 11:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQRG-0001ji-7F; Wed, 08 Jul 2026 11:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1356878;
 Wed, 08 Jul 2026 11:27:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1whQRE-0001in-VE
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:27:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whQRD-00HKEf-VU
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:27:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4e3427-5cb7-0a2a0a5109dd-0a2a4506e096-0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:27:35 +0200
Received: from [40.107.201.71]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a4e3426-08de-0a2a45060019-286bc947206f-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:27:35 +0200
Received: from PH7P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::29)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 11:27:29 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::f) by PH7P221CA0012.outlook.office365.com
 (2603:10b6:510:32a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 11:27:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 11:27:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 06:27:27 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 06:27:26 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqWbRviiqOTsA04D7GBmUU0+93ZZdoMMgemiBkjVwK3rvVpAKqg2He1oqZv/ymqKMgOAVJgrV7m5bnKgJnZ+9QcDrp1oBlRVPYUoF8MI2wy0CYRFvsSi/LTbLmCjzocWIHnycGaaiE+njHZc2vhKBLlqPNvdKAdkIJkXgkrbwn04ApWdVacUjrdxg+tXXxRGu21PO+QITRlFiBwEyfrbAnbKpd0zIsW6fWbrB4LYbHQWlUmh2MGM47izRklIMTK4OqWcqYIExaY8TvEB3/eUwdCB0DRsIBKVDos4a/UbfLUdyqro0WXuhVB1rVX2sjs/SBYdhDD/rKks3gTWQlHOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWKvp6v9j1JJh1sIv5hHmLnu/UMxftDadfOcIhnV9sE=;
 b=oiPnuFQcQh0md0Gupkju2iDKnYmljOnnLlL0ZjA5KDqo0/FhTyrhTsbSjESLHmI9PxNw2DoTE+AiwFvPB6LTC7D4+8netZJdWovAQ3xA77ixid2Fy0EC72vZyCXGoprnPiMeiljt5Kac4uvAkEUyF172szBuEqOHoylmgv6ZhX7lkHwHsjR2nYrdxL1FLdqjzCmJeiIkJsFOhVTQurQ2L9uhOjdKcSH8Q7GMvoMs8mnF7yoUMdq7xrWH97FoBF+l8OrUWTlmxQEYkTEU0A0TTWgGFM7KynW7xdqrrkGpEnfnZLprN1hUSPzhfJA4vkiHlvthmXEqlSHZ+eoCrtFZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWKvp6v9j1JJh1sIv5hHmLnu/UMxftDadfOcIhnV9sE=;
 b=oI9We4YyWP406DAbvuO/DofcFVPC28BrdAnE7gyTXxK/+fbTKjSvRn1Zf5spvzEvtvyNznI4MuIpfC4pk+Cw3G1QmmkHLlHFI0xzSexZNBJGs2Y37dOFmVvt2k9EKH+91c7xG3LNNZsUn2c5OdUGFRgx/dniLoSB3vjVFqCEtKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <93dabc8b-7012-4662-b50c-d47b0b6ad260@amd.com>
Date: Wed, 8 Jul 2026 12:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <ayan.kumar.halder@amd.com>
References: <20260708074919.33381-1-michal.orzel@amd.com>
 <197f5208-b9ca-424d-a7e6-0b872e6511f1@amd.com>
 <2eabc87d-5694-4874-b204-2fe60d5368bc@amd.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <2eabc87d-5694-4874-b204-2fe60d5368bc@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7bcaec-989c-4ff8-acbe-08dedce3e51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IHajuGv/7L+VrbmwhpKvcsVcaQriiC7RqtKSOykrtrgA2WFLRcgQTUEB0JSu3kwqiG4twwMeqAvT3eYWPgv/6sLsI2ESOR5kTNHJ8RWDxeSXXwreQ9TBx0qZqkks31OKk/H6yiXZ/dQueU82S3PVb4JMMDYFlBZrmA2+urDanrmGPTHyqQu8XCxRPQQGj32VN8tlbS4iiXmRK4e4W7ebf0TMyBTbxumqyc9V0GRnHfrvxTYnog0CXpwrM9g1MgHY/uu0udOYKC2b155NIUmVFQ66AJKb53nkXWm4Osp5sEd1eLdSW7N2fC/C8agJ9Cj6jSUpI4gCUw3Vl2n69zWpD8AhnvmWnt85oQgzJNXZhpjho32OqqtBA06NY7UIdOO3YpkT+kdiyPJ57P3LuE7yCvb8X3Xd2U3bkpd3SAiGCPQdzIbWRLkx0vS6OqYMPx24Q6euvk1/R4dJKfENcawF4eokZ3HnrmIuTcMe4vA96a2o8W9Vrji4PAe+OyZY+c/4v2zcyPDA5zYq6D7SqxYXRc52SkmCC4vk/7P41hS+M9QGaGiy6LKHI88WwZ0b1POPrwr7sFmmLi2bfaYRbpn5NRgjxLM12d50Bcin9/dF9DNEGkPWAt8uwkQWsGex1O0CsQzfQ7igAmSnmkdlqwz32G3H7p1M3vUDX9bNfF+lnCs1E3UNRWBvPw1GBquh3RckB5SjEQyyJGblQ31IAIyp8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VU9UwTo01rI6dc+6a5HcktG1Fu734rE3qkf9me6DVQhCmgC5yUmGdO1DqXoa1eZdm/Su7zwE2voKnIafrEEZuZVrcYLGB0tXMFDbLRggjLBNDNvd/eQxR1Qz9vfN5CC1poygx5iCdS+baRqinol+avrxw/uWhak+NX84d/xRe7BLU7HVTZl7orJfH4ZzvybvprSOADSYGa4of1zVl28QHPZOT0BvRxCvhQ4nawbLDXPMX7GVwJROpf5m/Hom/iJpYv8fbhiQ6SI3EYDHpy9j/UK6qgs6sDyEGdXJdbKwMkg6w/vt2duKjaHLNniRhmV2gEQTqJRNJjxpvxa0kFfXUxIj+XR/8IFLDQoRt9Xp4dSw6jE0hF5hAfYy4+fTW+wbmc2/Fi6kv9mcbnJ906z6xK/pzhoA2Usm2QB1i3SLu15OKrFkiMIYlm7ZoBva2MUw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:27:29.1936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7bcaec-989c-4ff8-acbe-08dedce3e51b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011
X-purgate-ID: tlsNG-16d1c6/1783510055-C692368D-C6ECEBEF/0/0
X-purgate-type: clean
X-purgate-size: 3081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CC77724F92


On 08/07/2026 12:20, Orzel, Michal wrote:
>
> On 08-Jul-26 11:06, Halder, Ayan Kumar wrote:
>> Hi MIchal,
>>
>> Nice catch. Few questions.
>>
>> On 08/07/2026 08:49, Michal Orzel wrote:
>>> construct_domain() creates the secondary vCPUs in a loop, but on a
>>> vcpu_create() failure it only prints a message and breaks out of the
>>> loop returning success. As a result the domain can be constructed
>>> with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
>>> below max_vcpus.
>>>
>>> When the guest probes the redistributor of a vCPU that was never created,
>> Shouldn't the guest check how many vCPUs were created and probe the ones
>> that were created ?
> See below about DTB.
>
>>> get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
>>> dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.
>>>
>>> Return an error instead of breaking out of the loop. Both callers
>>> (construct_domU() and construct_hwdom()) already propagate a negative
>>> return value and fail domain construction, which is the correct
>>> behaviour: a domain that cannot provide the requested number of vCPUs
>>> should not be brought up.
>> I see your reasoning.
>>
>> Alternatively it can be a design choice. Xen does not commit to create
>> the max_vcpus that was requested.
> Everything can be a design choice but this one wouldn't be wise, would it?
> All in all, we (Arm maintainers) aim at following the contract to fail as soon
> as possible if the user request cannot be satisfied.
Can we remove the redundant DTB node so that the contract is maintained 
? IMHO , stopping a domain creation seems severe if the other vCPUs were 
created.
>
>> If Xen is unable to create any vCPU, it should abort domain creation.
>>
>> If Xen creates lesser number of vCPUs than requested by max_vcpus, it
>> can just print a warning and carry on.
> No. Xen creates domain DTB before creating vCPUs, so Xen advertises something
> that is not true. Here, Xen would create a DTB with e.g. 2 vCPUs while only 1
> was created.

I agree that this is a problem.

- Ayan

>
> ~Michal
>
>> In that case it should be the guest's responsibility to check the number
>> of CPUs that it has.
>>
>> - Ayan
>>
>>> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>    xen/arch/arm/domain_build.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 550617f152bb..b46574fd32aa 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>>            if ( vcpu_create(d, i) == NULL )
>>>            {
>>>                printk("Failed to allocate d%dv%d\n", d->domain_id, i);
>>> -            break;
>>> +            return -EINVAL;
>>>            }
>>>    
>>>            if ( is_64bit_domain(d) )

