Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOdkGOcCF2qz0wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:42:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3A05E618C
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 16:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320592.1587871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSFSs-0001HQ-5T; Wed, 27 May 2026 14:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320592.1587871; Wed, 27 May 2026 14:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSFSs-0001Fz-2o; Wed, 27 May 2026 14:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1320592;
 Wed, 27 May 2026 14:42:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wSFSq-0001Ft-99
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 14:42:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSFSp-008GX9-I8
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 16:42:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a1702c9-bab6-0a2a0a5309dd-0a2a450ca616-44
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:42:31 +0200
Received: from [40.93.195.17]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a1702d5-62f1-0a2a450c0019-285dc311fcf7-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 16:42:30 +0200
Received: from BN9PR03CA0392.namprd03.prod.outlook.com (2603:10b6:408:111::7)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:42:18 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:111:cafe::25) by BN9PR03CA0392.outlook.office365.com
 (2603:10b6:408:111::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 14:42:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 27 May 2026 14:42:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:42:17 -0500
Received: from [172.31.156.136] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 09:42:11 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlGR7bYXJar2OZAIsTmCDInZ4LaeontTokQ18yrrukYFpJ8B+CKXq+25oJNwOZM+b6fGxjjMT3sBN5TC3Vnsp5/o1QcjNbr4Jlohw5ZoTNMyj7z4DTejKEi9sLoCn2kQHib6pmVQBDhqy8aFDaYKwkzYW/3sb4X3zg4i0LH6qQldafqgKOsKzhXj2fwZJ2/+al2KO6YV3MIqdKU5yZdIv+V+7Czmh/aGJZekpg0b5yOCUMuu+jHy6iL46X4VJmrSlO9F7oSPJEBgjr7gKmzttkb14JQ66ovP/a4+eJjkTm21bZA7KO25qWF2ZpHGmLz2UCjJPH9Pgsyok7bblIM7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKgLlTzuuWT+TepsQUUEsWjMz5etRLjqvFQF7cJ/nek=;
 b=Pj0RMzz2rGLVxzGw53Ut52Ok5HOTgfedbkuuQsT1/fvFkIiOKcbOev08avQ43DpwffVUED+J1Pf7AfKNQg8KHncM2452DSkqxWiMC7Wttf5CoE/kyr0XTVMPwuefx7yQvsdaPyUJWtCGb9yeUKE04w9OTK1JByDPg2KkrJDDp7bsZcW84MlhZJjMKvh+eHszlyrihtKKLcFEJeHNofiQPG5mTccWkwJ476kuxKYlmsk0T6ysS5KPkCGJBPJUrHVpdWKUGSHW5l9KO5pCt1wHx4IHFNEIY71p5nKKVaJz3p5+GKlZUg5aGdADdy3M4jzkQOGk/5/t8V+VLoPc3x8Rxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKgLlTzuuWT+TepsQUUEsWjMz5etRLjqvFQF7cJ/nek=;
 b=vXE1uzO1VQ+fenluPmmR/HAqgkW3MjygT8ffEmCpK0+LIGTQmcf5S1o3F4/EkWcgpEIhoGcymhTPiAyOrENxpZhVimlM/57ZYWDC6ADpmwiF4XpCC03EUp/sPu7SvxIU8O8v2L2O1L/zeEKcm0yatPsAQSjTMS788zMklRHmx/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <64bf0848-f7be-40b2-a2f2-6999cdc9a64e@amd.com>
Date: Wed, 27 May 2026 10:42:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Change stub page freeing to fix smt=0
From: Jason Andryuk <jason.andryuk@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260526203114.40882-1-jason.andryuk@amd.com>
 <7a0f7653-a299-4ead-af6c-944b8ffbb73d@citrix.com>
 <b3e58f3a-ec2a-4a91-a947-9900c00715ee@amd.com>
Content-Language: en-US
In-Reply-To: <b3e58f3a-ec2a-4a91-a947-9900c00715ee@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DM4PR12MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: bd44cbdd-040f-4400-7f77-08debbfe26bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|6133799003|11063799006|4143699003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ohoUdRRlRKE8Bb+r9MJESGcysXbQTTFXd97hh1Wij/XE8LUYcQB9Wzf9/yp1tXYLNhMvSgY5UV/HyViPp3Eo7bp7QBbzL5+UA/jTYtNZIX0h4m4LWHLvDFb9DhjBlAYzKZrglx1BCoPPMpBE1Mm1NU+P1ZeLNwfE5M5XwvXNLBWkqG5KgOSQypiFL36iBVcbHfXIsfiON6jlBBxdHk4VTZMHyfWPbc1PquOf/+kpzaB2PkWAbmlupzxTbllee4RC764FMJtGmYyLF+5kxP0iLy72/2BUCFgXGUC6m9UcLH4drbYADusEN1ycUeQKWVMftdLtTbG8ZBS4T7Thhutrt1wc7QvKrAsKj5Yp2zZpEmtIHHJPHvnSByMFcJJIXZuodmphrQRPJOS9KRvtLqAfetJ+BCzfL4G6FAK5CATT9de5nKgDx8thN9oFKMLexN+yWeh8Zp6PPsdXPIDVmt0N9SRvEcOSINx47kHCLltczfMpaxaP14TMTvR7jx/BmfDmwodmo1mAuYjbnsSOoboQ5tzO4janPiYWC3E5tD/OKGd+gWLDqsRQRg3hx5vUmYECgFqW3LhyfQywIqZwmIqstUn4pH1GLmNJYa6fRs/AXSvcHI8/iYkv05sO6CmCXESxEUmoI+foZXzS5MM9NckI4qDvV5smNNpVttIhycjN0z6YzHROGhTg9oXCP1A/K9NoP+QkGa01/sBV34BlU7AXY6BT5wy3dmsNIeVpYFR5+fM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(6133799003)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qyEJ6cdxffft7qCnGqGFxcTpLwIXdDK/z61aAyNXRZQDUzlGTuGTtldLteRU17pp5twvOwwudp0mECxjeRU97ZbHRwLmBGHxTtdxqjp/1CE/m130DqJ0DPkw1oMOVgNjBVw52F+vd5DCEVVAVfqh079n0RqBkDnerpC+nzBCDl4wXNFbhOkP2H4DR3WAP49DxcSSfTDh23TJELAle8DFx/38M1+M8v42B1sQVlPFz4JYjZoHy7ulQCj2OKTuNAv0OH6oXRqmDKHTnWMck8UjDKxEk24EG07oXXZNbdOLRtS768ugDoWgvPWWNldJCMh5AhkVsC464UmK/fEeaZvBsfBiKw6JZyP3gOAPMOT9xOZcM76jKMUTg7zrg5vGira8kvC8TwZvtCwXsj3rilkV8WnkPzaNwbgxwUXQIUoOQvnNYLec6ZZhaNm+5iWAY6O4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:42:17.8803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd44cbdd-040f-4400-7f77-08debbfe26bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721
X-purgate-ID: tlsNG-d25034/1779892951-D956FCF5-E645E397/0/0
X-purgate-type: clean
X-purgate-size: 2239
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: BD3A05E618C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-27 10:14, Jason Andryuk wrote:
> On 2026-05-26 18:03, Andrew Cooper wrote:
>> On 26/05/2026 9:31 pm, Jason Andryuk wrote:
>>> A single stubs page is initialized with 0xcc and re-used, with multiple
>>> CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
>>> each stubs area is checked against 0xcc.  When all are set to 0xcc, the
>>> page is freed.
>>>
>>> Booting a system with smt=0, CPU0 is initially setup, allocating the
>>> stubs page and initializing to 0xcc.  When more CPUs are brought up,
>>> CPU1 is initialized and then immediately brough offline as it is the
>>> sibling of CPU0.  Since the page was initially memset with 0xcc,
>>> cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
>>> However, the page is still assigned to CPU0 and continues to be assigned
>>> to other CPUs.
>>
>> It's more complicated than this.
>>
>> With CONFIG_PV (and !opt_fred in 4.22 which is perhaps newer than you're
>> testing), the LSTAR and CSTAR stubs guarantee that the 0xcc's are
>> overwritten with real instructions.
>>
>> In !CONFIG_PV, the 0xcc's only get overwritten by the exception recovery
>> selftests (CPU0 only, and gated on CONFIG_SELF_TESTS), and "complicated"
>> instructions in the emulator (which in your safety environment, you
>> likely have compiled out).
>>
>> So, in your environment, I think you probably can exclude the stubs
>> entirely and trim even more LoC.
> 
> Thanks.  Ok, my build was !CONFIG_PV, so 0xcc's were not overwritten. 
> The fault happened before the self tests ran.

Correction: It was after the self tests ran and during dom0 construction.

(XEN) Pagetable walk from ffff830842652008:
(XEN)  L4[0x106] = 8000000079c72063 ffffffffffffffff
(XEN)  L3[0x021] = 0000000079ff3063 ffffffffffffffff
(XEN)  L2[0x013] = 000000085680f063 ffffffffffffffff
(XEN)  L1[0x052] = cccccccccccccccc ffffffffffffffff

It looks like the page is reallocated after free-ing, so after CPU1 is 
down.  The re-use would write the page with PTEs.  However, when later 
CPUs are brought down, their portion of the stubs page is overwritten 
with 0xcc.  I think that is how the page, as a page table, is corrupted.

Regards,
Jason

