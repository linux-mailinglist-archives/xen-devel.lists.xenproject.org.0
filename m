Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 980nBkY1TmpQIAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:32:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A78272596C
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:32:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=E1U4P9Ki;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356896.1611420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQVf-0003nL-3o; Wed, 08 Jul 2026 11:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356896.1611420; Wed, 08 Jul 2026 11:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQVf-0003kd-0X; Wed, 08 Jul 2026 11:32:11 +0000
Received: by outflank-mailman (input) for mailman id 1356896;
 Wed, 08 Jul 2026 11:32:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whQVc-0003kT-Kl
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:32:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whQVb-00GP55-7A
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:32:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e3530-bab6-0a2a0a5309dd-0a2a4506d33c-8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:32:06 +0200
Received: from [40.107.200.53]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e3533-08de-0a2a45060019-286bc835e14b-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:32:04 +0200
Received: from BL1PR13CA0075.namprd13.prod.outlook.com (2603:10b6:208:2b8::20)
 by SJ2PR12MB9162.namprd12.prod.outlook.com (2603:10b6:a03:555::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 11:31:59 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::67) by BL1PR13CA0075.outlook.office365.com
 (2603:10b6:208:2b8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 11:31:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 11:31:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 06:31:57 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 06:31:54 -0500
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
 b=O9eougur/b70K34LzG5XsyhLPO2De1Y1x3Ax7OsNZ5y44ItY2NB38PS0BU3KmL3k1ZxQZk+HEtABQ051Bje9nXp3Ks8FG1P2oLTwwBC9trFSaRH85NmmRZ9Y5Dpsyx+/LjhixLfsHBMeIEIznb1NSC8v7JItyos9+9eoMfWEYyEPOGw04wi01apAwTcxde4TIzFsIMhvsLYw0RzOvEZ2yOFwaPTbtM3a/WoznMSgMPyMZ2azoxmsB8DTVrwF2ryfRCMOBAVaNKrUNJTMaFpYkEAXghuA4L46q2+qjFgjcIcqNiaQXORFy90KNUOwMS7rYH+8/IDUKLDGm9F/vfQiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haBTB4PA7tuvCqObxfeOJ+nEpdCHen4Fqq11ICl2T6g=;
 b=BW8+pyIanZ8adzlJ8LQI4U10zRN+EaPSyPVVWFcuGsYEzYb9gDEOjHuyznH7gvWVuTmq5AqeA6DKSdvl/SF6Gh1CkUP12QmhEwBT32Pp4Ak7NEFtdp8Q2KfXQbk4PshczIGH1a37bAl5NEv2FkFdErIvA4/o4+B1aLRE0ZBY/Al25p83ogytaGtx9TQK4oCgfyTf7hQKj3M1EzfhLFNq6+H/5w3KinijvDbjgWIGPUsqm96UAKIK0/bLg9SEsWYDDdE+F0+WLf/9JkN6uPjs34s3aeVCD8a7hVQ6FZQYQEiKLOzRp7FMrCdI4N1LbzcnkbNq9Ww0fApMdCZbOnMZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haBTB4PA7tuvCqObxfeOJ+nEpdCHen4Fqq11ICl2T6g=;
 b=E1U4P9Kimy//fy/5fysPMN+pn6L3lKGF5LcGEPYSsdpQ8lYD3fyAQkdMPYKHZ1JGftmeQ+3fRNkCsiSWK1EjCOcVFNOM6u9b8Xc7rhcrg/cBHWZYrluNohf1vnmc/V9IeWd/V734ky55I2Dkxvq51MKjcfJ4kQeoNyk68bbLIz8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d3ef582c-93bf-46d2-b1be-3a75789b8ba0@amd.com>
Date: Wed, 8 Jul 2026 13:31:53 +0200
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
 <2eabc87d-5694-4874-b204-2fe60d5368bc@amd.com>
 <93dabc8b-7012-4662-b50c-d47b0b6ad260@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <93dabc8b-7012-4662-b50c-d47b0b6ad260@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|SJ2PR12MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: fea6e331-7284-4e18-4168-08dedce48576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2KyyQSjGlFOC+XZWNlOLAY3s9wrhxOvI1slH1NCB3fe5Sswz/C0uFyiiY3RNDZ7/Z6t0OJhpbBvzb2r4mU6kxm7Oed297WS3YdA4vZXwehRv2qKPs4LEqy/zmbICTsWBtoeHPe0TR5f2VTPK8cn0XUk07MGtKVlvPZOICE6JDoBrlgRqLPVFRW8J+y69DjvzOWThfqXyLwclwbVMXlYatvGKIen4ccseZUXyVGAznuUF2dNGdAYsmZuWOArpXqutdzT/avkxoLTCW4ZfqGxS47whdPpJuhxuh/v9nON83DmqZcQEWxJke2zCQcjmifW4VE2pfEgA/XgjW0BlZdOaLvj+xwxdsCMqaFQ5nsRrtegmcAG8H0AQEn1IPd/EwiGb915e58uvk/77I7T/4D4mwDvje0cz/aAHRz4w/oApR5iEFj6z9B1GAinYtRS7gCpE5Bh4ycIU2X5lcBEAP9QxWsMIfaXX4R0JoXsEJvzZU3UlIpyxqcMavX8MP21K8QQ5BO3bV72yVfNcW+I7gKdJxWaxmyx3oCVqYKlBjzvKjXN/LvciyjlvIKRso7QdGGnnBXr+LedIt//BNt1rQHDwEFGUkKvv2heydS7GT5bWk3UvOMIrKpHyvAX7VR7ONtyd7hwjSprJbhmDJgRbMy59jcL9TaP1/SXb5Vk0fy+QAZhACfNcoIhVyT3NLlVBTOHJjPZW1vbGiOOL8bL1FaL84Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OjN8H4goY11wb+kKeJXqpvMllYVr5zLA6ZBa/ZzP/MPytrgJtGNWqMNNZF1hOCy30ZGur4SqZto06/PgcMF3kFlRVVeCISWUlUURLacM++JIlmDzWab8ukN/olLshEVhA9WbDS3a9kMqHFqskBEs/j2CiZWCZ9a0TOA0415xPr/1KwvkhQY/oi9zyVobz4muSrUHwSIiEMBxeNTI/x+tMBogdjJGJFjm21n0UvjQ2XOsR5W3CCu/dbt98A507lap6qJ4/ukDSHUcWLF7EzOMw3+F4pg+l13dkhgQlUVanX/uj00Ofs1AI33qEtrBi+bR/fTn9/VTuu3pgNUKWQZDC0HEHw9CpZGHBW3MjQVcHVkU4mRp8S5lS2E+BPTSJJdbtNNK4fj5XG1t9xG2ILm+1pprAZ0IKNhECKA9mnu1XckdZQtEkx1YfyhYqjP4UFi7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:31:58.2526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea6e331-7284-4e18-4168-08dedce48576
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9162
X-purgate-ID: tlsNG-16d1c6/1783510324-C473068D-B62AAB5E/0/0
X-purgate-type: clean
X-purgate-size: 3555
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A78272596C



On 08-Jul-26 13:27, Halder, Ayan Kumar wrote:
> 
> On 08/07/2026 12:20, Orzel, Michal wrote:
>>
>> On 08-Jul-26 11:06, Halder, Ayan Kumar wrote:
>>> Hi MIchal,
>>>
>>> Nice catch. Few questions.
>>>
>>> On 08/07/2026 08:49, Michal Orzel wrote:
>>>> construct_domain() creates the secondary vCPUs in a loop, but on a
>>>> vcpu_create() failure it only prints a message and breaks out of the
>>>> loop returning success. As a result the domain can be constructed
>>>> with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
>>>> below max_vcpus.
>>>>
>>>> When the guest probes the redistributor of a vCPU that was never created,
>>> Shouldn't the guest check how many vCPUs were created and probe the ones
>>> that were created ?
>> See below about DTB.
>>
>>>> get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
>>>> dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.
>>>>
>>>> Return an error instead of breaking out of the loop. Both callers
>>>> (construct_domU() and construct_hwdom()) already propagate a negative
>>>> return value and fail domain construction, which is the correct
>>>> behaviour: a domain that cannot provide the requested number of vCPUs
>>>> should not be brought up.
>>> I see your reasoning.
>>>
>>> Alternatively it can be a design choice. Xen does not commit to create
>>> the max_vcpus that was requested.
>> Everything can be a design choice but this one wouldn't be wise, would it?
>> All in all, we (Arm maintainers) aim at following the contract to fail as soon
>> as possible if the user request cannot be satisfied.
> Can we remove the redundant DTB node so that the contract is maintained 
> ? IMHO , stopping a domain creation seems severe if the other vCPUs were 
> created.
No, we can't. First of all, the contract is to fail on unsatisifed user
requests. User requested e.g. 5 vCPUS, we created only 2 - we should bail out.
Please see all the dom0/dom0less code on Arm. Next, DTB generation and vCPU
creation happens *before* starting domains, so this is definitely not something
severe.

~Michal

>>
>>> If Xen is unable to create any vCPU, it should abort domain creation.
>>>
>>> If Xen creates lesser number of vCPUs than requested by max_vcpus, it
>>> can just print a warning and carry on.
>> No. Xen creates domain DTB before creating vCPUs, so Xen advertises something
>> that is not true. Here, Xen would create a DTB with e.g. 2 vCPUs while only 1
>> was created.
> 
> I agree that this is a problem.
> 
> - Ayan
> 
>>
>> ~Michal
>>
>>> In that case it should be the guest's responsibility to check the number
>>> of CPUs that it has.
>>>
>>> - Ayan
>>>
>>>> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>    xen/arch/arm/domain_build.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>> index 550617f152bb..b46574fd32aa 100644
>>>> --- a/xen/arch/arm/domain_build.c
>>>> +++ b/xen/arch/arm/domain_build.c
>>>> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>>>            if ( vcpu_create(d, i) == NULL )
>>>>            {
>>>>                printk("Failed to allocate d%dv%d\n", d->domain_id, i);
>>>> -            break;
>>>> +            return -EINVAL;
>>>>            }
>>>>    
>>>>            if ( is_64bit_domain(d) )


