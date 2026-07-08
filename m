Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FpADALwyTmr3GQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:21:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5330A724DC1
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:21:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=GRRiEi3l;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356868.1611393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQKm-0000xX-MT; Wed, 08 Jul 2026 11:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356868.1611393; Wed, 08 Jul 2026 11:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQKm-0000uw-JO; Wed, 08 Jul 2026 11:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1356868;
 Wed, 08 Jul 2026 11:20:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whQKk-0000um-Tg
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:20:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whQKk-00GyKM-1x
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:20:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e328c-e002-0a2a0a5209dd-0a2a4501af60-22
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:20:53 +0200
Received: from [52.101.53.0]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e3294-400f-0a2a45010019-346535006099-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:20:53 +0200
Received: from BL1PR13CA0157.namprd13.prod.outlook.com (2603:10b6:208:2bd::12)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:20:47 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::58) by BL1PR13CA0157.outlook.office365.com
 (2603:10b6:208:2bd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Wed, 8
 Jul 2026 11:20:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 11:20:47 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 06:20:36 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 06:20:34 -0500
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
 b=ClH6vE4MAPsiupZSP+y+Bjj6cSMDu91z6B6r2KpHSD9LFBLAy02ZOIegJYE89VQHZlcRLjEImO7wVF2momk+V8o+NQtnIJOLC9KK8Sy54dUgNL8gTb3uIx0vhoHXA42RQtqcchfKuREB3sq/1D1l8tUbPgrz9cIM7fJR1wJWJzdqICJLLaDipUTmydgOsrJKgryLFGdA1hyZKTbiqwe64KJIKmdCxiWQ97qB1y3trl4PTMqdzGokyckQzmWTlIajFAIUE/TcHkSXQXGS/qhDaA2gHEvIZ/3lr/zFQLnvBny/Pf1aGDnxCSNRdixAkubifufIY5ypvgbTlnV1DNzFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XykjLd66eOHvWRv1MmSOBNPvtRRHmI702hyMzVtzvlk=;
 b=rwpfKzIwWJEllkQT5TR59pjtfzLzMk2DvUvtFc/dZSAoQnpqbvHCTXtHoTSdOR9du3XZh3VgBTI/9DkmC9hfMI9VuW+ybwkI4P5GYky6ap3KyRfyAeUI5+pVcyu/Z6Oih5ygcBP7yAqerTduceJ/3dR6pp7Dzs10Huu34zeFSwXpYDVQYpImH8bkIWdGnQN4K26hEpjmBbpq/V2xJn9v4yR8wknSIJs1V+8/ajTZ260LvKUj74/w9/SpHtcjfugZgQDFjLMEOhMKJKmTOSVyc2y3MhM1ahfOHmwtzXNIK8GaxmiyBKg5X4rwx+PYJVnuELHiCBOie7SSroNXMSP6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XykjLd66eOHvWRv1MmSOBNPvtRRHmI702hyMzVtzvlk=;
 b=GRRiEi3lPpMBUKlDMT8lYYArNfuLuzVfhysa9KhK7fgnrOS4veY15V/2Rhh4d/0yr61CoYhs1FnIW+3ay6TweZg3h4iU5/EvZJ3Tl278FlNlYz0lvhUci5VI25LxvKXArNdGDeFpPQYnR9fmSXnN9QEal/7rTw6I4q9LyAtHalI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <2eabc87d-5694-4874-b204-2fe60d5368bc@amd.com>
Date: Wed, 8 Jul 2026 13:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: "Halder, Ayan Kumar" <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <ayan.kumar.halder@amd.com>
References: <20260708074919.33381-1-michal.orzel@amd.com>
 <197f5208-b9ca-424d-a7e6-0b872e6511f1@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <197f5208-b9ca-424d-a7e6-0b872e6511f1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a106dd4-3234-4440-5ffb-08dedce2f56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	USPoayNpVE5maljdemSkJTFDLgiEgxYBVvugp3V6ZUa0ohBr3zS/NaXWQf7cFOqmuaF/V7RkXaz1sx/Wc/2vDwm03TBT2UOfzubVg6JtAt3EQ2ZwtLL2uQUjDWtF0Y5kmnlvG3FfRscKIEPBDznUFHroqWcrZr4WPSeWr2NnqsYVhfvspH8wReNJpDiH2YU/OUXLdXLwLXoD9QeDewkoYOooWb6d4ElieNPTrzf3lmLdnOr21rLtZsYGPe6sh6JPskOJBMaUB+CX+SbXX4TYW/NclQmygQfeJjpgDzguELQJMIMKYKuOyHDEo+DdkIJJShC72ca1SVAf5O3FYGsTZpNE7TGgfgGklQJ5lfdnEXeNw8ijMPgBDqT57ZWsN6vlthIT70q6hid0pGFbmCwZRHVMGweFEKvG6/HwkB/gsuftmP3dg+AeOImvlIaR94dYSb9YUjfQ258ynvScJBz/oB4IjTbHDBb+YTRltCn2cFHBcmhYoo5IgvjwYPdFmQoS+RedR2BWrg9I3RQhaOOc+3LhdfJLVDhqq9wWeRkhE/Mrn4AVll89OUopY/VNd4naqWXryqvXRUzSO4NQoqD6wHpmyCdoyj+OmfPodn+Ws1rmndXdxTf+dTSnYL/+xR+38y3j0vxz3RPXu8OhpQQvG377FV2XzzXpo5XE3KlqRu0XQU9ooG15OxlZJMjQ9FflwlETdfcLCniHLnQDb3VN5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xzD5bVq7Z/whr4GGkKDdsBocRIvi4V2VgaqbM/pGYaZoRWesU1GSAwZHBbYF8fYr+Ft41SePeXgZBLDkd7oK+3hUVfaDgZJD+tVG6oEu2PzKNuYj65outIimWiqZp4e/AgKQiRvHh/kfJM+o8xPW6JLxd6+ljBodTgIUSefcIZzEb32qYo6w8BjqnBfry7+c5ncdvLc5I1k+p/QFgnqhMPp1Cf9j1urMBZwmDS4os6HFFrUMrmiJpxtjEgauWeU5hOIDNrJqkkpr/U+xs3qUZn9NVXZz7Ci2btHDJZr0HUGjAEY6sf5YtnfZASmnJcPGNHBoq2TcboT6Bqutebq4MzBIqF3KEEG3OkWZivAxq1wfv/M0icWbeUkR5h2EjsR/mwt+PoU0UgEXyRCjIO/ZK7ySS1n6cZlykzF7v1cmi0xIEsDDKrCWZVRHEaPxFPPM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:20:47.0872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a106dd4-3234-4440-5ffb-08dedce2f56a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483
X-purgate-ID: tlsNG-d62444/1783509653-D14DD1E0-FD334FF2/0/0
X-purgate-type: clean
X-purgate-size: 2775
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
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5330A724DC1



On 08-Jul-26 11:06, Halder, Ayan Kumar wrote:
> Hi MIchal,
> 
> Nice catch. Few questions.
> 
> On 08/07/2026 08:49, Michal Orzel wrote:
>> construct_domain() creates the secondary vCPUs in a loop, but on a
>> vcpu_create() failure it only prints a message and breaks out of the
>> loop returning success. As a result the domain can be constructed
>> with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
>> below max_vcpus.
>>
>> When the guest probes the redistributor of a vCPU that was never created,
> Shouldn't the guest check how many vCPUs were created and probe the ones 
> that were created ?
See below about DTB.

>> get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
>> dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.
>>
>> Return an error instead of breaking out of the loop. Both callers
>> (construct_domU() and construct_hwdom()) already propagate a negative
>> return value and fail domain construction, which is the correct
>> behaviour: a domain that cannot provide the requested number of vCPUs
>> should not be brought up.
> 
> I see your reasoning.
> 
> Alternatively it can be a design choice. Xen does not commit to create 
> the max_vcpus that was requested.
Everything can be a design choice but this one wouldn't be wise, would it?
All in all, we (Arm maintainers) aim at following the contract to fail as soon
as possible if the user request cannot be satisfied.

> 
> If Xen is unable to create any vCPU, it should abort domain creation.
> 
> If Xen creates lesser number of vCPUs than requested by max_vcpus, it 
> can just print a warning and carry on.
No. Xen creates domain DTB before creating vCPUs, so Xen advertises something
that is not true. Here, Xen would create a DTB with e.g. 2 vCPUs while only 1
was created.

~Michal

> 
> In that case it should be the guest's responsibility to check the number 
> of CPUs that it has.
> 
> - Ayan
> 
>>
>> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/domain_build.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 550617f152bb..b46574fd32aa 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>           if ( vcpu_create(d, i) == NULL )
>>           {
>>               printk("Failed to allocate d%dv%d\n", d->domain_id, i);
>> -            break;
>> +            return -EINVAL;
>>           }
>>   
>>           if ( is_64bit_domain(d) )


