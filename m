Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA30B1A845
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 18:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069732.1433488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiyVs-0002gV-S1; Mon, 04 Aug 2025 16:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069732.1433488; Mon, 04 Aug 2025 16:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiyVs-0002f1-PI; Mon, 04 Aug 2025 16:58:16 +0000
Received: by outflank-mailman (input) for mailman id 1069732;
 Mon, 04 Aug 2025 16:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C33k=2Q=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uiyVq-0002ev-Py
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 16:58:14 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2417::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 323c5767-7154-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 18:58:09 +0200 (CEST)
Received: from DS7PR03CA0180.namprd03.prod.outlook.com (2603:10b6:5:3b2::35)
 by CY5PR12MB9054.namprd12.prod.outlook.com (2603:10b6:930:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Mon, 4 Aug
 2025 16:58:06 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::db) by DS7PR03CA0180.outlook.office365.com
 (2603:10b6:5:3b2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Mon,
 4 Aug 2025 16:58:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Mon, 4 Aug 2025 16:58:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 11:58:05 -0500
Received: from [172.17.155.73] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Aug 2025 11:58:03 -0500
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
X-Inumbo-ID: 323c5767-7154-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4bXGrT9+WF+39WDztp2o6qOtEhc+1seR95vCfuZbL6/LBK55HgmhVoAno5OtCrTcu2vE2AsckvP6U7PalN4ImceQ0sSCdnoztRkS+e3xQYthyERelYrXmByODVCeoVaRA07HwTCzyIBQsPJR7Ae7LeZ4Uq9KA2MH55hZtagPRmweBF69Wnoc/pQAQKM8DjXWy8DD71EZzKQelON++EUBKSuumbesHEfNyQmynu4tLWsp+2gEPStlmT2LP0GO/CTdlfRRHcHMFISWwsUQn1RiAiCTcBtziGUVECrkDwBfZ10GZ2V7QyzYQvWM25z5LCo/X0psqMxHV+VcU4Q8J9irw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqGMlBKs+3cFuk9MO5pxVLxWp7p4+e30DX/UL1qUw1Y=;
 b=hJr2FV3mRKBLdKCsdnnyo//EL9zCzitTWoJOXccnnL6T1RwvoFrk5oCu1MZHD4i1oaXDzs/b7c+O2kBWmVB4zGtjy7ZG9rd4c2uGN5KOywJoe5+donCigYyHqph0IbxgusLi9Y/a6cyD6/Kr0i4mhPR/CcP3/ki2QalHrQDlHpYXw2ItrqHMLNa7nRQll6zfTU7Ck54197EWp+wEmt5RI5m4gOZp0fZDjz4iEiWgXOPdcWSxQ5I8r7Nj5BPIZOs/tOWGH7kRQWj5/GbmClXkSJRexnq3uoEiaZ+ZnZDg7ezWe5YAzwUY9FCA+OL0JZ8TnLvUDTHTb+PTVcokiEptFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqGMlBKs+3cFuk9MO5pxVLxWp7p4+e30DX/UL1qUw1Y=;
 b=YV3FbpVS/uFH6ioQ/F+MYHdyvLRyS+TGKHn5uyK1jNzzLHRKnCn6yCI3nwyWZGv5U+BAYB4cMYOiF4ytLLT7YGU2j/bsiZXbKdEItL2RBn6jDCwsf4erR8PkvOsc7aSdT3YESqt4Av3/SQi+MPXAW2p+YOH176IwxBZ+DRfZHXM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
Date: Mon, 4 Aug 2025 12:57:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, <xen-devel@lists.xenproject.org>
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|CY5PR12MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cf2b97f-30dc-4400-dfa8-08ddd378150e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVpCNEk0ZTMyRWpGUHVmdDFsMFBHMFd5UDJRSXhTend3aEJCeDhia25ucVJt?=
 =?utf-8?B?T3FJSGEydkFCa1c3WGdsaDlubDdnN0tKbjdjSHorUGpDZk1JVFJmTTdxZEVq?=
 =?utf-8?B?QXk4NEE5V3dmODZTdWFBWmkwQ1VyajB1ck9QQkZrOHJvVE80SWRaVm94eS9X?=
 =?utf-8?B?bG11YWFnbUdHK2tvYTcranZsNE9XcW9LRWowdGQzUDk3RHljbW5JS2pvZzZv?=
 =?utf-8?B?NWlnSy9nYzdlZTNMSlpHcGhNMUFQd2dnQ21ONG1sb1RlZi9sRyswc2M0N3Fk?=
 =?utf-8?B?aXhBMHhRWDdjYklBbXhGdWFydnBoWXR2SFphMFBZQVcvYVQvMUErSlI0QnZ5?=
 =?utf-8?B?RTgwZ2Q3Z2RJVnFUeE9tVHh2TnpzdlBWdFQ2dDZoMktBNFNadEVMTk5Rc1gr?=
 =?utf-8?B?SVBTcGVYYm9vbm5JSXc1K3RJaVpKQVd5Z1JJa2xCOTYvME0zdWhlUjZIL2pH?=
 =?utf-8?B?dm9xWHhnMVpLU1VudnFRUm5LRnd3dDhsOGNDSGhjVTN4L1FJQnRWWG9vSjcr?=
 =?utf-8?B?c3NsVGlBeEE3SXdzb25HeG9VN0MrTGpCdXRIaER2WGVVZjU1WVNVT0JEandC?=
 =?utf-8?B?SW5TeFhaM2kzT3RnK0NldmdKRnJIRnFNZCthSHFCaVBHTy9nS3RtZ2FFVXI1?=
 =?utf-8?B?T01US1gyL1dMTC85MnZWK3gxMFRiWVU0QjFKT0NVWXV6WGRXdWRUTzNITXF3?=
 =?utf-8?B?eFM1RU83QTVSSVdKeHpOSll4UWxWd0EwNEJ2ZFBSV2ROUk9ad2hNcEFEd2Vl?=
 =?utf-8?B?M0wwclF6QlpWSU1QS0VvclNPNklpTXdDRGprZnFQbndEUTVGZG95MGlJRmN4?=
 =?utf-8?B?aUNSanZMdXdjOHBjdVRnNXNIYlBDVlNVdHcwZmkxYmlWT1ZpdGxRL2RlcHZS?=
 =?utf-8?B?dEl0M3F3STZQamdQcFlUWGtKTmU5WlRJdzFKR0ZDa2J5Zk81dmQwNThyZ3RZ?=
 =?utf-8?B?UCtOTTdvWVNwNEc3NGlzeFJ6NGhBSlV5VkVma1hRN0Z1Z3BPVUp3WXhvZ3BR?=
 =?utf-8?B?YzJhVnljd2NkM2dmbHpLVEpveHBYNEZtZFhGTmY4L1NMYm5PL1NVZUR1Y0x6?=
 =?utf-8?B?c05oQVlNWThnMTFHTzR2VjFMaEttZy9iN2lyeTVnMmM1enhaSElJRW55K0Jo?=
 =?utf-8?B?Tk9mMzYxQlpnTXIwWjBoQVlYdGdtUk1wT0FWRk5vYlgzSC80Y0lDalFzTUdm?=
 =?utf-8?B?OUl6ZTJqTVdFbEtoalZkUzRBbmlxSGZRWjZHdFlsK2VwSFcwbUdhT0dXMk5q?=
 =?utf-8?B?ZVVSaFprMSsyVWZFbjN6cTlkYjUzK2w0K0VQZW5SQ1g0ZVFzMTh6QTVUUkVP?=
 =?utf-8?B?VEEwdmErWGlMdEt3djYwTmZ5Zkt3R0ducjg3Rlk5K1NqV0xYWW85MGpSTDJS?=
 =?utf-8?B?NVl4RCtWalUzUWdFbnFnbnhMUGsrZE1zcTUvN3JCSEs2U1laYUdKZzZHTGtZ?=
 =?utf-8?B?RHhuL25nYSs0Y1dkMUk1UVM3amNnSXR2SVVJcm5LT3JJbVR3OC9FQjVHVHV2?=
 =?utf-8?B?ZVZSejg5RktpYm9jbjJocGRyK0lyM01hVWIxdGd0ekFkSWx3TEgvQSs1VzF5?=
 =?utf-8?B?aEdya29aVlArQTVnbGNMaDcwZHBOeUYzaU1PRXp0VTUvK3Ric1p4UFJ0VFRX?=
 =?utf-8?B?Vk56WVBDY1hla2ZvVlpBMWhQdURuaTZMQitNWUdIUUdubm5UMnprWkpxVVhH?=
 =?utf-8?B?SDRXbkVPNUJZZmhBRWJJY0tZaW15VFBuQzRwOEd0UWlibGE2OU42cTdRK0l1?=
 =?utf-8?B?VE1tUHFsWnBEeFdadUpqWlo5OFo0R3RmMHorbSt2L2thR1RIUy9ubTBKMzdo?=
 =?utf-8?B?cGJNRnBTYXJENWhHYzNsRERXQjdibGtNUnZMOTF3TnZ2eDcvVzZTZlBwV2VV?=
 =?utf-8?B?YXdlamNQWXY4N1V0d1BrZ21CcmVUb1JjQXNqS2g4TVk4V1VoVmtLUG91aHZT?=
 =?utf-8?B?NlE5ZGNxRU9CQXRmQ2V0c1RxYWlPSEZWZ0JPVW1rV0VCNmtTNDRvSWRiTkRE?=
 =?utf-8?B?NlhUSHdKY3V6SmNlRTJBKzJMcU5WaEtOU1V5V3JuSHJzVTlWQzh3TE1kbFRQ?=
 =?utf-8?Q?Z2pb6E?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 16:58:05.8490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf2b97f-30dc-4400-dfa8-08ddd378150e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9054

On 8/4/25 03:57, Jan Beulich wrote:
> On 01.08.2025 22:24, Stewart Hildebrand wrote:
>> @@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
>>  {
>>      struct sched_unit *unit = v->sched_unit;
>>  
>> +    if ( !unit )
>> +        return;
>> +
>>      kill_timer(&v->periodic_timer);
>>      kill_timer(&v->singleshot_timer);
>>      kill_timer(&v->poll_timer);
> 
> What if it's the 2nd error path in sched_init_vcpu() that is taken? Then we
> might take this path (just out of context here)
> 
>     if ( unit->vcpu_list == v )
>     {
>         rcu_read_lock(&sched_res_rculock);
> 
>         sched_remove_unit(vcpu_scheduler(v), unit);
>         sched_free_udata(vcpu_scheduler(v), unit->priv);
> 
> and at least Credit1's hook doesn't look to be safe against being passed NULL.
> (Not to speak of the risk of unit->priv being used elsewhere while cleaning
> up.)
> 
> Jan


Are you referring to this error path in sched_init_vcpu?

    unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
    if ( unit->priv == NULL )
    {
        sched_free_unit(unit, v);
        rcu_read_unlock(&sched_res_rculock);
        return 1;
    }

If so, my understanding is that sched_free_unit sets
v->sched_unit = NULL, so sched_destroy_vcpu (with this patch applied)
would return before reaching that just-out-of-context condition.

Albeit I have not yet tested this with any sort of non-default
scheduling granularity, so I could have missed something...

