Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tG/xMQo7TmqdJQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:56:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934B726129
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:56:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=AtT0Ehje;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356926.1611447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQtA-0008BR-Ej; Wed, 08 Jul 2026 11:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356926.1611447; Wed, 08 Jul 2026 11:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQtA-00088m-Bs; Wed, 08 Jul 2026 11:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1356926;
 Wed, 08 Jul 2026 11:56:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whQt8-00088g-R6
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:56:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whQt8-00B9DF-48
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:56:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e3ad0-bab6-0a2a0a5309dd-0a2a450ac4d6-36
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:56:25 +0200
Received: from [52.101.53.60]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e3ae8-e40e-0a2a450a0019-3465353cdcd4-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:56:25 +0200
Received: from MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::24)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 11:56:21 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:303:115:cafe::12) by MW4P220CA0019.outlook.office365.com
 (2603:10b6:303:115::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 8
 Jul 2026 11:56:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 11:56:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 06:56:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 06:56:20 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 06:56:20 -0500
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
 b=R++sG7T8cs+n95gD8Bg0hUH9BrVpVzNWKYEzUzcvBW5ZiW/BWzUg+6CN1FhQVaCeLFRxDPGh5Kh5mGSkN3koTfwlapMXFjntWTE9AM+ayGj5bptu036kFtUnOUMAT88vv+qcHNLocjvpbn4tdtrZPJYPOCJqlLiRD5ElwIdUjzENb4x2YRG2gPihd2dwtUEPMxna/61rTzvHYiLArOyQDQSDuBRBhqe0daDKo120Cxh1L4xxb3kvodC2JfDWv4jMKFgGbIApE5oGneVMtTxrgKHjKLQ/Zc5x0fi8xnB/arSvU86SRo3QEauKrvPLZzrwToy7jNy7lx7aqOzW96QnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg3veLJ5bFvpUxZCmsRjq2Uwx0d2pEgjBnEG1POC/E4=;
 b=WuCu1S9a07NOStcmWAD4sUeZIDGw8aRaFr8zKGdmEP2ApWFt2KZxwElawTZJUR9xTWqNrJOyDxyPTt6B2g3XZk7765x+Y1z1XVPZd4lXzu/4/bU3sjnBcqSfkvZI5i6E/LrBq5fHrQFCpKMjJh/Ir2Au0c19fMCRg/weN9a9B5OuG9nDbfy2A9PjaBIGHaQ3zQDaaVY/T2J3OC4aNKgPoaHI9OLd1ahCumofvAmvAyed1Ho5ouLDv8L8HKsrkoIxwpPwFIOf54kPxqmknayNmOqCzp0+sx9sv16/gafZh9/Ea+IlZBNJykQqjw6QxVeG3wJUnJy9olkU0aaRlbDXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg3veLJ5bFvpUxZCmsRjq2Uwx0d2pEgjBnEG1POC/E4=;
 b=AtT0Ehjee7XwcrvKwnFfwWL5CA9zYNJf9yEMVagMo4yfJdbKSH07lh/4uhjHT1Q3MqqB/Xfug/yZawBEliN7VEjMXpuqzAUlszTEDfJjfCyikZ6DXXN7r3q7/nLjFYRrbelE3KkwnITeB5SH9WsGMzYEUIxzVreWygVMb7FR8Vs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <93586087-5fe0-42e4-bb11-bc8b50625be4@amd.com>
Date: Wed, 8 Jul 2026 13:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260708074919.33381-1-michal.orzel@amd.com>
 <6594c467-4cc2-4a61-bbed-def8179cd712@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6594c467-4cc2-4a61-bbed-def8179cd712@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bed4a8b-0bc8-4827-0062-08dedce7eda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PltrxVNx0k3ZjGx/hBWcrEgq+QFIFvTR50dKcCxrQq2EfrSCg+wRRVFXvxOqAPNKJKPuUZuGeRhBIisO8rGYESHdx53qu8lc7rfxj1RXzH6pqneYFi6HA1nfNDmB/60O1BJylwVzoR/kG7rOggD55X1OLgbHMoUcD+aTLUITgS7C6WycfKgsgY8e4cvkWFdsklC0BdARhwmStiVjbWF0he9fu/QS62HSBOv5XN8vFvJezpMTCwJyASR8YSBTGXCt6tTD10qu5KXZ6IuAsU/I0kzm8F5zbSaFPgyiv0Po+Kxf+aWcfRuwrEqf4kDPxuke/V7vJrqEpNF+SiC2rzAQg0gjLvA5xQiWXfTiSRljRP8nAE8R3u5daiqIS+9QlTj5F0YLM2KTX4dyKDnSfDR3BUCvEMRilOuSOw6RKdWEprFnnM2QNHo811Bt/l2/Sx9ie8otM6RYFXDbkD+uBDoX9P4uLc1ZOG3iwMC/QQeiZ+XTaCtAerohjZ6LEOmtwUnMaVZf+2JZalYZ00IS+iO23VbFvFjouDg5z44rSMKeg0ulIvgWH33NOtQqx8oSbfBtfelV6h5XjnNEDDu6Ngr68dlHCmVE5qtq/KpoZi3XnZqSg6SX6VeX0X3tIops0u5BoOqN/IrMRTSrjlaIyiQyG3L2cIGdExL9Ss8w+9ZYHIh44A8ZxkyeIL70+r7AyxdWDposGuLU4D/c0U09HbvOfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L3rFaousKr4EmLjwVwqU+3TKr2My9pM8Rf0UePCIgiRzhkAyUUAA2WHb+Cl7U7llczOr3Q2B+Ao+xQblKWMJVKHXLKLWM8AxzhWYJ0DhUwGH4wzOxJHP21ocqc4CFlhIetqpj5YmHMe95Fpw4Fu/uQErHS9P35S6iGKVkQlabcrl7+0nMuEOCaD+Tc7k4njU9wtbB4ASySMJ76v2jtZyttLUHOjfUlfug6YEVc/z6uvOKbnJBt8eu6/lsWEynQkdai9+fBAV003SluYCzjXL1JXEvsLt2G8GTk9CsjQaW30uNV9NhYvFCfE/Bt7x+oGxJ0+WKMG16uJzMkJS2nYTQUk9xQTllxo5EaXzBS6+nioNb4pxUzWxsTos4Z8C5ou3rDMHnBJf4se1VNQT63pEsWuwH7PwcZGVRHDlRBRAm2zJmIpuCdKV3Tdwh2NgNaCE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:56:21.4093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bed4a8b-0bc8-4827-0062-08dedce7eda0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
X-purgate-ID: tlsNG-4011c0/1783511785-3C67BDDE-59B27B39/0/0
X-purgate-type: clean
X-purgate-size: 1916
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2934B726129



On 08-Jul-26 11:18, Dmytro Prokopchuk1 wrote:
> Hi Michal,
> 
> On 7/8/26 10:49, Michal Orzel wrote:
>> construct_domain() creates the secondary vCPUs in a loop, but on a
>> vcpu_create() failure it only prints a message and breaks out of the
>> loop returning success. As a result the domain can be constructed
>> with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
>> below max_vcpus.
>>
>> When the guest probes the redistributor of a vCPU that was never created,
>> get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
>> dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.
>>
>> Return an error instead of breaking out of the loop. Both callers
>> (construct_domU() and construct_hwdom()) already propagate a negative
>> return value and fail domain construction, which is the correct
>> behaviour: a domain that cannot provide the requested number of vCPUs
>> should not be brought up.
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
> 
> I would say returning "-ENOMEM" is more actual here, because 
> vcpu_create() fails in most cases due to unable to allocate memory.
I think you're right. Not all, but most of them yes. Will change on commit.

~Michal


